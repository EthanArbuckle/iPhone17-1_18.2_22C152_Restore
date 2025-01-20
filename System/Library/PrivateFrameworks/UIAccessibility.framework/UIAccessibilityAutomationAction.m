@interface UIAccessibilityAutomationAction
- (NSString)identifier;
- (SEL)selector;
- (UIAccessibilityAutomationAction)initWithIdentifier:(id)a3 selector:(SEL)a4;
@end

@implementation UIAccessibilityAutomationAction

- (UIAccessibilityAutomationAction)initWithIdentifier:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityAutomationAction;
  v7 = [(UIAccessibilityAutomationAction *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    v7->_selector = v10;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
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