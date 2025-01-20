@interface RoundHeaderButton
- (_TtC23ShelfKitCollectionViews17RoundHeaderButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17RoundHeaderButton)initWithFrame:(CGRect)a3;
- (unsigned)viewForLastBaselineLayout;
@end

@implementation RoundHeaderButton

- (_TtC23ShelfKitCollectionViews17RoundHeaderButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17RoundHeaderButton *)sub_12325C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unsigned)viewForLastBaselineLayout
{
  int v1 = a1[OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton_usesBoundsForBaselineGuide];
  v2 = a1;
  if (v1 == 1)
  {
    v3 = (unsigned __int8 *)sub_1235B4();

    v2 = v3;
  }

  return v2;
}

- (_TtC23ShelfKitCollectionViews17RoundHeaderButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton_progressView) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton_usesBoundsForBaselineGuide) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton____lazy_storage___layoutView) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews17RoundHeaderButton *)sub_385890();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton_progressView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton____lazy_storage___layoutView);
}

@end