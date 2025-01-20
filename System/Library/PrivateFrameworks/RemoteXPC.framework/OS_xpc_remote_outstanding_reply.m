@interface OS_xpc_remote_outstanding_reply
@end

@implementation OS_xpc_remote_outstanding_reply

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->link_stqe_next, 0);
  objc_storeStrong((id *)&self->reply_queue, 0);
  objc_storeStrong(&self->reply_handler, 0);
}

@end