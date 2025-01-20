@interface ScrollOffsetObserver
- (_TtC15RemindersUICoreP33_7C8C604C15D0DA1EA91E5188EF1F6E2320ScrollOffsetObserver)init;
- (void)_observeScrollViewDidScroll:(id)a3;
@end

@implementation ScrollOffsetObserver

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1B9314F2C((uint64_t)a3);
}

- (_TtC15RemindersUICoreP33_7C8C604C15D0DA1EA91E5188EF1F6E2320ScrollOffsetObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(ScrollOffsetObserver *)&v5 init];
}

- (void).cxx_destruct
{
}

@end