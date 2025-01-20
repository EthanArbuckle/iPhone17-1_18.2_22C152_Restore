@interface FMPeopleActionController
- (void)dismissPresentedVCWithSender:(id)a3;
@end

@implementation FMPeopleActionController

- (void)dismissPresentedVCWithSender:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v4 = *(void **)self->presentedModalViewController;
  if (v4)
  {
    v7[4] = State.rawValue.getter;
    v7[5] = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_10003C410;
    v7[3] = &unk_100624138;
    v5 = _Block_copy(v7);
    id v6 = v4;
    [v6 dismissViewControllerAnimated:1 completion:v5];
    _Block_release(v5);
    swift_release();
  }
  else
  {
    swift_release();
  }
  sub_10002CEFC((uint64_t)v8);
}

@end