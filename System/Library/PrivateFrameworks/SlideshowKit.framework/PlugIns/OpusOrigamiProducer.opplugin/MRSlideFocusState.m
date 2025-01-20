@interface MRSlideFocusState
- (BOOL)delegateIsTransitioningToo;
- (BOOL)isGoingToNext;
- (BOOL)isInZoomMode;
- (BOOL)isTransitioning;
- (MRAction)action;
- (MRLayer)delegate;
- (MRSlideInfo)nextSlideInfo;
- (MRSlideInfo)previousSlideInfo;
- (MRSlideInfo)slideInfo;
- (NSString)nextSlideID;
- (NSString)previousSlideID;
- (NSString)slideID;
- (unint64_t)currentFocuserIndex;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setCurrentFocuserIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateIsTransitioningToo:(BOOL)a3;
- (void)setIsGoingToNext:(BOOL)a3;
- (void)setIsInZoomMode:(BOOL)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setNextSlideID:(id)a3;
- (void)setNextSlideInfo:(id)a3;
- (void)setPreviousSlideID:(id)a3;
- (void)setPreviousSlideInfo:(id)a3;
- (void)setSlideID:(id)a3;
- (void)setSlideInfo:(id)a3;
@end

@implementation MRSlideFocusState

- (void)dealloc
{
  self->_delegate = 0;
  self->_action = 0;

  self->_slideInfo = 0;
  self->_slideID = 0;

  self->_previousSlideInfo = 0;
  self->_previousSlideID = 0;

  self->_nextSlideInfo = 0;
  self->_nextSlideID = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRSlideFocusState;
  [(MRSlideFocusState *)&v3 dealloc];
}

- (MRLayer)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (MRAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (MRSlideInfo)slideInfo
{
  return self->_slideInfo;
}

- (void)setSlideInfo:(id)a3
{
}

- (NSString)slideID
{
  return self->_slideID;
}

- (void)setSlideID:(id)a3
{
}

- (MRSlideInfo)previousSlideInfo
{
  return self->_previousSlideInfo;
}

- (void)setPreviousSlideInfo:(id)a3
{
}

- (NSString)previousSlideID
{
  return self->_previousSlideID;
}

- (void)setPreviousSlideID:(id)a3
{
}

- (MRSlideInfo)nextSlideInfo
{
  return self->_nextSlideInfo;
}

- (void)setNextSlideInfo:(id)a3
{
}

- (NSString)nextSlideID
{
  return self->_nextSlideID;
}

- (void)setNextSlideID:(id)a3
{
}

- (unint64_t)currentFocuserIndex
{
  return self->_currentFocuserIndex;
}

- (void)setCurrentFocuserIndex:(unint64_t)a3
{
  self->_currentFocuserIndex = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (BOOL)isGoingToNext
{
  return self->_isGoingToNext;
}

- (void)setIsGoingToNext:(BOOL)a3
{
  self->_isGoingToNext = a3;
}

- (BOOL)delegateIsTransitioningToo
{
  return self->_delegateIsTransitioningToo;
}

- (void)setDelegateIsTransitioningToo:(BOOL)a3
{
  self->_delegateIsTransitioningToo = a3;
}

- (BOOL)isInZoomMode
{
  return self->_isInZoomMode;
}

- (void)setIsInZoomMode:(BOOL)a3
{
  self->_isInZoomMode = a3;
}

@end