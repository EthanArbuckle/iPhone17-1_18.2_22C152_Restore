@interface TCXmlTextWriterProvider
- (BOOL)setUp;
- (BOOL)setUpWithTextWriter:(_xmlTextWriter *)a3;
- (BOOL)tearDown;
- (_xmlTextWriter)textWriter;
- (void)dealloc;
@end

@implementation TCXmlTextWriterProvider

- (void)dealloc
{
  [(TCXmlTextWriterProvider *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)TCXmlTextWriterProvider;
  [(TCXmlTextWriterProvider *)&v3 dealloc];
}

- (BOOL)setUp
{
  v2 = [NSString stringWithUTF8String:"-[TCXmlTextWriterProvider setUp]"];
  objc_super v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Common/Utilities/TCXmlStreamWriter.mm"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 33, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v6 = (void *)MEMORY[0x263EFF940];
  v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"Abstract method not overridden by %@: %s", v9, "-[TCXmlTextWriterProvider setUp]"];
  id v11 = [v6 exceptionWithName:*MEMORY[0x263EFF498] reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (BOOL)setUpWithTextWriter:(_xmlTextWriter *)a3
{
  self->_textWriter = a3;
  return a3 != 0;
}

- (BOOL)tearDown
{
  textWriter = self->_textWriter;
  if (textWriter)
  {
    xmlFreeTextWriter(self->_textWriter);
    self->_textWriter = 0;
  }
  return textWriter != 0;
}

- (_xmlTextWriter)textWriter
{
  return self->_textWriter;
}

@end