@interface CarPlayTemplateInfo
- (_TtC8Podcasts19CarPlayTemplateInfo)init;
@end

@implementation CarPlayTemplateInfo

- (_TtC8Podcasts19CarPlayTemplateInfo)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC8Podcasts19CarPlayTemplateInfo_type;
  uint64_t v5 = type metadata accessor for CarPlayTemplateInfo.TemplateType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19CarPlayTemplateInfo_playbackSource) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CarPlayTemplateInfo *)&v7 init];
}

- (void).cxx_destruct
{
}

@end