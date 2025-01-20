@interface ShapeListItemView
- (BOOL)isHighlighted;
- (_TtC8PaperKit17ShapeListItemView)initWithCoder:(id)a3;
- (_TtC8PaperKit17ShapeListItemView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ShapeListItemView

- (_TtC8PaperKit17ShapeListItemView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8PaperKit17ShapeListItemView_imageView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82828]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit17ShapeListItemView_cornerRadius) = (Class)0x4018000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit17ShapeListItemView_symbolPointSize) = (Class)0x403E000000000000;

  result = (_TtC8PaperKit17ShapeListItemView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShapeListItemView();
  return [(ShapeListItemView *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShapeListItemView();
  id v4 = v5.receiver;
  [(ShapeListItemView *)&v5 setHighlighted:v3];
  ShapeListItemView.updateUI()();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ShapeListItemView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ShapeListItemView *)&v6 traitCollectionDidChange:v4];
  ShapeListItemView.updateUI()();
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIPointerRegion);
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  [(ShapeListItemView *)v12 bounds];
  v13 = (void *)UIPointerRegion.init(rect:identifier:)();

  return v13;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UIPointerShape?);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UIPointerEffect();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v16 = (uint64_t *)((char *)&v24 - v15);
  id v17 = objc_allocWithZone(MEMORY[0x263F82CC8]);
  id v18 = a3;
  id v19 = a4;
  v20 = self;
  void *v16 = objc_msgSend(v17, sel_initWithView_, v20);
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v16, *MEMORY[0x263F81E20], v10);
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIPointerStyle);
  (*(void (**)(char *, void *, uint64_t))(v11 + 16))(v13, v16, v10);
  uint64_t v21 = type metadata accessor for UIPointerShape();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 1, 1, v21);
  v22 = (void *)UIPointerStyle.init(effect:shape:)();
  (*(void (**)(void *, uint64_t))(v11 + 8))(v16, v10);

  return v22;
}

- (_TtC8PaperKit17ShapeListItemView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit17ShapeListItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17ShapeListItemView_imageView));
}

@end