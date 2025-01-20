@interface TSWPSearchReference
+ (id)searchReferenceWithStorage:(id)a3 range:(_NSRange)a4;
+ (id)searchReferenceWithStorage:(id)a3 selection:(id)a4;
- (BOOL)autohideHighlight;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInsertionPoint;
- (BOOL)isReplaceable;
- (BOOL)isSelectable;
- (BOOL)pulseHighlight;
- (BOOL)refersToSmartField;
- (CGPoint)searchReferencePoint;
- (NSArray)findHighlights;
- (NSString)description;
- (TSKAnnotation)annotation;
- (TSWPSearchReference)initWithStorage:(id)a3 range:(_NSRange)a4;
- (TSWPSearchReference)initWithStorage:(id)a3 selection:(id)a4;
- (TSWPSelection)selection;
- (TSWPSmartField)smartField;
- (_NSRange)range;
- (_NSRange)smartFieldRange;
- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)searchReferenceEnd;
- (id)searchReferenceForReplacingWithString:(id)a3 options:(unint64_t)a4 authorCreatedWithCommand:(id *)a5;
- (id)searchReferenceStart;
- (id)storage;
- (int64_t)compare:(id)a3;
- (void)dealloc;
- (void)pUpdateSelection;
- (void)setAnnotation:(id)a3;
- (void)setAutohideHighlight:(BOOL)a3;
- (void)setFindHighlights:(id)a3;
- (void)setPulseHighlight:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
- (void)setRefersToSmartField:(BOOL)a3;
- (void)setSearchReferencePoint:(CGPoint)a3;
- (void)setSelection:(id)a3;
- (void)setSmartField:(id)a3;
- (void)setSmartFieldRange:(_NSRange)a3;
@end

@implementation TSWPSearchReference

+ (id)searchReferenceWithStorage:(id)a3 range:(_NSRange)a4
{
  v4 = -[TSWPSearchReference initWithStorage:range:]([TSWPSearchReference alloc], "initWithStorage:range:", a3, a4.location, a4.length);

  return v4;
}

+ (id)searchReferenceWithStorage:(id)a3 selection:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithStorage:a3 selection:a4];

  return v4;
}

- (TSWPSearchReference)initWithStorage:(id)a3 range:(_NSRange)a4
{
  v6 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a4.location, a4.length);

  return [(TSWPSearchReference *)self initWithStorage:a3 selection:v6];
}

- (TSWPSearchReference)initWithStorage:(id)a3 selection:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSWPSearchReference;
  v6 = [(TSWPSearchReference *)&v8 init];
  if (v6)
  {
    *((void *)v6 + 1) = a3;
    [v6 setSelection:a4];
    *(_OWORD *)(v6 + 24) = xmmword_223837AD0;
    *((void *)v6 + 6) = 0;
    objc_msgSend(v6, "setSearchReferencePoint:", 1.79769313e308, 1.79769313e308);
  }
  return (TSWPSearchReference *)v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPSearchReference;
  [(TSWPSearchReference *)&v3 dealloc];
}

- (void)pUpdateSelection
{
  if ([(TSWPSearchReference *)self refersToSmartField]) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = [(TSWPSelection *)[(TSWPSearchReference *)self selection] type];
  }
  if (v3 != [(TSWPSelection *)[(TSWPSearchReference *)self selection] type]
    || (uint64_t v4 = [(TSWPSearchReference *)self smartFieldRange],
        uint64_t v6 = v5,
        v4 != [(TSWPSelection *)self->_selection smartFieldRange])
    || v6 != v7)
  {
    selection = self->_selection;
    uint64_t v9 = [(TSWPSearchReference *)self smartFieldRange];
    v11 = -[TSWPSelection copyWithNewType:smartFieldRange:](selection, "copyWithNewType:smartFieldRange:", v3, v9, v10);

    self->_selection = v11;
  }
}

- (void)setSmartFieldRange:(_NSRange)a3
{
  if (self->_smartFieldRange.location != a3.location || self->_smartFieldRange.length != a3.length)
  {
    self->_smartFieldRange = a3;
    [(TSWPSearchReference *)self pUpdateSelection];
  }
}

- (_NSRange)smartFieldRange
{
  NSUInteger length = self->_smartFieldRange.length;
  NSUInteger location = self->_smartFieldRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)refersToSmartField
{
  return self->_refersToSmartField;
}

- (void)setRefersToSmartField:(BOOL)a3
{
  if (self->_refersToSmartField != a3)
  {
    self->_refersToSmartField = a3;
    -[TSWPSearchReference setSmartFieldRange:](self, "setSmartFieldRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    [(TSWPSearchReference *)self setSmartField:0];
    [(TSWPSearchReference *)self pUpdateSelection];
  }
}

- (TSWPSmartField)smartField
{
  return self->_smartField;
}

- (void)setSmartField:(id)a3
{
  if (self->_smartField != a3)
  {
    id v5 = a3;

    self->_smartField = (TSWPSmartField *)a3;
    [(TSWPSearchReference *)self pUpdateSelection];
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (!v4) {
    goto LABEL_8;
  }
  id v5 = [(TSWPSearchReference *)self storage];
  if (v5 != (id)[v4 storage]) {
    goto LABEL_8;
  }
  if (!-[TSWPSelection isEqual:](-[TSWPSearchReference selection](self, "selection"), "isEqual:", [v4 selection]))goto LABEL_8; {
  int v6 = [(TSWPSearchReference *)self refersToSmartField];
  }
  if (v6 != [v4 refersToSmartField]) {
    goto LABEL_8;
  }
  uint64_t v7 = [(TSWPSearchReference *)self smartFieldRange];
  uint64_t v9 = v8;
  BOOL v11 = 0;
  if (v7 != [v4 smartFieldRange] || v9 != v10) {
    goto LABEL_9;
  }
  v12 = [(TSWPSearchReference *)self smartField];
  if (v12 == (TSWPSmartField *)[v4 smartField])
  {
    v26 = [(TSWPSearchReference *)self annotation];
    BOOL v11 = v26 == (TSKAnnotation *)[v4 annotation];
  }
  else
  {
LABEL_8:
    BOOL v11 = 0;
  }
LABEL_9:
  [(TSWPSearchReference *)self searchReferencePoint];
  if (v14 != 1.79769313e308 || v13 != 1.79769313e308) {
    return v11;
  }
  [v4 searchReferencePoint];
  BOOL v18 = v17 != 1.79769313e308;
  if (v19 != 1.79769313e308) {
    BOOL v18 = 1;
  }
  BOOL result = v18 && v11;
  if (!v18 && v11)
  {
    [(TSWPSearchReference *)self searchReferencePoint];
    double v21 = v20;
    double v23 = v22;
    [v4 searchReferencePoint];
    return v23 == v25 && v21 == v24;
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  id v5 = [(TSWPSearchReference *)self storage];
  uint64_t v6 = [a3 storage];
  if (v5 == (id)v6)
  {
    unint64_t v11 = [(TSWPSelection *)[(TSWPSearchReference *)self selection] range];
    unint64_t v13 = v12;
    unint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "selection"), "range");
    int64_t v16 = 1;
    uint64_t v17 = -1;
    if (v13 >= v15) {
      uint64_t v17 = v15 < v13;
    }
    if (v14 >= v11) {
      int64_t v16 = v17;
    }
    if (v11 >= v14) {
      return v16;
    }
    else {
      return -1;
    }
  }
  else
  {
    uint64_t v7 = (void *)v6;
    int v8 = [v5 wpKind];
    if (v8 < (int)[v7 wpKind]) {
      return -1;
    }
    int v9 = [v7 wpKind];
    if (v9 < (int)[v5 wpKind]) {
      return 1;
    }
    unint64_t v18 = [v5 length];
    if (v18 >= [v7 length])
    {
      unint64_t v19 = [v7 length];
      return v19 < [v5 length];
    }
    else
    {
      return -1;
    }
  }
}

- (void)setRange:(_NSRange)a3
{
  uint64_t v4 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3.location, a3.length);
  [(TSWPSearchReference *)self setSelection:v4];
}

- (void)setSelection:(id)a3
{
  selection = self->_selection;
  if (selection != a3)
  {

    if ([(TSWPSearchReference *)self refersToSmartField]) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = [a3 type];
    }
    BOOL v7 = [(TSWPSearchReference *)self refersToSmartField];
    p_smartFieldRange = &self->_smartFieldRange;
    if (!v7) {
      p_smartFieldRange = (_NSRange *)MEMORY[0x263F7C7C8];
    }
    self->_selection = (TSWPSelection *)objc_msgSend(a3, "copyWithNewType:smartFieldRange:", v6, p_smartFieldRange->location, p_smartFieldRange->length);
  }
}

- (_NSRange)range
{
  v2 = [(TSWPSearchReference *)self selection];

  NSUInteger v3 = [(TSWPSelection *)v2 range];
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (BOOL)isInsertionPoint
{
  v2 = [(TSWPSearchReference *)self selection];

  return [(TSWPSelection *)v2 isInsertionPoint];
}

- (NSString)description
{
  NSUInteger v3 = NSString;
  id v4 = [(TSWPSearchReference *)self storage];
  [(TSWPSearchReference *)self searchReferencePoint];
  uint64_t v6 = v5;
  [(TSWPSearchReference *)self searchReferencePoint];
  uint64_t v8 = v7;
  int v9 = [(TSWPSearchReference *)self selection];
  if ([(TSWPSearchReference *)self refersToSmartField]) {
    uint64_t v10 = (__CFString *)[NSString stringWithFormat:@"Smart Field: %@", NSStringFromRange(self->_smartFieldRange)];
  }
  else {
    uint64_t v10 = &stru_26D688A48;
  }
  return (NSString *)[v3 stringWithFormat:@"[TSWPSearchReference %p] storage=%p, loc: %f,%f selection: %@, %@", self, v4, v6, v8, v9, v10];
}

- (id)storage
{
  return self->_storage;
}

- (id)searchReferenceForReplacingWithString:(id)a3 options:(unint64_t)a4 authorCreatedWithCommand:(id *)a5
{
  return 0;
}

- (id)searchReferenceStart
{
  storage = self->_storage;
  uint64_t v3 = [(TSWPSearchReference *)self range];

  return +[TSWPSearchReference searchReferenceWithStorage:range:](TSWPSearchReference, "searchReferenceWithStorage:range:", storage, v3, 0);
}

- (id)searchReferenceEnd
{
  storage = self->_storage;
  uint64_t v3 = [(TSWPSearchReference *)self range];

  return +[TSWPSearchReference searchReferenceWithStorage:range:](TSWPSearchReference, "searchReferenceWithStorage:range:", storage, v3 + v4, 0);
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (BOOL)isReplaceable
{
  uint64_t v3 = [(TSWPSearchReference *)self selection];
  uint64_t v4 = objc_msgSend(-[TSWPSearchReference storage](self, "storage"), "parentInfo");
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v5 isLocked]) {
        goto LABEL_12;
      }
      uint64_t v5 = (void *)[v5 parentInfo];
    }
    while (v5);
  }
  if (v3
    && (unint64_t v6 = [(TSWPSelection *)v3 range],
        uint64_t v8 = v7,
        objc_msgSend(-[TSWPSearchReference storage](self, "storage"), "hasSmartFieldsInRange:", v6, v7)))
  {
    uint64_t v9 = objc_msgSend(-[TSWPSearchReference storage](self, "storage"), "smartFieldAtCharIndex:attributeKind:effectiveRange:", v6, 6, v11);
    if (v9)
    {
      if (v11[0] >= v6)
      {
LABEL_12:
        LOBYTE(v9) = 0;
        return v9;
      }
      LOBYTE(v9) = v11[1] + v11[0] >= v6 + v8;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)isSelectable
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v3 = [(TSWPSearchReference *)self selection];
  uint64_t v4 = v3;
  int v5 = *((unsigned __int8 *)v17 + 24);
  if (*((unsigned char *)v17 + 24)) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = [(TSWPSelection *)v3 range];
    uint64_t v9 = v8;
    id v10 = [(TSWPSearchReference *)self storage];
    uint64_t v11 = [(TSWPSelection *)v4 range];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __35__TSWPSearchReference_isSelectable__block_invoke;
    v15[3] = &unk_2646B3030;
    v15[5] = v7;
    v15[6] = v9;
    v15[4] = &v16;
    objc_msgSend(v10, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v11, v12, v15);
    int v5 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v13 = v5 != 0;
  _Block_object_dispose(&v16, 8);
  return v13;
}

void *__35__TSWPSearchReference_isSelectable__block_invoke(void *result, uint64_t a2, unint64_t a3, uint64_t a4, unsigned char *a5)
{
  unint64_t v5 = result[5];
  if (v5 > a3 || result[6] + v5 < a3 + a4)
  {
    *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[TSWPSearchReference alloc] initWithStorage:self->_storage selection:[(TSWPSearchReference *)self selection]];
  [(TSWPSearchReference *)self searchReferencePoint];
  -[TSWPSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
  [(TSWPSearchReference *)v4 setRefersToSmartField:[(TSWPSearchReference *)self refersToSmartField]];
  uint64_t v5 = [(TSWPSearchReference *)self smartFieldRange];
  -[TSWPSearchReference setSmartFieldRange:](v4, "setSmartFieldRange:", v5, v6);
  [(TSWPSearchReference *)v4 setSmartField:[(TSWPSearchReference *)self smartField]];
  return v4;
}

- (TSWPSelection)selection
{
  return self->_selection;
}

- (NSArray)findHighlights
{
  return self->_findHighlights;
}

- (void)setFindHighlights:(id)a3
{
}

- (BOOL)autohideHighlight
{
  return self->_autohideHighlight;
}

- (void)setAutohideHighlight:(BOOL)a3
{
  self->_autohideHighlight = a3;
}

- (BOOL)pulseHighlight
{
  return self->_pulseHighlight;
}

- (void)setPulseHighlight:(BOOL)a3
{
  self->_pulseHighlight = a3;
}

- (CGPoint)searchReferencePoint
{
  double x = self->searchReferencePoint.x;
  double y = self->searchReferencePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSearchReferencePoint:(CGPoint)a3
{
  self->searchReferencePoint = a3;
}

- (TSKAnnotation)annotation
{
  return self->annotation;
}

- (void)setAnnotation:(id)a3
{
}

@end