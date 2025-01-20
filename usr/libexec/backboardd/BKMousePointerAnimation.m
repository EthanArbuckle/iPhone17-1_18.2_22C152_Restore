@interface BKMousePointerAnimation
- (BKMousePointerAnimation)initWithRelativeTranslation:(CGPoint)a3 destinationPoint:(CGPoint)a4 animationDriver:(id)a5 updateRate:(int64_t)a6 applierBlock:(id)a7 completionBlock:(id)a8;
- (BOOL)isComplete;
- (CGPoint)destinationPoint;
- (void)displayLinkFired:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BKMousePointerAnimation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_applierBlock, 0);
  objc_storeStrong((id *)&self->_animationDriver, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (CGPoint)destinationPoint
{
  double x = self->_destinationPoint.x;
  double y = self->_destinationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isComplete
{
  return [(BKMousePointerAnimationDriver *)self->_animationDriver isComplete]
      || CACurrentMediaTime() - self->_initialTimestamp > 5.0;
}

- (void)stop
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  id v4 = objc_retainBlock(self->_completionBlock);
  if (v4)
  {
    id v6 = v4;
    (*((void (**)(id, void, BKMousePointerAnimation *))v4 + 2))(v4, 0, self);
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = 0;

    id v4 = v6;
  }
}

- (void)start
{
  self->_initialTimestamp = CACurrentMediaTime();
  if (self->_targetFPS >= 1)
  {
    v3 = +[CADisplayLink displayLinkWithTarget:self selector:"displayLinkFired:"];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:self->_targetFPS];
    v5 = self->_displayLink;
    id v6 = +[NSRunLoop mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:NSRunLoopCommonModes];
  }
}

- (void)displayLinkFired:(id)a3
{
  [a3 timestamp];
  [(BKMousePointerAnimationDriver *)self->_animationDriver applyForTime:v4 - self->_initialTimestamp];
  [(BKMousePointerAnimationDriver *)self->_animationDriver currentTranslation];
  CGFloat v7 = self->_lastSentOriginRelativeOffset.y + v6 - self->_lastSentOriginRelativeOffset.y;
  self->_lastSentOriginRelativeOffset.double x = self->_lastSentOriginRelativeOffset.x
                                        + v5
                                        - self->_lastSentOriginRelativeOffset.x;
  self->_lastSentOriginRelativeOffset.double y = v7;
  applierBlock = (uint64_t (**)(void))self->_applierBlock;
  if (applierBlock && (applierBlock[2]() & 1) == 0) {
    [(BKMousePointerAnimation *)self stop];
  }
  if ([(BKMousePointerAnimation *)self isComplete])
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    id v10 = objc_retainBlock(self->_completionBlock);
    if (v10)
    {
      id v12 = v10;
      (*((void (**)(id, uint64_t, BKMousePointerAnimation *))v10 + 2))(v10, 1, self);
      id completionBlock = self->_completionBlock;
      self->_id completionBlock = 0;

      id v10 = v12;
    }
  }
}

- (BKMousePointerAnimation)initWithRelativeTranslation:(CGPoint)a3 destinationPoint:(CGPoint)a4 animationDriver:(id)a5 updateRate:(int64_t)a6 applierBlock:(id)a7 completionBlock:(id)a8
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v14 = a3.y;
  CGFloat v15 = a3.x;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  v27.receiver = self;
  v27.super_class = (Class)BKMousePointerAnimation;
  v20 = [(BKMousePointerAnimation *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_initialTimestamp = 0.0;
    v20->_lastSentOriginRelativeOffset = CGPointZero;
    v20->_relativeTranslation.CGFloat x = v15;
    v20->_relativeTranslation.CGFloat y = v14;
    v20->_destinationPoint.CGFloat x = x;
    v20->_destinationPoint.CGFloat y = y;
    objc_storeStrong((id *)&v20->_animationDriver, a5);
    v21->_targetFPS = a6;
    id v22 = [v18 copy];
    id applierBlock = v21->_applierBlock;
    v21->_id applierBlock = v22;

    id v24 = [v19 copy];
    id completionBlock = v21->_completionBlock;
    v21->_id completionBlock = v24;
  }
  return v21;
}

@end