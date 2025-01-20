@interface AlertServiceServer
- (_TtC11SessionCore18AlertServiceServer)init;
- (void)dismissAlertWithActivityIdentifier:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)presentAlertWithActivityIdentifier:(id)a3 payload:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation AlertServiceServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C7C91A08(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore18AlertServiceServer)init
{
  result = (_TtC11SessionCore18AlertServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C7C043B8((uint64_t)self + OBJC_IVAR____TtC11SessionCore18AlertServiceServer_delegate);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)dismissAlertWithActivityIdentifier:(id)a3
{
  uint64_t v4 = sub_1C7D32CE0();
  unint64_t v6 = v5;
  id v7 = self;
  sub_1C7C9046C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)presentAlertWithActivityIdentifier:(id)a3 payload:(id)a4 options:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = sub_1C7D32CE0();
  unint64_t v12 = v11;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  uint64_t v16 = sub_1C7D30980();
  unint64_t v18 = v17;

  uint64_t v19 = sub_1C7D30980();
  unint64_t v21 = v20;

  _Block_copy(v9);
  sub_1C7C91EE8(v10, v12, v16, v18, v19, v21, (char *)v15, (void (**)(void, void))v9);
  _Block_release(v9);
  _Block_release(v9);
  sub_1C7C028F8(v19, v21);
  sub_1C7C028F8(v16, v18);

  swift_bridgeObjectRelease();
}

@end