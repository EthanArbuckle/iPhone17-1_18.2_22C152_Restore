@interface OS_firehose_client
- (OS_firehose_client)init;
- (id)debugDescription;
- (void)dealloc;
@end

@implementation OS_firehose_client

- (void)dealloc
{
  sub_1000124B0((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_firehose_client;
  [(OS_firehose_client *)&v3 dealloc];
}

- (OS_firehose_client)init
{
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (id)debugDescription
{
  return 0;
}

@end