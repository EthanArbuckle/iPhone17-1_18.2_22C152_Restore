@interface CarChromeViewItem
+ (id)itemWithContext:(id)a3;
- (BOOL)isAutohidingContentHidden;
- (CarChromeContext)context;
- (CarChromeViewItem)initWithContext:(id)a3;
- (int64_t)autohideBehavior;
- (int64_t)hardwareBackButtonBehavior;
- (void)setAutohideBehavior:(int64_t)a3;
- (void)setAutohidingContentIsHidden:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setHardwareBackButtonBehavior:(int64_t)a3;
@end

@implementation CarChromeViewItem

+ (id)itemWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithContext:v4];

  return v5;
}

- (CarChromeViewItem)initWithContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarChromeViewItem;
  id v5 = [(CarChromeViewItem *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_context, v4);
  }

  return v6;
}

- (CarChromeContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (CarChromeContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (int64_t)hardwareBackButtonBehavior
{
  return self->_hardwareBackButtonBehavior;
}

- (void)setHardwareBackButtonBehavior:(int64_t)a3
{
  self->_hardwareBackButtonBehavior = a3;
}

- (int64_t)autohideBehavior
{
  return self->_autohideBehavior;
}

- (void)setAutohideBehavior:(int64_t)a3
{
  self->_autohideBehavior = a3;
}

- (BOOL)isAutohidingContentHidden
{
  return self->_autohidingContentIsHidden;
}

- (void)setAutohidingContentIsHidden:(BOOL)a3
{
  self->_autohidingContentIsHidden = a3;
}

- (void).cxx_destruct
{
}

@end