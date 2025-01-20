@interface ICEvernoteContentParser
- (BOOL)shouldAppendCharactersToBuffer;
- (BOOL)shouldSelfCloseTagForStartElementName:(id)a3;
- (NSMutableString)bufferString;
- (NSMutableString)htmlString;
- (NSXMLParser)parser;
- (id)htmlStringFromEvernoteContentString:(id)a3;
- (id)stringFromAttributes:(id)a3;
- (id)titleFromHTMLString:(id)a3;
- (unint64_t)parserType;
- (void)parseContentString:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)setBufferString:(id)a3;
- (void)setHtmlString:(id)a3;
- (void)setParser:(id)a3;
- (void)setParserType:(unint64_t)a3;
- (void)setShouldAppendCharactersToBuffer:(BOOL)a3;
- (void)teardownParser;
@end

@implementation ICEvernoteContentParser

- (id)htmlStringFromEvernoteContentString:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C877DB80]();
  [(ICEvernoteContentParser *)self setParserType:0];
  [(ICEvernoteContentParser *)self parseContentString:v4];
  v6 = [(ICEvernoteContentParser *)self htmlString];
  v7 = (void *)[v6 copy];

  [(ICEvernoteContentParser *)self teardownParser];

  return v7;
}

- (id)titleFromHTMLString:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C877DB80]();
  [(ICEvernoteContentParser *)self setParserType:1];
  [(ICEvernoteContentParser *)self parseContentString:v4];
  v6 = [(ICEvernoteContentParser *)self htmlString];
  v7 = (void *)[v6 copy];

  [(ICEvernoteContentParser *)self teardownParser];

  return v7;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v32 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = (void *)MEMORY[0x1C877DB80]();
  v16 = [a4 lowercaseString];
  if (![(ICEvernoteContentParser *)self parserType])
  {
    v18 = [(ICEvernoteContentParser *)self bufferString];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      v20 = [(ICEvernoteContentParser *)self htmlString];
      v21 = [(ICEvernoteContentParser *)self bufferString];
      [v20 appendString:v21];

      [(ICEvernoteContentParser *)self setBufferString:0];
    }
    if ([v16 isEqualToString:@"en-note"])
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      [(ICEvernoteContentParser *)self setHtmlString:v22];

      v23 = [(ICEvernoteContentParser *)self htmlString];
      [v23 appendString:@"<html><head><meta charset=\"utf-8\"></head><body>"];
LABEL_9:

      goto LABEL_15;
    }
    if ([v16 isEqualToString:@"en-media"])
    {
      v17 = [v14 objectForKeyedSubscript:@"hash"];
      v24 = [(ICEvernoteContentParser *)self htmlString];
      v25 = [NSString stringWithFormat:@"{{NotesAttachment:%@}}", v17];
      [v24 appendString:v25];
    }
    else
    {
      if ([v16 isEqualToString:@"en-todo"])
      {
        v26 = [v14 objectForKeyedSubscript:@"checked"];
        int v27 = [v26 BOOLValue];

        v23 = [(ICEvernoteContentParser *)self htmlString];
        v28 = @"NO";
        if (v27) {
          v28 = @"YES";
        }
        v29 = [NSString stringWithFormat:@"{{NotesCheckbox:%@}}", v28];
        [v23 appendString:v29];

        goto LABEL_9;
      }
      if ([(ICEvernoteContentParser *)self shouldSelfCloseTagForStartElementName:v16])
      {
        goto LABEL_15;
      }
      if (v14
        && ([v14 allKeys],
            v30 = objc_claimAutoreleasedReturnValue(),
            uint64_t v31 = [v30 count],
            v30,
            v31))
      {
        v17 = [(ICEvernoteContentParser *)self stringFromAttributes:v14];
      }
      else
      {
        v17 = &stru_1F1F2FFF8;
      }
      v24 = [(ICEvernoteContentParser *)self htmlString];
      [v24 appendFormat:@"<%@%@>", v16, v17];
    }

    goto LABEL_13;
  }
  if ([(ICEvernoteContentParser *)self parserType] != 1) {
    goto LABEL_15;
  }
  if ([v16 isEqualToString:@"title"])
  {
    [(ICEvernoteContentParser *)self setShouldAppendCharactersToBuffer:1];
    v17 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    [(ICEvernoteContentParser *)self setHtmlString:v17];
LABEL_13:

    goto LABEL_15;
  }
  [(ICEvernoteContentParser *)self setShouldAppendCharactersToBuffer:0];
LABEL_15:
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1C877DB80]();
  v8 = [(ICEvernoteContentParser *)self bufferString];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [(ICEvernoteContentParser *)self setBufferString:v9];
  }
  v10 = [(ICEvernoteContentParser *)self bufferString];
  [v10 appendString:v6];
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v25 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1C877DB80]();
  id v13 = [a4 lowercaseString];
  if (![(ICEvernoteContentParser *)self parserType])
  {
    if ([v13 isEqualToString:@"en-note"])
    {
      id v14 = [(ICEvernoteContentParser *)self htmlString];
      v16 = NSString;
      uint64_t v17 = [(ICEvernoteContentParser *)self bufferString];
      v15 = (void *)v17;
      v18 = &stru_1F1F2FFF8;
      if (v17) {
        v18 = (__CFString *)v17;
      }
      [v16 stringWithFormat:@"%@</body></html>", v18, v24];
    }
    else
    {
      if (([v13 isEqualToString:@"en-media"] & 1) != 0
        || ([v13 isEqualToString:@"en-todo"] & 1) != 0
        || ([v13 isEqualToString:@"en-crypt"] & 1) != 0)
      {
        goto LABEL_14;
      }
      BOOL v20 = [(ICEvernoteContentParser *)self shouldSelfCloseTagForStartElementName:v13];
      id v14 = [(ICEvernoteContentParser *)self htmlString];
      v21 = NSString;
      uint64_t v22 = [(ICEvernoteContentParser *)self bufferString];
      v15 = (void *)v22;
      v23 = &stru_1F1F2FFF8;
      if (v22) {
        v23 = (__CFString *)v22;
      }
      if (v20) {
        [v21 stringWithFormat:@"%@<%@/>", v23, v13];
      }
      else {
        [v21 stringWithFormat:@"%@</%@>", v23, v13];
      }
    uint64_t v19 = };
    [v14 appendString:v19];

    goto LABEL_10;
  }
  if ([(ICEvernoteContentParser *)self parserType] == 1
    && [v13 isEqualToString:@"title"])
  {
    id v14 = [(ICEvernoteContentParser *)self htmlString];
    v15 = [(ICEvernoteContentParser *)self bufferString];
    [v14 appendString:v15];
LABEL_10:
  }
LABEL_14:
  [(ICEvernoteContentParser *)self setBufferString:0];
}

- (id)stringFromAttributes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [v3 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKeyedSubscript:v10];
        id v12 = (void *)v11;
        if (v11) {
          id v13 = (__CFString *)v11;
        }
        else {
          id v13 = &stru_1F1F2FFF8;
        }
        [v4 appendFormat:@" %@=\"%@\"", v10, v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)parseContentString:(id)a3
{
  id v4 = a3;
  [(ICEvernoteContentParser *)self setShouldAppendCharactersToBuffer:1];
  v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v11 = [v4 stringByTrimmingCharactersInSet:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F29250]);
  uint64_t v7 = [v11 dataUsingEncoding:4];
  uint64_t v8 = (void *)[v6 initWithData:v7];
  [(ICEvernoteContentParser *)self setParser:v8];

  id v9 = [(ICEvernoteContentParser *)self parser];
  [v9 setDelegate:self];

  uint64_t v10 = [(ICEvernoteContentParser *)self parser];
  [v10 parse];
}

- (void)teardownParser
{
  [(ICEvernoteContentParser *)self setParser:0];
  [(ICEvernoteContentParser *)self setBufferString:0];
  [(ICEvernoteContentParser *)self setHtmlString:0];
}

- (BOOL)shouldSelfCloseTagForStartElementName:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (void *)shouldSelfCloseTagForStartElementName__ignoreList;
    if (!shouldSelfCloseTagForStartElementName__ignoreList)
    {
      shouldSelfCloseTagForStartElementName__ignoreList = (uint64_t)&unk_1F1F62CB8;

      id v4 = &unk_1F1F62CB8;
    }
    v5 = [v3 lowercaseString];
    char v6 = [v4 containsObject:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)shouldAppendCharactersToBuffer
{
  return self->_shouldAppendCharactersToBuffer;
}

- (void)setShouldAppendCharactersToBuffer:(BOOL)a3
{
  self->_shouldAppendCharactersToBuffer = a3;
}

- (NSMutableString)bufferString
{
  return self->_bufferString;
}

- (void)setBufferString:(id)a3
{
}

- (NSMutableString)htmlString
{
  return self->_htmlString;
}

- (void)setHtmlString:(id)a3
{
}

- (NSXMLParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
}

- (unint64_t)parserType
{
  return self->_parserType;
}

- (void)setParserType:(unint64_t)a3
{
  self->_parserType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_htmlString, 0);
  objc_storeStrong((id *)&self->_bufferString, 0);
}

@end