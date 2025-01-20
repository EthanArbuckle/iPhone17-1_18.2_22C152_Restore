@interface CRLiOSMiniFormatterTextEditingAccessoryViewController.CRLiOSMiniFormatterInputViewState
- (BOOL)isEqual:(id)a3;
- (_TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState)init;
@end

@implementation CRLiOSMiniFormatterTextEditingAccessoryViewController.CRLiOSMiniFormatterInputViewState

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_100E7FB8C((uint64_t)v8);

  sub_100522F00((uint64_t)v8, &qword_101672BF0);
  return v6;
}

- (_TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState)init
{
  result = (_TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController33CRLiOSMiniFormatterInputViewState_font));
}

@end