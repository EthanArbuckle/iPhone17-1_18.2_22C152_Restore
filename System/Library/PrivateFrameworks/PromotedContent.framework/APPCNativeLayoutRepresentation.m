@interface APPCNativeLayoutRepresentation
- (APPCClientLayoutButton)button;
- (APPCNativeLayoutRepresentation)initWithIdentifier:(id)a3 adIdentifier:(id)a4 adType:(int64_t)a5 desiredPosition:(int64_t)a6 privacyMarkerPosition:(int64_t)a7 adSize:(CGSize)a8 headline:(id)a9 accessibilityHeadline:(id)a10 adCopy:(id)a11 accessibilityAdCopy:(id)a12 sponsoredBy:(id)a13 elements:(id)a14 adPolicyData:(id)a15 adFormatType:(int64_t)a16 sponsoredByAssetURL:(id)a17 sponsoredByAssetURLForDarkMode:(id)a18 button:(id)a19 actionURL:(id)a20 localizedHeadlines:(id)a21 targetingDimensions:(id)a22 tapAction:(id)a23;
- (NSArray)elements;
- (NSDictionary)localizedHeadlines;
- (NSString)accessibilityAdCopy;
- (NSString)accessibilityHeadline;
- (NSString)adCopy;
- (NSString)headline;
- (NSString)sponsoredBy;
- (NSURL)actionURL;
- (NSURL)sponsoredByAssetProxyURL;
- (NSURL)sponsoredByAssetURL;
- (NSURL)sponsoredByAssetURLForDarkModeProxyURL;
- (_TtC15PromotedContent19TargetingDimensions)targetingDimensions;
- (int64_t)adFormatType;
@end

@implementation APPCNativeLayoutRepresentation

- (NSString)headline
{
  return (NSString *)sub_1B5C24874((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_headline);
}

- (NSString)accessibilityHeadline
{
  return (NSString *)sub_1B5C24874((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_accessibilityHeadline);
}

- (NSString)adCopy
{
  return (NSString *)sub_1B5C24874((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_adCopy);
}

- (NSString)accessibilityAdCopy
{
  return (NSString *)sub_1B5C24874((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_accessibilityAdCopy);
}

- (NSString)sponsoredBy
{
  return (NSString *)sub_1B5C24874((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredBy);
}

- (NSArray)elements
{
  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___APPCNativeLayoutRepresentation_elements))
  {
    type metadata accessor for ClientLayoutElement();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B5CB34B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (int64_t)adFormatType
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCNativeLayoutRepresentation_adFormatType);
}

- (NSURL)sponsoredByAssetURL
{
  return (NSURL *)sub_1B5C60A98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetURL);
}

- (NSURL)sponsoredByAssetProxyURL
{
  return (NSURL *)sub_1B5C60A98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetProxyURL);
}

- (NSURL)sponsoredByAssetURLForDarkModeProxyURL
{
  return (NSURL *)sub_1B5C60A98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetURLForDarkModeProxyURL);
}

- (APPCClientLayoutButton)button
{
  return (APPCClientLayoutButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR___APPCNativeLayoutRepresentation_button));
}

- (NSURL)actionURL
{
  return (NSURL *)sub_1B5C60A98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_actionURL);
}

- (NSDictionary)localizedHeadlines
{
  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___APPCNativeLayoutRepresentation_localizedHeadlines))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B5CB3310();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (_TtC15PromotedContent19TargetingDimensions)targetingDimensions
{
  return (_TtC15PromotedContent19TargetingDimensions *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR___APPCNativeLayoutRepresentation_targetingDimensions));
}

- (APPCNativeLayoutRepresentation)initWithIdentifier:(id)a3 adIdentifier:(id)a4 adType:(int64_t)a5 desiredPosition:(int64_t)a6 privacyMarkerPosition:(int64_t)a7 adSize:(CGSize)a8 headline:(id)a9 accessibilityHeadline:(id)a10 adCopy:(id)a11 accessibilityAdCopy:(id)a12 sponsoredBy:(id)a13 elements:(id)a14 adPolicyData:(id)a15 adFormatType:(int64_t)a16 sponsoredByAssetURL:(id)a17 sponsoredByAssetURLForDarkMode:(id)a18 button:(id)a19 actionURL:(id)a20 localizedHeadlines:(id)a21 targetingDimensions:(id)a22 tapAction:(id)a23
{
  double height = a8.height;
  double width = a8.width;
  uint64_t v95 = a6;
  uint64_t v96 = a7;
  v93 = self;
  uint64_t v94 = a5;
  uint64_t v26 = sub_1B5BFE044((uint64_t *)&unk_1EB851560);
  uint64_t v27 = MEMORY[0x1F4188790](v26 - 8);
  v92 = (char *)&v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  v31 = (char *)&v72 - v30;
  MEMORY[0x1F4188790](v29);
  v33 = (char *)&v72 - v32;
  uint64_t v34 = sub_1B5CB3100();
  MEMORY[0x1F4188790](v34 - 8);
  uint64_t v90 = (uint64_t)&v72 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CB30E0();
  uint64_t v36 = sub_1B5CB33C0();
  uint64_t v87 = v37;
  uint64_t v88 = v36;
  v91 = v31;
  v89 = v33;
  if (a9)
  {
    uint64_t v38 = sub_1B5CB33C0();
    uint64_t v85 = v39;
    uint64_t v86 = v38;
  }
  else
  {
    uint64_t v85 = 0;
    uint64_t v86 = 0;
  }
  id v99 = a20;
  id v100 = a21;
  id v97 = a17;
  id v98 = a18;
  if (a10)
  {
    uint64_t v40 = sub_1B5CB33C0();
    uint64_t v83 = v41;
    uint64_t v84 = v40;
    if (a11)
    {
LABEL_6:
      uint64_t v80 = sub_1B5CB33C0();
      uint64_t v79 = v42;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v83 = 0;
    uint64_t v84 = 0;
    if (a11) {
      goto LABEL_6;
    }
  }
  uint64_t v80 = 0;
  uint64_t v79 = 0;
LABEL_9:
  id v82 = a23;
  id v81 = a22;
  id v43 = v100;
  id v44 = v99;
  id v78 = a19;
  id v45 = v98;
  id v46 = v97;
  id v77 = a15;
  id v47 = a14;
  id v48 = a13;
  id v49 = a12;
  if (v49)
  {
    v50 = v49;
    uint64_t v76 = sub_1B5CB33C0();
    uint64_t v75 = v51;

    if (v48)
    {
LABEL_11:
      uint64_t v74 = sub_1B5CB33C0();
      v73 = v52;

      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v76 = 0;
    uint64_t v75 = 0;
    if (v48) {
      goto LABEL_11;
    }
  }
  uint64_t v74 = 0;
  v73 = 0;
LABEL_14:
  uint64_t v53 = (uint64_t)v89;
  v54 = v43;
  if (v47)
  {
    type metadata accessor for ClientLayoutElement();
    v55 = (char *)sub_1B5CB34C0();

    if (v46)
    {
LABEL_16:
      sub_1B5CB2FA0();

      uint64_t v56 = sub_1B5CB2FC0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v53, 0, 1, v56);
      goto LABEL_19;
    }
  }
  else
  {
    v55 = 0;
    if (v46) {
      goto LABEL_16;
    }
  }
  uint64_t v57 = sub_1B5CB2FC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v53, 1, 1, v57);
LABEL_19:
  uint64_t v58 = (uint64_t)v91;
  if (v45)
  {
    sub_1B5CB2FA0();

    uint64_t v59 = sub_1B5CB2FC0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v58, 0, 1, v59);
  }
  else
  {
    uint64_t v60 = sub_1B5CB2FC0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v58, 1, 1, v60);
  }
  v61 = v92;
  if (v44)
  {
    sub_1B5CB2FA0();

    uint64_t v62 = sub_1B5CB2FC0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v61, 0, 1, v62);
  }
  else
  {
    uint64_t v63 = sub_1B5CB2FC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v61, 1, 1, v63);
  }
  if (v43)
  {
    v64 = (char *)sub_1B5CB3320();
  }
  else
  {
    v64 = 0;
  }
  v65 = v82;
  v66 = v81;
  uint64_t v71 = (uint64_t)v61;
  id v67 = v78;
  v68 = v77;
  v69 = (APPCNativeLayoutRepresentation *)sub_1B5C633E8(v90, v88, v87, v94, v95, v96, v86, v85, width, height, v84, v83, v80, v79, v76, v75, v74, v73, v55,
                                            v77,
                                            a16,
                                            v53,
                                            v58,
                                            (uint64_t)v78,
                                            v71,
                                            v64,
                                            v81,
                                            v82);

  return v69;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B5C077A4((uint64_t)self + OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetURL);
  sub_1B5C077A4((uint64_t)self + OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetProxyURL);
  sub_1B5C077A4((uint64_t)self + OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetURLForDarkModeProxyURL);

  sub_1B5C077A4((uint64_t)self + OBJC_IVAR___APPCNativeLayoutRepresentation_actionURL);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___APPCNativeLayoutRepresentation_targetingDimensions);
}

@end