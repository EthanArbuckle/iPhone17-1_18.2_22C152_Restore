@interface APPCNativeRepresentation
- (APPCNativeRepresentation)initWithIdentifier:(id)a3 adType:(int64_t)a4 desiredPosition:(int64_t)a5 privacyMarkerPosition:(int64_t)a6 articleID:(id)a7 articleTitle:(id)a8 adSponsor:(id)a9 campaignData:(id)a10 adSize:(CGSize)a11 adPolicyData:(id)a12;
- (NSString)advertiserName;
- (NSString)articleID;
- (NSString)articleTitle;
- (NSString)campaignData;
@end

@implementation APPCNativeRepresentation

- (NSString)articleID
{
  return (NSString *)sub_1B5C248F8();
}

- (NSString)articleTitle
{
  return (NSString *)sub_1B5C24874((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeRepresentation_articleTitle);
}

- (NSString)advertiserName
{
  return (NSString *)sub_1B5C24874((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeRepresentation_advertiserName);
}

- (NSString)campaignData
{
  return (NSString *)sub_1B5C248F8();
}

- (APPCNativeRepresentation)initWithIdentifier:(id)a3 adType:(int64_t)a4 desiredPosition:(int64_t)a5 privacyMarkerPosition:(int64_t)a6 articleID:(id)a7 articleTitle:(id)a8 adSponsor:(id)a9 campaignData:(id)a10 adSize:(CGSize)a11 adPolicyData:(id)a12
{
  double height = a11.height;
  double width = a11.width;
  v39 = self;
  uint64_t v40 = a6;
  uint64_t v37 = a4;
  uint64_t v38 = a5;
  uint64_t v16 = sub_1B5CB3100();
  MEMORY[0x1F4188790](v16 - 8);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CB30E0();
  if (a7)
  {
    uint64_t v36 = sub_1B5CB33C0();
    unint64_t v20 = v19;
  }
  else
  {
    uint64_t v36 = 0;
    unint64_t v20 = 0;
  }
  id v21 = a9;
  if (a8)
  {
    uint64_t v22 = sub_1B5CB33C0();
    uint64_t v24 = v23;
    if (a9)
    {
LABEL_6:
      uint64_t v25 = sub_1B5CB33C0();
      id v21 = v26;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    if (a9) {
      goto LABEL_6;
    }
  }
  uint64_t v25 = 0;
LABEL_9:
  id v27 = a12;
  id v28 = a10;
  if (v28)
  {
    v29 = v28;
    uint64_t v30 = sub_1B5CB33C0();
    unint64_t v32 = v31;
  }
  else
  {
    uint64_t v30 = 0;
    unint64_t v32 = 0;
  }
  v33 = (APPCNativeRepresentation *)sub_1B5C25C1C((uint64_t)v18, v37, v38, v40, v36, v20, v22, v24, width, height, v25, (uint64_t)v21, v30, v32, v27);

  return v33;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end