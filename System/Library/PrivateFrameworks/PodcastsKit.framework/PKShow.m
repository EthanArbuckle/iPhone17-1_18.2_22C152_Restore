@interface PKShow
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isInLibrary;
- (BOOL)isSubscribed;
- (NSString)descriptionText;
- (NSString)title;
- (PKShow)init;
- (PKShow)initWithCoder:(id)a3;
- (PKShowStoreId)storeId;
- (id)artworkUrlFor:(CGSize)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKShow

- (BOOL)isInLibrary
{
  v2 = self;
  char v3 = Show.isInLibrary.getter();

  return v3 & 1;
}

- (id)artworkUrlFor:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C34208);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  Show.artworkUrl(for:)((uint64_t)v8, width, height);

  uint64_t v10 = sub_23F0BF470();
  uint64_t v11 = *(void *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    v12 = (void *)sub_23F0BF440();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  return v12;
}

- (BOOL)isSubscribed
{
  v2 = self;
  char v3 = Show.isSubscribed.getter();

  return v3 & 1;
}

- (PKShow)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PKShow_podcastUuid);
  void *v2 = 0;
  v2[1] = 0;

  result = (PKShow *)sub_23F0BF940();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return byte_268C34230;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_268C34230 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  Show.encode(with:)((NSCoder)v4);
}

- (PKShow)initWithCoder:(id)a3
{
  return (PKShow *)Show.init(coder:)(a3);
}

- (NSString)title
{
  return (NSString *)sub_23F0B73A4();
}

- (NSString)descriptionText
{
  return (NSString *)sub_23F0B73A4();
}

- (PKShowStoreId)storeId
{
  return (PKShowStoreId *)*(id *)((char *)&self->super.isa + OBJC_IVAR___PKShow_storeId);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end