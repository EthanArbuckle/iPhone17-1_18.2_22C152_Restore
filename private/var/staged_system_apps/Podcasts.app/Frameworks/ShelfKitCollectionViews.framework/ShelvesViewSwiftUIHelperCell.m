@interface ShelvesViewSwiftUIHelperCell
- (UICellConfigurationState)_bridgedConfigurationState;
- (_TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
@end

@implementation ShelvesViewSwiftUIHelperCell

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_12A394(v4);
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3 = sub_37D3B0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_12A698();

  v8.super.super.isa = sub_37D370().super.super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (UICellConfigurationState *)v8.super.super.isa;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_12A78C();
}

- (_TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell_cellSize) = _Q0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell_objectGraph) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell_interactionContextView) = 7;
  v14 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell_transitionNamespace;
  *(void *)v14 = 0;
  v14[8] = 1;
  v16.receiver = self;
  v16.super_class = ObjectType;
  return -[ShelvesViewSwiftUIHelperCell initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell *)sub_12A8FC(a3);
}

- (void).cxx_destruct
{
}

@end