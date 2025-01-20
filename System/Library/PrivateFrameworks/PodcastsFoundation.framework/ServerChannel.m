@interface ServerChannel
- (NSString)artworkURL;
- (NSString)backgroundColor;
- (NSString)displayType;
- (NSString)fallbackSubscriptionName;
- (NSString)id;
- (NSString)logoImageURL;
- (NSString)name;
- (NSString)storeId;
- (NSString)subscriptionName;
- (NSString)type;
- (NSString)uberBackgroundImageURL;
- (NSString)uberBackgroundJoeColor;
- (NSString)url;
- (float)logoImageHeight;
- (float)logoImageWidth;
- (int64_t)availableShowCount;
- (int64_t)showCount;
@end

@implementation ServerChannel

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)subscriptionName
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[13])
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

- (int64_t)showCount
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes);
  if (*(unsigned char *)(v2 + 56)) {
    return 0;
  }
  else {
    return *(void *)(v2 + 48);
  }
}

- (int64_t)availableShowCount
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes);
  if (*(unsigned char *)(v2 + 72)) {
    return 0;
  }
  else {
    return *(void *)(v2 + 64);
  }
}

- (NSString)storeId
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)displayType
{
  uint64_t v2 = self;
  sub_1ACADF9EC((uint64_t)v2, &v5);

  v3 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)artworkURL
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[3];
  if (v2 && *(void *)(v2 + 56))
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

- (NSString)logoImageURL
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[16];
  if (v2 && *(void *)(v2 + 56))
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

- (NSString)backgroundColor
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[18])
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

- (float)logoImageHeight
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[16];
  if (v2 && (*(unsigned char *)(v2 + 40) & 1) == 0) {
    return (float)*(uint64_t *)(v2 + 32);
  }
  else {
    return (float)0;
  }
}

- (float)logoImageWidth
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[16];
  if (v2 && (*(unsigned char *)(v2 + 24) & 1) == 0) {
    return (float)*(uint64_t *)(v2 + 16);
  }
  else {
    return (float)0;
  }
}

- (NSString)uberBackgroundImageURL
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[14];
  if (v2 && (uint64_t v3 = *(void *)(v2 + 32)) != 0 && *(void *)(v3 + 56))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)uberBackgroundJoeColor
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[14];
  if (v2 && (uint64_t v3 = *(void *)(v2 + 32)) != 0 && *(void *)(v3 + 72))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)url
{
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[21])
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

- (NSString)fallbackSubscriptionName
{
  uint64_t v2 = self;
  ServerChannel.fallbackSubscriptionName.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    char v5 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)id
{
  return (NSString *)sub_1ACB233F8();
}

- (NSString)type
{
  return (NSString *)sub_1ACB233F8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end