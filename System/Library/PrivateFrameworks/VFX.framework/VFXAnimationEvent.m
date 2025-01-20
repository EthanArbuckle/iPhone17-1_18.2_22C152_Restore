@interface VFXAnimationEvent
+ (id)animationEventWithKeyTime:(float)a3 block:(id)a4;
- (VFXAnimationEvent)init;
- (double)time;
- (id)eventBlock;
- (void)dealloc;
- (void)setEventBlock:(id)a3;
- (void)setTime:(double)a3;
@end

@implementation VFXAnimationEvent

- (VFXAnimationEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXAnimationEvent;
  return [(VFXAnimationEvent *)&v3 init];
}

- (void)dealloc
{
  id eventBlock = self->_eventBlock;
  if (eventBlock) {
    _Block_release(eventBlock);
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXAnimationEvent;
  [(VFXAnimationEvent *)&v4 dealloc];
}

- (double)time
{
  return self->_eventTime;
}

- (void)setTime:(double)a3
{
  self->_eventTime = a3;
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)setEventBlock:(id)a3
{
  id eventBlock = self->_eventBlock;
  if (eventBlock) {
    _Block_release(eventBlock);
  }
  self->_id eventBlock = _Block_copy(a3);
}

+ (id)animationEventWithKeyTime:(float)a3 block:(id)a4
{
  id v6 = objc_alloc_init((Class)a1);
  objc_msgSend_setTime_(v6, v7, v8, v9, a3);
  objc_msgSend_setEventBlock_(v6, v10, (uint64_t)a4, v11);
  return v6;
}

@end