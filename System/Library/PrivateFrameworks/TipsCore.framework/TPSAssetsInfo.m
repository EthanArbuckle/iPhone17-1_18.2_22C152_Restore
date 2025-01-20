@interface TPSAssetsInfo
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSString)imageIdentifier;
- (NSString)videoIdentifier;
- (NSURL)imageURL;
- (NSURL)videoURL;
- (TPSAssetsInfo)init;
- (TPSAssetsInfo)initWithCoder:(id)a3;
- (TPSAssetsInfo)initWithVideoIdentifier:(id)a3 videoURL:(id)a4 imageIdentifier:(id)a5 imageURL:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setImageIdentifier:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setVideoIdentifier:(id)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation TPSAssetsInfo

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_19C8DEF34((uint64_t)self + OBJC_IVAR___TPSAssetsInfo_videoURL);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TPSAssetsInfo_imageURL;
  sub_19C8DEF34((uint64_t)v3);
}

- (TPSAssetsInfo)initWithVideoIdentifier:(id)a3 videoURL:(id)a4 imageIdentifier:(id)a5 imageURL:(id)a6
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB516C18);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  v15 = (char *)&v25 - v14;
  if (a3)
  {
    a3 = (id)sub_19C9768B0();
    uint64_t v17 = v16;
    if (a4)
    {
LABEL_3:
      sub_19C976420();
      uint64_t v18 = sub_19C976480();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 0, 1, v18);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = sub_19C976480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v15, 1, 1, v19);
LABEL_6:
  if (!a5)
  {
    uint64_t v21 = 0;
    if (a6) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v23 = sub_19C976480();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v13, 1, 1, v23);
    return (TPSAssetsInfo *)TPSAssetsInfo.init(videoIdentifier:videoURL:imageIdentifier:imageURL:)((uint64_t)a3, v17, (uint64_t)v15, (uint64_t)a5, v21, (uint64_t)v13);
  }
  a5 = (id)sub_19C9768B0();
  uint64_t v21 = v20;
  if (!a6) {
    goto LABEL_10;
  }
LABEL_8:
  sub_19C976420();
  uint64_t v22 = sub_19C976480();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v13, 0, 1, v22);
  return (TPSAssetsInfo *)TPSAssetsInfo.init(videoIdentifier:videoURL:imageIdentifier:imageURL:)((uint64_t)a3, v17, (uint64_t)v15, (uint64_t)a5, v21, (uint64_t)v13);
}

- (NSString)videoIdentifier
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSAssetsInfo_videoIdentifier);
}

- (void)setVideoIdentifier:(id)a3
{
}

- (NSURL)videoURL
{
  return (NSURL *)sub_19C955DC0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSAssetsInfo_videoURL);
}

- (void)setVideoURL:(id)a3
{
}

- (NSString)imageIdentifier
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSAssetsInfo_imageIdentifier);
}

- (void)setImageIdentifier:(id)a3
{
}

- (NSURL)imageURL
{
  return (NSURL *)sub_19C955DC0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSAssetsInfo_imageURL);
}

- (void)setImageURL:(id)a3
{
}

- (TPSAssetsInfo)init
{
  result = (TPSAssetsInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  TPSAssetsInfo.encode(with:)((NSCoder)v4);
}

- (TPSAssetsInfo)initWithCoder:(id)a3
{
  return (TPSAssetsInfo *)TPSAssetsInfo.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  TPSAssetsInfo.description.getter();

  v3 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end