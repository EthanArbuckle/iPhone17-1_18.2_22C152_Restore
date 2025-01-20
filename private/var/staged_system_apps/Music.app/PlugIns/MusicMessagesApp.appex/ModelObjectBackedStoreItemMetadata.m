@interface ModelObjectBackedStoreItemMetadata
- (BOOL)hasArtistBiography;
- (BOOL)hasLyrics;
- (BOOL)hasSocialPosts;
- (BOOL)hasTimeSyncedLyrics;
- (BOOL)isBeats1;
- (BOOL)isCompilation;
- (BOOL)isExplicitContent;
- (BOOL)isMasteredForiTunes;
- (BOOL)isOnboardedPerson;
- (BOOL)isPreorder;
- (BOOL)isPrivatePerson;
- (BOOL)isStoreRedownloadable;
- (BOOL)isVerifiedPerson;
- (BOOL)showComposer;
- (NSArray)audioTraits;
- (NSArray)genreNames;
- (NSDate)lastModifiedDate;
- (NSDate)releaseDate;
- (NSString)artistName;
- (NSString)collectionName;
- (NSString)composerName;
- (NSString)copyrightText;
- (NSString)curatorName;
- (NSString)descriptionText;
- (NSString)editorNotes;
- (NSString)handle;
- (NSString)itemKind;
- (NSString)movementName;
- (NSString)name;
- (NSString)nameRaw;
- (NSString)shortEditorNotes;
- (NSString)shortName;
- (NSString)workName;
- (NSURL)URL;
- (NSURL)shortURL;
- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)init;
- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithCoder:(id)a3;
- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithDownloadAssetDictionary:(id)a3;
- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStoreMusicAPIDictionary:(id)a3;
- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3;
- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 expirationDate:(id)a4;
- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4;
- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4 expirationDate:(id)a5;
- (double)duration;
- (id)artistStoreID;
- (id)collectionStoreID;
- (id)metadataByAppendingMetadata:(id)a3;
- (id)socialProfileID;
- (id)storeID;
- (int64_t)discCount;
- (int64_t)discNumber;
- (int64_t)episodeCount;
- (int64_t)explicitRating;
- (int64_t)movementCount;
- (int64_t)movementNumber;
- (int64_t)seasonNumber;
- (int64_t)trackCount;
- (int64_t)trackNumber;
@end

@implementation ModelObjectBackedStoreItemMetadata

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithDownloadAssetDictionary:(id)a3
{
  return (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)sub_1001B9994((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithDownloadAssetDictionary_);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3
{
  return (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)sub_1001B9994((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithStorePlatformDictionary_);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4
{
  sub_100483BF0();
  *(void *)&self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObject] = 0;
  v6 = &self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObjectStoreID];
  *(void *)v6 = 0;
  *((void *)v6 + 1) = 0;
  id v7 = a4;
  Class isa = sub_100483BD0().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ModelObjectBackedStoreItemMetadata();
  v9 = [(ModelObjectBackedStoreItemMetadata *)&v11 initWithStorePlatformDictionary:isa parentStoreItemMetadata:v7];

  return v9;
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 expirationDate:(id)a4
{
  uint64_t v5 = sub_100007568(&qword_1005A4E30);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100483BF0();
  if (a4)
  {
    sub_10047F280();
    uint64_t v9 = sub_10047F2C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_10047F2C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  }
  return (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)ModelObjectBackedStoreItemMetadata.init(storePlatformDictionary:expirationDate:)(v8, (uint64_t)v7);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStorePlatformDictionary:(id)a3 parentStoreItemMetadata:(id)a4 expirationDate:(id)a5
{
  uint64_t v7 = sub_100007568(&qword_1005A4E30);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100483BF0();
  if (a5)
  {
    sub_10047F280();
    uint64_t v11 = sub_10047F2C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_10047F2C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  id v13 = a4;
  v14 = (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)sub_1001C27A0(v10, (uint64_t)v13, (uint64_t)v9);

  return v14;
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithStoreMusicAPIDictionary:(id)a3
{
  return (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)sub_1001B9994((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithStoreMusicAPIDictionary_);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)initWithCoder:(id)a3
{
  *(void *)&self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObject] = 0;
  v4 = &self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObjectStoreID];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  id v5 = a3;

  result = (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)sub_100485590();
  __break(1u);
  return result;
}

- (id)metadataByAppendingMetadata:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = ModelObjectBackedStoreItemMetadata.appending(_:)((uint64_t)v4);

  return v6;
}

- (NSString)artistName
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.artistName.getter);
}

- (id)artistStoreID
{
  return sub_1001BB1A0(self, (uint64_t)a2, (void (*)(void *__return_ptr))ModelObjectBackedStoreItemMetadata.artistStoreID.getter);
}

- (NSArray)audioTraits
{
  v2 = self;
  ModelObjectBackedStoreItemMetadata.audioTraits.getter();

  v3.super.Class isa = sub_1004841E0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)isBeats1
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.isBeats1.getter();

  return v3 & 1;
}

- (NSString)collectionName
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.collectionName.getter);
}

- (id)collectionStoreID
{
  return sub_1001BB1A0(self, (uint64_t)a2, (void (*)(void *__return_ptr))ModelObjectBackedStoreItemMetadata.collectionStoreID.getter);
}

- (BOOL)isCompilation
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.isCompilation.getter();

  return v3 & 1;
}

- (NSString)composerName
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.composerName.getter);
}

- (NSString)copyrightText
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.copyrightText.getter);
}

- (NSString)curatorName
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.curatorName.getter);
}

- (NSString)descriptionText
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.descriptionText.getter);
}

- (int64_t)discCount
{
  v2 = self;
  int64_t v3 = ModelObjectBackedStoreItemMetadata.discCount.getter();

  return v3;
}

- (int64_t)discNumber
{
  v2 = self;
  int64_t v3 = ModelObjectBackedStoreItemMetadata.discNumber.getter();

  return v3;
}

- (double)duration
{
  v2 = self;
  ModelObjectBackedStoreItemMetadata.duration.getter();
  double v4 = v3;

  return v4;
}

- (NSString)editorNotes
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.editorNotes.getter);
}

- (NSString)shortEditorNotes
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.shortEditorNotes.getter);
}

- (int64_t)episodeCount
{
  v2 = self;
  int64_t v3 = ModelObjectBackedStoreItemMetadata.episodeCount.getter();

  return v3;
}

- (int64_t)explicitRating
{
  v2 = self;
  int64_t v3 = ModelObjectBackedStoreItemMetadata.explicitRating.getter();

  return v3;
}

- (NSArray)genreNames
{
  v2 = self;
  uint64_t v3 = ModelObjectBackedStoreItemMetadata.genreNames.getter();

  if (v3)
  {
    v4.super.Class isa = sub_1004841E0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (NSString)handle
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.handle.getter);
}

- (BOOL)hasArtistBiography
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.hasArtistBiography.getter();

  return v3 & 1;
}

- (BOOL)hasLyrics
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.hasLyrics.getter();

  return v3 & 1;
}

- (BOOL)hasTimeSyncedLyrics
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.hasTimeSyncedLyrics.getter();

  return v3 & 1;
}

- (BOOL)hasSocialPosts
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.hasSocialPosts.getter();

  return v3 & 1;
}

- (BOOL)isExplicitContent
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.isExplicitContent.getter();

  return v3 & 1;
}

- (BOOL)isMasteredForiTunes
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.isMasteredForiTunes.getter();

  return v3 & 1;
}

- (BOOL)isPreorder
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.isPreorder.getter();

  return v3 & 1;
}

- (BOOL)isPrivatePerson
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.isPrivatePerson.getter();

  return v3 & 1;
}

- (BOOL)isVerifiedPerson
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.isVerifiedPerson.getter();

  return v3 & 1;
}

- (BOOL)isOnboardedPerson
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.isOnboardedPerson.getter();

  return v3 & 1;
}

- (NSString)itemKind
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.itemKind.getter);
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)sub_1001C019C(self, (uint64_t)a2, &qword_1005A4E30, (void (*)(void))ModelObjectBackedStoreItemMetadata.lastModifiedDate.getter, (uint64_t (*)(void))&type metadata accessor for Date, (uint64_t (*)(void))&Date._bridgeToObjectiveC());
}

- (int64_t)movementCount
{
  v2 = self;
  int64_t v3 = ModelObjectBackedStoreItemMetadata.movementCount.getter();

  return v3;
}

- (NSString)movementName
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.movementName.getter);
}

- (int64_t)movementNumber
{
  v2 = self;
  int64_t v3 = ModelObjectBackedStoreItemMetadata.movementNumber.getter();

  return v3;
}

- (NSString)name
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.name.getter);
}

- (NSString)nameRaw
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.nameRaw.getter);
}

- (NSDate)releaseDate
{
  return (NSDate *)sub_1001C019C(self, (uint64_t)a2, &qword_1005A4E30, (void (*)(void))ModelObjectBackedStoreItemMetadata.releaseDate.getter, (uint64_t (*)(void))&type metadata accessor for Date, (uint64_t (*)(void))&Date._bridgeToObjectiveC());
}

- (id)socialProfileID
{
  return sub_1001BB1A0(self, (uint64_t)a2, (void (*)(void *__return_ptr))ModelObjectBackedStoreItemMetadata.socialProfileID.getter);
}

- (int64_t)seasonNumber
{
  v2 = self;
  int64_t v3 = ModelObjectBackedStoreItemMetadata.seasonNumber.getter();

  return v3;
}

- (NSString)shortName
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.shortName.getter);
}

- (NSURL)shortURL
{
  return (NSURL *)sub_1001C019C(self, (uint64_t)a2, &qword_1005A1BD0, (void (*)(void))ModelObjectBackedStoreItemMetadata.shortURL.getter, (uint64_t (*)(void))&type metadata accessor for URL, (uint64_t (*)(void))&URL._bridgeToObjectiveC());
}

- (BOOL)showComposer
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.showComposer.getter();

  return v3 & 1;
}

- (id)storeID
{
  v2 = &self->MPStoreItemMetadata_opaque[OBJC_IVAR____TtC9MusicCore34ModelObjectBackedStoreItemMetadata_modelObjectStoreID];
  swift_beginAccess();
  uint64_t v3 = *((void *)v2 + 1);
  if (v3)
  {
    v6[0] = *(void *)v2;
    v6[1] = v3;
    swift_bridgeObjectRetain();
    NSArray v4 = (void *)sub_100485910();
    sub_1001C31A4((uint64_t)v6);
  }
  else
  {
    NSArray v4 = 0;
  }

  return v4;
}

- (BOOL)isStoreRedownloadable
{
  v2 = self;
  char v3 = ModelObjectBackedStoreItemMetadata.isStoreRedownloadable.getter();

  return v3 & 1;
}

- (int64_t)trackCount
{
  v2 = self;
  int64_t v3 = ModelObjectBackedStoreItemMetadata.trackCount.getter();

  return v3;
}

- (int64_t)trackNumber
{
  v2 = self;
  int64_t v3 = ModelObjectBackedStoreItemMetadata.trackNumber.getter();

  return v3;
}

- (NSURL)URL
{
  return (NSURL *)sub_1001C019C(self, (uint64_t)a2, &qword_1005A1BD0, (void (*)(void))ModelObjectBackedStoreItemMetadata.url.getter, (uint64_t (*)(void))&type metadata accessor for URL, (uint64_t (*)(void))&URL._bridgeToObjectiveC());
}

- (NSString)workName
{
  return (NSString *)sub_1001BAF94(self, (uint64_t)a2, (void (*)(void))ModelObjectBackedStoreItemMetadata.workName.getter);
}

- (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata)init
{
  result = (_TtC9MusicCore34ModelObjectBackedStoreItemMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end