@interface JSHeaderItem
@end

@implementation JSHeaderItem

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem_headerItemDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__subtitle;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DD74E0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__supertitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__title, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__titleHeaderStyle;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE0C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__videoDetailArtwork;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFD4E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__promotionalBackgroundArtwork;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFD4B8);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__promotionalBackgroundArtworkForRegularWidth, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__promotionalThumbnailArtwork, v11);
  v13 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__promotionalLayoutStyle;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE100);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__storeItemMetadata;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE120);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__upsellBanner;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE140);
  (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  v19 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__trailingBarButtonItem;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE160);
  (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  v21 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__contextualPlaybackProvidingURL;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE178);
  (*(void (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
  v23 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__isContentFavorited;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_DE0398);
  (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
  v25 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__inlineBubbleTipPlacement;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB48);
  (*(void (**)(char *, uint64_t))(*(void *)(v26 - 8) + 8))(v25, v26);
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem____lazy_storage___unmappedMusicItem, &qword_DFE198);
  v27 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__mappedMusicItem;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE1B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v28 - 8) + 8))(v27, v28);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end