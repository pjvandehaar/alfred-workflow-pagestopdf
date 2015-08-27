on alfred_script(q)
	tell application "Pages"
		set mydoc to front document

		--get docname
		set docname to the name of mydoc
		if docname ends with ".pages" then
			set docname to text 1 thru -7 of docname
		end if

		--get dirname
		set myfile to file of mydoc
		set fpath to POSIX path of myfile
		set myscript to "dirname '" & fpath & "'"
		set dirname to do shell script myscript

		set exportpath to dirname & "/" & docname & ".pdf"
		export mydoc to POSIX file exportpath as PDF

	end tell

	tell application "Finder"
		activate
		reveal myfile
	end tell
end alfred_script
