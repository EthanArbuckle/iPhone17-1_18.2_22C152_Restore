@interface SBInteractiveScreenshotGestureMultiPartAnimation
- (SBInteractiveScreenshotGestureMultiPartAnimation)initWithCompletionHandler:(id)a3;
- (void)beginAnimationWithIdentifier:(id)a3;
- (void)completeAnimationWithIdentifier:(id)a3 finished:(BOOL)a4 retargeted:(BOOL)a5;
@end

@implementation SBInteractiveScreenshotGestureMultiPartAnimation

- (SBInteractiveScreenshotGestureMultiPartAnimation)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInteractiveScreenshotGestureMultiPartAnimation;
  v5 = [(SBInteractiveScreenshotGestureMultiPartAnimation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = (id)v6;
  }
  return v5;
}

- (void)beginAnimationWithIdentifier:(id)a3
{
  id v4 = a3;
  pendingAnimationIdentifiers = self->_pendingAnimationIdentifiers;
  id v8 = v4;
  if (!pendingAnimationIdentifiers)
  {
    uint64_t v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    v7 = self->_pendingAnimationIdentifiers;
    self->_pendingAnimationIdentifiers = v6;

    id v4 = v8;
    pendingAnimationIdentifiers = self->_pendingAnimationIdentifiers;
  }
  [(NSMutableArray *)pendingAnimationIdentifiers addObject:v4];
}

- (void)completeAnimationWithIdentifier:(id)a3 finished:(BOOL)a4 retargeted:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  pendingAnimationIdentifiers = self->_pendingAnimationIdentifiers;
  if (v5)
  {
    self->_pendingAnimationIdentifiers = 0;

    id v8 = (void (**)(void, void, void, void))MEMORY[0x1D948C7A0](self->_completionHandler);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    if (v8) {
      ((void (**)(void, SBInteractiveScreenshotGestureMultiPartAnimation *, void, uint64_t))v8)[2](v8, self, 0, 1);
    }
LABEL_8:

    goto LABEL_9;
  }
  if ([(NSMutableArray *)pendingAnimationIdentifiers count])
  {
    [(NSMutableArray *)self->_pendingAnimationIdentifiers removeObject:v12];
    if (![(NSMutableArray *)self->_pendingAnimationIdentifiers count])
    {
      v10 = self->_pendingAnimationIdentifiers;
      self->_pendingAnimationIdentifiers = 0;

      id v8 = (void (**)(void, void, void, void))MEMORY[0x1D948C7A0](self->_completionHandler);
      id v11 = self->_completionHandler;
      self->_id completionHandler = 0;

      if (v8) {
        ((void (**)(void, SBInteractiveScreenshotGestureMultiPartAnimation *, uint64_t, void))v8)[2](v8, self, 1, 0);
      }
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAnimationIdentifiers, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end