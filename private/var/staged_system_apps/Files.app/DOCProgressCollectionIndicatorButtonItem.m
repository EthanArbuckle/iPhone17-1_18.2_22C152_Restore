@interface DOCProgressCollectionIndicatorButtonItem
- (BOOL)isActivePopoverSource;
- (_TtC5Files40DOCProgressCollectionIndicatorButtonItem)init;
- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3;
- (void)progressIndicatorViewDidReceiveTap:(id)a3;
- (void)setIsActivePopoverSource:(BOOL)a3;
@end

@implementation DOCProgressCollectionIndicatorButtonItem

- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004AE18C(0);
}

- (void)progressIndicatorViewDidReceiveTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004AD654(v4);
}

- (BOOL)isActivePopoverSource
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource);
}

- (void)setIsActivePopoverSource:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource) = a3;
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_containerView);
  v3[OBJC_IVAR____TtCC5Files40DOCProgressCollectionIndicatorButtonItemP33_5AA9AA04A7C2840F7F12009703A5ACCD25ProgressItemContainerView_isActivePopoverSource] = a3;
  [v3 setNeedsLayout];
}

- (_TtC5Files40DOCProgressCollectionIndicatorButtonItem)init
{
  result = (_TtC5Files40DOCProgressCollectionIndicatorButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_widthConstraint));
  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files40DOCProgressCollectionIndicatorButtonItem_inFlightVisibilityChange, &qword_1007187C8);
}

@end