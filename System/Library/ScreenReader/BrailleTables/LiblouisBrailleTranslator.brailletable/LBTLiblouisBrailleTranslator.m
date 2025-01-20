@interface LBTLiblouisBrailleTranslator
+ (void)initialize;
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsModeWithKey:(id)a3;
- (BOOL)activeTableSupportsTechnicalBraille;
- (LBTLiblouisBrailleTranslator)init;
- (LiblouisEmojiPrintPreprocessor)emojiPreprocessor;
- (LiblouisTextFormattingProcessor)textFormattingPreprocessor;
- (NSDictionary)activeTableMap;
- (NSDictionary)languageMap;
- (NSString)activeTable;
- (id)_printBrailleForText:(id)a3 table:(id)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)printBrailleForTechnicalText:(id)a3 useTechnicalTable:(BOOL)a4 locations:(id *)a5 textFormattingRanges:(id)a6;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textFormattingRanges:(id)a6;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)tableForActiveTableMode:(unint64_t)a3;
- (id)tableListForTable:(id)a3;
- (id)technicalTableForActiveLanguage:(BOOL)a3;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (unint64_t)interfaceVersion;
- (void)dealloc;
- (void)setActiveTable:(id)a3;
- (void)setEmojiPreprocessor:(id)a3;
- (void)setLanguageMap:(id)a3;
- (void)setTextFormattingPreprocessor:(id)a3;
@end

@implementation LBTLiblouisBrailleTranslator

+ (void)initialize
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 resourcePath];

  id v4 = v3;
  lou_setDataPath((const char *)[v4 UTF8String]);
  lou_registerLogCallback((const char *(*)(uint64_t, const char *))sub_1990);
}

- (LBTLiblouisBrailleTranslator)init
{
  v6.receiver = self;
  v6.super_class = (Class)LBTLiblouisBrailleTranslator;
  v2 = [(LBTLiblouisBrailleTranslator *)&v6 init];
  v3 = objc_opt_new();
  [(LBTLiblouisBrailleTranslator *)v2 setEmojiPreprocessor:v3];

  id v4 = objc_opt_new();
  [(LBTLiblouisBrailleTranslator *)v2 setTextFormattingPreprocessor:v4];

  return v2;
}

- (void)dealloc
{
  lou_free();
  v3.receiver = self;
  v3.super_class = (Class)LBTLiblouisBrailleTranslator;
  [(LBTLiblouisBrailleTranslator *)&v3 dealloc];
}

- (NSDictionary)languageMap
{
  languageMap = self->_languageMap;
  if (!languageMap)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 pathForResource:@"Tables" ofType:@"plist"];
    objc_super v6 = +[NSDictionary dictionaryWithContentsOfFile:v5];
    v7 = self->_languageMap;
    self->_languageMap = v6;

    languageMap = self->_languageMap;
  }

  return languageMap;
}

- (NSDictionary)activeTableMap
{
  objc_super v3 = [(LBTLiblouisBrailleTranslator *)self languageMap];
  id v4 = [(LBTLiblouisBrailleTranslator *)self activeTable];
  v5 = [v3 objectForKeyedSubscript:v4];

  return (NSDictionary *)v5;
}

- (BOOL)activeTableSupportsModeWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(LBTLiblouisBrailleTranslator *)self activeTableMap];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (id)tableListForTable:(id)a3
{
  id v4 = a3;
  v5 = [(LBTLiblouisBrailleTranslator *)self languageMap];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 allValues];
  v8 = [v7 componentsJoinedByString:@","];

  return v8;
}

- (id)tableForActiveTableMode:(unint64_t)a3
{
  id v4 = [(LBTLiblouisBrailleTranslator *)self activeTableMap];
  v5 = [v4 objectForKeyedSubscript:@"table"];
  if (!v5)
  {
    CFStringRef v6 = @"6Dot";
    if (a3 == 2) {
      CFStringRef v6 = @"8Dot";
    }
    if (a3 == 3) {
      CFStringRef v7 = @"Contracted";
    }
    else {
      CFStringRef v7 = v6;
    }
    v5 = [v4 objectForKeyedSubscript:v7];
    if (!v5)
    {
      v5 = [v4 objectForKeyedSubscript:@"Contracted"];
      if (!v5)
      {
        v5 = [v4 objectForKeyedSubscript:@"8Dot"];
        if (!v5)
        {
          v5 = [v4 objectForKeyedSubscript:@"6Dot"];
        }
      }
    }
  }
  id v8 = v5;

  return v8;
}

- (id)technicalTableForActiveLanguage:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(LBTLiblouisBrailleTranslator *)self activeTableMap];
  CFStringRef v6 = v5;
  if (!v3
    || ([v5 objectForKeyedSubscript:@"Technical"],
        (CFStringRef v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    CFStringRef v7 = [(LBTLiblouisBrailleTranslator *)self tableForActiveTableMode:1];
  }

  return v7;
}

- (unint64_t)interfaceVersion
{
  return 7;
}

- (void)setActiveTable:(id)a3
{
  id v4 = a3;
  v5 = LBTLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1BAD4();
  }

  if (![(NSString *)self->_activeTable isEqualToString:v4])
  {
    lou_free();
    CFStringRef v6 = (NSString *)[v4 copy];
    activeTable = self->_activeTable;
    self->_activeTable = v6;

    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 objectForInfoDictionaryKey:@"BrailleTables"];
    v10 = [v9 objectForKey:v4];
    v11 = [v10 objectForKey:@"supportsContraction"];
    self->_supportsContraction = [v11 BOOLValue];

    v12 = [v10 objectForKey:@"supportsTechnical"];
    self->_supportsTechnical = [v12 BOOLValue];

    v13 = [v10 objectForKey:@"supports8dot"];
    self->_supportsEightDot = [v13 BOOLValue];

    v14 = [v10 objectForKey:@"supportsIPA"];
    self->_supportsIPA = [v14 BOOLValue];
  }
}

- (BOOL)activeTableSupportsContractedBraille
{
  if (_os_feature_enabled_impl()) {
    return self->_supportsContraction;
  }

  return [(LBTLiblouisBrailleTranslator *)self activeTableSupportsModeWithKey:@"Contracted"];
}

- (BOOL)activeTableSupportsEightDotBraille
{
  if (_os_feature_enabled_impl()) {
    return self->_supportsEightDot;
  }

  return [(LBTLiblouisBrailleTranslator *)self activeTableSupportsModeWithKey:@"8Dot"];
}

- (BOOL)activeTableSupportsTechnicalBraille
{
  if (_os_feature_enabled_impl()) {
    return self->_supportsTechnical;
  }

  return [(LBTLiblouisBrailleTranslator *)self activeTableSupportsModeWithKey:@"Technical"];
}

- (id)printBrailleForTechnicalText:(id)a3 useTechnicalTable:(BOOL)a4 locations:(id *)a5 textFormattingRanges:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v12 = [(LBTLiblouisBrailleTranslator *)self technicalTableForActiveLanguage:v8];
  if (v12)
  {
    v13 = -[LBTLiblouisBrailleTranslator _printBrailleForText:table:locations:textPositionsRange:textFormattingRanges:](self, "_printBrailleForText:table:locations:textPositionsRange:textFormattingRanges:", v10, v12, a5, 0, [v10 length], v11);
  }
  else
  {
    v14 = LBTLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1BB48(self, v14);
    }

    v13 = 0;
  }

  return v13;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textFormattingRanges:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = -[LBTLiblouisBrailleTranslator printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:](self, "printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:", v11, a4, a5, 0, [v11 length], v10);

  return v12;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v13 = a3;
  id v14 = a7;
  v15 = [(LBTLiblouisBrailleTranslator *)self tableForActiveTableMode:a4];
  if (v15)
  {
    v16 = -[LBTLiblouisBrailleTranslator _printBrailleForText:table:locations:textPositionsRange:textFormattingRanges:](self, "_printBrailleForText:table:locations:textPositionsRange:textFormattingRanges:", v13, v15, a5, location, length, v14);
  }
  else
  {
    v17 = LBTLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1BBD4(self, v17);
    }

    v16 = 0;
  }

  return v16;
}

- (id)_printBrailleForText:(id)a3 table:(id)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  v61 = a5;
  id v10 = a3;
  id v62 = a4;
  id v11 = a7;
  v12 = [(LBTLiblouisBrailleTranslator *)self textFormattingPreprocessor];
  id v13 = [v12 processText:v10 withFormattingRanges:v11];

  id v14 = [(LBTLiblouisBrailleTranslator *)self emojiPreprocessor];
  id v65 = 0;
  v15 = [v14 preprocessPrintString:v10 withLocationMap:&v65 typeformData:v13];
  id v16 = v65;

  id v17 = [v15 dataUsingEncoding:2483028224];
  v18 = (unsigned __int16 *)[v17 bytes];
  unsigned int v19 = objc_msgSend(v15, "rangeOfComposedCharacterSequencesForRange:", 0, objc_msgSend(v15, "length"));
  int v64 = v19 + v20;
  if ((int)(3 * (v19 + v20)) <= 512) {
    unsigned int v21 = 512;
  }
  else {
    unsigned int v21 = 3 * (v19 + v20);
  }
  unsigned int v63 = v21;
  v22 = malloc_type_malloc(2 * v21, 0x1000040BDFB0063uLL);
  if (!v22)
  {
    v35 = LBTLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1BC60(v35, v36, v37, v38, v39, v40, v41, v42);
    }

    goto LABEL_18;
  }
  v23 = v22;
  if (v13)
  {
    unint64_t v24 = (unint64_t)[v13 length];
    if ([v15 length] != (id)(v24 >> 1))
    {
      v25 = LBTLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1BD54();
      }

      id v13 = 0;
    }
  }
  if (v61)
  {
    v26 = (int *)malloc_type_malloc(4 * v21, 0xECAC05F7uLL);
    if (!v26)
    {
      v27 = LBTLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1BD1C(v27, v28, v29, v30, v31, v32, v33, v34);
      }

      free(v23);
LABEL_18:
      v43 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    v26 = 0;
  }
  uint64_t v60 = (uint64_t)&v60;
  uint64_t v44 = __chkstk_darwin([v13 length]);
  v46 = (__int16 *)((char *)&v60 - v45);
  if (v44) {
    objc_msgSend(v13, "getBytes:length:", (char *)&v60 - v45);
  }
  else {
    v46 = 0;
  }
  if (lou_translate((char *)[v62 UTF8String], v18, &v64, (unsigned __int16 *)v23, (int *)&v63, v46, 0, v26, 0, 0, 68) == 1)
  {
    if (v61)
    {
      size_t v47 = 8 * (int)v63;
      v48 = malloc_type_malloc(v47, 0xB6C90976uLL);
      if (v48)
      {
        v49 = v48;
        v50 = [v16 bytes];
        uint64_t v51 = (v64 - 1);
        if (v64 >= 1)
        {
          unint64_t v52 = (int)v63;
          while (v51)
          {
            int v53 = v26[v51];
            uint64_t v54 = v51 - 1;
            if (v53 != v26[v51 - 1]) {
              goto LABEL_32;
            }
LABEL_35:
            BOOL v56 = v51 <= 0;
            uint64_t v51 = v54;
            if (v56) {
              goto LABEL_37;
            }
          }
          int v53 = *v26;
LABEL_32:
          for (unint64_t i = v53; v52 > i; ++i)
            v49[i] = v50[v51];
          uint64_t v54 = v51 - 1;
          unint64_t v52 = v53;
          goto LABEL_35;
        }
LABEL_37:
        id v57 = +[NSData dataWithBytes:v49 length:v47];
        id *v61 = v57;
        free(v49);
      }
    }
    if (v26) {
      free(v26);
    }
    v43 = +[NSString stringWithCharacters:v23 length:(int)v63];
    free(v23);
  }
  else
  {
    v58 = LBTLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_1BC98();
    }

    free(v23);
    if (v26) {
      free(v26);
    }
    v43 = 0;
  }
LABEL_46:

  return v43;
}

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  id v8 = a3;
  v9 = [(LBTLiblouisBrailleTranslator *)self tableForActiveTableMode:a4];
  id v10 = [v8 dataUsingEncoding:2483028224];
  id v11 = (unsigned __int16 *)[v10 bytes];
  unsigned int v12 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", 0, objc_msgSend(v8, "length"));
  int v38 = v12 + v13;
  int v14 = 4 * (v12 + v13) + 64;
  int v37 = v14;
  v15 = malloc_type_malloc(2 * v14, 0x1000040BDFB0063uLL);
  if (a5)
  {
    id v16 = (char *)malloc_type_malloc(v14, 0xF4EDB3F3uLL);
    if (!v16)
    {
      id v17 = LBTLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1BD1C(v17, v18, v19, v20, v21, v22, v23, v24);
      }
LABEL_27:

      free(v15);
      uint64_t v34 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    id v16 = 0;
  }
  if (lou_backTranslate((char *)[v9 UTF8String], v11, (unsigned int *)&v38, v15, &v37, 0, 0, v16, 0, 0, 0x80u) != 1)
  {
    id v17 = LBTLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1BE44();
    }
    goto LABEL_27;
  }
  if (v16)
  {
    size_t v25 = 8 * v37;
    v26 = malloc_type_malloc(v25, 0x6F2DBE91uLL);
    if (v26)
    {
      v27 = v26;
      uint64_t v28 = (v38 - 1);
      if (v38 >= 1)
      {
        unint64_t v29 = v37;
        while (v28)
        {
          int v30 = *(_DWORD *)&v16[4 * v28];
          uint64_t v31 = v28 - 1;
          if (v30 != *(_DWORD *)&v16[4 * v28 - 4]) {
            goto LABEL_15;
          }
LABEL_18:
          BOOL v33 = v28 <= 0;
          uint64_t v28 = v31;
          if (v33) {
            goto LABEL_20;
          }
        }
        int v30 = *(_DWORD *)v16;
LABEL_15:
        for (unint64_t i = v30; v29 > i; ++i)
          *((void *)v26 + i) = v28;
        uint64_t v31 = v28 - 1;
        unint64_t v29 = v30;
        goto LABEL_18;
      }
LABEL_20:
      *a5 = +[NSData dataWithBytes:v26 length:v25];
      free(v27);
    }
    free(v16);
  }
  uint64_t v34 = +[NSString stringWithCharacters:v15 length:v37];
  free(v15);
  v35 = LBTLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    sub_1BDD8();
  }

LABEL_28:

  return v34;
}

- (BOOL)activeTableSupportsIPA
{
  if (_os_feature_enabled_impl()) {
    return self->_supportsIPA;
  }
  id v4 = [(LBTLiblouisBrailleTranslator *)self activeTable];
  unsigned __int8 v5 = [v4 isEqualToString:@"ipa"];

  return v5;
}

- (NSString)activeTable
{
  return self->_activeTable;
}

- (void)setLanguageMap:(id)a3
{
}

- (LiblouisEmojiPrintPreprocessor)emojiPreprocessor
{
  return self->_emojiPreprocessor;
}

- (void)setEmojiPreprocessor:(id)a3
{
}

- (LiblouisTextFormattingProcessor)textFormattingPreprocessor
{
  return self->_textFormattingPreprocessor;
}

- (void)setTextFormattingPreprocessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFormattingPreprocessor, 0);
  objc_storeStrong((id *)&self->_emojiPreprocessor, 0);
  objc_storeStrong((id *)&self->_languageMap, 0);

  objc_storeStrong((id *)&self->_activeTable, 0);
}

@end