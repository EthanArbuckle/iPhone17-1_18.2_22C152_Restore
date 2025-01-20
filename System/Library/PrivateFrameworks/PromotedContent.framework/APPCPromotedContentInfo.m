@interface APPCPromotedContentInfo
- (APPCLifecycleMetricsHelping)metricsHelper;
- (APPCNativeRepresentation)nativeInfo;
- (APPCPromotedContentInfo)init;
- (BOOL)isDownloadable;
- (BOOL)isInteractive;
- (BOOL)isVideo;
- (BOOL)placeholder;
- (NSString)identifier;
- (id)ready;
- (int64_t)desiredPosition;
- (int64_t)errorReason;
- (int64_t)unfilledReason;
- (void)dealloc;
- (void)setPlaceholder:(BOOL)a3;
- (void)setUnfilledReason:(int64_t)a3;
@end

@implementation APPCPromotedContentInfo

- (APPCLifecycleMetricsHelping)metricsHelper
{
  v2 = (void *)swift_unknownObjectRetain();
  return (APPCLifecycleMetricsHelping *)v2;
}

- (id)ready
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_ready))
  {
    uint64_t v2 = *(void *)&self->promotedContent[OBJC_IVAR___APPCPromotedContentInfo_ready];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_ready);
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    v5[2] = sub_1B5C3F420;
    v5[3] = &unk_1F0EDCAA8;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSString)identifier
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_identifier);
  sub_1B5CB33C0();

  v5 = (void *)sub_1B5CB33B0();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (APPCNativeRepresentation)nativeInfo
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  if (objc_msgSend(v2, sel_bestRepresentation))
  {
    type metadata accessor for NativeRepresentation();
    id v4 = (void *)swift_dynamicCastClass();

    if (!v4) {
      swift_unknownObjectRelease();
    }
  }
  else
  {

    id v4 = 0;
  }
  return (APPCNativeRepresentation *)v4;
}

- (int64_t)desiredPosition
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_bestRepresentation);
  if (v4)
  {
    id v5 = objc_msgSend(v4, sel_desiredPosition);

    swift_unknownObjectRelease();
    return (int64_t)v5;
  }
  else
  {

    return 0;
  }
}

- (int64_t)errorReason
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent), sel_serverUnfilledReason);
}

- (int64_t)unfilledReason
{
  uint64_t v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContentInfo_unfilledReason);
  swift_beginAccess();
  return *v2;
}

- (void)setUnfilledReason:(int64_t)a3
{
  id v4 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContentInfo_unfilledReason);
  swift_beginAccess();
  *id v4 = a3;
}

- (BOOL)placeholder
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContentInfo_placeholder;
  swift_beginAccess();
  return *v2;
}

- (void)setPlaceholder:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContentInfo_placeholder;
  swift_beginAccess();
  *id v4 = a3;
}

- (BOOL)isInteractive
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  if (objc_msgSend(v2, sel_bestRepresentation))
  {
    type metadata accessor for ClientLayoutRepresentation();
    BOOL v4 = swift_dynamicCastClass() != 0;

    swift_unknownObjectRelease();
  }
  else
  {

    return 0;
  }
  return v4;
}

- (BOOL)isDownloadable
{
  uint64_t v2 = self;
  char v3 = sub_1B5C30390();

  return v3 & 1;
}

- (BOOL)isVideo
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  char v3 = self;
  if (objc_msgSend(v2, sel_bestRepresentation))
  {
    type metadata accessor for VideoRepresentation();
    if (swift_dynamicCastClass())
    {

      swift_unknownObjectRelease();
      return 1;
    }
    swift_unknownObjectRelease();
  }
  unsigned __int8 v5 = objc_msgSend(v2, sel_isOutstreamVideoAd);

  return v5;
}

- (void)dealloc
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  char v3 = self;
  if (objc_msgSend(v2, sel_adType) == (id)1) {
    objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR___APPCPromotedContentInfo_metricsHelper), sel_manuallyDiscardWithReason_, 0);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for PromotedContentInfo();
  [(APPCPromotedContentInfo *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_ready);
  sub_1B5C16CE8(v3);
}

- (APPCPromotedContentInfo)init
{
  result = (APPCPromotedContentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end