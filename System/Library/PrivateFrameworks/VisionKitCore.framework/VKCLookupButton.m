@interface VKCLookupButton
- (VKCLookupButtonDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation VKCLookupButton

- (VKCLookupButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCLookupButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end