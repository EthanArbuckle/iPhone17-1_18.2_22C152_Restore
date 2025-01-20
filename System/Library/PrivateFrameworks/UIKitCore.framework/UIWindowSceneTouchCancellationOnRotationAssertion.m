@interface UIWindowSceneTouchCancellationOnRotationAssertion
- (UIWindowSceneTouchCancellationOnRotationAssertion)initWithWindowScene:(id)a3;
- (void)cancel;
- (void)dealloc;
@end

@implementation UIWindowSceneTouchCancellationOnRotationAssertion

- (UIWindowSceneTouchCancellationOnRotationAssertion)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIWindowSceneTouchCancellationOnRotationAssertion;
  v5 = [(UIWindowSceneTouchCancellationOnRotationAssertion *)&v9 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_windowScene, v4);
    [v4 _setShouldDisableTouchCancellationOnRotation:1];
  }
  return v6;
}

- (void)cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [WeakRetained _setShouldDisableTouchCancellationOnRotation:0];
}

- (void)dealloc
{
  [(UIWindowSceneTouchCancellationOnRotationAssertion *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)UIWindowSceneTouchCancellationOnRotationAssertion;
  [(UIWindowSceneTouchCancellationOnRotationAssertion *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end