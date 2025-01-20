@interface ComposeReviewDelegate
- (_TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E421ComposeReviewDelegate)init;
- (void)reviewComposeViewController:(id)a3 didFinishSubmitting:(BOOL)a4;
@end

@implementation ComposeReviewDelegate

- (void)reviewComposeViewController:(id)a3 didFinishSubmitting:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_1003F2540(a3, a4);
}

- (_TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E421ComposeReviewDelegate)init
{
  result = (_TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E421ComposeReviewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E421ComposeReviewDelegate_selfReference);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E421ComposeReviewDelegate_selfReference) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v4 = *(char **)&v6[OBJC_IVAR____TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E421ComposeReviewDelegate_selfReference];
      v5 = v4;

      v3 = v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    v3 = v6;
  }
LABEL_6:
}

@end