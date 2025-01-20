@interface VideoBrickRowCell
- (_TtC9SeymourUI17VideoBrickRowCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI17VideoBrickRowCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation VideoBrickRowCell

- (_TtC9SeymourUI17VideoBrickRowCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17VideoBrickRowCell *)sub_239C95FE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17VideoBrickRowCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239C96D7C();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for VideoBrickRowCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(VideoBrickRowCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell____lazy_storage___videoBrickContentView));
  long long v3 = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout
                 + 16);
  v7[6] = *(_OWORD *)((char *)&self->super.super.super._viewFlags + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[7] = v3;
  uint64_t v8 = *(void *)((char *)&self->super.super.super._minimumSafeAreaInsets.top
                 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  long long v4 = *(_OWORD *)((char *)&self->super.super.super._traitChangeRegistry
                 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[2] = *(_OWORD *)((char *)&self->super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[3] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super._gestureRecognizers
                 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[4] = *(_OWORD *)((char *)&self->super.super.super._subviewCache
                    + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[5] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI17VideoBrickRowCell_layout);
  v7[1] = v6;
  sub_239C96FE8((uint64_t)v7);
}

@end