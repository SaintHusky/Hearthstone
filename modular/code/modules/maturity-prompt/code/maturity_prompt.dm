/client/proc/OpenMaturityPrompt()
	var/dat = "<html>"
	dat += {"
	<head>
		<style>
			p {
				text-align: center;
			}
			form {
				width: 300px;
				margin: 0 auto;
				text-align: center;
			}
			input {
				background-color: #0E141B;	
				color: #D0D8DC;		
			}
			.input-row {
				display: inline-block;
				margin-right: 10px;
				vertical-align: top;
			}
			.input-row label {
				display: block;
				margin-bottom: 5px;
			}
			.input-row input {
				width: 80px;
				box-sizing: border-box;
			}
			.button-row {
				text-align: center;
				margin-top: 20px;
			}
		</style>
	</head>
	"}
	dat += "<body>"
	dat += {"
		<p>
			This is a mature community with a minimum age requirement. Please submit your date of birth.
			<br>
			We only retain the year and month, the day is discarded after the initial check.
			<br>
			False declarations will end up with you being banned.
			<br>
		</p>
		<form method='get' action='?src=[REF(src)]'>
			<input type="hidden" name="ageprompt" value="ageprompt">
			<div class="input-row">
				<label for="year">Year</label>
				<input type="number" id="year" name="year" min="1900" max="2100" required>
			</div>
			<div class="input-row">
				<label for="month">Month</label>
				<input type="number" id="month" name="month" min="1" max="12" required>
			</div>
			<div class="input-row">
				<label for="day">Day</label>
				<input type="number" id="day" name="day" min="1" max="31" required>
			</div>
			<div class="button-row">
				<button type="submit">Submit</button>
			</div>
		</form>
	"}
	dat += "</body></html>"
	var/datum/browser/popup = new(src, "ageprompt", "Enter your date of birth", 570, 260)
	popup.set_content(jointext(dat, ""))
	popup.open(FALSE) // 0 is passed to open so that it doesn't use the onclose() proc

/client/proc/CloseMaturityPrompt()
	src << browse("", "window=ageprompt")