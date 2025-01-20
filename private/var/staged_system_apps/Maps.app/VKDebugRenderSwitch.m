@interface VKDebugRenderSwitch
- (unint64_t)switchIndex;
- (void)setSwitchIndex:(unint64_t)a3;
@end

@implementation VKDebugRenderSwitch

- (unint64_t)switchIndex
{
  return self->_switchIndex;
}

- (void)setSwitchIndex:(unint64_t)a3
{
  self->_switchIndex = a3;
}

@end