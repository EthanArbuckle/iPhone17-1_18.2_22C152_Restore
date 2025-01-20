@interface CRLAXZorderButton
- (NSString)actionTitle;
- (SEL)action;
- (id)accessibilityCustomActions;
- (id)target;
- (void)setAction:(SEL)a3;
- (void)setActionTitle:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation CRLAXZorderButton

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc((Class)UIAccessibilityCustomAction);
  v4 = [(CRLAXZorderButton *)self actionTitle];
  v5 = [(CRLAXZorderButton *)self target];
  id v6 = [v3 initWithName:v4 target:v5 selector:[self action]];

  id v9 = v6;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return v7;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = a3;
}

- (void).cxx_destruct
{
}

@end