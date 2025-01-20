@interface Proxy
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)interactionControllerForDismissal:(id)a3;
@end

@implementation Proxy

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  LOBYTE(a3) = sub_1AA7C4AA8(v8, v9);

  return a3 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  id v6 = a3;
  v7 = self;
  LOBYTE(self) = sub_1AA7C4CE4(v6);

  return self & 1;
}

- (id)animationControllerForDismissedController:(id)a3
{
  swift_unknownObjectUnownedLoadStrong();
  id v5 = a3;
  id v6 = self;
  sub_1AA7C5508();
}

- (id)interactionControllerForDismissal:(id)a3
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_getObjectType();
  uint64_t v6 = swift_conformsToProtocol2();
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v6) {
    id v8 = a3;
  }
  else {
    id v8 = 0;
  }
  if (v8)
  {
    uint64_t ObjectType = swift_getObjectType();
    v10 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
    swift_unknownObjectRetain();
    v11 = self;
    v12 = (void *)v10(ObjectType, v7);
  }
  else
  {
    swift_unknownObjectRetain();

    v12 = 0;
  }
  swift_unknownObjectRelease();
  return v12;
}

- (_TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy)init
{
  result = (_TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end