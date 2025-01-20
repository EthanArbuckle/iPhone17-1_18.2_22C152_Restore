@interface MTServerPodcast
- (BOOL)hasEpisodes;
- (BOOL)isExplicit;
- (BOOL)isNotSubscribable;
- (MTFeedChannel)channelItem;
- (NSArray)offers;
- (NSOrderedSet)categories;
- (NSString)artworkPrimaryColor;
- (NSString)artworkTemplateURL;
- (NSString)artworkTextPrimaryColor;
- (NSString)artworkTextQuaternaryColor;
- (NSString)artworkTextSecondaryColor;
- (NSString)artworkTextTertiaryColor;
- (NSString)category;
- (NSString)displayType;
- (NSString)feedDescription;
- (NSString)globalImageURL;
- (NSString)imageURL;
- (NSString)podcastStoreId;
- (NSString)resolvedFeedURL;
- (NSString)shareURL;
- (NSString)showSpecificUpsellCopy;
- (NSString)showType;
- (NSString)title;
- (NSString)uberArtworkTextPrimaryColor;
- (NSString)uberArtworkTextQuaternaryColor;
- (NSString)uberArtworkTextSecondaryColor;
- (NSString)uberArtworkTextTertiaryColor;
- (NSString)uberBackgroundImageURL;
- (NSString)uberBackgroundJoeColor;
- (NSString)updatedFeedURL;
- (NSString)webpageURL;
- (id)author;
- (id)toFeed;
@end

@implementation MTServerPodcast

- (id)toFeed
{
  v2 = self;
  ServerPodcast.toFeed()(v3);
  v5 = v4;

  return v5;
}

- (NSString)feedDescription
{
  return (NSString *)sub_1ACC06890(self, (uint64_t)a2, (void (*)(void))ServerPodcast.feedDescription.getter);
}

- (NSString)category
{
  ServerPodcast.category.getter();
  if (v2)
  {
    v3 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)globalImageURL
{
  return (NSString *)0;
}

- (BOOL)hasEpisodes
{
  v3 = (unint64_t *)((char *)self + OBJC_IVAR___MTServerPodcast_episodes);
  swift_beginAccess();
  unint64_t v4 = *v3;
  if (!v4) {
    return 0;
  }
  if (v4 >> 62)
  {
    v7 = self;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1ACE77508();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 != 0;
}

- (id)author
{
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v1 && *(void *)(v1 + 24))
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (NSString)updatedFeedURL
{
  return (NSString *)0;
}

- (NSString)resolvedFeedURL
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(void *)(v2 + 80))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)title
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(void *)(v2 + 96))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isExplicit
{
  uint64_t v2 = self;
  char v3 = ServerPodcast.isExplicit.getter();

  return v3 & 1;
}

- (BOOL)isNotSubscribable
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (!v2) {
    return 0;
  }
  int v3 = *(unsigned __int8 *)(v2 + 48);
  return (v3 & 1) == 0 && v3 != 2;
}

- (NSString)shareURL
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(void *)(v2 + 40))
  {
    swift_bridgeObjectRetain();
    int v3 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)showType
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(void *)(v2 + 144))
  {
    swift_bridgeObjectRetain();
    int v3 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)webpageURL
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(void *)(v2 + 200))
  {
    swift_bridgeObjectRetain();
    int v3 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)podcastStoreId
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)displayType
{
  return (NSString *)sub_1ACC06890(self, (uint64_t)a2, (void (*)(void))ServerPodcast.displayType.getter);
}

- (NSArray)offers
{
  uint64_t v2 = self;
  uint64_t v3 = ServerPodcast.offers.getter();

  if (v3)
  {
    sub_1ACC072E4();
    unint64_t v4 = (void *)sub_1ACE76558();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v4 = 0;
  }
  return (NSArray *)v4;
}

- (NSString)uberBackgroundImageURL
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(void *)(v2 + 152)) != 0 && (uint64_t v4 = *(void *)(v3 + 16)) != 0 && *(void *)(v4 + 56))
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberBackgroundJoeColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(void *)(v2 + 152)) != 0 && (uint64_t v4 = *(void *)(v3 + 16)) != 0 && *(void *)(v4 + 72))
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberArtworkTextPrimaryColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(void *)(v2 + 152)) != 0 && (uint64_t v4 = *(void *)(v3 + 16)) != 0 && *(void *)(v4 + 88))
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberArtworkTextSecondaryColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(void *)(v2 + 152)) != 0 && (uint64_t v4 = *(void *)(v3 + 16)) != 0 && *(void *)(v4 + 104))
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberArtworkTextTertiaryColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(void *)(v2 + 152)) != 0 && (uint64_t v4 = *(void *)(v3 + 16)) != 0 && *(void *)(v4 + 120))
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberArtworkTextQuaternaryColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(void *)(v2 + 152)) != 0 && (uint64_t v4 = *(void *)(v3 + 16)) != 0 && *(void *)(v4 + 136))
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)imageURL
{
  return (NSString *)sub_1ACC06890(self, (uint64_t)a2, (void (*)(void))ServerPodcast.imageURL.getter);
}

- (NSString)artworkTemplateURL
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 112)) != 0 && *(void *)(v3 + 56))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkPrimaryColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 112)) != 0 && *(void *)(v3 + 72))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkTextPrimaryColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 112)) != 0 && *(void *)(v3 + 88))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkTextSecondaryColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 112)) != 0 && *(void *)(v3 + 104))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkTextTertiaryColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 112)) != 0 && *(void *)(v3 + 120))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkTextQuaternaryColor
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 112)) != 0 && *(void *)(v3 + 136))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSString *)v4;
}

- (MTFeedChannel)channelItem
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)ServerPodcast.channelItem.getter();

  return (MTFeedChannel *)v3;
}

- (NSString)showSpecificUpsellCopy
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(void *)(v2 + 240))
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (NSOrderedSet)categories
{
  uint64_t v2 = self;
  id v3 = ServerPodcast.categories.getter();

  return (NSOrderedSet *)v3;
}

- (void).cxx_destruct
{
}

@end