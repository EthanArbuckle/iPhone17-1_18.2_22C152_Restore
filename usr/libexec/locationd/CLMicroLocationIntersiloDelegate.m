@interface CLMicroLocationIntersiloDelegate
- (BOOL)valid;
- (CLMicroLocationIntersiloDelegate)initWithMicroLocationNotifier:(void *)a3;
- (void)duetMonitor:(id)a3 foregroundAppDidLaunch:(id)a4;
- (void)duetMonitor:(id)a3 nowPlayingDidChange:(id)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLMicroLocationIntersiloDelegate

- (CLMicroLocationIntersiloDelegate)initWithMicroLocationNotifier:(void *)a3
{
  if (!a3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CLMicroLocationIntersiloDelegate;
  result = [(CLMicroLocationIntersiloDelegate *)&v5 init];
  if (result)
  {
    result->_microLocationNotifier = a3;
    result->_valid = 1;
  }
  return result;
}

- (void)duetMonitor:(id)a3 foregroundAppDidLaunch:(id)a4
{
}

- (void)duetMonitor:(id)a3 nowPlayingDidChange:(id)a4
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end