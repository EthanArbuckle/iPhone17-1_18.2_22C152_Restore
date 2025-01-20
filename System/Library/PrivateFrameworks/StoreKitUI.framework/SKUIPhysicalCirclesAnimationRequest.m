@interface SKUIPhysicalCirclesAnimationRequest
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)animationType;
- (void)_setCompletionBlock:(id)a3;
- (void)finishAnimation;
- (void)setAnimationType:(int64_t)a3;
@end

@implementation SKUIPhysicalCirclesAnimationRequest

- (void)finishAnimation
{
  completionBlock = (void (**)(id, SEL))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, a2);
    id v4 = self->_completionBlock;
    self->_completionBlock = 0;
  }
}

- (void)_setCompletionBlock:(id)a3
{
  if (self->_completionBlock != a3)
  {
    id v4 = (void *)[a3 copy];
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = v4;
    MEMORY[0x1F41817F8](v4, completionBlock);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setAnimationType:self->_animationType];
  [v4 _setCompletionBlock:self->_completionBlock];
  return v4;
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (void).cxx_destruct
{
}

@end