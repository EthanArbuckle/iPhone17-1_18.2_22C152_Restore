@interface BridgedProxyContainer
- (TFCallbackRegistration)callback;
- (TFRegistrationContainer)privateContainer;
- (TFRegistrationContainer)publicContainer;
- (_TtC13TeaFoundation21BridgedProxyContainer)init;
- (void)setCallback:(id)a3;
- (void)setPrivateContainer:(id)a3;
- (void)setPublicContainer:(id)a3;
@end

@implementation BridgedProxyContainer

- (TFRegistrationContainer)publicContainer
{
  v2 = (void *)sub_191DD14DC();

  return (TFRegistrationContainer *)v2;
}

- (void)setPublicContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_191DD1548((uint64_t)a3);
}

- (TFRegistrationContainer)privateContainer
{
  v2 = (void *)sub_191DD1588();

  return (TFRegistrationContainer *)v2;
}

- (void)setPrivateContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_191DD15F4((uint64_t)a3);
}

- (TFCallbackRegistration)callback
{
  v2 = (void *)sub_191DD1634();

  return (TFCallbackRegistration *)v2;
}

- (void)setCallback:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_191DD16A0((uint64_t)a3);
}

- (_TtC13TeaFoundation21BridgedProxyContainer)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end