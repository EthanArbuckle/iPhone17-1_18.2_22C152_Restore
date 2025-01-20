@interface PrivateDataActionProvider
- (_TtC7NewsKitP33_97C4145B2F6687765D35AB4C72479A3E25PrivateDataActionProvider)init;
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
    v7 = (void *)sub_2286DE1A8();
    v9[4] = nullsub_1;
    v9[5] = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_2286CFBC0;
    v9[3] = &block_descriptor_1;
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

- (_TtC7NewsKitP33_97C4145B2F6687765D35AB4C72479A3E25PrivateDataActionProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PrivateDataActionProvider *)&v3 init];
}

@end