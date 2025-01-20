@interface ParagraphCell
- (_TtC23ShelfKitCollectionViews13ParagraphCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13ParagraphCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ParagraphCell

- (_TtC23ShelfKitCollectionViews13ParagraphCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews13ParagraphCell *)sub_2F15D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews13ParagraphCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2F2CF0();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ParagraphCell *)&v6 traitCollectionDidChange:v4];
  sub_2F1FF8();
  [v5 setNeedsUpdateConstraints];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType();
  v2 = (char *)v16.receiver;
  [(ParagraphCell *)&v16 layoutSubviews];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v2 layoutMargins];
  double v15 = UIEdgeInsetsInsetRect_1(v4, v6, v8, v10, v11, v12, v13, v14);
  if (*(double *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_recordedWidth] != v15)
  {
    *(double *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_recordedWidth] = v15;
    sub_2F1FF8();
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  double v7 = self;
  [(ParagraphCell *)v7 layoutIfNeeded];
  v10.receiver = v7;
  v10.super_class = ObjectType;
  id v8 = [(ParagraphCell *)&v10 preferredLayoutAttributesFittingAttributes:v6];

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_expandableTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell____lazy_storage___heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell____lazy_storage___widthConstraint));
  swift_release();
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews13ParagraphCell_cellReloadingHandler));

  swift_release();
}

@end