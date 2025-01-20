@interface DBTDuxburyBrailleTranslator
+ (_NSRange)_mappedRange:(_NSRange)a3 withPreprocessedMap:(id)a4;
- (BOOL)_loadTable:(id)a3 translationHandle:(void *)a4 backTranslationHandle:(void *)a5;
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsTechnicalBraille;
- (DBTDuxburyBrailleTranslator)init;
- (id)_eightDotPrintBrailleForText:(id)a3 locations:(id *)a4 textFormattingRanges:(id)a5;
- (id)_eightDotTextForPrintBraille:(id)a3 locations:(id *)a4;
- (id)_newPrintPreprocessorsForTable:(id)a3 primaryLanguageCode:(id)a4;
- (id)_printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)_printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7 optimize:(BOOL)a8;
- (id)_scrubDollarCodesInBuffer:(int *)a3 originalLength:(unint64_t)a4 originalLocations:(id)a5 newLocations:(id)a6 convertASCIIBrailleToUnicode:(BOOL)a7 limitRange:(_NSRange)a8;
- (id)_tableInfoForKey:(id)a3;
- (id)_textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (id)_textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 optimize:(BOOL)a6;
- (id)activeTable;
- (id)printBrailleForTechnicalText:(id)a3 useTechnicalTable:(BOOL)a4 locations:(id *)a5;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (unint64_t)_prepBuffersForConversion:(BOOL)a3 withString:(id)a4 mode:(unint64_t)a5 prefixLength:(unint64_t)a6;
- (unint64_t)interfaceVersion;
- (void)_eightDotTablesFromRawTable:(id)a3 translationTable:(id *)a4 backTranslationTable:(id *)a5;
- (void)_populatePrintBrailleForTextLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 translationHandle:(void *)a6 offsetToBraille:(unsigned __int16)a7 prefixCodeLength:(unsigned __int16)a8 preprocessedMap:(id)a9 optimize:(BOOL)a10;
- (void)_populateTextForPrintBrailleLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 offsetToBraille:(unsigned __int16)a6 prefixLength:(unint64_t)a7;
- (void)_populateTextForPrintBrailleLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 offsetToBraille:(unsigned __int16)a6 prefixLength:(unint64_t)a7 optimize:(BOOL)a8;
- (void)_unloadTables;
- (void)_unloadTechnicalTable;
- (void)dealloc;
- (void)loadNemethTable;
- (void)setActiveTable:(id)a3;
@end

@implementation DBTDuxburyBrailleTranslator

- (DBTDuxburyBrailleTranslator)init
{
  v6.receiver = self;
  v6.super_class = (Class)DBTDuxburyBrailleTranslator;
  v2 = [(DBTDuxburyBrailleTranslator *)&v6 init];
  if (v2)
  {
    v3 = (DBTComposedCharactersPreprocessor *)[objc_allocWithZone((Class)DBTComposedCharactersPreprocessor) init];
    composedCharacterPreprocessor = v2->_composedCharacterPreprocessor;
    v2->_composedCharacterPreprocessor = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(DBTDuxburyBrailleTranslator *)self _unloadTables];
  [(DBTDuxburyBrailleTranslator *)self _unloadTechnicalTable];
  DBTWideCharBufferFree(self->_inBuffer);
  DBTWideCharBufferFree(self->_outBuffer);
  DBTWideCharBufferFree(self->_tmpBuffer);
  v3.receiver = self;
  v3.super_class = (Class)DBTDuxburyBrailleTranslator;
  [(DBTDuxburyBrailleTranslator *)&v3 dealloc];
}

- (void)_unloadTables
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_0, v0, v1, "DX Error %d", v2, v3, v4, v5, v6);
}

- (void)_unloadTechnicalTable
{
  uint64_t v3 = DBTLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Begin unloading technical table", buf, 2u);
  }

  technicalTranslationHandle = self->_technicalTranslationHandle;
  if (technicalTranslationHandle)
  {
    if (BRLTRN_Destroy(technicalTranslationHandle))
    {
      uint64_t v5 = DBTLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[DBTDuxburyBrailleTranslator _unloadTables]();
      }
    }
    self->_technicalTranslationHandle = 0;
  }
  technicalBackTranslationHandle = self->_technicalBackTranslationHandle;
  if (technicalBackTranslationHandle)
  {
    if (BRLTRN_Destroy(technicalBackTranslationHandle))
    {
      v7 = DBTLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[DBTDuxburyBrailleTranslator _unloadTables]();
      }
    }
    self->_technicalBackTranslationHandle = 0;
  }
  v8 = DBTLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "End unloading technical table", v9, 2u);
  }
}

- (id)_tableInfoForKey:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 6)
  {
    uint64_t v4 = objc_msgSend(v3, "substringWithRange:", (char *)objc_msgSend(v3, "length") - 5, 5);
    if ([&off_353B8 containsObject:v4])
    {
      uint64_t v5 = -5;
      goto LABEL_8;
    }
  }
  uint8_t v6 = v3;
  if ((unint64_t)[v3 length] < 4) {
    goto LABEL_11;
  }
  uint64_t v4 = objc_msgSend(v3, "substringWithRange:", (char *)objc_msgSend(v3, "length") - 3, 3);
  if (![&off_353D0 containsObject:v4])
  {
    uint8_t v6 = v3;
    goto LABEL_10;
  }
  uint64_t v5 = -3;
LABEL_8:
  uint8_t v6 = objc_msgSend(v3, "substringToIndex:", (char *)objc_msgSend(v3, "length") + v5);

LABEL_10:
LABEL_11:
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 pathForResource:@"Tables" ofType:@"plist"];
  if (v8)
  {
    id v9 = [objc_allocWithZone((Class)NSDictionary) initWithContentsOfFile:v8];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 objectForKey:v6];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_newPrintPreprocessorsForTable:(id)a3 primaryLanguageCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSMutableArray array];
  v8 = objc_opt_new();
  [v7 addObject:v8];

  if ([v5 isEqualToString:@"jpn"])
  {
    id v9 = objc_opt_new();
    [v7 addObject:v9];
    v10 = objc_opt_new();
    [v10 setStringTransform:kCFStringTransformLatinHiragana];
    [v7 addObject:v10];
  }
  if (([v5 isEqualToString:@"zh-cn"] & 1) != 0
    || [v5 isEqualToString:@"zh-tw"])
  {
    v11 = objc_opt_new();
    [v11 setTokenizerUnit:1];
    [v7 addObject:v11];
    v12 = objc_opt_new();
    [v12 setStringTransform:kCFStringTransformMandarinLatin];
    [v12 setCharacterLevelStringTransform:NSStringTransformMandarinToLatin];
    [v7 addObject:v12];
  }
  id v13 = [objc_alloc((Class)BRLTEmojiPrintPreprocessor) initWithPrimaryLanguageCode:v6];

  [v7 addObject:v13];
  v14 = objc_opt_new();
  [v7 addObject:v14];

  return v7;
}

- (unint64_t)_prepBuffersForConversion:(BOOL)a3 withString:(id)a4 mode:(unint64_t)a5 prefixLength:(unint64_t)a6
{
  id v9 = a4;
  id v10 = [v9 length];
  if ((unint64_t)v10 + 4 >= self->_inBufferLen)
  {
    DBTWideCharBufferFree(self->_inBuffer);
    DBTWideCharBufferFree(self->_outBuffer);
    DBTWideCharBufferFree(self->_tmpBuffer);
    unint64_t v11 = 4 * ((void)v10 + 20);
    self->_inBufferLen = (unint64_t)v10 + 20;
    self->_outBufferLen = v11;
    self->_tmpBufferLen = v11;
    self->_inBuffer = (int *)DBTWideCharBufferOfLength((size_t)v10 + 20, 1);
    self->_outBuffer = (int *)DBTWideCharBufferOfLength(self->_outBufferLen, 1);
    self->_tmpBuffer = (int *)DBTWideCharBufferOfLength(self->_tmpBufferLen, 1);
  }
  if (a5 == 4)
  {
    v12 = &_TechnicalPrefix;
    if (!a6) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (self->_supportsContraction)
  {
    v12 = (int *)&_UnContractedPrefix;
    if (a5 == 3) {
      v12 = (int *)&_ContractedGrade2Prefix;
    }
    if (a6)
    {
LABEL_10:
      inBuffer = self->_inBuffer;
      unint64_t v14 = a6;
      do
      {
        int v15 = *v12++;
        *inBuffer++ = v15;
        --v14;
      }
      while (v14);
    }
  }
LABEL_12:
  DBTAppendNSStringIntoWideCharBufferAtOffset(v9, (uint64_t)self->_inBuffer, a6);

  return (unint64_t)v10;
}

- (unint64_t)interfaceVersion
{
  return 7;
}

- (void)setActiveTable:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:self->_activeTable] & 1) == 0)
  {
    [(DBTDuxburyBrailleTranslator *)self _unloadTables];
    if ([(DBTDuxburyBrailleTranslator *)self _loadTable:v4 translationHandle:&self->_translationHandle backTranslationHandle:&self->_backTranslationHandle])
    {
      id v5 = +[NSBundle bundleForClass:objc_opt_class()];
      id v6 = [(DBTDuxburyBrailleTranslator *)self _tableInfoForKey:v4];
      v7 = [v6 objectForKey:@"8dot"];
      if ([v7 length])
      {
        v8 = [v5 pathForResource:v7 ofType:@"plist"];
        id v9 = +[NSDictionary dictionaryWithContentsOfFile:v8];
        id v10 = [v9 objectForKey:@"Table"];
        [(DBTDuxburyBrailleTranslator *)self _eightDotTablesFromRawTable:v10 translationTable:&self->_eightDotTranslationTable backTranslationTable:&self->_eightDotBackTranslationTable];
      }
      unint64_t v11 = [v5 objectForInfoDictionaryKey:@"BrailleTables"];
      v12 = [v11 objectForKey:v4];
      id v13 = [v12 objectForKey:@"contracted"];
      self->_contracted = [v13 BOOLValue];

      unint64_t v14 = [v12 objectForKey:@"uncontracted"];
      BOOL v15 = ([v14 BOOLValue] & 1) != 0 || self->_contracted;
      self->_supportsContraction = v15;

      v16 = [v12 objectForKey:@"supportsTechnical"];
      self->_supportsTechnical = [v16 BOOLValue];

      v17 = [v12 objectForKey:@"supports8dot"];
      BOOL v18 = [v17 BOOLValue]
         && [(NSDictionary *)self->_eightDotTranslationTable count]
         && [(NSDictionary *)self->_eightDotBackTranslationTable count] != 0;
      self->_supportsEightDot = v18;

      v19 = [v12 objectForKey:@"supportsIPA"];
      self->_supportsIPA = [v19 BOOLValue];

      v20 = [v12 objectForKey:@"languages"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [v20 firstObject];
      }
      else
      {
        v22 = DBTLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[DBTDuxburyBrailleTranslator setActiveTable:]((uint64_t)v4, v22);
        }

        v21 = 0;
      }
      v23 = [(DBTDuxburyBrailleTranslator *)self _newPrintPreprocessorsForTable:v4 primaryLanguageCode:v21];
      printPreprocessors = self->_printPreprocessors;
      self->_printPreprocessors = v23;

      v25 = (NSString *)[v4 copy];
      activeTable = self->_activeTable;
      self->_activeTable = v25;
    }
    else
    {
      [(DBTDuxburyBrailleTranslator *)self _unloadTables];
    }
  }
}

- (void)loadNemethTable
{
  if (!self->_technicalTranslationHandle
    && ![(DBTDuxburyBrailleTranslator *)self _loadTable:@"nemeth" translationHandle:&self->_technicalTranslationHandle backTranslationHandle:&self->_technicalBackTranslationHandle])
  {
    [(DBTDuxburyBrailleTranslator *)self _unloadTechnicalTable];
  }
}

- (BOOL)_loadTable:(id)a3 translationHandle:(void *)a4 backTranslationHandle:(void *)a5
{
  id v8 = a3;
  id v9 = [(DBTDuxburyBrailleTranslator *)self _tableInfoForKey:v8];
  id v10 = DBTLog();
  unint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Begin loading tables %@", buf, 0xCu);
    }

    unint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 resourcePath];
    id v13 = DBTWideCharBufferOfFullPath(v12, @"chitab", @"txt");
    v38 = a5;
    v39 = v9;
    if (a4)
    {
      id v37 = v8;
      unint64_t v14 = v13;
      BOOL v15 = [v9 objectForKey:@"trans"];
      v16 = [v15 objectForKey:@"btb"];
      v17 = [v15 objectForKey:@"sct"];
      *(void *)buf = 0;
      BOOL v18 = DBTWideCharBufferOfFullPath(v12, (uint64_t)v16, @"btb");
      v19 = DBTWideCharBufferOfFullPath(v12, (uint64_t)v17, @"sct");
      v36 = v14;
      int v20 = BRLTRN_CreateW(v18, v19, (uint64_t *)buf, 0, v14);
      DBTWideCharBufferFree(v18);
      DBTWideCharBufferFree(v19);
      if (v20)
      {
        v21 = DBTLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[DBTDuxburyBrailleTranslator _unloadTables]();
        }

        DBTWideCharBufferFree(v14);
        BOOL v22 = 0;
        id v8 = v37;
        goto LABEL_21;
      }
      v33 = *(_DWORD **)buf;
      *(_DWORD *)(*(void *)buf + 240) = 0;
      v33[73] = 4;
      *a4 = v33;

      v23 = v16;
      v24 = v17;
      id v8 = v37;
      id v13 = v14;
      id v9 = v39;
      if (!v38) {
        goto LABEL_18;
      }
    }
    else
    {
      v23 = 0;
      v24 = 0;
      if (!a5)
      {
LABEL_18:
        v16 = v23;
        v17 = v24;
LABEL_20:
        DBTWideCharBufferFree(v13);
        BOOL v22 = 1;
LABEL_21:

        id v9 = v39;
        goto LABEL_22;
      }
    }
    v25 = v13;
    v26 = objc_msgSend(v9, "objectForKey:", @"back", v36);
    v16 = [v26 objectForKey:@"btb"];

    uint64_t v27 = [v26 objectForKey:@"sct"];

    *(void *)buf = 0;
    v28 = DBTWideCharBufferOfFullPath(v12, (uint64_t)v16, @"btb");
    v29 = DBTWideCharBufferOfFullPath(v12, v27, @"sct");
    int v30 = BRLTRN_CreateW(v28, v29, (uint64_t *)buf, 0, v25);
    DBTWideCharBufferFree(v28);
    DBTWideCharBufferFree(v29);
    if (v30)
    {
      id v31 = v8;
      v32 = DBTLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[DBTDuxburyBrailleTranslator _unloadTables]();
      }

      DBTWideCharBufferFree(v25);
      BOOL v22 = 0;
      id v8 = v31;
      v17 = (void *)v27;
      goto LABEL_21;
    }
    v34 = *(_DWORD **)buf;
    *(_DWORD *)(*(void *)buf + 240) = 0;
    v34[73] = 4;
    *v38 = v34;

    id v13 = v25;
    v17 = (void *)v27;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[DBTDuxburyBrailleTranslator _loadTable:translationHandle:backTranslationHandle:]((uint64_t)v8, v11);
  }
  BOOL v22 = 0;
LABEL_22:

  return v22;
}

- (id)activeTable
{
  return self->_activeTable;
}

- (BOOL)activeTableSupportsContractedBraille
{
  return self->_supportsContraction;
}

- (BOOL)activeTableSupportsIPA
{
  return self->_supportsIPA;
}

- (BOOL)activeTableSupportsEightDotBraille
{
  return self->_supportsEightDot;
}

- (BOOL)activeTableSupportsTechnicalBraille
{
  return self->_supportsTechnical;
}

- (void)_populatePrintBrailleForTextLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 translationHandle:(void *)a6 offsetToBraille:(unsigned __int16)a7 prefixCodeLength:(unsigned __int16)a8 preprocessedMap:(id)a9 optimize:(BOOL)a10
{
  unsigned int v10 = a8;
  int v11 = a7;
  v57 = a3;
  unsigned __int16 v59 = a7;
  id v56 = a9;
  size_t v54 = 8 * a5;
  v16 = (char *)malloc_type_malloc(8 * a5, 0xEFF2D337uLL);
  v17 = (char *)&v53 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v17, 4 * a4);
  v55 = &v53;
  if (a4)
  {
    BOOL v18 = (_DWORD *)((char *)&v53 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v19 = a4;
    do
    {
      *v18++ = v11 - v10;
      --v19;
    }
    while (v19);
    bzero(self->_tmpBuffer, self->_tmpBufferLen);
    if (!a10)
    {
      uint64_t v20 = v10;
      inBuffer = self->_inBuffer;
      unint64_t v22 = a4;
      v23 = (_DWORD *)((char *)&v53 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
      while (1)
      {
        int v24 = BRLTRN_TranslateString(a6, inBuffer, (unint64_t)self->_tmpBuffer, LOWORD(self->_tmpBufferLen), (unsigned __int16)v20, &v59);
        inBuffer = self->_inBuffer;
        int v25 = inBuffer[v20] == 31 ? *(v23 - 1) : v59 - v10;
        _DWORD *v23 = v25;
        if (v24) {
          goto LABEL_25;
        }
        ++v23;
        ++v20;
        if (!--v22) {
          goto LABEL_26;
        }
      }
    }
  }
  else
  {
    bzero(self->_tmpBuffer, self->_tmpBufferLen);
    if (!a10) {
      goto LABEL_26;
    }
  }
  v58 = 0;
  int LocationMap = BRLTRN_TranslateStringAndGetLocationMap(a6, self->_inBuffer, (unint64_t)self->_tmpBuffer, LOWORD(self->_tmpBufferLen), &v58);
  uint64_t v27 = v58;
  if (LocationMap) {
    BOOL v28 = 1;
  }
  else {
    BOOL v28 = a4 == 0;
  }
  if (!v28)
  {
    v29 = &v58[2 * v10];
    int v30 = &self->_inBuffer[v10];
    unint64_t v31 = a4;
    v32 = (unsigned int *)((char *)&v53 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      int v33 = *v30++;
      if (v33 == 31) {
        unsigned int v34 = *(v32 - 1);
      }
      else {
        unsigned int v34 = *(unsigned __int16 *)v29 - v10;
      }
      *v32++ = v34;
      v29 += 2;
      --v31;
    }
    while (v31);
  }
  if (v27) {
    free(v27);
  }
  if (LocationMap)
  {
LABEL_25:
    size_t v35 = v54;
    bzero(v16, v54);
    id v37 = v56;
    v36 = v57;
    goto LABEL_50;
  }
LABEL_26:
  id v37 = v56;
  v38 = [v56 bytes];
  unint64_t v39 = a4 - 1;
  v36 = v57;
  size_t v35 = v54;
  if ((uint64_t)(a4 - 1) >= 0)
  {
    char v40 = 0;
    char v41 = 0;
    v42 = self->_inBuffer;
    unint64_t v43 = a5;
    do
    {
      unint64_t v44 = a4;
      a4 = v39;
      if (v39 && *(_DWORD *)&v17[4 * v39] == *(_DWORD *)&v17[4 * v44 - 8])
      {
        if (v39 >= 3 && v42[v44 - 2 + v10] == 31 && v42[v10 - 3 + v44] == 101 && v42[v10 - 4 + v44] != 28)
        {
          char v45 = 0;
          char v41 = 1;
        }
        else
        {
          char v45 = 1;
        }
      }
      else
      {
        char v45 = 0;
      }
      int v46 = v42[v39 + v10];
      char v47 = v40 | (v46 == 31) & v41;
      if ((v45 & 1) == 0 && (v47 & 1) == 0)
      {
        unint64_t v48 = *(int *)&v17[4 * a4];
        if (v43 >= a5) {
          unint64_t v43 = a5;
        }
        BOOL v49 = v43 > v48;
        unint64_t v50 = v43 - v48;
        if (v49)
        {
          v51 = (unint64_t *)&v16[8 * v48];
          do
          {
            unint64_t v52 = a4;
            if (v38) {
              unint64_t v52 = v38[a4];
            }
            *v51++ = v52;
            --v50;
          }
          while (v50);
        }
        unint64_t v43 = v48;
      }
      v41 &= v46 != 31;
      char v40 = (v46 != 28) & v47;
      unint64_t v39 = a4 - 1;
    }
    while ((uint64_t)a4 > 0);
  }
LABEL_50:
  id *v36 = +[NSData dataWithBytes:v16 length:v35];
  free(v16);
}

- (id)_scrubDollarCodesInBuffer:(int *)a3 originalLength:(unint64_t)a4 originalLocations:(id)a5 newLocations:(id)a6 convertASCIIBrailleToUnicode:(BOOL)a7 limitRange:(_NSRange)a8
{
  BOOL v8 = a7;
  v12 = (char *)a5;
  id v13 = a6;
  v23 = v12;
  if (v12) {
    v12 = (char *)[v12 bytes];
  }
  uint64_t v14 = 0;
  if (a4)
  {
    unint64_t v15 = 0;
    do
    {
      unsigned int v16 = a3[v15];
      if (v16 != 28 || v15 >= a4)
      {
LABEL_12:
        if (v8) {
          unsigned int v16 = ASCIIBrailleToUnicode(v16);
        }
        a3[v14++] = v16;
        if (v12)
        {
          if (a8.location == 0x7FFFFFFFFFFFFFFFLL
            || ((v19 = *(void *)&v12[8 * v15], v19 >= a8.location) ? (BOOL v20 = v19 > a8.location + a8.length) : (BOOL v20 = 1),
                !v20))
          {
            [v13 appendBytes:&v12[8 * v15] length:8];
          }
        }
      }
      else
      {
        unint64_t v18 = v15;
        while (a3[v18] != 31)
        {
          if (a4 == ++v18) {
            goto LABEL_12;
          }
        }
        unint64_t v15 = v18;
      }
      ++v15;
    }
    while (v15 < a4);
  }
  v21 = DBTNSStringFromWideCharBuffer(a3, v14);

  return v21;
}

+ (_NSRange)_mappedRange:(_NSRange)a3 withPreprocessedMap:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v9 = v6;
    unsigned int v10 = [v9 bytes];
    unint64_t v11 = (unint64_t)[v9 length];
    unint64_t v12 = v11 >> 3;
    if (v11 < 8)
    {
LABEL_9:
      unint64_t v8 = location;
    }
    else
    {
      unint64_t v8 = 0;
      if (v12 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v11 >> 3;
      }
      while (v10[v8] < location)
      {
        if (v13 == ++v8) {
          goto LABEL_9;
        }
      }
    }
    if (v8 < v12)
    {
      unint64_t v14 = v8;
      while (v10[v14] < location + length)
      {
        if (v12 == ++v14) {
          goto LABEL_16;
        }
      }
      unint64_t v12 = v14;
    }
LABEL_16:
    NSUInteger length = v12 - v8;
  }

  NSUInteger v15 = v8;
  NSUInteger v16 = length;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (id)_printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  LOBYTE(v8) = 1;
  return -[DBTDuxburyBrailleTranslator _printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:optimize:](self, "_printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:optimize:", a3, a4, a5, a6.location, a6.length, a7, v8);
}

- (id)_printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7 optimize:(BOOL)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v55 = (int *)a4;
  BOOL v49 = a8;
  id v11 = a7;
  composedCharacterPreprocessor = self->_composedCharacterPreprocessor;
  id v65 = 0;
  id v57 = v11;
  uint64_t v13 = -[DBTComposedCharactersPreprocessor preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:](composedCharacterPreprocessor, "preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:", a3, &v65, 0);
  id v14 = v65;
  id v15 = v13;
  NSUInteger v16 = [(NSArray *)self->_printPreprocessors count];
  v17 = v15;
  unint64_t v18 = v14;
  id v56 = self;
  if (v16)
  {
    unint64_t v50 = a5;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    NSUInteger v19 = self->_printPreprocessors;
    id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v61 objects:v66 count:16];
    id v53 = v15;
    v17 = v15;
    size_t v54 = v14;
    unint64_t v18 = v14;
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v62;
      v17 = v53;
      unint64_t v18 = v54;
      do
      {
        v23 = 0;
        int v24 = v17;
        int v25 = v18;
        do
        {
          if (*(void *)v62 != v22) {
            objc_enumerationMutation(v19);
          }
          v26 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v23);
          id v60 = 0;
          v17 = [v26 preprocessPrintString:v24 withLocationMap:&v60 isEightDot:0 textFormattingRanges:v57];
          id v27 = v60;

          unint64_t v18 = +[BRLTPreprocessorHelper mergeLocationMap:v25 withLocationMap:v27];

          v23 = (char *)v23 + 1;
          int v24 = v17;
          int v25 = v18;
        }
        while (v21 != v23);
        id v21 = [(NSArray *)v19 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v21);
    }

    id v14 = v54;
    id v15 = v53;
    a5 = v50;
    self = v56;
  }
  translationHandle = self->_translationHandle;
  if (v55 == &dword_4)
  {
    if (translationHandle) {
      translationHandle = self->_technicalTranslationHandle;
    }
    unsigned int v29 = 9;
  }
  else
  {
    unsigned int v29 = 4 * self->_supportsContraction;
  }
  uint64_t v30 = v29;
  unint64_t v31 = -[DBTDuxburyBrailleTranslator _prepBuffersForConversion:withString:mode:prefixLength:](self, "_prepBuffersForConversion:withString:mode:prefixLength:", 1, v17);
  unsigned __int16 v59 = 0;
  bzero(self->_outBuffer, self->_outBufferLen);
  if (BRLTRN_TranslateString(translationHandle, self->_inBuffer, (unint64_t)self->_outBuffer, LOWORD(self->_outBufferLen), v29, &v59))
  {
    v32 = DBTLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[DBTDuxburyBrailleTranslator _unloadTables]();
    }

    int v33 = 0;
  }
  else
  {
    DBTWideCharBufferLength(self->_outBuffer);
    v55 = (int *)v48;
    uint64_t v34 = __chkstk_darwin();
    v36 = &v48[-v35];
    uint64_t v37 = v34 - v29;
    if (v34 != v30)
    {
      v38 = &v56->_outBuffer[v30];
      unint64_t v39 = v36;
      uint64_t v40 = v34 - v30;
      do
      {
        int v41 = *v38++;
        *v39++ = v41;
        --v40;
      }
      while (v40);
    }
    if (a5)
    {
      id v58 = 0;
      LOBYTE(v47) = v49;
      size_t v54 = v36;
      v42 = v56;
      [(DBTDuxburyBrailleTranslator *)v56 _populatePrintBrailleForTextLocations:&v58 inLength:v31 outLength:v37 translationHandle:translationHandle offsetToBraille:v59 prefixCodeLength:v30 preprocessedMap:v18 optimize:v47];
      id v43 = v58;
      uint64_t v44 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", [v43 length]);
      v36 = v54;
      char v45 = (void *)v44;
    }
    else
    {
      id v43 = 0;
      char v45 = 0;
      v42 = v56;
    }
    int v33 = -[DBTDuxburyBrailleTranslator _scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:](v42, "_scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:", v36, v37, v43, v45, 1, location, length);
    if (a5) {
      *a5 = v45;
    }
  }

  return v33;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v13 = a3;
  id v14 = a7;
  int v15 = _os_feature_enabled_impl();
  if (a4 != 4 && v15)
  {
    if (!self->_supportsEightDot)
    {
      if (self->_contracted) {
        a4 = 3;
      }
      else {
        a4 = 1;
      }
      goto LABEL_15;
    }
LABEL_10:
    uint64_t v16 = [(DBTDuxburyBrailleTranslator *)self _eightDotPrintBrailleForText:v13 locations:a5 textFormattingRanges:v14];
    goto LABEL_16;
  }
  if (a4 == 4)
  {
    if (self->_supportsTechnical)
    {
      uint64_t v16 = [(DBTDuxburyBrailleTranslator *)self printBrailleForTechnicalText:v13 useTechnicalTable:1 locations:a5];
      goto LABEL_16;
    }
    a4 = 4;
  }
  else if (a4 == 2)
  {
    if (self->_supportsEightDot) {
      goto LABEL_10;
    }
    a4 = 2;
  }
LABEL_15:
  uint64_t v16 = -[DBTDuxburyBrailleTranslator _printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:](self, "_printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:", v13, a4, a5, location, length, v14);
LABEL_16:
  v17 = (void *)v16;

  return v17;
}

- (id)printBrailleForTechnicalText:(id)a3 useTechnicalTable:(BOOL)a4 locations:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6
    && (([(DBTDuxburyBrailleTranslator *)self loadNemethTable], self->_supportsTechnical)
     || self->_technicalTranslationHandle))
  {
    id v9 = [v8 length];
    unsigned int v10 = self;
    id v11 = v8;
    uint64_t v12 = 4;
  }
  else
  {
    id v9 = [v8 length];
    unsigned int v10 = self;
    id v11 = v8;
    uint64_t v12 = 1;
  }
  id v13 = -[DBTDuxburyBrailleTranslator _printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:](v10, "_printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:", v11, v12, a5, 0, v9, 0);

  return v13;
}

- (void)_populateTextForPrintBrailleLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 offsetToBraille:(unsigned __int16)a6 prefixLength:(unint64_t)a7
{
}

- (void)_populateTextForPrintBrailleLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 offsetToBraille:(unsigned __int16)a6 prefixLength:(unint64_t)a7 optimize:(BOOL)a8
{
  int v10 = a6;
  unint64_t v11 = a5;
  unsigned __int16 v36 = a6;
  size_t v34 = 8 * a5;
  int v15 = (char *)malloc_type_malloc(8 * a5, 0x3F0DB6F5uLL);
  uint64_t v16 = (int *)((char *)&v34 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
  int *v16 = v10 - a7;
  bzero(self->_tmpBuffer, self->_tmpBufferLen);
  if (!a8)
  {
    if (a4 >= 2)
    {
      unint64_t v23 = a4 - 1;
      int v24 = v16 + 1;
      unsigned __int16 v25 = a7 + 1;
      while (1)
      {
        int v26 = BRLTRN_TranslateString((_DWORD *)self->_backTranslationHandle, self->_inBuffer, (unint64_t)self->_tmpBuffer, LOWORD(self->_tmpBufferLen), v25, &v36);
        _DWORD *v24 = v36 - a7;
        if (v26) {
          goto LABEL_15;
        }
        ++v24;
        ++v25;
        if (!--v23) {
          goto LABEL_16;
        }
      }
    }
    goto LABEL_16;
  }
  uint64_t v35 = 0;
  int LocationMap = BRLTRN_TranslateStringAndGetLocationMap((_DWORD *)self->_backTranslationHandle, self->_inBuffer, (unint64_t)self->_tmpBuffer, LOWORD(self->_tmpBufferLen), &v35);
  unint64_t v18 = v35;
  if (LocationMap || !a4)
  {
    if (!v35) {
      goto LABEL_14;
    }
  }
  else
  {
    NSUInteger v19 = &v35[2 * a7];
    id v20 = (_DWORD *)((char *)&v34 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v21 = a4;
    do
    {
      int v22 = *(unsigned __int16 *)v19;
      v19 += 2;
      *v20++ = v22 - a7;
      --v21;
    }
    while (v21);
  }
  free(v18);
LABEL_14:
  if (!LocationMap)
  {
LABEL_16:
    unint64_t v28 = a4 - 1;
    size_t v27 = v34;
    if ((uint64_t)(a4 - 1) < 0) {
      goto LABEL_26;
    }
    while (1)
    {
      unint64_t v29 = a4;
      a4 = v28;
      if (!v28) {
        break;
      }
      int v30 = v16[v28];
      if (v30 != v16[v29 - 2]) {
        goto LABEL_21;
      }
LABEL_25:
      unint64_t v28 = a4 - 1;
      if ((uint64_t)a4 <= 0) {
        goto LABEL_26;
      }
    }
    int v30 = *v16;
LABEL_21:
    unint64_t v31 = v30;
    if (v11 > v30)
    {
      unint64_t v32 = v11 - v30;
      int v33 = (unint64_t *)&v15[8 * v31];
      do
      {
        *v33++ = a4;
        --v32;
      }
      while (v32);
    }
    unint64_t v11 = v31;
    goto LABEL_25;
  }
LABEL_15:
  size_t v27 = v34;
  bzero(v15, v34);
LABEL_26:
  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v15, v27, v34);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  free(v15);
}

- (id)_textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  return [(DBTDuxburyBrailleTranslator *)self _textForPrintBraille:a3 mode:a4 locations:a5 optimize:1];
}

- (id)_textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 optimize:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  backTranslationHandle = self->_backTranslationHandle;
  if (a4 == 4)
  {
    [(DBTDuxburyBrailleTranslator *)self loadNemethTable];
    if (self->_technicalBackTranslationHandle) {
      backTranslationHandle = self->_technicalBackTranslationHandle;
    }
    unsigned int v12 = 9;
  }
  else
  {
    unsigned int v12 = 4 * self->_supportsContraction;
  }
  uint64_t v13 = v12;
  unint64_t v14 = [(DBTDuxburyBrailleTranslator *)self _prepBuffersForConversion:0 withString:v10 mode:a4 prefixLength:v12];
  unint64_t v15 = v14;
  inBuffer = self->_inBuffer;
  if (v14 + v12 > v12)
  {
    uint64_t v17 = v12;
    unint64_t v18 = v14;
    do
    {
      __int32 v19 = UnicodeToASCIIBraille(inBuffer[v17]);
      inBuffer = self->_inBuffer;
      inBuffer[v17++] = v19;
      --v18;
    }
    while (v18);
  }
  unsigned __int16 v34 = 0;
  if (!BRLTRN_TranslateString(backTranslationHandle, inBuffer, (unint64_t)self->_outBuffer, LOWORD(self->_outBufferLen), v13, &v34))
  {
    uint64_t v22 = DBTWideCharBufferLength(self->_outBuffer) - v13;
    if (a5)
    {
      [(DBTDuxburyBrailleTranslator *)self _populateTextForPrintBrailleLocations:a5 inLength:v15 outLength:v22 offsetToBraille:v34 prefixLength:v13 optimize:v6];
      id v20 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", [*a5 length]);
      if (a4 != 4)
      {
        id v23 = *a5;
        goto LABEL_20;
      }
    }
    else
    {
      id v20 = 0;
      id v23 = 0;
      if (a4 != 4)
      {
LABEL_20:
        unint64_t v21 = -[DBTDuxburyBrailleTranslator _scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:](self, "_scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:", &self->_outBuffer[v13], v22, v23, v20, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
        if (!a5) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
    outBuffer = self->_outBuffer;
    uint64_t v25 = DBTWideCharBufferLength(outBuffer);
    int v26 = DBTNSStringFromWideCharBuffer(outBuffer, v25);
    size_t v27 = objc_alloc_init(DBTDuxburyFormatParser);
    id v33 = 0;
    unint64_t v28 = [(DBTDuxburyFormatParser *)v27 LaTeXRepresentationOfString:v26 error:&v33];
    id v29 = v33;
    if (v29)
    {
      if (a5) {
        id v30 = *a5;
      }
      else {
        id v30 = 0;
      }
      -[DBTDuxburyBrailleTranslator _scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:](self, "_scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:", &self->_outBuffer[v13], v22, v30, v20, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v31 = v28;
    }
    unint64_t v21 = v31;

    if (!a5) {
      goto LABEL_27;
    }
LABEL_26:
    id v20 = v20;
    *a5 = v20;
    goto LABEL_27;
  }
  id v20 = DBTLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[DBTDuxburyBrailleTranslator _unloadTables]();
  }
  unint64_t v21 = 0;
LABEL_27:

  return v21;
}

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  id v8 = a3;
  int v9 = _os_feature_enabled_impl();
  if (a4 != 4 && v9)
  {
    if (!self->_supportsEightDot)
    {
      if (self->_contracted) {
        a4 = 3;
      }
      else {
        a4 = 1;
      }
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v10 = [(DBTDuxburyBrailleTranslator *)self _eightDotTextForPrintBraille:v8 locations:a5];
    goto LABEL_12;
  }
  if (a4 == 2)
  {
    if (self->_supportsEightDot) {
      goto LABEL_9;
    }
    a4 = 2;
  }
LABEL_11:
  uint64_t v10 = [(DBTDuxburyBrailleTranslator *)self _textForPrintBraille:v8 mode:a4 locations:a5];
LABEL_12:
  unint64_t v11 = (void *)v10;

  return v11;
}

- (id)_eightDotPrintBrailleForText:(id)a3 locations:(id *)a4 textFormattingRanges:(id)a5
{
  id v53 = a4;
  id v7 = a5;
  composedCharacterPreprocessor = self->_composedCharacterPreprocessor;
  id v69 = 0;
  id v58 = v7;
  int v9 = -[DBTComposedCharactersPreprocessor preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:](composedCharacterPreprocessor, "preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:", a3, &v69, 0);
  id v10 = v69;
  unint64_t v11 = v9;
  NSUInteger v12 = [(NSArray *)self->_printPreprocessors count];
  v55 = v11;
  id v56 = self;
  uint64_t v13 = v10;
  id v54 = v10;
  if (v12)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v57 = self->_printPreprocessors;
    id v14 = [(NSArray *)v57 countByEnumeratingWithState:&v65 objects:v70 count:16];
    unint64_t v11 = v55;
    uint64_t v13 = v10;
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v66;
      uint64_t v13 = v54;
      unint64_t v11 = v55;
      do
      {
        uint64_t v17 = 0;
        unint64_t v18 = v11;
        __int32 v19 = v13;
        do
        {
          if (*(void *)v66 != v16) {
            objc_enumerationMutation(v57);
          }
          id v20 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v17);
          id v64 = 0;
          unint64_t v11 = [v20 preprocessPrintString:v18 withLocationMap:&v64 isEightDot:1 textFormattingRanges:v58];
          id v21 = v64;

          uint64_t v13 = +[BRLTPreprocessorHelper mergeLocationMap:v19 withLocationMap:v21];

          uint64_t v17 = (char *)v17 + 1;
          unint64_t v18 = v11;
          __int32 v19 = v13;
        }
        while (v15 != v17);
        id v15 = [(NSArray *)v57 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v15);
    }

    self = v56;
  }
  CFIndex Length = CFStringGetLength(v11);
  id v57 = (NSArray *)&v53;
  uint64_t v23 = __chkstk_darwin();
  uint64_t v25 = (char *)&v53 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v60 = 0u;
  memset(v59, 0, sizeof(v59));
  *(void *)&long long v60 = v11;
  uint64_t v63 = 0;
  *(void *)&long long v62 = v23;
  CharactersPtr = CFStringGetCharactersPtr(v11);
  CStringPtr = 0;
  *((void *)&v60 + 1) = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v11, 0x600u);
  }
  *((void *)&v62 + 1) = 0;
  uint64_t v63 = 0;
  *(void *)&long long v61 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 64;
    do
    {
      if ((unint64_t)v29 >= 4) {
        uint64_t v31 = 4;
      }
      else {
        uint64_t v31 = v29;
      }
      uint64_t v32 = v62;
      if ((uint64_t)v62 <= v29)
      {
        UniChar v33 = 0;
      }
      else if (*((void *)&v60 + 1))
      {
        UniChar v33 = *(_WORD *)(*((void *)&v60 + 1) + 2 * (v29 + *((void *)&v61 + 1)));
      }
      else if ((void)v61)
      {
        UniChar v33 = *(char *)(v61 + *((void *)&v61 + 1) + v29);
      }
      else
      {
        uint64_t v37 = *((void *)&v62 + 1);
        if (v63 <= v29 || *((void *)&v62 + 1) > v29)
        {
          uint64_t v39 = -v31;
          uint64_t v40 = v31 + v28;
          uint64_t v41 = v30 - v31;
          uint64_t v42 = v29 + v39;
          uint64_t v43 = v42 + 64;
          if (v42 + 64 >= (uint64_t)v62) {
            uint64_t v43 = v62;
          }
          *((void *)&v62 + 1) = v42;
          uint64_t v63 = v43;
          if ((uint64_t)v62 >= v41) {
            uint64_t v32 = v41;
          }
          v72.NSUInteger length = v32 + v40;
          v72.NSUInteger location = v42 + *((void *)&v61 + 1);
          CFStringGetCharacters((CFStringRef)v60, v72, v59);
          uint64_t v37 = *((void *)&v62 + 1);
        }
        UniChar v33 = v59[v29 - v37];
      }
      unsigned __int16 v34 = +[NSNumber numberWithUnsignedInteger:v33];
      uint64_t v35 = [(NSDictionary *)self->_eightDotTranslationTable objectForKey:v34];
      if (v35
        || ([(NSDictionary *)self->_eightDotTranslationTable objectForKey:@"UndefinedSymbol"],
            (uint64_t v35 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        unsigned __int16 v36 = v35;
        *(_WORD *)&v25[2 * v29] = (unsigned __int16)[v35 unsignedIntegerValue];
      }
      else
      {
        *(_WORD *)&v25[2 * v29] = 10240;
      }

      ++v29;
      --v28;
      ++v30;
      self = v56;
    }
    while (Length != v29);
  }
  uint64_t v44 = +[NSString stringWithCharacters:v25 length:Length];
  char v45 = v53;
  int v46 = v54;
  if (v53)
  {
    uint64_t v47 = [v13 bytes];
    if ((uint64_t)[v44 length] >= 1)
    {
      uint64_t v48 = __chkstk_darwin();
      unint64_t v50 = 0;
      do
      {
        v51 = v50;
        if (v47) {
          v51 = (id *)v47[(void)v50];
        }
        *(id **)((char *)&(&v53)[(void)v50] - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0)) = v51;
        unint64_t v50 = (id *)((char *)v50 + 1);
      }
      while ((id *)v48 != v50);
      +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
      *char v45 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v44;
}

- (id)_eightDotTextForPrintBraille:(id)a3 locations:(id *)a4
{
  BOOL v6 = (__CFString *)a3;
  CFIndex Length = CFStringGetLength(v6);
  uint64_t v8 = __chkstk_darwin();
  id v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = v6;
  uint64_t v42 = 0;
  int64_t v43 = v8;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  CStringPtr = 0;
  uint64_t v40 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  }
  memset(buffer, 0, sizeof(buffer));
  int64_t v44 = 0;
  int64_t v45 = 0;
  uint64_t v41 = CStringPtr;
  if (Length < 1)
  {
    uint64_t v30 = 0;
    if (!a4) {
      goto LABEL_38;
    }
    goto LABEL_34;
  }
  v35[1] = v35;
  unsigned __int16 v36 = v6;
  uint64_t v37 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  int64_t v15 = 0;
  uint64_t v16 = 64;
  do
  {
    if ((unint64_t)v15 >= 4) {
      uint64_t v17 = 4;
    }
    else {
      uint64_t v17 = v15;
    }
    int64_t v18 = v43;
    if (v43 <= v15)
    {
      UniChar v19 = 0;
    }
    else if (v40)
    {
      UniChar v19 = v40[v15 + v42];
    }
    else if (v41)
    {
      UniChar v19 = v41[v42 + v15];
    }
    else
    {
      int64_t v23 = v44;
      if (v45 <= v15 || v44 > v15)
      {
        uint64_t v25 = -v17;
        uint64_t v26 = v17 + v13;
        uint64_t v27 = v16 - v17;
        int64_t v28 = v15 + v25;
        int64_t v29 = v28 + 64;
        if (v28 + 64 >= v43) {
          int64_t v29 = v43;
        }
        int64_t v44 = v28;
        int64_t v45 = v29;
        if (v43 >= v27) {
          int64_t v18 = v27;
        }
        v47.NSUInteger length = v18 + v26;
        v47.NSUInteger location = v28 + v42;
        CFStringGetCharacters(v39, v47, (UniChar *)buffer);
        int64_t v23 = v44;
      }
      UniChar v19 = *((_WORD *)buffer + v15 - v23);
    }
    id v20 = +[NSNumber numberWithUnsignedInteger:v19];
    id v21 = [(NSDictionary *)self->_eightDotBackTranslationTable objectForKey:v20];
    uint64_t v22 = v21;
    if (v21)
    {
      *(_WORD *)&v10[2 * v15] = (unsigned __int16)[v21 unsignedIntegerValue];
      ++v14;
    }

    ++v15;
    --v13;
    ++v16;
  }
  while (Length != v15);
  a4 = v37;
  if (v14 <= 0)
  {
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v30 = +[NSString stringWithCharacters:v10 length:v14];
  }
  BOOL v6 = v36;
  if (a4)
  {
LABEL_34:
    if ((uint64_t)[v30 length] >= 1)
    {
      uint64_t v31 = __chkstk_darwin();
      uint64_t v33 = 0;
      do
      {
        *(void *)((char *)&v35[v33] - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0)) = v33;
        ++v33;
      }
      while (v31 != v33);
      +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_38:

  return v30;
}

- (void)_eightDotTablesFromRawTable:(id)a3 translationTable:(id *)a4 backTranslationTable:(id *)a5
{
  id v5 = a3;
  id v6 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  id v7 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  id v48 = [objc_allocWithZone((Class)NSMutableArray) init];
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v47 = *(void *)v58;
    id v42 = v8;
    int64_t v43 = v6;
    do
    {
      unint64_t v11 = 0;
      id v44 = v10;
      do
      {
        if (*(void *)v58 != v47) {
          objc_enumerationMutation(v8);
        }
        NSUInteger v12 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v11);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSLog(@"Invalid key: %@", v12);
          goto LABEL_58;
        }
        [v48 removeAllObjects];
        uint64_t v13 = [v8 objectForKey:v12];
        int v46 = v11;
        if (objc_opt_isKindOfClass())
        {
          if (((unint64_t)[v13 unsignedIntegerValue] & 0xFF00) != 0x2800) {
            [v48 addObject:v13];
          }
        }
        else if (objc_opt_isKindOfClass())
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v14 = v13;
          id v15 = v13;
          id v16 = [v15 countByEnumeratingWithState:&v53 objects:v62 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v54;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v54 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                if (objc_opt_isKindOfClass())
                {
                  if (((unint64_t)[v20 unsignedIntegerValue] & 0xFF00) != 0x2800) {
                    [v48 addObject:v20];
                  }
                }
                else
                {
                  NSLog(@"Invalid sub-value: %@", v12);
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v53 objects:v62 count:16];
            }
            while (v17);
          }

          id v8 = v42;
          id v10 = v44;
          uint64_t v13 = v14;
          id v6 = v43;
        }
        else
        {
          NSLog(@"Invalid value: %@", v12);
        }
        int64_t v45 = v13;
        if ([v12 isEqualToString:@"UndefinedSymbol"])
        {
          id v21 = [v7 objectForKey:v12];

          if (v21) {
            NSLog(@"Duplicate undefined translation symbol: %@", v12);
          }
          uint64_t v22 = [v48 objectAtIndex:0];
          unint64_t v23 = (unint64_t)[v22 integerValue];
          if ((uint64_t)v23 < 1)
          {
            uint64_t v24 = 0;
          }
          else
          {
            uint64_t v24 = 0;
            do
            {
              unint64_t v25 = ~(10 * (v23 / 0xA)) + v23;
              if (v25 <= 7) {
                v24 |= _DotValue[2 * v25];
              }
              BOOL v26 = v23 > 9;
              v23 /= 0xAuLL;
            }
            while (v26);
          }
          uint64_t v30 = +[NSNumber numberWithUnsignedInteger:v24 + 10240];
          [v7 setObject:v30 forKey:v12];
        }
        else
        {
          unint64_t v27 = (unint64_t)[v12 integerValue];
          if ((uint64_t)v27 < 1)
          {
            uint64_t v28 = 0;
          }
          else
          {
            uint64_t v28 = 0;
            do
            {
              unint64_t v29 = ~(10 * (v27 / 0xA)) + v27;
              if (v29 <= 7) {
                v28 |= _DotValue[2 * v29];
              }
              BOOL v26 = v27 > 9;
              v27 /= 0xAuLL;
            }
            while (v26);
          }
          uint64_t v22 = +[NSNumber numberWithUnsignedInteger:v28 + 10240];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v31 = v48;
          id v32 = [v31 countByEnumeratingWithState:&v49 objects:v61 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v50;
            do
            {
              for (j = 0; j != v33; j = (char *)j + 1)
              {
                if (*(void *)v50 != v34) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v36 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
                uint64_t v37 = [v7 objectForKey:v36];

                if (v37) {
                  NSLog(@"Duplicate translation value for key: %@", v36);
                }
                [v7 setObject:v22 forKey:v36];
              }
              id v33 = [v31 countByEnumeratingWithState:&v49 objects:v61 count:16];
            }
            while (v33);
          }

          [v7 setObject:v22 forKey:v22];
          if (![v31 count])
          {
            id v8 = v42;
            id v6 = v43;
            id v10 = v44;
            goto LABEL_57;
          }
          id v6 = v43;
          v38 = [v43 objectForKey:v22];

          id v10 = v44;
          if (v38) {
            NSLog(@"Duplicate back translation value for key: %@", v22);
          }
          uint64_t v30 = [v31 objectAtIndex:0];
          [v43 setObject:v30 forKey:v22];
          id v8 = v42;
        }

LABEL_57:
        unint64_t v11 = v46;

LABEL_58:
        unint64_t v11 = (char *)v11 + 1;
      }
      while (v11 != v10);
      id v39 = [v8 countByEnumeratingWithState:&v57 objects:v63 count:16];
      id v10 = v39;
    }
    while (v39);
  }

  if (a4) {
    objc_storeStrong(a4, v7);
  }
  if (a5) {
    objc_storeStrong(a5, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedCharacterPreprocessor, 0);
  objc_storeStrong((id *)&self->_printPreprocessors, 0);
  objc_storeStrong((id *)&self->_eightDotBackTranslationTable, 0);
  objc_storeStrong((id *)&self->_eightDotTranslationTable, 0);

  objc_storeStrong((id *)&self->_activeTable, 0);
}

- (void)setActiveTable:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "languages in Info.plist was of unexpected type for table %@", (uint8_t *)&v2, 0xCu);
}

- (void)_loadTable:(uint64_t)a1 translationHandle:(NSObject *)a2 backTranslationHandle:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to load table with identifier %@", (uint8_t *)&v2, 0xCu);
}

@end