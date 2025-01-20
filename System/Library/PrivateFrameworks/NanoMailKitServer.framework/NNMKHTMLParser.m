@interface NNMKHTMLParser
- (BOOL)_isElementBlocked:(id)a3 attributes:(const char *)a4;
- (BOOL)_isElementBody:(id)a3;
- (BOOL)_isElementDisplayedInBlock:(id)a3;
- (BOOL)_isElementHead:(id)a3;
- (BOOL)_isElementHyperlink:(id)a3;
- (BOOL)_isElementImage:(id)a3;
- (BOOL)_isElementLineBreak:(id)a3;
- (BOOL)_isElementList:(id)a3 ordered:(BOOL *)a4;
- (BOOL)_isElementListItem:(id)a3;
- (BOOL)_isElementQuoteElement:(id)a3 attributes:(const char *)a4;
- (BOOL)_isErrorBlocked:(_xmlError *)a3;
- (BOOL)cancelled;
- (BOOL)caresAboutHTMLContentString;
- (BOOL)containsBlockedElements;
- (BOOL)isElementBlocked:(id)a3 attributeQueryBlock:(id)a4;
- (BOOL)isElementIgnorable:(id)a3;
- (BOOL)isErrorTypeBlocked:(char *)a3;
- (BOOL)isLastCharAddedLineBreak;
- (BOOL)parsingBody;
- (BOOL)parsingHead;
- (NNMKHTMLParser)init;
- (NSMutableArray)isQuoteElementStack;
- (NSMutableArray)listStack;
- (NSMutableArray)stringAttributesStack;
- (NSMutableData)charactersBuffer;
- (NSString)bodyTagStyle;
- (NSString)currentImgTagSource;
- (NSString)htmlBodyToParse;
- (NSString)ignoringElementSubtree;
- (_xmlParserCtxt)parserContext;
- (_xmlSAXHandler)parsingSAXHandler;
- (id)_stringAttributeValueForCSSStyleName:(id)a3 inStyleAttribute:(id)a4;
- (id)_stringAttributesForStyleAttribute:(id)a3;
- (id)_topStringAttributes;
- (id)_valueForAttributeNamed:(id)a3 inAttributes:(const char *)a4;
- (unint64_t)_textAlignmentFromString:(id)a3;
- (unint64_t)_writingDirectionFromString:(id)a3;
- (unint64_t)bodyTagStartIndex;
- (unint64_t)currentHeadTagStartIndex;
- (unint64_t)currentImgTagStartIndex;
- (unint64_t)currentListLevel;
- (unint64_t)currentQuoteLevel;
- (unint64_t)encoding;
- (void)_appendCharacters:(const char *)a3 length:(int)a4;
- (void)_appendImageFromAttributes:(const char *)a3;
- (void)_appendLineBreak;
- (void)_appendString:(id)a3;
- (void)_enumerateAttributes:(const char *)a3 withBlock:(id)a4;
- (void)_flushCharactersIfNeeded;
- (void)_popStringAttributes;
- (void)_pushStringAttributes:(id)a3;
- (void)_requireNewLine;
- (void)_stringAttributeForElement:(id)a3 attributes:(const char *)a4 stringAttributeKey:(id *)a5 stringAttributeValue:(id *)a6;
- (void)_stringAttributeForHyperlink:(id)a3 attributes:(const char *)a4 stringAttributeKey:(id *)a5 stringAttributeValue:(id *)a6;
- (void)parseHTMLBody:(id)a3 encoding:(unint64_t)a4;
- (void)setBodyTagStartIndex:(unint64_t)a3;
- (void)setBodyTagStyle:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCharactersBuffer:(id)a3;
- (void)setContainsBlockedElements:(BOOL)a3;
- (void)setCurrentHeadTagStartIndex:(unint64_t)a3;
- (void)setCurrentImgTagSource:(id)a3;
- (void)setCurrentImgTagStartIndex:(unint64_t)a3;
- (void)setCurrentListLevel:(unint64_t)a3;
- (void)setCurrentQuoteLevel:(unint64_t)a3;
- (void)setEncoding:(unint64_t)a3;
- (void)setHtmlBodyToParse:(id)a3;
- (void)setIgnoringElementSubtree:(id)a3;
- (void)setIsLastCharAddedLineBreak:(BOOL)a3;
- (void)setIsQuoteElementStack:(id)a3;
- (void)setListStack:(id)a3;
- (void)setParserContext:(_xmlParserCtxt *)a3;
- (void)setParsingBody:(BOOL)a3;
- (void)setParsingHead:(BOOL)a3;
- (void)setParsingSAXHandler:(_xmlSAXHandler *)a3;
- (void)setStringAttributesStack:(id)a3;
@end

@implementation NNMKHTMLParser

- (NNMKHTMLParser)init
{
  v5.receiver = self;
  v5.super_class = (Class)NNMKHTMLParser;
  v2 = [(NNMKHTMLParser *)&v5 init];
  v3 = v2;
  if (v2)
  {
    xmlSAX2InitHtmlDefaultSAXHandler(&v2->_parsingSAXHandler);
    v3->_parsingSAXHandler.endDocument = 0;
    v3->_parsingSAXHandler.startElement = (startElementSAXFunc)_handleStartElement;
    v3->_parsingSAXHandler.endElement = (endElementSAXFunc)_handleEndElement;
    v3->_parsingSAXHandler.characters = (charactersSAXFunc)_handleCharacters;
    v3->_parsingSAXHandler.internalSubset = 0;
    v3->_parsingSAXHandler.getEntity = 0;
    v3->_parsingSAXHandler.cdataBlock = 0;
    v3->_parsingSAXHandler.error = (errorSAXFunc)_handleError;
    v3->_parsingSAXHandler.fatalError = 0;
    v3->_parsingSAXHandler.setDocumentLocator = 0;
    v3->_parsingSAXHandler.startDocument = 0;
    *(_OWORD *)&v3->_parsingSAXHandler.ignorableWhitespace = 0u;
    *(_OWORD *)&v3->_parsingSAXHandler.comment = 0u;
  }
  return v3;
}

- (void)parseHTMLBody:(id)a3 encoding:(unint64_t)a4
{
  objc_super v5 = (NSString *)a3;
  v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
  charactersBuffer = self->_charactersBuffer;
  self->_charactersBuffer = v6;

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  stringAttributesStack = self->_stringAttributesStack;
  self->_stringAttributesStack = v8;

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  isQuoteElementStack = self->_isQuoteElementStack;
  self->_isQuoteElementStack = v10;

  self->_currentQuoteLevel = 0;
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  listStack = self->_listStack;
  self->_listStack = v12;

  self->_currentListLevel = 0;
  self->_isLastCharAddedLineBreak = 0;
  self->_containsBlockedElements = 0;
  self->_bodyTagStartIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_currentHeadTagStartIndex = 0x7FFFFFFFFFFFFFFFLL;
  currentImgTagSource = self->_currentImgTagSource;
  self->_currentImgTagSource = 0;

  *(_WORD *)&self->_parsingHead = 0;
  self->_cancelled = 0;
  htmlBodyToParse = self->_htmlBodyToParse;
  self->_htmlBodyToParse = v5;
  v16 = v5;

  id v19 = [(NSString *)v16 dataUsingEncoding:4];
  htmlParserCtxtPtr PushParserCtxt = htmlCreatePushParserCtxt(&self->_parsingSAXHandler, self, (const char *)[v19 bytes], objc_msgSend(v19, "length"), 0, XML_CHAR_ENCODING_UTF8);
  self->_parserContext = PushParserCtxt;
  htmlCtxtUseOptions(PushParserCtxt, 2099201);
  htmlParseDocument(self->_parserContext);
  MEMORY[0x23ED007F0](self->_parserContext);
  v18 = self->_htmlBodyToParse;
  self->_htmlBodyToParse = 0;
}

- (BOOL)isElementBlocked:(id)a3 attributeQueryBlock:(id)a4
{
  return 0;
}

- (BOOL)isErrorTypeBlocked:(char *)a3
{
  return 0;
}

- (BOOL)isElementIgnorable:(id)a3
{
  return 0;
}

- (BOOL)caresAboutHTMLContentString
{
  return 0;
}

- (BOOL)_isElementBlocked:(id)a3 attributes:(const char *)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__NNMKHTMLParser__isElementBlocked_attributes___block_invoke;
  v5[3] = &unk_264E9A0D8;
  v5[4] = self;
  v5[5] = a4;
  return [(NNMKHTMLParser *)self isElementBlocked:a3 attributeQueryBlock:v5];
}

uint64_t __47__NNMKHTMLParser__isElementBlocked_attributes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _valueForAttributeNamed:a2 inAttributes:*(void *)(a1 + 40)];
}

- (BOOL)_isErrorBlocked:(_xmlError *)a3
{
  return a3 && [(NNMKHTMLParser *)self isErrorTypeBlocked:a3->str1];
}

- (BOOL)_isElementDisplayedInBlock:(id)a3
{
  id v3 = a3;
  BOOL v4 = 1;
  if ([v3 compare:@"div" options:1])
  {
    BOOL v4 = 1;
    if ([v3 compare:@"blockquote" options:1])
    {
      BOOL v4 = 1;
      if ([v3 compare:@"table" options:1])
      {
        BOOL v4 = 1;
        if ([v3 compare:@"tr" options:1])
        {
          BOOL v4 = 1;
          if ([v3 compare:@"td" options:1])
          {
            BOOL v4 = 1;
            if ([v3 compare:@"p" options:1])
            {
              BOOL v4 = 1;
              if ([v3 compare:@"li" options:1])
              {
                BOOL v4 = 1;
                if ([v3 compare:@"ul" options:1]) {
                  BOOL v4 = [v3 compare:@"ol" options:1] == 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (BOOL)_isElementQuoteElement:(id)a3 attributes:(const char *)a4
{
  id v6 = a3;
  if (![v6 compare:@"blockquote" options:1])
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __52__NNMKHTMLParser__isElementQuoteElement_attributes___block_invoke;
    v11[3] = &unk_264E9A100;
    v11[4] = &v18;
    v11[5] = &v12;
    [(NNMKHTMLParser *)self _enumerateAttributes:a4 withBlock:v11];
    v7 = (void *)v19[5];
    if (v7 && ![v7 compare:v19[5] options:1]
      || (v8 = (void *)v13[5]) != 0 && ![v8 compare:@"gmail_quote" options:1])
    {
      _Block_object_dispose(&v12, 8);

      _Block_object_dispose(&v18, 8);
      BOOL v9 = 1;
      goto LABEL_8;
    }
    _Block_object_dispose(&v12, 8);

    _Block_object_dispose(&v18, 8);
  }
  BOOL v9 = 0;
LABEL_8:

  return v9;
}

void __52__NNMKHTMLParser__isElementQuoteElement_attributes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  id v10 = a3;
  id v8 = a4;
  if (![v10 compare:@"type" options:1])
  {
    uint64_t v9 = *(void *)(a1 + 32);
    goto LABEL_5;
  }
  if (![v10 compare:@"class" options:1])
  {
    uint64_t v9 = *(void *)(a1 + 40);
LABEL_5:
    objc_storeStrong((id *)(*(void *)(v9 + 8) + 40), a4);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *a5 = 1;
  }
}

- (BOOL)_isElementLineBreak:(id)a3
{
  id v3 = a3;
  BOOL v4 = 1;
  if ([v3 compare:@"br" options:1]) {
    BOOL v4 = [v3 compare:@"hr" options:1] == 0;
  }

  return v4;
}

- (BOOL)_isElementList:(id)a3 ordered:(BOOL *)a4
{
  id v5 = a3;
  if (![v5 compare:@"ul" options:1])
  {
    if (!a4)
    {
LABEL_8:
      BOOL v6 = 1;
      goto LABEL_9;
    }
    BOOL v6 = 0;
LABEL_7:
    *a4 = v6;
    goto LABEL_8;
  }
  if (![v5 compare:@"ol" options:1])
  {
    BOOL v6 = 1;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  BOOL v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)_isElementListItem:(id)a3
{
  return [a3 compare:@"li" options:1] == 0;
}

- (BOOL)_isElementImage:(id)a3
{
  return [a3 compare:@"img" options:1] == 0;
}

- (BOOL)_isElementHyperlink:(id)a3
{
  return [a3 compare:@"a" options:1] == 0;
}

- (BOOL)_isElementHead:(id)a3
{
  return [a3 compare:@"head" options:1] == 0;
}

- (BOOL)_isElementBody:(id)a3
{
  return [a3 compare:@"body" options:1] == 0;
}

- (void)_stringAttributeForElement:(id)a3 attributes:(const char *)a4 stringAttributeKey:(id *)a5 stringAttributeValue:(id *)a6
{
  id v10 = a3;
  *a5 = 0;
  *a6 = 0;
  id v15 = v10;
  if (![v10 compare:@"b" options:1])
  {
    v13 = kBoldMessageBodyCustomAttribute;
LABEL_11:
    *a5 = *v13;
    *a6 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_19;
  }
  if (![v15 compare:@"i" options:1])
  {
    v13 = kItalicMessageBodyCustomAttribute;
    goto LABEL_11;
  }
  if (![v15 compare:@"u" options:1])
  {
    uint64_t v14 = (id *)MEMORY[0x263F1C2D8];
LABEL_14:
    *a5 = *v14;
    *a6 = &unk_26F131778;
    goto LABEL_19;
  }
  if (![v15 compare:@"strike" options:1])
  {
    uint64_t v14 = (id *)MEMORY[0x263F1C298];
    goto LABEL_14;
  }
  if ([v15 compare:@"font" options:1])
  {
    if (![(NNMKHTMLParser *)self _isElementBody:v15]) {
      goto LABEL_19;
    }
    v11 = [(NNMKHTMLParser *)self _valueForAttributeNamed:@"bgColor" inAttributes:a4];
    if (!v11) {
      goto LABEL_18;
    }
    uint64_t v12 = kBodyBackgroundMessageBodyCustomAttribute;
    goto LABEL_17;
  }
  v11 = [(NNMKHTMLParser *)self _valueForAttributeNamed:@"color" inAttributes:a4];
  if (v11)
  {
    uint64_t v12 = kFontColorMessageBodyCustomAttribute;
LABEL_17:
    *a5 = *v12;
    *a6 = [MEMORY[0x263F1C550] colorWithWebColor:v11];
  }
LABEL_18:

LABEL_19:
}

- (id)_stringAttributesForStyleAttribute:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [(NNMKHTMLParser *)self _stringAttributeValueForCSSStyleName:@"color" inStyleAttribute:v5];
  id v8 = [(NNMKHTMLParser *)self _stringAttributeValueForCSSStyleName:@"text-align" inStyleAttribute:v5];
  uint64_t v9 = [(NNMKHTMLParser *)self _stringAttributeValueForCSSStyleName:@"direction" inStyleAttribute:v5];

  if (v7)
  {
    id v10 = [MEMORY[0x263F1C550] colorWithWebColor:v7];
    if (v10) {
      [v6 setObject:v10 forKeyedSubscript:@"NNMKColor"];
    }
  }
  if (v8)
  {
    unint64_t v11 = [(NNMKHTMLParser *)self _textAlignmentFromString:v8];
    if (v11)
    {
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11];
      [v6 setObject:v12 forKeyedSubscript:@"NNMKAlign"];
    }
  }
  if (v9)
  {
    unint64_t v13 = [(NNMKHTMLParser *)self _writingDirectionFromString:v9];
    if (v13)
    {
      uint64_t v14 = [NSNumber numberWithUnsignedInteger:v13];
      [v6 setObject:v14 forKeyedSubscript:@"NNMKWritingDirection"];
    }
  }

  return v6;
}

- (id)_stringAttributeValueForCSSStyleName:(id)a3 inStyleAttribute:(id)a4
{
  id v5 = a4;
  id v6 = [NSString stringWithFormat:@"(^|;)\\s*(%@\\s*:\\s*)(.+?)(;|$)", a3];
  v7 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v6 options:1 error:0];
  id v8 = [v5 lowercaseString];
  uint64_t v9 = objc_msgSend(v7, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v5, "length"));

  if ([v9 count])
  {
    id v10 = [v9 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 rangeAtIndex:3];
    unint64_t v13 = objc_msgSend(v5, "substringWithRange:", v11, v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (unint64_t)_textAlignmentFromString:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 1;
  if ([v3 compare:@"left" options:1])
  {
    if ([v3 compare:@"center" options:1])
    {
      if ([v3 compare:@"right" options:1]) {
        unint64_t v4 = 4 * ([v3 compare:@"justify" options:1] == 0);
      }
      else {
        unint64_t v4 = 3;
      }
    }
    else
    {
      unint64_t v4 = 2;
    }
  }

  return v4;
}

- (unint64_t)_writingDirectionFromString:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 1;
  if ([v3 compare:@"ltr" options:1])
  {
    if ([v3 compare:@"rtl" options:1]) {
      unint64_t v4 = [v3 compare:@"initial" options:1] == 0;
    }
    else {
      unint64_t v4 = 2;
    }
  }

  return v4;
}

- (void)_stringAttributeForHyperlink:(id)a3 attributes:(const char *)a4 stringAttributeKey:(id *)a5 stringAttributeValue:(id *)a6
{
  *a5 = 0;
  *a6 = 0;
  -[NNMKHTMLParser _valueForAttributeNamed:inAttributes:](self, "_valueForAttributeNamed:inAttributes:", @"href");
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v21 lowercaseString];
  if ([v10 hasPrefix:@"http:"]) {
    goto LABEL_14;
  }
  uint64_t v11 = [v21 lowercaseString];
  if ([v11 hasPrefix:@"https:"])
  {
LABEL_13:

LABEL_14:
LABEL_15:
    *a5 = @"NNMKHyperlink";
    v16 = NSURL;
    id v17 = [(NNMKHTMLParser *)self _valueForAttributeNamed:@"href" inAttributes:a4];
    *a6 = [v16 URLWithString:v17];

    goto LABEL_16;
  }
  uint64_t v12 = [v21 lowercaseString];
  if ([v12 hasPrefix:@"mailto:"])
  {
LABEL_12:

    goto LABEL_13;
  }
  unint64_t v13 = [v21 lowercaseString];
  if ([v13 hasPrefix:@"map:"])
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v14 = [v21 lowercaseString];
  if ([v14 hasPrefix:@"maps:"])
  {
LABEL_10:

    goto LABEL_11;
  }
  id v15 = [v21 lowercaseString];
  if ([v15 hasPrefix:@"sms:"])
  {
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v20 = [v21 lowercaseString];
  if ([v20 hasPrefix:@"tel:"])
  {

    goto LABEL_9;
  }
  uint64_t v18 = [v21 lowercaseString];
  char v19 = [v18 hasPrefix:@"itms-services:"];

  if (v19) {
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_valueForAttributeNamed:(id)a3 inAttributes:(const char *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__NNMKHTMLParser__valueForAttributeNamed_inAttributes___block_invoke;
  v10[3] = &unk_264E9A128;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v13;
  [(NNMKHTMLParser *)self _enumerateAttributes:a4 withBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __55__NNMKHTMLParser__valueForAttributeNamed_inAttributes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  id v9 = a4;
  if (![a3 compare:*(void *)(a1 + 32) options:1])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
    *a5 = 1;
  }
}

- (void)_enumerateAttributes:(const char *)a3 withBlock:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void *, void *, char *))a4;
  if (a3)
  {
    id v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      while (1)
      {
        id v8 = a3[v7++];
        if (v6) {
          break;
        }
        if (!v8) {
          goto LABEL_12;
        }
        id v6 = objc_msgSend(NSString, "stringWithUTF8String:");
      }
      if (v8)
      {
        id v9 = objc_msgSend(NSString, "stringWithUTF8String:");
      }
      else
      {
        id v9 = 0;
      }
      char v10 = 0;
      v5[2](v5, v7, v6, v9, &v10);
      if (v10) {
        break;
      }

      id v6 = 0;
    }

LABEL_12:
  }
}

- (id)_topStringAttributes
{
  v2 = [(NSMutableArray *)self->_stringAttributesStack lastObject];
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA78];
  }
  id v4 = v2;

  return v4;
}

- (void)_pushStringAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKHTMLParser *)self _topStringAttributes];
  id v6 = (id)[v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  [(NSMutableArray *)self->_stringAttributesStack addObject:v6];
}

- (void)_popStringAttributes
{
}

- (void)_appendLineBreak
{
}

- (void)_requireNewLine
{
  if (!self->_isLastCharAddedLineBreak) {
    [(NNMKHTMLParser *)self _appendLineBreak];
  }
}

- (void)_appendCharacters:(const char *)a3 length:(int)a4
{
}

- (void)_flushCharactersIfNeeded
{
  if ([(NSMutableData *)self->_charactersBuffer length])
  {
    id v5 = (void *)[[NSString alloc] initWithData:self->_charactersBuffer encoding:4];
    id v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    charactersBuffer = self->_charactersBuffer;
    self->_charactersBuffer = v3;

    if (v5 && (![v5 isEqualToString:@"\n"] || !self->_isLastCharAddedLineBreak)) {
      [(NNMKHTMLParser *)self _appendString:v5];
    }
    MEMORY[0x270F9A758]();
  }
}

- (void)_appendString:(id)a3
{
  id v4 = a3;
  id v5 = [(NNMKHTMLParser *)self _topStringAttributes];
  [(NNMKHTMLParser *)self appendString:v4 stringAttributes:v5];

  LOBYTE(v5) = [v4 hasSuffix:@"\n"];
  self->_isLastCharAddedLineBreak = (char)v5;
}

- (void)_appendImageFromAttributes:(const char *)a3
{
  id v12 = [(NNMKHTMLParser *)self _valueForAttributeNamed:@"src" inAttributes:a3];
  id v5 = [(NNMKHTMLParser *)self _valueForAttributeNamed:@"width" inAttributes:a3];
  [v5 floatValue];
  double v7 = v6;

  id v8 = [(NNMKHTMLParser *)self _valueForAttributeNamed:@"height" inAttributes:a3];
  [v8 floatValue];
  double v10 = v9;

  id v11 = [(NNMKHTMLParser *)self _topStringAttributes];
  [(NNMKHTMLParser *)self appendImageWithSource:v12 width:v11 height:v7 stringAttributes:v10];

  self->_isLastCharAddedLineBreak = 0;
}

- (BOOL)containsBlockedElements
{
  return self->_containsBlockedElements;
}

- (void)setContainsBlockedElements:(BOOL)a3
{
  self->_containsBlockedElements = a3;
}

- (BOOL)parsingHead
{
  return self->_parsingHead;
}

- (void)setParsingHead:(BOOL)a3
{
  self->_parsingHead = a3;
}

- (BOOL)parsingBody
{
  return self->_parsingBody;
}

- (void)setParsingBody:(BOOL)a3
{
  self->_parsingBody = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSString)htmlBodyToParse
{
  return self->_htmlBodyToParse;
}

- (void)setHtmlBodyToParse:(id)a3
{
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (void)setEncoding:(unint64_t)a3
{
  self->_encoding = a3;
}

- (_xmlSAXHandler)parsingSAXHandler
{
  long long v3 = *(_OWORD *)&self->initialized;
  *(_OWORD *)&retstr->attributeDecl = *(_OWORD *)&self->cdataBlock;
  *(_OWORD *)&retstr->unparsedEntityDecl = v3;
  long long v4 = *(_OWORD *)&self->serror;
  *(_OWORD *)&retstr->startDocument = *(_OWORD *)&self->startElementNs;
  *(_OWORD *)&retstr->startElement = v4;
  long long v5 = *(_OWORD *)&self->processingInstruction;
  *(_OWORD *)&retstr->internalSubset = *(_OWORD *)&self->characters;
  *(_OWORD *)&retstr->hasInternalSubset = v5;
  long long v6 = *(_OWORD *)&self->fatalError;
  *(_OWORD *)&retstr->resolveEntity = *(_OWORD *)&self->warning;
  *(_OWORD *)&retstr->entityDecl = v6;
  long long v7 = *(_OWORD *)&self[1].setDocumentLocator;
  *(_OWORD *)&retstr->getParameterEntity = *(_OWORD *)&self[1].elementDecl;
  *(_OWORD *)&retstr->externalSubset = v7;
  long long v8 = *(_OWORD *)&self[1].endElement;
  *(_OWORD *)&retstr->_private = *(_OWORD *)&self[1].endDocument;
  *(_OWORD *)&retstr->endElementNs = v8;
  long long v9 = *(_OWORD *)&self[1].hasExternalSubset;
  *(_OWORD *)&retstr->reference = *(_OWORD *)&self[1].isStandalone;
  *(_OWORD *)&retstr->ignorableWhitespace = v9;
  long long v10 = *(_OWORD *)&self[1].notationDecl;
  *(_OWORD *)&retstr->comment = *(_OWORD *)&self[1].getEntity;
  *(_OWORD *)&retstr->error = v10;
  return self;
}

- (void)setParsingSAXHandler:(_xmlSAXHandler *)a3
{
  long long v3 = *(_OWORD *)&a3->internalSubset;
  long long v4 = *(_OWORD *)&a3->hasInternalSubset;
  long long v5 = *(_OWORD *)&a3->resolveEntity;
  *(_OWORD *)&self->_parsingSAXHandler.entityDecl = *(_OWORD *)&a3->entityDecl;
  *(_OWORD *)&self->_parsingSAXHandler.resolveEntity = v5;
  *(_OWORD *)&self->_parsingSAXHandler.hasInternalSubset = v4;
  *(_OWORD *)&self->_parsingSAXHandler.internalSubset = v3;
  long long v6 = *(_OWORD *)&a3->attributeDecl;
  long long v7 = *(_OWORD *)&a3->unparsedEntityDecl;
  long long v8 = *(_OWORD *)&a3->startDocument;
  *(_OWORD *)&self->_parsingSAXHandler.startElement = *(_OWORD *)&a3->startElement;
  *(_OWORD *)&self->_parsingSAXHandler.startDocument = v8;
  *(_OWORD *)&self->_parsingSAXHandler.unparsedEntityDecl = v7;
  *(_OWORD *)&self->_parsingSAXHandler.attributeDecl = v6;
  long long v9 = *(_OWORD *)&a3->reference;
  long long v10 = *(_OWORD *)&a3->ignorableWhitespace;
  long long v11 = *(_OWORD *)&a3->error;
  *(_OWORD *)&self->_parsingSAXHandler.comment = *(_OWORD *)&a3->comment;
  *(_OWORD *)&self->_parsingSAXHandler.error = v11;
  *(_OWORD *)&self->_parsingSAXHandler.reference = v9;
  *(_OWORD *)&self->_parsingSAXHandler.ignorableWhitespace = v10;
  long long v12 = *(_OWORD *)&a3->getParameterEntity;
  long long v13 = *(_OWORD *)&a3->externalSubset;
  long long v14 = *(_OWORD *)&a3->endElementNs;
  *(_OWORD *)&self->_parsingSAXHandler._private = *(_OWORD *)&a3->_private;
  *(_OWORD *)&self->_parsingSAXHandler.endElementNs = v14;
  *(_OWORD *)&self->_parsingSAXHandler.getParameterEntity = v12;
  *(_OWORD *)&self->_parsingSAXHandler.externalSubset = v13;
}

- (_xmlParserCtxt)parserContext
{
  return self->_parserContext;
}

- (void)setParserContext:(_xmlParserCtxt *)a3
{
  self->_parserContext = a3;
}

- (NSMutableData)charactersBuffer
{
  return self->_charactersBuffer;
}

- (void)setCharactersBuffer:(id)a3
{
}

- (NSMutableArray)stringAttributesStack
{
  return self->_stringAttributesStack;
}

- (void)setStringAttributesStack:(id)a3
{
}

- (NSMutableArray)isQuoteElementStack
{
  return self->_isQuoteElementStack;
}

- (void)setIsQuoteElementStack:(id)a3
{
}

- (unint64_t)currentQuoteLevel
{
  return self->_currentQuoteLevel;
}

- (void)setCurrentQuoteLevel:(unint64_t)a3
{
  self->_currentQuoteLevel = a3;
}

- (NSMutableArray)listStack
{
  return self->_listStack;
}

- (void)setListStack:(id)a3
{
}

- (unint64_t)currentListLevel
{
  return self->_currentListLevel;
}

- (void)setCurrentListLevel:(unint64_t)a3
{
  self->_currentListLevel = a3;
}

- (BOOL)isLastCharAddedLineBreak
{
  return self->_isLastCharAddedLineBreak;
}

- (void)setIsLastCharAddedLineBreak:(BOOL)a3
{
  self->_isLastCharAddedLineBreak = a3;
}

- (NSString)ignoringElementSubtree
{
  return self->_ignoringElementSubtree;
}

- (void)setIgnoringElementSubtree:(id)a3
{
}

- (unint64_t)bodyTagStartIndex
{
  return self->_bodyTagStartIndex;
}

- (void)setBodyTagStartIndex:(unint64_t)a3
{
  self->_bodyTagStartIndex = a3;
}

- (NSString)bodyTagStyle
{
  return self->_bodyTagStyle;
}

- (void)setBodyTagStyle:(id)a3
{
}

- (unint64_t)currentHeadTagStartIndex
{
  return self->_currentHeadTagStartIndex;
}

- (void)setCurrentHeadTagStartIndex:(unint64_t)a3
{
  self->_currentHeadTagStartIndex = a3;
}

- (unint64_t)currentImgTagStartIndex
{
  return self->_currentImgTagStartIndex;
}

- (void)setCurrentImgTagStartIndex:(unint64_t)a3
{
  self->_currentImgTagStartIndex = a3;
}

- (NSString)currentImgTagSource
{
  return self->_currentImgTagSource;
}

- (void)setCurrentImgTagSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentImgTagSource, 0);
  objc_storeStrong((id *)&self->_bodyTagStyle, 0);
  objc_storeStrong((id *)&self->_ignoringElementSubtree, 0);
  objc_storeStrong((id *)&self->_listStack, 0);
  objc_storeStrong((id *)&self->_isQuoteElementStack, 0);
  objc_storeStrong((id *)&self->_stringAttributesStack, 0);
  objc_storeStrong((id *)&self->_charactersBuffer, 0);
  objc_storeStrong((id *)&self->_htmlBodyToParse, 0);
}

@end