@interface PreferredMusicGenreCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI23PreferredMusicGenreCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI23PreferredMusicGenreCell)initWithFrame:(CGRect)a3;
- (void)contentSizeCategoryChanged;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PreferredMusicGenreCell

- (_TtC9SeymourUI23PreferredMusicGenreCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23PreferredMusicGenreCell *)sub_23A718058(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23PreferredMusicGenreCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A719ABC();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreferredMusicGenreCell();
  v2 = (char *)v5.receiver;
  [(PreferredMusicGenreCell *)&v5 layoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_platter], sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, v4 * 0.5);
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  objc_super v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for PreferredMusicGenreCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(PreferredMusicGenreCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(PreferredMusicGenreCell *)v9 contentView];
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)contentSizeCategoryChanged
{
  v2 = self;
  id v3 = [(PreferredMusicGenreCell *)v2 traitCollection];
  uint64_t v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_titleLabel);
  long long v5 = *(_OWORD *)((char *)&v2->super.super.super._swiftAnimationInfo
                 + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  uint64_t v6 = *(uint64_t *)((char *)&v2->super.super.super._viewDelegate
                  + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  long long v7 = *(_OWORD *)((char *)&v2->super.super.super._window
                 + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  v9[1] = *(_OWORD *)((char *)&v2->super.super.super._layerRetained
                    + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  v9[2] = v7;
  uint64_t v10 = v6;
  v9[0] = v5;
  sub_239EC18FC((uint64_t)v9);
  id v8 = sub_239E50248(v3);
  sub_239EC1948((uint64_t)v9);
  objc_msgSend(v4, sel_setFont_, v8);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_platter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_titleLabel));
  id v3 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  uint64_t v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI23PreferredMusicGenreCell_styleProvider);
  long long v5 = (void *)v3[3];
  uint64_t v6 = (void *)v3[4];
  long long v7 = (void *)v3[5];
  id v9 = (id)v3[6];
  id v8 = (void *)v3[7];
  swift_bridgeObjectRelease();
}

@end