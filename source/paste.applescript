set desktop_path to POSIX path of (path to desktop)
set timestamp to do shell script "date +%Y-%m-%d-%H-%M-%S"
set file_name to "image-" & timestamp & ".png"
set file_path to desktop_path & file_name

try
    set png_data to the clipboard as «class PNGf»
on error
    return "{\"items\":[{\"uid\":\"clipboard-to-file\",\"title\":\"Error: invalid image format in clipboard.\",\"icon\":{\"path\":\"failed.jpg\"},\"valid\":false}]}"
end try

set the_file to open for access file_path with write permission
write png_data to the_file
close access the_file

set output to "{\"items\":[{\"uid\":\"clipboard-to-file\",\"title\":\"File saved.\",\"subtitle\":\"Path: " & file_path & "\",\"icon\":{\"path\":\"success.jpg\"},\"arg\":\"" & file_path & "\",\"valid\":true}]}"
return output