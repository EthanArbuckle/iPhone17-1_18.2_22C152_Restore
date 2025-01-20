@interface MBDToSuperParserContext
+ (id)fileTransferInfoWithName:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6 emojiImageInfo:(id)a7;
- (BOOL)_lastCharacterInCurrentBodyIsAttachment;
- (BOOL)appendLivePhotoAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6;
- (BOOL)supportsMessagePartNumbersInAttributes;
- (NSAttributedString)body;
- (NSString)backgroundColor;
- (NSString)foregroundColor;
- (id)attachmentCharacterString;
- (id)name;
- (id)resultsForLogging;
- (int64_t)baseWritingDirection;
- (unint64_t)_currentMessagePart;
- (unint64_t)_inferredMessagePartForNewFile;
- (unint64_t)_inferredMessagePartForNewText;
- (unint64_t)_messagePartForLastCharacterInCurrentBody;
- (unint64_t)_nextAvailableMessagePart;
- (void)_clearIvars;
- (void)_initIvars;
- (void)_popValueFromStack:(id)a3 attributeName:(id)a4;
- (void)_pushValue:(id)a3 ontoStack:(id)a4 attributeName:(id)a5;
- (void)_updateCurrentAttributesWithMessagePartNumber;
- (void)appendBreadcrumbText:(id)a3 withOptions:(unsigned int)a4;
- (void)appendFileTransferAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6 emojiImageInfo:(id)a7;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)popIsRichLink;
- (void)popLink;
- (void)popMentionAttribute;
- (void)popMessagePartNumber;
- (void)popTextBoldAttribute;
- (void)popTextEffectAttribute;
- (void)popTextItalicAttribute;
- (void)popTextStrikethroughAttribute;
- (void)popTextUnderlineAttribute;
- (void)pushIsRichLink:(id)a3;
- (void)pushLink:(id)a3;
- (void)pushMentionAttributeWithURI:(id)a3;
- (void)pushMessagePartNumber:(unint64_t)a3;
- (void)pushTextBoldAttribute;
- (void)pushTextEffectAttributeWithType:(unint64_t)a3;
- (void)pushTextItalicAttribute;
- (void)pushTextStrikethroughAttribute;
- (void)pushTextUnderlineAttribute;
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
  objc_super v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  messagePartNumberStack = self->_messagePartNumberStack;
  self->_messagePartNumberStack = v3;

  v5 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
  allUsedMessagePartNumbers = self->_allUsedMessagePartNumbers;
  self->_allUsedMessagePartNumbers = v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  linkStack = self->_linkStack;
  self->_linkStack = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  currentAttributes = self->_currentAttributes;
  self->_currentAttributes = v9;

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = 0;

  foregroundColor = self->_foregroundColor;
  self->_foregroundColor = 0;

  v13 = (NSMutableAttributedString *)objc_alloc_init((Class)NSMutableAttributedString);
  body = self->_body;
  self->_body = v13;

  self->_baseWritingDirection = -1;
}

- (void)_clearIvars
{
  currentAttributes = self->_currentAttributes;
  self->_currentAttributes = 0;

  messagePartNumberStack = self->_messagePartNumberStack;
  self->_messagePartNumberStack = 0;

  allUsedMessagePartNumbers = self->_allUsedMessagePartNumbers;
  self->_allUsedMessagePartNumbers = 0;

  linkStack = self->_linkStack;
  self->_linkStack = 0;

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

- (void)pushLink:(id)a3
{
}

- (void)popLink
{
}

- (void)pushIsRichLink:(id)a3
{
}

- (void)popIsRichLink
{
}

- (void)_updateCurrentAttributesWithMessagePartNumber
{
  uint64_t v3 = [(NSMutableArray *)self->_messagePartNumberStack lastObject];
  currentAttributes = self->_currentAttributes;
  id v5 = (id)v3;
  if (v3) {
    [(NSMutableDictionary *)currentAttributes setObject:v3 forKey:MBDIMMessagePartAttributeName];
  }
  else {
    [(NSMutableDictionary *)currentAttributes removeObjectForKey:MBDIMMessagePartAttributeName];
  }
}

- (void)pushMessagePartNumber:(unint64_t)a3
{
  if (-[NSMutableIndexSet containsIndex:](self->_allUsedMessagePartNumbers, "containsIndex:")
    && [(MBDToSuperParserContext *)self _messagePartForLastCharacterInCurrentBody] != a3)
  {
    id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Message parser found non-contigous message part numbers" userInfo:0];
    objc_exception_throw(v7);
  }
  messagePartNumberStack = self->_messagePartNumberStack;
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)messagePartNumberStack addObject:v6];

  [(NSMutableIndexSet *)self->_allUsedMessagePartNumbers addIndex:a3];

  [(MBDToSuperParserContext *)self _updateCurrentAttributesWithMessagePartNumber];
}

- (void)popMessagePartNumber
{
  [(NSMutableArray *)self->_messagePartNumberStack removeLastObject];

  [(MBDToSuperParserContext *)self _updateCurrentAttributesWithMessagePartNumber];
}

- (BOOL)_lastCharacterInCurrentBodyIsAttachment
{
  uint64_t v3 = [(MBDToSuperParserContext *)self attachmentCharacterString];
  v4 = [(NSMutableAttributedString *)self->_body string];
  if ([v4 hasSuffix:v3])
  {
    id v5 = (char *)[(NSMutableAttributedString *)self->_body length];
    id v6 = [(NSMutableAttributedString *)self->_body attribute:MBDIMFileTransferAttributeName atIndex:v5 - 1 effectiveRange:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 _stringForKey:MBDIMFileTransferEmojiImageContentIdentifierKey];
      BOOL v8 = [v7 length] == 0;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)_messagePartForLastCharacterInCurrentBody
{
  if (![(NSMutableAttributedString *)self->_body length]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v3 = (char *)[(NSMutableAttributedString *)self->_body length];
  v4 = [(NSMutableAttributedString *)self->_body attribute:MBDIMMessagePartAttributeName atIndex:v3 - 1 effectiveRange:0];
  id v5 = v4;
  if (v4) {
    unint64_t v6 = (unint64_t)[v4 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (unint64_t)_nextAvailableMessagePart
{
  unint64_t result = (unint64_t)[(NSMutableIndexSet *)self->_allUsedMessagePartNumbers count];
  if (result) {
    return (unint64_t)[(NSMutableIndexSet *)self->_allUsedMessagePartNumbers lastIndex] + 1;
  }
  return result;
}

- (unint64_t)_currentMessagePart
{
  v2 = [(NSMutableArray *)self->_messagePartNumberStack lastObject];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (unint64_t)_inferredMessagePartForNewText
{
  if ([(MBDToSuperParserContext *)self _lastCharacterInCurrentBodyIsAttachment]|| (unint64_t result = [(MBDToSuperParserContext *)self _messagePartForLastCharacterInCurrentBody], result == 0x7FFFFFFFFFFFFFFFLL))
  {
    return [(MBDToSuperParserContext *)self _nextAvailableMessagePart];
  }
  return result;
}

- (unint64_t)_inferredMessagePartForNewFile
{
  return [(MBDToSuperParserContext *)self _nextAvailableMessagePart];
}

- (void)pushMentionAttributeWithURI:(id)a3
{
}

- (void)popMentionAttribute
{
}

- (void)pushTextEffectAttributeWithType:(unint64_t)a3
{
  currentAttributes = self->_currentAttributes;
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)currentAttributes setObject:v4 forKey:MBDIMTextEffectAttributeName];
}

- (void)popTextEffectAttribute
{
}

- (void)pushTextBoldAttribute
{
}

- (void)popTextBoldAttribute
{
}

- (void)pushTextItalicAttribute
{
}

- (void)popTextItalicAttribute
{
}

- (void)pushTextUnderlineAttribute
{
}

- (void)popTextUnderlineAttribute
{
}

- (void)pushTextStrikethroughAttribute
{
}

- (void)popTextStrikethroughAttribute
{
}

- (void)appendString:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = [(NSMutableArray *)self->_messagePartNumberStack count];
    if (!v4) {
      [(MBDToSuperParserContext *)self pushMessagePartNumber:[(MBDToSuperParserContext *)self _inferredMessagePartForNewText]];
    }
    id v5 = [objc_alloc((Class)NSAttributedString) initWithString:v6 attributes:self->_currentAttributes];
    [(NSMutableAttributedString *)self->_body appendAttributedString:v5];
    if (!v4) {
      [(MBDToSuperParserContext *)self popMessagePartNumber];
    }
  }
}

+ (id)fileTransferInfoWithName:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6 emojiImageInfo:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = (__CFString *)a3;
  id v16 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
  v17 = v16;
  if (v15) {
    CFStringRef v18 = v15;
  }
  else {
    CFStringRef v18 = &stru_1000E5260;
  }
  [v16 setObject:v18 forKey:MBDIMFileTransferNameKey];

  if ([v11 count])
  {
    id v19 = [v11 copy];
    [v17 setObject:v19 forKey:MBDIMFileTransferAttachmentsKey];
  }
  if ([v12 count])
  {
    id v20 = [v12 copy];
    [v17 setObject:v20 forKey:MBDIMFileTransferImageInfoKey];
  }
  if ([v13 count])
  {
    id v21 = [v13 copy];
    [v17 setObject:v21 forKey:MBDIMFileTransferStickerInfoKey];
  }
  if ([v14 count]) {
    [v17 addEntriesFromDictionary:v14];
  }
  if ([v17 count]) {
    id v22 = [v17 copy];
  }
  else {
    id v22 = 0;
  }

  return v22;
}

- (id)attachmentCharacterString
{
  __int16 v4 = -4;
  id v2 = [objc_alloc((Class)NSString) initWithCharacters:&v4 length:1];

  return v2;
}

- (void)appendFileTransferAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6 emojiImageInfo:(id)a7
{
  uint64_t v12 = MBDIMFileTransferEmojiImageContentIdentifierKey;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  CFStringRef v18 = [v13 _stringForKey:v12];
  id v19 = [v18 length];

  id v20 = [(NSMutableArray *)self->_messagePartNumberStack count];
  if (!v20)
  {
    if (v19) {
      unint64_t v21 = [(MBDToSuperParserContext *)self _inferredMessagePartForNewText];
    }
    else {
      unint64_t v21 = [(MBDToSuperParserContext *)self _inferredMessagePartForNewFile];
    }
    [(MBDToSuperParserContext *)self pushMessagePartNumber:v21];
  }
  id v22 = [(id)objc_opt_class() fileTransferInfoWithName:v17 attachments:v16 imageInfo:v15 stickerInfo:v14 emojiImageInfo:v13];

  v23 = [(MBDToSuperParserContext *)self attachmentCharacterString];
  unint64_t v24 = [(MBDToSuperParserContext *)self _currentMessagePart];
  v29[0] = MBDIMFileTransferAttributeName;
  id v25 = [v22 copy];
  v30[0] = v25;
  v29[1] = MBDIMMessagePartAttributeName;
  v26 = +[NSNumber numberWithUnsignedInteger:v24];
  v30[1] = v26;
  v27 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

  id v28 = [objc_alloc((Class)NSAttributedString) initWithString:v23 attributes:v27];
  [(NSMutableAttributedString *)self->_body appendAttributedString:v28];
  if (!v20) {
    [(MBDToSuperParserContext *)self popMessagePartNumber];
  }
}

- (BOOL)appendLivePhotoAttribute:(id)a3 attachments:(id)a4 imageInfo:(id)a5 stickerInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MBDToSuperParserContext *)self attachmentCharacterString];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3010000000;
  id v28 = &unk_1000C7A62;
  long long v29 = xmmword_1000BF080;
  id v15 = [(NSMutableAttributedString *)self->_body string];
  id v16 = [v15 length];

  id v17 = [(NSMutableAttributedString *)self->_body string];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100009FE4;
  v22[3] = &unk_1000E0488;
  id v18 = v14;
  id v23 = v18;
  unint64_t v24 = &v25;
  objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v16, 258, v22);

  uint64_t v19 = v26[4];
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v20 = [(id)objc_opt_class() fileTransferInfoWithName:v10 attachments:v11 imageInfo:v12 stickerInfo:v13 emojiImageInfo:0];
    -[NSMutableAttributedString addAttribute:value:range:](self->_body, "addAttribute:value:range:", MBDIMLivePhotoAttributeName, v20, v26[4], v26[5]);
  }
  _Block_object_dispose(&v25, 8);

  return v19 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)appendBreadcrumbText:(id)a3 withOptions:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11[0] = MBDIMBreadcrumbTextMarkerAttributeName;
  v11[1] = MBDIMBreadcrumbTextOptionFlags;
  v12[0] = a3;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInt:v4];
  v12[1] = v7;
  BOOL v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  id v9 = objc_alloc((Class)NSAttributedString);
  id v10 = [v9 initWithString:MBDIMBreadcrumbCharacterString attributes:v8];
  [(NSMutableAttributedString *)self->_body appendAttributedString:v10];
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

- (BOOL)supportsMessagePartNumbersInAttributes
{
  return 0;
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
  objc_storeStrong((id *)&self->_linkStack, 0);
  objc_storeStrong((id *)&self->_allUsedMessagePartNumbers, 0);

  objc_storeStrong((id *)&self->_messagePartNumberStack, 0);
}

@end