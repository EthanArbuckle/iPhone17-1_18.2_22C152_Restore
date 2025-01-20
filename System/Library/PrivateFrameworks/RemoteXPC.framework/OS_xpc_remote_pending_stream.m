@interface OS_xpc_remote_pending_stream
@end

@implementation OS_xpc_remote_pending_stream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->link_stqe_next, 0);
  objc_storeStrong(&self->completion_handler, 0);
  objc_storeStrong((id *)&self->io, 0);
  objc_storeStrong((id *)&self->channel, 0);
}

@end