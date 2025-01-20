@interface THHighlightControllerCachedAnnotation
- (AEMarginNote)marginNote;
- (BOOL)needsMarginNoteUpdate;
- (THAnnotation)annotation;
- (THHighlight)highlight;
- (THHighlightControllerCachedAnnotation)initWithAnnotation:(id)a3;
- (int)lastRenderedStyle;
- (void)dealloc;
- (void)setHighlight:(id)a3;
- (void)setLastRenderedStyle:(int)a3;
- (void)setMarginNote:(id)a3;
- (void)updateAnnotation:(id)a3;
@end

@implementation THHighlightControllerCachedAnnotation

- (THHighlightControllerCachedAnnotation)initWithAnnotation:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightControllerCachedAnnotation initWithAnnotation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm") lineNumber:193 description:@"This operation must only be performed on the main thread."];
  }
  v8.receiver = self;
  v8.super_class = (Class)THHighlightControllerCachedAnnotation;
  v5 = [(THHighlightControllerCachedAnnotation *)&v8 init];
  if (v5)
  {
    if (!a3) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THHighlightControllerCachedAnnotation initWithAnnotation:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"] lineNumber:196 description:[NSString stringWithUTF8String:"Invalid parameter not satisfying: %s"]
    }
    v6 = (THAnnotation *)a3;
    v5->mAnnotation = v6;
    v5->mLastRenderedStyle = [(THAnnotation *)v6 annotationStyle];
  }
  return v5;
}

- (void)dealloc
{
  self->mAnnotation = 0;
  self->mHighlight = 0;

  self->mMarginNote = 0;
  v3.receiver = self;
  v3.super_class = (Class)THHighlightControllerCachedAnnotation;
  [(THHighlightControllerCachedAnnotation *)&v3 dealloc];
}

- (void)updateAnnotation:(id)a3
{
  mAnnotation = self->mAnnotation;
  if (mAnnotation != a3 && -[THAnnotation isEqual:](mAnnotation, "isEqual:"))
  {

    self->mAnnotation = 0;
    v6 = (THAnnotation *)a3;
    self->mAnnotation = v6;
    mHighlight = self->mHighlight;
    [(THHighlight *)mHighlight setAnnotation:v6];
  }
}

- (BOOL)needsMarginNoteUpdate
{
  BOOL v2 = self->mMarginNote != 0;
  return v2 ^ ([(THAnnotation *)self->mAnnotation annotationNote] != 0);
}

- (THAnnotation)annotation
{
  return self->mAnnotation;
}

- (THHighlight)highlight
{
  return (THHighlight *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHighlight:(id)a3
{
}

- (AEMarginNote)marginNote
{
  return (AEMarginNote *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMarginNote:(id)a3
{
}

- (int)lastRenderedStyle
{
  return self->mLastRenderedStyle;
}

- (void)setLastRenderedStyle:(int)a3
{
  self->mLastRenderedStyle = a3;
}

@end