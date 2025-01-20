@interface NRPendingIncomingRequest
@end

@implementation NRPendingIncomingRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end