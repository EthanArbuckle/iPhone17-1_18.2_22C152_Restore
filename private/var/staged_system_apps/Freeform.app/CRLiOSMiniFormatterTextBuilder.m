@interface CRLiOSMiniFormatterTextBuilder
- (void)fontPickerViewControllerDidCancel:(id)a3;
- (void)fontPickerViewControllerDidPickFont:(id)a3;
@end

@implementation CRLiOSMiniFormatterTextBuilder

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSMiniFormatterTextBuilder_dataProvider));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform30CRLiOSMiniFormatterTextBuilder_textSizeManager);
  swift_bridgeObjectRelease();

  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8Freeform30CRLiOSMiniFormatterTextBuilder_closeButtonClosure);

  sub_1005174AC(v4);
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10056422C(v4);
}

- (void)fontPickerViewControllerDidCancel:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 2);
    id v7 = a3;
    v8 = self;
    [v7 dismissViewControllerAnimated:1 completion:0];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(id, uint64_t, uint64_t))(v6 + 40))(v7, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end