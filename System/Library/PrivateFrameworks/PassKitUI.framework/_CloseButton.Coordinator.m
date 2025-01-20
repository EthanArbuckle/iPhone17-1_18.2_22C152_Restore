@interface _CloseButton.Coordinator
- (_TtCV9PassKitUIP33_B35F9F0AABC5170B961BBCB25164B78512_CloseButton11Coordinator)init;
- (void)doAction:(id)a3;
@end

@implementation _CloseButton.Coordinator

- (void)doAction:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1A03B57A8();
  swift_unknownObjectRelease();
  v5 = *(void (**)(uint64_t))((char *)&v4->super.isa
                                      + OBJC_IVAR____TtCV9PassKitUIP33_B35F9F0AABC5170B961BBCB25164B78512_CloseButton11Coordinator_configuration);
  uint64_t v6 = sub_1A03ADE18();
  v5(v6);

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtCV9PassKitUIP33_B35F9F0AABC5170B961BBCB25164B78512_CloseButton11Coordinator)init
{
  result = (_TtCV9PassKitUIP33_B35F9F0AABC5170B961BBCB25164B78512_CloseButton11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end