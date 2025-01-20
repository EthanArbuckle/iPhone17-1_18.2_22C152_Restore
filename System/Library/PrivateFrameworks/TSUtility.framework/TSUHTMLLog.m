@interface TSUHTMLLog
- (NSString)path;
- (NSString)script;
- (NSString)stylesheet;
- (NSString)title;
- (TSUHTMLLog)initWithPath:(id)a3;
- (id)uniqueIdentifierWithPrefix:(id)a3;
- (void)_writeMarkupData:(id)a3;
- (void)clear;
- (void)close;
- (void)dealloc;
- (void)logBegin;
- (void)logEnd;
- (void)setScript:(id)a3;
- (void)setStylesheet:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeMarkup:(id)a3;
- (void)writeText:(id)a3;
@end

@implementation TSUHTMLLog

- (TSUHTMLLog)initWithPath:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TSUHTMLLog;
  v4 = [(TSUHTMLLog *)&v10 init];
  if (v4)
  {
    v5 = (void *)[MEMORY[0x263F08850] defaultManager];
    v6 = (NSString *)[a3 copy];
    v4->_path = v6;
    uint64_t v7 = [(NSString *)v6 stringByDeletingLastPathComponent];
    if ([v5 fileExistsAtPath:v4->_path]) {
      [v5 removeItemAtPath:v4->_path error:0];
    }
    if (([v5 fileExistsAtPath:v7] & 1) == 0) {
      [v5 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
    }
    objc_msgSend(v5, "createFileAtPath:contents:attributes:", v4->_path, objc_msgSend(MEMORY[0x263EFF8F8], "data"), 0);
    v8 = (NSFileHandle *)(id)[MEMORY[0x263F08840] fileHandleForWritingAtPath:v4->_path];
    v4->_handle = v8;
    if (v8) {
      NSLog((NSString *)@"Opened log at path %@", v4->_path);
    }
    else {
      NSLog((NSString *)@"Failed to open log at path %@", v4->_path);
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSUHTMLLog;
  [(TSUHTMLLog *)&v3 dealloc];
}

- (id)uniqueIdentifierWithPrefix:(id)a3
{
  objc_super v3 = NSString;
  unint64_t uniquifier = self->_uniquifier;
  self->_unint64_t uniquifier = uniquifier + 1;
  return (id)[v3 stringWithFormat:@"%@-%lu", a3, uniquifier];
}

- (void)_writeMarkupData:(id)a3
{
  if (!self->_logStarted)
  {
    self->_logStarted = 1;
    [(TSUHTMLLog *)self logBegin];
  }
  v5 = (const char *)[a3 UTF8String];
  -[NSFileHandle writeData:](self->_handle, "writeData:", [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:strlen(v5)]);
  handle = self->_handle;
  [(NSFileHandle *)handle synchronizeFile];
}

- (void)writeMarkup:(id)a3
{
  -[TSUHTMLLog _writeMarkupData:](self, "_writeMarkupData:", objc_msgSend(NSString, "tsu_stringWithFormat:arguments:", a3, &v3));
}

- (void)writeText:(id)a3
{
  -[TSUHTMLLog _writeMarkupData:](self, "_writeMarkupData:", objc_msgSend((id)objc_msgSend(NSString, "tsu_stringWithFormat:arguments:", a3, &v3), "tsu_escapeXML"));
}

- (void)close
{
}

- (void)clear
{
}

- (void)logBegin
{
  self->_logStarted = 1;
  [(TSUHTMLLog *)self clear];
  [(TSUHTMLLog *)self writeMarkup:@"<html>\n"];
  [(TSUHTMLLog *)self writeMarkup:@"<head>\n"];
  [(TSUHTMLLog *)self writeMarkup:@"<meta charset='UTF-8'/>\n"];
  if ([(TSUHTMLLog *)self title]) {
    [(TSUHTMLLog *)self writeMarkup:@"<title>%@</title>", [(TSUHTMLLog *)self title]];
  }
  if ([(TSUHTMLLog *)self script]) {
    [(TSUHTMLLog *)self writeMarkup:@"<script language='javascript'>\n%@\n</script>", [(TSUHTMLLog *)self script]];
  }
  if ([(TSUHTMLLog *)self stylesheet]) {
    [(TSUHTMLLog *)self writeMarkup:@"<style type='text/css'>\n<!--\n%@\n-->\n</style>", [(TSUHTMLLog *)self stylesheet]];
  }
  [(TSUHTMLLog *)self writeMarkup:@"</head>\n"];
  [(TSUHTMLLog *)self writeMarkup:@"<body>\n"];
}

- (void)logEnd
{
}

- (NSString)path
{
  return self->_path;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)stylesheet
{
  return self->_stylesheet;
}

- (void)setStylesheet:(id)a3
{
}

- (NSString)script
{
  return self->_script;
}

- (void)setScript:(id)a3
{
}

@end