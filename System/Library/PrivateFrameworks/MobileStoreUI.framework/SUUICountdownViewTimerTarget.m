@interface SUUICountdownViewTimerTarget
- (id)actionBlock;
- (void)action;
- (void)setActionBlock:(id)a3;
@end

@implementation SUUICountdownViewTimerTarget

- (void)action
{
  v2 = [(SUUICountdownViewTimerTarget *)self actionBlock];
  v2[2]();
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end