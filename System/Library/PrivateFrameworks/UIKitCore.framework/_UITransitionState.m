@interface _UITransitionState
- (BOOL)isActive;
- (BOOL)isCompatibleWithTransitionInDirection:(int64_t)a3;
- (NSDate)beginDate;
- (_UITransitionState)initWithTransitionDirection:(int64_t)a3 completion:(id)a4;
- (id)description;
- (int64_t)transitionDirection;
- (void)cleanupWithFinishedState:(BOOL)a3 completedState:(BOOL)a4;
- (void)markBeginDate;
@end

@implementation _UITransitionState

- (_UITransitionState)initWithTransitionDirection:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UITransitionState;
  v7 = [(_UITransitionState *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_transitionDirection = a3;
    uint64_t v9 = [v6 copy];
    id completion = v8->_completion;
    v8->_id completion = (id)v9;
  }
  return v8;
}

- (BOOL)isActive
{
  return self->_completion != 0;
}

- (void)markBeginDate
{
  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  beginDate = self->_beginDate;
  self->_beginDate = v3;
}

- (void)cleanupWithFinishedState:(BOOL)a3 completedState:(BOOL)a4
{
  id completion = (void (**)(id, BOOL, BOOL))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, a4);
    id v6 = self->_completion;
    self->_id completion = 0;
  }
}

- (BOOL)isCompatibleWithTransitionInDirection:(int64_t)a3
{
  return [(_UITransitionState *)self effectiveTransitionDirection] == a3;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UITransitionState;
  v3 = [(_UITransitionState *)&v6 description];
  v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  objc_msgSend(v4, "appendFormat:", @"; transitionDirection: %ld>",
    [(_UITransitionState *)self transitionDirection]);
  return v4;
}

- (int64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end