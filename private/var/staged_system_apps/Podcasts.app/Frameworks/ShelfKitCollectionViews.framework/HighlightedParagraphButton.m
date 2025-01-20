@interface HighlightedParagraphButton
- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation HighlightedParagraphButton

- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton *)sub_FD1F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_FF6B4();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v8 = a3;
  id v9 = a4;
  v10 = (char *)v13.receiver;
  swift_unknownObjectRetain();
  [(HighlightedParagraphButton *)&v13 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:a5];
  v11 = *(void (**)(uint64_t))&v10[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton_onDismissMenu];
  if (v11)
  {
    uint64_t v12 = swift_retain();
    v11(v12);
    sub_27760((uint64_t)v11);
  }
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE26HighlightedParagraphButton_onDismissMenu));
}

@end