@interface WFTreeHTMLStripper
+ (id)treeStripperWithData:(id)a3;
+ (id)treeStripperWithString:(id)a3;
- (WFTreeHTMLStripper)initWithData:(id)a3;
- (WFTreeHTMLStripper)initWithString:(id)a3;
- (void)dealloc;
@end

@implementation WFTreeHTMLStripper

+ (id)treeStripperWithData:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:a3];
  return v3;
}

+ (id)treeStripperWithString:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:a3];
  return v3;
}

- (WFTreeHTMLStripper)initWithData:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5 = (const char *)[a3 bytes];
    int v6 = [a3 length];
    unint64_t v7 = _NSHTMLEncoding((char *)[a3 bytes], objc_msgSend(a3, "length"));
    if (v7)
    {
      CFStringEncoding v8 = CFStringConvertNSStringEncodingToEncoding(v7);
      CFStringRef v9 = CFStringConvertEncodingToIANACharSetName(v8);
      if (CFStringGetCString(v9, buffer, 32, 0x600u)) {
        v10 = buffer;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    htmlDocPtr Memory = htmlReadMemory(v5, v6, 0, v10, 97);
    if (!Memory)
    {
      v12 = __WFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[WFTreeHTMLStripper initWithData:](v12);
      }
    }
  }
  else
  {
    htmlDocPtr Memory = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)WFTreeHTMLStripper;
  return [(WFTreeXMLDocumentStripper *)&v14 initWithXMLDocument:Memory];
}

- (WFTreeHTMLStripper)initWithString:(id)a3
{
  uint64_t v4 = [a3 dataUsingEncoding:4];
  return [(WFTreeHTMLStripper *)self initWithData:v4];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WFTreeHTMLStripper;
  [(WFTreeXMLDocumentStripper *)&v2 dealloc];
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  objc_super v2 = "-[WFTreeHTMLStripper initWithData:]";
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "**** %{public}s, error reading html data", (uint8_t *)&v1, 0xCu);
}

@end