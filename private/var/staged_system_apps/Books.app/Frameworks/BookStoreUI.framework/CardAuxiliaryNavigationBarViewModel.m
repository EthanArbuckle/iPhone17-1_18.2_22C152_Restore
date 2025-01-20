@interface CardAuxiliaryNavigationBarViewModel
- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5;
@end

@implementation CardAuxiliaryNavigationBarViewModel

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  uint64_t v6 = sub_2E4420();
  v8 = v7;
  swift_retain();
  sub_152914(v6, v8, a4);
  swift_release();

  swift_bridgeObjectRelease();
}

@end