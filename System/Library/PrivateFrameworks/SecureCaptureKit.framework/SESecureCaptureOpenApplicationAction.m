@interface SESecureCaptureOpenApplicationAction
- (NSSet)launchActions;
- (SESecureCaptureOpenApplicationAction)init;
- (SESecureCaptureOpenApplicationAction)initWithCoder:(id)a3;
- (SESecureCaptureOpenApplicationAction)initWithInfo:(id)a3 responder:(id)a4;
- (SESecureCaptureOpenApplicationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (SESecureCaptureOpenApplicationAction)initWithURL:(id)a3 responder:(id)a4;
- (SESecureCaptureOpenApplicationAction)initWithUserActivity:(id)a3 responder:(id)a4;
- (SESecureCaptureOpenApplicationAction)initWithXPCDictionary:(id)a3;
@end

@implementation SESecureCaptureOpenApplicationAction

- (SESecureCaptureOpenApplicationAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)SESecureCaptureOpenApplicationAction;
  return [(SESecureCaptureOpenApplicationAction *)&v3 initWithInfo:0 responder:0];
}

- (SESecureCaptureOpenApplicationAction)initWithURL:(id)a3 responder:(id)a4
{
  uint64_t v6 = sub_25BF05328();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BF05318();
  id v10 = objc_allocWithZone(MEMORY[0x263F29C78]);
  id v11 = a4;
  id v12 = objc_msgSend(v10, sel_init);
  v13 = (void *)sub_25BF052E8();
  objc_msgSend(v12, sel_setObject_forSetting_, v13, 0);

  v16.receiver = self;
  v16.super_class = (Class)SESecureCaptureOpenApplicationAction;
  v14 = [(SESecureCaptureOpenApplicationAction *)&v16 initWithInfo:v12 responder:v11];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14;
}

- (SESecureCaptureOpenApplicationAction)initWithUserActivity:(id)a3 responder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (SESecureCaptureOpenApplicationAction *)SESecureCaptureOpenApplicationAction.init(userActivity:responder:)(v5, a4);
}

- (SESecureCaptureOpenApplicationAction)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SESecureCaptureOpenApplicationAction;
  return [(SESecureCaptureOpenApplicationAction *)&v4 initWithCoder:a3];
}

- (SESecureCaptureOpenApplicationAction)initWithXPCDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SESecureCaptureOpenApplicationAction;
  return [(SESecureCaptureOpenApplicationAction *)&v4 initWithXPCDictionary:a3];
}

- (NSSet)launchActions
{
  v2 = self;
  SESecureCaptureOpenApplicationAction.launchActions.getter();

  sub_25BEED774(0, &qword_26A5824C8);
  sub_25BEED5A0();
  objc_super v3 = (void *)sub_25BF05668();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (SESecureCaptureOpenApplicationAction)initWithInfo:(id)a3 responder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (SESecureCaptureOpenApplicationAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SESecureCaptureOpenApplicationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  _Block_copy(a6);
  id v8 = a3;
  id v9 = a5;
  result = (SESecureCaptureOpenApplicationAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end