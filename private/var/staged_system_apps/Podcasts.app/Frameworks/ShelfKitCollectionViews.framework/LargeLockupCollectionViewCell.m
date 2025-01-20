@interface LargeLockupCollectionViewCell
- (BOOL)canBeEdited;
- (BOOL)isEditing;
- (_TtC23ShelfKitCollectionViews15LargeLockupView)accessibilityEmbeddedView;
- (_TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setEditing:(BOOL)a3;
@end

@implementation LargeLockupCollectionViewCell

- (_TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell *)sub_1841FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185914();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LargeLockupCollectionViewCell();
  v2 = (char *)v4.receiver;
  [(LargeLockupCollectionViewCell *)&v4 prepareForReuse];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_embeddedView];
  sub_20F1D4();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_37D3B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37D380();
  v8 = self;
  Class isa = sub_37D370().super.super.isa;
  v10 = (objc_class *)type metadata accessor for LargeLockupCollectionViewCell();
  v11.receiver = v8;
  v11.super_class = v10;
  [(LargeLockupCollectionViewCell *)&v11 _bridgedUpdateConfigurationUsingState:isa];

  sub_18476C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)canBeEdited
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_18457C((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)isEditing
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LargeLockupCollectionViewCell();
  return [(LargeLockupCollectionViewCell *)&v3 isEditing];
}

- (void)setEditing:(BOOL)a3
{
  uint64_t v4 = self;
  sub_184F38(a3);
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for LargeLockupCollectionViewCell();
  v2 = (char *)v13.receiver;
  [(LargeLockupCollectionViewCell *)&v13 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_embeddedView];
  id v4 = [v2 contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 setFrame:v6, v8, v10, v12];
}

- (_TtC23ShelfKitCollectionViews15LargeLockupView)accessibilityEmbeddedView
{
  return (_TtC23ShelfKitCollectionViews15LargeLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_embeddedView);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_embeddedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews29LargeLockupCollectionViewCell_deletionButton));

  swift_release();
}

@end