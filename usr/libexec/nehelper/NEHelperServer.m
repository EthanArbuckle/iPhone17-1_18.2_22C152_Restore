@interface NEHelperServer
- (NEHelperServer)init;
@end

@implementation NEHelperServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NEHelperServer)init
{
}

@end