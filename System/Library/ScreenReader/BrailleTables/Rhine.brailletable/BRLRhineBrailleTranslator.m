@interface BRLRhineBrailleTranslator
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsTechnicalBraille;
- (BRLRhineBrailleTranslator)init;
- (NSString)activeTable;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (int)sendCommand:(id)a3;
- (unint64_t)interfaceVersion;
- (void)extractLocations:(int *)a3 locations_output:(id *)a4 output_size:(int64_t)a5;
- (void)setActiveTable:(id)a3;
- (void)setTranslationMode:(unint64_t)a3;
@end

@implementation BRLRhineBrailleTranslator

- (BRLRhineBrailleTranslator)init
{
  [(BRLRhineBrailleTranslator *)self sendCommand:@"{FU on}"];
  [(BRLRhineBrailleTranslator *)self sendCommand:@"{FF on}"];
  v3 = objc_opt_new();
  v9[0] = v3;
  v4 = objc_opt_new();
  v9[1] = v4;
  v5 = objc_opt_new();
  v9[2] = v5;
  v6 = +[NSArray arrayWithObjects:v9 count:3];
  allPreprocessors = self->_allPreprocessors;
  self->_allPreprocessors = v6;

  return self;
}

- (BOOL)activeTableSupportsContractedBraille
{
  if (_os_feature_enabled_impl()) {
    return self->_useContraction;
  }
  else {
    return ![(NSString *)self->_activeTable isEqualToString:@"es"];
  }
}

- (BOOL)activeTableSupportsEightDotBraille
{
  return 0;
}

- (BOOL)activeTableSupportsIPA
{
  return 0;
}

- (BOOL)activeTableSupportsTechnicalBraille
{
  return 1;
}

- (unint64_t)interfaceVersion
{
  return 7;
}

- (void)setActiveTable:(id)a3
{
  id v5 = a3;
  v6 = +[NSCharacterSet characterSetWithCharactersInString:@"_-"];
  v7 = (char *)[v5 rangeOfCharacterFromSet:v6 options:4];
  id v8 = v5;
  v9 = v8;
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    self->_useContraction = 0;
    v10 = v8;
  }
  else
  {
    v10 = [v8 substringToIndex:v7];

    v11 = [v9 substringFromIndex:v7 + 1];
    self->_useContraction = [v11 isEqualToString:@"g2"];
  }
  v12 = [languageDict objectForKeyedSubscript:v10];
  if (v12)
  {
    v13 = +[NSString stringWithFormat:@"{FLN %@}", v12];
    if ([(BRLRhineBrailleTranslator *)self sendCommand:v13])
    {
      v14 = sub_1F1EC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1FBB0((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_activeTable, a3);
    }
  }
  else
  {
    v13 = sub_1F1EC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1FB44((uint64_t)v10, v13, v21, v22, v23, v24, v25, v26);
    }
  }
}

- (int)sendCommand:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 UTF8String];
  int v5 = 6 * strlen(v4);
  if (v5 >= 0x1FFFFFFF) {
    size_t v6 = 0x1FFFFFFFLL;
  }
  else {
    size_t v6 = v5;
  }
  v7 = (char *)malloc_type_malloc((int)v6, 0x100004077774924uLL);
  if (v7)
  {
    id v8 = v7;
    int v9 = wh_forward_translate(v4, v7, v6, 0);
    if (v9)
    {
      v10 = sub_1F1EC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1FC54();
      }
    }
    free(v8);
  }
  else
  {
    v11 = sub_1F1EC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1FC1C(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    int v9 = 1;
  }

  return v9;
}

- (void)extractLocations:(int *)a3 locations_output:(id *)a4 output_size:(int64_t)a5
{
  if (a4)
  {
    int64_t v5 = a5;
    int64_t v8 = 8 * a5;
    int v9 = malloc_type_malloc(8 * a5, 0x54806415uLL);
    v10 = v9;
    if (v5 >= 1)
    {
      v11 = v9;
      do
      {
        uint64_t v12 = *a3++;
        *v11++ = v12;
        --v5;
      }
      while (v5);
    }
    *a4 = +[NSData dataWithBytes:v9 length:v8];
    free(v10);
  }
}

- (void)setTranslationMode:(unint64_t)a3
{
  if (_os_feature_enabled_impl())
  {
    if (!self->_useContraction)
    {
LABEL_7:
      CFStringRef v5 = @"{FGR 1}";
      goto LABEL_8;
    }
  }
  else if (a3 != 3)
  {
    if (a3 - 1 > 1) {
      return;
    }
    goto LABEL_7;
  }
  CFStringRef v5 = @"{FGR 2}";
LABEL_8:

  [(BRLRhineBrailleTranslator *)self sendCommand:v5];
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  v53 = a5;
  id v10 = a3;
  id v56 = a7;
  [(BRLRhineBrailleTranslator *)self setTranslationMode:a4];
  id v11 = v10;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v12 = self->_allPreprocessors;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v58 objects:v62 count:16];
  v55 = v11;
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v59;
    do
    {
      uint64_t v17 = 0;
      uint64_t v18 = v11;
      uint64_t v19 = v15;
      do
      {
        if (*(void *)v59 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v17);
        id v57 = 0;
        objc_msgSend(v20, "preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:", v18, &v57, 1, v56, v53, v55);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = v57;

        uint64_t v15 = +[BRLTPreprocessorHelper mergeLocationMap:v19 withLocationMap:v21];

        uint64_t v17 = (char *)v17 + 1;
        uint64_t v18 = v11;
        uint64_t v19 = v15;
      }
      while (v14 != v17);
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  id v22 = v11;
  id v23 = v22;
  uint64_t v24 = (const char *)[v23 cStringUsingEncoding:12];
  if (!v24)
  {
    v34 = sub_1F1EC();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1FCBC((uint64_t)v23, v34, v42, v43, v44, v45, v46, v47);
    }
    goto LABEL_34;
  }
  uint64_t v25 = (char *)v24;
  int v26 = 6 * strlen(v24);
  if (v26 >= 0x1FFFFFFF) {
    int v26 = 0x1FFFFFFF;
  }
  if (v26 <= 1) {
    size_t v27 = 1;
  }
  else {
    size_t v27 = v26;
  }
  v28 = malloc_type_malloc(v27, 0x100004077774924uLL);
  v29 = malloc_type_malloc(v27, 0x100004077774924uLL);
  v30 = malloc_type_malloc(4 * v27, 0x100004052888210uLL);
  v31 = v30;
  if (v28) {
    BOOL v32 = v29 == 0;
  }
  else {
    BOOL v32 = 1;
  }
  if (v32 || v30 == 0)
  {
    if (v28) {
      free(v28);
    }
    if (v29) {
      free(v29);
    }
    if (v31) {
      free(v31);
    }
    v34 = sub_1F1EC();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1FC1C(v34, v35, v36, v37, v38, v39, v40, v41);
    }
LABEL_34:

    v48 = 0;
    goto LABEL_40;
  }
  int v49 = wh_forward_translate(v25, v28, v27, v30);
  brl_convert_to_utf(v28, v29, v27);
  v48 = +[NSString stringWithCString:v29 encoding:4];
  if (v49)
  {
    v50 = sub_1F1EC();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_1FD28();
    }

    v48 = 0;
  }
  id v51 = objc_msgSend(v48, "length", v53);
  +[BRLTPreprocessorHelper mergePreprocessorOutputLocationMap:v15 outputToPreprocessedMap:v31 outputLen:v51 outputToTextMap:v54];
  free(v29);
  free(v28);
  free(v31);
LABEL_40:

  return v48;
}

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  id v8 = a3;
  [(BRLRhineBrailleTranslator *)self setTranslationMode:a4];
  id v9 = v8;
  id v10 = (char *)[v9 cStringUsingEncoding:4];
  int v11 = 6 * strlen(v10);
  if (v11 >= 0x1FFFFFFF) {
    int v11 = 0x1FFFFFFF;
  }
  if (v11 <= 1) {
    size_t v12 = 1;
  }
  else {
    size_t v12 = v11;
  }
  id v13 = malloc_type_malloc(v12, 0x100004077774924uLL);
  id v14 = malloc_type_malloc(v12, 0x100004077774924uLL);
  uint64_t v15 = malloc_type_malloc(4 * v12, 0x100004052888210uLL);
  uint64_t v16 = v15;
  if (v13) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17 || v15 == 0)
  {
    if (v13) {
      free(v13);
    }
    if (v14) {
      free(v14);
    }
    if (v16) {
      free(v16);
    }
    uint64_t v19 = sub_1F1EC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1FD90(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    size_t v27 = 0;
  }
  else
  {
    wh_backward_translate("%", (uint64_t)v14, v12, v15);
    brl_convert_from_utf((unsigned __int8 *)v10, v13, v12);
    if (wh_backward_translate(v13, (uint64_t)v14, v12, v16))
    {
      v29 = sub_1F1EC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1FDC8();
      }
    }
    size_t v27 = +[NSString stringWithCString:v14 encoding:12];
    -[BRLRhineBrailleTranslator extractLocations:locations_output:output_size:](self, "extractLocations:locations_output:output_size:", v16, a5, [v27 length]);
    free(v14);
    free(v13);
    free(v16);
  }

  return v27;
}

- (NSString)activeTable
{
  return self->_activeTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPreprocessors, 0);

  objc_storeStrong((id *)&self->_activeTable, 0);
}

@end