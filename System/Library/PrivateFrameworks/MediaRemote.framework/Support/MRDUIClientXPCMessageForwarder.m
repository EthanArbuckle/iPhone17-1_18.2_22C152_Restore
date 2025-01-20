@interface MRDUIClientXPCMessageForwarder
- (MRUIClientXPCProtocol)target;
- (void)setTarget:(id)a3;
@end

@implementation MRDUIClientXPCMessageForwarder

- (MRUIClientXPCProtocol)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (MRUIClientXPCProtocol *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end