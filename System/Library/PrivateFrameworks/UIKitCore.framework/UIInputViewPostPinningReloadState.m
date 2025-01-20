@interface UIInputViewPostPinningReloadState
+ (id)stateWithResponder:(id)a3;
- (UIResponder)responderToReload;
- (void)dealloc;
- (void)setResponderToReload:(id)a3;
@end

@implementation UIInputViewPostPinningReloadState

- (void)dealloc
{
  [(UIInputViewPostPinningReloadState *)self setResponderToReload:0];
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewPostPinningReloadState;
  [(UIInputViewPostPinningReloadState *)&v3 dealloc];
}

+ (id)stateWithResponder:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(UIInputViewPostPinningReloadState);
  [(UIInputViewPostPinningReloadState *)v4 setResponderToReload:v3];

  return v4;
}

- (UIResponder)responderToReload
{
  return self->_responderPreventedFromSettingInputViews;
}

- (void)setResponderToReload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end