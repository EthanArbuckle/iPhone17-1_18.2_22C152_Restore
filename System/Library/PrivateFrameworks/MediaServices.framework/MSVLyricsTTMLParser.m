@interface MSVLyricsTTMLParser
- (BOOL)linesAreSortedByStartTime;
- (MSVLyricsSongInfo)lyricsInfo;
- (MSVLyricsTTMLParser)initWithTTMLData:(id)a3;
- (MSVLyricsTTMLParser)initWithTTMLStream:(id)a3;
- (MSVLyricsTextElement)currentTextElement;
- (NSData)ttmlData;
- (NSError)parserError;
- (NSInputStream)inputStream;
- (NSMutableArray)agents;
- (NSMutableArray)elementStack;
- (NSMutableArray)lyricLines;
- (NSMutableDictionary)translationsMap;
- (OS_dispatch_queue)parseQueue;
- (double)currentStartTime;
- (id)_parentTextElement;
- (id)_translatedLyrics:(id)a3 forLanguage:(id)a4;
- (id)_updateWords:(id)a3 withWord:(id)a4 parentText:(id)a5;
- (id)parseWithError:(id *)a3;
- (void)_stripParenthesesFromBackgroundVocalWord:(id)a3 backgroundVocalText:(id)a4;
- (void)parseWithCompletion:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)setAgents:(id)a3;
- (void)setCurrentStartTime:(double)a3;
- (void)setCurrentTextElement:(id)a3;
- (void)setElementStack:(id)a3;
- (void)setInputStream:(id)a3;
- (void)setLinesAreSortedByStartTime:(BOOL)a3;
- (void)setLyricLines:(id)a3;
- (void)setLyricsInfo:(id)a3;
- (void)setParseQueue:(id)a3;
- (void)setParserError:(id)a3;
- (void)setTranslationsMap:(id)a3;
- (void)setTtmlData:(id)a3;
@end

@implementation MSVLyricsTTMLParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agents, 0);
  objc_storeStrong((id *)&self->_translationsMap, 0);
  objc_storeStrong((id *)&self->_currentTextElement, 0);
  objc_storeStrong((id *)&self->_lyricLines, 0);
  objc_storeStrong((id *)&self->_elementStack, 0);
  objc_storeStrong((id *)&self->_parserError, 0);
  objc_storeStrong((id *)&self->_lyricsInfo, 0);
  objc_storeStrong((id *)&self->_parseQueue, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_ttmlData, 0);
}

- (void)setAgents:(id)a3
{
}

- (NSMutableArray)agents
{
  return self->_agents;
}

- (void)setLinesAreSortedByStartTime:(BOOL)a3
{
  self->_linesAreSortedByStartTime = a3;
}

- (BOOL)linesAreSortedByStartTime
{
  return self->_linesAreSortedByStartTime;
}

- (void)setCurrentStartTime:(double)a3
{
  self->_currentStartTime = a3;
}

- (double)currentStartTime
{
  return self->_currentStartTime;
}

- (void)setTranslationsMap:(id)a3
{
}

- (NSMutableDictionary)translationsMap
{
  return self->_translationsMap;
}

- (void)setCurrentTextElement:(id)a3
{
}

- (MSVLyricsTextElement)currentTextElement
{
  return self->_currentTextElement;
}

- (void)setLyricLines:(id)a3
{
}

- (NSMutableArray)lyricLines
{
  return self->_lyricLines;
}

- (void)setElementStack:(id)a3
{
}

- (NSMutableArray)elementStack
{
  return self->_elementStack;
}

- (void)setParserError:(id)a3
{
}

- (NSError)parserError
{
  return self->_parserError;
}

- (void)setLyricsInfo:(id)a3
{
}

- (MSVLyricsSongInfo)lyricsInfo
{
  return self->_lyricsInfo;
}

- (void)setParseQueue:(id)a3
{
}

- (OS_dispatch_queue)parseQueue
{
  return self->_parseQueue;
}

- (void)setInputStream:(id)a3
{
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setTtmlData:(id)a3
{
}

- (NSData)ttmlData
{
  return self->_ttmlData;
}

- (void)_stripParenthesesFromBackgroundVocalWord:(id)a3 backgroundVocalText:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([v7 isBackgroundVocal] & 1) == 0)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2 object:self file:@"MSVLyricsTTMLParser.m" lineNumber:667 description:@"MSVLyricsWord must be background vocal"];
  }
  v9 = (void *)[v8 mutableCopy];
  objc_msgSend(v9, "msvl_trimTrailingWhitespace");
  if ([v9 hasSuffix:@""]))
  {
    objc_msgSend(v9, "deleteCharactersInRange:", objc_msgSend(v9, "length") - 1, 1);
    objc_msgSend(v9, "deleteCharactersInRange:", 0, 1);
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
    [v7 setLyricsText:v10];

    uint64_t v11 = [v8 rangeOfString:v9];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      __assert_rtn("-[MSVLyricsTTMLParser _stripParenthesesFromBackgroundVocalWord:backgroundVocalText:]", "MSVLyricsTTMLParser.m", 683, "relativeRange.location != NSNotFound");
    }
    v51 = v9;
    objc_msgSend(v7, "setCharacterRange:", objc_msgSend(v7, "characterRange") + v11, v12);
    v13 = [v7 subwords];
    v14 = [v13 firstObject];

    v15 = [v14 lyricsText];
    v16 = [v15 string];
    int v17 = objc_msgSend(v16, "hasPrefix:", @"(");

    if (v17)
    {
      v18 = [v14 lyricsText];
      v19 = [v14 lyricsText];
      v20 = objc_msgSend(v18, "attributedSubstringFromRange:", 1, objc_msgSend(v19, "length") - 1);
      [v14 setLyricsText:v20];
    }
    v50 = v14;
    v21 = [v7 subwords];
    v22 = [v21 lastObject];

    v23 = [v22 lyricsText];
    v24 = [v23 string];
    int v25 = [v24 hasSuffix:@""]);

    if (v25)
    {
      v26 = [v22 lyricsText];
      v27 = [v22 lyricsText];
      v28 = objc_msgSend(v26, "attributedSubstringFromRange:", 0, objc_msgSend(v27, "length") - 1);
      [v22 setLyricsText:v28];
    }
    v49 = v22;
    id v52 = v8;
    v29 = (void *)MEMORY[0x1E4F1CA48];
    v30 = [v7 subwords];
    v55 = objc_msgSend(v29, "arrayWithCapacity:", objc_msgSend(v30, "count"));

    v31 = [v7 lyricsText];
    v32 = [v31 string];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v53 = v7;
    id obj = [v7 subwords];
    uint64_t v33 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v57 != v37) {
            objc_enumerationMutation(obj);
          }
          v39 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v40 = [v39 lyricsText];
          uint64_t v41 = [v40 length];

          if (v41)
          {
            uint64_t v42 = v36 + v35;
            uint64_t v43 = [v32 length] - (v36 + v35);
            v44 = [v39 lyricsText];
            v45 = [v44 string];
            uint64_t v36 = objc_msgSend(v32, "rangeOfString:options:range:locale:", v45, 0, v42, v43, 0);
            uint64_t v35 = v46;

            objc_msgSend(v39, "setCharacterRange:", v36, v35);
            objc_msgSend(v39, "setWordIndex:", objc_msgSend(v55, "count"));
            [v55 addObject:v39];
          }
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v34);
    }

    v47 = (void *)[v55 copy];
    id v7 = v53;
    [v53 setSubwords:v47];

    v9 = v51;
    id v8 = v52;
  }
}

- (id)_updateWords:(id)a3 withWord:(id)a4 parentText:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    v10 = [v7 arrayByAddingObject:v8];
  }
  else
  {
    v16[0] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  uint64_t v11 = v10;
  objc_msgSend(v8, "setWordIndex:", objc_msgSend(v10, "count") - 1);
  if ([v8 wordIndex] >= 1)
  {
    uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "wordIndex") - 1);
    [v12 setNextWord:v8];
  }
  v13 = [v8 mutableText];
  uint64_t v14 = [v13 length];

  objc_msgSend(v8, "setCharacterRange:", objc_msgSend(v9, "length") - v14, v14);
  return v11;
}

- (id)_translatedLyrics:(id)a3 forLanguage:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSVLyricsTTMLParser *)self translationsMap];

  if (!v8) {
    goto LABEL_20;
  }
  if ([v7 hasPrefix:@"zh-Hant"])
  {
    id v9 = [(MSVLyricsTTMLParser *)self translationsMap];
    v10 = v9;
    uint64_t v11 = @"zh-Hant";
  }
  else
  {
    if (![v7 hasPrefix:@"zh-Hans"])
    {
LABEL_19:
      id v8 = 0;
      goto LABEL_20;
    }
    id v9 = [(MSVLyricsTTMLParser *)self translationsMap];
    v10 = v9;
    uint64_t v11 = @"zh-Hans";
  }
  uint64_t v12 = [v9 objectForKeyedSubscript:v11];

  if (!v12) {
    goto LABEL_19;
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v25 = v6;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v19 = [v18 translationKey];

        if (v19
          && ([v18 translationKey],
              v20 = objc_claimAutoreleasedReturnValue(),
              [v12 objectForKeyedSubscript:v20],
              v21 = objc_claimAutoreleasedReturnValue(),
              v20,
              v21))
        {
          [v18 startTime];
          objc_msgSend(v21, "setStartTime:");
          [v18 endTime];
          objc_msgSend(v21, "setEndTime:");
          v22 = [v18 agent];
          [v21 setAgent:v22];

          v23 = [v18 translationKey];
          [v21 setTranslationKey:v23];

          [v8 addObject:v21];
        }
        else
        {
          [v8 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  id v6 = v25;
LABEL_20:

  return v8;
}

- (id)_parentTextElement
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(MSVLyricsTTMLParser *)self elementStack];
  v3 = [v2 reverseObjectEnumerator];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1A30CD000, v6, OS_LOG_TYPE_ERROR, "Parse error: %@", (uint8_t *)&v7, 0xCu);
  }

  [(MSVLyricsTTMLParser *)self setParserError:v5];
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v18 = a4;
  id v5 = [(MSVLyricsTTMLParser *)self currentTextElement];

  if (v5)
  {
    id v6 = [(MSVLyricsTTMLParser *)self currentTextElement];
    int v7 = [v6 mutableText];
    [v7 appendString:v18];

    id v8 = [(MSVLyricsTTMLParser *)self currentTextElement];
    uint64_t v9 = [v8 type];

    long long v10 = v18;
    if (v9 != 2) {
      goto LABEL_7;
    }
    long long v11 = [(MSVLyricsTTMLParser *)self currentTextElement];
    long long v12 = [v11 parentLine];
    id v13 = [v12 mutableText];
    [v13 appendString:v18];

    uint64_t v14 = [v11 parentWord];
    uint64_t v15 = [v14 mutableText];
    [v15 appendString:v18];
  }
  else
  {
    uint64_t v16 = [(MSVLyricsTTMLParser *)self elementStack];
    int v17 = [v16 lastObject];
    long long v11 = [v17 mutableText];

    if (v11) {
      [v11 appendString:v18];
    }
  }

  long long v10 = v18;
LABEL_7:
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  long long v11 = [(MSVLyricsTTMLParser *)self elementStack];
  long long v12 = [v11 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;
  uint64_t v15 = [v12 elementName];
  uint64_t v16 = [v10 caseInsensitiveCompare:v15];

  if (!v16)
  {
    v23 = [(MSVLyricsTTMLParser *)self elementStack];
    [v23 removeLastObject];

    v24 = [(MSVLyricsTTMLParser *)self elementStack];
    int v17 = [v24 lastObject];

    if (objc_msgSend(v10, "msvl_isElementType:", @"body"))
    {
      id v25 = [(MSVLyricsTTMLParser *)self lyricLines];
      long long v26 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      long long v27 = [v26 firstObject];
      long long v28 = [(MSVLyricsTTMLParser *)self _translatedLyrics:v25 forLanguage:v27];

      if (v28)
      {
        long long v29 = v28;
      }
      else
      {
        long long v29 = [(MSVLyricsTTMLParser *)self lyricLines];
      }
      uint64_t v31 = v29;
      if ([(MSVLyricsTTMLParser *)self linesAreSortedByStartTime])
      {
        v32 = [(MSVLyricsTTMLParser *)self lyricsInfo];
        [v32 setLyricsLinesSortedByStartTime:v31];
      }
      else
      {
        uint64_t v33 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A30CD000, v33, OS_LOG_TYPE_DEFAULT, "Lyrics lines are out of order: they should be ordered by start time", buf, 2u);
        }

        v32 = [(MSVLyricsTTMLParser *)self lyricsInfo];
        [v32 setLyricsLines:v31];
      }

      uint64_t v34 = [(MSVLyricsTTMLParser *)self agents];
      uint64_t v35 = (void *)[v34 copy];
      uint64_t v36 = [(MSVLyricsTTMLParser *)self lyricsInfo];
      [v36 setAgents:v35];

      goto LABEL_22;
    }
    if (objc_msgSend(v10, "msvl_isElementType:", @"tt")) {
      goto LABEL_23;
    }
    if (objc_msgSend(v10, "msvl_isElementType:", @"songwriter"))
    {
      id v18 = v12;
      v30 = [v18 mutableText];
      [v18 setName:v30];

      [v18 setMutableText:0];
      goto LABEL_8;
    }
    if (!v14)
    {
      if (!objc_msgSend(v10, "msvl_isElementType:", @"name")) {
        goto LABEL_23;
      }
      v49 = [v17 elementName];
      int v50 = objc_msgSend(v49, "msvl_isElementType:", @"agent");

      if (!v50)
      {
        id v18 = _MSVLogCategoryLyricsTTMLParser();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        *(_WORD *)buf = 0;
        v19 = "Element ignored: <ttm:name> element must be inside <ttm:agent>";
        v20 = v18;
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        uint32_t v22 = 2;
        goto LABEL_7;
      }
      v51 = [(MSVLyricsTTMLParser *)self agents];
      long long v28 = [v51 lastObject];

      if (v28 != v17)
      {
        v96 = [MEMORY[0x1E4F28B00] currentHandler];
        [v96 handleFailureInMethod:a2 object:self file:@"MSVLyricsTTMLParser.m" lineNumber:530 description:@"Unexpected agent element"];
      }
      id v52 = [v12 mutableText];
      [v28 setName:v52];

      [v12 setMutableText:0];
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v37 = [(MSVLyricsTTMLParser *)self _parentTextElement];
    v106 = v37;
    if ([v14 type])
    {
      if ([v14 type] == 1 || objc_msgSend(v14, "type") == 3)
      {
        id v38 = v14;
        v39 = [(MSVLyricsTTMLParser *)self lyricLines];
        objc_msgSend(v38, "setLineIndex:", objc_msgSend(v39, "count"));

        objc_msgSend(v38, "setOriginalLineIndex:", objc_msgSend(v38, "lineIndex"));
        v40 = [(MSVLyricsTTMLParser *)self lyricLines];
        uint64_t v41 = [v40 lastObject];

        if (v41) {
          [v41 setNextLine:v38];
        }
        v104 = v41;
        if ([v38 type] == 3)
        {
          uint64_t v42 = [v17 elementName];
          if (objc_msgSend(v42, "msvl_isElementType:", @"translation"))
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v44 = v17;
              v45 = [(MSVLyricsTTMLParser *)self translationsMap];
              v100 = v44;
              uint64_t v46 = [v44 language];
              v99 = [v45 objectForKeyedSubscript:v46];

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v97 = [MEMORY[0x1E4F28B00] currentHandler];
                [v97 handleFailureInMethod:a2, self, @"MSVLyricsTTMLParser.m", 445, @"At end of <text> element, an MSVLyricsTranslationText object should be top of stack" object file lineNumber description];
              }
              id v101 = v12;
              v47 = [v101 lyricsLineKey];
              if (v47)
              {
                v48 = v99;
                [v99 setObject:v38 forKeyedSubscript:v47];
              }
              else
              {
                log = _MSVLogCategoryLyricsTTMLParser();
                v48 = v99;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  uint64_t v108 = [v9 lineNumber];
                  __int16 v109 = 2112;
                  id v110 = v101;
                  _os_log_impl(&dword_1A30CD000, log, OS_LOG_TYPE_DEFAULT, "Invalid translation text element at line %ld: %@", buf, 0x16u);
                }
              }
            }
            goto LABEL_45;
          }
        }
        else
        {
          uint64_t v42 = [(MSVLyricsTTMLParser *)self lyricLines];
          [v42 addObject:v38];
        }

LABEL_45:
        long long v57 = objc_msgSend(v38, "backgroundVocals", log);

        if (v57)
        {
          long long v58 = [v38 mutableText];
          long long v59 = (void *)[v58 mutableCopy];

          v60 = [v38 backgroundVocals];
          uint64_t v61 = [v60 characterRange];
          objc_msgSend(v59, "deleteCharactersInRange:", v61, v62);

          v102 = v59;
          objc_msgSend(v59, "replaceOccurrencesOfString:withString:options:range:", @"()", &stru_1EF642BA8, 0, 0, objc_msgSend(v59, "length"));
          v63 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          [v59 stringByTrimmingCharactersInSet:v63];
          v65 = v64 = v38;

          v66 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v65];
          [v64 setPrimaryVocalText:v66];

          id v38 = v64;
        }
        objc_opt_class();
        uint64_t v37 = v106;
        if (objc_opt_isKindOfClass())
        {
          v67 = v38;
          v68 = v17;
          v69 = [v68 lines];

          if (!v69)
          {
            v95 = [MEMORY[0x1E4F28B00] currentHandler];
            [v95 handleFailureInMethod:a2 object:self file:@"MSVLyricsTTMLParser.m" lineNumber:474 description:@"-[MSVLyricsSection lines] should never be nil"];
          }
          v70 = [v68 lines];
          v71 = [v70 arrayByAddingObject:v67];
          [v68 setLines:v71];

          id v38 = v67;
          [v67 setParentSection:v68];

          uint64_t v37 = v106;
        }

        goto LABEL_52;
      }
      if ([v14 type] == 2)
      {
        id v81 = v14;
        v103 = [v81 parentLine];
        if (v103 == v37)
        {
          v82 = [v37 words];
          v83 = [v37 mutableText];
          v84 = [(MSVLyricsTTMLParser *)self _updateWords:v82 withWord:v81 parentText:v83];
          [v106 setWords:v84];

          uint64_t v37 = v106;
        }
        v105 = [v81 parentWord];
        if (v105)
        {
          v85 = [v105 subwords];
          v86 = [v105 mutableText];
          v87 = [(MSVLyricsTTMLParser *)self _updateWords:v85 withWord:v81 parentText:v86];
          [v105 setSubwords:v87];

          uint64_t v37 = v106;
          if ([v105 isBackgroundVocal]) {
            [v81 setIsBackgroundVocal:1];
          }
        }
        if (![v81 isBackgroundVocal]) {
          goto LABEL_78;
        }
        v88 = [v81 subwords];
        uint64_t v89 = [v88 count];

        if (!v89) {
          goto LABEL_78;
        }
        if ([v103 hasBackgroundVocal])
        {
          v90 = _MSVLogCategoryLyricsTTMLParser();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            v91 = [v103 lyricsText];
            v92 = [v91 string];
            *(_DWORD *)buf = 138412290;
            uint64_t v108 = (uint64_t)v92;
            _os_log_impl(&dword_1A30CD000, v90, OS_LOG_TYPE_DEFAULT, "Warning: Ignoring additional background vocals for lyrics line \"%@\"", buf, 0xCu);

            uint64_t v37 = v106;
          }
        }
        else
        {
          [v103 setHasBackgroundVocal:1];
          [v103 setBackgroundVocals:v81];
          if ([v81 keepParentheses]) {
            goto LABEL_78;
          }
          v93 = [v81 mutableText];
          int v94 = objc_msgSend(v93, "hasPrefix:", @"(");

          if (!v94) {
            goto LABEL_78;
          }
          v90 = [v81 mutableText];
          [(MSVLyricsTTMLParser *)self _stripParenthesesFromBackgroundVocalWord:v81 backgroundVocalText:v90];
        }

LABEL_78:
      }
    }
    else
    {
      v53 = [(MSVLyricsTTMLParser *)self lyricsInfo];
      v54 = [v53 lyricsSections];
      v55 = [v54 arrayByAddingObject:v14];
      long long v56 = [(MSVLyricsTTMLParser *)self lyricsInfo];
      [v56 setLyricsSections:v55];

      uint64_t v37 = v106;
    }
LABEL_52:
    id v72 = [(MSVLyricsTTMLParser *)self currentTextElement];

    if (v14 == v72)
    {
      v73 = [(MSVLyricsTTMLParser *)self currentTextElement];
      v74 = [v73 lyricsText];

      if (!v74)
      {
        id v75 = objc_alloc(MEMORY[0x1E4F28B18]);
        v76 = [(MSVLyricsTTMLParser *)self currentTextElement];
        v77 = [v76 mutableText];
        v78 = (void *)[v75 initWithString:v77];
        v79 = [(MSVLyricsTTMLParser *)self currentTextElement];
        [v79 setLyricsText:v78];

        uint64_t v37 = v106;
      }
      v80 = [(MSVLyricsTTMLParser *)self currentTextElement];
      [v80 setMutableText:0];

      [(MSVLyricsTTMLParser *)self setCurrentTextElement:v37];
    }

    goto LABEL_23;
  }
  int v17 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    id v18 = [v12 elementName];
    *(_DWORD *)buf = 138412546;
    uint64_t v108 = (uint64_t)v18;
    __int16 v109 = 2112;
    id v110 = v10;
    v19 = "Mismatched element names! start:%@, end:%@";
    v20 = v17;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    uint32_t v22 = 22;
LABEL_7:
    _os_log_impl(&dword_1A30CD000, v20, v21, v19, buf, v22);
LABEL_8:
  }
LABEL_23:
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a7;
  long long v12 = [(MSVLyricsTTMLParser *)self elementStack];
  id v13 = [v12 lastObject];

  if (objc_msgSend(v10, "msvl_isElementType:", @"span"))
  {
    id v14 = objc_opt_new();
    uint64_t v15 = [(MSVLyricsTTMLParser *)self _parentTextElement];
    if ([v15 type] == 1 || objc_msgSend(v15, "type") == 3)
    {
      [v14 setParentLine:v15];
    }
    else
    {
      if ([v15 type] == 2)
      {
        id v17 = v15;
        [v14 setParentWord:v17];
        id v18 = [v17 parentLine];

        [v14 setParentLine:v18];
      }
      else
      {
        id v18 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A30CD000, v18, OS_LOG_TYPE_DEFAULT, "Warning: <span> must be a descendent of <p> or <span>.", buf, 2u);
        }
      }
    }
    goto LABEL_20;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"p"))
  {
    id v14 = objc_opt_new();
    uint64_t v16 = [v11 objectForKeyedSubscript:@"itunes:key"];
    [v14 setTranslationKey:v16];
LABEL_10:

LABEL_20:
    id v24 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"div"))
  {
    id v14 = objc_opt_new();
    uint64_t v16 = [v11 objectForKeyedSubscript:@"itunes:songPart"];
    if (v16) {
      [v14 setSongPartText:v16];
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"body"))
  {
    v19 = [v11 objectForKeyedSubscript:@"dur"];
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "msvl_timeValue");
      double v22 = v21;
      v23 = [(MSVLyricsTTMLParser *)self lyricsInfo];
      [v23 setSongDuration:v22];

LABEL_80:
      goto LABEL_81;
    }
    v67 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A30CD000, v67, OS_LOG_TYPE_DEFAULT, "Warning: Document body element must specify song duration", buf, 2u);
    }
LABEL_79:

    goto LABEL_80;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"tt"))
  {
    id v52 = objc_opt_new();
    [(MSVLyricsTTMLParser *)self setLyricsInfo:v52];

    v53 = [v11 objectForKeyedSubscript:@"itunes:lyricGenId"];
    v54 = [(MSVLyricsTTMLParser *)self lyricsInfo];
    [v54 setLyricGenId:v53];

    v55 = [v11 objectForKeyedSubscript:@"xml:lang"];
    long long v56 = [(MSVLyricsTTMLParser *)self lyricsInfo];
    [v56 setLanguage:v55];

    long long v57 = [(MSVLyricsTTMLParser *)self lyricsInfo];
    long long v58 = [v57 songwriters];

    if (!v58)
    {
      uint64_t v111 = [MEMORY[0x1E4F28B00] currentHandler];
      [v111 handleFailureInMethod:a2 object:self file:@"MSVLyricsTTMLParser.m" lineNumber:209 description:@"songwriters array must not be nil"];
    }
    long long v59 = [(MSVLyricsTTMLParser *)self lyricsInfo];
    v60 = [v59 lyricsSections];

    if (!v60)
    {
      v112 = [MEMORY[0x1E4F28B00] currentHandler];
      [v112 handleFailureInMethod:a2 object:self file:@"MSVLyricsTTMLParser.m" lineNumber:210 description:@"lyricsSections array must not be nil"];
    }
    uint64_t v61 = [v11 objectForKeyedSubscript:@"itunes:timing"];
    v20 = v61;
    if (v61)
    {
      if ([v61 caseInsensitiveCompare:@"line"]) {
        uint64_t v62 = 2 * ([v20 caseInsensitiveCompare:@"word"] == 0);
      }
      else {
        uint64_t v62 = 1;
      }
    }
    else
    {
      uint64_t v62 = 0;
    }
    v67 = [(MSVLyricsTTMLParser *)self lyricsInfo];
    [v67 setType:v62];
    goto LABEL_79;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"songwriters"))
  {
    v63 = [v13 elementName];
    char v64 = objc_msgSend(v63, "msvl_isElementType:", @"iTunesMetadata");

    if ((v64 & 1) == 0)
    {
      v65 = _MSVLogCategoryLyricsTTMLParser();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v66 = "Warning: <songwriters> element should be inside <iTunesMetadata>";
LABEL_102:
        _os_log_impl(&dword_1A30CD000, v65, OS_LOG_TYPE_DEFAULT, v66, buf, 2u);
        goto LABEL_103;
      }
      goto LABEL_103;
    }
LABEL_81:
    id v14 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"audio"))
  {
    v68 = [v13 elementName];
    char v69 = objc_msgSend(v68, "msvl_isElementType:", @"iTunesMetadata");

    if ((v69 & 1) == 0)
    {
      v70 = _MSVLogCategoryLyricsTTMLParser();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A30CD000, v70, OS_LOG_TYPE_DEFAULT, "Warning: <audio> element should be inside <iTunesMetadata>", buf, 2u);
      }
    }
    v20 = objc_opt_new();
    v71 = [v11 objectForKeyedSubscript:@"lyricOffset"];
    id v72 = v71;
    if (v71)
    {
      objc_msgSend(v71, "msvl_timeValue");
      objc_msgSend(v20, "setLyricsOffset:");
    }
    v73 = [v11 objectForKeyedSubscript:@"role"];
    [v20 setRole:v73];

    v74 = [v20 role];
    objc_msgSend(v20, "setSpatialRole:", objc_msgSend(v74, "isEqualToString:", @"spatial"));

    id v75 = [(MSVLyricsTTMLParser *)self lyricsInfo];
    [v75 setAudioAttributes:v20];

    goto LABEL_80;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"songwriter"))
  {
    v76 = [v13 elementName];
    int v77 = objc_msgSend(v76, "msvl_isElementType:", @"songwriters");

    if (!v77)
    {
      v65 = _MSVLogCategoryLyricsTTMLParser();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v66 = "Warning: <songwriter> element must be inside <songwriters>";
        goto LABEL_102;
      }
LABEL_103:

      goto LABEL_81;
    }
    id v24 = (id)objc_opt_new();
    v78 = [v11 objectForKeyedSubscript:@"artistId"];
    [v24 setArtistID:v78];

    v79 = [(MSVLyricsTTMLParser *)self lyricsInfo];
    v80 = [v79 songwriters];
    id v81 = [v80 arrayByAddingObject:v24];

    v82 = [(MSVLyricsTTMLParser *)self lyricsInfo];
    [v82 setSongwriters:v81];

    goto LABEL_75;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"translations"))
  {
    v83 = [v13 elementName];
    char v84 = objc_msgSend(v83, "msvl_isElementType:", @"iTunesMetadata");

    if ((v84 & 1) == 0)
    {
      v85 = _MSVLogCategoryLyricsTTMLParser();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A30CD000, v85, OS_LOG_TYPE_DEFAULT, "Warning: <translations> element should be inside <iTunesMetadata>", buf, 2u);
      }
    }
    v86 = [MEMORY[0x1E4F1CA60] dictionary];
    [(MSVLyricsTTMLParser *)self setTranslationsMap:v86];

    goto LABEL_81;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"translation"))
  {
    v87 = [v13 elementName];
    int v88 = objc_msgSend(v87, "msvl_isElementType:", @"translations");

    if (!v88)
    {
      v65 = _MSVLogCategoryLyricsTTMLParser();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v66 = "Warning: <translation> element must be inside <translations>";
        goto LABEL_102;
      }
      goto LABEL_103;
    }
    uint64_t v89 = [(MSVLyricsTTMLParser *)self translationsMap];

    if (!v89)
    {
      v113 = [MEMORY[0x1E4F28B00] currentHandler];
      [v113 handleFailureInMethod:a2 object:self file:@"MSVLyricsTTMLParser.m" lineNumber:265 description:@"<translation> end element expects translationsMap to be set by start of <translations> element"];
    }
    v90 = [v11 objectForKeyedSubscript:@"xml:lang"];
    if (v90)
    {
      id v24 = (id)objc_opt_new();
      [v24 setLanguage:v90];
      v91 = [(MSVLyricsTTMLParser *)self translationsMap];
      v92 = [v91 objectForKeyedSubscript:v90];

      if (!v92)
      {
        v93 = [MEMORY[0x1E4F1CA60] dictionary];
        int v94 = [(MSVLyricsTTMLParser *)self translationsMap];
        [v94 setObject:v93 forKeyedSubscript:v90];
      }
    }
    else
    {
      v106 = _MSVLogCategoryLyricsTTMLParser();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A30CD000, v106, OS_LOG_TYPE_DEFAULT, "<translation> element must specify a language with <xml:lang> attribute", buf, 2u);
      }

      id v24 = 0;
    }

    goto LABEL_76;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"text"))
  {
    v95 = [v13 elementName];
    int v96 = objc_msgSend(v95, "msvl_isElementType:", @"translation");

    if (v96)
    {
      id v14 = objc_opt_new();
      uint64_t v16 = [v11 objectForKeyedSubscript:@"for"];
      [v14 setLyricsLineKey:v16];
      goto LABEL_10;
    }
    goto LABEL_81;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"iTunesMetadata"))
  {
    v97 = [v11 objectForKeyedSubscript:@"leadingSilence"];
    v65 = v97;
    if (v97)
    {
      [v97 msvl_timeValue];
      double v99 = v98;
      v100 = [(MSVLyricsTTMLParser *)self lyricsInfo];
      [v100 setLeadingSilence:v99];
    }
    goto LABEL_103;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", @"agent"))
  {
    id v101 = [v13 elementName];
    char v102 = objc_msgSend(v101, "msvl_isElementType:", @"metadata");

    if ((v102 & 1) == 0)
    {
      v103 = _MSVLogCategoryLyricsTTMLParser();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A30CD000, v103, OS_LOG_TYPE_DEFAULT, "Warning: <ttm:agent> element should be inside <metadata>", buf, 2u);
      }
    }
    id v24 = (id)objc_opt_new();
    v104 = [v11 objectForKeyedSubscript:@"type"];
    [v24 setType:v104];

    v105 = [v11 objectForKeyedSubscript:@"itunes:artistId"];
    [v24 setArtistID:v105];

    v79 = [(MSVLyricsTTMLParser *)self agents];
    [v79 addObject:v24];
LABEL_75:

LABEL_76:
    id v14 = 0;
    goto LABEL_21;
  }
  if (!objc_msgSend(v10, "msvl_isElementType:", @"name")) {
    goto LABEL_81;
  }
  v107 = [v13 elementName];
  int v108 = objc_msgSend(v107, "msvl_isElementType:", @"agent");

  if (v108)
  {
    id v24 = (id)objc_opt_new();
    __int16 v109 = [MEMORY[0x1E4F28E78] string];
    [v24 setMutableText:v109];

    id v14 = 0;
  }
  else
  {
    id v110 = _MSVLogCategoryLyricsTTMLParser();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A30CD000, v110, OS_LOG_TYPE_DEFAULT, "<ttm:name> element should be inside <ttm:agent>", buf, 2u);
    }

    id v14 = 0;
    id v24 = 0;
  }
LABEL_21:
  id v25 = [(MSVLyricsTTMLParser *)self lyricsInfo];

  if (v25)
  {
    if (v14)
    {
LABEL_23:
      v115 = v13;
      id v26 = v14;

      long long v27 = [v11 objectForKeyedSubscript:@"begin"];
      long long v28 = v27;
      if (v27)
      {
        objc_msgSend(v27, "msvl_timeValue");
        objc_msgSend(v26, "setStartTime:");
      }
      long long v29 = [v11 objectForKeyedSubscript:@"end"];
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "msvl_timeValue");
        objc_msgSend(v26, "setEndTime:");
      }
      [v26 endTime];
      if (v31 != 0.0)
      {
        [v26 startTime];
        double v33 = v32;
        [(MSVLyricsTTMLParser *)self currentStartTime];
        if (v33 < v34) {
          [(MSVLyricsTTMLParser *)self setLinesAreSortedByStartTime:0];
        }
        [v26 startTime];
        -[MSVLyricsTTMLParser setCurrentStartTime:](self, "setCurrentStartTime:");
      }
      id v116 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(MSVLyricsTTMLParser *)self setCurrentTextElement:v26];
      }
      uint64_t v35 = [v11 objectForKeyedSubscript:@"ttm:agent"];
      if (v35)
      {
        id v114 = v11;
        uint64_t v36 = [(MSVLyricsTTMLParser *)self agents];
        v117[0] = MEMORY[0x1E4F143A8];
        v117[1] = 3221225472;
        v117[2] = __84__MSVLyricsTTMLParser_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke;
        v117[3] = &unk_1E5AD96C0;
        id v37 = v35;
        id v118 = v37;
        uint64_t v38 = [v36 indexOfObjectPassingTest:v117];

        if (v38 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = self;
          v40 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v120 = v37;
            __int16 v121 = 2112;
            id v122 = v26;
            _os_log_impl(&dword_1A30CD000, v40, OS_LOG_TYPE_DEFAULT, "No agent exists for identifier \"%@\" in element: %@", buf, 0x16u);
          }
        }
        else
        {
          v39 = self;
          v40 = [(MSVLyricsTTMLParser *)self agents];
          uint64_t v42 = [v40 objectAtIndexedSubscript:v38];
          [v26 setAgent:v42];
        }
        id v11 = v114;
        self = v39;
      }
      uint64_t v43 = [v11 objectForKeyedSubscript:@"ttm:role"];
      [v26 setRole:v43];

      v44 = [v26 role];
      objc_msgSend(v26, "setIsBackgroundVocal:", objc_msgSend(v44, "isEqualToString:", @"x-bg"));

      uint64_t v45 = [v11 objectForKeyedSubscript:@"itunes:parenthesis"];
      if (v45)
      {
        uint64_t v46 = (void *)v45;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v48 = [v11 objectForKeyedSubscript:@"itunes:parenthesis"];
          uint64_t v49 = [v48 isEqualToString:@"keep"];

          [v26 setKeepParentheses:v49];
        }
      }

      id v13 = v115;
      id v10 = v116;
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v41 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A30CD000, v41, OS_LOG_TYPE_ERROR, "PARSE ERROR: Top-level element must be <tt> for TTML documents", buf, 2u);
    }

    if (v14) {
      goto LABEL_23;
    }
  }
  id v26 = v24;
  if (!v24) {
    id v26 = (id)objc_opt_new();
  }
LABEL_48:
  [v26 setElementName:v10];
  int v50 = [v11 objectForKeyedSubscript:@"xml:id"];
  [v26 setIdentifier:v50];

  v51 = [(MSVLyricsTTMLParser *)self elementStack];
  [v51 addObject:v26];
}

uint64_t __84__MSVLyricsTTMLParser_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)parseWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MSVLyricsTTMLParser *)self parseQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__MSVLyricsTTMLParser_parseWithCompletion___block_invoke;
  v7[3] = &unk_1E5ADAA50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__MSVLyricsTTMLParser_parseWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v7 = 0;
  id v3 = (id)[v2 parseWithError:&v7];
  id v4 = v7;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(void, void, id))(v5 + 16))(*(void *)(a1 + 40), 0, v4);
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) lyricsInfo];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
}

- (id)parseWithError:(id *)a3
{
  [(MSVLyricsTTMLParser *)self setLinesAreSortedByStartTime:1];
  [(MSVLyricsTTMLParser *)self setCurrentStartTime:0.0];
  uint64_t v5 = [(MSVLyricsTTMLParser *)self elementStack];
  [v5 removeAllObjects];

  id v6 = [(MSVLyricsTTMLParser *)self lyricLines];
  [v6 removeAllObjects];

  id v7 = objc_alloc(MEMORY[0x1E4F29250]);
  id v8 = [(MSVLyricsTTMLParser *)self inputStream];
  id v9 = (void *)[v7 initWithStream:v8];

  [v9 setDelegate:self];
  [v9 setShouldProcessNamespaces:1];
  [v9 parse];
  id v10 = [(MSVLyricsTTMLParser *)self translationsMap];

  if (v10)
  {
    id v11 = [(MSVLyricsTTMLParser *)self translationsMap];
    long long v12 = [(MSVLyricsTTMLParser *)self lyricsInfo];
    [v12 setTranslationsMap:v11];
  }
  if (a3)
  {
    id v13 = [(MSVLyricsTTMLParser *)self parserError];

    if (v13)
    {
      *a3 = [(MSVLyricsTTMLParser *)self parserError];
    }
  }
  id v14 = [(MSVLyricsTTMLParser *)self lyricsInfo];

  return v14;
}

- (MSVLyricsTTMLParser)initWithTTMLStream:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MSVLyricsTTMLParser;
  id v6 = [(MSVLyricsTTMLParser *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputStream, a3);
    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaServices.MSVLyricsTTMLParser", v8);
    parseQueue = v7->_parseQueue;
    v7->_parseQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    elementStack = v7->_elementStack;
    v7->_elementStack = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:100];
    lyricLines = v7->_lyricLines;
    v7->_lyricLines = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    agents = v7->_agents;
    v7->_agents = (NSMutableArray *)v15;
  }
  return v7;
}

- (MSVLyricsTTMLParser)initWithTTMLData:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA10];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithData:v5];

  id v7 = [(MSVLyricsTTMLParser *)self initWithTTMLStream:v6];
  return v7;
}

@end