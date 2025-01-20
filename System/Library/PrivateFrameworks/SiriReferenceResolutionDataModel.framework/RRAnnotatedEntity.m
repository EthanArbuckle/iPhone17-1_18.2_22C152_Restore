@interface RRAnnotatedEntity
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSDate)foregroundedAt;
- (NSDate)mentionedAt;
- (NSDate)nearbyAt;
- (NSDate)notificationReceivedAt;
- (NSDate)nowPlayingAt;
- (NSDate)onscreenAt;
- (NSDate)saliencyComputedAt;
- (NSString)appBundleId;
- (NSString)dataType;
- (NSString)description;
- (NSString)id;
- (NSString)userId;
- (_TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity)init;
- (double)score;
- (void)setDateAnnotationWithKey:(id)a3 value:(id)a4;
- (void)setForegroundedAt:(id)a3;
- (void)setMentionedAt:(id)a3;
- (void)setNearbyAt:(id)a3;
- (void)setNotificationReceivedAt:(id)a3;
- (void)setNowPlayingAt:(id)a3;
- (void)setOnscreenAt:(id)a3;
- (void)setSaliencyComputedAt:(id)a3;
- (void)setScore:(double)a3;
- (void)setUserId:(id)a3;
@end

@implementation RRAnnotatedEntity

- (NSString)id
{
  return (NSString *)sub_2292EDDB4((uint64_t)self, (uint64_t)a2, (void (*)(void))RRAnnotatedEntity.id.getter);
}

- (NSString)appBundleId
{
  return (NSString *)sub_2292EDDB4((uint64_t)self, (uint64_t)a2, (void (*)(void))RRAnnotatedEntity.appBundleId.getter);
}

- (NSString)dataType
{
  return (NSString *)sub_2292EE5F4((uint64_t)self, (uint64_t)a2, (void (*)(void))RRAnnotatedEntity.dataType.getter);
}

- (NSData)data
{
  uint64_t v2 = RRAnnotatedEntity.data.getter();
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = v2;
    unint64_t v6 = v3;
    v4 = (void *)sub_229308CF0();
    sub_2292E3160(v5, v6);
  }
  return (NSData *)v4;
}

- (double)score
{
  return sub_2292EE030();
}

- (void)setScore:(double)a3
{
}

- (NSDate)saliencyComputedAt
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  MEMORY[0x270FA5388](v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2292EE218();
  uint64_t v5 = sub_229308D50();
  unint64_t v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    unint64_t v6 = (void *)sub_229308D20();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSDate *)v6;
}

- (void)setSaliencyComputedAt:(id)a3
{
}

- (NSString)userId
{
  return (NSString *)sub_2292EE5F4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2292EE650);
}

- (void)setUserId:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_229308FF0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_2292EE718(v4, v6);
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_2292EE860();

  uint64_t v3 = (void *)sub_229308FE0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSDate)mentionedAt
{
  return (NSDate *)sub_2292EF8B8(self, (uint64_t)a2, (void (*)(void))sub_2292EED58);
}

- (void)setMentionedAt:(id)a3
{
}

- (NSDate)onscreenAt
{
  return (NSDate *)sub_2292EF8B8(self, (uint64_t)a2, (void (*)(void))sub_2292EF240);
}

- (void)setOnscreenAt:(id)a3
{
}

- (NSDate)foregroundedAt
{
  return (NSDate *)sub_2292EF8B8(self, (uint64_t)a2, (void (*)(void))sub_2292EF558);
}

- (void)setForegroundedAt:(id)a3
{
}

- (NSDate)nearbyAt
{
  return (NSDate *)sub_2292EF8B8(self, (uint64_t)a2, (void (*)(void))sub_2292EF66C);
}

- (void)setNearbyAt:(id)a3
{
}

- (NSDate)notificationReceivedAt
{
  return (NSDate *)sub_2292EF8B8(self, (uint64_t)a2, (void (*)(void))sub_2292EF78C);
}

- (void)setNotificationReceivedAt:(id)a3
{
}

- (NSDate)nowPlayingAt
{
  return (NSDate *)sub_2292EF8B8(self, (uint64_t)a2, (void (*)(void))sub_2292EF9A8);
}

- (void)setNowPlayingAt:(id)a3
{
}

- (void)setDateAnnotationWithKey:(id)a3 value:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEC8D60);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_229308FF0();
  uint64_t v11 = v10;
  if (a4)
  {
    sub_229308D40();
    uint64_t v12 = sub_229308D50();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = sub_229308D50();
    uint64_t v13 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v8, v13, 1, v12);
  v14 = self;
  sub_2292EFB60(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  sub_2292F26C8((uint64_t)v8, &qword_26AEC8D60);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_229309130();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_2292F1F08((uint64_t)v8);

  sub_2292F26C8((uint64_t)v8, &qword_26830FD98);
  return v6 & 1;
}

- (_TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_2292F26C8((uint64_t)self + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue, &qword_26AEC8D78);
  swift_bridgeObjectRelease();
  sub_2292E3160(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data), *(void *)&self->id[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2292F26C8((uint64_t)self + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt, &qword_26AEC8D60);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end