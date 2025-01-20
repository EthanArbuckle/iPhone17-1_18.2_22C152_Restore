@interface TerminusdXPCServer
@end

@implementation TerminusdXPCServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKnownEntitlementGroup, 0);
  objc_storeStrong((id *)&self->_allKnownEntitlementSet, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end