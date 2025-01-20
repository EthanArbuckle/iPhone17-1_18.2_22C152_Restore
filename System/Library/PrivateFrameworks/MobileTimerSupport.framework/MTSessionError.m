@interface MTSessionError
+ (id)withDescription:(id)a3;
- (_TtC18MobileTimerSupport14MTSessionError)initWithCoder:(id)a3;
- (_TtC18MobileTimerSupport14MTSessionError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation MTSessionError

+ (id)withDescription:(id)a3
{
  uint64_t v3 = sub_1BE3233C0();
  v5 = sub_1BE29B59C(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC18MobileTimerSupport14MTSessionError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  sub_1BE3233C0();
  if (a5) {
    a5 = (id)sub_1BE323270();
  }
  v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18MobileTimerSupport14MTSessionError_descriptionString);
  void *v8 = 0;
  v8[1] = 0;
  v9 = (void *)sub_1BE3233B0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v10 = (void *)sub_1BE323260();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MTSessionError();
  v11 = [(MTSessionError *)&v13 initWithDomain:v9 code:a4 userInfo:v10];

  return v11;
}

- (_TtC18MobileTimerSupport14MTSessionError)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18MobileTimerSupport14MTSessionError_descriptionString);
  v6 = (objc_class *)type metadata accessor for MTSessionError();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(MTSessionError *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end