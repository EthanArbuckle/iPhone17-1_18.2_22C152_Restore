@interface MREmulatedGameController
- (MREmulatedGameController)initWithProperties:(id)a3;
- (MREmulatedGameControllerDelegate)delegate;
- (double)buttonAUpDelay;
- (int)profile;
- (void)setButtonAUpDelay:(double)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MREmulatedGameController

- (MREmulatedGameController)initWithProperties:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MREmulatedGameController;
  return [(MREmulatedGameController *)&v4 init];
}

- (int)profile
{
  return self->_profile;
}

- (double)buttonAUpDelay
{
  return self->_buttonAUpDelay;
}

- (void)setButtonAUpDelay:(double)a3
{
  self->_buttonAUpDelay = a3;
}

- (MREmulatedGameControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MREmulatedGameControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end