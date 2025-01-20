@interface PRDevicePoseProvider
- (PRDevicePoseProviderDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation PRDevicePoseProvider

- (PRDevicePoseProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRDevicePoseProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end