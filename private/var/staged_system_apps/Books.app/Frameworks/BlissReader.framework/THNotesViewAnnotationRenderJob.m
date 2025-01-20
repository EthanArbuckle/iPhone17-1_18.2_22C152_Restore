@interface THNotesViewAnnotationRenderJob
- (BOOL)cancelled;
- (BOOL)waitUntilFinishedWithTimeoutTime:(unint64_t)a3;
- (OS_dispatch_semaphore)semaphore;
- (THAnnotation)annotation;
- (THModelContentNode)contentNode;
- (THNotesViewRenderedAnnotation)renderedAnnotation;
- (int64_t)interfaceStyle;
- (unint64_t)maxLines;
- (void)dealloc;
- (void)didFinish;
- (void)setAnnotation:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setContentNode:(id)a3;
- (void)setInterfaceStyle:(int64_t)a3;
- (void)setMaxLines:(unint64_t)a3;
- (void)setRenderedAnnotation:(id)a3;
- (void)willStart;
@end

@implementation THNotesViewAnnotationRenderJob

- (void)dealloc
{
  mSemaphore = self->mSemaphore;
  if (mSemaphore) {
    dispatch_release(mSemaphore);
  }
  v4.receiver = self;
  v4.super_class = (Class)THNotesViewAnnotationRenderJob;
  [(THNotesViewAnnotationRenderJob *)&v4 dealloc];
}

- (BOOL)waitUntilFinishedWithTimeoutTime:(unint64_t)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderJob waitUntilFinishedWithTimeoutTime:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m") lineNumber:390 description:@"This operation must only be performed on the main thread."];
  }
  if (self->mCancelled) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderJob waitUntilFinishedWithTimeoutTime:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m") lineNumber:391 description:@"shouldn't wait on a cancelled job"];
  }
  return dispatch_semaphore_wait((dispatch_semaphore_t)self->mSemaphore, a3) == 0;
}

- (void)willStart
{
  if (!self->mSemaphore
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderJob willStart]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 398, @"Unexpected 2nd call to willStart!"), !self->mSemaphore))
  {
    self->mSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  }
}

- (void)didFinish
{
}

- (THAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
}

- (THModelContentNode)contentNode
{
  return self->mContentNode;
}

- (void)setContentNode:(id)a3
{
}

- (unint64_t)maxLines
{
  return self->mMaxLines;
}

- (void)setMaxLines:(unint64_t)a3
{
  self->mMaxLines = a3;
}

- (THNotesViewRenderedAnnotation)renderedAnnotation
{
  return self->mRenderedAnnotation;
}

- (void)setRenderedAnnotation:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->mSemaphore;
}

- (BOOL)cancelled
{
  return self->mCancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->mCancelled = a3;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

@end