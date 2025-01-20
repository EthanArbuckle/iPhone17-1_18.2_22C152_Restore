@interface TSDCanvasSearchReference
+ (id)searchReferenceWithDrawableInfo:(id)a3;
- (BOOL)autohideHighlight;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplaceable;
- (BOOL)pulseHighlight;
- (CGPoint)searchReferencePoint;
- (NSArray)findHighlights;
- (NSString)description;
- (TSDCanvasSearchReference)initWithDrawableInfo:(id)a3;
- (TSKAnnotation)annotation;
- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)drawableInfo;
- (id)model;
- (id)selection;
- (void)dealloc;
- (void)setAnnotation:(id)a3;
- (void)setAutohideHighlight:(BOOL)a3;
- (void)setFindHighlights:(id)a3;
- (void)setPulseHighlight:(BOOL)a3;
- (void)setSearchReferencePoint:(CGPoint)a3;
@end

@implementation TSDCanvasSearchReference

+ (id)searchReferenceWithDrawableInfo:(id)a3
{
  v3 = [[TSDCanvasSearchReference alloc] initWithDrawableInfo:a3];

  return v3;
}

- (TSDCanvasSearchReference)initWithDrawableInfo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSDCanvasSearchReference;
  v4 = [(TSDCanvasSearchReference *)&v6 init];
  if (v4)
  {
    v4->mDrawableInfo = (TSDDrawableInfo *)a3;
    v4->mDocumentRoot = (TSKDocumentRoot *)objc_msgSend((id)objc_msgSend(a3, "context"), "documentRoot");
    v4->mCanvasSelection = (TSDCanvasSelection *)+[TSDCanvasEditor canvasSelectionWithInfos:](TSDCanvasEditor, "canvasSelectionWithInfos:", [MEMORY[0x263EFFA08] setWithObject:v4->mDrawableInfo]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasSearchReference;
  [(TSDCanvasSearchReference *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = objc_msgSend(-[TSDCanvasSearchReference drawableInfo](self, "drawableInfo"), "isEqual:", objc_msgSend(a3, "drawableInfo"));
    if (v5)
    {
      id v6 = [(TSDCanvasSearchReference *)self model];
      LOBYTE(v5) = v6 == (id)[a3 model];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  [(TSDCanvasSearchReference *)self drawableInfo];
  id v6 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@ %p info=<%@ %p>>", v5, self, NSStringFromClass(v6), -[TSDCanvasSearchReference drawableInfo](self, "drawableInfo")];
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDCanvasSearchReference commandForReplacingWithString:options:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSearchReference.m"), 80, @"Cannot replace string on drawable");
  return 0;
}

- (id)drawableInfo
{
  return self->mDrawableInfo;
}

- (id)model
{
  return self->mDocumentRoot;
}

- (id)selection
{
  return self->mCanvasSelection;
}

- (BOOL)isReplaceable
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[TSDCanvasSearchReference alloc] initWithDrawableInfo:self->mDrawableInfo];
  [(TSDCanvasSearchReference *)self searchReferencePoint];
  -[TSDCanvasSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
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

- (TSKAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
}

@end