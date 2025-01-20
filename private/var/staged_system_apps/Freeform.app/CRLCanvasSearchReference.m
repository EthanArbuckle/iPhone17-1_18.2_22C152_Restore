@interface CRLCanvasSearchReference
+ (id)searchReferenceWithBoardItem:(id)a3 searchCanvasDelegate:(id)a4;
+ (id)searchReferenceWithBoardItem:(id)a3 selectionPath:(id)a4;
- (BOOL)autohideHighlight;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplaceable;
- (BOOL)isSelectable;
- (BOOL)pulseHighlight;
- (CGPoint)connectionLineUnscaledPoint;
- (CGPoint)searchReferencePoint;
- (CGRect)searchReferenceLayoutFrame;
- (CRLCanvasSearchReference)initWithBoardItem:(id)a3 selectionPath:(id)a4;
- (NSArray)findHighlights;
- (NSString)description;
- (NSUUID)uuid;
- (id)boardItem;
- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)infoForSelectionPath;
- (id)model;
- (id)selectionPath;
- (int64_t)compare:(id)a3;
- (int64_t)rootIndex;
- (unint64_t)hash;
- (void)setAutohideHighlight:(BOOL)a3;
- (void)setConnectionLineUnscaledPoint:(CGPoint)a3;
- (void)setFindHighlights:(id)a3;
- (void)setPulseHighlight:(BOOL)a3;
- (void)setRootIndex:(int64_t)a3;
- (void)setSearchReferenceLayoutFrame:(CGRect)a3;
- (void)setSearchReferencePoint:(CGPoint)a3;
- (void)setSelectionPath:(id)a3;
@end

@implementation CRLCanvasSearchReference

+ (id)searchReferenceWithBoardItem:(id)a3 searchCanvasDelegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[CRLCanvasSearchReference alloc] initWithBoardItem:v6 selectionPath:0];

  v8 = [v5 selectionPathForSearchReference:v7];

  [(CRLCanvasSearchReference *)v7 setSelectionPath:v8];

  return v7;
}

+ (id)searchReferenceWithBoardItem:(id)a3 selectionPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[CRLCanvasSearchReference alloc] initWithBoardItem:v6 selectionPath:v5];

  return v7;
}

- (CRLCanvasSearchReference)initWithBoardItem:(id)a3 selectionPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRLCanvasSearchReference;
  v9 = [(CRLCanvasSearchReference *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mBoardItem, a3);
    objc_storeStrong((id *)&v10->mSelectionPath, a4);
    v10->mRootIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = +[NSUUID UUID];
    mUuid = v10->mUuid;
    v10->mUuid = (NSUUID *)v11;
  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [(CRLCanvasSearchReference *)self boardItem];
  v4 = (char *)[v3 hash];
  id v5 = [(CRLCanvasSearchReference *)self uuid];
  id v6 = &v4[(void)[v5 hash]];

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CRLCanvasSearchReference *)self boardItem];
    id v6 = [v4 boardItem];
    if ([v5 isEqual:v6])
    {
      id v7 = [(CRLCanvasSearchReference *)self uuid];
      id v8 = [v4 uuid];
      unsigned __int8 v9 = [v7 isEqual:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [(CRLCanvasSearchReference *)self searchReferencePoint];
  double v6 = v5;
  [v4 searchReferencePoint];
  double v8 = v7;
  [(CRLCanvasSearchReference *)self searchReferencePoint];
  double v10 = v9;
  double v12 = v11;
  [v4 searchReferencePoint];
  if (v6 == v8)
  {
    if (v10 == v13)
    {
      v23 = [(CRLCanvasSearchReference *)self uuid];
      v24 = [v4 uuid];
      int64_t v21 = (int64_t)[v23 compare:v24];

      goto LABEL_11;
    }
    [(CRLCanvasSearchReference *)self searchReferencePoint];
    double v18 = v17;
    [v4 searchReferencePoint];
    BOOL v15 = v18 < v19;
    BOOL v16 = v18 <= v19;
  }
  else
  {
    BOOL v15 = v12 < v14;
    BOOL v16 = v12 <= v14;
  }
  uint64_t v20 = !v16;
  if (v15) {
    int64_t v21 = -1;
  }
  else {
    int64_t v21 = v20;
  }
LABEL_11:

  return v21;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  double v5 = [(CRLCanvasSearchReference *)self boardItem];
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  double v8 = [(CRLCanvasSearchReference *)self boardItem];
  double v9 = NSStringFromCGPoint(self->mSearchReferencePoint);
  double v10 = +[NSString stringWithFormat:@"<%@ %p info=<%@ %p>, frame=<%@>", v4, self, v7, v8, v9];

  return (NSString *)v10;
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101501FB8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010C08D8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101501FD8);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v4);
  }
  double v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasSearchReference commandForReplacingWithString:options:]");
  double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCanvasSearchReference.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:80 isFatal:0 description:"Cannot replace string on drawable"];

  return 0;
}

- (id)boardItem
{
  return self->mBoardItem;
}

- (id)model
{
  v2 = [(CRLCanvasSearchReference *)self boardItem];
  double v9 = sub_100246AC8(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLModel);

  return v9;
}

- (id)infoForSelectionPath
{
  return self->mBoardItem;
}

- (id)selectionPath
{
  mSelectionPath = self->mSelectionPath;
  if (!mSelectionPath)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501FF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C096C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101502018);
    }
    uint64_t v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v4);
    }
    uint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasSearchReference selectionPath]");
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCanvasSearchReference.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:97 isFatal:0 description:"Canvas search reference was not initialized with a selection path!"];

    mSelectionPath = self->mSelectionPath;
  }

  return mSelectionPath;
}

- (void)setSelectionPath:(id)a3
{
}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isReplaceable
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[CRLCanvasSearchReference alloc] initWithBoardItem:self->mBoardItem selectionPath:self->mSelectionPath];
  [(CRLCanvasSearchReference *)self searchReferencePoint];
  -[CRLCanvasSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
  [(CRLCanvasSearchReference *)self searchReferenceLayoutFrame];
  [(CRLCanvasSearchReference *)v4 setSearchReferenceLayoutFrame:"setSearchReferenceLayoutFrame:"];
  [(CRLCanvasSearchReference *)self connectionLineUnscaledPoint];
  -[CRLCanvasSearchReference setConnectionLineUnscaledPoint:](v4, "setConnectionLineUnscaledPoint:");
  return v4;
}

- (NSArray)findHighlights
{
  return self->mFindHighlights;
}

- (void)setFindHighlights:(id)a3
{
}

- (BOOL)autohideHighlight
{
  return self->mAutohideHighlight;
}

- (void)setAutohideHighlight:(BOOL)a3
{
  self->mAutohideHighlight = a3;
}

- (BOOL)pulseHighlight
{
  return self->mPulseHighlight;
}

- (void)setPulseHighlight:(BOOL)a3
{
  self->mPulseHighlight = a3;
}

- (CGPoint)searchReferencePoint
{
  double x = self->mSearchReferencePoint.x;
  double y = self->mSearchReferencePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSearchReferencePoint:(CGPoint)a3
{
  self->mSearchReferencePoint = a3;
}

- (CGRect)searchReferenceLayoutFrame
{
  double x = self->mSearchReferenceLayoutFrame.origin.x;
  double y = self->mSearchReferenceLayoutFrame.origin.y;
  double width = self->mSearchReferenceLayoutFrame.size.width;
  double height = self->mSearchReferenceLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSearchReferenceLayoutFrame:(CGRect)a3
{
  self->mSearchReferenceLayoutFrame = a3;
}

- (CGPoint)connectionLineUnscaledPoint
{
  double x = self->mConnectionLineUnscaledPoint.x;
  double y = self->mConnectionLineUnscaledPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setConnectionLineUnscaledPoint:(CGPoint)a3
{
  self->mConnectionLineUnscaledPoint = a3;
}

- (int64_t)rootIndex
{
  return self->mRootIndex;
}

- (void)setRootIndex:(int64_t)a3
{
  self->mRootIndedouble x = a3;
}

- (NSUUID)uuid
{
  return self->mUuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mUuid, 0);
  objc_storeStrong((id *)&self->mFindHighlights, 0);
  objc_storeStrong((id *)&self->mSelectionPath, 0);

  objc_storeStrong((id *)&self->mBoardItem, 0);
}

@end