@interface SUButtonAction
- (BOOL)isActivated;
- (void)_buttonAction:(id)a3;
- (void)_setActivated:(BOOL)a3;
@end

@implementation SUButtonAction

- (void)_buttonAction:(id)a3
{
  self->_activated = 1;
}

- (void)_setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)isActivated
{
  return self->_activated;
}

@end