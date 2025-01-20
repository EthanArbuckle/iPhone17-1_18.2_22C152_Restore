@interface NSTextListElement
+ (NSTextListElement)textListElementWithChildElements:(NSArray *)children textList:(NSTextList *)textList nestingLevel:(NSInteger)nestingLevel;
+ (NSTextListElement)textListElementWithContents:(NSAttributedString *)contents markerAttributes:(NSDictionary *)markerAttributes textList:(NSTextList *)textList childElements:(NSArray *)children;
+ (_NSRange)_textListElementContentsRangeForRange:(_NSRange)a3 inAttributedString:(id)a4 hadMarker:(BOOL *)a5;
+ (id)_createChildElementsFromAttributedString:(id)a3 inRange:(_NSRange)a4 indentLevel:(int64_t)a5 includesTextListMarkers:(BOOL)a6 effectiveRange:(_NSRange *)a7 textListElementInstantiationCallback:(id)a8;
+ (id)_createElementWithChildElements:(id)a3 textList:(id)a4 nestingLevel:(int64_t)a5;
+ (id)_createTextListElementFromAttributedString:(id)a3 inRange:(_NSRange)a4 indentLevel:(int64_t)a5 includesTextListMarkers:(BOOL)a6 effectiveRange:(_NSRange *)a7 textListElementInstantiationCallback:(id)a8;
+ (id)_createUpdatedTextTabsForTextTabs:(id)a3 markerLocation:(double)a4 listLocation:(double)a5;
+ (id)_formattedAttributedStringForRootTextListElement:(id)a3;
+ (id)_rootTextListElementFromAttributedString:(id)a3 atIndex:(int64_t)a4 options:(unint64_t)a5 effectiveRange:(_NSRange *)a6 textListElementInstantiationCallback:(id)a7;
+ (void)_fillTextListElement:(id)a3 toAttributedString:(id)a4;
+ (void)initialize;
- (BOOL)_appendsParagraphSeparator;
- (BOOL)contentsOnly;
- (BOOL)isRepresentedElement;
- (NSArray)childElements;
- (NSAttributedString)attributedString;
- (NSAttributedString)contents;
- (NSDictionary)markerAttributes;
- (NSTextList)textList;
- (NSTextListElement)initWithParentElement:(NSTextListElement *)parent textList:(NSTextList *)textList contents:(NSAttributedString *)contents markerAttributes:(NSDictionary *)markerAttributes childElements:(NSArray *)children;
- (NSTextListElement)parentElement;
- (NSTextListElement)textListElementWithChildElements:(id)a3;
- (_NSRange)rangeForLocation:(id)a3 allowsTrailingEdge:(BOOL)a4;
- (double)_indentOffset;
- (double)_markerOffset;
- (id)_createConfiguredParagraphStyleForParagraphStyle:(id)a3;
- (id)_markerString;
- (id)_markerTextAttributesForTextList:(id)a3 attributes:(id)a4;
- (id)locationForCharacterIndex:(int64_t)a3 dataSourceLocationsOnly:(BOOL)a4 actualRange:(_NSRange *)a5;
- (id)markerAttributedString;
- (id)markerTextAttributeOverrides;
- (id)markerTextAttributesForTextList;
- (int64_t)_contentsLocationOffset;
- (int64_t)_indentLevel;
- (int64_t)indentLevel;
- (int64_t)itemNumber;
- (void)_reparentWithTextListElement:(id)a3 itemNumber:(int64_t)a4;
- (void)dealloc;
- (void)setMarkerTextAttributeOverrides:(id)a3;
- (void)setMarkerTextAttributesForTextList:(id)a3;
- (void)setParagraphContentRange:(id)a3;
- (void)setParentElement:(id)a3;
@end

@implementation NSTextListElement

- (id)_createConfiguredParagraphStyleForParagraphStyle:(id)a3
{
  if (a3) {
    v4 = (NSMutableParagraphStyle *)[a3 mutableCopy];
  }
  else {
    v4 = objc_alloc_init(NSMutableParagraphStyle);
  }
  v5 = v4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v7 = (double)[(NSTextListElement *)self _indentLevel];
  [(NSTextListElement *)self _indentOffset];
  double v9 = v8 * v7;
  [(NSTextListElement *)self _markerOffset];
  double v11 = v9 - v10;
  [(NSMutableParagraphStyle *)v5 setFirstLineHeadIndent:0.0];
  [(NSMutableParagraphStyle *)v5 setHeadIndent:v9];
  v12 = objc_msgSend((id)objc_opt_class(), "_createUpdatedTextTabsForTextTabs:markerLocation:listLocation:", -[NSParagraphStyle tabStops](v5, "tabStops"), v11, v9);
  [(NSMutableParagraphStyle *)v5 setTabStops:v12];

  for (i = self; [(NSTextListElement *)i parentElement]; self = i)
  {
    objc_msgSend(v6, "insertObject:atIndex:", -[NSTextListElement textList](self, "textList"), 0);
    i = [(NSTextListElement *)self parentElement];
  }
  [(NSMutableParagraphStyle *)v5 setTextLists:v6];

  return v5;
}

- (double)_markerOffset
{
  return 25.0;
}

- (double)_indentOffset
{
  return 36.0;
}

- (int64_t)_indentLevel
{
  int64_t result = self->_indentLevel;
  if (result < 0)
  {
    int64_t result = [(NSTextListElement *)self parentElement];
    if (result) {
      int64_t result = [(id)result _indentLevel] + 1;
    }
    self->_indentLevel = result;
  }
  return result;
}

- (NSTextListElement)parentElement
{
  return (NSTextListElement *)objc_loadWeak((id *)&self->_parentElement);
}

+ (id)_createUpdatedTextTabsForTextTabs:(id)a3 markerLocation:(double)a4 listLocation:(double)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  double v8 = (void *)[a3 mutableCopy];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3010000000;
  v18 = "";
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__NSTextListElement__createUpdatedTextTabsForTextTabs_markerLocation_listLocation___block_invoke;
  v14[3] = &unk_1E55C6838;
  *(double *)&v14[5] = a5;
  v14[4] = &v15;
  [a3 enumerateObjectsUsingBlock:v14];
  double v9 = [NSTextTab alloc];
  double v10 = [(NSTextTab *)v9 initWithTextAlignment:4 location:MEMORY[0x1E4F1CC08] options:a4];
  double v11 = [NSTextTab alloc];
  v12 = [(NSTextTab *)v11 initWithTextAlignment:4 location:MEMORY[0x1E4F1CC08] options:a5];
  v21[0] = v10;
  v21[1] = v12;
  objc_msgSend(v8, "replaceObjectsInRange:withObjectsFromArray:", v16[4], v16[5], objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 2));

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (NSAttributedString)attributedString
{
  objc_sync_enter(self);
  v3 = &selRef_initWithHTML_baseURL_documentAttributes_;
  if (![(NSTextListElement *)self isRepresentedElement]) {
    goto LABEL_3;
  }
  v36.receiver = self;
  v36.super_class = (Class)NSTextListElement;
  if ([(NSTextParagraph *)&v36 attributedString]) {
    goto LABEL_3;
  }
  if (self->_markerTextAttributesForTextList || (markerAttributes = self->_markerAttributes) == 0) {
    markerAttributes = [(NSTextListElement *)self _markerTextAttributesForTextList:self->_textList attributes:[(NSAttributedString *)self->_contents attributesAtIndex:0 effectiveRange:0]];
  }
  uint64_t v7 = -[NSDictionary objectForKeyedSubscript:](markerAttributes, "objectForKeyedSubscript:");
  uint64_t v8 = [(NSDictionary *)markerAttributes objectForKeyedSubscript:@"CTAdaptiveImageProvider"];
  if (v7 | v8)
  {
    v34 = (NSDictionary *)[(NSDictionary *)markerAttributes mutableCopy];
    if (v7) {
      [(NSDictionary *)v34 removeObjectForKey:@"NSAttachment"];
    }
    markerAttributes = v34;
    if (v8) {
      [(NSDictionary *)v34 removeObjectForKey:@"CTAdaptiveImageProvider"];
    }
  }
  else
  {
    v34 = 0;
  }
  markerTextAttributeOverrides = (uint64_t (**)(id, NSTextListElement *, NSDictionary *))self->_markerTextAttributeOverrides;
  if (markerTextAttributeOverrides
    && (uint64_t v10 = markerTextAttributeOverrides[2](markerTextAttributeOverrides, self, markerAttributes)) != 0)
  {
    int v11 = [(NSDictionary *)markerAttributes isEqualToDictionary:v10];
    if (!v11) {
      markerAttributes = (NSDictionary *)v10;
    }
  }
  else
  {
    int v11 = 1;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EDD49F70 attributes:markerAttributes];
  id v13 = -[NSDictionary objectForKeyedSubscript:](markerAttributes, "objectForKeyedSubscript:");
  BOOL v33 = [(NSTextListElement *)self _appendsParagraphSeparator];
  if (self->_contentsOnly
    && (v14 = [(NSTextElement *)self textContentManager],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v15 = [(NSTextContentManager *)v14 includesTextListMarkers] ^ 1;
  }
  else
  {
    int v15 = 1;
  }
  if (v13) {
    int v16 = v11;
  }
  else {
    int v16 = 1;
  }
  if (v16 != 1)
  {
    [v13 defaultTabInterval];
    if (v19 <= 0.0)
    {
      BOOL v18 = objc_msgSend((id)objc_msgSend(v13, "tabStops"), "count") == 0;
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  id v17 = [(NSTextListElement *)self _createConfiguredParagraphStyleForParagraphStyle:v13];
  if (!v17)
  {
LABEL_30:
    BOOL v18 = 0;
    goto LABEL_32;
  }

  BOOL v18 = 0;
  id v13 = v17;
LABEL_32:
  [v12 beginEditing];
  if (v15)
  {
    v32 = [(NSTextList *)self->_textList markerTextAttachment];
    id v20 = [(NSTextListElement *)self _markerString];
    uint64_t v31 = [v20 length];
    v21 = (void *)[v12 mutableString];
    if (v18) {
      v22 = @"%@";
    }
    else {
      v22 = @"\t%@\t";
    }
    objc_msgSend(v21, "appendFormat:", v22, v20);
    uint64_t v23 = !v18;
    if ([(NSTextList *)self->_textList listOptions])
    {
      for (i = [(NSTextListElement *)self parentElement];
            i;
            i = [(NSTextListElement *)i parentElement])
      {
        if ([(NSTextListElement *)i isRepresentedElement])
        {
          id v30 = [(NSTextListElement *)i _markerString];
          objc_msgSend((id)objc_msgSend(v12, "mutableString"), "replaceCharactersInRange:withString:", 1, 0, v30);
          v23 += [v30 length];
        }
      }
    }
    if (v32 && [v20 isEqualToString:@"\uFFFC"]) {
      objc_msgSend(v12, "addAttribute:value:range:", @"NSAttachment", v32, v23, v31);
    }
  }
  self->_int64_t contentsLocationOffset = [v12 length];
  if (v33) {
    objc_msgSend((id)objc_msgSend(v12, "mutableString"), "appendString:", @"\n");
  }
  objc_msgSend(v12, "addAttributes:range:", markerAttributes, 0, objc_msgSend(v12, "length"));
  if ([(NSAttributedString *)self->_contents length])
  {
    objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", objc_msgSend(v12, "length") - v33, 0, self->_contents);
  }
  else if (!v18)
  {
    id v24 = [(NSDictionary *)self->_markerAttributes objectForKeyedSubscript:@"NSFont"];
    if (v24)
    {
      if ((objc_msgSend(v24, "isEqual:", -[NSDictionary objectForKeyedSubscript:](markerAttributes, "objectForKeyedSubscript:", @"NSFont")) & 1) == 0)objc_msgSend(v12, "addAttribute:value:range:", @"NSFont", v24, self->_contentsLocationOffset - 1, 1); {
    }
      }
  }
  objc_msgSend(v12, "addAttribute:value:range:", @"NSParagraphStyle", v13, 0, objc_msgSend(v12, "length"));
  [v12 endEditing];

  [(NSTextParagraph *)self setAttributedString:v12];
  uint64_t v25 = [(NSTextContentManager *)[(NSTextElement *)self textContentManager] offsetFromLocation:[(NSTextRange *)[(NSTextElement *)self elementRange] location] toLocation:[(NSTextRange *)[(NSTextParagraph *)self paragraphContentRange] location]];
  v3 = &selRef_initWithHTML_baseURL_documentAttributes_;
  if (v25 >= 1)
  {
    int64_t contentsLocationOffset = self->_contentsLocationOffset;
    BOOL v27 = contentsLocationOffset < v25;
    int64_t v28 = contentsLocationOffset - v25;
    if (!v27) {
      self->_int64_t contentsLocationOffset = v28;
    }
  }
LABEL_3:
  objc_sync_exit(self);
  v4 = (objc_class *)v3[430];
  v35.receiver = self;
  v35.super_class = v4;
  return [(NSTextParagraph *)&v35 attributedString];
}

- (BOOL)isRepresentedElement
{
  return self->_contents || self->_markerAttributes != 0;
}

- (id)_markerString
{
  return [(NSTextList *)self->_textList markerForItemNumber:self->_itemNumber];
}

- (BOOL)_appendsParagraphSeparator
{
  v3 = [(NSTextElement *)self textContentManager];
  if (!objc_msgSend(-[NSTextRange endLocation](-[NSTextElement elementRange](self, "elementRange"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextContentManager documentRange](v3, "documentRange"), "endLocation")))return 1; {

  }
  return [(NSTextContentManager *)v3 containsExtraLineFragment];
}

- (NSArray)childElements
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMarkerTextAttributeOverrides:(id)a3
{
}

+ (id)_rootTextListElementFromAttributedString:(id)a3 atIndex:(int64_t)a4 options:(unint64_t)a5 effectiveRange:(_NSRange *)a6 textListElementInstantiationCallback:(id)a7
{
  char v9 = a5;
  if ([a3 length] <= (unint64_t)a4) {
    return 0;
  }
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributesAtIndex:effectiveRange:", a4, 0), "objectForKeyedSubscript:", @"NSParagraphStyle"), "textLists"), "firstObject");
  if (!result) {
    return result;
  }
  uint64_t v14 = [a3 rangeOfTextList:result atIndex:a4];
  if (!v15) {
    return 0;
  }
  unint64_t v16 = v14;
  unint64_t v17 = v15;
  unint64_t v22 = v14;
  unint64_t v23 = v15;
  do
  {
    BOOL v18 = objc_msgSend(a3, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSAttachment", v16, &v22, v16, v17);
    if (!v18) {
      break;
    }
    if ([v18 embeddingType] != 1) {
      break;
    }
    unint64_t v19 = v17 + v16;
    unint64_t v16 = v23 + v22;
    unint64_t v17 = v19 - (v23 + v22);
  }
  while (v19 != v23 + v22);
  unint64_t v22 = v16;
  if (v16 < v17 + v16)
  {
    unint64_t v20 = v16;
    while (1)
    {
      v21 = objc_msgSend(a3, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSAttachment", v20, &v22, v16, v17);
      if (v21)
      {
        if ([v21 embeddingType] == 1) {
          break;
        }
      }
      unint64_t v20 = v22 + v23;
      unint64_t v22 = v20;
      if (v20 >= v17 + v16) {
        goto LABEL_17;
      }
    }
    unint64_t v17 = v22 - v16;
  }
LABEL_17:
  id result = 0;
  if (a4 >= v16 && a4 - v16 < v17)
  {
    id result = (id)objc_msgSend(a1, "_createTextListElementFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", a3, v16, v17, -1, v9 & 1, a6, a7);
    if (result) {
      return result;
    }
  }
  return result;
}

+ (id)_createChildElementsFromAttributedString:(id)a3 inRange:(_NSRange)a4 indentLevel:(int64_t)a5 includesTextListMarkers:(BOOL)a6 effectiveRange:(_NSRange *)a7 textListElementInstantiationCallback:(id)a8
{
  BOOL v9 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v31.NSUInteger location = 0;
  v31.NSUInteger length = 0;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = a1;
  id v16 = a1;
  id v17 = a3;
  id v18 = a3;
  int64_t v19 = a5;
  int64_t v20 = a5;
  BOOL v21 = v9;
  uint64_t v22 = objc_msgSend(v16, "_createTextListElementFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", v18, location, length, v20, v9, &v31, a8);
  if (v22)
  {
    unint64_t v23 = (void *)v22;
    NSUInteger v24 = 0;
    NSUInteger v25 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v25 = v31.location;
        NSUInteger v24 = v31.length;
      }
      else
      {
        v32.NSUInteger location = v25;
        v32.NSUInteger length = v24;
        NSRange v26 = NSUnionRange(v32, v31);
        NSUInteger v25 = v26.location;
        NSUInteger v24 = v26.length;
      }
      [v30 addObject:v23];

      if (v31.length + v31.location < location || v31.length + v31.location - location >= length) {
        break;
      }
      unint64_t v23 = objc_msgSend(v15, "_createTextListElementFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", v17, v31.length + v31.location, location + length - (v31.length + v31.location), v19, v21, &v31, a8);
    }
    while (v23);
  }
  else
  {
    NSUInteger v24 = 0;
    NSUInteger v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v28 = v30;
  if ([v30 count])
  {
    if (a7)
    {
      a7->NSUInteger location = v25;
      a7->NSUInteger length = v24;
    }
  }
  else
  {

    return 0;
  }
  return v28;
}

+ (id)_createTextListElementFromAttributedString:(id)a3 inRange:(_NSRange)a4 indentLevel:(int64_t)a5 includesTextListMarkers:(BOOL)a6 effectiveRange:(_NSRange *)a7 textListElementInstantiationCallback:(id)a8
{
  BOOL v33 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v39 = 0;
  int64_t v13 = a5 + 1;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  objc_msgSend((id)objc_msgSend(a3, "string"), "getParagraphStart:end:contentsEnd:forRange:", &v39, &v37, &v38, a4.location, 1);
  v43.NSUInteger location = v39;
  v43.NSUInteger length = v37 - v39;
  v41.NSUInteger location = location;
  v41.NSUInteger length = length;
  NSRange v14 = NSIntersectionRange(v41, v43);
  NSRange v40 = v14;
  v44.NSUInteger location = v39;
  v44.NSUInteger length = v38 - v39;
  v42.NSUInteger location = location;
  v42.NSUInteger length = length;
  NSRange v15 = NSIntersectionRange(v42, v44);
  id v34 = a3;
  id v16 = (void *)[a3 attributesAtIndex:location effectiveRange:0];
  id v17 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", @"NSParagraphStyle"), "textLists");
  uint64_t v18 = [v17 count];
  if (v18 == v13)
  {
    int64_t v19 = 0;
    v36.NSUInteger location = 0;
    v36.NSUInteger length = 0;
    if (v14.length + v14.location >= location && v14.length + v14.location - location < length)
    {
      int64_t v19 = 0;
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "attributesAtIndex:effectiveRange:", v14.length + v14.location, 0), "objectForKeyedSubscript:", @"NSParagraphStyle"), "textLists"), "count") > (unint64_t)v13)int64_t v19 = objc_msgSend(a1, "_createChildElementsFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", v34, v14.length + v14.location, location + length - (v14.length + v14.location), v13, v33, &v36, a8); {
    }
      }
    char v35 = 0;
    if (v33)
    {
      NSUInteger v20 = objc_msgSend(a1, "_textListElementContentsRangeForRange:inAttributedString:hadMarker:", v15.location, v15.length, v34, &v35);
      NSUInteger v22 = v21;
    }
    else
    {
      NSUInteger v20 = v15.location;
      NSUInteger v22 = v15.length;
    }
    if (v22) {
      uint64_t v26 = objc_msgSend(v34, "attributedSubstringFromRange:", v20, v22);
    }
    else {
      uint64_t v26 = 0;
    }
    BOOL v27 = -[NSTextListElement initWithParentElement:textList:contents:markerAttributes:childElements:]([NSTextListElement alloc], "initWithParentElement:textList:contents:markerAttributes:childElements:", 0, [v17 lastObject], v26, v16, v19);
    if (v19)
    {
      NSUInteger v28 = v20 + v22 - v14.location;
      NSRange v40 = NSUnionRange(v14, v36);

      NSUInteger v29 = v14.location;
      unint64_t v23 = (void (**)(id, NSTextListElement *, id, NSUInteger, NSUInteger, NSUInteger, NSUInteger))a8;
    }
    else
    {
      NSUInteger v29 = v15.location;
      NSUInteger v28 = v15.length;
      BOOL v30 = v15.length == v22 && v15.location == v20;
      unint64_t v23 = (void (**)(id, NSTextListElement *, id, NSUInteger, NSUInteger, NSUInteger, NSUInteger))a8;
      if (!v30 && !v35)
      {
        NSUInteger v28 = v22;
        NSUInteger v29 = v20;
      }
    }
  }
  else
  {
    if (v18 <= v13) {
      return 0;
    }
    unint64_t v23 = (void (**)(id, NSTextListElement *, id, NSUInteger, NSUInteger, NSUInteger, NSUInteger))a8;
    NSUInteger v24 = objc_msgSend(a1, "_createChildElementsFromAttributedString:inRange:indentLevel:includesTextListMarkers:effectiveRange:textListElementInstantiationCallback:", v34, location, length, v13, v33, &v40, a8);
    if ([v24 count])
    {
      if (a5 < 0) {
        uint64_t v25 = [v17 firstObject];
      }
      else {
        uint64_t v25 = [v17 objectAtIndexedSubscript:a5];
      }
      NSUInteger v29 = v15.location;
      NSUInteger v28 = v15.length;
      BOOL v27 = (NSTextListElement *)[a1 _createElementWithChildElements:v24 textList:v25 nestingLevel:0];
    }
    else
    {
      BOOL v27 = 0;
      NSUInteger v29 = v15.location;
      NSUInteger v28 = v15.length;
    }
  }
  if (v27)
  {
    if (v23) {
      v23[2](v23, v27, v34, v40.location, v40.length, v29, v28);
    }
    if (a7) {
      *a7 = v40;
    }
  }
  return v27;
}

- (void)setParagraphContentRange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSTextListElement;
  -[NSTextParagraph setParagraphContentRange:](&v7, sel_setParagraphContentRange_);
  if (a3)
  {
    [a3 range];
    BOOL v6 = v5 == [(NSAttributedString *)self->_contents length];
  }
  else
  {
    BOOL v6 = 0;
  }
  self->_contentsOnly = v6;
}

+ (id)_createElementWithChildElements:(id)a3 textList:(id)a4 nestingLevel:(int64_t)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [objc_alloc((Class)a1) initWithParentElement:0 textList:a4 contents:0 markerAttributes:0 childElements:a3];
  uint64_t v10 = (void *)v9;
  if (a5 < 1)
  {
    if (a5 < 0)
    {
      v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
      uint64_t v14 = objc_opt_class();
      [v12 raise:v13, @"-[%@ %@] receiving negative nesting level %ld", v14, NSStringFromSelector(a2), a5 format];
    }
  }
  else
  {
    v16[0] = v9;
    int v11 = objc_msgSend(a1, "_createElementWithChildElements:textList:nestingLevel:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 1), a4, a5 - 1);

    return v11;
  }
  return v10;
}

- (void)_reparentWithTextListElement:(id)a3 itemNumber:(int64_t)a4
{
  objc_sync_enter(self);
  [(NSTextListElement *)self setParentElement:a3];
  self->_indentLevel = -1;
  self->_itemNumber = a4;
  [(NSTextParagraph *)self setAttributedString:0];

  objc_sync_exit(self);
}

- (NSTextListElement)initWithParentElement:(NSTextListElement *)parent textList:(NSTextList *)textList contents:(NSAttributedString *)contents markerAttributes:(NSDictionary *)markerAttributes childElements:(NSArray *)children
{
  if ((unint64_t)contents | (unint64_t)markerAttributes || [(NSArray *)children count])
  {
    v23.receiver = self;
    v23.super_class = (Class)NSTextListElement;
    uint64_t v14 = [(NSTextParagraph *)&v23 initWithAttributedString:0];
    if (v14)
    {
      objc_initWeak(&location, v14);
      [(NSTextListElement *)v14 setParentElement:parent];
      v14->_textList = textList;
      v14->_contents = (NSAttributedString *)[(NSAttributedString *)contents copy];
      v14->_markerAttributes = (NSDictionary *)[(NSDictionary *)markerAttributes copy];
      v14->_childElements = (NSArray *)[(NSArray *)children copy];
      NSRange v15 = [(NSTextList *)textList startingItemNumber];
      childElements = v14->_childElements;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __92__NSTextListElement_initWithParentElement_textList_contents_markerAttributes_childElements___block_invoke;
      v20[3] = &unk_1E55C6888;
      objc_copyWeak(v21, &location);
      v21[1] = v15;
      [(NSArray *)childElements enumerateObjectsUsingBlock:v20];
      v14->_indentLevel = -1;
      int v17 = [(NSTextElement *)v14 coalescingType];
      uint64_t v18 = v17 | 8u;
      if (!parent && !v14->_contents && [(NSArray *)v14->_childElements count]) {
        uint64_t v18 = v17 | 9 | objc_msgSend(-[NSArray lastObject](v14->_childElements, "lastObject"), "coalescingType") & 2;
      }
      [(NSTextElement *)v14 setCoalescingType:v18];
      objc_destroyWeak(v21);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    if ([(NSArray *)children count]) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextListElement.m", 435, @"%@: initializing with invalid arguments. contents:%@, markerAttributes:%@, childElements:%@", self, 0, 0, children);
    }

    return 0;
  }
  return v14;
}

- (void)setParentElement:(id)a3
{
}

uint64_t __92__NSTextListElement_initWithParentElement_textList_contents_markerAttributes_childElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 40) + a3;

  return [a2 _reparentWithTextListElement:Weak itemNumber:v7];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(__NSTextListElementEditedRangeValidator);
    +[NSTextContentStorage registerEditedRangeValidator:v2];
  }
}

uint64_t __83__NSTextListElement__createUpdatedTextTabsForTextTabs_markerLocation_listLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 location];
  if (v7 <= *(double *)(a1 + 40)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else {
    *a4 = 1;
  }
  return result;
}

+ (void)_fillTextListElement:(id)a3 toAttributedString:(id)a4
{
  uint64_t v7 = [a3 attributedString];
  if (v7) {
    [a4 appendAttributedString:v7];
  }
  uint64_t v8 = (void *)[a3 childElements];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__NSTextListElement__fillTextListElement_toAttributedString___block_invoke;
  v9[3] = &unk_1E55C6860;
  v9[4] = a1;
  v9[5] = a4;
  [v8 enumerateObjectsUsingBlock:v9];
}

uint64_t __61__NSTextListElement__fillTextListElement_toAttributedString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fillTextListElement:a2 toAttributedString:*(void *)(a1 + 40)];
}

+ (id)_formattedAttributedStringForRootTextListElement:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  [v5 beginEditing];
  [a1 _fillTextListElement:a3 toAttributedString:v5];
  [v5 endEditing];

  return v5;
}

+ (_NSRange)_textListElementContentsRangeForRange:(_NSRange)a3 inAttributedString:(id)a4 hadMarker:(BOOL *)a5
{
  int64_t length = a3.length;
  CFIndex location = a3.location;
  CFStringRef v8 = (const __CFString *)[a4 string];
  CFStringRef theString = v8;
  CFIndex v27 = location;
  int64_t v28 = length;
  CharactersPtr = CFStringGetCharactersPtr(v8);
  uint64_t v25 = CharactersPtr;
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
  }
  uint64_t v29 = 0;
  CFIndex v30 = 0;
  uint64_t v26 = CStringPtr;
  if (length > 0)
  {
    memset(v23, 0, sizeof(v23));
    if (CharactersPtr)
    {
      uint64_t v11 = 0;
      UniChar v12 = CharactersPtr[location];
    }
    else if (CStringPtr)
    {
      uint64_t v11 = 0;
      UniChar v12 = CStringPtr[location];
    }
    else
    {
      v13.int64_t length = (unint64_t)length >= 0x40 ? 64 : length;
      CFIndex v30 = v13.length;
      v13.CFIndex location = location;
      CFStringGetCharacters(v8, v13, (UniChar *)v23);
      uint64_t v11 = v29;
      UniChar v12 = *((_WORD *)v23 - v29);
    }
    if (v12 == 9 && (unint64_t)length >= 2)
    {
      uint64_t v15 = 1;
      do
      {
        CFIndex v16 = v28;
        if (v28 <= v15)
        {
          int64_t v18 = v15 + 1;
        }
        else
        {
          if (v25)
          {
            UniChar v17 = v25[v27 + v15];
          }
          else if (v26)
          {
            UniChar v17 = v26[v27 + v15];
          }
          else
          {
            if (v30 <= v15 || v11 > v15)
            {
              uint64_t v20 = v15 - 4;
              if (v15 < 4) {
                uint64_t v20 = 0;
              }
              if (v20 + 64 < v28) {
                CFIndex v16 = v20 + 64;
              }
              uint64_t v29 = v20;
              CFIndex v30 = v16;
              v32.CFIndex location = v27 + v20;
              v32.int64_t length = v16 - v20;
              CFStringGetCharacters(theString, v32, (UniChar *)v23);
              uint64_t v11 = v29;
            }
            UniChar v17 = *((_WORD *)v23 + v15 - v11);
          }
          int64_t v18 = v15 + 1;
          if (v17 == 9)
          {
            length -= v18;
            location += v18;
            *a5 = (unint64_t)v15 > 1;
            break;
          }
        }
        uint64_t v15 = v18;
      }
      while (v18 < length);
    }
  }
  NSUInteger v21 = location;
  NSUInteger v22 = length;
  result.int64_t length = v22;
  result.CFIndex location = v21;
  return result;
}

- (id)_markerTextAttributesForTextList:(id)a3 attributes:(id)a4
{
  markerTextAttributesForTextList = (uint64_t (**)(id, id))self->_markerTextAttributesForTextList;
  if (markerTextAttributesForTextList) {
    BOOL v6 = (void *)markerTextAttributesForTextList[2](markerTextAttributesForTextList, a3);
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v7 = [v6 count];
  uint64_t v8 = [a4 count];
  if (v7 < 1)
  {
    uint64_t v9 = 0;
  }
  else if (v8 < 1)
  {
    uint64_t v9 = 0;
    a4 = v6;
  }
  else
  {
    uint64_t v9 = (void *)[a4 mutableCopy];
    [v9 addEntriesFromDictionary:v6];
    a4 = v9;
  }
  if (![v6 objectForKeyedSubscript:@"NSFont"])
  {
    uint64_t v11 = (void *)[a4 objectForKeyedSubscript:@"NSFont"];
    UniChar v12 = (const __CTFontDescriptor *)[v11 fontDescriptor];
    if ((CTFontDescriptorGetSymbolicTraits() & 3) != 0)
    {
      CTFontDescriptorRef CopyWithSymbolicTraits = CTFontDescriptorCreateCopyWithSymbolicTraits(v12, 0, 3u);
      [v11 pointSize];
      uint64_t v14 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", CopyWithSymbolicTraits);
      CFRelease(CopyWithSymbolicTraits);
      if (v14)
      {
        if (([(UIFont *)v14 isEqual:v11] & 1) == 0)
        {
          if (!v9)
          {
            uint64_t v9 = (void *)[a4 mutableCopy];
            a4 = v9;
          }
          [v9 setObject:v14 forKeyedSubscript:@"NSFont"];
        }
      }
    }
  }
  return a4;
}

- (int64_t)indentLevel
{
  objc_sync_enter(self);
  int64_t v3 = [(NSTextListElement *)self _indentLevel];
  objc_sync_exit(self);
  return v3;
}

- (int64_t)itemNumber
{
  return self->_itemNumber;
}

- (int64_t)_contentsLocationOffset
{
  if (!self->_contentsOnly) {
    return 0;
  }
  [(NSTextListElement *)self attributedString];
  return self->_contentsLocationOffset;
}

- (BOOL)contentsOnly
{
  return self->_contentsOnly;
}

- (void)dealloc
{
  [(NSTextListElement *)self setParentElement:0];

  v3.receiver = self;
  v3.super_class = (Class)NSTextListElement;
  [(NSTextParagraph *)&v3 dealloc];
}

+ (NSTextListElement)textListElementWithContents:(NSAttributedString *)contents markerAttributes:(NSDictionary *)markerAttributes textList:(NSTextList *)textList childElements:(NSArray *)children
{
  id v10 = objc_alloc((Class)a1);
  if ([(NSAttributedString *)contents length]) {
    uint64_t v11 = contents;
  }
  else {
    uint64_t v11 = 0;
  }
  UniChar v12 = (void *)[v10 initWithParentElement:0 textList:textList contents:v11 markerAttributes:markerAttributes childElements:children];

  return (NSTextListElement *)v12;
}

+ (NSTextListElement)textListElementWithChildElements:(NSArray *)children textList:(NSTextList *)textList nestingLevel:(NSInteger)nestingLevel
{
  id v5 = (void *)[a1 _createElementWithChildElements:children textList:textList nestingLevel:nestingLevel];

  return (NSTextListElement *)v5;
}

- (id)markerAttributedString
{
  objc_super v3 = [(NSTextListElement *)self attributedString];
  if (!self->_contentsOnly) {
    return 0;
  }
  v4 = v3;
  unint64_t contentsLocationOffset = self->_contentsLocationOffset;
  if (contentsLocationOffset > [(NSAttributedString *)v3 length]) {
    return 0;
  }
  int64_t v7 = self->_contentsLocationOffset;

  return -[NSAttributedString attributedSubstringFromRange:](v4, "attributedSubstringFromRange:", 0, v7);
}

- (id)locationForCharacterIndex:(int64_t)a3 dataSourceLocationsOnly:(BOOL)a4 actualRange:(_NSRange *)a5
{
  int64_t v9 = [(NSTextListElement *)self _contentsLocationOffset];
  unint64_t v10 = [(NSAttributedString *)[(NSTextListElement *)self attributedString] length];
  if (v10 < a3) {
    return 0;
  }
  unint64_t v11 = v10;
  BOOL v12 = __OFSUB__(a3, v9);
  uint64_t v13 = a3 - v9;
  if (v13 < 0 == v12)
  {
    v17.receiver = self;
    v17.super_class = (Class)NSTextListElement;
    uint64_t v14 = [(NSTextParagraph *)&v17 locationForCharacterIndex:v13 dataSourceLocationsOnly:0 actualRange:0];
    if (!a5) {
      return v14;
    }
    goto LABEL_11;
  }
  if (a4) {
    return 0;
  }
  objc_sync_enter(self);
  uint64_t v14 = [(NSTextParagraph *)self _textElementLocationForCharacterIndex:a3];
  if (!v14)
  {
    uint64_t v14 = [[_NSTextElementLocation alloc] initWithTextElement:self baseLocation:[(NSTextRange *)[(NSTextElement *)self elementRange] location] offset:v13];
    [(NSTextParagraph *)self _setElementTextLocation:v14 forCharacterIndex:a3];
  }
  objc_sync_exit(self);
  if (a5)
  {
LABEL_11:
    if (v14)
    {
      if (v11 == a3) {
        NSUInteger v15 = 0;
      }
      else {
        a3 = [(NSString *)[(NSAttributedString *)[(NSTextListElement *)self attributedString] string] rangeOfComposedCharacterSequenceAtIndex:a3];
      }
      a5->CFIndex location = a3;
      a5->int64_t length = v15;
    }
  }
  return v14;
}

- (_NSRange)rangeForLocation:(id)a3 allowsTrailingEdge:(BOOL)a4
{
  long long v11 = xmmword_18E5F72A0;
  if (a3
    && ((BOOL v4 = a4,
         [(NSTextRange *)[(NSTextElement *)self elementRange] containsLocation:a3])
     || v4
     && objc_msgSend(-[NSTextRange endLocation](-[NSTextElement elementRange](self, "elementRange"), "endLocation"), "isEqual:", a3)))
  {
    int64_t v7 = [(NSTextContentManager *)[(NSTextElement *)self textContentManager] offsetFromLocation:[(NSTextRange *)[(NSTextElement *)self elementRange] location] toLocation:a3];
    int64_t v8 = [(NSTextListElement *)self _contentsLocationOffset] + v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (NSTextListElement *)[a3 textElement] == self) {
      v8 += [a3 offset];
    }
    [(NSTextListElement *)self locationForCharacterIndex:v8 dataSourceLocationsOnly:0 actualRange:&v11];
    NSUInteger v10 = *((void *)&v11 + 1);
    NSUInteger v9 = v11;
  }
  else
  {
    NSUInteger v10 = 0;
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.int64_t length = v10;
  result.CFIndex location = v9;
  return result;
}

- (NSTextListElement)textListElementWithChildElements:(id)a3
{
  objc_super v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentElement:textList:contents:markerAttributes:childElements:", -[NSTextListElement parentElement](self, "parentElement"), self->_textList, self->_contents, self->_markerAttributes, a3);

  return (NSTextListElement *)v3;
}

- (NSTextList)textList
{
  return (NSTextList *)objc_getProperty(self, a2, 160, 1);
}

- (NSAttributedString)contents
{
  return (NSAttributedString *)objc_getProperty(self, a2, 168, 1);
}

- (id)markerTextAttributeOverrides
{
  return objc_getProperty(self, a2, 184, 1);
}

- (NSDictionary)markerAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (id)markerTextAttributesForTextList
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setMarkerTextAttributesForTextList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end