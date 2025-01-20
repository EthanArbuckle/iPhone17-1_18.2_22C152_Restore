@interface DOCServiceContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_TtC5Files17DOCServiceContext)init;
- (_TtC5Files17DOCServiceContext)initWithInputItems:(id)a3;
- (_TtC5Files17DOCServiceContext)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (_TtC5Files17DOCServiceContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)configureAsDocumentBrowserWithHostProxy:(id)a3 configuration:(id)a4 initialUIPBrowserState:(id)a5 completionBlock:(id)a6;
- (void)updateAppearance:(id)a3 completionBlock:(id)a4;
- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5;
- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation DOCServiceContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_100290500((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_hostProtocol);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_100290500((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_vendorProtocol);
}

- (void)configureAsDocumentBrowserWithHostProxy:(id)a3 configuration:(id)a4 initialUIPBrowserState:(id)a5 completionBlock:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = (void *)swift_allocObject();
  v12[2] = a5;
  v12[3] = a4;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = sub_100292E70;
  v12[7] = v11;
  v20[4] = sub_100292EDC;
  v20[5] = v12;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_1000666D8;
  v20[3] = &unk_10069DC80;
  v13 = _Block_copy(v20);
  swift_unknownObjectRetain_n();
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  id v17 = v15;
  id v18 = v14;
  v19 = v16;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v13);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)updateAppearance:(id)a3 completionBlock:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_10023FB64;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100290CAC(v8, (uint64_t)v6, v7);
  sub_1000A7258((uint64_t)v6);
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    id v8 = sub_10023FB64;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_100290EC0(v10, a4, (uint64_t)v8, v9);
  sub_1000A7258((uint64_t)v8);
}

- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  if ([(DOCServiceContext *)v6 _principalObject])
  {
    type metadata accessor for DOCServiceViewController();
    uint64_t v7 = (void *)swift_dynamicCastClassUnconditional();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    *(unsigned char *)(v8 + 24) = a3;
    *(unsigned char *)(v8 + 25) = a4;
    v11[4] = sub_100292B88;
    v11[5] = v8;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_1000666D8;
    v11[3] = &unk_10069DBB8;
    uint64_t v9 = _Block_copy(v11);
    id v10 = v7;
    swift_release();
    DOCRunInMainThread();
    _Block_release(v9);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC5Files17DOCServiceContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCServiceContext();
  return [(DOCServiceContext *)&v3 init];
}

- (_TtC5Files17DOCServiceContext)initWithInputItems:(id)a3
{
  if (a3)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCServiceContext();
  v5 = [(DOCServiceContext *)&v7 initWithInputItems:v4.super.isa];

  if (v5) {
  return v5;
  }
}

- (_TtC5Files17DOCServiceContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6 = sub_1000CBE70(&qword_10070B6D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtC5Files17DOCServiceContext *)sub_1002912F4((uint64_t)a3, (uint64_t)v8);
}

- (_TtC5Files17DOCServiceContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8 = sub_1000CBE70(&qword_10070B6D0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  id v13 = a4;
  return (_TtC5Files17DOCServiceContext *)sub_1002915B0((uint64_t)a3, a4, (uint64_t)v10);
}

@end