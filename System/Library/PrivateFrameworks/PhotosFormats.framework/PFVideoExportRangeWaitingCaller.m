@interface PFVideoExportRangeWaitingCaller
+ (id)waitingCallerWithRequestedRange:(_NSRange)a3;
- (BOOL)canResumeForRange:(_NSRange)a3;
- (BOOL)cancelled;
- (BOOL)requestedRangeIsAvailable;
- (OS_dispatch_semaphore)semaphore;
- (PFVideoExportRangeWaitingCaller)init;
- (_NSRange)requestedRange;
- (void)resume;
- (void)setCancelled:(BOOL)a3;
- (void)setRequestedRange:(_NSRange)a3;
- (void)setRequestedRangeIsAvailable:(BOOL)a3;
- (void)setSemaphore:(id)a3;
- (void)waitWithTimeout:(unint64_t)a3;
@end

@implementation PFVideoExportRangeWaitingCaller

- (void).cxx_destruct
{
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setRequestedRangeIsAvailable:(BOOL)a3
{
  self->_requestedRangeIsAvailable = a3;
}

- (BOOL)requestedRangeIsAvailable
{
  return self->_requestedRangeIsAvailable;
}

- (void)setRequestedRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_requestedRange, &v3, 16, 1, 0);
}

- (_NSRange)requestedRange
{
  objc_copyStruct(v4, &self->_requestedRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 16, 1);
}

- (void)resume
{
}

- (void)waitWithTimeout:(unint64_t)a3
{
}

- (BOOL)canResumeForRange:(_NSRange)a3
{
  NSRange v4 = NSIntersectionRange(self->_requestedRange, a3);
  return self->_requestedRange.location == v4.location && self->_requestedRange.length == v4.length;
}

- (PFVideoExportRangeWaitingCaller)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFVideoExportRangeWaitingCaller;
  NSUInteger v2 = [(PFVideoExportRangeWaitingCaller *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

+ (id)waitingCallerWithRequestedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = objc_opt_new();
  objc_msgSend(v5, "setRequestedRange:", location, length);

  return v5;
}

@end