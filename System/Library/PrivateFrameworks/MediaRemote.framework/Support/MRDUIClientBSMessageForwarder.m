@interface MRDUIClientBSMessageForwarder
- (MRUIClientProtocol)target;
- (void)setTarget:(id)a3;
@end

@implementation MRDUIClientBSMessageForwarder

- (MRUIClientProtocol)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (MRUIClientProtocol *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end