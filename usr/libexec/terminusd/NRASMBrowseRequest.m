@interface NRASMBrowseRequest
@end

@implementation NRASMBrowseRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredEndpoints, 0);

  objc_storeStrong(&self->_responseBlock, 0);
}

@end