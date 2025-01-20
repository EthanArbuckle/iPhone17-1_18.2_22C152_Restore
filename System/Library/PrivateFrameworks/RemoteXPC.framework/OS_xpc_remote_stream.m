@interface OS_xpc_remote_stream
@end

@implementation OS_xpc_remote_stream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->link_stqe_next, 0);
  objc_storeStrong((id *)&self->channel, 0);
}

@end