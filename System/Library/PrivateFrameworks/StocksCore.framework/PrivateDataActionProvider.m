@interface PrivateDataActionProvider
- (_TtC10StocksCoreP33_8188EFB552A1879D25D8FDAD94CCB0E125PrivateDataActionProvider)init;
- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3;
@end

@implementation PrivateDataActionProvider

- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = (void (**)(void, void, void))v4;
    v6 = self;
    _Block_copy(v5);
    v7 = (void *)sub_1AFFCB1B8();
    v9[4] = nullsub_1;
    v9[5] = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 1107296256;
    v9[2] = sub_1AFDB5104;
    v9[3] = &block_descriptor_30;
    v8 = _Block_copy(v9);
    swift_release();
    ((void (**)(void, void *, void *))v5)[2](v5, v7, v8);
    _Block_release(v8);

    _Block_release(v5);
    _Block_release(v5);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC10StocksCoreP33_8188EFB552A1879D25D8FDAD94CCB0E125PrivateDataActionProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PrivateDataActionProvider *)&v3 init];
}

@end