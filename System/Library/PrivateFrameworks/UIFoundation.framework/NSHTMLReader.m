@interface NSHTMLReader
+ (BOOL)_usesLibXML2ForOptions:(id)a3;
+ (BOOL)allowsAttributedStringAgentForOptions:(id)a3;
+ (id)defaultParagraphStyle;
+ (void)initialize;
- (BOOL)_addAttachmentForElement:(id)a3 URL:(id)a4 needsParagraph:(BOOL)a5 usePlaceholder:(BOOL)a6;
- (BOOL)_elementHasOwnBackgroundColor:(id)a3;
- (BOOL)_elementIsBlockLevel:(id)a3;
- (BOOL)_enterElement:(id)a3 tag:(id)a4 display:(id)a5 depth:(int64_t)a6 embedded:(BOOL)a7;
- (BOOL)_getComputedFloat:(double *)a3 forNode:(id)a4 property:(id)a5;
- (BOOL)_getFloat:(double *)a3 forNode:(id)a4 property:(id)a5;
- (BOOL)_processElement:(id)a3 tag:(id)a4 display:(id)a5 depth:(int64_t)a6;
- (BOOL)_sanitizeWebArchiveArray:(id)a3;
- (BOOL)_sanitizeWebArchiveDictionary:(id)a3;
- (BOOL)includesTextListMarkers;
- (Class)_DOMHTMLTableCellElementClass;
- (Class)_webArchiveClass;
- (Class)_webViewClass;
- (NSHTMLReader)initWithDOMRange:(id)a3;
- (NSHTMLReader)initWithData:(id)a3 options:(id)a4;
- (NSHTMLReader)initWithPath:(id)a3 options:(id)a4;
- (id)_attributesForElement:(id)a3;
- (id)_childrenForNode:(id)a3;
- (id)_colorForNode:(id)a3 property:(id)a4;
- (id)_computedAttributesForElement:(id)a3;
- (id)_computedColorForNode:(id)a3 property:(id)a4;
- (id)_computedStringForNode:(id)a3 property:(id)a4;
- (id)_computedStyleForElement:(id)a3;
- (id)_createWebArchiveForData:(id)a3;
- (id)_specifiedStyleForElement:(id)a3;
- (id)_stringForNode:(id)a3 property:(id)a4;
- (id)_webPreferences;
- (id)attributedString;
- (id)documentAttributes;
- (void)_addMarkersToList:(id)a3 range:(_NSRange)a4;
- (void)_addQuoteForElement:(id)a3 opening:(BOOL)a4 level:(int64_t)a5;
- (void)_addTableCellForElement:(id)a3;
- (void)_addTableForElement:(id)a3;
- (void)_addValue:(id)a3 forElement:(id)a4;
- (void)_adjustTrailingNewline;
- (void)_exitElement:(id)a3 tag:(id)a4 display:(id)a5 depth:(int64_t)a6 startIndex:(unint64_t)a7;
- (void)_fillInBlock:(id)a3 forElement:(id)a4 backgroundColor:(id)a5 extraMargin:(double)a6 extraPadding:(double)a7 isTable:(BOOL)a8;
- (void)_load;
- (void)_loadFromDOMRange;
- (void)_loadUsingWebKit;
- (void)_loadUsingWebKitOnMainThread;
- (void)_newLineForElement:(id)a3;
- (void)_newParagraphForElement:(id)a3 tag:(id)a4 allowEmpty:(BOOL)a5 suppressTrailingSpace:(BOOL)a6 isEntering:(BOOL)a7;
- (void)_newTabForElement:(id)a3;
- (void)_parseNode:(id)a3;
- (void)_processHeadElement:(id)a3;
- (void)_processMetaElementWithName:(id)a3 content:(id)a4;
- (void)_processText:(id)a3;
- (void)_traverseFooterNode:(id)a3 depth:(int64_t)a4;
- (void)_traverseNode:(id)a3 depth:(int64_t)a4 embedded:(BOOL)a5;
- (void)dealloc;
- (void)setIncludesTextListMarkers:(BOOL)a3;
- (void)setMutableAttributedString:(id)a3;
@end

@implementation NSHTMLReader

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __NSLoadWebKit();
  }
}

- (Class)_webViewClass
{
  Class result = (Class)_webViewClass__webViewClass;
  if (!_webViewClass__webViewClass)
  {
    Class result = objc_lookUpClass("WebView");
    _webViewClass__webViewClass = (uint64_t)result;
    if (!result)
    {
      __NSLoadWebKit();
      Class result = objc_lookUpClass("WebView");
      _webViewClass__webViewClass = (uint64_t)result;
      if (!result)
      {
        NSLog((NSString *)@"Could not dynamically load the WebKit framework.");
        return (Class)_webViewClass__webViewClass;
      }
    }
  }
  return result;
}

- (Class)_webArchiveClass
{
  Class result = (Class)_webArchiveClass__webArchiveClass;
  if (!_webArchiveClass__webArchiveClass)
  {
    Class result = objc_lookUpClass("WebArchive");
    _webArchiveClass__webArchiveClass = (uint64_t)result;
    if (!result)
    {
      __NSLoadWebKit();
      Class result = objc_lookUpClass("WebArchive");
      _webArchiveClass__webArchiveClass = (uint64_t)result;
      if (!result)
      {
        NSLog((NSString *)@"Could not dynamically load the WebKit framework.");
        return (Class)_webArchiveClass__webArchiveClass;
      }
    }
  }
  return result;
}

- (Class)_DOMHTMLTableCellElementClass
{
  Class result = (Class)_DOMHTMLTableCellElementClass__DOMHTMLTableCellElementClass;
  if (!_DOMHTMLTableCellElementClass__DOMHTMLTableCellElementClass)
  {
    Class result = objc_lookUpClass("DOMHTMLTableCellElement");
    _DOMHTMLTableCellElementClass__DOMHTMLTableCellElementClass = (uint64_t)result;
  }
  return result;
}

- (id)_webPreferences
{
  v2 = (void *)_webPreferences__webPreferences;
  if (!_webPreferences__webPreferences)
  {
    v2 = (void *)[objc_alloc(objc_lookUpClass("WebPreferences")) initWithIdentifier:@"com.apple.UIFoundationHTMLReader"];
    [v2 setDefaultFontSize:12];
    [v2 setDefaultFixedFontSize:12];
    [v2 setUserStyleSheetEnabled:0];
    [v2 setJavaEnabled:0];
    [v2 setJavaScriptEnabled:0];
    [v2 setJavaScriptCanOpenWindowsAutomatically:0];
    [v2 setPlugInsEnabled:0];
    [v2 setAllowsAnimatedImages:1];
    [v2 setAllowsAnimatedImageLooping:1];
    [v2 setLoadsImagesAutomatically:1];
    [v2 setAutosaves:0];
    [v2 setUsesPageCache:0];
    [v2 setCacheModel:0];
    _webPreferences__webPreferences = (uint64_t)v2;
  }
  return v2;
}

+ (id)defaultParagraphStyle
{
  id result = (id)defaultParagraphStyle_defaultParagraphStyle_0;
  if (!defaultParagraphStyle_defaultParagraphStyle_0)
  {
    defaultParagraphStyle_defaultParagraphStyle_0 = [+[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [(id)defaultParagraphStyle_defaultParagraphStyle_0 setDefaultTabInterval:36.0];
    objc_msgSend((id)defaultParagraphStyle_defaultParagraphStyle_0, "setTabStops:", objc_msgSend(MEMORY[0x1E4F1C978], "array"));
    return (id)defaultParagraphStyle_defaultParagraphStyle_0;
  }
  return result;
}

+ (BOOL)_usesLibXML2ForOptions:(id)a3
{
  return 0;
}

+ (BOOL)allowsAttributedStringAgentForOptions:(id)a3
{
  if (allowsAttributedStringAgentForOptions__onceToken != -1) {
    dispatch_once(&allowsAttributedStringAgentForOptions__onceToken, &__block_literal_global_82);
  }
  return allowsAttributedStringAgentForOptions__triesAgent
      && ([a1 _usesLibXML2ForOptions:a3] & 1) == 0
      && ![a3 objectForKeyedSubscript:NSWebPreferencesDocumentOption]
      && ![a3 objectForKeyedSubscript:NSWebResourceLoadDelegateDocumentOption]
      && ![a3 objectForKeyedSubscript:__NSHTMLReaderDelegateDocumentOption]
      && [a3 objectForKeyedSubscript:@"WebPolicyDelegate"] == 0;
}

void *__54__NSHTMLReader_allowsAttributedStringAgentForOptions___block_invoke()
{
  id result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"_NSAttributedStringForcesAttributedAgent");
  if (result)
  {
    id result = (void *)[result BOOLValue];
    allowsAttributedStringAgentForOptions__triesAgent = (char)result;
  }
  return result;
}

- (id)_childrenForNode:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [a3 firstChild];
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      [v4 addObject:v6];
      v6 = (void *)[v6 nextSibling];
    }
    while (v6);
  }
  return v4;
}

- (id)_computedStyleForElement:(id)a3
{
  uint64_t v5 = (void *)[a3 ownerDocument];
  if ((_computedStyleForElement__checkedSelector & 1) == 0)
  {
    Class v6 = objc_lookUpClass("DOMDocument");
    if (v6
      && [(objc_class *)v6 instancesRespondToSelector:sel_getComputedStyle_pseudoElement_])
    {
      _computedStyleForElement__useNewSelector = 1;
    }
    _computedStyleForElement__checkedSelector = 1;
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_computedStylesForElements objectForKey:a3];
  if (v7)
  {
    v8 = (void *)v7;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA98], "null"), "isEqual:", v7)) {
      return 0;
    }
    else {
      return v8;
    }
  }
  else
  {
    if (_computedStyleForElement__useNewSelector == 1) {
      uint64_t v10 = [v5 getComputedStyle:a3 pseudoElement:&stru_1EDD49F70];
    }
    else {
      uint64_t v10 = [v5 getComputedStyle:a3 :&stru_1EDD49F70];
    }
    v9 = (void *)v10;
    computedStylesForElements = self->_computedStylesForElements;
    uint64_t v12 = v10;
    if (!v10) {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    }
    [(NSMutableDictionary *)computedStylesForElements setObject:v12 forKey:a3];
  }
  return v9;
}

- (id)_specifiedStyleForElement:(id)a3
{
  uint64_t v5 = -[NSMutableDictionary objectForKey:](self->_specifiedStylesForElements, "objectForKey:");
  if (v5)
  {
    Class v6 = (void *)v5;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA98], "null"), "isEqual:", v5)) {
      return 0;
    }
  }
  else
  {
    Class v6 = (void *)[a3 style];
    specifiedStylesForElements = self->_specifiedStylesForElements;
    uint64_t v8 = (uint64_t)v6;
    if (!v6) {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
    }
    [(NSMutableDictionary *)specifiedStylesForElements setObject:v8 forKey:a3];
  }
  return v6;
}

- (id)_computedStringForNode:(id)a3 property:(id)a4
{
  if (a3 && [a3 nodeType] == 1)
  {
    id v7 = [(NSHTMLReader *)self _computedStyleForElement:a3];
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = (void *)[v7 getPropertyCSSValue:a4];
      if (v9)
      {
        uint64_t v10 = v9;
        int v11 = [v9 cssValueType];
        if (v11 == 2)
        {
          uint64_t v16 = [v8 getPropertyValue:a4];
          goto LABEL_13;
        }
        if (v11 == 1)
        {
          int v12 = [v10 primitiveType];
          if ((v12 - 19) <= 3)
          {
            v13 = (__CFString *)[v10 getStringValue];
            if (v13)
            {
              v14 = v13;
              if ([(__CFString *)v13 length]) {
                goto LABEL_14;
              }
            }
            goto LABEL_17;
          }
          if (v12 == 2)
          {
            [v10 getFloatValue:2];
            uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%g%%", v18);
LABEL_13:
            v14 = (__CFString *)v16;
            if (v16) {
              goto LABEL_14;
            }
          }
        }
      }
    }
LABEL_17:
    id v19 = [(NSHTMLReader *)self _specifiedStyleForElement:a3];
    if (!v19) {
      goto LABEL_27;
    }
    v20 = v19;
    v21 = (void *)[v19 getPropertyCSSValue:a4];
    if (!v21) {
      goto LABEL_27;
    }
    v22 = v21;
    int v23 = [v21 cssValueType];
    if (!v23)
    {
      int v17 = 1;
      goto LABEL_28;
    }
    if (v23 == 2)
    {
LABEL_25:
      v14 = (__CFString *)[v20 getPropertyValue:a4];
      int v17 = 0;
      if (v14) {
        goto LABEL_123;
      }
LABEL_28:
      if ([@"display" isEqualToString:a4])
      {
        uint64_t v25 = [a3 tagName];
        if (([@"HEAD" isEqualToString:v25] & 1) != 0
          || ([@"SCRIPT" isEqualToString:v25] & 1) != 0
          || ([@"APPLET" isEqualToString:v25] & 1) != 0
          || ([@"NOFRAMES" isEqualToString:v25] & 1) != 0)
        {
          v14 = @"none";
          goto LABEL_123;
        }
        if (([@"ADDRESS" isEqualToString:v25] & 1) != 0
          || ([@"BLOCKQUOTE" isEqualToString:v25] & 1) != 0
          || ([@"BODY" isEqualToString:v25] & 1) != 0
          || ([@"CENTER" isEqualToString:v25] & 1) != 0
          || ([@"DD" isEqualToString:v25] & 1) != 0
          || ([@"DIR" isEqualToString:v25] & 1) != 0
          || ([@"DIV" isEqualToString:v25] & 1) != 0
          || ([@"DL" isEqualToString:v25] & 1) != 0
          || ([@"DT" isEqualToString:v25] & 1) != 0
          || ([@"FIELDSET" isEqualToString:v25] & 1) != 0
          || ([@"FORM" isEqualToString:v25] & 1) != 0
          || ([@"FRAME" isEqualToString:v25] & 1) != 0
          || ([@"FRAMESET" isEqualToString:v25] & 1) != 0
          || ([@"HR" isEqualToString:v25] & 1) != 0
          || ([@"HTML" isEqualToString:v25] & 1) != 0
          || ([@"H1" isEqualToString:v25] & 1) != 0
          || ([@"H2" isEqualToString:v25] & 1) != 0
          || ([@"H3" isEqualToString:v25] & 1) != 0
          || ([@"H4" isEqualToString:v25] & 1) != 0
          || ([@"H5" isEqualToString:v25] & 1) != 0
          || ([@"H6" isEqualToString:v25] & 1) != 0
          || ([@"IFRAME" isEqualToString:v25] & 1) != 0
          || ([@"MENU" isEqualToString:v25] & 1) != 0
          || ([@"NOSCRIPT" isEqualToString:v25] & 1) != 0
          || ([@"OL" isEqualToString:v25] & 1) != 0
          || ([@"P" isEqualToString:v25] & 1) != 0
          || ([@"PRE" isEqualToString:v25] & 1) != 0
          || ([@"UL" isEqualToString:v25] & 1) != 0)
        {
          v14 = @"block";
          goto LABEL_123;
        }
        if ([@"LI" isEqualToString:v25])
        {
          v14 = @"list-item";
          goto LABEL_123;
        }
        if ([@"TABLE" isEqualToString:v25])
        {
          v14 = @"table";
          goto LABEL_123;
        }
        if ([@"TR" isEqualToString:v25])
        {
          v14 = @"table-row";
          goto LABEL_123;
        }
        if (([@"TH" isEqualToString:v25] & 1) != 0
          || ([@"TD" isEqualToString:v25] & 1) != 0)
        {
          v14 = @"table-cell";
          goto LABEL_123;
        }
        if ([@"THEAD" isEqualToString:v25])
        {
          v14 = @"table-header-group";
          goto LABEL_123;
        }
        if ([@"TBODY" isEqualToString:v25])
        {
          v14 = @"table-row-group";
          goto LABEL_123;
        }
        if ([@"TFOOT" isEqualToString:v25])
        {
          v14 = @"table-footer-group";
          goto LABEL_123;
        }
        if ([@"COL" isEqualToString:v25])
        {
          v14 = @"table-column";
          goto LABEL_123;
        }
        if ([@"COLGROUP" isEqualToString:v25])
        {
          v14 = @"table-column-group";
          goto LABEL_123;
        }
        int v36 = [@"CAPTION" isEqualToString:v25];
        v28 = @"table-caption";
        BOOL v27 = v36 == 0;
        goto LABEL_38;
      }
      if ([@"white-space" isEqualToString:a4])
      {
        int v26 = objc_msgSend(@"PRE", "isEqualToString:", objc_msgSend(a3, "tagName"));
        BOOL v27 = v26 == 0;
        if (!v26) {
          int v17 = 1;
        }
        v28 = @"pre";
LABEL_38:
        if (v27) {
          v14 = 0;
        }
        else {
          v14 = v28;
        }
        goto LABEL_123;
      }
      if ([@"font-style" isEqualToString:a4])
      {
        uint64_t v29 = [a3 tagName];
        if (([@"I" isEqualToString:v29] & 1) != 0
          || ([@"CITE" isEqualToString:v29] & 1) != 0
          || ([@"EM" isEqualToString:v29] & 1) != 0)
        {
          v14 = @"italic";
          goto LABEL_123;
        }
        v14 = @"italic";
        if (([@"VAR" isEqualToString:v29] & 1) == 0)
        {
          v30 = @"ADDRESS";
          goto LABEL_90;
        }
        goto LABEL_123;
      }
      if ([@"font-weight" isEqualToString:a4])
      {
        uint64_t v29 = [a3 tagName];
        if ([@"B" isEqualToString:v29])
        {
          v14 = @"bolder";
          goto LABEL_123;
        }
        v14 = @"bolder";
        if ([@"STRONG" isEqualToString:v29]) {
          goto LABEL_123;
        }
        goto LABEL_84;
      }
      if ([@"text-decoration" isEqualToString:a4])
      {
        uint64_t v29 = [a3 tagName];
        if (([@"U" isEqualToString:v29] & 1) != 0
          || ([@"INS" isEqualToString:v29] & 1) != 0)
        {
          v14 = @"underline";
          goto LABEL_123;
        }
        if ([@"S" isEqualToString:v29])
        {
          v14 = @"line-through";
          goto LABEL_123;
        }
        v14 = @"line-through";
        if (([@"STRIKE" isEqualToString:v29] & 1) == 0)
        {
          v30 = @"DEL";
LABEL_90:
          if (![(__CFString *)v30 isEqualToString:v29])
          {
            int v17 = 1;
            v14 = 0;
          }
        }
LABEL_123:
        BOOL v15 = v17 == 0;
        if (v14) {
          goto LABEL_127;
        }
        goto LABEL_124;
      }
      if ([@"text-align" isEqualToString:a4])
      {
        uint64_t v29 = [a3 tagName];
        if ([@"CENTER" isEqualToString:v29])
        {
          v14 = @"center";
          goto LABEL_123;
        }
        v14 = @"center";
        if ([@"CAPTION" isEqualToString:v29]) {
          goto LABEL_123;
        }
LABEL_84:
        v30 = @"TH";
        goto LABEL_90;
      }
      if ([@"vertical-align" isEqualToString:a4])
      {
        uint64_t v31 = [a3 tagName];
        if ([@"SUP" isEqualToString:v31])
        {
          v14 = @"super";
          goto LABEL_123;
        }
        if ([@"SUB" isEqualToString:v31])
        {
          v14 = @"sub";
          goto LABEL_123;
        }
        if (([@"THEAD" isEqualToString:v31] & 1) != 0
          || ([@"TBODY" isEqualToString:v31] & 1) != 0
          || ([@"TFOOT" isEqualToString:v31] & 1) != 0)
        {
          v14 = @"middle";
          goto LABEL_123;
        }
        if (([@"TR" isEqualToString:v31] & 1) != 0
          || ([@"TH" isEqualToString:v31] & 1) != 0)
        {
          goto LABEL_122;
        }
        v32 = @"TD";
        id v33 = (id)v31;
      }
      else
      {
        if (([@"font-family" isEqualToString:a4] & 1) != 0
          || ([@"font-variant" isEqualToString:a4] & 1) != 0
          || ([@"font-effect" isEqualToString:a4] & 1) != 0
          || ([@"text-transform" isEqualToString:a4] & 1) != 0
          || ([@"text-shadow" isEqualToString:a4] & 1) != 0
          || ([@"visibility" isEqualToString:a4] & 1) != 0
          || ([@"border-collapse" isEqualToString:a4] & 1) != 0
          || ([@"empty-cells" isEqualToString:a4] & 1) != 0
          || ([@"word-spacing" isEqualToString:a4] & 1) != 0
          || ([@"list-style-type" isEqualToString:a4] & 1) != 0)
        {
          goto LABEL_122;
        }
        v32 = @"direction";
        id v33 = a4;
      }
      if (![(__CFString *)v32 isEqualToString:v33])
      {
        v14 = 0;
        goto LABEL_123;
      }
LABEL_122:
      v14 = 0;
      int v17 = 1;
      goto LABEL_123;
    }
    if (v23 != 1 || [v22 primitiveType] - 19 > 3)
    {
LABEL_27:
      int v17 = 0;
      goto LABEL_28;
    }
    v24 = (__CFString *)[v22 getStringValue];
    if (!v24) {
      goto LABEL_25;
    }
    v14 = v24;
    if (![(__CFString *)v24 length]) {
      goto LABEL_25;
    }
LABEL_14:
    int v17 = 0;
    goto LABEL_123;
  }
  BOOL v15 = 0;
  v14 = 0;
LABEL_124:
  if (!v15)
  {
    uint64_t v34 = [a3 parentNode];
    if (!v34) {
      return 0;
    }
    v14 = [(NSHTMLReader *)self _stringForNode:v34 property:a4];
  }
LABEL_127:
  if (!v14) {
    return 0;
  }

  return (id)[(__CFString *)v14 lowercaseString];
}

- (id)_stringForNode:(id)a3 property:(id)a4
{
  id v7 = (id)-[NSMutableDictionary objectForKey:](self->_stringsForNodes, "objectForKey:");
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_stringsForNodes setObject:v7 forKey:a3];
  }
  uint64_t v8 = [v7 objectForKey:a4];
  if (v8)
  {
    v9 = (void *)v8;
    if ([&stru_1EDD49F70 isEqualToString:v8]) {
      return 0;
    }
    else {
      return v9;
    }
  }
  else
  {
    int v11 = [(NSHTMLReader *)self _computedStringForNode:a3 property:a4];
    uint64_t v10 = v11;
    if (v11) {
      int v12 = v11;
    }
    else {
      int v12 = &stru_1EDD49F70;
    }
    [v7 setObject:v12 forKey:a4];
  }
  return v10;
}

- (BOOL)_getComputedFloat:(double *)a3 forNode:(id)a4 property:(id)a5
{
  double v29 = 0.0;
  if (a4 && [a4 nodeType] == 1)
  {
    id v9 = [(NSHTMLReader *)self _computedStyleForElement:a4];
    if (v9)
    {
      uint64_t v10 = (void *)[v9 getPropertyCSSValue:a5];
      if (v10)
      {
        int v11 = v10;
        if ([v10 cssValueType] == 1)
        {
          switch([v11 primitiveType])
          {
            case 5u:
LABEL_13:
              [v11 getFloatValue:5];
              double v18 = v17;
              break;
            case 6u:
LABEL_23:
              [v11 getFloatValue:6];
              double v20 = v19 * 96.0;
              double v21 = 2.54;
              goto LABEL_27;
            case 7u:
LABEL_24:
              [v11 getFloatValue:7];
              double v20 = v22 * 96.0;
              double v21 = 25.4;
              goto LABEL_27;
            case 8u:
LABEL_25:
              [v11 getFloatValue:8];
              double v24 = v23;
              double v25 = 96.0;
              goto LABEL_29;
            case 9u:
LABEL_26:
              [v11 getFloatValue:9];
              double v20 = v26 * 4.0;
              double v21 = 3.0;
LABEL_27:
              double v18 = v20 / v21;
              break;
            case 0xAu:
LABEL_28:
              [v11 getFloatValue:10];
              double v24 = v27;
              double v25 = 16.0;
LABEL_29:
              double v18 = v24 * v25;
              break;
            default:
              goto LABEL_8;
          }
          LODWORD(v11) = 0;
          double v29 = v18;
          LODWORD(v12) = 1;
LABEL_31:
          BOOL v13 = v11 == 0;
          if (v12) {
            goto LABEL_35;
          }
          goto LABEL_32;
        }
      }
    }
LABEL_8:
    id v14 = [(NSHTMLReader *)self _specifiedStyleForElement:a4];
    if (v14)
    {
      BOOL v15 = (void *)[v14 getPropertyCSSValue:a5];
      int v11 = v15;
      if (!v15)
      {
LABEL_15:
        if (([@"text-indent" isEqualToString:a5] & 1) != 0
          || ([@"letter-spacing" isEqualToString:a5] & 1) != 0
          || ([@"word-spacing" isEqualToString:a5] & 1) != 0
          || ([@"line-height" isEqualToString:a5] & 1) != 0
          || ([@"widows" isEqualToString:a5] & 1) != 0
          || (LODWORD(v12) = [@"orphans" isEqualToString:a5], v12))
        {
          LODWORD(v12) = 0;
          LODWORD(v11) = 1;
        }
        goto LABEL_31;
      }
      int v16 = [v15 cssValueType];
      if (!v16)
      {
        LODWORD(v11) = 1;
        goto LABEL_15;
      }
      if (v16 == 1)
      {
        switch([v11 primitiveType])
        {
          case 5u:
            goto LABEL_13;
          case 6u:
            goto LABEL_23;
          case 7u:
            goto LABEL_24;
          case 8u:
            goto LABEL_25;
          case 9u:
            goto LABEL_26;
          case 0xAu:
            goto LABEL_28;
          default:
            break;
        }
      }
    }
    LODWORD(v11) = 0;
    goto LABEL_15;
  }
  LODWORD(v12) = 0;
  BOOL v13 = 0;
LABEL_32:
  if (!v13)
  {
    uint64_t v12 = [a4 parentNode];
    if (!v12) {
      return v12;
    }
    LODWORD(v12) = [(NSHTMLReader *)self _getFloat:&v29 forNode:v12 property:a5];
  }
LABEL_35:
  if (a3 && v12) {
    *a3 = v29;
  }
  return v12;
}

- (BOOL)_getFloat:(double *)a3 forNode:(id)a4 property:(id)a5
{
  double v16 = 0.0;
  id v9 = (id)[(NSMutableDictionary *)self->_floatsForNodes objectForKey:a4];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_floatsForNodes setObject:v9 forKey:a4];
  }
  uint64_t v10 = [v9 objectForKey:a5];
  if (v10)
  {
    int v11 = (void *)v10;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA98], "null"), "isEqual:", v10))
    {
      LOBYTE(v12) = 0;
      return v12;
    }
    [v11 doubleValue];
    double v16 = v14;
    BOOL v12 = 1;
    if (!a3) {
      return v12;
    }
    goto LABEL_12;
  }
  BOOL v12 = [(NSHTMLReader *)self _getComputedFloat:&v16 forNode:a4 property:a5];
  if (v12) {
    uint64_t v13 = [NSNumber numberWithDouble:v16];
  }
  else {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  [v9 setObject:v13 forKey:a5];
  if (a3)
  {
LABEL_12:
    if (v12)
    {
      *a3 = v16;
      LOBYTE(v12) = 1;
    }
  }
  return v12;
}

- (BOOL)_elementIsBlockLevel:(id)a3
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_elementIsBlockLevel, "objectForKey:");
  if (!v5)
  {
    uint64_t v7 = [(NSHTMLReader *)self _stringForNode:a3 property:@"display"];
    id v8 = [(NSHTMLReader *)self _stringForNode:a3 property:@"float"];
    if (!v8
      || (id v9 = v8, ([@"left" isEqualToString:v8] & 1) == 0)
      && ([@"right" isEqualToString:v9] & 1) == 0)
    {
      if (!v7)
      {
LABEL_12:
        -[NSMutableDictionary setObject:forKey:](self->_elementIsBlockLevel, "setObject:forKey:", [NSNumber numberWithBool:v7], a3);
        return v7;
      }
      if (([@"block" isEqualToString:v7] & 1) == 0
        && ([@"list-item" isEqualToString:v7] & 1) == 0)
      {
        uint64_t v7 = [(id)v7 hasPrefix:@"table"];
        goto LABEL_12;
      }
    }
    uint64_t v7 = 1;
    goto LABEL_12;
  }

  return [v5 BOOLValue];
}

- (BOOL)_elementHasOwnBackgroundColor:(id)a3
{
  int v5 = -[NSHTMLReader _elementIsBlockLevel:](self, "_elementIsBlockLevel:");
  if (v5)
  {
    uint64_t v6 = [a3 tagName];
    id v7 = [(NSHTMLReader *)self _stringForNode:a3 property:@"display"];
    if (([@"HTML" isEqualToString:v6] & 1) != 0
      || ([@"BODY" isEqualToString:v6] & 1) != 0
      || (int v5 = [v7 hasPrefix:@"table"]) != 0)
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)_computedColorForNode:(id)a3 property:(id)a4
{
  char v7 = [@"color" isEqualToString:a4];
  int v8 = [@"background-color" isEqualToString:a4];
  if (a3 && [a3 nodeType] == 1)
  {
    id v9 = [(NSHTMLReader *)self _computedStyleForElement:a3];
    if (v9)
    {
      uint64_t v10 = (void *)[v9 getPropertyCSSValue:a4];
      if (v10)
      {
        int v11 = v10;
        if ([v10 cssValueType] == 1
          && [v11 primitiveType] == 25)
        {
          goto LABEL_12;
        }
      }
    }
    id v12 = [(NSHTMLReader *)self _specifiedStyleForElement:a3];
    if (v12)
    {
      uint64_t v13 = (void *)[v12 getPropertyCSSValue:a4];
      int v11 = v13;
      if (!v13) {
        goto LABEL_16;
      }
      int v14 = [v13 cssValueType];
      if (!v14)
      {
        LODWORD(v11) = 1;
        if (v7) {
          goto LABEL_21;
        }
        goto LABEL_17;
      }
      if (v14 == 1 && [v11 primitiveType] == 25)
      {
LABEL_12:
        BOOL v15 = (void *)[v11 getRGBColorValue];
        id result = (id)objc_msgSend((Class)getUIColorClass_0[0](), "colorWithCGColor:", objc_msgSend(v15, "color"));
        LODWORD(v11) = 0;
        if (result) {
          goto LABEL_22;
        }
LABEL_17:
        if (!v8 || [(NSHTMLReader *)self _elementHasOwnBackgroundColor:a3])
        {
          id result = 0;
          goto LABEL_22;
        }
LABEL_21:
        id result = 0;
        LODWORD(v11) = 1;
LABEL_22:
        BOOL v17 = v11 == 0;
        if (result) {
          return result;
        }
        goto LABEL_23;
      }
    }
    LODWORD(v11) = 0;
LABEL_16:
    if (v7) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  id result = 0;
  BOOL v17 = 0;
LABEL_23:
  if (!v17)
  {
    id result = (id)[a3 parentNode];
    if (result)
    {
      id v18 = result;
      if (v8
        && [result nodeType] == 1
        && [(NSHTMLReader *)self _elementHasOwnBackgroundColor:v18])
      {
        return 0;
      }
      else
      {
        return [(NSHTMLReader *)self _colorForNode:v18 property:a4];
      }
    }
  }
  return result;
}

- (id)_colorForNode:(id)a3 property:(id)a4
{
  id v7 = (id)-[NSMutableDictionary objectForKey:](self->_colorsForNodes, "objectForKey:");
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_colorsForNodes setObject:v7 forKey:a3];
  }
  id v8 = (id)[v7 objectForKey:a4];
  if (!v8)
  {
    id v8 = [(NSHTMLReader *)self _computedColorForNode:a3 property:a4];
    uint64_t v9 = (uint64_t)v8;
    if (!v8) {
      uint64_t v9 = [(Class)getNSColorClass_4[0]() clearColor];
    }
    [v7 setObject:v9 forKey:a4];
  }
  if (objc_msgSend((id)objc_msgSend((Class)getNSColorClass_4[0](), "clearColor"), "isEqual:", v8)) {
    return 0;
  }
  [v8 alphaComponent];
  if (v10 == 0.0) {
    return 0;
  }
  return v8;
}

- (id)_computedAttributesForElement:(id)a3
{
  v142[16] = *(double *)MEMORY[0x1E4F143B8];
  id v5 = -[NSHTMLReader _blockLevelElementForNode:](self, "_blockLevelElementForNode:");
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v128 = [(NSHTMLReader *)self _stringForNode:a3 property:@"font-effect"];
  id v7 = [(NSHTMLReader *)self _stringForNode:a3 property:@"text-decoration"];
  id v8 = [(NSHTMLReader *)self _stringForNode:a3 property:@"vertical-align"];
  id v9 = [(NSHTMLReader *)self _stringForNode:a3 property:@"text-shadow"];
  id v127 = [(NSHTMLReader *)self _stringForNode:a3 property:@"font-variant-ligatures"];
  *(void *)&long long v126 = [(NSHTMLReader *)self _stringForNode:a3 property:@"font-kerning"];
  id v10 = [(NSHTMLReader *)self _stringForNode:a3 property:@"letter-spacing"];
  double v136 = 0.0;
  double v137 = 0.0;
  double v135 = 0.0;
  id v124 = [(NSHTMLReader *)self _colorForNode:a3 property:@"color"];
  id v129 = [(NSHTMLReader *)self _colorForNode:a3 property:@"background-color"];
  id v125 = [(NSHTMLReader *)self _colorForNode:a3 property:@"-webkit-text-stroke-color"];
  int v11 = (void *)[a3 _font];
  if (![(NSHTMLReader *)self _getFloat:&v137 forNode:a3 property:@"font-size"]
    || (double defaultFontSize = v137, v137 <= 0.0))
  {
    double defaultFontSize = self->_defaultFontSize;
  }
  double v13 = self->_textSizeMultiplier * defaultFontSize;
  double v137 = v13;
  double minimumFontSize = self->_minimumFontSize;
  if (v13 < minimumFontSize)
  {
    double v137 = self->_minimumFontSize;
    double v13 = minimumFontSize;
  }
  double v15 = floor(v13 * 2.0 + 0.5) * 0.5;
  if (vabdd_f64(v15, v13) >= 0.05)
  {
    double v16 = floor(v13 * 10.0 + 0.5) / 10.0;
    if (vabdd_f64(v16, v13) < 0.005)
    {
      double v137 = v16;
      double v13 = v16;
    }
  }
  else
  {
    double v137 = v15;
    double v13 = v15;
  }
  *((void *)&v126 + 1) = v10;
  if (v13 <= 0.0)
  {
    double v137 = 12.0;
    double v13 = 12.0;
  }
  if (v11)
  {
    BOOL v17 = (NSFont *)[v11 fontWithSize:v13];
    if (v17) {
      goto LABEL_31;
    }
  }
  id v123 = v7;
  standardFontFamily = (NSString *)objc_msgSend(-[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, @"font-family", v13), "capitalizedString");
  id v19 = [(NSHTMLReader *)self _stringForNode:a3 property:@"font-style"];
  id v122 = [(NSHTMLReader *)self _stringForNode:a3 property:@"font-weight"];
  if (!standardFontFamily)
  {
    standardFontFamily = self->_standardFontFamily;
    if (!standardFontFamily)
    {
LABEL_19:
      BOOL v17 = +[NSFont fontWithName:@"Times" size:v137];
      goto LABEL_22;
    }
  }
  double v20 = v137;
  fontCache = self->_fontCache;
  double v21 = (void *)[(NSMutableDictionary *)fontCache objectForKey:standardFontFamily];
  if (v21)
  {
    BOOL v17 = (NSFont *)[v21 fontWithSize:v20];
    goto LABEL_18;
  }
  id v117 = v19;
  id v118 = v8;
  id v119 = v5;
  v120 = v6;
  BOOL v17 = +[UIFont fontWithName:standardFontFamily size:v20];
  if (!v17)
  {
    v52 = +[UIFont familyNames];
    unint64_t v53 = [(NSString *)standardFontFamily rangeOfString:@" " options:4];
    uint64_t v55 = v54;
    unint64_t v56 = [(NSString *)standardFontFamily rangeOfString:@"-" options:4];
    if (v55 && v57)
    {
      if (v53 <= v56) {
        uint64_t v58 = v57;
      }
      else {
        uint64_t v58 = v55;
      }
      if (v53 <= v56) {
        unint64_t v53 = v56;
      }
    }
    else
    {
      if (v55) {
        uint64_t v58 = v55;
      }
      else {
        uint64_t v58 = v57;
      }
      if (!v55) {
        unint64_t v53 = v56;
      }
      if (!v58) {
        goto LABEL_129;
      }
    }
    v59 = [(NSString *)standardFontFamily substringToIndex:v53];
    if (![(NSArray *)v52 containsObject:v59])
    {
      do
      {
        unint64_t v53 = [(NSString *)v59 rangeOfString:@" " options:4];
        uint64_t v61 = v60;
        unint64_t v62 = [(NSString *)v59 rangeOfString:@"-" options:4];
        if (v61) {
          BOOL v64 = v63 == 0;
        }
        else {
          BOOL v64 = 1;
        }
        if (v64)
        {
          if (v61) {
            uint64_t v58 = v61;
          }
          else {
            uint64_t v58 = v63;
          }
          if (!v61) {
            unint64_t v53 = v62;
          }
          if (!v58) {
            goto LABEL_129;
          }
        }
        else
        {
          if (v53 <= v62) {
            uint64_t v58 = v63;
          }
          else {
            uint64_t v58 = v61;
          }
          if (v53 <= v62) {
            unint64_t v53 = v62;
          }
        }
        v59 = [(NSString *)standardFontFamily substringToIndex:v53];
      }
      while (![(NSArray *)v52 containsObject:v59]);
    }
    uint64_t v65 = [(NSString *)standardFontFamily substringFromIndex:v58 + v53];
    v66 = +[UIFont fontNamesForFamilyName:v59];
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    uint64_t v67 = [(NSArray *)v66 countByEnumeratingWithState:&v138 objects:v142 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v139;
      id v116 = v9;
LABEL_119:
      uint64_t v70 = 0;
      while (1)
      {
        if (*(void *)v139 != v69) {
          objc_enumerationMutation(v66);
        }
        v71 = *(void **)(*((void *)&v138 + 1) + 8 * v70);
        if (![v71 compare:v65 options:1]) {
          break;
        }
        if (v68 == ++v70)
        {
          uint64_t v68 = [(NSArray *)v66 countByEnumeratingWithState:&v138 objects:v142 count:16];
          id v9 = v116;
          if (v68) {
            goto LABEL_119;
          }
          goto LABEL_127;
        }
      }
      BOOL v17 = +[UIFont fontWithName:v71 size:v20];
      id v9 = v116;
      if (v17) {
        goto LABEL_21;
      }
    }
LABEL_127:
    if ([(NSArray *)v66 count])
    {
      BOOL v17 = +[UIFont fontWithName:v59 size:v20];
      if (v17) {
        goto LABEL_21;
      }
    }
LABEL_129:
    BOOL v17 = +[UIFont systemFontOfSize:v20];
    id v5 = v119;
    uint64_t v6 = v120;
    id v19 = v117;
    id v8 = v118;
LABEL_18:
    [(NSMutableDictionary *)fontCache setObject:v17 forKey:standardFontFamily];
    if (v17) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
LABEL_21:
  [(NSMutableDictionary *)fontCache setObject:v17 forKey:standardFontFamily];
  id v5 = v119;
  uint64_t v6 = v120;
  id v19 = v117;
  id v8 = v118;
LABEL_22:
  if (([@"italic" isEqualToString:v19] & 1) != 0
    || [@"oblique" isEqualToString:v19])
  {
    uint64_t v22 = [(UIFont *)v17 familyName];
    [(UIFont *)v17 pointSize];
    float v23 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v22, 1);
    if (v23) {
      BOOL v17 = (NSFont *)v23;
    }
  }
  id v7 = v123;
  if (([v122 hasPrefix:@"bold"] & 1) != 0 || objc_msgSend(v122, "integerValue") >= 700)
  {
    uint64_t v24 = [(UIFont *)v17 familyName];
    [(UIFont *)v17 pointSize];
    double v25 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v24, 2);
    if (v25) {
      BOOL v17 = (NSFont *)v25;
    }
  }
  if (v17) {
LABEL_31:
  }
    [v6 setObject:v17 forKey:@"NSFont"];
  if (v124) {
    [v6 setObject:v124 forKey:@"NSColor"];
  }
  if (v129 && ![(NSHTMLReader *)self _elementHasOwnBackgroundColor:a3]) {
    [v6 setObject:v129 forKey:@"NSBackgroundColor"];
  }
  if ([(NSHTMLReader *)self _getFloat:&v135 forNode:a3 property:@"-webkit-text-stroke-width"])
  {
    double v26 = v135;
    [(UIFont *)v17 pointSize];
    *(float *)&double v27 = v26 / (v27 * 0.01);
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&v27), @"NSStrokeWidth");
  }
  if (v125) {
    [v6 setObject:v125 forKey:@"NSStrokeColor"];
  }
  if (v128)
  {
    if ([v128 rangeOfString:@"outline"] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", 3.0), @"NSStrokeWidth");
    }
    if ([v128 rangeOfString:@"emboss"] != 0x7FFFFFFFFFFFFFFFLL) {
      [v6 setObject:objc_alloc_init(NSShadow) forKey:@"NSShadow"];
    }
  }
  if (v126 != 0)
  {
    if ([v128 rangeOfString:@"none"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v29 = &unk_1EDD68D90;
LABEL_54:
      [v6 setObject:v29 forKey:@"NSKern"];
      goto LABEL_55;
    }
    if (*((void *)&v126 + 1)) {
      [*((id *)&v126 + 1) doubleValue];
    }
    else {
      double v28 = 0.0;
    }
    if (fabs(v28) >= 2.22044605e-16)
    {
      double v29 = objc_msgSend(NSNumber, "numberWithDouble:");
      goto LABEL_54;
    }
  }
LABEL_55:
  if (v127 && [v128 rangeOfString:@"normal"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v128 rangeOfString:@"common-ligatures"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = &unk_1EDD68D48;
      goto LABEL_61;
    }
    if ([v128 rangeOfString:@"no-common-ligatures"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = &unk_1EDD68D60;
LABEL_61:
      [v6 setObject:v30 forKey:@"NSLigature"];
    }
  }
  if (v7 && (unint64_t)[v7 length] >= 5)
  {
    if ([v7 rangeOfString:@"underline"] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", 1), @"NSUnderline");
    }
    if ([v7 rangeOfString:@"line-through"] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", 1), @"NSStrikethrough");
    }
  }
  if (v8)
  {
    if ([v8 rangeOfString:@"super"] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", 1), @"NSSuperScript");
    }
    if ([v8 rangeOfString:@"sub"] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -1), @"NSSuperScript");
    }
  }
  if ([(NSHTMLReader *)self _getFloat:&v136 forNode:a3 property:@"vertical-align"])
  {
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v136), @"NSBaselineOffset");
  }
  if (v9)
  {
    if ((unint64_t)[v9 length] >= 5)
    {
      unint64_t v130 = [v9 length];
      uint64_t v33 = objc_msgSend(v9, "rangeOfString:", @"(");
      uint64_t v35 = v34;
      unint64_t v36 = [v9 rangeOfString:@""]);
      uint64_t v38 = v37;
      uint64_t v39 = objc_msgSend(v9, "rangeOfString:", @"rgba(");
      if (v35)
      {
        if (v38)
        {
          uint64_t v31 = v33 + v35;
          unint64_t v32 = v36 - (v33 + v35);
          if (v36 > v33 + v35)
          {
            uint64_t v40 = v39;
            v41 = objc_msgSend((id)objc_msgSend(v9, "substringWithRange:", v31, v32), "componentsSeparatedByString:", @",");
            if ((unint64_t)[v41 count] >= 3)
            {
              v42 = v9;
              objc_msgSend((id)objc_msgSend(v41, "objectAtIndex:", 0), "floatValue");
              double v44 = v43 / 255.0;
              objc_msgSend((id)objc_msgSend(v41, "objectAtIndex:", 1), "floatValue");
              double v46 = v45 / 255.0;
              objc_msgSend((id)objc_msgSend(v41, "objectAtIndex:", 2), "floatValue");
              double v48 = v47 / 255.0;
              double v49 = 1.0;
              if ((unint64_t)[v41 count] < 4)
              {
                v50 = v9;
              }
              else
              {
                v50 = v9;
                if (v40 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend((id)objc_msgSend(v41, "objectAtIndex:", 3), "floatValue");
                  double v49 = v51;
                }
              }
              uint64_t v72 = [(Class)getNSColorClass_4[0]() colorWithCalibratedRed:v44 green:v46 blue:v48 alpha:v49];
              uint64_t v73 = [v50 rangeOfString:@"px"];
              uint64_t v75 = v73;
              uint64_t v76 = v74;
              if (v74)
              {
                if (v130 > v73 + v74)
                {
                  uint64_t v77 = objc_msgSend(v42, "rangeOfString:options:range:", @"px", 0, v73 + v74, v130 - (v73 + v74));
LABEL_136:
                  if (v74)
                  {
                    if (v130 <= v77 + v74)
                    {
                      uint64_t v78 = 0;
                      uint64_t v79 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else
                    {
                      uint64_t v79 = objc_msgSend(v42, "rangeOfString:options:range:", @"px", 0, v77 + v74, v130 - (v77 + v74));
                    }
                    if (v75 && v76 && v78)
                    {
                      uint64_t v80 = objc_msgSend(v42, "rangeOfString:options:range:", @" ", 4, 0, v75);
                      uint64_t v82 = v81 ? v80 : 0;
                      objc_msgSend((id)objc_msgSend(v42, "substringWithRange:", v82 + v81, v75 - (v82 + v81)), "floatValue");
                      double v84 = v83;
                      uint64_t v85 = objc_msgSend(v42, "rangeOfString:options:range:", @" ", 4, 0, v77);
                      uint64_t v87 = v86 ? v85 : 0;
                      objc_msgSend((id)objc_msgSend(v42, "substringWithRange:", v87 + v86, v77 - (v87 + v86)), "floatValue");
                      double v89 = v88;
                      uint64_t v90 = objc_msgSend(v42, "rangeOfString:options:range:", @" ", 4, 0, v79);
                      uint64_t v92 = v91 ? v90 : 0;
                      objc_msgSend((id)objc_msgSend(v42, "substringWithRange:", v92 + v91, v79 - (v92 + v91)), "floatValue");
                      double v94 = v93;
                      v95 = objc_alloc_init(NSShadow);
                      [(NSShadow *)v95 setShadowColor:v72];
                      -[NSShadow setShadowOffset:](v95, "setShadowOffset:", v84, v89);
                      [(NSShadow *)v95 setShadowBlurRadius:v94];
                      if (v95) {
                        [v6 setObject:v95 forKey:@"NSShadow"];
                      }
                    }
                  }
                  goto LABEL_154;
                }
                uint64_t v74 = 0;
              }
              uint64_t v77 = 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_136;
            }
          }
        }
      }
    }
  }
LABEL_154:
  if (v5 != a3 && [(NSMutableArray *)self->_writingDirectionArray count]) {
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", self->_writingDirectionArray), @"NSWritingDirection");
  }
  if (v5)
  {
    v96 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "defaultParagraphStyle"), "mutableCopy");
    v97 = (void *)[v5 tagName];
    if (([@"P" isEqualToString:v97] & 1) != 0
      || ([@"LI" isEqualToString:v97] & 1) != 0)
    {
      BOOL v98 = 1;
    }
    else
    {
      if (![v97 hasPrefix:@"H"])
      {
        BOOL v131 = 0;
LABEL_162:
        int v99 = [@"BLOCKQUOTE" isEqualToString:v97];
        id v100 = v5;
        id v101 = [(NSHTMLReader *)self _stringForNode:v5 property:@"text-align"];
        id v102 = [(NSHTMLReader *)self _stringForNode:v100 property:@"direction"];
        id v103 = v100;
        id v104 = [(NSHTMLReader *)self _stringForNode:v100 property:@"-webkit-hyphens"];
        v142[0] = 0.0;
        *(void *)&long long v138 = 0;
        double v133 = 0.0;
        double v134 = 0.0;
        double v132 = 0.0;
        if (!v101) {
          goto LABEL_175;
        }
        if ([v101 hasSuffix:@"left"])
        {
          uint64_t v105 = 0;
        }
        else if ([v101 hasSuffix:@"right"])
        {
          uint64_t v105 = 2;
        }
        else if ([v101 hasSuffix:@"center"])
        {
          uint64_t v105 = 1;
        }
        else
        {
          if (![v101 hasSuffix:@"justify"]) {
            goto LABEL_175;
          }
          uint64_t v105 = 3;
        }
        [v96 setAlignment:v105];
LABEL_175:
        if (v102)
        {
          if ([v102 isEqualToString:@"ltr"])
          {
            uint64_t v106 = 0;
LABEL_180:
            [v96 setBaseWritingDirection:v106];
            goto LABEL_181;
          }
          if ([v102 isEqualToString:@"rtl"])
          {
            uint64_t v106 = 1;
            goto LABEL_180;
          }
        }
LABEL_181:
        if (v104)
        {
          int v107 = [v104 isEqualToString:@"auto"];
          double v108 = 0.0;
          if (v107) {
            *(float *)&double v108 = 1.0;
          }
          [v96 setHyphenationFactor:v108];
        }
        if ([v97 hasPrefix:@"H"])
        {
          if ([v97 length] == 2)
          {
            unsigned int v109 = [v97 characterAtIndex:1];
            if (v109 - 49 <= 5) {
              [v96 setHeaderLevel:v109 - 48];
            }
          }
        }
        if (v99)
        {
          uint64_t v110 = [MEMORY[0x1E4F28F78] blockQuoteIntentWithIdentity:1 nestedInsideIntent:0];
          [v6 setObject:v110 forKey:*MEMORY[0x1E4F287E0]];
        }
        if (v131)
        {
          if ([(NSHTMLReader *)self _getFloat:v142 forNode:v103 property:@"margin-left"])
          {
            double v111 = v142[0];
            if (v142[0] > 0.0) {
              [v96 setHeadIndent:v142[0]];
            }
          }
          if ([(NSHTMLReader *)self _getFloat:&v133, v103, @"text-indent", v111 forNode property])
          {
            [v96 headIndent];
            [v96 setFirstLineHeadIndent:v112 + v133];
          }
          if ([(NSHTMLReader *)self _getFloat:&v138 forNode:v103 property:@"margin-right"])
          {
            double v113 = *(double *)&v138;
            if (*(double *)&v138 > 0.0) {
              [v96 setTailIndent:-*(double *)&v138];
            }
          }
          if ([(NSHTMLReader *)self _getFloat:&v134, v103, @"margin-bottom", v113 forNode property]&& v134 > 0.0)
          {
            [v96 setParagraphSpacing:v134];
          }
        }
        double webViewTextSizeMultiplier = self->_webViewTextSizeMultiplier;
        if (webViewTextSizeMultiplier > 0.0)
        {
          if ([(NSHTMLReader *)self _getFloat:&v132 forNode:a3 property:@"line-height"])
          {
            double webViewTextSizeMultiplier = v132;
            if (v132 > 0.0) {
              [v96 setMinimumLineHeight:v132 / self->_webViewTextSizeMultiplier];
            }
          }
        }
        if ([(NSMutableArray *)self->_textLists count]) {
          [v96 setTextLists:self->_textLists];
        }
        if ([(NSMutableArray *)self->_textBlocks count]) {
          [v96 setTextBlocks:self->_textBlocks];
        }
        [v6 setObject:v96 forKey:@"NSParagraphStyle"];

        return v6;
      }
      BOOL v98 = [v97 length] == 2;
    }
    BOOL v131 = v98;
    goto LABEL_162;
  }
  return v6;
}

- (id)_attributesForElement:(id)a3
{
  if (a3)
  {
    id v5 = (id)-[NSMutableDictionary objectForKey:](self->_attributesForElements, "objectForKey:");
    if (!v5)
    {
      id v5 = [(NSHTMLReader *)self _computedAttributesForElement:a3];
      [(NSMutableDictionary *)self->_attributesForElements setObject:v5 forKey:a3];
    }
    return v5;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1C9E8];
    return (id)[v7 dictionary];
  }
}

- (void)_newParagraphForElement:(id)a3 tag:(id)a4 allowEmpty:(BOOL)a5 suppressTrailingSpace:(BOOL)a6 isEntering:(BOOL)a7
{
  BOOL v8 = a6;
  unint64_t v13 = [(NSMutableAttributedString *)self->_attrStr length];
  if (v13)
  {
    int v14 = objc_msgSend((id)-[NSMutableAttributedString string](self->_attrStr, "string"), "characterAtIndex:", v13 - 1);
    if (!v8) {
      goto LABEL_9;
    }
  }
  else
  {
    int v14 = 10;
    if (!v8) {
      goto LABEL_9;
    }
  }
  if ((*(unsigned char *)&self->_flags & 1) == 0 || v14 != 8232 && v14 != 32)
  {
LABEL_9:
    uint64_t v15 = 0;
    if (!a5 && v14 == 10) {
      return;
    }
    goto LABEL_11;
  }
  --v13;
  uint64_t v15 = 1;
LABEL_11:
  double v16 = &stru_1EDD49F70;
  if (([@"BODY" isEqualToString:a4] & 1) == 0
    && ![@"HTML" isEqualToString:a4])
  {
    double v16 = @"\n";
  }
  [(NSMutableArray *)self->_writingDirectionArray removeAllObjects];
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v13, v15, v16);
  if (v13 < self->_domRangeStartIndex) {
    self->_domRangeStartIndex += [(__CFString *)v16 length] - v15;
  }
  uint64_t v17 = [(__CFString *)v16 length];
  $0C7FF0FC465E944347A24E3ECE87D1B8 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0 && !a7)
  {
    uint64_t v19 = v17;
    id v20 = [(NSHTMLReader *)self _attributesForElement:a3];
    $0C7FF0FC465E944347A24E3ECE87D1B8 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) == 0)
    {
      if (v19)
      {
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v20, v13, v19);
        $0C7FF0FC465E944347A24E3ECE87D1B8 flags = self->_flags;
      }
    }
  }
  self->_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&flags | 1);
}

- (void)_newLineForElement:(id)a3
{
  __int16 v11 = 8232;
  id v5 = (void *)[[NSString alloc] initWithCharacters:&v11 length:1];
  unint64_t v6 = [(NSMutableAttributedString *)self->_attrStr length];
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v6, 0, v5);
  uint64_t v7 = [v5 length];
  uint64_t v8 = v7;
  unint64_t domRangeStartIndex = self->_domRangeStartIndex;
  if (v6 < domRangeStartIndex) {
    self->_unint64_t domRangeStartIndex = domRangeStartIndex + v7;
  }
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    id v10 = [(NSHTMLReader *)self _attributesForElement:a3];
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      if (v8) {
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v10, v6, v8);
      }
    }
  }

  *(_DWORD *)&self->_flags |= 1u;
}

- (void)_newTabForElement:(id)a3
{
  unint64_t v5 = [(NSMutableAttributedString *)self->_attrStr length];
  if (v5)
  {
    p_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = &self->_flags;
    uint64_t v7 = *(unsigned char *)&self->_flags & (objc_msgSend((id)-[NSMutableAttributedString string](self->_attrStr, "string"), "characterAtIndex:", v5 - 1) == 32);
    v5 -= v7;
  }
  else
  {
    uint64_t v7 = 0;
    p_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = &self->_flags;
  }
  [(NSMutableAttributedString *)self->_attrStr replaceCharactersInRange:v5, v7, @"\t" withString];
  uint64_t v8 = [@"\t" length];
  uint64_t v9 = v8;
  unint64_t domRangeStartIndex = self->_domRangeStartIndex;
  if (v5 < domRangeStartIndex) {
    self->_unint64_t domRangeStartIndex = domRangeStartIndex + v8;
  }
  if ((*(unsigned char *)p_flags & 8) == 0)
  {
    id v11 = [(NSHTMLReader *)self _attributesForElement:a3];
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      if (v9) {
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v11, v5, v9);
      }
    }
  }

  *(_DWORD *)p_flags |= 1u;
}

- (BOOL)_addAttachmentForElement:(id)a3 URL:(id)a4 needsParagraph:(BOOL)a5 usePlaceholder:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "webFrame"), "dataSource");
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return 0;
  }
  id v12 = (void *)v11;
  id v13 = [(NSDictionary *)self->_options objectForKey:__NSHTMLReaderDelegateDocumentOption];
  if (!v13
    || (int v14 = v13, (objc_opt_respondsToSelector() & 1) == 0)
    || (id v15 = (id)[v14 fileWrapperForURL:a4]) == 0)
  {
    if (![a4 isFileURL]
      || !objc_msgSend((id)objc_msgSend(a4, "path"), "stringByStandardizingPath")
      || (id v15 = (id)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:a4 options:0 error:0]) == 0)
    {
      id v18 = (WebResource *)[v12 subresourceForURL:a4];
      if (!v18) {
        id v18 = [(WebDataSource *)self->_dataSource subresourceForURL:a4];
      }
      char v19 = 0;
      if (v6 && v18) {
        char v19 = objc_msgSend(@"text/html", "isEqual:", -[WebResource MIMEType](v18, "MIMEType"));
      }
      id v16 = 0;
      if ((v19 & 1) == 0 && v18)
      {
        id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28CF0]), "initRegularFileWithContents:", -[WebResource data](v18, "data"));
        objc_msgSend(v16, "setPreferredFilename:", objc_msgSend(a4, "_web_suggestedFilenameWithMIMEType:", -[WebResource MIMEType](v18, "MIMEType")));
      }
      BOOL v17 = v16 == 0;
      if (v16 || v6) {
        goto LABEL_20;
      }
      return 0;
    }
  }
  id v16 = v15;
  BOOL v17 = 0;
LABEL_20:
  unint64_t v21 = [(NSMutableAttributedString *)self->_attrStr length];
  uint64_t v22 = [[NSTextAttachment alloc] initWithFileWrapper:v16];
  float v23 = (void *)[a3 getAttribute:@"aria-label"];
  if ([v23 length]) {
    [(NSTextAttachment *)v22 setAccessibilityLabel:v23];
  }
  uint64_t v24 = (void *)[a3 getAttribute:@"alt"];
  if ([v24 length]) {
    [(NSTextAttachment *)v22 setAccessibilityLabel:v24];
  }
  id v25 = [(NSHTMLReader *)self _stringForNode:a3 property:@"vertical-align"];
  objc_msgSend(-[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, @"horizontal-align"), "floatValue");
  double v27 = v26 / 100.0 * (double)(int)[a3 clientWidth];
  [v25 floatValue];
  -[NSTextAttachment setBounds:](v22, "setBounds:", v27, v28 / 100.0 * (double)(int)[a3 clientHeight], (double)(int)objc_msgSend(a3, "clientWidth"), (double)(int)objc_msgSend(a3, "clientHeight"));
  if (v7) {
    double v29 = @"\uFFFC\n";
  }
  else {
    double v29 = @"\uFFFC";
  }
  if (v17)
  {
    v30 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WebKit"];
    if (!v30)
    {
      v30 = objc_msgSend(-[NSArray firstObject](NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1), "firstObject"), "stringByAppendingPathComponent:", @"Frameworks/WebKit.framework");
      if (v30) {
        v30 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:v30];
      }
    }
    uint64_t v31 = [v30 URLForResource:@"missing_image" withExtension:@"tiff"];
    if (v31) {
      -[NSTextAttachment setFileWrapper:](v22, "setFileWrapper:", (id)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v31 options:0 error:0]);
    }
  }
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v21, 0, v29);
  uint64_t v32 = [(__CFString *)v29 length];
  uint64_t v33 = v32;
  unint64_t domRangeStartIndex = self->_domRangeStartIndex;
  if (v21 < domRangeStartIndex) {
    self->_unint64_t domRangeStartIndex = domRangeStartIndex + v32;
  }
  id v35 = [(NSHTMLReader *)self _attributesForElement:a3];
  if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    if (v33)
    {
      -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v35, v21, v33);
      [(NSMutableAttributedString *)self->_attrStr addAttribute:@"NSAttachment", v22, v21, 1 value range];
    }
  }

  *(_DWORD *)&self->_flags &= ~1u;
  return 1;
}

- (void)_addQuoteForElement:(id)a3 opening:(BOOL)a4 level:(int64_t)a5
{
  if (a4) {
    __int16 v7 = 8220;
  }
  else {
    __int16 v7 = 8221;
  }
  if (a4) {
    __int16 v8 = 8216;
  }
  else {
    __int16 v8 = 8217;
  }
  if (a5) {
    __int16 v7 = v8;
  }
  __int16 v15 = v7;
  uint64_t v9 = (void *)[[NSString alloc] initWithCharacters:&v15 length:1];
  unint64_t v10 = [(NSMutableAttributedString *)self->_attrStr length];
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v10, 0, v9);
  uint64_t v11 = [v9 length];
  uint64_t v12 = v11;
  unint64_t domRangeStartIndex = self->_domRangeStartIndex;
  if (v10 < domRangeStartIndex) {
    self->_unint64_t domRangeStartIndex = domRangeStartIndex + v11;
  }
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    id v14 = [(NSHTMLReader *)self _attributesForElement:a3];
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      if (v12) {
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v14, v10, v12);
      }
    }
  }

  *(_DWORD *)&self->_flags &= ~1u;
}

- (void)_addValue:(id)a3 forElement:(id)a4
{
  unint64_t v7 = [(NSMutableAttributedString *)self->_attrStr length];
  uint64_t v8 = [a3 length];
  if (v8)
  {
    uint64_t v9 = v8;
    -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v7, 0, a3);
    unint64_t domRangeStartIndex = self->_domRangeStartIndex;
    if (v7 < domRangeStartIndex) {
      self->_unint64_t domRangeStartIndex = domRangeStartIndex + v9;
    }
    $0C7FF0FC465E944347A24E3ECE87D1B8 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
      id v12 = [(NSHTMLReader *)self _attributesForElement:a4];
      $0C7FF0FC465E944347A24E3ECE87D1B8 flags = self->_flags;
      if ((*(unsigned char *)&flags & 0x10) == 0)
      {
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v12, v7, v9);
        $0C7FF0FC465E944347A24E3ECE87D1B8 flags = self->_flags;
      }
    }
    self->_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&flags & 0xFFFFFFFE);
  }
}

- (void)_fillInBlock:(id)a3 forElement:(id)a4 backgroundColor:(id)a5 extraMargin:(double)a6 extraPadding:(double)a7 isTable:(BOOL)a8
{
  double v39 = 0.0;
  [(NSHTMLReader *)self _DOMHTMLTableCellElementClass];
  if (objc_opt_isKindOfClass())
  {
    __int16 v15 = (void *)[a4 width];
    uint64_t v16 = [a4 height];
  }
  else
  {
    __int16 v15 = (void *)[a4 getAttribute:@"width"];
    uint64_t v16 = [a4 getAttribute:@"height"];
  }
  BOOL v17 = (void *)v16;
  if ((v15 && [v15 length] || !a8)
    && [(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"width"])
  {
    [a3 setValue:0 type:0 forDimension:v39];
  }
  if (v17) {
    [v17 length];
  }
  if ([(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"min-width"]) {
    [a3 setValue:0 type:1 forDimension:v39];
  }
  if ([(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"max-width"]) {
    [a3 setValue:0 type:2 forDimension:v39];
  }
  if ([(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"min-height"]) {
    [a3 setValue:0 type:5 forDimension:v39];
  }
  if ([(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"max-height"]) {
    [a3 setValue:0 type:6 forDimension:v39];
  }
  BOOL v18 = [(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"padding-left"];
  double v19 = v39;
  if (!v18) {
    double v19 = -0.0;
  }
  [a3 setWidth:0 type:-1 forLayer:0 edge:v19 + a7];
  BOOL v20 = [(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"padding-top"];
  double v21 = v39;
  if (!v20) {
    double v21 = -0.0;
  }
  [a3 setWidth:0 type:-1 forLayer:1 edge:v21 + a7];
  BOOL v22 = [(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"padding-right"];
  double v23 = v39;
  if (!v22) {
    double v23 = -0.0;
  }
  [a3 setWidth:0 type:-1 forLayer:2 edge:v23 + a7];
  BOOL v24 = [(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"padding-bottom"];
  double v25 = v39;
  if (!v24) {
    double v25 = -0.0;
  }
  [a3 setWidth:0 type:-1 forLayer:3 edge:v25 + a7];
  if ([(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"border-left-width"])
  {
    [a3 setWidth:0 type:0 forLayer:0 edge:v39];
  }
  if ([(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"border-top-width"])
  {
    [a3 setWidth:0 type:0 forLayer:1 edge:v39];
  }
  if ([(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"border-right-width"])
  {
    [a3 setWidth:0 type:0 forLayer:2 edge:v39];
  }
  if ([(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"border-bottom-width"])
  {
    [a3 setWidth:0 type:0 forLayer:3 edge:v39];
  }
  BOOL v26 = [(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"margin-left"];
  double v27 = v39;
  if (!v26) {
    double v27 = -0.0;
  }
  [a3 setWidth:0 type:1 forLayer:0 edge:v27 + a6];
  BOOL v28 = [(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"margin-top"];
  double v29 = v39;
  if (!v28) {
    double v29 = -0.0;
  }
  [a3 setWidth:0 type:1 forLayer:1 edge:v29 + a6];
  BOOL v30 = [(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"margin-right"];
  double v31 = v39;
  if (!v30) {
    double v31 = -0.0;
  }
  [a3 setWidth:0 type:1 forLayer:2 edge:v31 + a6];
  BOOL v32 = [(NSHTMLReader *)self _getFloat:&v39 forNode:a4 property:@"margin-bottom"];
  double v33 = v39;
  if (!v32) {
    double v33 = -0.0;
  }
  [a3 setWidth:0 type:1 forLayer:3 edge:v33 + a6];
  id v34 = [(NSHTMLReader *)self _colorForNode:a4 property:@"background-color"];
  if (v34 || (id v34 = a5) != 0) {
    [a3 setBackgroundColor:v34];
  }
  id v35 = [(NSHTMLReader *)self _colorForNode:a4 property:@"border-left-color"];
  if (v35) {
    [a3 setBorderColor:v35 forEdge:0];
  }
  id v36 = [(NSHTMLReader *)self _colorForNode:a4 property:@"border-top-color"];
  if (v36) {
    [a3 setBorderColor:v36 forEdge:1];
  }
  id v37 = [(NSHTMLReader *)self _colorForNode:a4 property:@"border-right-color"];
  if (v37) {
    [a3 setBorderColor:v37 forEdge:2];
  }
  id v38 = [(NSHTMLReader *)self _colorForNode:a4 property:@"border-bottom-color"];
  if (v38) {
    [a3 setBorderColor:v38 forEdge:3];
  }
}

- (void)_processMetaElementWithName:(id)a3 content:(id)a4
{
  if ([@"CocoaVersion" compare:a3 options:1])
  {
    if (![@"Generator" compare:a3 options:1])
    {
      id v14 = &NSGeneratorDocumentAttribute;
      if (!a4) {
        return;
      }
      goto LABEL_44;
    }
    if ([@"Keywords" compare:a3 options:1])
    {
      if (![@"Author" compare:a3 options:1])
      {
        id v14 = (__CFString **)&NSAuthorDocumentAttribute;
        if (!a4) {
          return;
        }
        goto LABEL_44;
      }
      if (![@"LastAuthor" compare:a3 options:1])
      {
        id v14 = (__CFString **)&NSEditorDocumentAttribute;
        if (!a4) {
          return;
        }
        goto LABEL_44;
      }
      if (![@"Company" compare:a3 options:1])
      {
        id v14 = (__CFString **)&NSCompanyDocumentAttribute;
        if (!a4) {
          return;
        }
        goto LABEL_44;
      }
      if (![@"Copyright" compare:a3 options:1])
      {
        id v14 = (__CFString **)&NSCopyrightDocumentAttribute;
        if (!a4) {
          return;
        }
        goto LABEL_44;
      }
      if (![@"Subject" compare:a3 options:1])
      {
        id v14 = (__CFString **)&NSSubjectDocumentAttribute;
        if (!a4) {
          return;
        }
        goto LABEL_44;
      }
      if (![@"Description" compare:a3 options:1]
        || ![@"Comment" compare:a3 options:1])
      {
        id v14 = (__CFString **)&NSCommentDocumentAttribute;
        if (!a4) {
          return;
        }
        goto LABEL_44;
      }
      if ([@"CreationTime" compare:a3 options:1])
      {
        if ([@"ModificationTime" compare:a3 options:1])
        {
          if ([@"DisplayName" compare:a3 options:1]
            && [@"IndexTitle" compare:a3 options:1])
          {
            if ([@"robots" compare:a3 options:1]) {
              return;
            }
            [a4 rangeOfString:@"noindex" options:1];
            if (!v7) {
              return;
            }
            documentAttrs = self->_documentAttrs;
            id v9 = (id)[NSNumber numberWithInteger:1];
            unint64_t v10 = NSNoIndexDocumentAttribute;
            goto LABEL_20;
          }
          id v14 = &NSDisplayNameDocumentAttribute;
          if (!a4) {
            return;
          }
LABEL_44:
          double v21 = *v14;
          if (!*v14 || ![a4 length]) {
            return;
          }
          id v13 = self->_documentAttrs;
          id v9 = a4;
          unint64_t v10 = v21;
          goto LABEL_47;
        }
        if (!a4) {
          return;
        }
        if (![a4 length]) {
          return;
        }
        uint64_t v23 = _dateForString(a4);
        if (!v23) {
          return;
        }
        id v9 = (id)v23;
        id v13 = self->_documentAttrs;
        BOOL v20 = &NSModificationTimeDocumentAttribute;
      }
      else
      {
        if (!a4) {
          return;
        }
        if (![a4 length]) {
          return;
        }
        uint64_t v22 = _dateForString(a4);
        if (!v22) {
          return;
        }
        id v9 = (id)v22;
        id v13 = self->_documentAttrs;
        BOOL v20 = &NSCreationTimeDocumentAttribute;
      }
    }
    else
    {
      if (!a4 || ![a4 length]) {
        return;
      }
      [a4 rangeOfString:@", "];
      if (v15 || (BOOL v17 = @",", [a4 rangeOfString:@","], !v18))
      {
        [a4 rangeOfString:@", "];
        if (v16 || (BOOL v17 = @" ", [a4 rangeOfString:@" "], !v19)) {
          BOOL v17 = @", ";
        }
      }
      id v9 = (id)[a4 componentsSeparatedByString:v17];
      id v13 = self->_documentAttrs;
      BOOL v20 = &NSKeywordsDocumentAttribute;
    }
    unint64_t v10 = (__CFString *)*v20;
    goto LABEL_47;
  }
  [a4 doubleValue];
  if (v11 <= 0.0) {
    return;
  }
  double v12 = v11;
  [(NSMutableDictionary *)self->_documentAttrs removeObjectForKey:NSConvertedDocumentAttribute];
  documentAttrs = self->_documentAttrs;
  id v9 = (id)[NSNumber numberWithDouble:v12];
  unint64_t v10 = @"CocoaRTFVersion";
LABEL_20:
  id v13 = documentAttrs;
LABEL_47:

  [(NSMutableDictionary *)v13 setObject:v9 forKey:v10];
}

- (void)_processHeadElement:(id)a3
{
  id v4 = [(NSHTMLReader *)self _childrenForNode:a3];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = (void *)[v4 objectAtIndex:i];
      if ([v8 nodeType] == 1)
      {
        if (objc_msgSend(@"META", "isEqualToString:", objc_msgSend(v8, "tagName")))
        {
          if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
          {
            uint64_t v9 = [v8 name];
            uint64_t v10 = [v8 content];
            if (v9)
            {
              if (v10) {
                [(NSHTMLReader *)self _processMetaElementWithName:v9 content:v10];
              }
            }
          }
        }
      }
    }
  }
}

- (BOOL)_enterElement:(id)a3 tag:(id)a4 display:(id)a5 depth:(int64_t)a6 embedded:(BOOL)a7
{
  if ([@"HEAD" isEqualToString:a4] && !a7)
  {
    [(NSHTMLReader *)self _processHeadElement:a3];
    return 0;
  }
  if (a5
    && (([@"none" isEqualToString:a5] & 1) != 0
     || ([@"table-column" isEqualToString:a5] & 1) != 0
     || ([@"table-column-group" isEqualToString:a5] & 1) != 0))
  {
    return 0;
  }
  if (![(NSHTMLReader *)self _elementIsBlockLevel:a3]
    || ([@"BR" isEqualToString:a4] & 1) != 0
    || [@"table-cell" isEqualToString:a5]
    && ![(NSMutableArray *)self->_textTables count]
    || [(NSMutableArray *)self->_textLists count]
    && [@"block" isEqualToString:a5]
    && ([@"LI" isEqualToString:a4] & 1) == 0
    && ([@"UL" isEqualToString:a4] & 1) == 0
    && ![@"OL" isEqualToString:a4])
  {
    return 1;
  }
  BOOL v12 = 1;
  [(NSHTMLReader *)self _newParagraphForElement:a3 tag:a4 allowEmpty:0 suppressTrailingSpace:1 isEntering:1];
  return v12;
}

- (void)_addTableForElement:(id)a3
{
  uint64_t v16 = objc_alloc_init(NSTextTable);
  [(NSTextTable *)v16 setNumberOfColumns:1];
  [(NSTextTable *)v16 setLayoutAlgorithm:0];
  [(NSTextTable *)v16 setCollapsesBorders:0];
  [(NSTextTable *)v16 setHidesEmptyCells:0];
  if (a3)
  {
    id v5 = [(NSHTMLReader *)self _stringForNode:a3 property:@"border-collapse"];
    id v6 = [(NSHTMLReader *)self _stringForNode:a3 property:@"empty-cells"];
    id v7 = [(NSHTMLReader *)self _stringForNode:a3 property:@"table-layout"];
    double v8 = 1.0;
    double v9 = 1.0;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = (void *)[a3 cellSpacing];
      if (v10)
      {
        double v11 = v10;
        if ([v10 length])
        {
          if (([v11 hasSuffix:@"%"] & 1) == 0)
          {
            [v11 doubleValue];
            double v9 = v12;
          }
        }
      }
    }
    if (objc_opt_respondsToSelector())
    {
      id v13 = (void *)[a3 cellPadding];
      if (v13)
      {
        id v14 = v13;
        if ([v13 length])
        {
          if (([v14 hasSuffix:@"%"] & 1) == 0)
          {
            [v14 doubleValue];
            double v8 = v15;
          }
        }
      }
    }
    [(NSHTMLReader *)self _fillInBlock:v16 forElement:a3 backgroundColor:0 extraMargin:1 extraPadding:0.0 isTable:0.0];
    if ([@"collapse" isEqualToString:v5])
    {
      [(NSTextTable *)v16 setCollapsesBorders:1];
      double v9 = 0.0;
    }
    if ([@"hide" isEqualToString:v6]) {
      [(NSTextTable *)v16 setHidesEmptyCells:1];
    }
    if ([@"fixed" isEqualToString:v7]) {
      [(NSTextTable *)v16 setLayoutAlgorithm:1];
    }
  }
  else
  {
    double v9 = 1.0;
    double v8 = 1.0;
  }
  [(NSMutableArray *)self->_textTables addObject:v16];
  -[NSMutableArray addObject:](self->_textTableSpacings, "addObject:", [NSNumber numberWithDouble:v9]);
  -[NSMutableArray addObject:](self->_textTablePaddings, "addObject:", [NSNumber numberWithDouble:v8]);
  -[NSMutableArray addObject:](self->_textTableRows, "addObject:", [NSNumber numberWithInteger:0]);
  -[NSMutableArray addObject:](self->_textTableRowArrays, "addObject:", [MEMORY[0x1E4F1CA48] array]);
}

- (void)_addTableCellForElement:(id)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_textTables lastObject];
  uint64_t v6 = objc_msgSend((id)-[NSMutableArray lastObject](self->_textTableRows, "lastObject"), "integerValue");
  id v7 = (void *)[(NSMutableArray *)self->_textTableRowArrays lastObject];
  uint64_t v8 = [v7 count];
  if ([(NSMutableArray *)self->_textTableRowBackgroundColors count]) {
    double v9 = (void *)[(NSMutableArray *)self->_textTableRowBackgroundColors lastObject];
  }
  else {
    double v9 = 0;
  }
  objc_msgSend((id)-[NSMutableArray lastObject](self->_textTableSpacings, "lastObject"), "doubleValue");
  double v11 = v10;
  if (objc_msgSend(v9, "isEqual:", objc_msgSend((Class)getNSColorClass_4[0](), "clearColor"))) {
    double v12 = 0;
  }
  else {
    double v12 = v9;
  }
  BOOL v26 = v12;
  if (!v8)
  {
    uint64_t v14 = 0;
    if (a3) {
      goto LABEL_14;
    }
LABEL_19:
    uint64_t v19 = 1;
LABEL_25:
    uint64_t v21 = 1;
    goto LABEL_26;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  do
  {
    double v15 = objc_msgSend(v7, "objectAtIndex:", v13, v26);
    if (v14 >= [v15 startingColumn])
    {
      uint64_t v16 = [v15 startingColumn];
      if (v14 < [v15 columnSpan] + v16)
      {
        uint64_t v17 = [v15 startingColumn];
        uint64_t v14 = [v15 columnSpan] + v17;
      }
    }
    ++v13;
  }
  while (v8 != v13);
  if (!a3) {
    goto LABEL_19;
  }
LABEL_14:
  if (objc_opt_respondsToSelector())
  {
    int v18 = [a3 rowSpan];
    if (v18 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v18;
    }
  }
  else
  {
    uint64_t v19 = 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_25;
  }
  int v20 = [a3 colSpan];
  if (v20 <= 1) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v20;
  }
LABEL_26:
  uint64_t v22 = [[NSTextTableBlock alloc] initWithTable:v5 startingRow:v6 rowSpan:v19 startingColumn:v14 columnSpan:v21];
  double v27 = v22;
  if (!a3) {
    goto LABEL_35;
  }
  id v23 = [(NSHTMLReader *)self _stringForNode:a3 property:@"vertical-align"];
  [(NSHTMLReader *)self _fillInBlock:v27 forElement:a3 backgroundColor:v26 extraMargin:0 extraPadding:v11 * 0.5 isTable:0.0];
  if ([@"middle" isEqualToString:v23])
  {
    uint64_t v24 = 1;
LABEL_33:
    uint64_t v22 = v27;
LABEL_34:
    -[NSTextBlock setVerticalAlignment:](v22, "setVerticalAlignment:", v24, v26);
    uint64_t v22 = v27;
    goto LABEL_35;
  }
  if ([@"bottom" isEqualToString:v23])
  {
    uint64_t v24 = 2;
    goto LABEL_33;
  }
  if ([@"baseline" isEqualToString:v23])
  {
    uint64_t v24 = 3;
    goto LABEL_33;
  }
  int v25 = [@"top" isEqualToString:v23];
  uint64_t v22 = v27;
  if (v25)
  {
    uint64_t v24 = 0;
    goto LABEL_34;
  }
LABEL_35:
  -[NSMutableArray addObject:](self->_textBlocks, "addObject:", v22, v26);
  [v7 addObject:v27];
  [v7 sortUsingFunction:_colCompare context:0];
}

- (BOOL)_processElement:(id)a3 tag:(id)a4 display:(id)a5 depth:(int64_t)a6
{
  BOOL v11 = -[NSHTMLReader _elementIsBlockLevel:](self, "_elementIsBlockLevel:");
  if (v11)
  {
    [(NSMutableArray *)self->_writingDirectionArray removeAllObjects];
  }
  else
  {
    id v12 = [(NSHTMLReader *)self _stringForNode:a3 property:@"unicode-bidi"];
    if (v12)
    {
      uint64_t v13 = v12;
      if ([v12 isEqualToString:@"embed"])
      {
        uint64_t v14 = objc_msgSend(-[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, @"direction"), "isEqualToString:", @"rtl");
      }
      else
      {
        if (![v13 isEqualToString:@"bidi-override"]) {
          goto LABEL_11;
        }
        if (objc_msgSend(-[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", a3, @"direction"), "isEqualToString:", @"rtl"))uint64_t v14 = 3; {
        else
        }
          uint64_t v14 = 2;
      }
      -[NSMutableArray addObject:](self->_writingDirectionArray, "addObject:", [NSNumber numberWithUnsignedInteger:v14]);
    }
  }
LABEL_11:
  if (([@"table" isEqualToString:a5] & 1) != 0
    || ![(NSMutableArray *)self->_textTables count]
    && [@"table-row-group" isEqualToString:a5])
  {
    if ([@"table-row-group" isEqualToString:a5])
    {
      id v15 = -[NSHTMLReader _blockLevelElementForNode:](self, "_blockLevelElementForNode:", [a3 parentNode]);
      if (objc_msgSend(@"table", "isEqualToString:", -[NSHTMLReader _stringForNode:property:](self, "_stringForNode:property:", v15, @"display")))a3 = v15; {
    }
      }
    while (1)
    {
      unint64_t v16 = [(NSMutableArray *)self->_textTables count];
      if (v16 <= [(NSMutableArray *)self->_textBlocks count]) {
        break;
      }
      [(NSHTMLReader *)self _addTableCellForElement:0];
    }
    [(NSHTMLReader *)self _addTableForElement:a3];
    goto LABEL_19;
  }
  if ([@"table-footer-group" isEqualToString:a5]
    && [(NSMutableArray *)self->_textTables count])
  {
    -[NSMutableDictionary setObject:forKey:](self->_textTableFooters, "setObject:forKey:", a3, objc_msgSend(MEMORY[0x1E4F29238], "valueWithNonretainedObject:", -[NSMutableArray lastObject](self->_textTables, "lastObject")));
LABEL_26:
    LOBYTE(v11) = 0;
    return v11;
  }
  if ([@"table-row" isEqualToString:a5]
    && [(NSMutableArray *)self->_textTables count])
  {
    id v18 = [(NSHTMLReader *)self _colorForNode:a3 property:@"background-color"];
    if (!v18) {
      id v18 = (id)[(Class)getNSColorClass_4[0]() clearColor];
    }
    [(NSMutableArray *)self->_textTableRowBackgroundColors addObject:v18];
    goto LABEL_19;
  }
  if ([@"table-cell" isEqualToString:a5])
  {
    while (1)
    {
      unint64_t v19 = [(NSMutableArray *)self->_textTables count];
      if (v19 >= [(NSMutableArray *)self->_textBlocks count] + 1) {
        break;
      }
      [(NSHTMLReader *)self _addTableForElement:0];
    }
    [(NSHTMLReader *)self _addTableCellForElement:a3];
    goto LABEL_19;
  }
  if ([@"IMG" isEqualToString:a4])
  {
    int v20 = (void *)[a3 getAttribute:@"src"];
    if (v20)
    {
      uint64_t v21 = v20;
      if ([v20 length])
      {
        uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v21);
        if (v22
          || (uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithString:relativeToURL:", objc_msgSend(v21, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")), self->_baseURL)) != 0)
        {
          [(NSHTMLReader *)self _addAttachmentForElement:a3 URL:v22 needsParagraph:v11 usePlaceholder:0];
        }
      }
    }
    goto LABEL_26;
  }
  if ([@"OBJECT" isEqualToString:a4])
  {
    id v23 = (void *)[a3 getAttribute:@"codebase"];
    uint64_t v24 = (void *)[a3 getAttribute:@"data"];
    uint64_t v25 = [a3 getAttribute:@"declare"];
    if (v24)
    {
      uint64_t v26 = v25;
      if ([v24 length])
      {
        if (([@"true" isEqualToString:v26] & 1) == 0
          && (v23
           && [v23 length]
           && ((uint64_t v27 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v23)) != 0
            || (uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithString:relativeToURL:", objc_msgSend(v23, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")), self->_baseURL)) != 0)&& (v28 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithString:relativeToURL:", objc_msgSend(v24, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")), v27)) != 0|| (v28 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v24)) != 0|| (v28 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithString:relativeToURL:",
                       objc_msgSend(v24, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")), self->_baseURL)) != 0))
        {
          LODWORD(v11) = ![(NSHTMLReader *)self _addAttachmentForElement:a3 URL:v28 needsParagraph:v11 usePlaceholder:0];
          return v11;
        }
      }
    }
    goto LABEL_19;
  }
  if ([@"FRAME" isEqualToString:a4])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_26;
    }
    uint64_t v29 = [a3 contentDocument];
    if (!v29) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
  if ([@"IFRAME" isEqualToString:a4])
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v29 = [a3 contentDocument];
      if (v29)
      {
LABEL_61:
        [(NSHTMLReader *)self _traverseNode:v29 depth:a6 + 1 embedded:1];
        goto LABEL_26;
      }
    }
  }
  else if ([@"BR" isEqualToString:a4])
  {
    id v30 = -[NSHTMLReader _blockLevelElementForNode:](self, "_blockLevelElementForNode:", [a3 parentNode]);
    uint64_t v31 = [a3 getAttribute:@"class"];
    BOOL v32 = (void *)[v30 tagName];
    int v33 = [@"Apple-interchange-newline" isEqualToString:v31];
    if (([@"P" isEqualToString:v32] & 1) != 0
      || ([@"LI" isEqualToString:v32] & 1) != 0)
    {
      BOOL v34 = 0;
    }
    else if ([v32 hasPrefix:@"H"])
    {
      BOOL v34 = [v32 length] != 2;
    }
    else
    {
      BOOL v34 = 1;
    }
    if (v33)
    {
      *(_DWORD *)&self->_flags |= 0x20u;
    }
    else
    {
      if (!v30) {
        BOOL v34 = 1;
      }
      if (v34)
      {
        LOBYTE(v11) = 1;
        [(NSHTMLReader *)self _newParagraphForElement:a3 tag:a4 allowEmpty:1 suppressTrailingSpace:0 isEntering:0];
        return v11;
      }
      [(NSHTMLReader *)self _newLineForElement:a3];
    }
  }
  else if ([@"UL" isEqualToString:a4])
  {
    id v35 = [(NSHTMLReader *)self _stringForNode:a3 property:@"list-style-type"];
    if (!v35 || (id v36 = v35, ![(__CFString *)v35 length])) {
      id v36 = @"disc";
    }
    id v37 = [NSTextList alloc];
    id v38 = -[NSTextList initWithMarkerFormat:options:](v37, "initWithMarkerFormat:options:", [NSString stringWithFormat:@"{%@}", v36], 0);
    [(NSMutableArray *)self->_textLists addObject:v38];
  }
  else if ([@"OL" isEqualToString:a4])
  {
    double v39 = [(NSHTMLReader *)self _stringForNode:a3 property:@"list-style-type"];
    if (!v39 || (uint64_t v40 = v39, ![(__CFString *)v39 length])) {
      uint64_t v40 = @"decimal";
    }
    v41 = [NSTextList alloc];
    v42 = -[NSTextList initWithMarkerFormat:options:](v41, "initWithMarkerFormat:options:", [NSString stringWithFormat:@"{%@}.", v40], 0);
    if (objc_opt_respondsToSelector()) {
      -[NSTextList setStartingItemNumber:](v42, "setStartingItemNumber:", (int)[a3 start]);
    }
    [(NSMutableArray *)self->_textLists addObject:v42];
  }
  else
  {
    if ([@"Q" isEqualToString:a4])
    {
      ++self->_quoteLevel;
      LOBYTE(v11) = 1;
      -[NSHTMLReader _addQuoteForElement:opening:level:](self, "_addQuoteForElement:opening:level:", a3, 1);
      return v11;
    }
    if ([@"INPUT" isEqualToString:a4])
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        LOBYTE(v11) = 1;
        if (objc_msgSend(@"text", "compare:options:", objc_msgSend(a3, "type"), 1)) {
          return v11;
        }
        float v43 = (void *)[a3 value];
        if (v43)
        {
          double v44 = v43;
          if ([v43 length]) {
            [(NSHTMLReader *)self _addValue:v44 forElement:a3];
          }
        }
      }
    }
    else if ([@"TEXTAREA" isEqualToString:a4])
    {
      if (objc_opt_respondsToSelector())
      {
        float v45 = (void *)[a3 value];
        BOOL v11 = (BOOL)v45;
        if (!v45) {
          return v11;
        }
        if ([v45 length]) {
          [(NSHTMLReader *)self _addValue:v11 forElement:a3];
        }
      }
      goto LABEL_26;
    }
  }
LABEL_19:
  LOBYTE(v11) = 1;
  return v11;
}

- (void)_addMarkersToList:(id)a3 range:(_NSRange)a4
{
  if (self->_includesTextListMarkers)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    id v6 = a3;
    uint64_t v8 = [a3 startingItemNumber];
    double v46 = (void *)[(NSMutableAttributedString *)self->_attrStr string];
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    unint64_t v9 = [(NSMutableAttributedString *)self->_attrStr length];
    if (length)
    {
      unint64_t v10 = v9;
      NSUInteger v11 = v9 - location;
      if (v9 > location)
      {
        id v12 = (void *)-[NSMutableAttributedString attribute:atIndex:effectiveRange:](self->_attrStr, "attribute:atIndex:effectiveRange:");
        if (v12)
        {
          if (location + length <= v10) {
            NSUInteger v11 = length;
          }
          uint64_t v13 = (void *)[v12 textLists];
          uint64_t v14 = [v13 indexOfObject:v6];
          if (v13) {
            BOOL v15 = v14 == 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15 && location < v11 + location)
          {
            uint64_t v17 = v14 + 1;
            double v18 = (double)(unint64_t)(v14 + 1) * 36.0;
            NSUInteger v19 = location;
            NSUInteger v44 = location;
            id v42 = 0;
            uint64_t v43 = v14 + 1;
            do
            {
              unint64_t v20 = objc_msgSend(v46, "paragraphRangeForRange:", v19, 0);
              uint64_t v22 = v21;
              id v23 = (void *)[(NSMutableAttributedString *)self->_attrStr attribute:@"NSParagraphStyle" atIndex:v19 effectiveRange:&v47];
              if (objc_msgSend((id)objc_msgSend(v23, "textLists"), "count") == v17)
              {
                uint64_t v24 = (void *)[NSString stringWithFormat:@"\t%@\t", objc_msgSend(v6, "markerForItemNumber:", v8)];
                uint64_t v25 = [v24 length];
                uint64_t v45 = v8;
                if ((*(unsigned char *)&self->_flags & 0x18) == 0) {
                  id v42 = +[NSTextList _standardMarkerAttributesForAttributes:[(NSMutableAttributedString *)self->_attrStr attributesAtIndex:v20 effectiveRange:0]];
                }
                -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v20, 0, v24);
                if ((*(unsigned char *)&self->_flags & 0x18) == 0) {
                  -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v42, v20, v25);
                }
                id v26 = v6;
                unint64_t domRangeStartIndex = self->_domRangeStartIndex;
                if (v20 < domRangeStartIndex) {
                  self->_unint64_t domRangeStartIndex = domRangeStartIndex + v25;
                }
                uint64_t v28 = (void *)[v23 mutableCopy];
                [v28 setFirstLineHeadIndent:0.0];
                [v28 setHeadIndent:v18];
                uint64_t v29 = objc_msgSend((id)objc_msgSend(v28, "tabStops"), "count");
                if (v29)
                {
                  unint64_t v30 = v29;
                  do
                  {
                    unint64_t v31 = 0;
                    do
                    {
                      BOOL v32 = objc_msgSend((id)objc_msgSend(v28, "tabStops"), "objectAtIndex:", v31);
                      [v32 location];
                      ++v31;
                      BOOL v35 = v33 > v18 || v32 == 0;
                    }
                    while (v35 && v31 < v30);
                    if (v35) {
                      break;
                    }
                    [v28 removeTabStop:v32];
                    unint64_t v30 = objc_msgSend((id)objc_msgSend(v28, "tabStops"), "count");
                  }
                  while (v30);
                }
                uint64_t v37 = v25 + v22;
                id v38 = [NSTextTab alloc];
                uint64_t v39 = MEMORY[0x1E4F1CC08];
                uint64_t v40 = [(NSTextTab *)v38 initWithTextAlignment:0 location:MEMORY[0x1E4F1CC08] options:v18 + -25.0];
                [v28 addTabStop:v40];

                v41 = [[NSTextTab alloc] initWithTextAlignment:4 location:v39 options:v18];
                [v28 addTabStop:v41];

                if ((*(unsigned char *)&self->_flags & 0x18) == 0) {
                  [(NSMutableAttributedString *)self->_attrStr addAttribute:@"NSParagraphStyle", v28, v20, v37 value range];
                }
                uint64_t v8 = v45 + 1;
                v11 += v25;

                NSUInteger v19 = v37 + v20;
                id v6 = v26;
                uint64_t v17 = v43;
                NSUInteger location = v44;
              }
              else
              {
                NSUInteger v19 = v48 + v47;
              }
            }
            while (v19 < v11 + location);
          }
        }
      }
    }
  }
}

- (void)_exitElement:(id)a3 tag:(id)a4 display:(id)a5 depth:(int64_t)a6 startIndex:(unint64_t)a7
{
  uint64_t v13 = [(NSMutableAttributedString *)self->_attrStr length];
  if (v13 != a7)
  {
    if ([@"A" isEqualToString:a4])
    {
      uint64_t v14 = (void *)[a3 getAttribute:@"href"];
      uint64_t v15 = objc_msgSend(v14, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet"));
      if (v14)
      {
        unint64_t v16 = (void *)v15;
        if ([v14 length])
        {
          if (v16 && [v16 length] && (objc_msgSend(v16, "hasPrefix:", @"#") & 1) == 0)
          {
            uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v14);
            if (!v17)
            {
              uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "URLWithAttributeString:", v16);
              if (!v17) {
                uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithString:relativeToURL:", v16, self->_baseURL);
              }
            }
            if ((*(unsigned char *)&self->_flags & 0x18) == 0)
            {
              if (v17) {
                double v18 = (void *)v17;
              }
              else {
                double v18 = v14;
              }
              [(NSMutableAttributedString *)self->_attrStr addAttribute:@"NSLink", v18, a7, v13 - a7 value range];
            }
          }
        }
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0 || ![(NSHTMLReader *)self _elementIsBlockLevel:a3])
  {
    if ([(NSMutableArray *)self->_writingDirectionArray count])
    {
      id v19 = [(NSHTMLReader *)self _stringForNode:a3 property:@"unicode-bidi"];
      if (v19)
      {
        unint64_t v20 = v19;
        if (([v19 isEqualToString:@"embed"] & 1) != 0
          || [v20 isEqualToString:@"bidi-override"])
        {
          [(NSMutableArray *)self->_writingDirectionArray removeLastObject];
        }
      }
    }
  }
  else
  {
    [(NSMutableArray *)self->_writingDirectionArray removeAllObjects];
    if ([@"table-cell" isEqualToString:a5]
      && ![(NSMutableArray *)self->_textBlocks count])
    {
      [(NSHTMLReader *)self _newTabForElement:a3];
    }
    else if (![(NSMutableArray *)self->_textLists count] {
           || ![@"block" isEqualToString:a5]
    }
           || ([@"LI" isEqualToString:a4] & 1) != 0
           || ([@"UL" isEqualToString:a4] & 1) != 0
           || ([@"OL" isEqualToString:a4] & 1) != 0)
    {
      [(NSHTMLReader *)self _newParagraphForElement:a3 tag:a4 allowEmpty:v13 == a7 suppressTrailingSpace:0 isEntering:0];
    }
    else
    {
      [(NSHTMLReader *)self _newLineForElement:a3];
    }
  }
  unint64_t v21 = [(NSMutableAttributedString *)self->_attrStr length];
  if ([@"table" isEqualToString:a5]
    && [(NSMutableArray *)self->_textTables count])
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithNonretainedObject:", -[NSMutableArray lastObject](self->_textTables, "lastObject"));
    uint64_t v23 = [(NSMutableDictionary *)self->_textTableFooters objectForKey:v22];
    while (1)
    {
      unint64_t v24 = [(NSMutableArray *)self->_textTables count];
      if (v24 >= [(NSMutableArray *)self->_textBlocks count] + 1) {
        break;
      }
      [(NSMutableArray *)self->_textBlocks removeLastObject];
    }
    if (v23)
    {
      [(NSHTMLReader *)self _traverseFooterNode:v23 depth:a6 + 1];
      [(NSMutableDictionary *)self->_textTableFooters removeObjectForKey:v22];
    }
    [(NSMutableArray *)self->_textTables removeLastObject];
    [(NSMutableArray *)self->_textTableSpacings removeLastObject];
    [(NSMutableArray *)self->_textTablePaddings removeLastObject];
    [(NSMutableArray *)self->_textTableRows removeLastObject];
    textTableRowArrays = self->_textTableRowArrays;
    goto LABEL_71;
  }
  if (![@"table-row" isEqualToString:a5]
    || ![(NSMutableArray *)self->_textTables count])
  {
    if ([@"table-cell" isEqualToString:a5]
      && [(NSMutableArray *)self->_textBlocks count])
    {
      while (1)
      {
        unint64_t v46 = [(NSMutableArray *)self->_textTables count];
        if (v46 <= [(NSMutableArray *)self->_textBlocks count]) {
          break;
        }
        [(NSMutableArray *)self->_textTables removeLastObject];
        [(NSMutableArray *)self->_textTableSpacings removeLastObject];
        [(NSMutableArray *)self->_textTablePaddings removeLastObject];
        [(NSMutableArray *)self->_textTableRows removeLastObject];
        [(NSMutableArray *)self->_textTableRowArrays removeLastObject];
      }
      textTableRowArrays = self->_textBlocks;
      goto LABEL_71;
    }
    unint64_t v45 = v21 - a7;
    if ((([@"UL" isEqualToString:a4] & 1) != 0
       || [@"OL" isEqualToString:a4])
      && [(NSMutableArray *)self->_textLists count])
    {
      -[NSHTMLReader _addMarkersToList:range:](self, "_addMarkersToList:range:", [(NSMutableArray *)self->_textLists lastObject], a7, v21 - a7);
      textTableRowArrays = self->_textLists;
      goto LABEL_71;
    }
    if ([@"Q" isEqualToString:a4])
    {
      --self->_quoteLevel;
      -[NSHTMLReader _addQuoteForElement:opening:level:](self, "_addQuoteForElement:opening:level:", a3, 0);
      return;
    }
    if (![@"SPAN" isEqualToString:a4]) {
      return;
    }
    uint64_t v47 = [a3 getAttribute:@"class"];
    if ([@"Apple-converted-space" isEqualToString:v47])
    {
      uint64_t v48 = [(NSMutableAttributedString *)self->_attrStr mutableString];
      if (v21 > a7)
      {
        double v49 = v48;
        do
        {
          if ([(NSMutableString *)v49 characterAtIndex:a7] == 160) {
            [(NSMutableString *)v49 replaceCharactersInRange:a7, 1, @" " withString];
          }
          ++a7;
        }
        while (v21 != a7);
      }
      return;
    }
    if (![@"Apple-converted-tab" isEqualToString:v47]) {
      return;
    }
    v50 = [(NSMutableAttributedString *)self->_attrStr mutableString];
    if (v21 <= a7) {
      return;
    }
    float v51 = v50;
    uint64_t v52 = 0;
    unint64_t v53 = a7;
    while (1)
    {
      if (([(NSMutableString *)v51 characterAtIndex:v53] & 0xFFFFFF7F) == 0x20)
      {
        uint64_t v54 = v52 + 1;
        if ((unint64_t)(v52 + 1) <= 3 && v53 + 1 < v21) {
          goto LABEL_110;
        }
        unint64_t v55 = v53 - v52++;
        if (!v54) {
          goto LABEL_110;
        }
      }
      else
      {
        if (v52) {
          uint64_t v54 = v52;
        }
        else {
          uint64_t v54 = 0;
        }
        if (v52) {
          unint64_t v55 = v53 - v52;
        }
        else {
          unint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (!v52) {
          uint64_t v52 = 0;
        }
        if (!v52) {
          goto LABEL_110;
        }
      }
      [(NSMutableString *)v51 replaceCharactersInRange:v55, v52, @"\t" withString];
      v45 -= v52 - 1;
      v53 -= v52 - 1;
      unint64_t domRangeStartIndex = self->_domRangeStartIndex;
      if (v55 + v52 <= domRangeStartIndex) {
        break;
      }
      if (v55 < domRangeStartIndex) {
        goto LABEL_109;
      }
      uint64_t v54 = 0;
LABEL_110:
      ++v53;
      unint64_t v21 = v45 + a7;
      uint64_t v52 = v54;
      if (v53 >= v45 + a7) {
        return;
      }
    }
    unint64_t v55 = domRangeStartIndex - (v52 - 1);
LABEL_109:
    uint64_t v54 = 0;
    self->_unint64_t domRangeStartIndex = v55;
    goto LABEL_110;
  }
  uint64_t v25 = (void *)[(NSMutableArray *)self->_textTables lastObject];
  id v26 = (void *)[(NSMutableArray *)self->_textTableRowArrays lastObject];
  int64_t v27 = [v25 numberOfColumns];
  uint64_t v28 = objc_msgSend((id)-[NSMutableArray lastObject](self->_textTableRows, "lastObject"), "integerValue");
  do
  {
    ++v28;
    uint64_t v29 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v30 = [v26 count];
    if (v30)
    {
      uint64_t v31 = v30;
      for (uint64_t i = 0; i != v31; ++i)
      {
        double v33 = (void *)[v26 objectAtIndex:i];
        uint64_t v34 = [v33 startingColumn];
        if ([v33 columnSpan] + v34 > v27)
        {
          uint64_t v35 = [v33 startingColumn];
          int64_t v27 = [v33 columnSpan] + v35;
        }
        uint64_t v36 = [v33 startingRow];
        if ([v33 rowSpan] + v36 > v28) {
          [v29 addObject:v33];
        }
      }
    }
    uint64_t v37 = [v29 count];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = 0;
      for (uint64_t j = 0; j != v38; ++j)
      {
        v41 = (void *)[v29 objectAtIndex:j];
        if (v39 >= [v41 startingColumn])
        {
          uint64_t v42 = [v41 startingColumn];
          if (v39 < [v41 columnSpan] + v42)
          {
            uint64_t v43 = [v41 startingColumn];
            uint64_t v39 = [v41 columnSpan] + v43;
          }
        }
      }
    }
    else
    {
      uint64_t v39 = 0;
    }
    id v26 = v29;
  }
  while (v39 >= v27);
  if (v27 > (unint64_t)[v25 numberOfColumns]) {
    [v25 setNumberOfColumns:v27];
  }
  [(NSMutableArray *)self->_textTableRows removeLastObject];
  -[NSMutableArray addObject:](self->_textTableRows, "addObject:", [NSNumber numberWithInteger:v28]);
  [(NSMutableArray *)self->_textTableRowArrays removeLastObject];
  [(NSMutableArray *)self->_textTableRowArrays addObject:v29];
  if ([(NSMutableArray *)self->_textTableRowBackgroundColors count])
  {
    textTableRowArrays = self->_textTableRowBackgroundColors;
LABEL_71:
    [(NSMutableArray *)textTableRowArrays removeLastObject];
  }
}

- (void)_processText:(id)a3
{
  v3 = (DOMNode *)a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)[a3 data];
  uint64_t v6 = [(NSMutableAttributedString *)self->_attrStr length];
  unint64_t v7 = [(__CFString *)v5 length];
  if (!v6)
  {
    p_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = &self->_flags;
    goto LABEL_14;
  }
  unsigned int v8 = objc_msgSend((id)-[NSMutableAttributedString string](self->_attrStr, "string"), "characterAtIndex:", v6 - 1);
  p_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = &self->_flags;
  if ((*(unsigned char *)&self->_flags & (v8 == 32)) != 0)
  {
LABEL_14:
    int v50 = 1;
    goto LABEL_15;
  }
  int v50 = 1;
  BOOL v11 = (v8 > 0xD || ((1 << v8) & 0x3600) == 0) && v8 - 8232 >= 2;
  if (v11 && v8 != 133) {
    int v50 = 0;
  }
LABEL_15:
  id v12 = [(NSHTMLReader *)self _stringForNode:v3 property:@"white-space"];
  id v13 = [(NSHTMLReader *)self _stringForNode:v3 property:@"text-transform"];
  domRange = self->_domRange;
  if (!domRange) {
    goto LABEL_23;
  }
  if ([(DOMRange *)domRange startContainer] == v3)
  {
    unint64_t v15 = [(DOMRange *)self->_domRange startOffset];
    self->_unint64_t domRangeStartIndex = [(NSMutableAttributedString *)self->_attrStr length];
    *(_DWORD *)&self->_flags |= 2u;
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ([(DOMRange *)self->_domRange endContainer] != v3)
  {
    if (v15) {
      goto LABEL_21;
    }
LABEL_70:
    if (v7 >= [(__CFString *)v5 length]) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  unint64_t v7 = [(DOMRange *)self->_domRange endOffset];
  *(_DWORD *)&self->_flags |= 4u;
  if (!v15) {
    goto LABEL_70;
  }
LABEL_21:
  if (v7 >= v15) {
LABEL_22:
  }
    uint64_t v5 = (__CFString *)-[__CFString substringWithRange:](v5, "substringWithRange:", v15, v7 - v15);
LABEL_23:
  if ([v12 hasPrefix:@"pre"])
  {
    if (v6
      && [(__CFString *)v5 length]
      && (*(unsigned char *)p_flags & 1) != 0
      && ((unsigned int v45 = [(__CFString *)v5 characterAtIndex:0], v45 <= 0xD)
       && ((1 << v45) & 0x3400) != 0
       || v45 - 8232 < 2
       || v45 == 133))
    {
      int v16 = 0;
      Mutable = 0;
      --v6;
      uint64_t v17 = 1;
    }
    else
    {
      int v16 = 0;
      uint64_t v17 = 0;
      Mutable = 0;
    }
    goto LABEL_74;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v52 = 0u;
  uint64_t v19 = [(__CFString *)v5 length];
  Mutable = CFStringCreateMutable(0, 0);
  CFStringRef v59 = v5;
  uint64_t v62 = 0;
  int64_t v63 = v19;
  CharactersPtr = CFStringGetCharactersPtr(v5);
  CStringPtr = 0;
  uint64_t v60 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  }
  int64_t v64 = 0;
  int64_t v65 = 0;
  uint64_t v61 = CStringPtr;
  if (!v19)
  {
    int v16 = 0;
    goto LABEL_73;
  }
  double v49 = self;
  id v46 = v13;
  uint64_t v47 = v6;
  uint64_t v48 = p_flags;
  uint64_t v22 = 0;
  unint64_t v23 = 0;
  int64_t v24 = 0;
  LOBYTE(v16) = 0;
  uint64_t v25 = 64;
  int v26 = 1;
  do
  {
    if ((unint64_t)v24 >= 4) {
      uint64_t v27 = 4;
    }
    else {
      uint64_t v27 = v24;
    }
    if (v24 < 0 || (uint64_t v28 = v63, v63 <= v24))
    {
      UniChar v29 = 0;
    }
    else
    {
      if (v60)
      {
        UniChar v29 = v60[v24 + v62];
      }
      else if (v61)
      {
        UniChar v29 = v61[v62 + v24];
      }
      else
      {
        if (v65 <= v24 || (int64_t v30 = v64, v64 > v24))
        {
          uint64_t v31 = -v27;
          uint64_t v32 = v27 + v22;
          uint64_t v33 = v25 - v27;
          int64_t v34 = v24 + v31;
          int64_t v35 = v34 + 64;
          if (v34 + 64 >= v63) {
            int64_t v35 = v63;
          }
          int64_t v64 = v34;
          int64_t v65 = v35;
          if (v63 >= v33) {
            uint64_t v28 = v33;
          }
          v68.NSUInteger length = v28 + v32;
          v68.NSUInteger location = v34 + v62;
          CFStringGetCharacters(v59, v68, buffer);
          int64_t v30 = v64;
        }
        UniChar v29 = buffer[v24 - v30];
      }
      if (v29 <= 0x20u && ((1 << v29) & 0x100003600) != 0 || v29 == 8203)
      {
        int v16 = v50 & v26 ^ 1;
        goto LABEL_64;
      }
    }
    if (v16) {
      chars[v23++] = 32;
    }
    chars[v23++] = v29;
    if (v23 >= 0xFF)
    {
      CFStringAppendCharacters(Mutable, chars, v23);
      int v16 = 0;
      int v26 = 0;
      unint64_t v23 = 0;
    }
    else
    {
      int v16 = 0;
      int v26 = 0;
    }
LABEL_64:
    ++v24;
    --v22;
    ++v25;
  }
  while (v19 != v24);
  if (v16) {
    chars[v23++] = 32;
  }
  p_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = v48;
  self = v49;
  id v13 = v46;
  uint64_t v6 = v47;
  if (v23) {
    CFStringAppendCharacters(Mutable, chars, v23);
  }
LABEL_73:
  uint64_t v17 = 0;
  uint64_t v5 = Mutable;
LABEL_74:
  if ([(__CFString *)v5 length])
  {
    if ([@"capitalize" isEqualToString:v13])
    {
      uint64_t v38 = [(__CFString *)v5 capitalizedString];
      goto LABEL_81;
    }
    if ([@"uppercase" isEqualToString:v13])
    {
      uint64_t v38 = [(__CFString *)v5 uppercaseString];
      goto LABEL_81;
    }
    if ([@"lowercase" isEqualToString:v13])
    {
      uint64_t v38 = [(__CFString *)v5 lowercaseString];
LABEL_81:
      uint64_t v5 = (__CFString *)v38;
    }
    -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attrStr, "replaceCharactersInRange:withString:", v6, v17, v5);
    uint64_t v39 = [(__CFString *)v5 length];
    $0C7FF0FC465E944347A24E3ECE87D1B8 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
      uint64_t v41 = v39;
      uint64_t v42 = 0;
      if (v3)
      {
        do
        {
          if ([(DOMNode *)v3 nodeType] == 1)
          {
            uint64_t v43 = objc_msgSend(-[NSHTMLReader _attributesForElement:](self, "_attributesForElement:", v3), "mutableCopy");
            NSUInteger v44 = v43;
            if (v42)
            {
              [v43 addEntriesFromDictionary:v42];
            }
            uint64_t v42 = v44;
          }
          v3 = [(DOMNode *)v3 parentNode];
        }
        while (v3);
        $0C7FF0FC465E944347A24E3ECE87D1B8 flags = *p_flags;
      }
      if ((*(unsigned char *)&flags & 0x10) == 0 && v41) {
        -[NSMutableAttributedString setAttributes:range:](self->_attrStr, "setAttributes:range:", v42, v6, v41);
      }

      $0C7FF0FC465E944347A24E3ECE87D1B8 flags = *p_flags;
    }
    *p_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&flags & 0xFFFFFFFE | v16);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

- (void)_traverseNode:(id)a3 depth:(int64_t)a4 embedded:(BOOL)a5
{
  $0C7FF0FC465E944347A24E3ECE87D1B8 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
    BOOL v6 = a5;
    if ((*(unsigned char *)&flags & 2) != 0
      || !self->_domRange
      || (domStartAncestors = self->_domStartAncestors) == 0
      || [(NSMutableArray *)domStartAncestors containsObject:a3])
    {
      int v11 = [a3 nodeType];
      id v40 = [(NSHTMLReader *)self _childrenForNode:a3];
      uint64_t v12 = [v40 count];
      domRange = self->_domRange;
      if (domRange)
      {
        uint64_t v14 = [(DOMRange *)domRange startContainer];
        BOOL v15 = v14 == a3;
        if (v14 == a3)
        {
          unint64_t v16 = [(DOMRange *)self->_domRange startOffset];
          *(_DWORD *)&self->_flags |= 2u;
        }
        else
        {
          unint64_t v16 = 0;
        }
        if ([(DOMRange *)self->_domRange endContainer] == a3)
        {
          unint64_t v18 = [(DOMRange *)self->_domRange endOffset];
          int v17 = 1;
LABEL_14:
          if ((v11 & 0xFFFFFFFD) == 9)
          {
            unint64_t v19 = 0;
            int64_t v20 = a4 + 1;
            do
            {
              if (v12 == v19) {
                break;
              }
              if (v16 == v19 && v15) {
                self->_unint64_t domRangeStartIndex = [(NSMutableAttributedString *)self->_attrStr length];
              }
              BOOL v22 = v16 > v19 && v15;
              if (v18 <= v19) {
                char v23 = v17;
              }
              else {
                char v23 = 0;
              }
              if (!v22 && (v23 & 1) == 0) {
                -[NSHTMLReader _traverseNode:depth:embedded:](self, "_traverseNode:depth:embedded:", [v40 objectAtIndex:v19], v20, v6);
              }
              if (++v19 >= v18) {
                int v24 = v17;
              }
              else {
                int v24 = 0;
              }
              if (v24 == 1) {
                *(_DWORD *)&self->_flags |= 4u;
              }
              if (self->_thumbnailLimit <= 0)
              {
                $0C7FF0FC465E944347A24E3ECE87D1B8 v26 = self->_flags;
              }
              else
              {
                unint64_t v25 = [(NSMutableAttributedString *)self->_attrStr length];
                $0C7FF0FC465E944347A24E3ECE87D1B8 v26 = self->_flags;
                if (v25 >= self->_thumbnailLimit)
                {
                  $0C7FF0FC465E944347A24E3ECE87D1B8 v26 = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&v26 | 4);
                  self->_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = v26;
                }
              }
            }
            while ((*(unsigned char *)&v26 & 4) == 0);
LABEL_79:
            if (v17) {
              *(_DWORD *)&self->_flags |= 4u;
            }
            return;
          }
          if (v11 != 1)
          {
            if ((v11 - 3) <= 1) {
              [(NSHTMLReader *)self _processText:a3];
            }
            goto LABEL_79;
          }
          uint64_t v38 = [a3 tagName];
          id v39 = [(NSHTMLReader *)self _stringForNode:a3 property:@"display"];
          id v27 = [(NSHTMLReader *)self _stringForNode:a3 property:@"float"];
          if (!v27
            || (id v28 = v27, ([@"left" isEqualToString:v27] & 1) == 0)
            && ([@"right" isEqualToString:v28] & 1) == 0)
          {
            if (!v39)
            {
              uint64_t v29 = 0;
              goto LABEL_54;
            }
            if (([@"block" isEqualToString:v39] & 1) == 0
              && ([@"list-item" isEqualToString:v39] & 1) == 0)
            {
              uint64_t v29 = [v39 hasPrefix:@"table"];
              goto LABEL_54;
            }
          }
          uint64_t v29 = 1;
LABEL_54:
          -[NSMutableDictionary setObject:forKey:](self->_elementIsBlockLevel, "setObject:forKey:", [NSNumber numberWithBool:v29], a3);
          if ([(NSHTMLReader *)self _enterElement:a3 tag:v38 display:v39 depth:a4 embedded:v6])
          {
            uint64_t v36 = [(NSMutableAttributedString *)self->_attrStr length];
            if ([(NSHTMLReader *)self _processElement:a3 tag:v38 display:v39 depth:a4])
            {
              BOOL v37 = v6;
              unint64_t v30 = 0;
              do
              {
                if (v12 == v30) {
                  break;
                }
                if (v16 == v30 && v15) {
                  self->_unint64_t domRangeStartIndex = [(NSMutableAttributedString *)self->_attrStr length];
                }
                BOOL v32 = v16 > v30 && v15;
                if (v18 <= v30) {
                  char v33 = v17;
                }
                else {
                  char v33 = 0;
                }
                if (!v32 && (v33 & 1) == 0) {
                  -[NSHTMLReader _traverseNode:depth:embedded:](self, "_traverseNode:depth:embedded:", [v40 objectAtIndex:v30], a4 + 1, v37);
                }
                if (++v30 >= v18) {
                  int v34 = v17;
                }
                else {
                  int v34 = 0;
                }
                $0C7FF0FC465E944347A24E3ECE87D1B8 v35 = self->_flags;
                if (v34 == 1)
                {
                  $0C7FF0FC465E944347A24E3ECE87D1B8 v35 = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&v35 | 4);
                  self->_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = v35;
                }
              }
              while ((*(unsigned char *)&v35 & 4) == 0);
              [(NSHTMLReader *)self _exitElement:a3 tag:v38 display:v39 depth:a4 startIndex:v36];
            }
          }
          goto LABEL_79;
        }
      }
      else
      {
        unint64_t v16 = 0;
        BOOL v15 = 0;
      }
      int v17 = 0;
      unint64_t v18 = v12;
      goto LABEL_14;
    }
  }
}

- (void)_traverseFooterNode:(id)a3 depth:(int64_t)a4
{
  id v7 = -[NSHTMLReader _childrenForNode:](self, "_childrenForNode:");
  uint64_t v8 = [v7 count];
  $0C7FF0FC465E944347A24E3ECE87D1B8 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0) {
    return;
  }
  uint64_t v10 = v8;
  domRange = self->_domRange;
  if ((*(unsigned char *)&flags & 2) == 0 && domRange)
  {
    if (!self->_domStartAncestors) {
      goto LABEL_8;
    }
    if (![(NSMutableArray *)self->_domStartAncestors containsObject:a3]) {
      return;
    }
    domRange = self->_domRange;
  }
  if (!domRange)
  {
    unint64_t v14 = 0;
    BOOL v13 = 0;
LABEL_13:
    int v15 = 0;
    unint64_t v16 = v10;
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v12 = [(DOMRange *)domRange startContainer];
  BOOL v13 = v12 == a3;
  if (v12 == a3)
  {
    unint64_t v14 = [(DOMRange *)self->_domRange startOffset];
    *(_DWORD *)&self->_flags |= 2u;
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ([(DOMRange *)self->_domRange endContainer] != a3) {
    goto LABEL_13;
  }
  unint64_t v16 = [(DOMRange *)self->_domRange endOffset];
  int v15 = 1;
LABEL_15:
  if ([(NSHTMLReader *)self _enterElement:a3 tag:@"TBODY" display:@"table-row-group" depth:a4 embedded:1])
  {
    uint64_t v17 = [(NSMutableAttributedString *)self->_attrStr length];
    if ([(NSHTMLReader *)self _processElement:a3 tag:@"TBODY" display:@"table-row-group" depth:a4])
    {
      uint64_t v25 = v17;
      int64_t v26 = a4;
      unint64_t v18 = 0;
      int64_t v19 = a4 + 1;
      do
      {
        if (v10 == v18) {
          break;
        }
        if (v14 == v18 && v13) {
          self->_unint64_t domRangeStartIndex = [(NSMutableAttributedString *)self->_attrStr length];
        }
        BOOL v21 = v14 > v18 && v13;
        if (v16 <= v18) {
          char v22 = v15;
        }
        else {
          char v22 = 0;
        }
        if (!v21 && (v22 & 1) == 0) {
          -[NSHTMLReader _traverseNode:depth:embedded:](self, "_traverseNode:depth:embedded:", [v7 objectAtIndex:v18], v19, 1);
        }
        int v23 = ++v18 >= v16 ? v15 : 0;
        $0C7FF0FC465E944347A24E3ECE87D1B8 v24 = self->_flags;
        if (v23 == 1)
        {
          $0C7FF0FC465E944347A24E3ECE87D1B8 v24 = ($0C7FF0FC465E944347A24E3ECE87D1B8)(*(_DWORD *)&v24 | 4);
          self->_$0C7FF0FC465E944347A24E3ECE87D1B8 flags = v24;
        }
      }
      while ((*(unsigned char *)&v24 & 4) == 0);
      [(NSHTMLReader *)self _exitElement:a3, @"TBODY", @"table-row-group", v26, v25, v25, v26 tag display depth startIndex];
    }
  }
  if (v15) {
    *(_DWORD *)&self->_flags |= 4u;
  }
}

- (void)_parseNode:(id)a3
{
}

- (void)_adjustTrailingNewline
{
  uint64_t v3 = [(NSMutableAttributedString *)self->_attrStr length];
  if (!v3
    || ((v4 = objc_msgSend((id)-[NSMutableAttributedString string](self->_attrStr, "string"), "characterAtIndex:", v3 - 1), v4 >> 1 != 4116)? (BOOL v5 = v4 == 10): (BOOL v5 = 1), !v5 ? (v6 = v4 == 13) : (v6 = 1), !v6 && v4 != 133))
  {
    if ((*(unsigned char *)&self->_flags & 0x20) != 0)
    {
      attrStr = self->_attrStr;
      [(NSMutableAttributedString *)attrStr replaceCharactersInRange:v3, 0, @"\n" withString];
    }
  }
}

- (BOOL)_sanitizeWebArchiveArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  BOOL v7 = 0;
  uint64_t v8 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(a3);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ![(NSHTMLReader *)self _sanitizeWebArchiveDictionary:v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ![(NSHTMLReader *)self _sanitizeWebArchiveArray:v10])
        {
          continue;
        }
      }
      BOOL v7 = 1;
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);
  return v7;
}

- (BOOL)_sanitizeWebArchiveDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 objectForKey:@"WebResourceResponse"];
  BOOL v6 = v5 != 0;
  if (v5) {
    [a3 removeObjectForKey:@"WebResourceResponse"];
  }
  BOOL v7 = (void *)[a3 allKeys];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [a3 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [(NSHTMLReader *)self _sanitizeWebArchiveDictionary:v12]
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && [(NSHTMLReader *)self _sanitizeWebArchiveArray:v12])
        {
          BOOL v6 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return v6;
}

- (id)_createWebArchiveForData:(id)a3
{
  uint64_t v5 = [(NSHTMLReader *)self _webArchiveClass];
  if (!a3) {
    return 0;
  }
  BOOL v6 = v5;
  BOOL v7 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:1 format:0 error:0];
  if (!v7) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([(NSHTMLReader *)self _sanitizeWebArchiveDictionary:v7])
  {
    a3 = (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:0];
    if (!a3) {
      return 0;
    }
    return (id)[[v6 alloc] initWithData:a3];
  }
  id result = (id)[v7 objectForKey:@"WebMainResource"];
  if (result) {
    return (id)[[v6 alloc] initWithData:a3];
  }
  return result;
}

- (void)_loadUsingWebKit
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (self->_errorCode != -1) {
    return;
  }
  softLinkWebThreadLock();
  unsigned int v4 = [(NSHTMLReader *)self _webViewClass];
  id v5 = [(NSDictionary *)self->_options objectForKey:NSBaseURLDocumentOption];
  id v53 = [(NSDictionary *)self->_options objectForKey:@"CharacterEncoding"];
  CFStringRef v6 = [(NSDictionary *)self->_options objectForKey:NSTextEncodingNameDocumentOption];
  long long v55 = [(NSDictionary *)self->_options objectForKey:NSWebResourceLoadDelegateDocumentOption];
  long long v54 = [(NSDictionary *)self->_options objectForKey:@"WebPolicyDelegate"];
  id v7 = [(NSDictionary *)self->_options objectForKey:NSWebPreferencesDocumentOption];
  id v8 = [(NSDictionary *)self->_options objectForKey:NSTimeoutDocumentOption];
  id v56 = [(NSDictionary *)self->_options objectForKey:NSTextSizeMultiplierDocumentOption];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSHTMLReaderMode");
  bzero(&v61, 0x201uLL);
  NSUInteger v10 = [(NSData *)self->_data length];
  self->_errorCode = 1;
  if (!v4) {
    return;
  }
  data = self->_data;
  if (!data) {
    return;
  }
  uint64_t v51 = v9;
  id v52 = v8;
  if (v10 >= 0x200) {
    unint64_t v12 = 512;
  }
  else {
    unint64_t v12 = v10;
  }
  [(NSData *)data getBytes:&v61 length:v12];
  if (!v12) {
    goto LABEL_22;
  }
  CFStringRef v50 = v6;
  id v13 = v5;
  unint64_t v14 = 0;
  uint64_t v15 = MEMORY[0x1E4F14390];
  do
  {
    uint64_t v16 = *((unsigned __int8 *)&v61 + v14);
    if (*((char *)&v61 + v14) < 0) {
      int v17 = __maskrune(v16, 0x4000uLL);
    }
    else {
      int v17 = *(_DWORD *)(v15 + 4 * v16 + 60) & 0x4000;
    }
    if (v17) {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v18 = v14;
    }
    ++v14;
  }
  while (v18 == 0x7FFFFFFFFFFFFFFFLL && v14 < v12);
  id v5 = v13;
  CFStringRef v6 = v50;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_22:
  }
    uint64_t v18 = 0;
  if (v12 >= 9
    && (v61 == 1768714338 ? (BOOL v20 = v62 == 29811) : (BOOL v20 = 0),
        v20 && v63 >= 0x30u && v63 <= 0x39u && v64 >= 0x30u && v64 < 0x3Au)
    || (size_t v21 = v12 - v18, v21 >= 0x41)
    && (char v22 = (char *)&v61 + v18, !strncasecmp((const char *)&v61 + v18, "<?xml", 5uLL))
    && (strnstr(v22, "<!DOCTYPE plist", v21) || strnstr(v22, "<!doctype plist", v21))
    && strnstr(v22, "<plist", v21))
  {
    id v23 = -[NSHTMLReader _createWebArchiveForData:](self, "_createWebArchiveForData:", self->_data, v50);
    CFStringRef v24 = (const __CFString *)v51;
    uint64_t v25 = v52;
    if (!v23) {
      return;
    }
  }
  else
  {
    id v23 = 0;
    CFStringRef v24 = (const __CFString *)v51;
    uint64_t v25 = v52;
  }
  int64_t v26 = (WebView *)objc_msgSend([v4 alloc], "initWithFrame:", 0.0, 0.0, 800.0, 600.0);
  self->_webView = v26;
  if (v24) {
    CFStringRef v27 = v24;
  }
  else {
    CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F1C3A0];
  }
  id v28 = [(WebView *)v26 mainFrame];
  uint64_t v29 = [[NSHTMLWebDelegate alloc] initWithBaseURL:v5];
  self->_webDelegate = v29;
  if (v55) {
    unint64_t v30 = v55;
  }
  else {
    unint64_t v30 = v29;
  }
  if (v54) {
    uint64_t v31 = v54;
  }
  else {
    uint64_t v31 = v29;
  }
  [(WebView *)self->_webView setResourceLoadDelegate:v30];
  [(WebView *)self->_webView setFrameLoadDelegate:self->_webDelegate];
  [(WebView *)self->_webView setPolicyDelegate:v31];
  if (!v7) {
    id v7 = [(NSHTMLReader *)self _webPreferences];
  }
  [(WebView *)self->_webView setPreferences:v7];
  objc_msgSend(v7, "setDefaultFontSize:", objc_msgSend(v7, "defaultFontSize"));
  self->_standardFontFamily = (NSString *)(id)[v7 standardFontFamily];
  self->_double defaultFontSize = (double)(int)[v7 defaultFontSize];
  int v32 = [v7 minimumFontSize];
  self->_double minimumFontSize = (double)v32;
  if (self->_defaultFontSize <= 0.0) {
    self->_double defaultFontSize = 12.0;
  }
  if (v32 <= 0) {
    self->_double minimumFontSize = 1.0;
  }
  if (!v6 && v53)
  {
    unint64_t v33 = [v53 unsignedIntegerValue];
    if (!v33 || (CFStringEncoding v34 = CFStringConvertNSStringEncodingToEncoding(v33), v34 == -1)) {
      CFStringRef v6 = 0;
    }
    else {
      CFStringRef v6 = CFStringConvertEncodingToIANACharSetName(v34);
    }
  }
  if (v56)
  {
    [v56 doubleValue];
    self->_double textSizeMultiplier = textSizeMultiplier;
  }
  else
  {
    double textSizeMultiplier = self->_textSizeMultiplier;
  }
  if (textSizeMultiplier <= 0.0)
  {
    self->_double textSizeMultiplier = 1.0;
    double textSizeMultiplier = 1.0;
  }
  self->_double webViewTextSizeMultiplier = textSizeMultiplier;
  *(float *)&double textSizeMultiplier = textSizeMultiplier;
  [(WebView *)self->_webView setTextSizeMultiplier:textSizeMultiplier];
  double v36 = 0.1;
  if (v25)
  {
    [v25 doubleValue];
    if (v37 <= 0.0) {
      double v38 = 60.0;
    }
    else {
      double v38 = v37;
    }
    if (v38 < 1.0) {
      double v36 = v38 / 10.0;
    }
    if (v23) {
      goto LABEL_73;
    }
LABEL_75:
    id v39 = v28;
    -[WebFrame loadData:MIMEType:textEncodingName:baseURL:](v28, "loadData:MIMEType:textEncodingName:baseURL:", self->_data, @"text/html", v6, [v5 absoluteURL]);
    goto LABEL_76;
  }
  double v38 = 60.0;
  if (!v23) {
    goto LABEL_75;
  }
LABEL_73:
  id v39 = v28;
  [(WebFrame *)v28 loadArchive:v23];

LABEL_76:
  id v40 = (void *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v38];
  if ((softLinkWebThreadIsLocked() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSHTMLReader.m", 2646, @"before nested web runloop");
  }
  double v41 = 10.0;
  do
  {
    if (objc_msgSend(self->_webDelegate, "loadDidFinish", v41)) {
      break;
    }
    CFRunLoopRunInMode(v27, v36 * 10.0, 1u);
    softLinkWebThreadLock();
    if ((softLinkWebThreadIsLocked() & 1) == 0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSHTMLReader.m", 2652, @"after nested web runloop");
    }
    [v40 timeIntervalSinceNow];
  }
  while (v41 >= v36);
  [(WebFrame *)v39 stopLoading];
  if ([self->_webDelegate loadDidSucceed])
  {
    uint64_t v42 = [(WebFrame *)v39 dataSource];
    self->_dataSource = v42;
    if (v42)
    {
      uint64_t v43 = [(WebDataSource *)v42 representation];
      if (v43)
      {
        NSUInteger v44 = (void *)v43;
        if (objc_opt_respondsToSelector())
        {
          unsigned int v45 = (DOMDocument *)[v44 DOMDocument];
          self->_document = v45;
          if (v45)
          {
            self->_errorCode = 0;
            [(NSHTMLReader *)self _parseNode:v45];
            if (self->_thumbnailLimit >= 1
              && (unint64_t)[(NSMutableAttributedString *)self->_attrStr length] > self->_thumbnailLimit)
            {
              -[NSMutableAttributedString deleteCharactersInRange:](self->_attrStr, "deleteCharactersInRange:");
            }
            [(NSHTMLReader *)self _adjustTrailingNewline];
            if (objc_opt_respondsToSelector())
            {
              id v46 = [(DOMDocument *)self->_document title];
              if (v46)
              {
                uint64_t v47 = v46;
                if ([(NSString *)v46 length]) {
                  [(NSMutableDictionary *)self->_documentAttrs setObject:v47 forKey:@"NSTitleDocumentAttribute"];
                }
              }
            }
            uint64_t v48 = objc_msgSend((Class)getNSColorClass_4[0](), "_disambiguated_due_to_CIImage_colorWithCGColor:", -[WebFrame _bodyBackgroundColor](v39, "_bodyBackgroundColor"));
            uint64_t v59 = 0;
            uint64_t v60 = 0;
            double v57 = 0.0;
            uint64_t v58 = 0;
            [v48 getRed:&v60 green:&v59 blue:&v58 alpha:&v57];
            if (v48)
            {
              double v49 = v57;
              if (v57 > 0.0) {
                [(NSMutableDictionary *)self->_documentAttrs setObject:v48, @"BackgroundColor", v57 forKey];
              }
            }
            if (v5) {
              [(NSMutableDictionary *)self->_documentAttrs setObject:v5, @"BaseURL", v49 forKey];
            }
          }
        }
      }
    }
  }
  [(WebView *)self->_webView close];
  [(WebView *)self->_webView setResourceLoadDelegate:0];
  [(WebView *)self->_webView setFrameLoadDelegate:0];
  [(WebView *)self->_webView setPolicyDelegate:0];
  if (_NSRunWebKitOnAppKitThread == 1)
  {

    self->_webView = 0;
    self->_computedStylesForElements = 0;

    self->_specifiedStylesForElements = 0;
    self->_stringsForNodes = 0;

    self->_floatsForNodes = 0;
    self->_colorsForNodes = 0;

    self->_attributesForElements = 0;
    self->_elementIsBlockLevel = 0;
  }
}

- (void)_loadFromDOMRange
{
  if (self->_errorCode == -1)
  {
    uint64_t v3 = [(DOMRange *)self->_domRange commonAncestorContainer];
    unsigned int v4 = [(DOMRange *)self->_domRange startContainer];
    for (self->_domStartAncestors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v4;
          unsigned int v4 = [(DOMNode *)v4 parentNode])
    {
      [(NSMutableArray *)self->_domStartAncestors addObject:v4];
      if (v4 == v3) {
        break;
      }
    }
    id v5 = [(DOMNode *)v3 ownerDocument];
    self->_document = v5;
    CFStringRef v6 = [(DOMDocument *)v5 webFrame];
    self->_dataSource = [(WebFrame *)v6 dataSource];
    id v7 = [(WebFrame *)v6 webView];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = [(WebView *)v7 preferences];
      [(WebView *)v8 textSizeMultiplier];
      double v11 = v10;
      self->_double textSizeMultiplier = v11;
      self->_double webViewTextSizeMultiplier = v11;
      if (v9)
      {
        self->_standardFontFamily = [(WebPreferences *)v9 standardFontFamily];
        self->_double defaultFontSize = (double)[(WebPreferences *)v9 defaultFontSize];
        self->_double minimumFontSize = (double)[(WebPreferences *)v9 minimumFontSize];
      }
    }
    if (self->_textSizeMultiplier <= 0.0) {
      self->_double textSizeMultiplier = 1.0;
    }
    if (self->_defaultFontSize <= 0.0) {
      self->_double defaultFontSize = 12.0;
    }
    if (self->_minimumFontSize < 1.0) {
      self->_double minimumFontSize = 1.0;
    }
    if (self->_document)
    {
      if (self->_dataSource)
      {
        self->_int64_t domRangeStartIndex = 0;
        self->_errorCode = 0;
        [(NSHTMLReader *)self _parseNode:v3];
        int64_t domRangeStartIndex = self->_domRangeStartIndex;
        if (domRangeStartIndex >= 1
          && domRangeStartIndex <= (unint64_t)[(NSMutableAttributedString *)self->_attrStr length])
        {
          attrStr = self->_attrStr;
          int64_t v14 = self->_domRangeStartIndex;
          -[NSMutableAttributedString deleteCharactersInRange:](attrStr, "deleteCharactersInRange:", 0, v14);
        }
      }
    }
  }
}

- (void)_loadUsingWebKitOnMainThread
{
  [(NSMutableAttributedString *)self->_attrStr beginEditing];
  [(NSHTMLReader *)self _loadUsingWebKit];
  attrStr = self->_attrStr;

  [(NSMutableAttributedString *)attrStr endEditing];
}

- (void)_load
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v4 = _NSRunWebKitOnAppKitThread;
  if (_NSRunWebKitOnAppKitThread == 254)
  {
    if (![v3 objectForKey:@"NSRunWebKitOnAppKitThread"])
    {
      _NSRunWebKitOnAppKitThread = 1;
      if (self->_domRange) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
    int v4 = [v3 BOOLForKey:@"NSRunWebKitOnAppKitThread"];
    _NSRunWebKitOnAppKitThread = v4;
  }
  if (self->_domRange)
  {
LABEL_5:
    [(NSHTMLReader *)self _loadFromDOMRange];
    return;
  }
  if (v4 != 1) {
    goto LABEL_12;
  }
LABEL_11:
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
LABEL_12:
    [(NSHTMLReader *)self _loadUsingWebKit];
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(NSMutableAttributedString *)self->_attrStr _isEditing])
  {
    [(NSMutableAttributedString *)self->_attrStr endEditing];
    [(NSHTMLReader *)self performSelectorOnMainThread:sel__loadUsingWebKitOnMainThread withObject:0 waitUntilDone:1];
    attrStr = self->_attrStr;
    [(NSMutableAttributedString *)attrStr beginEditing];
  }
  else
  {
    [(NSHTMLReader *)self performSelectorOnMainThread:sel__loadUsingWebKit withObject:0 waitUntilDone:1];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSHTMLReader;
  [(NSHTMLReader *)&v3 dealloc];
}

- (NSHTMLReader)initWithData:(id)a3 options:(id)a4
{
  id v7 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  v20.receiver = self;
  v20.super_class = (Class)NSHTMLReader;
  id v8 = [(NSHTMLReader *)&v20 init];
  if (v8)
  {
    *((void *)v8 + 1) = objc_alloc_init(MEMORY[0x1E4F28E48]);
    *((void *)v8 + 2) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 3) = a3;
    *((void *)v8 + 5) = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a4];
    *((void *)v8 + 18) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v8 + 19) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v8 + 20) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v8 + 21) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 22) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v8 + 23) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v8 + 24) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v8 + 25) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v8 + 26) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v8 + 27) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 28) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 29) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 30) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 31) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 32) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 33) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 34) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v8 + 35) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(_OWORD *)(v8 + 104) = xmmword_18E5F7570;
    *(_OWORD *)(v8 + 120) = xmmword_18E5F78F0;
    *((void *)v8 + 17) = 0x3FF0000000000000;
    *((void *)v8 + 38) = 0;
    *((void *)v8 + 39) = -1;
    uint64_t v9 = (uint64_t *)(v8 + 296);
    *((void *)v8 + 37) = 0;
    v8[332] = 1;
    float v10 = (void *)[a4 objectForKey:@"NSIndexing"];
    if (v10)
    {
      uint64_t v11 = [v10 integerValue];
    }
    else
    {
      if ([v7 objectForKey:@"NSHTMLIndexing"])
      {
        unint64_t v12 = @"NSHTMLIndexing";
      }
      else
      {
        if (![v7 objectForKey:@"NSTextIndexing"])
        {
          uint64_t v11 = *v9;
LABEL_10:
          *((_DWORD *)v8 + 82) = *((_DWORD *)v8 + 82) & 0xFFFFFFF7 | (8 * (v11 > 0));
          id v13 = (void *)[a4 objectForKey:@"NSThumbnail"];
          if (v13) {
            *((void *)v8 + 38) = [v13 integerValue];
          }
          int64_t v14 = (void *)[a4 objectForKey:@"NSTesting"];
          if (v14)
          {
            int v15 = [v14 integerValue] > 0;
          }
          else
          {
            if (![v7 objectForKey:@"NSHTMLTesting"])
            {
LABEL_20:
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 612.0, 792.0), @"PaperSize");
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", 90.0), @"LeftMargin");
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", 90.0), @"RightMargin");
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", 72.0), @"TopMargin");
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", 72.0), @"BottomMargin");
              objc_msgSend(*((id *)v8 + 2), "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", 72.0, 90.0, 72.0, 90.0), @"PaperMargin");
              int v17 = (void *)*((void *)v8 + 2);
              uint64_t v18 = [NSNumber numberWithInteger:-1];
              [v17 setObject:v18 forKey:NSConvertedDocumentAttribute];
              return (NSHTMLReader *)v8;
            }
            int v15 = [v7 BOOLForKey:@"NSHTMLTesting"];
          }
          if (v15) {
            int v16 = 16;
          }
          else {
            int v16 = 0;
          }
          *((_DWORD *)v8 + 82) = *((_DWORD *)v8 + 82) & 0xFFFFFFEF | v16;
          goto LABEL_20;
        }
        unint64_t v12 = @"NSTextIndexing";
      }
      uint64_t v11 = [v7 integerForKey:v12];
    }
    uint64_t *v9 = v11;
    goto LABEL_10;
  }
  return (NSHTMLReader *)v8;
}

- (NSHTMLReader)initWithPath:(id)a3 options:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3];

  return [(NSHTMLReader *)self initWithData:v6 options:a4];
}

- (NSHTMLReader)initWithDOMRange:(id)a3
{
  int v4 = [(NSHTMLReader *)self initWithData:0 options:0];
  if (v4) {
    v4->_domRange = (DOMRange *)a3;
  }
  return v4;
}

- (id)attributedString
{
  [(NSHTMLReader *)self _load];
  if (self->_errorCode) {
    return 0;
  }
  int v4 = self->_attrStr;

  return v4;
}

- (id)documentAttributes
{
  [(NSHTMLReader *)self _load];
  if (self->_errorCode) {
    return 0;
  }
  int v4 = self->_documentAttrs;

  return v4;
}

- (void)setMutableAttributedString:(id)a3
{
  attrStr = self->_attrStr;
  if (attrStr != a3)
  {
    if (attrStr)
    {
      uint64_t v6 = [(NSMutableAttributedString *)attrStr length];
      id v7 = self->_attrStr;
      if (v6)
      {
        [a3 setAttributedString:v7];
        id v7 = self->_attrStr;
      }
    }
    else
    {
      id v7 = 0;
    }

    self->_attrStr = (NSMutableAttributedString *)a3;
  }
}

- (BOOL)includesTextListMarkers
{
  return self->_includesTextListMarkers;
}

- (void)setIncludesTextListMarkers:(BOOL)a3
{
  self->_includesTextListMarkers = a3;
}

@end