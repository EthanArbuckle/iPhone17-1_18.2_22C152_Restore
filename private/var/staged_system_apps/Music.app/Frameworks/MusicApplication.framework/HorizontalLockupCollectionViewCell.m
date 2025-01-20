@interface HorizontalLockupCollectionViewCell
- (BOOL)isDisabled;
- (BOOL)isEditing;
- (BOOL)isSelected;
- (BOOL)showsContextMenu;
- (BOOL)wantsNowPlayingIndicator;
- (_TtC11MusicCoreUI12SymbolButton)accessibilityLibraryStatusControl;
- (_TtC11MusicCoreUI12SymbolButton)accessibilityMediaPickerAddButton;
- (_TtC11MusicCoreUI12SymbolButton)contextMenuButton;
- (_TtC11MusicCoreUI12SymbolButton)libraryStatusControl;
- (_TtC16MusicApplication34HorizontalLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication34HorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)prepareForReuse;
- (void)setContextMenuButton:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setLibraryStatusControl:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowsContextMenu:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HorizontalLockupCollectionViewCell

- (_TtC16MusicApplication34HorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication34HorizontalLockupCollectionViewCell *)sub_22C1F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5 = sub_AB24B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB2480();
  id v9 = a3;
  v10 = self;
  sub_22C8CC((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC16MusicApplication34HorizontalLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_230A3C();
}

- (BOOL)isDisabled
{
  return self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled];
}

- (void)setIsDisabled:(BOOL)a3
{
  self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled] = a3;
  id v3 = self;
  sub_22CEF0();
}

- (BOOL)showsContextMenu
{
  return self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_showsContextMenu];
}

- (void)setShowsContextMenu:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_22A24C((id)v3);
}

- (_TtC11MusicCoreUI12SymbolButton)contextMenuButton
{
  v2 = self;
  id v3 = sub_22A2E0();

  return (_TtC11MusicCoreUI12SymbolButton *)v3;
}

- (void)setContextMenuButton:(id)a3
{
  id v4 = *(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell____lazy_storage___contextMenuButton];
  *(void *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell____lazy_storage___contextMenuButton] = a3;
  id v3 = a3;
}

- (_TtC11MusicCoreUI12SymbolButton)libraryStatusControl
{
  return (_TtC11MusicCoreUI12SymbolButton *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryStatusControl];
}

- (void)setLibraryStatusControl:(id)a3
{
  id v6 = *(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryStatusControl];
  *(void *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryStatusControl] = a3;
  id v4 = a3;
  uint64_t v5 = self;
  sub_22D5A8(v6);
}

- (BOOL)wantsNowPlayingIndicator
{
  return 0;
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for HorizontalLockupCollectionViewCell();
  [(HorizontalLockupCollectionViewCell *)&v2 prepareForReuse];
}

- (BOOL)isEditing
{
  return sub_22DF60(self, (uint64_t)a2, (SEL *)&selRef_isEditing);
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (objc_class *)type metadata accessor for HorizontalLockupCollectionViewCell();
  v9.receiver = self;
  v9.super_class = v5;
  id v6 = self;
  unsigned int v7 = [(HorizontalLockupCollectionViewCell *)&v9 isEditing];
  v8.receiver = v6;
  v8.super_class = v5;
  [(HorizontalLockupCollectionViewCell *)&v8 setEditing:v3];
  if (v7 != [(HorizontalLockupCollectionViewCell *)v6 isEditing]) {
    sub_22BD28();
  }
}

- (BOOL)isSelected
{
  return sub_22DF60(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  id v4 = self;
  sub_22DFF8(a3);
}

- (void)layoutSubviews
{
  objc_super v2 = self;
  sub_22E164();
}

- (void)clearArtworkCatalogs
{
  objc_super v2 = *(void **)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkComponent];
  BOOL v3 = (void *)v2[18];
  id v4 = self;
  [v3 clearArtworkCatalogs];
  *(void *)((char *)v2
            + OBJC_IVAR____TtCE16MusicApplicationV11MusicCoreUI7Artwork9Component_representationsUpdatedFromConfigurationBlock) = 0;
  v2[29] = 0;
  v2[30] = 0;

  swift_bridgeObjectRelease();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HorizontalLockupCollectionViewCell();
  objc_super v2 = (char *)v4.receiver;
  [(HorizontalLockupCollectionViewCell *)&v4 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
  BOOL v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_layoutInvalidationHandler];
  if (v3)
  {
    swift_retain();
    v3(v2);
    sub_1A528((uint64_t)v3);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  type metadata accessor for ShelfCollectionViewLayout.LayoutAttributes();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_rowPosition] = *(unsigned char *)(v5 + OBJC_IVAR____TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes_rowPosition);
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HorizontalLockupCollectionViewCell();
  [(HorizontalLockupCollectionViewCell *)&v6 applyLayoutAttributes:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_22F5D4(a3);
}

- (_TtC11MusicCoreUI12SymbolButton)accessibilityMediaPickerAddButton
{
  return (_TtC11MusicCoreUI12SymbolButton *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_mediaPickerAddButton];
}

- (_TtC11MusicCoreUI12SymbolButton)accessibilityLibraryStatusControl
{
  return (_TtC11MusicCoreUI12SymbolButton *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryStatusControl];
}

- (void).cxx_destruct
{
  sub_1A538((uint64_t)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkCornerTreatment], &qword_DC82A0);
  sub_34BEC(*(void **)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkPlaceholder], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkPlaceholder], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkPlaceholder+ 8], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkPlaceholder+ 16]);

  sub_86DDC(*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkAccessoryStyle]);
  BOOL v3 = &self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_defaultBackgroundConfiguration];
  uint64_t v4 = sub_AB25C0();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1A528(*(void *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_layoutInvalidationHandler]);

  sub_1A500((uint64_t)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_libraryAddKeepLocalStatusControllableDelegate]);
  swift_release();
  swift_release();
  sub_1A528(*(void *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_imageDidChangeHandler]);

  swift_release();

  swift_release();
}

@end