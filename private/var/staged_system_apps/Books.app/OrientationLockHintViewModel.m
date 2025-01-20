@interface OrientationLockHintViewModel
- (_TtC5Books28OrientationLockHintViewModel)init;
@end

@implementation OrientationLockHintViewModel

- (_TtC5Books28OrientationLockHintViewModel)init
{
  return (_TtC5Books28OrientationLockHintViewModel *)OrientationLockHintViewModel.init()();
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel_orientationLockHandler);
  v3 = (char *)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel__currentInterfaceOrientation;
  uint64_t v4 = sub_100058D18(&qword_100B304C0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel__isOrientationLocked;
  uint64_t v6 = sub_100058D18((uint64_t *)&unk_100B25F10);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel__isHintShown, v6);
  v8 = (char *)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel__hintRotationDegrees;
  uint64_t v9 = sub_100058D18((uint64_t *)&unk_100B25F50);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel_tapActionViewListener;

  sub_10023E454((uint64_t)v10);
}

@end