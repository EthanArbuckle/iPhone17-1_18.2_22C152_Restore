@interface CRLiOSMiniFormatterColorPaletteBuilder
- (void)colorPickerDidChangeSelectedColor:(id)a3;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
@end

@implementation CRLiOSMiniFormatterColorPaletteBuilder

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_shapeFillDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_strokeDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder_textDataProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_100ACF5B0((uint64_t)v9, a5);
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 2);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 96);
    id v9 = a3;
    v10 = self;
    if (v8(ObjectType, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 88))(ObjectType, v6);
    }
    (*(void (**)(id, uint64_t, uint64_t))(v6 + 40))(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)colorPickerDidChangeSelectedColor:(id)a3
{
  id v4 = a3;
  id v8 = self;
  id v5 = [v4 selectedColor];
  if (v5)
  {
    id v6 = v5;
    v7 = (_TtC8Freeform38CRLiOSMiniFormatterColorPaletteBuilder *)[objc_allocWithZone((Class)CRLColorFill) initWithUIColor:v5];
    sub_100ACC824(v7);

    id v4 = v6;
    id v8 = v7;
  }
}

@end