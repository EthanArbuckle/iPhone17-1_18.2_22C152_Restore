@interface SingleCallback
- (_TtC10seserviced14SingleCallback)init;
- (void)invoke:(id)a3;
@end

@implementation SingleCallback

- (void)invoke:(id)a3
{
  v4 = (void (**)(void))_Block_copy(a3);
  v5 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC10seserviced14SingleCallback_invoked)
                           + 136);
  v8 = self;
  v6 = (atomic_uchar *)v5();
  char v7 = 0;
  atomic_compare_exchange_strong(v6, (unsigned __int8 *)&v7, 1u);
  if (!v7) {
    v4[2](v4);
  }
  _Block_release(v4);
}

- (_TtC10seserviced14SingleCallback)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC10seserviced14SingleCallback_invoked;
  sub_10006C51C(&qword_100459040);
  v5 = (objc_class *)swift_allocObject();
  *((unsigned char *)v5 + 16) = 0;
  *(Class *)((char *)&self->super.isa + v4) = v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(SingleCallback *)&v7 init];
}

- (void).cxx_destruct
{
}

@end