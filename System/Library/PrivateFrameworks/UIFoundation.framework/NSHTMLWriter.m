@interface NSHTMLWriter
+ (id)fontNameForFont:(id)a3;
- (BOOL)_closeBlocksForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5;
- (BOOL)_closeListsForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5;
- (BOOL)_isStrictByParsingExcludedElements;
- (Class)_webArchiveClass;
- (NSHTMLWriter)initWithAttributedString:(id)a3;
- (id)HTMLData;
- (id)HTMLFileWrapper;
- (id)_defaultValueForAttribute:(id)a3 range:(_NSRange)a4;
- (id)_prefix;
- (id)_prefixDown;
- (id)_prefixUp;
- (id)_resourceForFileWrapper:(id)a3 filename:(id *)a4;
- (id)_textAttributesForHighlightColor:(id)a3;
- (id)documentFragmentForDocument:(id)a3;
- (id)documentFragmentString;
- (id)markElementFor:(id)a3 spanClass:(unint64_t)a4 paraClass:(unint64_t)a5;
- (id)subresources;
- (id)webArchive;
- (id)webArchiveData;
- (unint64_t)_listClassForList:(id)a3;
- (unint64_t)_paragraphClassforParagraphStyle:(id)a3 presentationIntent:(id)a4 range:(_NSRange)a5 isEmpty:(BOOL)a6 isCompletelyEmpty:(BOOL)a7 headerString:(id *)a8 alignmentString:(id *)a9 directionString:(id *)a10 forWebKit:(BOOL)a11;
- (unint64_t)_spanClassForAttributes:(id)a3 inParagraphClass:(unint64_t)a4 spanClass:(unint64_t)a5 flags:(unint64_t *)a6 forWebKit:(BOOL)a7;
- (void)_addImageElementForResource:(id)a3 description:(id)a4 inString:(id)a5;
- (void)_addObjectElementForResource:(id)a3 description:(id)a4 inString:(id)a5;
- (void)_addSourceElementForResource:(id)a3 MIMEType:(id)a4 inString:(id)a5;
- (void)_appendAttachment:(id)a3 atIndex:(unint64_t)a4 toString:(id)a5;
- (void)_appendImageGlyph:(id)a3 withAttributes:(id)a4 toString:(id)a5;
- (void)_closeFlags:(unint64_t)a3 openFlags:(unint64_t)a4 inString:(id)a5;
- (void)_createWebArchiveData;
- (void)_generateHTML;
- (void)_generateHTMLForWebKit:(BOOL)a3;
- (void)_openBlocksForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5;
- (void)_openListsForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5 isStrict:(BOOL)a6;
- (void)_prepareString:(id)a3 forConversionToEncoding:(unint64_t)a4;
- (void)_writeDocumentPropertiesToString:(id)a3;
- (void)_writeDocumentProperty:(id)a3 value:(id)a4 toString:(id)a5;
- (void)dealloc;
- (void)readDocumentFragment:(id)a3;
- (void)setDocumentAttributes:(id)a3;
@end

@implementation NSHTMLWriter

- (Class)_webArchiveClass
{
  Class result = (Class)_webArchiveClass__webArchiveClass_980;
  if (!_webArchiveClass__webArchiveClass_980)
  {
    Class result = objc_lookUpClass("WebArchive");
    _webArchiveClass__webArchiveClass_980 = (uint64_t)result;
    if (!result)
    {
      __NSLoadWebKit();
      Class result = objc_lookUpClass("WebArchive");
      _webArchiveClass__webArchiveClass_980 = (uint64_t)result;
      if (!result)
      {
        NSLog((NSString *)@"Could not dynamically load the WebKit framework.");
        return (Class)_webArchiveClass__webArchiveClass_980;
      }
    }
  }
  return result;
}

- (NSHTMLWriter)initWithAttributedString:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSHTMLWriter;
  v4 = [(NSHTMLWriter *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_attrStr = (NSAttributedString *)a3;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTMLWriter;
  [(NSHTMLWriter *)&v3 dealloc];
}

- (void)setDocumentAttributes:(id)a3
{
  documentAttrs = self->_documentAttrs;
  if (documentAttrs != a3)
  {

    self->_documentAttrs = (NSDictionary *)a3;
  }
}

- (id)_prefix
{
  int64_t level = self->_level;
  if (level < 1) {
    return &stru_1EDD49F70;
  }
  else {
    return (id)[&stru_1EDD49F70 stringByPaddingToLength:self->_prefixSpaces * level withString:@" " startingAtIndex:0];
  }
}

- (id)_prefixUp
{
  int64_t level = self->_level;
  if (level < 1)
  {
    id result = &stru_1EDD49F70;
  }
  else
  {
    id result = (id)[&stru_1EDD49F70 stringByPaddingToLength:self->_prefixSpaces * level withString:@" " startingAtIndex:0];
    int64_t level = self->_level;
  }
  self->_int64_t level = level + 1;
  return result;
}

- (id)_prefixDown
{
  int64_t level = self->_level;
  self->_int64_t level = level - 1;
  if (level < 2) {
    return &stru_1EDD49F70;
  }
  else {
    return (id)[&stru_1EDD49F70 stringByPaddingToLength:self->_prefixSpaces * (level - 1) withString:@" " startingAtIndex:0];
  }
}

+ (id)fontNameForFont:(id)a3
{
  return _fontNameForFont((UIFont *)a3, 0);
}

- (id)_textAttributesForHighlightColor:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (!a3 || [a3 isEqual:@"NSTextHighlightColorSchemeDefault"])
  {
    if (_NSTextScalingTypeForCurrentEnvironment() == 1) {
      id v4 = +[NSTextLayoutManager textHighlightAttributes_iOS];
    }
    else {
      id v4 = (id)+[NSTextLayoutManager textHighlightAttributes_macOS];
    }
    SEL v5 = (SEL)[v4 objectForKeyedSubscript:@"NSColor"];
    if (v5) {
      goto LABEL_7;
    }
    return (id)MEMORY[0x1E4F1CC08];
  }
  objc_super v7 = objc_opt_class();
  objc_sync_enter(v7);
  SEL v5 = (SEL)[(id)_textAttributesForHighlightColor__colorSchemeTable objectForKeyedSubscript:a3];
  if (!v5)
  {
    if ([a3 isEqualToString:@"NSTextHighlightColorSchemePurple"])
    {
      uint64_t v8 = [(Class)getNSColorClass_4[0]() systemPurpleColor];
      goto LABEL_29;
    }
    if ([a3 isEqualToString:@"NSTextHighlightColorSchemePink"])
    {
      uint64_t v8 = [(Class)getNSColorClass_4[0]() systemPinkColor];
      goto LABEL_29;
    }
    if ([a3 isEqualToString:@"NSTextHighlightColorSchemeOrange"])
    {
      uint64_t v8 = [(Class)getNSColorClass_4[0]() systemOrangeColor];
      goto LABEL_29;
    }
    if ([a3 isEqualToString:@"NSTextHighlightColorSchemeMint"])
    {
      uint64_t v8 = [(Class)getNSColorClass_4[0]() systemMintColor];
      goto LABEL_29;
    }
    if ([a3 isEqualToString:@"NSTextHighlightColorSchemeBlue"])
    {
      uint64_t v8 = [(Class)getNSColorClass_4[0]() systemBlueColor];
LABEL_29:
      SEL v5 = (SEL)v8;
      if (v8)
      {
        id v13 = (id)_textAttributesForHighlightColor__colorSchemeTable;
        if (!_textAttributesForHighlightColor__colorSchemeTable)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          _textAttributesForHighlightColor__colorSchemeTable = (uint64_t)v13;
        }
        [v13 setObject:v5 forKeyedSubscript:a3];
      }
      goto LABEL_33;
    }
    uint64_t v11 = [a3 rangeOfString:@"NSTextHighlightColorScheme" options:8];
    v12 = (NSString *)a3;
    if (v10) {
      v12 = (NSString *)[NSString stringWithFormat:@"system%@Color", objc_msgSend(a3, "substringFromIndex:", v11 + v10)];
    }
    SEL v5 = NSSelectorFromString(v12);
    if (v5)
    {
      getNSColorClass_4[0]();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        SEL v5 = 0;
        goto LABEL_33;
      }
      uint64_t v8 = [(Class)getNSColorClass_4[0]() performSelector:v5];
      goto LABEL_29;
    }
  }
LABEL_33:
  objc_sync_exit(v7);
  if (!v5) {
    return (id)MEMORY[0x1E4F1CC08];
  }
LABEL_7:
  if (_NSTextScalingTypeForCurrentEnvironment() == 1) {
    id v6 = +[NSTextLayoutManager textHighlightBackgroundColorForForegroundColor_iOS:v5];
  }
  else {
    id v6 = (id)+[NSTextLayoutManager textHighlightBackgroundColorForForegroundColor_macOS:v5];
  }
  if (v6)
  {
    v16[0] = @"NSColor";
    v16[1] = @"NSBackgroundColor";
    v17[0] = v5;
    v17[1] = v6;
    return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    v14 = @"NSColor";
    SEL v15 = v5;
    return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  }
}

- (unint64_t)_spanClassForAttributes:(id)a3 inParagraphClass:(unint64_t)a4 spanClass:(unint64_t)a5 flags:(unint64_t *)a6 forWebKit:(BOOL)a7
{
  BOOL v85 = a7;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v98 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v95 = [a3 objectForKey:@"NSFont"];
  uint64_t v10 = (void *)[a3 objectForKey:@"NSColor"];
  uint64_t v11 = [a3 objectForKey:@"NSBackgroundColor"];
  uint64_t v101 = [a3 objectForKey:@"NSStrokeColor"];
  uint64_t v12 = [a3 objectForKey:@"NSTextHighlightColorScheme"];
  int v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"NSTextHighlightStyle"), "isEqual:", @"NSTextHighlightStyleDefault");
  v89 = (void *)[a3 objectForKey:@"NSUnderline"];
  v88 = (void *)[a3 objectForKey:@"NSStrikethrough"];
  v90 = (void *)[a3 objectForKey:@"NSSuperScript"];
  v84 = (void *)[a3 objectForKey:@"NSBaselineOffset"];
  v91 = (void *)[a3 objectForKey:@"NSKern"];
  v100 = (void *)[a3 objectForKey:@"NSStrokeWidth"];
  v92 = (void *)[a3 objectForKey:@"NSLigature"];
  v94 = (void *)[a3 objectForKey:@"NSShadow"];
  v99 = self;
  v93 = (void *)[a3 objectForKey:@"NSWritingDirection"];
  if (v13)
  {
    id v14 = [(NSHTMLWriter *)self _textAttributesForHighlightColor:v12];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"NSColor"];
    uint64_t v16 = [v14 objectForKeyedSubscript:@"NSBackgroundColor"];
    if (v15) {
      uint64_t v10 = (void *)v15;
    }
    if (v16) {
      v17 = (void *)v16;
    }
    else {
      v17 = (void *)v11;
    }
  }
  else
  {
    v17 = (void *)v11;
  }
  uint64_t v18 = v101;
  if (v100)
  {
    if (!v101) {
      uint64_t v18 = (uint64_t)v10;
    }
    v19 = self;
    if (!v18) {
      uint64_t v18 = [(Class)getNSColorClass_4[0]() blackColor];
    }
  }
  else
  {
    v19 = self;
  }
  v102 = (void *)v18;
  if (a5)
  {
    v20 = (void *)[(NSMutableArray *)v19->_charStyleArrays objectAtIndex:a5 - 1];
    uint64_t v21 = objc_msgSend((id)objc_msgSend(v20, "objectAtIndex:", 2), "unsignedIntegerValue");
    uint64_t v22 = objc_msgSend((id)objc_msgSend(v20, "objectAtIndex:", 3), "unsignedIntegerValue");
    uint64_t v23 = objc_msgSend((id)objc_msgSend(v20, "objectAtIndex:", 4), "unsignedIntegerValue");
    if (a4) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4)
    {
LABEL_16:
      v24 = (void *)[(NSMutableArray *)v19->_paraStyleArrays objectAtIndex:a4 - 1];
      v25 = v24;
      if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v21 = objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 2), "unsignedIntegerValue");
      }
      if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v22 = objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", 3), "unsignedIntegerValue");
      }
      uint64_t v26 = v23;
      BOOL v39 = v23 == 0x7FFFFFFFFFFFFFFFLL;
      v27 = (UIFont *)v95;
      if (v39) {
        uint64_t v26 = objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", 4), "unsignedIntegerValue");
      }
      if (v95) {
        goto LABEL_29;
      }
      goto LABEL_27;
    }
  }
  uint64_t v26 = v23;
  v27 = (UIFont *)v95;
  if (v95) {
    goto LABEL_29;
  }
LABEL_27:
  if ((*(unsigned char *)&v19->_flags & 2) != 0)
  {
    v27 = 0;
    goto LABEL_36;
  }
  v27 = (UIFont *)NSDefaultFont();
  if (!v27)
  {
LABEL_36:
    v28 = &stru_1EDD49F70;
    goto LABEL_37;
  }
LABEL_29:
  v28 = (__CFString *)[(NSMutableDictionary *)v19->_fontNames objectForKey:v27];
  if (!v28)
  {
    v28 = _fontNameForFont(v27, v85);
    if (v28) {
      [(NSMutableDictionary *)v19->_fontNames setObject:v28 forKey:v27];
    }
  }
  v29 = (void *)[(NSMutableDictionary *)v19->_fontDescriptions objectForKey:v27];
  if (!v29)
  {
    v29 = objc_msgSend(-[UIFont htmlMarkupDescriptionForWebKit:](v27, "htmlMarkupDescriptionForWebKit:", v85), "mutableCopy");
    objc_msgSend(v29, "replaceOccurrencesOfString:withString:options:range:", @"\", @"'", 0, 0, objc_msgSend(v29, "length""));
    [(NSMutableDictionary *)v19->_fontDescriptions setObject:v29 forKey:v27];
  }
  [v9 appendFormat:@"%@; ", v29];
LABEL_37:
  v30 = &stru_1EDD49F70;
  if (v28) {
    v30 = v28;
  }
  v96 = v30;
  if (v100)
  {
    [v100 doubleValue];
    if (v31 != 0.0)
    {
      [v100 doubleValue];
      if (v32 > 0.0) {
        uint64_t v10 = (void *)[(Class)getNSColorClass_4[0]() clearColor];
      }
    }
  }
  if (v89)
  {
    v33 = &stru_1EDD49F70;
    if ([v89 unsignedIntegerValue])
    {
      BOOL v39 = (v19->_excludedElements2 & 0x4000000) == 0;
      unint64_t v34 = v39;
      if (!v39) {
        v33 = @"underline ";
      }
    }
    else
    {
      unint64_t v34 = 0;
    }
  }
  else
  {
    unint64_t v34 = 0;
    v33 = &stru_1EDD49F70;
  }
  if (v88)
  {
    v35 = &stru_1EDD49F70;
    if ([v88 integerValue])
    {
      if ((v99->_excludedElements2 & 0x2400) == 0x2400) {
        v35 = @"line-through ";
      }
      else {
        v34 |= 2uLL;
      }
    }
  }
  else
  {
    v35 = &stru_1EDD49F70;
  }
  if ([(__CFString *)v33 length] || [(__CFString *)v35 length]) {
    [v9 appendFormat:@"text-decoration: %@%@; ", v33, v35];
  }
  v36 = &stru_1EDD49F70;
  if (v90)
  {
    uint64_t v37 = [v90 integerValue];
    if (v37 < 1)
    {
      if ((v37 & 0x8000000000000000) == 0) {
        goto LABEL_68;
      }
      unsigned int excludedElements2 = v99->_excludedElements2;
      BOOL v39 = (excludedElements2 & 0x10000) == 0;
      if ((excludedElements2 & 0x10000) == 0) {
        v34 |= 0x20uLL;
      }
      v40 = @"sub";
    }
    else
    {
      unsigned int v38 = v99->_excludedElements2;
      BOOL v39 = (v38 & 0x20000) == 0;
      if ((v38 & 0x20000) == 0) {
        v34 |= 0x10uLL;
      }
      v40 = @"super";
    }
    if (!v39) {
      v36 = v40;
    }
  }
LABEL_68:
  if ([(__CFString *)v36 length])
  {
    [v9 appendFormat:@"vertical-align: %@; ", v36];
  }
  else if (v84)
  {
    [v84 doubleValue];
    if (v43 != 0.0)
    {
      [v84 doubleValue];
      objc_msgSend(v9, "appendFormat:", @"vertical-align: %.1fpx; ", v44);
    }
  }
  if (v91)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v91 doubleValue];
      if (fabs(v41) >= 2.22044605e-16)
      {
        double v82 = v41;
        v42 = @"letter-spacing: %.1fpx; ";
      }
      else
      {
        v42 = @"font-kerning: none; ";
      }
      objc_msgSend(v9, "appendFormat:", v42, *(void *)&v82);
    }
  }
  if (v92)
  {
    unsigned int v45 = [v92 intValue];
    if (v45 <= 2) {
      [v9 appendFormat:off_1E55CDF40[v45]];
    }
  }
  if (v10) {
    uint64_t v46 = _colorValForColor_0(v10);
  }
  else {
    uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v47 = v17;
  if (v46 != v21)
  {
    if ((_BYTE)v46 == 0xFF)
    {
      if (v46 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v48 = 0;
      }
      else {
        uint64_t v48 = v46 >> 8;
      }
      objc_msgSend(v9, "appendFormat:", @"color: #%.6x; ", v48);
      LODWORD(v49) = v46 >> 8;
    }
    else
    {
      [v9 appendFormat:@"color: %@; ", _rgbaString(v46)];
      LODWORD(v49) = v46 >> 8;
    }
    if (v46 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v49 = 0;
    }
    else {
      uint64_t v49 = v49;
    }
    objc_msgSend(v98, "appendFormat:", @" color=\"#%.6x\"", v49);
    v47 = v17;
  }
  if (!v47)
  {
    BOOL v39 = v22 == 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    v51 = v98;
    if (v39) {
      goto LABEL_108;
    }
    goto LABEL_102;
  }
  uint64_t v50 = _colorValForColor_0(v47);
  v51 = v98;
  if (v50 == v22) {
    goto LABEL_108;
  }
  uint64_t v52 = v50;
  if (v50 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_102:
    [v9 appendString:@"background-color: transparent; "];
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_108;
  }
  if ((_BYTE)v50 == 0xFF) {
    objc_msgSend(v9, "appendFormat:", @"background-color: #%.6x; ", v50 >> 8);
  }
  else {
    [v9 appendFormat:@"background-color: %@; ", _rgbaString(v50)];
  }
  uint64_t v22 = v52;
LABEL_108:
  if (v102) {
    uint64_t v54 = _colorValForColor_0(v102);
  }
  else {
    uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v54 != v26)
  {
    [(UIFont *)v27 pointSize];
    double v56 = v55 * 0.01;
    [v100 doubleValue];
    *(float *)&double v57 = v56 * v57;
    float v58 = fabsf(*(float *)&v57);
    if ((_BYTE)v54 == 0xFF)
    {
      LODWORD(v59) = v54 >> 8;
      if (v54 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v59 = 0;
      }
      else {
        uint64_t v59 = v59;
      }
      objc_msgSend(v9, "appendFormat:", @"-webkit-text-stroke: %.3gpx #%.6x; ", v58, v59);
    }
    else
    {
      [v9 appendFormat:@"-webkit-text-stroke: %.3gpx %@; ", v58, _rgbaString(v54)];
    }
  }
  if (v94)
  {
    [v94 shadowOffset];
    uint64_t v61 = v60;
    uint64_t v63 = v62;
    [v94 shadowBlurRadius];
    uint64_t v65 = v64;
    uint64_t v66 = [v94 shadowColor];
    if (!v66)
    {
      uint64_t v69 = 2863311360;
LABEL_128:
      objc_msgSend(v9, "appendFormat:", @"text-shadow: %.1fpx %.1fpx %.1fpx %@; ",
        v61,
        v63,
        v65,
        _rgbaString(v69));
      goto LABEL_131;
    }
    v67 = (void *)v66;
    getUIColorClass_0[0]();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v106 = 0.0;
      v107[0] = 0.0;
      double v104 = 0.0;
      double v105 = 0.0;
      double v103 = 0.0;
      if ([v67 getRed:v107 green:&v106 blue:&v105 alpha:&v104])
      {
        unsigned int v68 = (vcvtmd_s64_f64((1.0 - (1.0 - v107[0]) * v104) * 255.0 + 0.5) << 24) | (vcvtmd_s64_f64((1.0 - (1.0 - v106) * v104)* 255.0+ 0.5) << 16) | (vcvtmd_s64_f64((1.0 - (1.0 - v105) * v104) * 255.0 + 0.5) << 8) | vcvtmd_s64_f64(v104 * 255.0 + 0.5);
        goto LABEL_126;
      }
      if ([v67 getWhite:&v103 alpha:&v104])
      {
        unsigned int v68 = (16843008 * vcvtmd_s64_f64((1.0 - (1.0 - v103) * v104) * 255.0 + 0.5)) | vcvtmd_s64_f64(v104 * 255.0 + 0.5);
LABEL_126:
        uint64_t v69 = (int)v68;
        if ((_BYTE)v68 == 0xFF)
        {
          uint64_t v70 = v68 >> 8;
LABEL_130:
          objc_msgSend(v9, "appendFormat:", @"text-shadow: %.1fpx %.1fpx %.1fpx #%.6x; ", v61, v63, v65, v70);
          goto LABEL_131;
        }
        goto LABEL_128;
      }
    }
    uint64_t v70 = 0;
    goto LABEL_130;
  }
LABEL_131:
  if (v93 && [v93 count])
  {
    char v71 = objc_msgSend((id)objc_msgSend(v93, "objectAtIndex:", 0), "unsignedIntegerValue");
    v72 = @"rtl";
    if ((v71 & 1) == 0) {
      v72 = @"ltr";
    }
    v73 = @"bidi-override";
    if ((v71 & 2) == 0) {
      v73 = @"embed";
    }
    [v9 appendFormat:@"direction: %@; unicode-bidi: %@; ", v72, v73];
  }
  if ([v9 length])
  {
    while (([v9 hasSuffix:@" "] & 1) != 0
         || [v9 hasSuffix:@";"])
      objc_msgSend(v9, "deleteCharactersInRange:", objc_msgSend(v9, "length") - 1, 1);
    uint64_t v74 = [(NSMutableOrderedSet *)v99->_charStyleStrings indexOfObject:v9];
    if (v74 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v74 = [(NSMutableOrderedSet *)v99->_charStyleStrings count];
      [(NSMutableOrderedSet *)v99->_charStyleStrings addObject:v9];
      [(NSMutableArray *)v99->_fontStrings addObject:v51];
      charStyleArrays = v99->_charStyleArrays;
      v76 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v77 = [NSNumber numberWithDouble:12.0];
      uint64_t v78 = [NSNumber numberWithUnsignedInteger:v46];
      uint64_t v79 = [NSNumber numberWithUnsignedInteger:v22];
      uint64_t v83 = v77;
      v51 = v98;
      -[NSMutableArray addObject:](charStyleArrays, "addObject:", objc_msgSend(v76, "arrayWithObjects:", v96, v83, v78, v79, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v54), 0));
    }
    unint64_t v80 = v74 + 1;
  }
  else
  {
    unint64_t v80 = 0;
  }

  if (a6) {
    *a6 = v34;
  }
  return v80;
}

- (id)_defaultValueForAttribute:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  int v8 = objc_msgSend(@"NSFont", "isEqualToString:");
  if ([a3 isEqualToString:@"NSBackgroundColor"])
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    attrStr = self->_attrStr;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __48__NSHTMLWriter__defaultValueForAttribute_range___block_invoke;
    v31[3] = &unk_1E55C6630;
    v31[4] = &v32;
    [(NSAttributedString *)attrStr enumerateAttribute:@"NSBackgroundColor", location, length, 0, v31 inRange options usingBlock];
    int v10 = *((unsigned __int8 *)v33 + 24);
    _Block_object_dispose(&v32, 8);
    if (v10) {
      return 0;
    }
  }
  uint64_t v11 = 0;
  if (location) {
    NSUInteger v12 = (__PAIR128__(location, length) - 1) >> 64;
  }
  else {
    NSUInteger v12 = 0;
  }
  NSUInteger v30 = location + length;
  if (v12 < location + length)
  {
    uint64_t v11 = 0;
    CFMutableDictionaryRef Mutable = 0;
    id v14 = 0;
    NSUInteger v29 = length;
    int v28 = v8;
    while (1)
    {
      uint64_t v15 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_attrStr, "attribute:atIndex:longestEffectiveRange:inRange:", a3);
      uint64_t v16 = v15;
      if (length <= 2 * v37)
      {
        uint64_t v11 = v15;
        if (Mutable)
        {
LABEL_28:
          CFRelease(Mutable);
          return v11;
        }
        return v11;
      }
      int v17 = v15 ? v8 : 0;
      if (v17 == 1) {
        break;
      }
LABEL_22:
      if (!Mutable) {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
      }
      Value = (char *)CFDictionaryGetValue(Mutable, v16);
      uint64_t v26 = &Value[v37];
      CFDictionarySetValue(Mutable, v16, &Value[v37]);
      if (v26 > v14)
      {
        id v14 = v26;
        uint64_t v11 = v16;
      }
      if (v37 + v36 >= v30)
      {
        if (!Mutable) {
          return v11;
        }
        goto LABEL_28;
      }
    }
    uint64_t v18 = self;
    id v19 = a3;
    int v20 = [(UIFont *)v15 traits];
    int v21 = v20;
    if ((v20 & 2) != 0)
    {
      uint64_t v23 = [(UIFont *)v16 familyName];
      [(UIFont *)v16 pointSize];
      uint64_t v22 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v23, v21 & 0xFFFFFFFD);
      if ((v21 & 1) == 0)
      {
LABEL_19:
        a3 = v19;
        if (v22) {
          uint64_t v16 = v22;
        }
        self = v18;
        NSUInteger length = v29;
        int v8 = v28;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v22 = v16;
      if ((v20 & 1) == 0) {
        goto LABEL_19;
      }
    }
    uint64_t v24 = [(UIFont *)v22 familyName];
    [(UIFont *)v22 pointSize];
    uint64_t v22 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v24, v21 & 0xFFFFFFFE);
    goto LABEL_19;
  }
  return v11;
}

uint64_t __48__NSHTMLWriter__defaultValueForAttribute_range___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (!a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (unint64_t)_paragraphClassforParagraphStyle:(id)a3 presentationIntent:(id)a4 range:(_NSRange)a5 isEmpty:(BOOL)a6 isCompletelyEmpty:(BOOL)a7 headerString:(id *)a8 alignmentString:(id *)a9 directionString:(id *)a10 forWebKit:(BOOL)a11
{
  BOOL v86 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v17 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [a3 headIndent];
  double v19 = v18;
  [a3 firstLineHeadIndent];
  double v21 = v20;
  [a3 tailIndent];
  double v23 = v22;
  [a3 paragraphSpacingBefore];
  uint64_t v25 = v24;
  [a3 paragraphSpacing];
  uint64_t v27 = v26;
  [a3 minimumLineHeight];
  double v29 = v28;
  [a3 hyphenationFactor];
  float v31 = v30;
  uint64_t v32 = [a3 alignment];
  uint64_t v33 = [a3 baseWritingDirection];
  uint64_t v34 = [a3 headerLevel];
  char v35 = (void *)[a3 textLists];
  if ([v35 count])
  {
    uint64_t v36 = (void *)[v35 lastObject];
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v36 = 0;
  if (a4) {
LABEL_3:
  }
    LODWORD(a4) = [a4 intentKind] == 6;
LABEL_4:
  if (!v36) {
    goto LABEL_13;
  }
  int v37 = [v36 isOrdered];
  unsigned int excludedElements2 = self->_excludedElements2;
  if (v37)
  {
    if ((excludedElements2 & 0x40) != 0) {
      goto LABEL_13;
    }
  }
  else if ((excludedElements2 & 0x8000000) != 0)
  {
    goto LABEL_13;
  }
  if ((excludedElements2 & 4) == 0)
  {
    BOOL v39 = @"li";
    double v21 = 0.0;
    double v19 = 0.0;
    goto LABEL_35;
  }
LABEL_13:
  if (v34 < 1)
  {
LABEL_25:
    BOOL v39 = 0;
LABEL_26:
    if (v39) {
      int v40 = 0;
    }
    else {
      int v40 = (int)a4;
    }
    if (v40 == 1)
    {
      if ((self->_excludedElements1 & 0x200) == 0)
      {
        BOOL v39 = @"blockquote";
        goto LABEL_35;
      }
    }
    else if (v39)
    {
      goto LABEL_35;
    }
    if ((self->_excludedElements2 & 0x80) != 0)
    {
      BOOL v39 = 0;
      uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
      double v49 = 12.0;
      uint64_t v44 = &stru_1EDD49F70;
      v84 = &stru_1EDD49F70;
      BOOL v85 = &stru_1EDD49F70;
      uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_95;
    }
    BOOL v39 = @"p";
  }
  else
  {
    switch(v34)
    {
      case 1:
        if ((self->_excludedElements1 & 0x800000) != 0) {
          goto LABEL_25;
        }
        BOOL v39 = @"h1";
        break;
      case 2:
        if ((self->_excludedElements1 & 0x1000000) != 0) {
          goto LABEL_25;
        }
        BOOL v39 = @"h2";
        break;
      case 3:
        if ((self->_excludedElements1 & 0x2000000) != 0) {
          goto LABEL_25;
        }
        BOOL v39 = @"h3";
        break;
      case 4:
        if ((self->_excludedElements1 & 0x4000000) != 0) {
          goto LABEL_25;
        }
        BOOL v39 = @"h4";
        break;
      case 5:
        if ((self->_excludedElements1 & 0x8000000) != 0) {
          goto LABEL_25;
        }
        BOOL v39 = @"h5";
        break;
      case 6:
        if ((self->_excludedElements1 & 0x10000000) != 0) {
          BOOL v39 = 0;
        }
        else {
          BOOL v39 = @"h6";
        }
        goto LABEL_26;
      default:
        goto LABEL_25;
    }
  }
LABEL_35:
  double v41 = -v23;
  if (v23 >= 0.0) {
    double v41 = 0.0;
  }
  objc_msgSend(v17, "appendFormat:", @"margin: %.1fpx %.1fpx %.1fpx %.1fpx; ",
    v25,
    *(void *)&v41,
    v27,
    *(void *)&v19);
  if (v33 == -1) {
    uint64_t v33 = _NSStringImputedBaseWritingDirectionAtIndex((const __CFString *)[(NSAttributedString *)self->_attrStr string], location, location, length);
  }
  uint64_t v42 = v32 - 1;
  if ((unint64_t)(v32 - 1) < 3)
  {
    double v43 = off_1E55CDF58[v42];
    uint64_t v44 = off_1E55CDF70[v42];
LABEL_44:
    [v17 appendString:v43];
    goto LABEL_45;
  }
  if (v32)
  {
    uint64_t v44 = &stru_1EDD49F70;
    goto LABEL_45;
  }
  uint64_t v44 = &stru_1EDD49F70;
  if (v33 == 1)
  {
    uint64_t v44 = @" align=\"left\"";
    double v43 = @"text-align: left; ";
    goto LABEL_44;
  }
LABEL_45:
  unsigned int v45 = &stru_1EDD49F70;
  if (v31 > 0.0) {
    [v17 appendString:@"-webkit-hyphens: auto; "];
  }
  uint64_t v46 = @" dir=\"rtl\"";
  if (v33 != 1) {
    uint64_t v46 = &stru_1EDD49F70;
  }
  BOOL v85 = v46;
  if (v21 != v19) {
    objc_msgSend(v17, "appendFormat:", @"text-indent: %.1fpx; ", v21 - v19);
  }
  if (v29 > 0.0) {
    objc_msgSend(v17, "appendFormat:", @"line-height: %.1fpx; ", *(void *)&v29);
  }
  if (length >= 0x400) {
    NSUInteger length = 1024;
  }
  if ((self->_excludedElements1 & 0x400000) != 0 || a7)
  {
    v51 = [(NSHTMLWriter *)self _defaultValueForAttribute:@"NSFont", location, length range];
    if (v51)
    {
      uint64_t v52 = v51;
      [(UIFont *)v51 pointSize];
      double v49 = v53;
      uint64_t v54 = (__CFString *)[(NSMutableDictionary *)self->_fontNames objectForKey:v52];
      if (!v54)
      {
        uint64_t v54 = _fontNameForFont(v52, a11);
        if (v54) {
          [(NSMutableDictionary *)self->_fontNames setObject:v54 forKey:v52];
        }
      }
      +[NSTypesetter defaultTypesetterBehavior];
      [(UIFont *)v52 _defaultLineHeightForUILayout];
      double v56 = v55;
      [(UIFont *)v52 _leading];
      double v48 = v56 + v57;
    }
    else
    {
      double v48 = 14.0;
      uint64_t v54 = &stru_1EDD49F70;
      double v49 = 12.0;
    }
    BOOL v50 = v86;
    if (v54) {
      unsigned int v45 = v54;
    }
    if (v49 <= 0.0) {
      double v49 = 12.0;
    }
    if ([(__CFString *)v45 length])
    {
      float v58 = _escapedStringForString(v45, 1);
      objc_msgSend(v58, "rangeOfCharacterFromSet:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "alphanumericCharacterSet"), "invertedSet"));
      if (v59) {
        float v58 = (void *)[NSString stringWithFormat:@"'%@'", v58];
      }
      [v17 appendFormat:@"font: %.1fpx %@; ", *(void *)&v49, v58];
    }
    v84 = v45;
    id v60 = [(NSHTMLWriter *)self _defaultValueForAttribute:@"NSColor", location, length range];
    uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
    if (v60)
    {
      uint64_t v61 = _colorValForColor_0(v60);
      if (v61 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v62 = v61;
        char v63 = ~(_BYTE)v61;
        objc_msgSend(v17, "appendFormat:", @"color: #%.6x; ", v61 >> 8);
        if (v63) {
          [v17 appendFormat:@"color: %@; ", _rgbaString(v62)];
        }
        uint64_t v47 = v62;
      }
    }
    id v64 = [(NSHTMLWriter *)self _defaultValueForAttribute:@"NSStrokeColor", location, length range];
    if (v64 && (uint64_t v65 = _colorValForColor_0(v64), v65 != 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v83 = v65;
      if ((_BYTE)v65 == 0xFF) {
        objc_msgSend(v17, "appendFormat:", @"-webkit-text-stroke: #%.6x; ", v65 >> 8);
      }
      else {
        [v17 appendFormat:@"-webkit-text-stroke: %@; ", _rgbaString(v65)];
      }
    }
    else
    {
      uint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
    double v48 = 14.0;
    double v49 = 12.0;
    uint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
    v84 = &stru_1EDD49F70;
    BOOL v50 = v86;
  }
  id v67 = [(NSHTMLWriter *)self _defaultValueForAttribute:@"NSBackgroundColor", location, length range];
  uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
  if (v67)
  {
    uint64_t v68 = _colorValForColor_0(v67);
    if (v68 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v69 = v68;
      char v70 = ~(_BYTE)v68;
      objc_msgSend(v17, "appendFormat:", @"background-color: #%.6x; ", v68 >> 8);
      if (v70) {
        [v17 appendFormat:@"background-color: %@; ", _rgbaString(v69)];
      }
      uint64_t v66 = v69;
    }
  }
  if (v50) {
    objc_msgSend(v17, "appendFormat:", @"min-height: %.1fpx; ", *(void *)&v48);
  }
LABEL_95:
  if ([v17 length])
  {
    while (([v17 hasSuffix:@" "] & 1) != 0
         || [v17 hasSuffix:@";"])
      objc_msgSend(v17, "deleteCharactersInRange:", objc_msgSend(v17, "length") - 1, 1);
    uint64_t v71 = [(NSMutableArray *)self->_paraStyleStrings indexOfObject:v17];
    if (v71 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v71 = [(NSMutableArray *)self->_paraStyleStrings count];
      [(NSMutableArray *)self->_paraStyleStrings addObject:v17];
      paraStyleArrays = self->_paraStyleArrays;
      v87 = self;
      v72 = v39;
      v73 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v74 = [NSNumber numberWithDouble:v49];
      uint64_t v75 = [NSNumber numberWithUnsignedInteger:v47];
      uint64_t v76 = [NSNumber numberWithUnsignedInteger:v66];
      uint64_t v81 = [NSNumber numberWithUnsignedInteger:v83];
      uint64_t v77 = v73;
      BOOL v39 = v72;
      self = v87;
      -[NSMutableArray addObject:](paraStyleArrays, "addObject:", objc_msgSend(v77, "arrayWithObjects:", v84, v74, v75, v76, v81, 0));
    }
    unint64_t v78 = v71 + 1;
    if ([@"p" isEqualToString:v39]) {
      [(NSMutableIndexSet *)self->_paraStyleIndexes addIndex:v78];
    }
    uint64_t v79 = a8;
    if ([@"li" isEqualToString:v39]) {
      [(NSMutableIndexSet *)self->_listItemStyleIndexes addIndex:v78];
    }
  }
  else
  {
    unint64_t v78 = 0;
    uint64_t v79 = a8;
  }

  if (v79) {
    *uint64_t v79 = v39;
  }
  if (a9) {
    *a9 = v44;
  }
  if (a10) {
    *a10 = v85;
  }
  return v78;
}

- (void)_writeDocumentProperty:(id)a3 value:(id)a4 toString:(id)a5
{
  if (a3 && a4)
  {
    id v9 = [(NSHTMLWriter *)self _prefix];
    int v10 = _escapedStringForString(a4, 1);
    if ((self->_excludedElements2 & 0x10000000) != 0) {
      uint64_t v11 = &stru_1EDD49F70;
    }
    else {
      uint64_t v11 = @" /";
    }
    [a5 appendFormat:@"%@<meta name=\"%@\" content=\"%@\"%@>\n", v9, a3, v10, v11];
  }
}

- (void)_writeDocumentPropertiesToString:(id)a3
{
  unsigned int excludedElements2 = self->_excludedElements2;
  if ((excludedElements2 & 0x800000) == 0)
  {
    [a3 appendFormat:@"%@<title>%@</title>\n", -[NSHTMLWriter _prefix](self, "_prefix"), _escapedStringForString(-[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", @"NSTitleDocumentAttribute", 0)];
    unsigned int excludedElements2 = self->_excludedElements2;
  }
  if ((excludedElements2 & 0x10) == 0)
  {
    id v6 = [(NSDictionary *)self->_documentAttrs objectForKey:@"NSKeywordsDocumentAttribute"];
    id v7 = [(NSDictionary *)self->_documentAttrs objectForKey:@"NSCreationTimeDocumentAttribute"];
    id v8 = [(NSDictionary *)self->_documentAttrs objectForKey:@"NSModificationTimeDocumentAttribute"];
    if (v6)
    {
      if ([v6 count]) {
        id v6 = (id)[v6 componentsJoinedByString:@", "];
      }
      else {
        id v6 = 0;
      }
    }
    id v9 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    int v10 = (void *)[v9 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v11 = v10;
    if (v7)
    {
      NSUInteger v12 = (void *)[v10 components:252 fromDate:v7];
      id v7 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%04d-%02d-%02dT%02d:%02d:%02dZ", objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day"), objc_msgSend(v12, "hour"), objc_msgSend(v12, "minute"), (__int16)objc_msgSend(v12, "second"));
      if (!v8)
      {
LABEL_12:

        [(NSHTMLWriter *)self _writeDocumentProperty:@"Author" value:[(NSDictionary *)self->_documentAttrs objectForKey:@"NSAuthorDocumentAttribute"] toString:a3];
        [(NSHTMLWriter *)self _writeDocumentProperty:@"LastAuthor" value:[(NSDictionary *)self->_documentAttrs objectForKey:@"NSEditorDocumentAttribute"] toString:a3];
        [(NSHTMLWriter *)self _writeDocumentProperty:@"Company" value:[(NSDictionary *)self->_documentAttrs objectForKey:@"NSCompanyDocumentAttribute"] toString:a3];
        [(NSHTMLWriter *)self _writeDocumentProperty:@"Copyright" value:[(NSDictionary *)self->_documentAttrs objectForKey:@"NSCopyrightDocumentAttribute"] toString:a3];
        [(NSHTMLWriter *)self _writeDocumentProperty:@"Subject" value:[(NSDictionary *)self->_documentAttrs objectForKey:@"NSSubjectDocumentAttribute"] toString:a3];
        [(NSHTMLWriter *)self _writeDocumentProperty:@"Description" value:[(NSDictionary *)self->_documentAttrs objectForKey:@"NSCommentDocumentAttribute"] toString:a3];
        [(NSHTMLWriter *)self _writeDocumentProperty:@"Keywords" value:v6 toString:a3];
        [(NSHTMLWriter *)self _writeDocumentProperty:@"CreationTime" value:v7 toString:a3];
        [(NSHTMLWriter *)self _writeDocumentProperty:@"ModificationTime" value:v8 toString:a3];
        [(NSHTMLWriter *)self _writeDocumentProperty:@"Generator" value:@"Cocoa HTML Writer" toString:a3];
        return;
      }
    }
    else
    {
      NSUInteger v12 = 0;
      if (!v8) {
        goto LABEL_12;
      }
    }
    [v11 components:252 fromDate:v8];
    id v8 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%04d-%02d-%02dT%02d:%02d:%02dZ", objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day"), objc_msgSend(v12, "hour"), objc_msgSend(v12, "minute"), (__int16)objc_msgSend(v12, "second"));
    goto LABEL_12;
  }
}

- (void)_closeFlags:(unint64_t)a3 openFlags:(unint64_t)a4 inString:(id)a5
{
  int v6 = a4;
  int v7 = a3;
  char v9 = a4 ^ a3;
  if ((a4 ^ a3))
  {
    BOOL v11 = 0;
    int v10 = 63;
    if ((a3 & 0x20) == 0) {
      goto LABEL_19;
    }
  }
  else if (((a4 ^ a3) & 2) != 0)
  {
    BOOL v11 = 0;
    int v10 = 62;
    if ((a3 & 0x20) == 0) {
      goto LABEL_19;
    }
  }
  else if (((a4 ^ a3) & 4) != 0)
  {
    BOOL v11 = 0;
    int v10 = 60;
    if ((a3 & 0x20) == 0) {
      goto LABEL_19;
    }
  }
  else if (((a4 ^ a3) & 8) != 0)
  {
    BOOL v11 = 0;
    int v10 = 56;
    if ((a3 & 0x20) == 0) {
      goto LABEL_19;
    }
  }
  else if (((a4 ^ a3) & 0x10) != 0)
  {
    BOOL v11 = 0;
    int v10 = 48;
    if ((a3 & 0x20) == 0) {
      goto LABEL_19;
    }
  }
  else
  {
    int v10 = v9 & 0x20;
    BOOL v11 = (v9 & 0x20) == 0;
    if ((a3 & 0x20) == 0) {
      goto LABEL_19;
    }
  }
  if (!v11) {
    [a5 appendString:@"</sub>"];
  }
LABEL_19:
  if ((v7 & v10 & 0x10) != 0) {
    [a5 appendString:@"</sup>"];
  }
  if ((v7 & v10 & 8) != 0) {
    [a5 appendString:@"</i>"];
  }
  if ((v7 & v10 & 4) != 0) {
    [a5 appendString:@"</b>"];
  }
  if ((v7 & v10 & 2) != 0)
  {
    if ((self->_excludedElements2 & 0x400) != 0) {
      NSUInteger v12 = @"</strike>";
    }
    else {
      NSUInteger v12 = @"</s>";
    }
    [a5 appendString:v12];
  }
  if (v7 & v10) {
    [a5 appendString:@"</u>"];
  }
  if (v6 & v10) {
    [a5 appendString:@"<u>"];
  }
  if ((v6 & v10 & 2) != 0)
  {
    if ((self->_excludedElements2 & 0x400) != 0) {
      int v13 = @"<strike>";
    }
    else {
      int v13 = @"<s>";
    }
    [a5 appendString:v13];
  }
  if ((v6 & v10 & 4) != 0) {
    [a5 appendString:@"<b>"];
  }
  if ((v6 & v10 & 8) != 0) {
    [a5 appendString:@"<i>"];
  }
  if ((v6 & v10 & 0x10) != 0) {
    [a5 appendString:@"<sup>"];
  }
  char v14 = (v6 & 0x20) == 0 || v11;
  if ((v14 & 1) == 0)
  {
    [a5 appendString:@"<sub>"];
  }
}

- (void)_openBlocksForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5
{
  int v7 = (void *)[a3 textBlocks];
  uint64_t v8 = [v7 count];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; v9 != i; ++i)
    {
      BOOL v11 = (void *)[v7 objectAtIndex:i];
      if ([(NSAttributedString *)self->_attrStr rangeOfTextBlock:v11 atIndex:a4] == a4)
      {
        unint64_t v12 = [(NSHTMLWriter *)self _blockClassForBlock:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v13 = (void *)[v11 table];
          BOOL v42 = [(NSAttributedString *)self->_attrStr _atStartOfTextTableRow:v13 atIndex:a4];
          BOOL v14 = [(NSAttributedString *)self->_attrStr _atStartOfTextTable:v13 atIndex:a4];
          [v11 verticalAlignment];
          uint64_t v18 = [v11 rowSpan];
          uint64_t v19 = [v11 columnSpan];
          double v20 = &stru_1EDD49F70;
          if (v18 >= 2) {
            double v20 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" rowspan=\"%d\"", v18);
          }
          double v43 = v20;
          double v21 = &stru_1EDD49F70;
          if (v19 >= 2) {
            double v21 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" colspan=\"%d\"", v19);
          }
          if (v14)
          {
            unint64_t v22 = [(NSHTMLWriter *)self _blockClassForBlock:v13];
            [v13 contentWidth];
            uint64_t v24 = &stru_1EDD49F70;
            if (v23 > 0.0)
            {
              double v25 = v23;
              if ([v13 contentWidthValueType] == 1) {
                uint64_t v26 = @" width=\"%.1f%%\"";
              }
              else {
                uint64_t v26 = @" width=\"%.1f\"";
              }
              uint64_t v24 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", v26, *(void *)&v25);
            }
            unsigned int excludedElements2 = self->_excludedElements2;
            if ((excludedElements2 & 0x1140000) != 0)
            {
              unsigned int excludedElements1 = self->_excludedElements1;
              if ((excludedElements1 & 0x40000) == 0)
              {
                if (!v22 || (excludedElements2 & 0x1000) != 0)
                {
                  [a5 appendFormat:@"%@<div>\n", -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v40];
                }
                else
                {
                  unsigned int v29 = excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
                  id v30 = [(NSHTMLWriter *)self _prefixUp];
                  if (v29) {
                    [a5 appendFormat:@"%@<div style=\"%@\">\n", v30, -[NSMutableArray objectAtIndex:](self->_blockStyleStrings, "objectAtIndex:", v22 - 1)];
                  }
                  else {
                    [a5 appendFormat:@"%@<div class=\"d%lu\">\n", v30, v22];
                  }
                }
              }
            }
            else
            {
              if (!v22 || (excludedElements2 & 0x1000) != 0)
              {
                [a5 appendFormat:@"%@<table%@ cellspacing=\"0\" cellpadding=\"0\">\n", -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v24, v41];
              }
              else
              {
                unsigned int v31 = self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
                id v32 = [(NSHTMLWriter *)self _prefixUp];
                if (v31) {
                  [a5 appendFormat:@"%@<table%@ cellspacing=\"0\" cellpadding=\"0\" style=\"%@\">\n", v32, v24, -[NSMutableArray objectAtIndex:](self->_tableStyleStrings, "objectAtIndex:", v22 - 1)];
                }
                else {
                  [a5 appendFormat:@"%@<table%@ cellspacing=\"0\" cellpadding=\"0\" class=\"t%lu\">\n", v32, v24, v22];
                }
              }
              if ((self->_excludedElements2 & 0x80000) == 0) {
                [a5 appendFormat:@"%@<tbody>\n", -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v40];
              }
            }
          }
          unsigned int v33 = self->_excludedElements2;
          if ((v33 & 0x1140000) == 0)
          {
            if (v42) {
              [a5 appendFormat:@"%@<tr>\n", -[NSHTMLWriter _prefixUp](self, "_prefixUp")];
            }
            if (!v12 || (self->_excludedElements2 & 0x1000) != 0)
            {
              double v41 = v21;
              uint64_t v40 = (uint64_t)v43;
              [a5 appendFormat:@"%@<td%@%@ valign=\"%@\">\n", -[NSHTMLWriter _prefixUp](self, "_prefixUp")];
            }
            else
            {
              unsigned int v38 = self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
              id v39 = [(NSHTMLWriter *)self _prefixUp];
              if (v38)
              {
                [(NSMutableArray *)self->_tableCellStyleStrings objectAtIndex:v12 - 1];
                uint64_t v40 = (uint64_t)v43;
                double v41 = v21;
                [a5 appendFormat:@"%@<td%@%@ valign=\"%@\" style=\"%@\">\n", v39];
              }
              else
              {
                uint64_t v40 = (uint64_t)v43;
                double v41 = v21;
                [a5 appendFormat:@"%@<td%@%@ valign=\"%@\" class=\"td%lu\">\n", v39];
              }
            }
            continue;
          }
          unsigned int v34 = self->_excludedElements1;
          if ((v34 & 0x40000) == 0)
          {
            if (v12 && (v33 & 0x1000) == 0)
            {
              unsigned int v17 = v34 & 0x20000000;
              unsigned int v16 = self->_excludedElements2 & 0x8000;
LABEL_41:
              int v35 = v17 | v16;
              id v36 = [(NSHTMLWriter *)self _prefixUp];
              id v37 = v36;
              if (v35)
              {
                uint64_t v40 = [(NSMutableArray *)self->_blockStyleStrings objectAtIndex:v12 - 1];
                [a5 appendFormat:@"%@<div style=\"%@\">\n", v37];
              }
              else
              {
                uint64_t v40 = v12;
                [a5 appendFormat:@"%@<div class=\"d%lu\">\n", v36];
              }
              continue;
            }
LABEL_43:
            [a5 appendFormat:@"%@<div>\n", -[NSHTMLWriter _prefixUp](self, "_prefixUp")];
          }
        }
        else
        {
          unsigned int v15 = self->_excludedElements1;
          if ((v15 & 0x40000) == 0)
          {
            if (v12 && (self->_excludedElements2 & 0x1000) == 0)
            {
              unsigned int v16 = v15 & 0x20000000;
              unsigned int v17 = self->_excludedElements2 & 0x8000;
              goto LABEL_41;
            }
            goto LABEL_43;
          }
        }
      }
    }
  }
}

- (BOOL)_closeBlocksForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5
{
  uint64_t v8 = (void *)[a3 textBlocks];
  uint64_t v9 = [v8 count];
  BOOL v10 = 0;
  if (v9)
  {
    uint64_t v11 = v9 - 1;
    unint64_t v12 = @"%@</div>\n";
    while (1)
    {
      int v13 = (void *)[v8 objectAtIndex:v11];
      uint64_t v14 = [(NSAttributedString *)self->_attrStr rangeOfTextBlock:v13 atIndex:a4];
      if (v14 + v15 != a4 + 1) {
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
LABEL_15:
      double v20 = @"%@</div>\n";
      if ((self->_excludedElements1 & 0x40000) == 0) {
        goto LABEL_16;
      }
LABEL_17:
      if (--v11 == -1) {
        return v10;
      }
    }
    uint64_t v16 = [v13 table];
    BOOL v17 = [(NSAttributedString *)self->_attrStr _atEndOfTextTableRow:v16 atIndex:a4];
    BOOL v18 = [(NSAttributedString *)self->_attrStr _atEndOfTextTable:v16 atIndex:a4];
    if ((self->_excludedElements2 & 0x1140000) != 0)
    {
      if ((self->_excludedElements1 & 0x40000) != 0)
      {
        if (v17) {
          goto LABEL_8;
        }
        goto LABEL_12;
      }
    }
    else
    {
      unint64_t v12 = @"%@</td>\n";
    }
    objc_msgSend(a5, "appendFormat:", v12, -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
    BOOL v10 = 1;
    if (v17)
    {
LABEL_8:
      unint64_t v12 = @"%@</div>\n";
      if ((self->_excludedElements2 & 0x1140000) == 0)
      {
        [a5 appendFormat:@"%@</tr>\n", -[NSHTMLWriter _prefixDown](self, "_prefixDown")];
        BOOL v10 = 1;
      }
      goto LABEL_13;
    }
LABEL_12:
    unint64_t v12 = @"%@</div>\n";
LABEL_13:
    if (!v18) {
      goto LABEL_17;
    }
    unsigned int excludedElements2 = self->_excludedElements2;
    if ((excludedElements2 & 0x1140000) == 0)
    {
      double v20 = @"%@</table>\n";
      if ((excludedElements2 & 0x80000) == 0) {
        [a5 appendFormat:@"%@</tbody>\n", -[NSHTMLWriter _prefixDown](self, "_prefixDown")];
      }
LABEL_16:
      objc_msgSend(a5, "appendFormat:", v20, -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
      BOOL v10 = 1;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  return v10;
}

- (unint64_t)_listClassForList:(id)a3
{
  int v5 = [a3 isOrdered];
  uint64_t v6 = 152;
  if (v5) {
    uint64_t v6 = 144;
  }
  int v7 = *(Class *)((char *)&self->super.isa + v6);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v9 = (void *)[a3 _markerSpecifierAsCSSValue];
  if ([v9 length]) {
    [v8 appendFormat:@"list-style-type: %@; ", v9];
  }
  if ([v8 length])
  {
    while (([v8 hasSuffix:@" "] & 1) != 0
         || [v8 hasSuffix:@";"])
      objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 1, 1);
    uint64_t v10 = [v7 indexOfObject:v8];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [v7 count];
      [v7 addObject:v8];
    }
    unint64_t v11 = v10 + 1;
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)_openListsForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5 isStrict:(BOOL)a6
{
  uint64_t v10 = (void *)[a3 textLists];
  uint64_t v11 = [v10 count];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    id v26 = a5;
    do
    {
      uint64_t v14 = (void *)[v10 objectAtIndex:v13];
      if ([(NSAttributedString *)self->_attrStr rangeOfTextList:v14 atIndex:a4] == a4)
      {
        unint64_t v15 = [(NSHTMLWriter *)self _listClassForList:v14];
        if ([v14 isOrdered])
        {
          uint64_t v16 = [v14 startingItemNumber];
          BOOL v17 = &stru_1EDD49F70;
          if (!a6 && v16 != 1) {
            BOOL v17 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" start=\"%ld\"", v16);
          }
          unsigned int excludedElements2 = self->_excludedElements2;
          if ((excludedElements2 & 0x40) == 0)
          {
            if (!v15 || (excludedElements2 & 0x1000) != 0)
            {
              [a5 appendFormat:@"%@<ol%@>\n", -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v17];
            }
            else
            {
              unsigned int v19 = self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
              id v20 = [(NSHTMLWriter *)self _prefixUp];
              if (v19)
              {
                a5 = v26;
                [v26 appendFormat:@"%@<ol style=\"%@\"%@>\n", v20, -[NSMutableArray objectAtIndex:](self->_olistStyleStrings, "objectAtIndex:", v15 - 1), v17];
              }
              else
              {
                a5 = v26;
                [v26 appendFormat:@"%@<ol class=\"ol%lu\"%@>\n", v20, v15, v17];
              }
            }
          }
        }
        else
        {
          unsigned int v21 = self->_excludedElements2;
          if ((v21 & 0x8000000) == 0)
          {
            if (!v15 || (v21 & 0x1000) != 0)
            {
              [a5 appendFormat:@"%@<ul>\n", -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v24];
            }
            else
            {
              unsigned int v22 = self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
              id v23 = [(NSHTMLWriter *)self _prefixUp];
              if (v22)
              {
                a5 = v26;
                [v26 appendFormat:@"%@<ul style=\"%@\">\n", v23, -[NSMutableArray objectAtIndex:](self->_ulistStyleStrings, "objectAtIndex:", v15 - 1), v25];
              }
              else
              {
                a5 = v26;
                [v26 appendFormat:@"%@<ul class=\"ul%lu\">\n", v23, v15, v25];
              }
            }
          }
        }
      }
      ++v13;
    }
    while (v12 != v13);
  }
}

- (BOOL)_closeListsForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5
{
  id v8 = (void *)[a3 textLists];
  uint64_t v9 = [v8 count];
  BOOL v10 = 0;
  if (v9)
  {
    for (uint64_t i = v9 - 1; i != -1; --i)
    {
      uint64_t v12 = (void *)[v8 objectAtIndex:i];
      uint64_t v13 = [(NSAttributedString *)self->_attrStr rangeOfTextList:v12 atIndex:a4];
      if (v13 + v14 == a4 + 1)
      {
        int v15 = [v12 isOrdered];
        unsigned int excludedElements2 = self->_excludedElements2;
        if (v15)
        {
          BOOL v17 = @"%@</ol>\n";
          if ((excludedElements2 & 0x40) != 0) {
            continue;
          }
LABEL_8:
          objc_msgSend(a5, "appendFormat:", v17, -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
          BOOL v10 = 1;
          continue;
        }
        BOOL v17 = @"%@</ul>\n";
        if ((excludedElements2 & 0x8000000) == 0) {
          goto LABEL_8;
        }
      }
    }
  }
  return v10;
}

- (void)_addImageElementForResource:(id)a3 description:(id)a4 inString:(id)a5
{
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "URL"), "absoluteString");
  uint64_t v9 = _escapedStringForString(a4, 1);
  if ((self->_excludedElements2 & 0x10000000) != 0) {
    BOOL v10 = &stru_1EDD49F70;
  }
  else {
    BOOL v10 = @" /";
  }
  [a5 appendFormat:@"<img src=\"%@\" alt=\"%@\"%@>", v8, v9, v10];
}

- (void)_addObjectElementForResource:(id)a3 description:(id)a4 inString:(id)a5
{
  [a5 appendFormat:@"<object data=\"%@\">%@</object>", objc_msgSend((id)objc_msgSend(a3, "URL"), "absoluteString"), _escapedStringForString(a4, 1)];
}

- (void)_addSourceElementForResource:(id)a3 MIMEType:(id)a4 inString:(id)a5
{
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "URL"), "absoluteString");
  if ((self->_excludedElements2 & 0x10000000) != 0) {
    uint64_t v9 = &stru_1EDD49F70;
  }
  else {
    uint64_t v9 = @" /";
  }
  [a5 appendFormat:@"<source srcset=\"%@\" type=\"%@\"%@>", v8, a4, v9];
}

- (id)_resourceForFileWrapper:(id)a3 filename:(id *)a4
{
  if (![a3 isRegularFile]) {
    return 0;
  }
  uint64_t v7 = [a3 preferredFilename];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = (void *)v7;
  id v36 = a4;
  id v37 = (void *)[a3 regularFileContents];
  uint64_t v9 = (void *)[v8 pathExtension];
  uint64_t v10 = [v8 stringByDeletingPathExtension];
  id v11 = [(NSDictionary *)[(NSFileWrapper *)self->_fileWrapper fileWrappers] objectForKey:v8];
  uint64_t v12 = v8;
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = 1;
    uint64_t v12 = v8;
    while (![v13 isRegularFile]
         || (objc_msgSend(v37, "isEqual:", objc_msgSend(v13, "regularFileContents")) & 1) == 0)
    {
      int v15 = (void *)[NSString stringWithFormat:@"%@_%lu", v10, v14];
      uint64_t v12 = v15;
      if (v9) {
        uint64_t v12 = (void *)[v15 stringByAppendingPathExtension:v9];
      }
      id v13 = [(NSDictionary *)[(NSFileWrapper *)self->_fileWrapper fileWrappers] objectForKey:v12];
      ++v14;
      if (!v13) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    if ([v12 isEqualToString:v8])
    {
      [(NSFileWrapper *)self->_fileWrapper addFileWrapper:a3];
    }
    else
    {
      BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:v37];
      [v17 setPreferredFilename:v12];
      [(NSFileWrapper *)self->_fileWrapper addFileWrapper:v17];
    }
  }
  uint64_t v16 = (NSSubstituteWebResource *)[(NSMutableDictionary *)self->_subresources objectForKey:v12];
  if (!v16)
  {
    outputBaseURL = self->_outputBaseURL;
    id v20 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v21 = outputBaseURL
        ? [NSString stringWithFormat:@"%@/%@", -[NSURL absoluteString](outputBaseURL, "absoluteString"), objc_msgSend(v12, "stringByAddingPercentEscapesUsingEncoding:", 4)]: objc_msgSend(NSString, "stringWithFormat:", @"file:///%@", objc_msgSend(v12, "stringByAddingPercentEscapesUsingEncoding:", 4), v35);
    uint64_t v16 = (NSSubstituteWebResource *)[v20 URLWithString:v21];
    if (v16)
    {
      if (self->_resourceHandler && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id resourceHandler = self->_resourceHandler;
        uint64_t v23 = [v9 lowercaseString];
        if (([@"tiff" isEqualToString:v23] & 1) != 0
          || ([@"tif" isEqualToString:v23] & 1) != 0)
        {
          uint64_t v24 = @"image/tiff";
        }
        else if (([@"jpeg" isEqualToString:v23] & 1) != 0 {
               || ([@"jpg" isEqualToString:v23] & 1) != 0)
        }
        {
          uint64_t v24 = @"image/jpeg";
        }
        else if ([@"gif" isEqualToString:v23])
        {
          uint64_t v24 = @"image/gif";
        }
        else if ([@"png" isEqualToString:v23])
        {
          uint64_t v24 = @"image/png";
        }
        else
        {
          int v32 = [@"pdf" isEqualToString:v23];
          if (v32) {
            uint64_t v24 = @"application/pdf";
          }
          else {
            uint64_t v24 = @"application/octet-stream";
          }
          if ((v32 & 1) == 0 && v9)
          {
            if ([v9 length]
              && (unsigned int v33 = (void *)[MEMORY[0x1E4F442D8] typeWithFilenameExtension:v9]) != 0
              && (unsigned int v34 = v33, [v33 preferredMIMEType]))
            {
              uint64_t v24 = (__CFString *)[v34 preferredMIMEType];
            }
            else
            {
              uint64_t v24 = @"application/octet-stream";
            }
          }
        }
        uint64_t v25 = (NSSubstituteWebResource *)[resourceHandler resourceForData:v37 URL:v16 MIMEType:v24 textEncodingName:0 frameName:0];
      }
      else
      {
        id v26 = [NSSubstituteWebResource alloc];
        uint64_t v27 = [v9 lowercaseString];
        if (([@"tiff" isEqualToString:v27] & 1) != 0
          || ([@"tif" isEqualToString:v27] & 1) != 0)
        {
          double v28 = @"image/tiff";
        }
        else if (([@"jpeg" isEqualToString:v27] & 1) != 0 {
               || ([@"jpg" isEqualToString:v27] & 1) != 0)
        }
        {
          double v28 = @"image/jpeg";
        }
        else if ([@"gif" isEqualToString:v27])
        {
          double v28 = @"image/gif";
        }
        else if ([@"png" isEqualToString:v27])
        {
          double v28 = @"image/png";
        }
        else
        {
          int v29 = [@"pdf" isEqualToString:v27];
          if (v29) {
            double v28 = @"application/pdf";
          }
          else {
            double v28 = @"application/octet-stream";
          }
          if ((v29 & 1) == 0 && v9)
          {
            if ([v9 length]
              && (id v30 = (void *)[MEMORY[0x1E4F442D8] typeWithFilenameExtension:v9]) != 0
              && (unsigned int v31 = v30, [v30 preferredMIMEType]))
            {
              double v28 = (__CFString *)[v31 preferredMIMEType];
            }
            else
            {
              double v28 = @"application/octet-stream";
            }
          }
        }
        uint64_t v25 = [(NSSubstituteWebResource *)v26 initWithData:v37 URL:v16 MIMEType:v28 textEncodingName:0 frameName:0];
      }
      uint64_t v16 = v25;
      if (v25) {
        [(NSMutableDictionary *)self->_subresources setObject:v25 forKey:v12];
      }
    }
  }
  if (v36) {
    id *v36 = v12;
  }
  return v16;
}

- (void)_appendAttachment:(id)a3 atIndex:(unint64_t)a4 toString:(id)a5
{
  if (self->_resourceHandler && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = [self->_resourceHandler htmlStringForAttachment:a3 atIndex:a4];
    if (v9)
    {
      [a5 appendString:v9];
    }
  }
  else if ((~self->_excludedElements2 & 0x22) != 0)
  {
    uint64_t v10 = objc_msgSend(a3, "fileWrapper", a3, a4);
    id v11 = objc_msgSend((id)objc_msgSend(v10, "preferredFilename"), "pathExtension");
    uint64_t v19 = 0;
    id v12 = [(NSHTMLWriter *)self _resourceForFileWrapper:v10 filename:&v19];
    if (v12)
    {
      id v13 = v12;
      unsigned int excludedElements2 = self->_excludedElements2;
      if ((excludedElements2 & 2) == 0)
      {
        if (v11
          && ((uint64_t v15 = [v11 lowercaseString],
               ([@"tiff" isEqualToString:v15] & 1) == 0)
           && ([@"tif" isEqualToString:v15] & 1) == 0
            ? (([@"jpeg" isEqualToString:v15] & 1) == 0
            && ([@"jpg" isEqualToString:v15] & 1) == 0
             ? (([@"gif" isEqualToString:v15] & 1) == 0
              ? (([@"png" isEqualToString:v15] & 1) == 0
               ? (([@"pdf" isEqualToString:v15] & 1) == 0
                ? (![v11 length]
                || (BOOL v17 = (void *)[MEMORY[0x1E4F442D8] typeWithFilenameExtension:v11]) == 0
                || (BOOL v18 = v17, ![v17 preferredMIMEType])
                 ? (uint64_t v16 = @"application/octet-stream")
                 : (uint64_t v16 = (__CFString *)[v18 preferredMIMEType]))
                : (uint64_t v16 = @"application/pdf"))
               : (uint64_t v16 = @"image/png"))
              : (uint64_t v16 = @"image/gif"))
             : (uint64_t v16 = @"image/jpeg"))
            : (uint64_t v16 = @"image/tiff"),
              ([(__CFString *)v16 hasPrefix:@"image"] & 1) != 0)
          || (objc_msgSend((id)objc_msgSend(v13, "MIMEType"), "hasPrefix:", @"image") & 1) != 0)
        {
          [(NSHTMLWriter *)self _addImageElementForResource:v13 description:v19 inString:a5];
          return;
        }
        unsigned int excludedElements2 = self->_excludedElements2;
      }
      if ((excludedElements2 & 0x20) == 0) {
        [(NSHTMLWriter *)self _addObjectElementForResource:v13 description:v19 inString:a5];
      }
    }
  }
}

- (void)_appendImageGlyph:(id)a3 withAttributes:(id)a4 toString:(id)a5
{
  if ((~self->_excludedElements2 & 0x22) != 0)
  {
    uint64_t v8 = objc_msgSend(a3, "_configuredFileWrapperForAttributes:", 0, a4);
    uint64_t v9 = [a3 _fallbackFileWrapper];
    uint64_t v15 = 0;
    if ((self->_excludedElements3 & 3) != 0)
    {
      id v10 = [(NSHTMLWriter *)self _resourceForFileWrapper:v9 filename:&v15];
      if (!v10) {
        return;
      }
      goto LABEL_11;
    }
    id v10 = [(NSHTMLWriter *)self _resourceForFileWrapper:v8 filename:&v15];
    id v11 = [(NSHTMLWriter *)self _resourceForFileWrapper:v9 filename:0];
    if (!v10 || (id v12 = v11) == 0)
    {
      if (!v10) {
        return;
      }
LABEL_11:
      unsigned int excludedElements2 = self->_excludedElements2;
      if ((excludedElements2 & 2) != 0)
      {
        if ((excludedElements2 & 0x20) == 0) {
          [(NSHTMLWriter *)self _addObjectElementForResource:v10 description:v15 inString:a5];
        }
      }
      else
      {
        [(NSHTMLWriter *)self _addImageElementForResource:v10 description:v15 inString:a5];
      }
      return;
    }
    id v13 = (void *)[a3 contentDescription];
    if (![v13 length]) {
      id v13 = v15;
    }
    [a5 appendString:@"<picture>"];
    [(NSHTMLWriter *)self _addSourceElementForResource:v10 MIMEType:@"image/x-apple-adaptive-glyph" inString:a5];
    [(NSHTMLWriter *)self _addImageElementForResource:v12 description:v13 inString:a5];
    [a5 appendString:@"</picture>"];
  }
}

- (BOOL)_isStrictByParsingExcludedElements
{
  v2 = self;
  id v3 = [(NSDictionary *)self->_documentAttrs objectForKey:@"ExcludedElements"];
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"APPLET", @"BASEFONT", @"CENTER", @"DIR", @"FONT", @"ISINDEX", @"MENU", @"S", @"STRIKE", @"U", 0);
  int v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"A", @"ABBR", @"ACRONYM", @"ADDRESS", @"B", @"BASE", @"BASEFONT", @"BDO", @"BIG", @"BLOCKQUOTE", @"BODY", @"BR", @"CAPTION", @"CITE", @"COL", @"COLGROUP", @"DD",
                 @"DFN",
                 @"DIV",
                 @"DL",
                 @"DOCTYPE",
                 @"EM",
                 @"FONT",
                 @"H1",
                 @"H2",
                 @"H3",
                 @"H4",
                 @"H5",
                 @"H6",
                 @"HEAD",
                 @"HR",
                 @"HTML",
                 @"I",
                 @"IMG",
                 @"LI",
                 @"LINK",
                 @"META",
                 @"OBJECT",
                 @"OL",
                 @"P",
                 @"PRE",
                 @"Q",
                 @"S",
                 @"SMALL",
                 @"SPAN",
                 @"STRIKE",
                 @"STRONG",
                 @"STYLE",
                 @"SUB",
                 @"SUP",
                 @"TABLE",
                 @"TBODY",
                 @"TD",
                 @"TFOOT",
                 @"THEAD",
                 @"TITLE",
                 @"TR",
                 @"TT",
                 @"U",
                 @"UL",
                 @"XML");
  unint64_t v6 = [v4 count];
  unint64_t v7 = [v5 count];
  if (!v3)
  {
    id v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSHTMLExcludedElements");
    if (!v3) {
      id v3 = (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"APPLET", @"BASEFONT", @"CENTER", @"DIR", @"FONT", @"ISINDEX", @"MENU", @"S", @"STRIKE", @"U", @"XML", 0);
    }
  }
  uint64_t v8 = [v3 count];
  unint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = 0;
    while (v9)
    {
      for (unint64_t i = 0; i < v9; ++i)
      {
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v10), "compare:options:", objc_msgSend(v3, "objectAtIndex:", i), 1);
        BOOL v13 = v12 == 0;
        if (!v12) {
          break;
        }
      }
      if (!v12 && ++v10 < v6) {
        continue;
      }
      goto LABEL_14;
    }
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = 1;
    if (v8)
    {
LABEL_14:
      uint64_t v14 = 0;
      p_excludedElements3 = &v2->_excludedElements3;
      uint64_t v16 = v2;
      p_unsigned int excludedElements2 = &v2->_excludedElements2;
      uint64_t v25 = v16;
      id v26 = p_excludedElements3;
      p_unsigned int excludedElements1 = &v16->_excludedElements1;
      do
      {
        if (v7)
        {
          unint64_t v19 = 0;
          while (objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v19), "compare:options:", objc_msgSend(v3, "objectAtIndex:", v14), 1))
          {
            if (++v19 >= v7) {
              goto LABEL_30;
            }
          }
          char v20 = v19 - 64;
          if (v19 > 0x3F)
          {
            uint64_t v21 = v26;
          }
          else
          {
            char v20 = v19 - 32;
            uint64_t v21 = p_excludedElements2;
          }
          if (v19 <= 0x1F) {
            char v22 = v19;
          }
          else {
            char v22 = v20;
          }
          if (v19 <= 0x1F) {
            uint64_t v23 = p_excludedElements1;
          }
          else {
            uint64_t v23 = v21;
          }
          *v23 |= 1 << v22;
        }
LABEL_30:
        ++v14;
      }
      while (v14 != v9);
      v2 = v25;
    }
  }
  return (v2->_excludedElements2 & 0x80) == 0 && v13;
}

- (void)_prepareString:(id)a3 forConversionToEncoding:(unint64_t)a4
{
  uint64_t v6 = [a3 length];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = 0;
    CFIndex v9 = 0;
    v22[1] = 0;
    uint64_t v23 = 0;
    range.NSUInteger length = 0;
    v22[0] = 0;
    range.NSUInteger location = 0;
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D500];
    unint64_t v11 = v6;
    unint64_t v12 = 0;
    do
    {
      if (16 * v11 <= v11) {
        uint64_t v13 = v11;
      }
      else {
        uint64_t v13 = 16 * v11;
      }
      if (objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, v13, &v23, a4, 0, v9, v11, v22, range.location, range.length))BOOL v14 = v23 == 0; {
      else
      }
        BOOL v14 = 1;
      if (!v14)
      {
        unint64_t v12 = v8;
        if (v22[0] > v8)
        {
          uint64_t v15 = [a3 rangeOfComposedCharacterSequenceAtIndex:v22[0] - 1];
          if ((unint64_t)(v15 + v16) <= v22[0]) {
            unint64_t v12 = v22[0];
          }
          else {
            unint64_t v12 = v15;
          }
        }
      }
      unint64_t v11 = v7 - v12;
      if (v7 <= v12) {
        break;
      }
      if (v12 <= v8)
      {
        uint64_t v17 = [a3 rangeOfComposedCharacterSequenceAtIndex:v8];
        unint64_t v19 = v17 + v18;
        range.NSUInteger location = v9;
        range.NSUInteger length = v17 + v18 - v8;
        if (CFStringTransform((CFMutableStringRef)a3, &range, v10, 0)) {
          unint64_t v12 = range.length + range.location;
        }
        else {
          unint64_t v12 = v19;
        }
        unint64_t v20 = [a3 length];
        unint64_t v11 = v20 - v12;
        if (v20 <= v12) {
          return;
        }
        unint64_t v7 = v20;
        if (v12 <= v8)
        {
          unint64_t v12 = v8 + 1;
          if (v20 <= v8 + 1) {
            return;
          }
          unint64_t v11 = v20 + ~v8;
        }
      }
      unint64_t v8 = v12;
      CFIndex v9 = v12;
    }
    while (v11);
  }
}

- (id)markElementFor:(id)a3 spanClass:(unint64_t)a4 paraClass:(unint64_t)a5
{
  if (objc_msgSend(a3, "isEqual:", @"NSTextHighlightStyleDefault", a4, a5)) {
    return @"<mark style=\"background-color: rgba(0, 0, 0, 0.0)\">";
  }
  else {
    return @"<mark>";
  }
}

- (void)_generateHTML
{
}

- (void)_generateHTMLForWebKit:(BOOL)a3
{
  BOOL v209 = a3;
  v231 = [(NSAttributedString *)self->_attrStr string];
  uint64_t v226 = [(NSString *)v231 length];
  v206 = (__CFString *)[MEMORY[0x1E4F28E78] string];
  id v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v230 = [(NSDictionary *)self->_documentAttrs objectForKey:@"CharacterEncoding"];
  id v5 = [(NSDictionary *)self->_documentAttrs objectForKey:@"PrefixSpaces"];
  id v6 = [(NSDictionary *)self->_documentAttrs objectForKey:@"InterchangeNewline"];
  id v7 = [(NSDictionary *)self->_documentAttrs objectForKey:@"NoDefaultFonts"];
  id v8 = [(NSDictionary *)self->_documentAttrs objectForKey:@"TabsToSpaces"];
  id v9 = [(NSDictionary *)self->_documentAttrs objectForKey:@"CoalesceTabSpans"];
  uint64_t v204 = _colorValForColor_0([(NSDictionary *)self->_documentAttrs objectForKey:@"BackgroundColor"]);
  v237[0] = xmmword_18E5F72A0;
  v235 = 0;
  uint64_t v236 = 0;
  uint64_t v233 = 0;
  v234 = 0;
  BOOL v208 = [(NSHTMLWriter *)self _isStrictByParsingExcludedElements];
  self->_bodyStr = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v10 = objc_alloc(MEMORY[0x1E4F28CF0]);
  self->_fileWrapper = (NSFileWrapper *)[v10 initDirectoryWithFileWrappers:MEMORY[0x1E4F1CC08]];
  self->_subresources = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_paraStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_paraStyleArrays = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_paraStyleIndexes = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  self->_listItemStyleIndexes = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  self->_charStyleStrings = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  self->_fontDescriptions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_charStyleArrays = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_fontStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_tableStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_tableCellStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_blockStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_olistStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_ulistStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_fontNames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_int64_t level = 0;
  if (v5) {
    unint64_t v11 = [v5 integerValue];
  }
  else {
    unint64_t v11 = [v4 integerForKey:@"NSHTMLPrefixSpaces"];
  }
  self->_prefixSpaces = v11;
  unint64_t v12 = v226;
  if ((v11 & 0x8000000000000000) != 0)
  {
    int64_t v13 = 0;
  }
  else
  {
    if (v11 < 0x11) {
      goto LABEL_9;
    }
    int64_t v13 = 16;
  }
  self->_prefixSpaces = v13;
LABEL_9:
  if (v6)
  {
    int v14 = [v6 integerValue] > 0;
  }
  else
  {
    if (![v4 objectForKey:@"NSHTMLInterchangeNewline"]) {
      goto LABEL_14;
    }
    int v14 = [v4 BOOLForKey:@"NSHTMLInterchangeNewline"];
  }
  self->_$2D985FE1209761417A79CA1E24509E35 flags = ($2D985FE1209761417A79CA1E24509E35)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v14);
LABEL_14:
  if (v7)
  {
    int v15 = [v7 integerValue] > 0;
  }
  else
  {
    if (![v4 objectForKey:@"NSHTMLNoDefaultFonts"]) {
      goto LABEL_22;
    }
    int v15 = [v4 BOOLForKey:@"NSHTMLNoDefaultFonts"];
  }
  if (v15) {
    int v16 = 2;
  }
  else {
    int v16 = 0;
  }
  self->_$2D985FE1209761417A79CA1E24509E35 flags = ($2D985FE1209761417A79CA1E24509E35)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v16);
LABEL_22:
  if (v8)
  {
    int v17 = [v8 integerValue] > 0;
  }
  else
  {
    if (![v4 objectForKey:@"NSHTMLTabsToSpaces"]) {
      goto LABEL_30;
    }
    int v17 = [v4 BOOLForKey:@"NSHTMLTabsToSpaces"];
  }
  if (v17) {
    int v18 = 4;
  }
  else {
    int v18 = 0;
  }
  self->_$2D985FE1209761417A79CA1E24509E35 flags = ($2D985FE1209761417A79CA1E24509E35)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v18);
LABEL_30:
  if (v9)
  {
    int v19 = [v9 integerValue] > 0;
  }
  else
  {
    if (![v4 objectForKey:@"NSHTMLCoalesceTabSpans"]) {
      goto LABEL_38;
    }
    int v19 = [v4 BOOLForKey:@"NSHTMLCoalesceTabSpans"];
  }
  if (v19) {
    int v20 = 8;
  }
  else {
    int v20 = 0;
  }
  self->_$2D985FE1209761417A79CA1E24509E35 flags = ($2D985FE1209761417A79CA1E24509E35)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v20);
LABEL_38:
  id v21 = objc_allocWithZone(MEMORY[0x1E4F28CF0]);
  char v22 = objc_msgSend(v21, "initRegularFileWithContents:", objc_msgSend(MEMORY[0x1E4F1C9B8], "data"));
  [v22 setPreferredFilename:@"index.html"];
  [(NSFileWrapper *)self->_fileWrapper addFileWrapper:v22];
  uint64_t v23 = [(NSDictionary *)self->_documentAttrs objectForKey:@"TextEncodingName"];
  self->_textEncodingName = v23;
  if (!v23) {
    self->_textEncodingName = (NSString *)[v4 stringForKey:@"NSHTMLTextEncodingName"];
  }
  if (v230) {
    unint64_t v24 = [v230 unsignedIntegerValue];
  }
  else {
    unint64_t v24 = [v4 integerForKey:@"NSHTMLCharacterEncoding"];
  }
  self->_uint64_t characterEncoding = v24;
  v205 = v22;
  if (v24)
  {
    CFStringEncoding v25 = CFStringConvertNSStringEncodingToEncoding(v24);
    self->_textEncodingName = (NSString *)CFStringConvertEncodingToIANACharSetName(v25);
LABEL_45:
    uint64_t characterEncoding = self->_characterEncoding;
    goto LABEL_46;
  }
  textEncodingName = self->_textEncodingName;
  if (!textEncodingName) {
    goto LABEL_57;
  }
  CFStringEncoding v29 = CFStringConvertIANACharSetNameToEncoding((CFStringRef)textEncodingName);
  if (v29 == -1) {
    goto LABEL_45;
  }
  uint64_t characterEncoding = CFStringConvertEncodingToNSStringEncoding(v29);
  self->_uint64_t characterEncoding = characterEncoding;
LABEL_46:
  if (characterEncoding > 2415919359)
  {
    if (characterEncoding > 2550137087)
    {
      if (characterEncoding == 2550137088) {
        goto LABEL_63;
      }
      uint64_t v27 = 2617245952;
    }
    else
    {
      if (characterEncoding == 2415919360) {
        goto LABEL_63;
      }
      uint64_t v27 = 2483028224;
    }
LABEL_62:
    if (characterEncoding != v27) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  if (characterEncoding > 9)
  {
    if (characterEncoding == 10) {
      goto LABEL_63;
    }
    uint64_t v27 = 2348810496;
    goto LABEL_62;
  }
  if (!characterEncoding)
  {
LABEL_57:
    self->_textEncodingName = (NSString *)@"UTF-8";
    self->_uint64_t characterEncoding = 4;
    goto LABEL_63;
  }
  if (characterEncoding == 4) {
LABEL_63:
  }
    *(_DWORD *)&self->_flags |= 0x20u;
LABEL_64:
  id v30 = self->_textEncodingName;
  self->_outputBaseURL = (NSURL *)[(NSDictionary *)self->_documentAttrs objectForKey:@"OutputBaseURL"];
  self->_id resourceHandler = [(NSDictionary *)self->_documentAttrs objectForKey:@"WebResourceHandler"];
  if (v226)
  {
    unint64_t v31 = 0;
    unint64_t v32 = 0;
    unint64_t v212 = 0;
    v220 = 0;
    v218 = 0;
    v229 = 0;
    BOOL v214 = 0;
    int v33 = 0;
    char v227 = 0;
    LOBYTE(v34) = 0;
    id v224 = 0;
    uint64_t v219 = 0;
    unint64_t v221 = 0;
    unint64_t v222 = 0;
    unint64_t v211 = 0;
    v225 = 0;
    uint64_t v207 = *MEMORY[0x1E4F287E0];
    unint64_t v213 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      int v36 = [(NSString *)v231 characterAtIndex:v31];
      if (v31 >= *(void *)&v237[0] && v31 - *(void *)&v237[0] < *((void *)&v237[0] + 1))
      {
        int v40 = 0;
        goto LABEL_297;
      }
      uint64_t v233 = 0;
      v220 = [(NSAttributedString *)self->_attrStr attributesAtIndex:v31 effectiveRange:v237];
      if (v31 && (v36 == 10 || v36 == 8233 || v36 == 13))
      {
        int v38 = [(NSString *)v231 characterAtIndex:v31 - 1];
        id v39 = v229;
        if (v38 != 10 && v38 != 13 && v38 != 8233)
        {
          v220 = [(NSAttributedString *)self->_attrStr attributesAtIndex:v31 - 1 effectiveRange:v237];
          if (v31 < *(void *)&v237[0] || v31 - *(void *)&v237[0] >= *((void *)&v237[0] + 1)) {
            ++*((void *)&v237[0] + 1);
          }
        }
      }
      else
      {
        id v39 = v229;
      }
      if ((self->_excludedElements1 & 1) == 0)
      {
        uint64_t v41 = [(NSDictionary *)v220 objectForKey:@"NSLink"];
        if (v41)
        {
          BOOL v42 = (void *)v41;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v43 = v42;
LABEL_88:
            uint64_t v44 = _escapedStringForString(v43, 1);
            goto LABEL_90;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v43 = (void *)[v42 absoluteString];
            goto LABEL_88;
          }
        }
      }
      uint64_t v44 = 0;
LABEL_90:
      if (v39 == v44)
      {
        int v45 = 0;
      }
      else if (v39)
      {
        int v45 = [v39 isEqualToString:v44] ^ 1;
      }
      else
      {
        int v45 = 1;
      }
      if (v44) {
        BOOL v46 = v39 == 0;
      }
      else {
        BOOL v46 = 0;
      }
      if (v46) {
        unint64_t v47 = v222;
      }
      else {
        unint64_t v47 = v221;
      }
      if ((self->_excludedElements2 & 0x1000) != 0) {
        id v48 = 0;
      }
      else {
        id v48 = [(NSDictionary *)v220 objectForKey:@"NSWritingDirection"];
      }
      v216 = v44;
      if (v224 == v48)
      {
        int v49 = 0;
      }
      else if (v224)
      {
        int v49 = [v224 isEqual:v48] ^ 1;
      }
      else
      {
        int v49 = 1;
      }
      if ((self->_excludedElements3 & 4) != 0) {
        id v50 = 0;
      }
      else {
        id v50 = [(NSDictionary *)v220 objectForKey:@"NSTextHighlightStyle"];
      }
      v215 = v50;
      char v210 = [v50 isEqual:v225];
      if (v31 <= v212)
      {
        v218 = [(NSDictionary *)v220 objectForKey:@"NSParagraphStyle"];
        if (!v218) {
          v218 = +[NSParagraphStyle defaultParagraphStyle];
        }
        BOOL v66 = 1;
        unint64_t v213 = -[NSString paragraphRangeForRange:](v231, "paragraphRangeForRange:", v31, 1);
        uint64_t v68 = v67;
        uint64_t v69 = 0;
        if (v36 <= 12)
        {
          if (v36 == 9) {
            goto LABEL_165;
          }
          BOOL v70 = 0;
          if (v36 != 10) {
            goto LABEL_175;
          }
        }
        else if (v36 != 13)
        {
          if (v36 != 8233)
          {
            BOOL v70 = 0;
            if (v36 != 32) {
              goto LABEL_175;
            }
          }
LABEL_165:
          BOOL v66 = v36 == 8233;
        }
        unint64_t v73 = v213 + v67;
        for (unint64_t i = v31 + 1; i < v73; ++i)
        {
          unsigned int v75 = [(NSString *)v231 characterAtIndex:i];
          if ((v75 > 0x20 || ((1 << v75) & 0x100002600) == 0) && v75 != 8233)
          {
            uint64_t v69 = 0;
            goto LABEL_174;
          }
        }
        uint64_t v69 = 1;
LABEL_174:
        BOOL v70 = v66;
LABEL_175:
        LOBYTE(v202) = v209;
        BOOL v214 = v70;
        unint64_t v211 = -[NSHTMLWriter _paragraphClassforParagraphStyle:presentationIntent:range:isEmpty:isCompletelyEmpty:headerString:alignmentString:directionString:forWebKit:](self, "_paragraphClassforParagraphStyle:presentationIntent:range:isEmpty:isCompletelyEmpty:headerString:alignmentString:directionString:forWebKit:", v218, [(NSDictionary *)v220 objectForKey:v207], v213, v68, v69, v70, &v236, &v235, &v234, v202);
        if ((self->_excludedElements1 & 0x400000) != 0 || !v235) {
          v235 = &stru_1EDD49F70;
        }
        uint64_t v228 = v68;
        if (!v234) {
          v234 = &stru_1EDD49F70;
        }
        unint64_t v76 = [(NSHTMLWriter *)self _spanClassForAttributes:v220 inParagraphClass:v211 spanClass:0 flags:&v233 forWebKit:v209];
        [(NSHTMLWriter *)self _openBlocksForParagraphStyle:v218 atIndex:v31 inString:self->_bodyStr];
        [(NSHTMLWriter *)self _openListsForParagraphStyle:v218 atIndex:v31 inString:self->_bodyStr isStrict:v208];
        if (v236)
        {
          if (!v211)
          {
            bodyStr = self->_bodyStr;
            id v85 = [(NSHTMLWriter *)self _prefix];
            [(NSMutableString *)bodyStr appendFormat:@"%@<%@%@%@>", v85, v236, v235, v234, v203];
            goto LABEL_212;
          }
          unsigned int excludedElements1 = self->_excludedElements1;
          unsigned int excludedElements2 = self->_excludedElements2;
          if (!(excludedElements1 & 0x20000000 | excludedElements2 & 0x9000))
          {
            if (objc_msgSend(@"p", "isEqualToString:"))
            {
              uint64_t v79 = self->_bodyStr;
              id v80 = [(NSHTMLWriter *)self _prefix];
              [(NSMutableString *)v79 appendFormat:@"%@<%@%@%@ class=\"p%lu\">", v80, v236, v235, v234, v211];
              goto LABEL_212;
            }
            unsigned int excludedElements1 = self->_excludedElements1;
            unsigned int excludedElements2 = self->_excludedElements2;
          }
          if (!(excludedElements1 & 0x20000000 | excludedElements2 & 0x9000))
          {
            if ([@"li" isEqualToString:v236])
            {
              BOOL v86 = self->_bodyStr;
              id v87 = [(NSHTMLWriter *)self _prefix];
              [(NSMutableString *)v86 appendFormat:@"%@<%@%@%@ class=\"li%lu\">", v87, v236, v235, v234, v211];
              goto LABEL_212;
            }
            unsigned int excludedElements2 = self->_excludedElements2;
          }
          v223 = self->_bodyStr;
          id v91 = [(NSHTMLWriter *)self _prefix];
          v93 = v235;
          uint64_t v92 = v236;
          v94 = v234;
          if ((excludedElements2 & 0x1000) != 0)
          {
            [(NSMutableString *)v223 appendFormat:@"%@<%@%@%@>", v91, v236, v235, v234];
          }
          else
          {
            id v95 = v91;
            uint64_t v203 = [(NSMutableArray *)self->_paraStyleStrings objectAtIndex:v211 - 1];
            [(NSMutableString *)v223 appendFormat:@"%@<%@%@%@ style=\"%@\">", v95, v92, v93, v94];
          }
          if (!v76)
          {
LABEL_229:
            if (v216)
            {
              [(NSMutableString *)self->_bodyStr appendFormat:@"<a href=\"%@\">", v216];
              unint64_t v221 = v76;
            }
            if (v215) {
              char v96 = v210;
            }
            else {
              char v96 = 1;
            }
            if ((v96 & 1) == 0) {
              [(NSMutableString *)self->_bodyStr appendString:[(NSHTMLWriter *)self markElementFor:v215 spanClass:v76 paraClass:v211]];
            }
            if (v48
              && (unint64_t)[v48 count] >= 2
              && (self->_excludedElements2 & 0x1000) == 0
              && (unint64_t)[v48 count] >= 2)
            {
              unint64_t v97 = 1;
              do
              {
                char v98 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", v97), "unsignedIntegerValue");
                v99 = @"ltr";
                if (v98) {
                  v99 = @"rtl";
                }
                v100 = @"bidi-override";
                if ((v98 & 2) == 0) {
                  v100 = @"embed";
                }
                -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", @"<span style=\"direction: %@; unicode-bidi: %@\">",
                  v99,
                  v100);
                ++v97;
              }
              while (v97 < [v48 count]);
            }
            [(NSHTMLWriter *)self _closeFlags:0 openFlags:v233 inString:self->_bodyStr];
            uint64_t v101 = [(NSArray *)[(NSParagraphStyle *)v218 textLists] count];
            LOBYTE(v34) = 0;
            if (v36 == 9 && v101)
            {
              unint64_t v102 = v31;
              while (++v102 < v213 + v228)
              {
                if ([(NSString *)v231 characterAtIndex:v102] == 9)
                {
                  unint64_t v60 = v76;
                  LOBYTE(v34) = 0;
                  char v227 = 0;
                  int v33 = 0;
                  unint64_t v32 = v102 + 1;
                  int v40 = 1;
                  unint64_t v72 = v221;
                  unint64_t v31 = v102;
                  goto LABEL_290;
                }
              }
              unint64_t v60 = v76;
              LOBYTE(v34) = 0;
              char v227 = 0;
              int v33 = 0;
              int v40 = 0;
              goto LABEL_289;
            }
            unint64_t v60 = v76;
            unint64_t v72 = v221;
            char v227 = 0;
            int v33 = 0;
            int v40 = 0;
            goto LABEL_290;
          }
        }
        else
        {
LABEL_212:
          if (!v76) {
            goto LABEL_229;
          }
        }
        if ((self->_excludedElements1 & 0x400000) != 0)
        {
          if ((self->_excludedElements2 & 0x1000) != 0) {
            goto LABEL_229;
          }
          [(NSMutableString *)self->_bodyStr appendString:@"<span"];
        }
        else
        {
          [(NSMutableString *)self->_bodyStr appendFormat:@"<font%@", [(NSMutableArray *)self->_fontStrings objectAtIndex:v76 - 1]];
        }
        unsigned int v88 = self->_excludedElements1;
        unsigned int v89 = self->_excludedElements2;
        if (v88 & 0x20000000 | v89 & 0x9000)
        {
          if ((v89 & 0x1000) != 0) {
            [(NSMutableString *)self->_bodyStr appendString:@">"];
          }
          else {
            [(NSMutableString *)self->_bodyStr appendFormat:@" style=\"%@\">", [(NSMutableOrderedSet *)self->_charStyleStrings objectAtIndex:v76 - 1], v201];
          }
        }
        else
        {
          BOOL v46 = (v88 & 0x400000) == 0;
          uint64_t v90 = 115;
          if (v46) {
            uint64_t v90 = 102;
          }
          [(NSMutableString *)self->_bodyStr appendFormat:@" class=\"%c%lu\">", v90, v76];
        }
        goto LABEL_229;
      }
      if (v216) {
        unint64_t v51 = v47;
      }
      else {
        unint64_t v51 = 0;
      }
      unint64_t v52 = [(NSHTMLWriter *)self _spanClassForAttributes:v220 inParagraphClass:v211 spanClass:v51 flags:&v233 forWebKit:v209];
      unint64_t v53 = v32;
      unint64_t v54 = v52;
      uint64_t v55 = v31 - v53;
      unint64_t v221 = v47;
      if (v31 > v53)
      {
        double v56 = self->_bodyStr;
        uint64_t v57 = -[NSString substringWithRange:](v231, "substringWithRange:");
        float v58 = v56;
        unint64_t v47 = v221;
        [(NSMutableString *)v58 appendString:v57];
      }
      if (v54 == v222) {
        int v59 = v45;
      }
      else {
        int v59 = 1;
      }
      if ((v59 | v49) == 1)
      {
        unint64_t v60 = v54;
        if (v227) {
          [(NSMutableString *)self->_bodyStr appendString:@"</span>", v55];
        }
        if (v34) {
          [(NSMutableString *)self->_bodyStr appendString:@"</span>", v55];
        }
        if (v33) {
          [(NSMutableString *)self->_bodyStr appendString:@"</span>", v55];
        }
        [(NSHTMLWriter *)self _closeFlags:v219 openFlags:0 inString:self->_bodyStr];
        if (v224
          && (unint64_t)[v224 count] >= 2
          && (self->_excludedElements2 & 0x1000) == 0
          && (unint64_t)[v224 count] >= 2)
        {
          unint64_t v61 = 1;
          do
          {
            [(NSMutableString *)self->_bodyStr appendString:@"</span>"];
            ++v61;
          }
          while (v61 < [v224 count]);
        }
        if (v222)
        {
          if (v222 != v221)
          {
            uint64_t v62 = @"</font>";
            if ((self->_excludedElements1 & 0x400000) == 0
              || (uint64_t v62 = @"</span>", (self->_excludedElements2 & 0x1000) == 0))
            {
              [(NSMutableString *)self->_bodyStr appendString:v62];
            }
          }
        }
        if (v225) {
          char v63 = v210;
        }
        else {
          char v63 = 1;
        }
        if ((v63 & 1) == 0) {
          [(NSMutableString *)self->_bodyStr appendString:@"</mark>"];
        }
        if (!v229
          || ((v45 ^ 1) & 1) != 0
          || ([(NSMutableString *)self->_bodyStr appendString:@"</a>"], v216)
          || !v221
          || v54 == v221)
        {
          if (v216) {
            int v81 = v45;
          }
          else {
            int v81 = 0;
          }
          if (v81 == 1) {
            [(NSMutableString *)self->_bodyStr appendFormat:@"<a href=\"%@\">", v216];
          }
        }
        else
        {
          if ((self->_excludedElements1 & 0x400000) == 0)
          {
            id v64 = self->_bodyStr;
            uint64_t v65 = @"</font>";
            goto LABEL_256;
          }
          if ((self->_excludedElements2 & 0x1000) == 0)
          {
            id v64 = self->_bodyStr;
            uint64_t v65 = @"</span>";
LABEL_256:
            [(NSMutableString *)v64 appendString:v65];
          }
        }
        if (v215) {
          char v103 = v210;
        }
        else {
          char v103 = 1;
        }
        if ((v103 & 1) == 0) {
          [(NSMutableString *)self->_bodyStr appendString:[(NSHTMLWriter *)self markElementFor:v215 spanClass:v54 paraClass:v211]];
        }
        if (v54 && v54 != v221)
        {
          if ((self->_excludedElements1 & 0x400000) == 0)
          {
            [(NSMutableString *)self->_bodyStr appendFormat:@"<font%@", [(NSMutableArray *)self->_fontStrings objectAtIndex:v54 - 1]];
            goto LABEL_268;
          }
          if ((self->_excludedElements2 & 0x1000) == 0)
          {
            [(NSMutableString *)self->_bodyStr appendString:@"<span"];
LABEL_268:
            unsigned int v104 = self->_excludedElements1;
            unsigned int v105 = self->_excludedElements2;
            if (!(v104 & 0x20000000 | v105 & 0x9000))
            {
              BOOL v46 = (v104 & 0x400000) == 0;
              uint64_t v106 = 115;
              if (v46) {
                uint64_t v106 = 102;
              }
              [(NSMutableString *)self->_bodyStr appendFormat:@" class=\"%c%lu\">", v106, v54];
              if (!v48)
              {
LABEL_287:
                [(NSHTMLWriter *)self _closeFlags:0 openFlags:v233 inString:self->_bodyStr];
LABEL_288:
                LOBYTE(v34) = 0;
                char v227 = 0;
                int v33 = 0;
                int v40 = 0;
                unint64_t v32 = v31;
LABEL_289:
                unint64_t v72 = v221;
                goto LABEL_290;
              }
LABEL_276:
              if ((unint64_t)[v48 count] >= 2
                && (self->_excludedElements2 & 0x1000) == 0
                && (unint64_t)[v48 count] >= 2)
              {
                unint64_t v107 = 1;
                do
                {
                  char v108 = objc_msgSend((id)objc_msgSend(v48, "objectAtIndex:", v107), "unsignedIntegerValue");
                  v109 = @"ltr";
                  if (v108) {
                    v109 = @"rtl";
                  }
                  v110 = @"bidi-override";
                  if ((v108 & 2) == 0) {
                    v110 = @"embed";
                  }
                  -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", @"<span style=\"direction: %@; unicode-bidi: %@\">",
                    v109,
                    v110);
                  ++v107;
                }
                while (v107 < [v48 count]);
              }
              goto LABEL_287;
            }
            if ((v105 & 0x1000) != 0)
            {
              [(NSMutableString *)self->_bodyStr appendString:@">"];
              if (!v48) {
                goto LABEL_287;
              }
              goto LABEL_276;
            }
            [(NSMutableString *)self->_bodyStr appendFormat:@" style=\"%@\">", [(NSMutableOrderedSet *)self->_charStyleStrings objectAtIndex:v54 - 1]];
          }
        }
        if (!v48) {
          goto LABEL_287;
        }
        goto LABEL_276;
      }
      char v71 = v210;
      if (v219 != v233) {
        char v71 = 0;
      }
      if ((v71 & 1) == 0)
      {
        if (v227) {
          [(NSMutableString *)self->_bodyStr appendString:@"</span>", v55];
        }
        if (v34) {
          [(NSMutableString *)self->_bodyStr appendString:@"</span>", v55];
        }
        if (v33) {
          [(NSMutableString *)self->_bodyStr appendString:@"</span>", v55];
        }
        [(NSHTMLWriter *)self _closeFlags:v219 openFlags:0 inString:self->_bodyStr];
        if (v225) {
          char v82 = v210;
        }
        else {
          char v82 = 1;
        }
        if ((v82 & 1) == 0) {
          [(NSMutableString *)self->_bodyStr appendString:@"</mark>"];
        }
        if (v215) {
          char v83 = v210;
        }
        else {
          char v83 = 1;
        }
        if ((v83 & 1) == 0) {
          -[NSMutableString appendString:](self->_bodyStr, "appendString:", -[NSHTMLWriter markElementFor:spanClass:paraClass:](self, "markElementFor:spanClass:paraClass:"));
        }
        [(NSHTMLWriter *)self _closeFlags:0 openFlags:v233 inString:self->_bodyStr];
        unint64_t v60 = v222;
        goto LABEL_288;
      }
      int v40 = 0;
      unint64_t v60 = v222;
      unint64_t v32 = v31;
      unint64_t v72 = v47;
LABEL_290:
      if (v216) {
        BOOL v111 = 1;
      }
      else {
        BOOL v111 = v229 == 0;
      }
      uint64_t v219 = v233;
      if (v111) {
        unint64_t v112 = v72;
      }
      else {
        unint64_t v112 = 0;
      }
      unint64_t v221 = v112;

      v229 = (void *)[v216 copy];
      id v224 = (id)[v48 copy];

      v225 = (void *)[v215 copy];
      unint64_t v222 = v60;
      unint64_t v12 = v226;
LABEL_297:
      if (v36 != 9 && (v227 & 1) != 0)
      {
        [(NSMutableString *)self->_bodyStr appendString:@"</span>"];
        char v227 = 0;
      }
      if ((v34 & 1) == 0) {
        goto LABEL_304;
      }
      int v34 = 1;
      if (v36 != 9 && v36 != 32)
      {
        [(NSMutableString *)self->_bodyStr appendString:@"</span>"];
LABEL_304:
        int v34 = 0;
      }
      if (v36 != 9 && (v33 & 1) != 0)
      {
        [(NSMutableString *)self->_bodyStr appendString:@"</span>"];
        int v33 = 0;
      }
      if (v36 == 9) {
        int v113 = v40;
      }
      else {
        int v113 = 1;
      }
      if (v36 == 32 || !v113) {
        goto LABEL_323;
      }
      if ((self->_excludedElements1 & 0x800) != 0)
      {
        if (v36 <= 0x3E && ((1 << v36) & 0x5000004000000000) != 0) {
          goto LABEL_323;
        }
      }
      else
      {
        if (v36 <= 132)
        {
          if (v36 <= 0x3E && ((1 << v36) & 0x5000004000000000) != 0) {
            goto LABEL_323;
          }
          goto LABEL_345;
        }
        if (v36 == 133 || v36 == 8232) {
          goto LABEL_323;
        }
      }
      if (v36 == 65532) {
        goto LABEL_323;
      }
LABEL_345:
      if (v36 > 0x1F || v36 <= 0xD && ((1 << v36) & 0x2600) != 0) {
        goto LABEL_411;
      }
LABEL_323:
      unint64_t v35 = v31 - v32;
      if (v31 > v32) {
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", -[NSString substringWithRange:](v231, "substringWithRange:", v32, v35));
      }
      unint64_t v114 = v31 + 1;
      if (v36 == 32)
      {
LABEL_353:
        uint64_t v121 = [(NSMutableString *)self->_bodyStr length];
        if (v31) {
          unsigned int v122 = [(NSString *)v231 characterAtIndex:v31 - 1];
        }
        else {
          unsigned int v122 = 0;
        }
        int v217 = v33;
        char v123 = 1;
        if (v31 > v213 && (v122 > 0xD || ((1 << v122) & 0x2401) == 0) && v122 - 8232 >= 2 && v122 != 133) {
          char v123 = 0;
        }
        if (v121) {
          BOOL v124 = [(NSMutableString *)self->_bodyStr characterAtIndex:v121 - 1] == 32;
        }
        else {
          BOOL v124 = 0;
        }
        if (v114 >= v12)
        {
          char v125 = 0;
          int v128 = 1;
          goto LABEL_375;
        }
        char v125 = 0;
        unint64_t v126 = v31 + 1;
        while (1)
        {
          int v127 = [(NSString *)v231 characterAtIndex:v126];
          int v128 = 1;
          if (v127 <= 12)
          {
            if (v127 != 9)
            {
              if (v127 != 10) {
                goto LABEL_388;
              }
              goto LABEL_375;
            }
            char v129 = 4;
          }
          else
          {
            if (v127 != 32)
            {
              if (v127 != 13 && v127 != 8233) {
LABEL_388:
              }
                int v128 = 0;
LABEL_375:
              if (v36 == 9)
              {
                unsigned int v130 = self->_excludedElements2;
                if ((v130 & 0x1000) == 0)
                {
                  if (((v34 | ((v130 & 0x20000000) >> 29)) & 1) == 0)
                  {
                    [(NSMutableString *)self->_bodyStr appendString:@"<span class=\"Apple-converted-space\">"];
                    LOBYTE(v34) = 1;
                  }
                  if (v227)
                  {
LABEL_382:
                    char v227 = 1;
                  }
                  else
                  {
                    if ((self->_excludedElements2 & 0x40000000) == 0)
                    {
                      [(NSMutableString *)self->_bodyStr appendString:@"<span class=\"Apple-converted-tab\">"];
                      goto LABEL_382;
                    }
                    char v227 = 0;
                  }
                }
                uint64_t v131 = 3;
                goto LABEL_395;
              }
              uint64_t v131 = 0;
LABEL_395:
              while (2)
              {
                if ((v123 & 1) != 0 || v124 || v128 != ((v125 + (_BYTE)v131) & 1))
                {
                  if ((v34 & 1) == 0)
                  {
                    if ((self->_excludedElements2 & 0x20001000) != 0)
                    {
                      LOBYTE(v34) = 0;
LABEL_404:
                      if ((*(unsigned char *)&self->_flags & 0x20) != 0)
                      {
                        BOOL v124 = 0;
                        v134 = @" ";
                      }
                      else
                      {
                        BOOL v124 = 0;
                        if (self->_characterEncoding == 5) {
                          v134 = @" ";
                        }
                        else {
                          v134 = @"&nbsp;";
                        }
                      }
LABEL_409:
                      [(NSMutableString *)self->_bodyStr appendString:v134];
                      char v123 = 0;
                      if (--v131 == -1)
                      {
                        unint64_t v32 = v31 + 1;
                        unint64_t v12 = v226;
                        int v33 = v217;
                        goto LABEL_411;
                      }
                      continue;
                    }
                    [(NSMutableString *)self->_bodyStr appendString:@"<span class=\"Apple-converted-space\">"];
                  }
                  LOBYTE(v34) = 1;
                  goto LABEL_404;
                }
                break;
              }
              BOOL v124 = 1;
              v134 = @" ";
              goto LABEL_409;
            }
            char v129 = 1;
          }
          v125 += v129;
          if (v226 == ++v126) {
            goto LABEL_375;
          }
        }
      }
      if (v36 <= 61)
      {
        switch(v36)
        {
          case 9:
            $2D985FE1209761417A79CA1E24509E35 flags = self->_flags;
            if ((*(unsigned char *)&flags & 4) != 0) {
              goto LABEL_353;
            }
            if ((self->_excludedElements2 & 0x40001000) == 0)
            {
              if ((*(unsigned char *)&flags & 8) != 0)
              {
                if (v33)
                {
                  v158 = self->_bodyStr;
                  v159 = @"\t";
                }
                else
                {
                  v158 = self->_bodyStr;
                  if (self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000) {
                    v159 = @"<span class=\"Apple-tab-span\" style=\"white-space:pre\">\t";
                  }
                  else {
                    v159 = @"<span class=\"Apple-tab-span\">\t";
                  }
                }
                -[NSMutableString appendString:](v158, "appendString:", v159, v35);
                int v33 = 1;
              }
              else
              {
                if (self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000) {
                  v157 = @"<span class=\"Apple-tab-span\" style=\"white-space:pre\">\t</span>";
                }
                else {
                  v157 = @"<span class=\"Apple-tab-span\">\t</span>";
                }
                -[NSMutableString appendString:](self->_bodyStr, "appendString:", v157, v35);
              }
              BOOL v132 = 0;
              BOOL v133 = 0;
              *(_DWORD *)&self->_flags |= 0x10u;
              goto LABEL_392;
            }
            v115 = self->_bodyStr;
            v116 = @"\t";
LABEL_390:
            -[NSMutableString appendString:](v115, "appendString:", v116, v35);
            goto LABEL_391;
          case 38:
            v115 = self->_bodyStr;
            v116 = @"&amp;";
            goto LABEL_390;
          case 60:
            v115 = self->_bodyStr;
            v116 = @"&lt;";
            goto LABEL_390;
        }
        goto LABEL_344;
      }
      if (v36 > 8231)
      {
        if (v36 != 8232)
        {
          if (v36 == 65532)
          {
            id v117 = [(NSAttributedString *)self->_attrStr attribute:@"NSAttachment" atIndex:v31 effectiveRange:0];
            if (v117) {
              [(NSHTMLWriter *)self _appendAttachment:v117 atIndex:v31 toString:self->_bodyStr];
            }
            id v118 = [(NSAttributedString *)self->_attrStr attribute:@"CTAdaptiveImageProvider" atIndex:v31 effectiveRange:0];
            if (v118) {
              [(NSHTMLWriter *)self _appendImageGlyph:v118 withAttributes:v220 toString:self->_bodyStr];
            }
LABEL_391:
            BOOL v132 = 0;
            BOOL v133 = 0;
LABEL_392:
            unint64_t v32 = v31 + 1;
            goto LABEL_415;
          }
          goto LABEL_344;
        }
      }
      else
      {
        if (v36 == 62)
        {
          v115 = self->_bodyStr;
          v116 = @"&gt;";
          goto LABEL_390;
        }
        if (v36 != 133) {
          goto LABEL_344;
        }
      }
      v119 = &stru_1EDD49F70;
      if ((self->_excludedElements2 & 0x10000000) == 0) {
        v119 = @" /";
      }
      [(NSMutableString *)self->_bodyStr appendFormat:@"<br%@>\n", v35, v119];
LABEL_344:
      unint64_t v32 = v31 + 1;
LABEL_411:
      BOOL v133 = v36 == 13;
      BOOL v132 = v36 == 8233;
      if (v36 == 10 || v36 == 13) {
        goto LABEL_417;
      }
      if (v36 == 8233) {
        goto LABEL_416;
      }
      unint64_t v114 = v31 + 1;
LABEL_415:
      if (v114 == v12)
      {
LABEL_416:
        if (v132)
        {
LABEL_417:
          if ((self->_excludedElements2 & 0x80000000) != 0 || (*(unsigned char *)&self->_flags & 1) == 0)
          {
            int v135 = 1;
            goto LABEL_422;
          }
          BOOL v136 = v31 + 1 == v12;
          int v135 = 1;
        }
        else
        {
          int v135 = 0;
LABEL_422:
          BOOL v136 = 0;
        }
        if (v227) {
          [(NSMutableString *)self->_bodyStr appendString:@"</span>", v35];
        }
        if (v34) {
          [(NSMutableString *)self->_bodyStr appendString:@"</span>", v35];
        }
        if (v36 == 10 || v36 == 8233 || v36 == 13)
        {
          unint64_t v137 = v31 - v32;
          if (v31 > v32) {
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", -[NSString substringWithRange:](v231, "substringWithRange:", v32, v137));
          }
          unint64_t v139 = v222;
          v138 = v224;
          if (v133)
          {
            v140 = v225;
            if (v31 + 1 < v12 && -[NSString characterAtIndex:](v231, "characterAtIndex:", v31 + 1, v137) == 10) {
              ++v31;
            }
          }
          else
          {
            v140 = v225;
          }
        }
        else
        {
          if (v31 + 1 == v12 && v12 > v32) {
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", -[NSString substringWithRange:](v231, "substringWithRange:", v32, v12 - v32));
          }
          v138 = v224;
          v140 = v225;
          unint64_t v139 = v222;
        }
        [(NSHTMLWriter *)self _closeFlags:v219 openFlags:0 inString:self->_bodyStr];
        if (v138
          && (unint64_t)[v138 count] >= 2
          && (self->_excludedElements2 & 0x1000) == 0
          && (unint64_t)[v138 count] >= 2)
        {
          unint64_t v141 = 1;
          do
          {
            [(NSMutableString *)self->_bodyStr appendString:@"</span>"];
            ++v141;
          }
          while (v141 < [v138 count]);
        }
        if (v140)
        {
          if (v139)
          {
            v142 = @"</font>";
            if ((self->_excludedElements1 & 0x400000) == 0
              || (v142 = @"</span>", (self->_excludedElements2 & 0x1000) == 0))
            {
              [(NSMutableString *)self->_bodyStr appendString:v142];
              unint64_t v139 = 0;
            }
          }
          [(NSMutableString *)self->_bodyStr appendString:@"</mark>"];
        }
        if (v229)
        {
          if (v139)
          {
            if (v139 != v221)
            {
              v143 = @"</font>";
              if ((self->_excludedElements1 & 0x400000) == 0
                || (v143 = @"</span>", (self->_excludedElements2 & 0x1000) == 0))
              {
                [(NSMutableString *)self->_bodyStr appendString:v143];
              }
            }
          }
          [(NSMutableString *)self->_bodyStr appendString:@"</a>"];
          if (!v221) {
            goto LABEL_466;
          }
LABEL_463:
          v144 = @"</font>";
          if ((self->_excludedElements1 & 0x400000) == 0
            || (v144 = @"</span>", (self->_excludedElements2 & 0x1000) == 0))
          {
            [(NSMutableString *)self->_bodyStr appendString:v144];
          }
        }
        else if (v139)
        {
          goto LABEL_463;
        }
LABEL_466:
        uint64_t v145 = v236;
        if (v236)
        {
          if (v214)
          {
            uint64_t v146 = v236;
            if ((self->_excludedElements1 & 0x800) == 0)
            {
              v147 = &stru_1EDD49F70;
              if ((self->_excludedElements2 & 0x10000000) == 0) {
                v147 = @" /";
              }
              [(NSMutableString *)self->_bodyStr appendFormat:@"<br%@>", v147];
              uint64_t v146 = v236;
            }
          }
          else
          {
            uint64_t v146 = v236;
          }
          [(NSMutableString *)self->_bodyStr appendFormat:@"</%@>", v146];
        }
        [(NSMutableString *)self->_bodyStr appendString:@"\n"];
        BOOL v148 = [(NSHTMLWriter *)self _closeListsForParagraphStyle:v218 atIndex:v31 inString:self->_bodyStr];
        if (v145) {
          int v149 = 1;
        }
        else {
          int v149 = v148;
        }
        BOOL v150 = [(NSHTMLWriter *)self _closeBlocksForParagraphStyle:v218 atIndex:v31 inString:self->_bodyStr];
        if (((v135 ^ 1 | ((BYTE1(self->_excludedElements1) & 8) >> 3)) & 1) == 0)
        {
          int v151 = v150 | v149;
          if (v151 ^ 1 | v136)
          {
            uint64_t v152 = [(NSMutableString *)self->_bodyStr length];
            if (v152) {
              char v153 = v151;
            }
            else {
              char v153 = 1;
            }
            if ((v153 & 1) == 0)
            {
              uint64_t v154 = v152 - 1;
              if ([(NSMutableString *)self->_bodyStr characterAtIndex:v152 - 1] == 10) {
                -[NSMutableString deleteCharactersInRange:](self->_bodyStr, "deleteCharactersInRange:", v154, 1);
              }
            }
            v155 = @" class=\"Apple-interchange-newline\"";
            if (!v136) {
              v155 = &stru_1EDD49F70;
            }
            v156 = @" /";
            if ((self->_excludedElements2 & 0x10000000) != 0) {
              v156 = &stru_1EDD49F70;
            }
            [(NSMutableString *)self->_bodyStr appendFormat:@"<br%@%@>\n", v155, v156];
          }
        }
        unint64_t v114 = v31 + 1;
        v237[0] = xmmword_18E5F72A0;

        v225 = 0;
        unint64_t v222 = 0;
        unint64_t v221 = 0;
        uint64_t v219 = 0;
        id v224 = 0;
        LOBYTE(v34) = 0;
        char v227 = 0;
        int v33 = 0;
        BOOL v214 = 0;
        v229 = 0;
        unint64_t v212 = v31 + 1;
        unint64_t v32 = v31 + 1;
      }
      unint64_t v31 = v114;
    }
    while (v114 < v12);
  }
  self->_int64_t level = 0;
  if ((self->_excludedElements2 & 0x10000000) == 0)
  {
    if (self->_textEncodingName) {
      [(__CFString *)v206 appendFormat:@"<?xml version=\"1.0\" encoding=\"%@\"?>\n", self->_textEncodingName];
    }
    else {
      [(__CFString *)v206 appendString:@"<?xml version=\"1.0\"?>\n"];
    }
  }
  unsigned int v160 = self->_excludedElements1;
  if ((v160 & 0x100000) != 0)
  {
    v162 = v205;
    if ((v160 & 0x80000000) != 0) {
      goto LABEL_530;
    }
    goto LABEL_527;
  }
  unsigned int v161 = self->_excludedElements2;
  if ((v161 & 0x10000000) != 0)
  {
    v162 = v205;
    if (!(v161 & 0x800000 | v160 & 0x20000000))
    {
      v165 = @" Transitional";
      if (v208) {
        v165 = &stru_1EDD49F70;
      }
      v166 = @"loose";
      if (v208) {
        v166 = @"strict";
      }
      [(__CFString *)v206 appendFormat:@"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01%@//EN\" \"http://www.w3.org/TR/html4/%@.dtd\">\n", v165, v166];
    }
  }
  else
  {
    v162 = v205;
    if ((v160 & 0x80000000) == 0 && !(v161 & 0x800000 | v160 & 0x20000400))
    {
      v163 = @"Transitional";
      if (v208) {
        v163 = @"Strict";
      }
      v164 = @"transitional";
      if (v208) {
        v164 = @"strict";
      }
      [(__CFString *)v206 appendFormat:@"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 %@//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-%@.dtd\">\n", v163, v164];
    }
  }
  unsigned int v160 = self->_excludedElements1;
  if ((v160 & 0x80000000) == 0)
  {
LABEL_527:
    v167 = &stru_1EDD49F70;
    if ((self->_excludedElements2 & 0x10000000) == 0) {
      v167 = @" xmlns=\"http://www.w3.org/1999/xhtml\"";
    }
    [(__CFString *)v206 appendFormat:@"<html%@>\n", v167];
    unsigned int v160 = self->_excludedElements1;
  }
LABEL_530:
  if ((v160 & 0x20000000) == 0)
  {
    [(__CFString *)v206 appendFormat:@"%@<head>\n", [(NSHTMLWriter *)self _prefixUp]];
    if ((self->_excludedElements2 & 0x10) == 0)
    {
      [(__CFString *)v206 appendFormat:@"%@<meta http-equiv=\"Content-Type\" content=\"text/html", [(NSHTMLWriter *)self _prefix]];
      if (self->_textEncodingName) {
        [(__CFString *)v206 appendFormat:@"; charset=%@", self->_textEncodingName];
      }
      if ((self->_excludedElements2 & 0x10000000) != 0) {
        v168 = &stru_1EDD49F70;
      }
      else {
        v168 = @" /";
      }
      [(__CFString *)v206 appendFormat:@"\"%@>\n", v168];
      id v169 = [(NSHTMLWriter *)self _prefix];
      if ((self->_excludedElements2 & 0x10000000) != 0) {
        v170 = &stru_1EDD49F70;
      }
      else {
        v170 = @" /";
      }
      [(__CFString *)v206 appendFormat:@"%@<meta http-equiv=\"Content-Style-Type\" content=\"text/css\"%@>\n", v169, v170];
    }
    [(NSHTMLWriter *)self _writeDocumentPropertiesToString:v206];
    if ((self->_excludedElements2 & 0x9000) == 0)
    {
      [(__CFString *)v206 appendFormat:@"%@<style type=\"text/css\">\n", [(NSHTMLWriter *)self _prefixUp]];
      if (v204 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v171 = v204 >> 8;
        if (v171 != 0xFFFFFF) {
          [(__CFString *)v206 appendFormat:@"%@body {background-color: #%.6x}\n", [(NSHTMLWriter *)self _prefix], v171];
        }
      }
      uint64_t v172 = [(NSMutableArray *)self->_paraStyleStrings count];
      if (v172)
      {
        uint64_t v173 = v172;
        uint64_t v174 = 0;
        do
        {
          uint64_t v175 = v174 + 1;
          if ([(NSMutableIndexSet *)self->_paraStyleIndexes containsIndex:v174 + 1]) {
            [(__CFString *)v206 appendFormat:@"%@p.p%lu {%@}\n", [(NSHTMLWriter *)self _prefix], v174 + 1, [(NSMutableArray *)self->_paraStyleStrings objectAtIndex:v174]];
          }
          ++v174;
        }
        while (v173 != v175);
        uint64_t v176 = 0;
        do
        {
          uint64_t v177 = v176 + 1;
          if ([(NSMutableIndexSet *)self->_listItemStyleIndexes containsIndex:v176 + 1])[(__CFString *)v206 appendFormat:@"%@li.li%lu {%@}\n", [(NSHTMLWriter *)self _prefix], v176 + 1, [(NSMutableArray *)self->_paraStyleStrings objectAtIndex:v176]]; {
          ++v176;
          }
        }
        while (v173 != v177);
      }
      uint64_t v178 = [(NSMutableOrderedSet *)self->_charStyleStrings count];
      uint64_t v179 = v178;
      if ((self->_excludedElements1 & 0x400000) != 0)
      {
        if ((self->_excludedElements2 & 0x1000) == 0 && v178)
        {
          uint64_t v181 = 0;
          do
          {
            [(__CFString *)v206 appendFormat:@"%@span.s%lu {%@}\n", [(NSHTMLWriter *)self _prefix], v181 + 1, [(NSMutableOrderedSet *)self->_charStyleStrings objectAtIndex:v181]];
            ++v181;
          }
          while (v179 != v181);
        }
      }
      else if (v178)
      {
        uint64_t v180 = 0;
        do
        {
          [(__CFString *)v206 appendFormat:@"%@font.f%lu {%@}\n", [(NSHTMLWriter *)self _prefix], v180 + 1, [(NSMutableOrderedSet *)self->_charStyleStrings objectAtIndex:v180]];
          ++v180;
        }
        while (v179 != v180);
      }
      if ((self->_excludedElements2 & 0x40001000) == 0 && (*(unsigned char *)&self->_flags & 0x10) != 0) {
        [(__CFString *)v206 appendFormat:@"%@span.Apple-tab-span {white-space:pre}\n", [(NSHTMLWriter *)self _prefix]];
      }
      uint64_t v182 = [(NSMutableArray *)self->_tableStyleStrings count];
      if (v182)
      {
        uint64_t v183 = v182;
        for (uint64_t j = 0; j != v183; ++j)
          [(__CFString *)v206 appendFormat:@"%@table.t%lu {%@}\n", [(NSHTMLWriter *)self _prefix], j + 1, [(NSMutableArray *)self->_tableStyleStrings objectAtIndex:j]];
      }
      uint64_t v185 = [(NSMutableArray *)self->_tableCellStyleStrings count];
      if (v185)
      {
        uint64_t v186 = v185;
        for (uint64_t k = 0; k != v186; ++k)
          [(__CFString *)v206 appendFormat:@"%@td.td%lu {%@}\n", [(NSHTMLWriter *)self _prefix], k + 1, [(NSMutableArray *)self->_tableCellStyleStrings objectAtIndex:k]];
      }
      uint64_t v188 = [(NSMutableArray *)self->_blockStyleStrings count];
      if (v188)
      {
        uint64_t v189 = v188;
        for (uint64_t m = 0; m != v189; ++m)
          [(__CFString *)v206 appendFormat:@"%@div.d%lu {%@}\n", [(NSHTMLWriter *)self _prefix], m + 1, [(NSMutableArray *)self->_blockStyleStrings objectAtIndex:m]];
      }
      uint64_t v191 = [(NSMutableArray *)self->_olistStyleStrings count];
      if (v191)
      {
        uint64_t v192 = v191;
        for (uint64_t n = 0; n != v192; ++n)
          [(__CFString *)v206 appendFormat:@"%@ol.ol%lu {%@}\n", [(NSHTMLWriter *)self _prefix], n + 1, [(NSMutableArray *)self->_olistStyleStrings objectAtIndex:n]];
      }
      uint64_t v194 = [(NSMutableArray *)self->_ulistStyleStrings count];
      if (v194)
      {
        uint64_t v195 = v194;
        for (iunint64_t i = 0; ii != v195; ++ii)
          [(__CFString *)v206 appendFormat:@"%@ul.ul%lu {%@}\n", [(NSHTMLWriter *)self _prefix], ii + 1, [(NSMutableArray *)self->_ulistStyleStrings objectAtIndex:ii]];
      }
      [(__CFString *)v206 appendFormat:@"%@</style>\n", [(NSHTMLWriter *)self _prefixDown]];
    }
    [(__CFString *)v206 appendFormat:@"%@</head>\n", [(NSHTMLWriter *)self _prefixDown]];
    unsigned int v160 = self->_excludedElements1;
  }
  if ((v160 & 0x400) == 0)
  {
    if (v204 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_591;
    }
    if (v204 >> 8 == 0xFFFFFF) {
      goto LABEL_591;
    }
    unsigned int v197 = self->_excludedElements2;
    if (!(v160 & 0x20000000 | v197 & 0x9000)) {
      goto LABEL_591;
    }
    if ((v197 & 0x1000) == 0)
    {
      [(__CFString *)v206 appendFormat:@"<body style=\"background-color: #%.6x\">\n", v204 >> 8];
      goto LABEL_592;
    }
    if ((v160 & 0x400000) != 0) {
LABEL_591:
    }
      [(__CFString *)v206 appendString:@"<body>\n"];
    else {
      [(__CFString *)v206 appendFormat:@"<body bgcolor=\"#%.6x\">\n", v204 >> 8];
    }
  }
LABEL_592:
  [(__CFString *)v206 appendString:self->_bodyStr];
  if ([(NSMutableString *)self->_bodyStr hasSuffix:@">\n"]) {
    -[NSMutableString deleteCharactersInRange:](self->_bodyStr, "deleteCharactersInRange:", [(NSMutableString *)self->_bodyStr length] - 1, 1);
  }
  unsigned int v198 = self->_excludedElements1;
  if ((v198 & 0x400) == 0)
  {
    [(__CFString *)v206 appendString:@"</body>\n"];
    unsigned int v198 = self->_excludedElements1;
  }
  if ((v198 & 0x80000000) == 0) {
    [(__CFString *)v206 appendString:@"</html>\n"];
  }
  if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
    [(NSHTMLWriter *)self _prepareString:v206 forConversionToEncoding:self->_characterEncoding];
  }
  v199 = (NSData *)(id)[(__CFString *)v206 dataUsingEncoding:self->_characterEncoding];
  self->_htmlData = v199;
  if (!v199)
  {
    if ([(__CFString *)v206 length])
    {
      range.NSUInteger location = 0;
      range.NSUInteger length = [(__CFString *)v206 length];
      if (CFStringTransform(v206, &range, (CFStringRef)*MEMORY[0x1E4F1D500], 0)) {
        self->_htmlData = (NSData *)(id)[(__CFString *)v206 dataUsingEncoding:self->_characterEncoding];
      }
    }
  }
  [(NSFileWrapper *)self->_fileWrapper removeFileWrapper:v162];

  htmlData = self->_htmlData;
  if (htmlData) {
    [(NSFileWrapper *)self->_fileWrapper addRegularFileWithContents:htmlData preferredFilename:@"index.html"];
  }
}

- (id)HTMLData
{
  if (!self->_fileWrapper) {
    [(NSHTMLWriter *)self _generateHTML];
  }
  id v3 = self->_htmlData;

  return v3;
}

- (id)HTMLFileWrapper
{
  fileWrapper = self->_fileWrapper;
  if (!fileWrapper)
  {
    [(NSHTMLWriter *)self _generateHTML];
    fileWrapper = self->_fileWrapper;
  }
  id v4 = fileWrapper;

  return v4;
}

- (id)subresources
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (!self->_fileWrapper) {
    [(NSHTMLWriter *)self _generateHTML];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (void *)[(NSMutableDictionary *)self->_subresources allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)[(NSMutableDictionary *)self->_subresources objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v9 = (void *)[v9 webResource];
        }
        if (v9) {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)webArchive
{
  id v3 = [(NSHTMLWriter *)self _webArchiveClass];
  if (self->_fileWrapper || ([(NSHTMLWriter *)self _generateHTML], self->_fileWrapper))
  {
    if (self->_outputBaseURL) {
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:relativeToURL:", @"index.html");
    }
    else {
      uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///index.html"];
    }
    uint64_t v5 = [[NSSubstituteWebResource alloc] initWithData:self->_htmlData URL:v4 MIMEType:@"text/html" textEncodingName:self->_textEncodingName frameName:0];
    uint64_t v6 = objc_msgSend([v3 alloc], "initWithMainResource:subresources:subframeArchives:", -[NSSubstituteWebResource webResource](v5, "webResource"), -[NSHTMLWriter subresources](self, "subresources"), 0);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_createWebArchiveData
{
  if (!self->_webArchiveData) {
    self->_webArchiveData = (NSData *)(id)objc_msgSend(-[NSHTMLWriter webArchive](self, "webArchive"), "data");
  }
}

- (id)webArchiveData
{
  if (!self->_webArchiveData)
  {
    int v3 = _NSCreateWebArchiveOnAppKitThread;
    if (_NSCreateWebArchiveOnAppKitThread == 254)
    {
      uint64_t v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
      if ([v4 objectForKey:@"NSCreateWebArchiveOnAppKitThread"]) {
        int v3 = [v4 BOOLForKey:@"NSCreateWebArchiveOnAppKitThread"];
      }
      else {
        int v3 = 1;
      }
      _NSCreateWebArchiveOnAppKitThread = v3;
    }
    if (v3 == 1 && ([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
      [(NSHTMLWriter *)self performSelectorOnMainThread:sel__createWebArchiveData withObject:0 waitUntilDone:1];
    }
    else {
      [(NSHTMLWriter *)self _createWebArchiveData];
    }
  }
  return self->_webArchiveData;
}

- (void)readDocumentFragment:(id)a3
{
  uint64_t v5 = [a3 ownerDocument];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    if (!objc_lookUpClass("DOMHTMLDocument")
      || (objc_opt_isKindOfClass() & 1) == 0
      || (uint64_t v7 = [v6 createElement:@"div"]) == 0
      || (uint64_t v8 = (void *)v7, (objc_opt_respondsToSelector() & 1) == 0))
    {
      uint64_t v9 = [v6 createElementNS:@"http://www.w3.org/1999/xhtml" qualifiedName:@"div"];
      if (!v9) {
        return;
      }
      uint64_t v8 = (void *)v9;
    }
    if (objc_opt_respondsToSelector())
    {
      self->_outputBaseURL = (NSURL *)(id)objc_msgSend(MEMORY[0x1E4F1CB10], "_web_uniqueWebDataURL");
      *(_DWORD *)&self->_flags |= 9u;
      if (!self->_fileWrapper) {
        [(NSHTMLWriter *)self _generateHTML];
      }
      [v8 setInnerHTML:self->_bodyStr];
      if ([v8 hasChildNodes])
      {
        do
        {
          uint64_t v10 = [v8 firstChild];
          [v8 removeChild:v10];
          [a3 appendChild:v10];
        }
        while (([v8 hasChildNodes] & 1) != 0);
      }
    }
  }
}

- (id)documentFragmentForDocument:(id)a3
{
  uint64_t v4 = (void *)[a3 createDocumentFragment];
  if (v4) {
    [(NSHTMLWriter *)self readDocumentFragment:v4];
  }
  return v4;
}

- (id)documentFragmentString
{
  if (!self->_fileWrapper) {
    [(NSHTMLWriter *)self _generateHTMLForWebKit:1];
  }
  int v3 = self->_bodyStr;

  return v3;
}

@end