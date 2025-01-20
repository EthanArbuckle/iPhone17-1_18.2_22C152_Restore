@interface TVMusicTrackCell
- (_TtC9SeymourUI16TVMusicTrackCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI16TVMusicTrackCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TVMusicTrackCell

- (_TtC9SeymourUI16TVMusicTrackCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI16TVMusicTrackCell *)sub_239FC3A58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI16TVMusicTrackCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239FC6290();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TVMusicTrackCell();
  v2 = (char *)v4.receiver;
  [(TVMusicTrackCell *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_floatingView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
  objc_msgSend(v3, sel_layoutIfNeeded);
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVMusicTrackCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVFocusableCollectionViewCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_itemInfo);
  long long v3 = *(_OWORD *)((char *)&self->super.super.super.super._gestureRecognizers
                 + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_layout);
  v7[4] = *(_OWORD *)((char *)&self->super.super.super.super._subviewCache
                    + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_layout);
  v7[5] = v3;
  long long v4 = *(_OWORD *)((char *)&self->super.super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_layout
                 + 16);
  v7[6] = *(_OWORD *)((char *)&self->super.super.super.super._viewFlags
                    + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_layout);
  v7[7] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_layout);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_layout);
  v7[1] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super.super._traitChangeRegistry
                 + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_layout);
  v7[2] = *(_OWORD *)((char *)&self->super.super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_layout);
  v7[3] = v6;
  sub_239FC61E8((uint64_t)v7);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TVMusicTrackCell_subtitleLabel));
}

@end