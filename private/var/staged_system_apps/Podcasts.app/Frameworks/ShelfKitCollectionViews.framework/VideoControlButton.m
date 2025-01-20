@interface VideoControlButton
- (BOOL)isSelected;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViews18VideoControlButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews18VideoControlButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)wasTapped;
@end

@implementation VideoControlButton

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VideoControlButton();
  return [(VideoControlButton *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VideoControlButton();
  id v4 = v5.receiver;
  [(VideoControlButton *)&v5 setSelected:v3];
  sub_338E00();
}

- (_TtC23ShelfKitCollectionViews18VideoControlButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectedGlyph) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectedType) = 7;
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectionHandler);
  *id v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews18VideoControlButton *)sub_385890();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_339790();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  BOOL v3 = self;
  double v4 = sub_339FF4();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)wasTapped
{
  v2 = self;
  [(VideoControlButton *)v2 setSelected:[(VideoControlButton *)v2 isSelected] ^ 1];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  double v8 = self;
  [(VideoControlButton *)v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (qword_470780 != -1) {
    swift_once();
  }
  v20.origin.CGFloat x = UIEdgeInsetsInsetRect(v10, v12, v14, v16, *(double *)&xmmword_4818B0, *((double *)&xmmword_4818B0 + 1));
  v19.CGFloat x = x;
  v19.CGFloat y = y;
  BOOL v17 = CGRectContainsPoint(v20, v19);

  return v17;
}

- (_TtC23ShelfKitCollectionViews18VideoControlButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViews18VideoControlButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_backdrop));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_glyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectedGlyph));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectionHandler);

  sub_27760(v3);
}

@end