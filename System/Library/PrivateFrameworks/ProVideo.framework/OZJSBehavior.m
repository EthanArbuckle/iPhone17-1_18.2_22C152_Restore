@interface OZJSBehavior
+ (id)behaviorWithBehavior:(void *)a3;
- (OZJSBehavior)initWithBehavior:(void *)a3;
- (void)behavior;
- (void)setBehavior:(void *)a3;
- (void)setStartTime:(float)a3;
@end

@implementation OZJSBehavior

+ (id)behaviorWithBehavior:(void *)a3
{
  v3 = [[OZJSBehavior alloc] initWithBehavior:a3];

  return v3;
}

- (OZJSBehavior)initWithBehavior:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OZJSBehavior;
  result = [(OZJSBehavior *)&v5 init];
  if (result) {
    result->_behavior = a3;
  }
  return result;
}

- (void)setStartTime:(float)a3
{
  memset(&v12, 0, sizeof(v12));
  PC_CMTimeMakeWithSecondsRoundToNearest(30, &v12, a3);
  (*(void (**)(void *__return_ptr))(*(void *)self->_behavior + 608))(v9);
  long long v7 = v10;
  uint64_t v8 = v11;
  CMTime v6 = v12;
  OZChannelObjectRootBase::setTimeExtent((OZChannelObjectRootBase *)((char *)self->_behavior + 56), (const PCTimeRange *)&v6, 0);
  behavior = (char *)self->_behavior;
  CMTime v5 = v12;
  OZChannelObjectRootBase::setTimeOffset((__n128 *)(behavior + 56), &v5, 0);
}

- (void)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(void *)a3
{
  self->_behavior = a3;
}

@end