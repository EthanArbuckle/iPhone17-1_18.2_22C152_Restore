@interface UIAccessibilityLegacyCustomAction
- (unint64_t)actionIndex;
- (void)setActionIndex:(unint64_t)a3;
@end

@implementation UIAccessibilityLegacyCustomAction

- (unint64_t)actionIndex
{
  return self->_actionIndex;
}

- (void)setActionIndex:(unint64_t)a3
{
  self->_actionIndex = a3;
}

@end