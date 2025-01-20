@interface THNotesViewAnnotationRenderer
- (BOOL)doneRendering;
- (NSMutableArray)annotationQueue;
- (THNotesViewAnnotationRenderJob)currentRenderJob;
- (THNotesViewAnnotationRenderer)initWithDelegate:(id)a3;
- (THNotesViewAnnotationRendererDelegate)delegate;
- (id)p_newHighlightLayerForAnnotation:(id)a3 width:(double)a4 storage:(id)a5 text:(id)a6 range:(_NSRange)a7 interfaceStyle:(int64_t)a8 maxLines:(unint64_t)a9 documentRoot:(id)a10;
- (int64_t)interfaceStyle;
- (void)dealloc;
- (void)p_finishedRenderJob:(id)a3;
- (void)p_performRenderJob:(id)a3 accessController:(id)a4 location:(id)a5 width:(double)a6 editingWidth:(double)a7 text:(id)a8 range:(_NSRange)a9 interfaceStyle:(int64_t)a10;
- (void)p_startNextRenderJob;
- (void)p_startRenderJob:(id)a3;
- (void)renderAnnotations:(id)a3;
- (void)renderAnnotations:(id)a3 withUserInterfaceStyle:(int64_t)a4;
- (void)setAnnotationQueue:(id)a3;
- (void)setCurrentRenderJob:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterfaceStyle:(int64_t)a3;
- (void)waitWithTimeout:(double)a3 forCondition:(id)a4;
@end

@implementation THNotesViewAnnotationRenderer

- (THNotesViewAnnotationRenderer)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesViewAnnotationRenderer;
  result = [(THNotesViewAnnotationRenderer *)&v5 init];
  if (result) {
    result->mDelegate = (THNotesViewAnnotationRendererDelegate *)a3;
  }
  return result;
}

- (void)dealloc
{
  if (self->mCurrentRenderJob) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m") lineNumber:102 description:@"expected nil value for '%s'", "mCurrentRenderJob"];
  }

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewAnnotationRenderer;
  [(THNotesViewAnnotationRenderer *)&v3 dealloc];
}

- (void)renderAnnotations:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer renderAnnotations:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m") lineNumber:112 description:@"This operation must only be performed on the main thread."];
  }
  objc_super v5 = (NSMutableArray *)[a3 mutableCopy];
  mCurrentRenderJob = self->mCurrentRenderJob;
  if (mCurrentRenderJob)
  {
    [(THNotesViewAnnotationRenderJob *)mCurrentRenderJob setCancelled:1];
    [(THModelContentNode *)[(THNotesViewAnnotationRenderJob *)self->mCurrentRenderJob contentNode] cancelLoading];

    self->mCurrentRenderJob = 0;
  }

  self->mAnnotationQueue = v5;
  if (!self->mCurrentRenderJob)
  {
    [(THNotesViewAnnotationRenderer *)self p_startNextRenderJob];
  }
}

- (void)renderAnnotations:(id)a3 withUserInterfaceStyle:(int64_t)a4
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer renderAnnotations:withUserInterfaceStyle:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m") lineNumber:136 description:@"This operation must only be performed on the main thread."];
  }
  v7 = (NSMutableArray *)[a3 mutableCopy];
  mCurrentRenderJob = self->mCurrentRenderJob;
  if (mCurrentRenderJob)
  {
    [(THNotesViewAnnotationRenderJob *)mCurrentRenderJob setCancelled:1];
    [(THModelContentNode *)[(THNotesViewAnnotationRenderJob *)self->mCurrentRenderJob contentNode] cancelLoading];

    self->mCurrentRenderJob = 0;
  }

  self->mAnnotationQueue = v7;
  self->mInterfaceStyle = a4;
  if (!self->mCurrentRenderJob)
  {
    [(THNotesViewAnnotationRenderer *)self p_startNextRenderJob];
  }
}

- (void)waitWithTimeout:(double)a3 forCondition:(id)a4
{
  if (((*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2) & 1) == 0)
  {
    if (!self->mCurrentRenderJob) {
      [(THNotesViewAnnotationRenderer *)self p_startNextRenderJob];
    }
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    do
    {
      if (![(THNotesViewAnnotationRenderJob *)self->mCurrentRenderJob waitUntilFinishedWithTimeoutTime:v7])break; {
      [(THNotesViewAnnotationRenderer *)self p_finishedRenderJob:self->mCurrentRenderJob];
      }
    }
    while (!(*((unsigned int (**)(id))a4 + 2))(a4));
  }
}

- (BOOL)doneRendering
{
  return ![(NSMutableArray *)self->mAnnotationQueue count] && self->mCurrentRenderJob == 0;
}

- (void)p_startNextRenderJob
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer p_startNextRenderJob]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m") lineNumber:190 description:@"This operation must only be performed on the main thread."];
  }
  if (self->mCurrentRenderJob) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer p_startNextRenderJob]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m") lineNumber:191 description:@"expected nil value for '%s'", "mCurrentRenderJob"];
  }
  id v3 = [(NSMutableArray *)self->mAnnotationQueue firstObject];
  if (self->mDelegate)
  {
    id v4 = v3;
    if (v3)
    {
      objc_super v5 = objc_alloc_init(THNotesViewAnnotationRenderJob);
      self->mCurrentRenderJob = v5;
      [(THNotesViewAnnotationRenderJob *)v5 setAnnotation:v4];
      [(THNotesViewAnnotationRenderJob *)self->mCurrentRenderJob setInterfaceStyle:self->mInterfaceStyle];
      [(THNotesViewAnnotationRenderJob *)self->mCurrentRenderJob setContentNode:[(THNotesViewAnnotationRendererDelegate *)self->mDelegate annotationRenderer:self contentNodeForAnnotation:v4]];
      [(THNotesViewAnnotationRenderJob *)self->mCurrentRenderJob setMaxLines:[(THNotesViewAnnotationRendererDelegate *)self->mDelegate maxLinesForAnnotationRenderer:self]];
      [(NSMutableArray *)self->mAnnotationQueue removeObjectAtIndex:0];
      mCurrentRenderJob = self->mCurrentRenderJob;
      [(THNotesViewAnnotationRenderer *)self p_startRenderJob:mCurrentRenderJob];
    }
  }
  else
  {
    mAnnotationQueue = self->mAnnotationQueue;
    [(NSMutableArray *)mAnnotationQueue removeAllObjects];
  }
}

- (void)p_startRenderJob:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer p_startRenderJob:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m") lineNumber:215 description:@"This operation must only be performed on the main thread."];
  }
  if (self->mCurrentRenderJob != a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer p_startRenderJob:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m") lineNumber:216 description:@"should only start the current render job"];
  }
  [a3 willStart];
  [(THNotesViewAnnotationRendererDelegate *)self->mDelegate highlightWidthForAnnotationRenderer:self];
  uint64_t v6 = v5;
  [(THNotesViewAnnotationRendererDelegate *)self->mDelegate editingHighlightWidthForAnnotationRenderer:self];
  uint64_t v8 = v7;
  id v9 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationRepresentativeText");
  id v10 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStorageRange");
  uint64_t v12 = v11;
  id v13 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationLocation");
  id v14 = [a3 interfaceStyle];
  id v15 = [(THNotesViewAnnotationRendererDelegate *)self->mDelegate accessControllerForAnnotationRenderer:self];
  objc_msgSend(objc_msgSend(a3, "contentNode"), "startLoading");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_12FD38;
  v16[3] = &unk_459CC0;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = v15;
  v16[7] = v13;
  v16[9] = v6;
  v16[10] = v8;
  v16[8] = v9;
  v16[11] = v10;
  v16[12] = v12;
  v16[13] = v14;
  [+[TSKThreadDispatcher sharedInstance] dispatch:v16];
}

- (void)p_performRenderJob:(id)a3 accessController:(id)a4 location:(id)a5 width:(double)a6 editingWidth:(double)a7 text:(id)a8 range:(_NSRange)a9 interfaceStyle:(int64_t)a10
{
  NSUInteger length = a9.length;
  NSUInteger location = a9.location;
  id v18 = [(THNotesViewAnnotationRendererDelegate *)self->mDelegate annotationRenderer:self storageForAnnotationLocation:a5];
  if (([a3 cancelled] & 1) == 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_12FE98;
    v19[3] = &unk_459CE8;
    v19[4] = self;
    v19[5] = a3;
    *(double *)&v19[8] = a6;
    v19[6] = v18;
    v19[7] = a8;
    v19[9] = location;
    v19[10] = length;
    v19[11] = a10;
    *(double *)&v19[12] = a7;
    [a4 performRead:v19];
  }
}

- (void)p_finishedRenderJob:(id)a3
{
  if (([a3 cancelled] & 1) == 0 && self->mCurrentRenderJob == a3)
  {
    if ([a3 contentNode]) {
      -[THNotesViewAnnotationRendererDelegate annotationRenderer:didLoadContentNode:](self->mDelegate, "annotationRenderer:didLoadContentNode:", self, [a3 contentNode]);
    }
    if (([a3 cancelled] & 1) == 0)
    {
      id v5 = a3;

      self->mCurrentRenderJob = 0;
      [self->mDelegate annotationRenderer:self annotation:a3 renderedAnnotation:[a3 renderedAnnotation]];

      [(THNotesViewAnnotationRenderer *)self p_startNextRenderJob];
    }
  }
}

- (id)p_newHighlightLayerForAnnotation:(id)a3 width:(double)a4 storage:(id)a5 text:(id)a6 range:(_NSRange)a7 interfaceStyle:(int64_t)a8 maxLines:(unint64_t)a9 documentRoot:(id)a10
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  v16 = [[THNotesAnnotationLayer alloc] initWithAnnotation:a3 maxLines:a9 showHighlight:0];
  TSUScreenScale();
  -[THNotesAnnotationLayer setContentsScale:](v16, "setContentsScale:");
  -[THNotesAnnotationLayer setFrame:](v16, "setFrame:", 0.0, 0.0, a4, 100.0);
  if (a5) {
    -[THNoteCardStorageLayer setStorage:range:](v16, "setStorage:range:", a5, location, length);
  }
  else {
    -[THNoteCardStorageLayer setText:context:](v16, "setText:context:", a6, [a10 context]);
  }
  if (a8 == 1) {
    id v18 = +[TSUColor blackColor];
  }
  else {
    id v18 = +[TSUColor whiteColor];
  }
  -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:](v16, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:", [TSUFont systemFontOfSize:12.0], v18, 0, 0, 0.0, 1.0);
  [(THNotesAnnotationLayer *)v16 frame];
  double v20 = v19;
  double v22 = v21;
  -[THNotesAnnotationLayer sizeThatFits:](v16, "sizeThatFits:", v23, v24);
  -[THNotesAnnotationLayer setFrame:](v16, "setFrame:", v20, v22, v25, v26);
  [(THNotesAnnotationLayer *)v16 layoutIfNeeded];
  return v16;
}

- (THNotesViewAnnotationRendererDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THNotesViewAnnotationRendererDelegate *)a3;
}

- (NSMutableArray)annotationQueue
{
  return self->mAnnotationQueue;
}

- (void)setAnnotationQueue:(id)a3
{
}

- (THNotesViewAnnotationRenderJob)currentRenderJob
{
  return self->mCurrentRenderJob;
}

- (void)setCurrentRenderJob:(id)a3
{
  self->mCurrentRenderJob = (THNotesViewAnnotationRenderJob *)a3;
}

- (int64_t)interfaceStyle
{
  return self->mInterfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->mInterfaceStyle = a3;
}

@end