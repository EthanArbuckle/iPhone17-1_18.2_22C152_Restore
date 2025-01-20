@interface MTServerPodcastEpisode
- (BOOL)isExplicit;
- (BOOL)isRestricted;
- (BOOL)priceTypeIsPSUB;
- (MTServerPodcastEpisode)init;
- (NSDate)firstTimeAvailableAsFree;
- (NSDate)firstTimeAvailableAsPaid;
- (NSDate)pubDate;
- (NSString)artworkBackgroundColor;
- (NSString)artworkTemplateURL;
- (NSString)artworkTextPrimaryColor;
- (NSString)artworkTextQuaternaryColor;
- (NSString)artworkTextSecondaryColor;
- (NSString)artworkTextTertiaryColor;
- (NSString)author;
- (NSString)category;
- (NSString)enclosureURL;
- (NSString)entitledEnclosureURL;
- (NSString)entitledPriceType;
- (NSString)entitledTranscriptIdentifier;
- (NSString)entitledTranscriptProvider;
- (NSString)entitledTranscriptSnippet;
- (NSString)episodeStoreId;
- (NSString)episodeType;
- (NSString)freeTranscriptIdentifier;
- (NSString)freeTranscriptProvider;
- (NSString)freeTranscriptSnippet;
- (NSString)guid;
- (NSString)id;
- (NSString)itemDescription;
- (NSString)itemSummary;
- (NSString)itunesTitle;
- (NSString)priceType;
- (NSString)resolvedEnclosureUrl;
- (NSString)title;
- (NSString)type;
- (NSString)uti;
- (NSString)webpageURL;
- (double)artworkHeight;
- (double)artworkWidth;
- (double)duration;
- (double)entitledDuration;
- (int64_t)episodeNumber;
- (int64_t)seasonNumber;
- (unint64_t)byteSize;
- (unsigned)trackNum;
@end

@implementation MTServerPodcastEpisode

- (NSString)author
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[3])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (unint64_t)byteSize
{
  return 0;
}

- (NSString)category
{
  return (NSString *)sub_1ACD5E190((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.category.getter);
}

- (BOOL)isExplicit
{
  v2 = self;
  char v3 = ServerPodcastEpisode.isExplicit.getter();

  return v3 & 1;
}

- (NSString)guid
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[41])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)itemDescription
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes);
  if (*(void *)(v2 + 184)) {
    goto LABEL_2;
  }
  uint64_t v4 = *(void *)(v2 + 112);
  if (v4 && *(void *)(v4 + 24))
  {
    swift_bridgeObjectRetain();
LABEL_2:
    swift_bridgeObjectRetain();
    char v3 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  char v3 = 0;
LABEL_7:
  return (NSString *)v3;
}

- (NSDate)pubDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  PodcastEpisodeAttributes.releaseDateResolved.getter((uint64_t)v5);

  uint64_t v7 = sub_1ACE750A8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1ACE75008();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (NSDate)firstTimeAvailableAsPaid
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[26])
  {
    char v13 = 2;
    v6 = self;
    swift_retain();
    PodcastEpisodeAttributes.AvailabilityDates.subscript.getter(&v13, v5);

    swift_release();
    uint64_t v7 = sub_1ACE750A8();
    uint64_t v8 = *(void *)(v7 - 8);
    v9 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
    {
      v9 = (void *)sub_1ACE75008();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
    }
  }
  else
  {
    uint64_t v10 = sub_1ACE750A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
    v9 = 0;
  }
  return (NSDate *)v9;
}

- (NSDate)firstTimeAvailableAsFree
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  ServerPodcastEpisode.firstTimeAvailableAsFree.getter(v5);

  uint64_t v7 = sub_1ACE750A8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1ACE75008();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (NSString)title
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[11])
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (unsigned)trackNum
{
  return 0;
}

- (NSString)uti
{
  uint64_t v2 = self;
  PodcastEpisodeAttributes.uti.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)itunesTitle
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[13])
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)itemSummary
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[14];
  if (v2)
  {
    if (*(void *)(v2 + 24))
    {
LABEL_5:
      swift_bridgeObjectRetain();
      uint64_t v3 = (void *)sub_1ACE76178();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    if (*(void *)(v2 + 40))
    {
      swift_bridgeObjectRetain();
      goto LABEL_5;
    }
  }
  uint64_t v3 = 0;
LABEL_7:
  return (NSString *)v3;
}

- (int64_t)seasonNumber
{
  if ((*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[360]) {
    return 0;
  }
  else {
    return (*(void **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[44];
  }
}

- (int64_t)episodeNumber
{
  if ((*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[344]) {
    return 0;
  }
  else {
    return (*(void **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[42];
  }
}

- (NSString)episodeType
{
  return (NSString *)sub_1ACD5E754(self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.episodeType.getter);
}

- (NSString)webpageURL
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[30])
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)episodeStoreId
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)priceType
{
  uint64_t v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v6);
  swift_bridgeObjectRelease();

  uint64_t v4 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (double)duration
{
  return sub_1ACD5DAB8(self);
}

- (NSString)enclosureURL
{
  return (NSString *)sub_1ACD5DBD4(self);
}

- (NSString)entitledPriceType
{
  uint64_t v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v6);
  swift_bridgeObjectRelease();

  uint64_t v4 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (double)entitledDuration
{
  return sub_1ACD5DAB8(self);
}

- (NSString)entitledEnclosureURL
{
  return (NSString *)sub_1ACD5DBD4(self);
}

- (NSString)resolvedEnclosureUrl
{
  return (NSString *)sub_1ACD5DBD4(self);
}

- (NSString)artworkTemplateURL
{
  return (NSString *)sub_1ACD5E190((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTemplateURL.getter);
}

- (double)artworkWidth
{
  return ServerPodcastEpisode.artworkWidth.getter();
}

- (double)artworkHeight
{
  return ServerPodcastEpisode.artworkHeight.getter();
}

- (NSString)artworkBackgroundColor
{
  return (NSString *)sub_1ACD5E190((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkBackgroundColor.getter);
}

- (NSString)artworkTextPrimaryColor
{
  return (NSString *)sub_1ACD5E190((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTextPrimaryColor.getter);
}

- (NSString)artworkTextSecondaryColor
{
  return (NSString *)sub_1ACD5E190((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTextSecondaryColor.getter);
}

- (NSString)artworkTextTertiaryColor
{
  return (NSString *)sub_1ACD5E190((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTextTertiaryColor.getter);
}

- (NSString)artworkTextQuaternaryColor
{
  return (NSString *)sub_1ACD5E190((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTextQuaternaryColor.getter);
}

- (NSString)freeTranscriptIdentifier
{
  uint64_t v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v9);
  swift_bridgeObjectRelease();
  ServerPodcastEpisode.determineBestTranscriptMetadata(for:)(v4, (PodcastsFoundation::PriceType)&v10);
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    uint64_t v7 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (NSString *)v7;
}

- (NSString)entitledTranscriptIdentifier
{
  uint64_t v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v9);
  swift_bridgeObjectRelease();
  ServerPodcastEpisode.determineBestTranscriptMetadata(for:)(v4, (PodcastsFoundation::PriceType)&v10);
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    uint64_t v7 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (NSString *)v7;
}

- (NSString)freeTranscriptSnippet
{
  uint64_t v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v9);
  swift_bridgeObjectRelease();
  ServerPodcastEpisode.determineBestTranscriptMetadata(for:)(v4, (PodcastsFoundation::PriceType)&v10);
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    uint64_t v7 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (NSString *)v7;
}

- (NSString)entitledTranscriptSnippet
{
  uint64_t v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v9);
  swift_bridgeObjectRelease();
  ServerPodcastEpisode.determineBestTranscriptMetadata(for:)(v4, (PodcastsFoundation::PriceType)&v10);
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    uint64_t v7 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (NSString *)v7;
}

- (NSString)freeTranscriptProvider
{
  return (NSString *)sub_1ACD5E754(self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.freeTranscriptProvider.getter);
}

- (NSString)entitledTranscriptProvider
{
  return (NSString *)sub_1ACD5E754(self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.entitledTranscriptProvider.getter);
}

- (BOOL)priceTypeIsPSUB
{
  uint64_t v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v6);
  swift_bridgeObjectRelease();
  char v4 = 1;
  switch(v6)
  {
    case 2:
      break;
    default:
      char v4 = sub_1ACE77848();
      break;
  }

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (NSString)id
{
  return (NSString *)sub_1ACB233F8();
}

- (NSString)type
{
  return (NSString *)sub_1ACB233F8();
}

- (MTServerPodcastEpisode)init
{
  result = (MTServerPodcastEpisode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_relationships);
}

- (BOOL)isRestricted
{
  uint64_t v2 = self;
  char v3 = ServerPodcastEpisode.isRestricted.getter();

  return v3 & 1;
}

@end