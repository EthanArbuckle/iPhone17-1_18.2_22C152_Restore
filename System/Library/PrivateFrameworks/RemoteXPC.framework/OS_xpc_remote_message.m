@interface OS_xpc_remote_message
@end

@implementation OS_xpc_remote_message

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->link_stqe_next, 0);
  for (uint64_t i = 160; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->body, 0);
  objc_storeStrong(&self->barrier, 0);
}

@end