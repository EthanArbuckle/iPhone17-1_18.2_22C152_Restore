@interface MBDToSuperParserContext
+ (id)fileTransferInfoWithName:(id)a3 partNumber:(unint64_t)a4 attachments:(id)a5 imageInfo:(id)a6;
- (NSAttributedString)body;
- (NSString)backgroundColor;
- (NSString)foregroundColor;
- (id)name;
- (id)resultsForLogging;
- (int64_t)baseWritingDirection;
- (void)_clearIvars;
- (void)_incrementMessagePartNumber;
- (void)_initIvars;
- (void)_popValueFromStack:(id)a3 attributeName:(id)a4;
- (void)_pushValue:(id)a3 ontoStack:(id)a4 attributeName:(id)a5;
- (void)appendFailedGenmojiAttributes;
- (void)appendFileTransferAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setBackgroundColor:(id)a3;
- (void)setBaseWritingDirection:(int64_t)a3;
- (void)setForegroundColor:(id)a3;
@end

@implementation MBDToSuperParserContext

- (void)dealloc
{
  [(MBDToSuperParserContext *)self _clearIvars];
  v3.receiver = self;
  v3.super_class = (Class)MBDToSuperParserContext;
  [(MBDToSuperParserContext *)&v3 dealloc];
}

- (void)reset
{
  [(MBDToSuperParserContext *)self _clearIvars];
  [(MBDToSuperParserContext *)self _initIvars];
  v3.receiver = self;
  v3.super_class = (Class)MBDToSuperParserContext;
  [(MBDXMLParserContext *)&v3 reset];
}

- (id)name
{
  return @"MBDToSuperParser";
}

- (id)resultsForLogging
{
  return +[NSArray arrayWithObjects:@"backgroundColor", @"foregroundColor", @"body", @"fileTransferAttributes", 0];
}

- (void)_initIvars
{
  self->_messagePartNumber = 0;
  self->_lastPartInsertedWasImage = 0;
  objc_super v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  currentAttributes = self->_currentAttributes;
  self->_currentAttributes = v3;

  v5 = self->_currentAttributes;
  v6 = +[NSNumber numberWithUnsignedInteger:self->_messagePartNumber];
  [(NSMutableDictionary *)v5 setObject:v6 forKey:MBDIMMessagePartAttributeName];

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = 0;

  foregroundColor = self->_foregroundColor;
  self->_foregroundColor = 0;

  v9 = (NSMutableAttributedString *)objc_alloc_init((Class)NSMutableAttributedString);
  body = self->_body;
  self->_body = v9;

  self->_baseWritingDirection = -1;
}

- (void)_clearIvars
{
  currentAttributes = self->_currentAttributes;
  self->_currentAttributes = 0;

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = 0;

  foregroundColor = self->_foregroundColor;
  self->_foregroundColor = 0;

  body = self->_body;
  self->_body = 0;
}

- (void)_pushValue:(id)a3 ontoStack:(id)a4 attributeName:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a3;
    [a4 addObject:v9];
    [(NSMutableDictionary *)self->_currentAttributes setObject:v9 forKey:v8];
  }
}

- (void)_popValueFromStack:(id)a3 attributeName:(id)a4
{
  id v6 = a4;
  [a3 removeLastObject];
  [(NSMutableDictionary *)self->_currentAttributes removeObjectForKey:v6];
}

- (void)_incrementMessagePartNumber
{
  ++self->_messagePartNumber;
  currentAttributes = self->_currentAttributes;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)currentAttributes setObject:v3 forKey:MBDIMMessagePartAttributeName];
}

- (void)appendString:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = [objc_alloc((Class)NSAttributedString) initWithString:v5 attributes:self->_currentAttributes];
    [(NSMutableAttributedString *)self->_body appendAttributedString:v4];
    self->_lastPartInsertedWasImage = 0;
  }
}

+ (id)fileTransferInfoWithName:(id)a3 partNumber:(unint64_t)a4 attachments:(id)a5 imageInfo:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v10 = (__CFString *)a3;
  id v11 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
  v12 = v11;
  if (v10) {
    CFStringRef v13 = v10;
  }
  else {
    CFStringRef v13 = &stru_10003EA60;
  }
  [v11 setObject:v13 forKey:MBDIMFileTransferNameKey];

  if ([v8 count])
  {
    id v14 = [v8 copy];
    [v12 setObject:v14 forKey:MBDIMFileTransferAttachmentsKey];
  }
  if ([v9 count])
  {
    id v15 = [v9 copy];
    [v12 setObject:v15 forKey:MBDIMFileTransferImageInfoKey];
  }
  if ([v12 count]) {
    id v16 = [v12 copy];
  }
  else {
    id v16 = 0;
  }

  return v16;
}

- (void)appendFileTransferAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_lastPartInsertedWasImage)
  {
    if ([(NSMutableAttributedString *)self->_body length])
    {
      if ([(NSMutableAttributedString *)self->_body length] != (id)1
        || ([(NSMutableAttributedString *)self->_body string],
            id v11 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v12 = [v11 isEqualToString:MBDIMBreadcrumbCharacterString],
            v11,
            (v12 & 1) == 0))
      {
        [(MBDToSuperParserContext *)self _incrementMessagePartNumber];
      }
    }
  }
  CFStringRef v13 = [(id)objc_opt_class() fileTransferInfoWithName:v8 partNumber:self->_messagePartNumber attachments:v9 imageInfo:v10];
  __int16 v19 = -4;
  id v14 = [objc_alloc((Class)NSString) initWithCharacters:&v19 length:1];
  v20[0] = MBDIMFileTransferAttributeName;
  id v15 = [v13 copy];
  v21[0] = v15;
  v20[1] = MBDIMMessagePartAttributeName;
  id v16 = +[NSNumber numberWithUnsignedInteger:self->_messagePartNumber];
  v21[1] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  id v18 = [objc_alloc((Class)NSAttributedString) initWithString:v14 attributes:v17];
  [(NSMutableAttributedString *)self->_body appendAttributedString:v18];
  [(MBDToSuperParserContext *)self _incrementMessagePartNumber];
  self->_lastPartInsertedWasImage = 1;
}

- (void)appendFailedGenmojiAttributes
{
  uint64_t v7 = MBDIMMessagePartAttributeName;
  id v3 = +[NSNumber numberWithUnsignedInteger:self->_messagePartNumber];
  id v8 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  id v5 = objc_alloc((Class)NSAttributedString);
  id v6 = [v5 initWithString:MBDIMGenmojiFailureString attributes:v4];
  [(NSMutableAttributedString *)self->_body appendAttributedString:v6];
}

- (NSAttributedString)body
{
  id v3 = [(NSMutableAttributedString *)self->_body length];
  if (!self->_didAddBodyAttributes && v3 != 0)
  {
    id v5 = v3;
    id v6 = [objc_alloc((Class)NSNumber) initWithInteger:self->_baseWritingDirection];
    -[NSMutableAttributedString addAttribute:value:range:](self->_body, "addAttribute:value:range:", MBDIMBaseWritingDirectionAttributeName, v6, 0, v5);
    self->_didAddBodyAttributes = 1;
  }
  body = self->_body;

  return (NSAttributedString *)body;
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (int64_t)baseWritingDirection
{
  return self->_baseWritingDirection;
}

- (void)setBaseWritingDirection:(int64_t)a3
{
  self->_baseWritingDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_currentAttributes, 0);
}

@end