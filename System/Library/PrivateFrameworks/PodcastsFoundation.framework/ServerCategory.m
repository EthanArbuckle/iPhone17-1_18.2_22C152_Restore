@interface ServerCategory
- (MTFeedCategory)parent;
- (NSNumber)artworkHeight;
- (NSNumber)artworkWidth;
- (NSSet)children;
- (NSString)artworkPrimaryColor;
- (NSString)artworkTemplateURL;
- (NSString)color;
- (NSString)id;
- (NSString)identifier;
- (NSString)name;
- (NSString)type;
- (NSString)url;
@end

@implementation ServerCategory

- (NSString)id
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)type
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSNumber)artworkHeight
{
  uint64_t v2 = *(void *)(*(void *)self->attributes + 48);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 16)) != 0 && (*(unsigned char *)(v3 + 40) & 1) == 0) {
    v4 = (void *)sub_1ACE76A58();
  }
  else {
    v4 = 0;
  }
  return (NSNumber *)v4;
}

- (NSNumber)artworkWidth
{
  uint64_t v2 = *(void *)(*(void *)self->attributes + 48);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 16)) != 0 && (*(unsigned char *)(v3 + 24) & 1) == 0) {
    v4 = (void *)sub_1ACE76A58();
  }
  else {
    v4 = 0;
  }
  return (NSNumber *)v4;
}

- (NSString)artworkPrimaryColor
{
  uint64_t v2 = *(void *)(*(void *)self->attributes + 48);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 16)) != 0 && *(void *)(v3 + 72))
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

- (NSString)artworkTemplateURL
{
  uint64_t v2 = *(void *)(*(void *)self->attributes + 48);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 16)) != 0 && *(void *)(v3 + 56))
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

- (NSString)name
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)url
{
  if (*(void *)(*(void *)self->attributes + 40))
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

- (NSString)color
{
  if (*(void *)(*(void *)self->attributes + 64))
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

- (MTFeedCategory)parent
{
  swift_retain();
  uint64_t v2 = (void *)ServerCategory.parent.getter();
  swift_release();
  return (MTFeedCategory *)v2;
}

- (NSSet)children
{
  uint64_t v2 = *(void *)self->relationships;
  if (v2 && (uint64_t v3 = *(void *)(v2 + 24)) != 0)
  {
    unint64_t v4 = *(void *)(v3 + 16);
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v4 = MEMORY[0x1E4FBC860];
  }
  swift_retain();
  uint64_t v5 = sub_1ACA4ED80(v4);
  swift_bridgeObjectRelease();
  sub_1ACDF77B0(v5);
  swift_release();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_1ACE76978();
  swift_bridgeObjectRelease();
  return (NSSet *)v6;
}

@end