@interface HUDLoadingContentView
- (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView)initWithFrame:(CGRect)a3;
@end

@implementation HUDLoadingContentView

- (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_indicator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_label) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView *)sub_385890();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_config;
  uint64_t v4 = sub_3807C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_indicator));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8451DF0E636034E0D31DCAF0635FC0CC21HUDLoadingContentView_label);
}

@end