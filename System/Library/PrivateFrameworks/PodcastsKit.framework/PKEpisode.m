@interface PKEpisode
+ (BOOL)supportsSecureCoding;
+ (id)contentFrom:(id)a3;
+ (id)itemFrom:(id)a3;
+ (int64_t)mediaTaskType;
+ (void)fetchEpisodeFrom:(id)a3 completion:(id)a4;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isExplicit;
- (NSDate)releaseDate;
- (NSString)episodeUuid;
- (NSString)guid;
- (NSString)streamUrl;
- (NSString)title;
- (NSString)uuid;
- (PKEpisode)init;
- (PKEpisode)initWithCoder:(id)a3;
- (PKEpisode)initWithTitle:(id)a3 releaseDate:(id)a4 isExplicit:(BOOL)a5 duration:(double)a6 storeId:(id)a7 show:(id)a8 guid:(id)a9 uuid:(id)a10 streamUrl:(id)a11;
- (PKEpisodeStoreId)storeId;
- (PKShow)show;
- (double)duration;
- (id)initFrom:(id)a3;
- (id)lookupEpisode;
- (void)encodeWithCoder:(id)a3;
- (void)setEpisodeUuid:(id)a3;
- (void)setGuid:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateForDatabaseMatch;
@end

@implementation PKEpisode

- (void)updateForDatabaseMatch
{
  v2 = self;
  sub_23F0AC708();
}

- (PKEpisode)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_guid);
  void *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_uuid);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_episodeUuid);
  void *v4 = 0;
  v4[1] = 0;

  result = (PKEpisode *)sub_23F0BF940();
  __break(1u);
  return result;
}

- (PKEpisode)initWithTitle:(id)a3 releaseDate:(id)a4 isExplicit:(BOOL)a5 duration:(double)a6 storeId:(id)a7 show:(id)a8 guid:(id)a9 uuid:(id)a10 streamUrl:(id)a11
{
  BOOL v36 = a5;
  v37 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C34118);
  MEMORY[0x270FA5388]();
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_23F0BF6A0();
  uint64_t v19 = v18;
  if (a4)
  {
    sub_23F0BF4E0();
    uint64_t v20 = sub_23F0BF500();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_23F0BF500();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v17, 1, 1, v21);
  }
  id v22 = a10;
  if (a9)
  {
    a9 = (id)sub_23F0BF6A0();
    uint64_t v24 = v23;
    uint64_t v25 = (uint64_t)a11;
    if (a10) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v26 = 0;
    if (v25) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v29 = 0;
    goto LABEL_11;
  }
  uint64_t v24 = 0;
  uint64_t v25 = (uint64_t)a11;
  if (!a10) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v26 = sub_23F0BF6A0();
  id v22 = v27;
  if (!v25) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v25 = sub_23F0BF6A0();
  uint64_t v29 = v28;
LABEL_11:
  id v30 = a7;
  id v31 = a8;
  v32 = (PKEpisode *)sub_23F0AE74C(v35, v19, (uint64_t)v17, v36, v30, v31, (uint64_t)a9, v24, a6, v26, (uint64_t)v22, v25, v29);

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return byte_268C34110;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_268C34110 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  Episode.encode(with:)((NSCoder)v4);
}

- (PKEpisode)initWithCoder:(id)a3
{
  return (PKEpisode *)Episode.init(coder:)(a3);
}

- (NSString)title
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23F0BF690();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDate)releaseDate
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C34118);
  MEMORY[0x270FA5388]();
  id v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F0ADB74((uint64_t)self + OBJC_IVAR___PKEpisode_releaseDate, (uint64_t)v4);
  uint64_t v5 = sub_23F0BF500();
  uint64_t v6 = *(void *)(v5 - 8);
  v7 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    v7 = (void *)sub_23F0BF4B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  return (NSDate *)v7;
}

- (BOOL)isExplicit
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PKEpisode_isExplicit);
}

- (double)duration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_duration);
}

- (PKEpisodeStoreId)storeId
{
  return (PKEpisodeStoreId *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___PKEpisode_storeId));
}

- (PKShow)show
{
  return (PKShow *)*(id *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_show);
}

- (NSString)guid
{
  return (NSString *)sub_23F0AE3D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PKEpisode_guid);
}

- (void)setGuid:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)sub_23F0AE3D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PKEpisode_uuid);
}

- (void)setUuid:(id)a3
{
}

- (NSString)streamUrl
{
  return (NSString *)sub_23F0AE3D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PKEpisode_streamUrl);
}

- (NSString)episodeUuid
{
  return (NSString *)sub_23F0AE3D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PKEpisode_episodeUuid);
}

- (void)setEpisodeUuid:(id)a3
{
}

+ (int64_t)mediaTaskType
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_23F0ADBDC((uint64_t)self + OBJC_IVAR___PKEpisode_releaseDate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)contentFrom:(id)a3
{
  swift_getObjCClassMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C342A0);
  uint64_t v3 = sub_23F0BF780();
  sub_23F0B1E10(v3);
  swift_bridgeObjectRelease();
  id v4 = (void *)sub_23F0BF770();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)itemFrom:(id)a3
{
  uint64_t v3 = sub_23F0BF680();
  id v4 = sub_23F0B1780(v3);
  swift_bridgeObjectRelease();
  return v4;
}

- (id)initFrom:(id)a3
{
  return sub_23F0B2198(a3);
}

- (id)lookupEpisode
{
  v2 = self;
  id v3 = sub_23F0B2508();

  return v3;
}

+ (void)fetchEpisodeFrom:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  _Block_copy(v5);
  id v6 = a3;
  sub_23F0BDF84(a3, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);
}

@end