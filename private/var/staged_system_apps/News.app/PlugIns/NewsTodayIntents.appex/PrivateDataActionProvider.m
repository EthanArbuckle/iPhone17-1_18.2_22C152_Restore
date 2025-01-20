@interface PrivateDataActionProvider
- (_TtC16NewsTodayIntentsP33_346BAA50B64DD5C36F8B4573B40F56D325PrivateDataActionProvider)init;
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
    Class isa = sub_10000FD40().super.isa;
    v9[4] = TagIntentResponseCode.rawValue.getter;
    v9[5] = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_100006A0C;
    v9[3] = &unk_10001CCB8;
    v8 = _Block_copy(v9);
    swift_release();
    ((void (**)(void, Class, void *))v5)[2](v5, isa, v8);
    _Block_release(v8);

    _Block_release(v5);
    _Block_release(v5);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC16NewsTodayIntentsP33_346BAA50B64DD5C36F8B4573B40F56D325PrivateDataActionProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PrivateDataActionProvider *)&v3 init];
}

@end