@interface AddressEditingTextField.Coordinator
- (_TtCV9PassKitUI23AddressEditingTextField11Coordinator)init;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChangeWithTextField:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation AddressEditingTextField.Coordinator

- (void)textFieldDidBeginEditing:(id)a3
{
  long long v4 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 72];
  v9[4] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 56];
  v9[5] = v4;
  v9[6] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 88];
  uint64_t v10 = *(void *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 104];
  long long v5 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent);
  v9[1] = v5;
  long long v6 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 40];
  v9[2] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 24];
  v9[3] = v6;
  id v7 = a3;
  v8 = self;
  sub_19F9B7688((uint64_t)v9);
  sub_19F9B6BF4();
  sub_19F9B7764((uint64_t)v9);
}

- (void)textFieldDidEndEditing:(id)a3
{
}

- (void)textFieldDidChangeWithTextField:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  sub_19F9B6DA8(v4);
}

- (_TtCV9PassKitUI23AddressEditingTextField11Coordinator)init
{
  result = (_TtCV9PassKitUI23AddressEditingTextField11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 64];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();

  swift_release();
}

@end