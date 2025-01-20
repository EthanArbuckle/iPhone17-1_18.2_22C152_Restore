@interface TXSContext
@end

@implementation TXSContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalClientDescription, 0);
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end