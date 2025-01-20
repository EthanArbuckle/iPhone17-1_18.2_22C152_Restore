@interface AccountPageViewControllerDelegate
- (_TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E433AccountPageViewControllerDelegate)init;
- (void)accountPageViewControllerDidFinish:(id)a3;
@end

@implementation AccountPageViewControllerDelegate

- (_TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E433AccountPageViewControllerDelegate)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E433AccountPageViewControllerDelegate_selfReference) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountPageViewControllerDelegate();
  v2 = [(AccountPageViewControllerDelegate *)&v6 init];
  v3 = *(Class *)((char *)&v2->super.isa
                + OBJC_IVAR____TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E433AccountPageViewControllerDelegate_selfReference);
  *(Class *)((char *)&v2->super.isa
           + OBJC_IVAR____TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E433AccountPageViewControllerDelegate_selfReference) = (Class)v2;
  v4 = v2;

  return v4;
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  v9[4] = sub_1003FA908;
  v9[5] = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000162D4;
  v9[3] = &unk_1008CA720;
  objc_super v6 = _Block_copy(v9);
  v7 = self;
  id v8 = a3;
  swift_release();
  [v8 dismissViewControllerAnimated:1 completion:v6];
  _Block_release(v6);
}

- (void).cxx_destruct
{
  v2 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E433AccountPageViewControllerDelegate_selfReference);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E433AccountPageViewControllerDelegate_selfReference) = 0;
  v3 = v2;
  if (v2)
  {
    while (1)
    {
      objc_super v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v4 = *(char **)&v6[OBJC_IVAR____TtC8AppStoreP33_EB9D63B1EF811ECF6E030954F78C05E433AccountPageViewControllerDelegate_selfReference];
      uint64_t v5 = v4;

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