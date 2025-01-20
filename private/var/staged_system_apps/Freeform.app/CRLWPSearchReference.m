@interface CRLWPSearchReference
+ (id)searchReferenceWithStorage:(id)a3 selection:(id)a4 searchCanvasDelegate:(id)a5;
+ (id)searchReferenceWithStorage:(id)a3 selection:(id)a4 selectionPath:(id)a5;
- (BOOL)alsoShowSelection;
- (BOOL)autohideHighlight;
- (BOOL)contains:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInsertionPoint;
- (BOOL)isReplaceable;
- (BOOL)isSelectable;
- (BOOL)pulseHighlight;
- (CGPoint)connectionLineUnscaledPoint;
- (CGPoint)searchReferencePoint;
- (CGRect)searchReferenceLayoutFrame;
- (CRLSelectionPath)selectionPath;
- (CRLWPSearchReference)initWithStorage:(id)a3 selection:(id)a4 searchCanvasDelegate:(id)a5;
- (CRLWPSearchReference)initWithStorage:(id)a3 selection:(id)a4 selectionPath:(id)a5;
- (CRLWPSearchReference)initWithStorage:(id)a3 selectionPath:(id)a4;
- (CRLWPSelection)selection;
- (NSArray)findHighlights;
- (NSString)description;
- (NSUUID)uuid;
- (_NSRange)range;
- (_TtC8Freeform12CRLWPStorage)storage;
- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4;
- (id)commandSelectionBehaviorForCommand:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)p_selectionForComparison;
- (id)p_selectionWithRange:(_NSRange)a3;
- (id)searchReferenceEnd;
- (id)searchReferenceForReplacingWithString:(id)a3 options:(unint64_t)a4;
- (id)searchReferenceStart;
- (int64_t)compare:(id)a3;
- (int64_t)rootIndex;
- (unint64_t)hash;
- (unint64_t)pulseAnimationStyle;
- (void)setAlsoShowSelection:(BOOL)a3;
- (void)setAutohideHighlight:(BOOL)a3;
- (void)setConnectionLineUnscaledPoint:(CGPoint)a3;
- (void)setFindHighlights:(id)a3;
- (void)setPulseAnimationStyle:(unint64_t)a3;
- (void)setPulseHighlight:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
- (void)setRootIndex:(int64_t)a3;
- (void)setSearchReferenceLayoutFrame:(CGRect)a3;
- (void)setSearchReferencePoint:(CGPoint)a3;
- (void)setSelection:(id)a3;
- (void)setSelectionPath:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation CRLWPSearchReference

+ (id)searchReferenceWithStorage:(id)a3 selection:(id)a4 searchCanvasDelegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithStorage:v10 selection:v9 searchCanvasDelegate:v8];

  return v11;
}

+ (id)searchReferenceWithStorage:(id)a3 selection:(id)a4 selectionPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithStorage:v10 selection:v9 selectionPath:v8];

  return v11;
}

- (CRLWPSearchReference)initWithStorage:(id)a3 selection:(id)a4 searchCanvasDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRLWPSearchReference;
  v12 = [(CRLWPSearchReference *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storage, a3);
    [(CRLWPSearchReference *)v13 setSelection:v10];
    v13->_rootIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_pulseAnimationStyle = 0;
    if (v11)
    {
      uint64_t v14 = [v11 selectionPathForSearchReference:v13];
      selectionPath = v13->_selectionPath;
      v13->_selectionPath = (CRLSelectionPath *)v14;
    }
  }

  return v13;
}

- (CRLWPSearchReference)initWithStorage:(id)a3 selectionPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CRLWPSearchReference;
  id v9 = [(CRLWPSearchReference *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    objc_storeStrong((id *)&v10->_selectionPath, a4);
    id v11 = (objc_class *)objc_opt_class();
    v12 = [v8 mostSpecificSelectionOfClass:0];
    v13 = sub_10024715C(v11, v12);

    [(CRLWPSearchReference *)v10 setSelection:v13];
    v10->_rootIndex = 0x7FFFFFFFFFFFFFFFLL;
    v10->_pulseAnimationStyle = 0;
  }
  return v10;
}

- (CRLWPSearchReference)initWithStorage:(id)a3 selection:(id)a4 selectionPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CRLWPSearchReference;
  v12 = [(CRLWPSearchReference *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storage, a3);
    if (v11)
    {
      uint64_t v14 = [v11 orderedSelections];
      unsigned __int8 v15 = [v14 containsObject:v10];

      if ((v15 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E7D80);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101094FF8();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E7DA0);
        }
        v16 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v16);
        }
        objc_super v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearchReference initWithStorage:selection:selectionPath:]");
        v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearchReference.m"];
        +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:92 isFatal:0 description:"Search reference selection path must contain the text selection if selection path is provided"];
      }
      objc_storeStrong((id *)&v13->_selectionPath, a5);
    }
    [(CRLWPSearchReference *)v13 setSelection:v10];
    v13->_rootIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_pulseAnimationStyle = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);

  if (v6)
  {
    id v7 = [(CRLWPSearchReference *)self storage];
    id v8 = [v6 storage];
    if (v7 == v8)
    {
      id v10 = [(CRLWPSearchReference *)self selection];
      id v11 = [v6 selection];
      if ([v10 isEqual:v11]
        && ([(CRLWPSearchReference *)self searchReferencePoint],
            double v13 = v12,
            double v15 = v14,
            [v6 searchReferencePoint],
            sub_1000640F4(v13, v15, v16, v17)))
      {
        id v18 = [(CRLWPSearchReference *)self pulseAnimationStyle];
        BOOL v9 = v18 == [v6 pulseAnimationStyle];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);

  id v7 = [(CRLWPSearchReference *)self storage];
  id v8 = [v6 storage];
  if (v7 == v8)
  {
    id v10 = (char *)[(CRLWPSearchReference *)self range];
    uint64_t v12 = v11;
    double v13 = (char *)[v6 range];
    BOOL v9 = v10 <= v13 && &v10[v12] >= &v13[v14];
    id v8 = v7;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(CRLHasher);
  id v4 = [(CRLWPSearchReference *)self storage];
  [(CRLHasher *)v3 addObject:v4];

  uint64_t v5 = [(CRLWPSearchReference *)self selection];
  [(CRLHasher *)v3 addObject:v5];

  [(CRLHasher *)v3 addInteger:[(CRLWPSearchReference *)self pulseAnimationStyle]];
  unint64_t v6 = [(CRLHasher *)v3 hashValue];

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [v4 searchReferencePoint];
  double v6 = v5;
  [(CRLWPSearchReference *)self searchReferencePoint];
  if (v6 <= v7)
  {
    if (v6 < v7)
    {
      int64_t v8 = 1;
    }
    else
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = sub_1002469D0(v9, v4);
      uint64_t v11 = (void *)v10;
      if (!v10) {
        goto LABEL_9;
      }
      uint64_t v12 = [(CRLWPSearchReference *)self storage];
      if (!v12) {
        goto LABEL_9;
      }
      double v13 = (void *)v12;
      uint64_t v14 = [(CRLWPSearchReference *)self storage];
      double v15 = [v11 storage];

      if (v14 == v15)
      {
        double v17 = [(CRLWPSearchReference *)self p_selectionForComparison];
        uint64_t v18 = [v11 p_selectionForComparison];
        v19 = (void *)v18;
        int64_t v8 = 0;
        if (v17 && v18) {
          int64_t v8 = (int64_t)[v17 compare:v18];
        }
      }
      else
      {
LABEL_9:
        int64_t v8 = 0;
      }
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (void)setSelection:(id)a3
{
  id v4 = (CRLWPSelection *)a3;
  selection = self->_selection;
  if (selection != v4)
  {
    if (selection
      && ([(CRLWPSelection *)v4 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7DC0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101095080();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7DE0);
      }
      double v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v6);
      }
      double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearchReference setSelection:]");
      int64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearchReference.m"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:170 isFatal:0 description:"New selection is not the same class as the old selection."];
    }
    uint64_t v9 = -[CRLWPSelection copyWithNewType:smartFieldRange:](v4, "copyWithNewType:smartFieldRange:", [(CRLWPSelection *)v4 type], 0x7FFFFFFFFFFFFFFFLL, 0);
    uint64_t v10 = self->_selection;
    if (!v10) {
      uint64_t v10 = v4;
    }
    selectionPath = self->_selectionPath;
    uint64_t v12 = v10;
    double v13 = [(CRLSelectionPath *)selectionPath selectionPathReplacingMostSpecificLocationOfSelection:v12 withSelection:v9];
    uint64_t v14 = self->_selectionPath;
    self->_selectionPath = v13;
    double v15 = v13;

    double v16 = self->_selection;
    self->_selection = v9;
    double v17 = v9;
  }
}

- (_NSRange)range
{
  v2 = [(CRLWPSearchReference *)self selection];
  id v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  -[CRLWPSearchReference p_selectionWithRange:](self, "p_selectionWithRange:", a3.location, a3.length);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CRLWPSearchReference *)self setSelection:v4];
}

- (BOOL)isInsertionPoint
{
  v2 = [(CRLWPSearchReference *)self selection];
  unsigned __int8 v3 = [v2 isInsertionPoint];

  return v3;
}

- (NSString)description
{
  unsigned __int8 v3 = [(CRLWPSearchReference *)self storage];
  [(CRLWPSearchReference *)self searchReferencePoint];
  uint64_t v5 = v4;
  [(CRLWPSearchReference *)self searchReferencePoint];
  uint64_t v7 = v6;
  int64_t v8 = [(CRLWPSearchReference *)self selection];
  uint64_t v9 = +[NSString stringWithFormat:@"[CRLWPSearchReference %p] storage=%p, loc: %f,%f selection: %@", self, v3, v5, v7, v8];

  return (NSString *)v9;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  return self->_storage;
}

- (id)searchReferenceForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(CRLWPSearchReference *)self range];
  id v7 = [v5 length];

  int64_t v8 = -[CRLWPSearchReference p_selectionWithRange:](self, "p_selectionWithRange:", v6, v7);
  uint64_t v9 = [(CRLWPSearchReference *)self selectionPath];
  uint64_t v10 = [(CRLWPSearchReference *)self selection];
  uint64_t v11 = [v9 selectionPathReplacingMostSpecificLocationOfSelection:v10 withSelection:v8];

  uint64_t v12 = +[CRLWPSearchReference searchReferenceWithStorage:self->_storage selection:v8 selectionPath:v11];
  [v12 setRootIndex:[self rootIndex]];

  return v12;
}

- (id)searchReferenceStart
{
  unsigned __int8 v3 = -[CRLWPSearchReference p_selectionWithRange:](self, "p_selectionWithRange:", [(CRLWPSearchReference *)self range], 0);
  uint64_t v4 = [(CRLWPSearchReference *)self selectionPath];
  id v5 = [(CRLWPSearchReference *)self selection];
  id v6 = [v4 selectionPathReplacingMostSpecificLocationOfSelection:v5 withSelection:v3];

  id v7 = +[CRLWPSearchReference searchReferenceWithStorage:self->_storage selection:v3 selectionPath:v6];
  [v7 setRootIndex:[self rootIndex]];

  return v7;
}

- (id)searchReferenceEnd
{
  unsigned __int8 v3 = (char *)[(CRLWPSearchReference *)self range];
  id v5 = -[CRLWPSearchReference p_selectionWithRange:](self, "p_selectionWithRange:", &v3[v4], 0);
  id v6 = [(CRLWPSearchReference *)self selectionPath];
  id v7 = [(CRLWPSearchReference *)self selection];
  int64_t v8 = [v6 selectionPathReplacingMostSpecificLocationOfSelection:v7 withSelection:v5];

  uint64_t v9 = +[CRLWPSearchReference searchReferenceWithStorage:self->_storage selection:v5 selectionPath:v8];
  [v9 setRootIndex:[self rootIndex]];

  return v9;
}

- (id)p_selectionWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(CRLWPSearchReference *)self selection];
  id v6 = objc_opt_class();

  return [v6 selectionWithRange:location, length];
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CRLWPSearchReference *)self storage];
  if ([(CRLWPSearchReference *)self isReplaceable])
  {
    int64_t v8 = [v7 string];
    id v9 = [(CRLWPSearchReference *)self range];
    uint64_t v11 = [v6 crl_stringByCapitalizingToMatchString:v8 range:v9 searchOptions:a4];

    uint64_t v12 = objc_opt_class();
    double v13 = [v7 parentInfo];
    uint64_t v14 = sub_1002469D0(v12, v13);

    if (v14)
    {
      double v15 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
      id v16 = [(CRLWPSearchReference *)self range];
      uint64_t v18 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v15, "initWithShapeItem:range:text:", v14, v16, v17, v11);
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v11 = v6;
  }

  return v18;
}

- (id)commandSelectionBehaviorForCommand:(id)a3
{
  return 0;
}

- (CRLSelectionPath)selectionPath
{
  selectionPath = self->_selectionPath;
  if (!selectionPath)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7E00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101095108();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7E20);
    }
    uint64_t v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearchReference selectionPath]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearchReference.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:274 isFatal:0 description:"Selection path must be provided on initialization for any search reference that is asked for one."];

    selectionPath = self->_selectionPath;
  }

  return selectionPath;
}

- (BOOL)isReplaceable
{
  unsigned __int8 v3 = [(CRLWPSearchReference *)self storage];
  unsigned int v4 = [v3 canUserReplaceText];

  if (!v4) {
    return 0;
  }
  id v5 = [(CRLWPSearchReference *)self selection];

  if (!v5) {
    return 1;
  }
  id v6 = [(CRLWPSearchReference *)self selection];
  id v7 = [v6 range];
  uint64_t v9 = v8;

  uint64_t v10 = [(CRLWPSearchReference *)self storage];
  unsigned int v11 = [v10 hasSmartFieldsInRange:v7, v9];

  if (!v11) {
    return 1;
  }
  unint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v12 = [(CRLWPSearchReference *)self storage];
  double v13 = [v12 smartFieldAtCharIndex:v7 attributeKind:6 effectiveRange:&v16];

  BOOL v14 = v13 && v16 < (unint64_t)v7 && v17 + v16 >= (unint64_t)v7 + v9;
  return v14;
}

- (BOOL)isSelectable
{
  v2 = [(CRLWPSearchReference *)self storage];
  unsigned __int8 v3 = [v2 parentInfo];

  if (!v3) {
    return 1;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 locked]) {
      break;
    }
    uint64_t v4 = [v3 parentInfo];

    unsigned __int8 v3 = (void *)v4;
    if (!v4)
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
  }
  BOOL v5 = 0;
LABEL_8:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CRLWPSearchReference allocWithZone:a3];
  storage = self->_storage;
  id v6 = [(CRLWPSearchReference *)self selection];
  id v7 = [(CRLWPSearchReference *)v4 initWithStorage:storage selection:v6 selectionPath:self->_selectionPath];

  [(CRLWPSearchReference *)self searchReferencePoint];
  -[CRLWPSearchReference setSearchReferencePoint:](v7, "setSearchReferencePoint:");
  [(CRLWPSearchReference *)self connectionLineUnscaledPoint];
  -[CRLWPSearchReference setConnectionLineUnscaledPoint:](v7, "setConnectionLineUnscaledPoint:");
  [(CRLWPSearchReference *)v7 setPulseAnimationStyle:[(CRLWPSearchReference *)self pulseAnimationStyle]];
  [(CRLWPSearchReference *)v7 setAutohideHighlight:[(CRLWPSearchReference *)self autohideHighlight]];
  uint64_t v8 = [(CRLWPSearchReference *)self findHighlights];
  [(CRLWPSearchReference *)v7 setFindHighlights:v8];

  [(CRLWPSearchReference *)v7 setPulseHighlight:[(CRLWPSearchReference *)self pulseHighlight]];
  [(CRLWPSearchReference *)v7 setRootIndex:[(CRLWPSearchReference *)self rootIndex]];
  return v7;
}

- (id)p_selectionForComparison
{
  if (self->_selectionPath)
  {
    v2 = [(CRLWPSearchReference *)self selectionPath];
    unsigned __int8 v3 = [v2 mostSpecificSelectionOfClass:objc_opt_class()];
  }
  else
  {
    unsigned __int8 v3 = [(CRLWPSearchReference *)self selection];
  }

  return v3;
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

- (int64_t)rootIndex
{
  return self->_rootIndex;
}

- (void)setRootIndex:(int64_t)a3
{
  self->_rootIndex = a3;
}

- (CGPoint)searchReferencePoint
{
  double x = self->_searchReferencePoint.x;
  double y = self->_searchReferencePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSearchReferencePoint:(CGPoint)a3
{
  self->_searchReferencePoint = a3;
}

- (CGRect)searchReferenceLayoutFrame
{
  double x = self->_searchReferenceLayoutFrame.origin.x;
  double y = self->_searchReferenceLayoutFrame.origin.y;
  double width = self->_searchReferenceLayoutFrame.size.width;
  double height = self->_searchReferenceLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSearchReferenceLayoutFrame:(CGRect)a3
{
  self->_searchReferenceLayoutFrame = a3;
}

- (CGPoint)connectionLineUnscaledPoint
{
  double x = self->_connectionLineUnscaledPoint.x;
  double y = self->_connectionLineUnscaledPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setConnectionLineUnscaledPoint:(CGPoint)a3
{
  self->_connectionLineUnscaledPoint = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (CRLWPSelection)selection
{
  return self->_selection;
}

- (unint64_t)pulseAnimationStyle
{
  return self->_pulseAnimationStyle;
}

- (void)setPulseAnimationStyle:(unint64_t)a3
{
  self->_pulseAnimationStyle = a3;
}

- (BOOL)alsoShowSelection
{
  return self->_alsoShowSelection;
}

- (void)setAlsoShowSelection:(BOOL)a3
{
  self->_alsoShowSelection = a3;
}

- (void)setStorage:(id)a3
{
}

- (void)setSelectionPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionPath, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_findHighlights, 0);
}

@end