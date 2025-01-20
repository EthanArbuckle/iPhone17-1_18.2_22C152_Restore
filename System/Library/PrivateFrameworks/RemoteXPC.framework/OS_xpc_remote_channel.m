@interface OS_xpc_remote_channel
@end

@implementation OS_xpc_remote_channel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->parent_io, 0);
  objc_storeStrong((id *)&self->stream_io, 0);
  objc_storeStrong(&self->msg_handler, 0);
  objc_storeStrong(&self->event_handler, 0);
  objc_storeStrong((id *)&self->conn, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end