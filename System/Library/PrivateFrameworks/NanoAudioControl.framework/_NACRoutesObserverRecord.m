@interface _NACRoutesObserverRecord
- (MPAVRoutingController)routingController;
- (NACRunAssertion)runAssertion;
- (void)setRoutingController:(id)a3;
- (void)setRunAssertion:(id)a3;
@end

@implementation _NACRoutesObserverRecord

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (void)setRoutingController:(id)a3
{
}

- (NACRunAssertion)runAssertion
{
  return self->_runAssertion;
}

- (void)setRunAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runAssertion, 0);

  objc_storeStrong((id *)&self->_routingController, 0);
}

@end