@interface MBDXMLParser
+ (id)sharedInstance;
- (BOOL)parseContext:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 foundIgnorableWhitespace:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
@end

@implementation MBDXMLParser

+ (id)sharedInstance
{
  if (qword_100043708 != -1) {
    dispatch_once(&qword_100043708, &stru_10003D5D0);
  }
  v2 = (void *)qword_100043700;

  return v2;
}

- (BOOL)parseContext:(id)a3
{
  id v5 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000BB4C;
  v19[3] = &unk_10003D5F8;
  v19[4] = self;
  v6 = objc_retainBlock(v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000BC08;
  v18[3] = &unk_10003D620;
  v18[4] = self;
  v7 = objc_retainBlock(v18);
  v8 = [v5 inContentAsData];
  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  v10 = [v5 name];
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_100043710;
  if (!qword_100043710)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    qword_100043710 = (uint64_t)Mutable;
  }
  Value = (__CFDictionary *)CFDictionaryGetValue(Mutable, v10);
  self->_framespace = Value;
  if (!Value)
  {
    v13 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    self->_framespace = v13;
    CFDictionarySetValue((CFMutableDictionaryRef)qword_100043710, v10, v13);
  }
  char v14 = ((uint64_t (*)(void *, void *))v6[2])(v6, v8);
  if ((v14 & 1) == 0)
  {
    v15 = os_log_create("com.apple.Messages.blastdoor", "IMXMLParser");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100031E60(v15);
    }
  }
  ((void (*)(void *))v7[2])(v7);
  v16 = *p_context;
  *p_context = 0;

  return v14;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v28 = a3;
  v12 = (__CFString *)a4;
  id v27 = a5;
  id v13 = a6;
  id v14 = a7;
  framespace = self->_framespace;
  v16 = self->_context;
  MutableCopy = CFStringCreateMutableCopy(0, 0, v12);
  CFStringUppercase(MutableCopy, 0);
  Value = (void *)CFDictionaryGetValue(framespace, MutableCopy);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000C268;
  v29[3] = &unk_10003D648;
  v19 = v16;
  v30 = v19;
  v20 = objc_retainBlock(v29);
  v21 = (uint64_t (**)(void, void))v20;
  if (!Value)
  {
    Value = (void *)((uint64_t (*)(void *, __CFString *))v20[2])(v20, MutableCopy);
    if (!Value)
    {
      Value = (void *)((uint64_t (**)(void, const __CFString *))v21)[2](v21, @"Default");
      if (!Value) {
        Value = objc_opt_class();
      }
    }
    CFDictionarySetValue(framespace, MutableCopy, Value);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  v22 = Value;

  v23 = (MBDXMLParserFrame *)objc_alloc_init(v22);
  if (self->_topFrame) {
    -[NSMutableArray addObject:](self->_otherFrames, "addObject:");
  }
  topFrame = self->_topFrame;
  self->_topFrame = v23;
  v25 = v23;

  [(MBDXMLParserFrame *)v25 parser:self context:self->_context didStartElement:v12 namespaceURI:v27 qualifiedName:v13 attributes:v14];
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(MBDXMLParserFrame *)self->_topFrame parser:self context:self->_context didEndElement:v10 namespaceURI:v11 qualifiedName:v12];
  id v14 = [(NSMutableArray *)self->_otherFrames lastObject];
  topFrame = self->_topFrame;
  self->_topFrame = v14;

  if (self->_topFrame) {
    [(NSMutableArray *)self->_otherFrames removeLastObject];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(MBDXMLParserFrame *)self->_topFrame parser:self context:self->_context foundCharacters:v6];
}

- (void)parser:(id)a3 foundIgnorableWhitespace:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(MBDXMLParserFrame *)self->_topFrame parser:self context:self->_context foundIgnorableWhitespace:v6];
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherFrames, 0);
  objc_storeStrong((id *)&self->_topFrame, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_parser, 0);
}

@end