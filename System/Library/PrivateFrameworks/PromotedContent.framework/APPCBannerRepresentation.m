@interface APPCBannerRepresentation
- (APPCBannerRepresentation)initWithIdentifier:(id)a3 adType:(int64_t)a4 desiredPosition:(int64_t)a5 privacyMarkerPosition:(int64_t)a6 adSize:(CGSize)a7 tapAction:(id)a8 adTag:(id)a9 outstreamVideoInfo:(id)a10 adamIdentifier:(id)a11 tapActionTemplateType:(int64_t)a12 adPolicyData:(id)a13;
- (APPCOutstreamVideoInfo)outstreamVideoInfo;
- (NSNumber)adamIdentifier;
- (NSString)adTag;
- (int64_t)appAdTemplateType;
@end

@implementation APPCBannerRepresentation

- (NSString)adTag
{
  if (*(void *)&self->super.identifier[OBJC_IVAR___APPCBannerRepresentation_adTag])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B5CB33B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSNumber)adamIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR___APPCBannerRepresentation_adamIdentifier));
}

- (int64_t)appAdTemplateType
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCBannerRepresentation_appAdTemplateType);
}

- (APPCOutstreamVideoInfo)outstreamVideoInfo
{
  return (APPCOutstreamVideoInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR___APPCBannerRepresentation_outstreamVideoInfo));
}

- (APPCBannerRepresentation)initWithIdentifier:(id)a3 adType:(int64_t)a4 desiredPosition:(int64_t)a5 privacyMarkerPosition:(int64_t)a6 adSize:(CGSize)a7 tapAction:(id)a8 adTag:(id)a9 outstreamVideoInfo:(id)a10 adamIdentifier:(id)a11 tapActionTemplateType:(int64_t)a12 adPolicyData:(id)a13
{
  double height = a7.height;
  double width = a7.width;
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v28 = a4;
  v31 = self;
  uint64_t v17 = sub_1B5CB3100();
  MEMORY[0x1F4188790](v17 - 8);
  v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CB30E0();
  if (a9)
  {
    a9 = (id)sub_1B5CB33C0();
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = a13;
  id v23 = a11;
  id v24 = a10;
  id v25 = a8;
  v26 = (APPCBannerRepresentation *)sub_1B5C27330((uint64_t)v19, v28, v29, v30, a8, (uint64_t)a9, v21, (uint64_t)a10, width, height, (uint64_t)a11, a12, a13);

  return v26;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___APPCBannerRepresentation_outstreamVideoInfo);
}

@end