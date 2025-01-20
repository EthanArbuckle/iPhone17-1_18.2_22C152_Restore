@interface SCRCTargetSelector
+ (id)targetSelectorWithTarget:(id)a3 selector:(SEL)a4;
- (SCRCTargetSelector)initWithTarget:(id)a3 selector:(SEL)a4;
- (SEL)selector;
- (id)target;
@end

@implementation SCRCTargetSelector

+ (id)targetSelectorWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithTarget:v6 selector:a4];

  return v7;
}

- (SCRCTargetSelector)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRCTargetSelector;
  v7 = [(SCRCTargetSelector *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_selector = v9;
  }

  return v8;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end