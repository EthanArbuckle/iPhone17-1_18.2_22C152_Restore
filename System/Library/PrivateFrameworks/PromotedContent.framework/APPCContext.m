@interface APPCContext
- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 adjacent:(id)a6;
- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 adjacent:(id)a6 newsContext:(id)a7;
- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 next:(id)a6;
- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 next:(id)a6 newsContext:(id)a7;
- (NSDate)prefetchTimestamp;
- (NSString)debugDescription;
- (id)promotedContentInterstitialWithSize:(CGSize)a3 ready:(id)a4;
- (id)promotedContentVideoWithSize:(CGSize)a3 placeholderReplacement:(id)a4;
- (id)promotedContentWithType:(int64_t)a3 size:(CGSize)a4 placeholderReplacement:(id)a5;
- (id)promotedContentWithoutFetchWithType:(int64_t)a3 size:(CGSize)a4;
- (int64_t)hash;
- (void)dealloc;
- (void)nativePromotedContentWithSize:(CGSize)a3 contentFetched:(id)a4;
- (void)prefetchPromotedContentWithRequests:(id)a3;
- (void)promotedContentNativeWithSize:(CGSize)a3 contentFetched:(id)a4;
- (void)registerDenylistEvaluator:(id)a3;
- (void)registerHandlerForAllMetricsWithClosure:(id)a3;
- (void)removeHandler;
- (void)setPrefetchTimestamp:(id)a3;
@end

@implementation APPCContext

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = Context.hash.getter();

  return v3;
}

- (void)registerDenylistEvaluator:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___APPCContext_denylistEvaluator);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCContext_denylistEvaluator);
  *v6 = sub_1B5C20DEC;
  v6[1] = (uint64_t (*)())v5;
  sub_1B5C16CE8(v7);
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1B5C3FA3C();

  int64_t v3 = (void *)sub_1B5CB33B0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSDate)prefetchTimestamp
{
  uint64_t v3 = sub_1B5BFE044((uint64_t *)&unk_1EB851B10);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___APPCContext_prefetchTimestamp;
  swift_beginAccess();
  sub_1B5C000C4((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1EB851B10);
  uint64_t v7 = sub_1B5CB3090();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1B5CB3040();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setPrefetchTimestamp:(id)a3
{
  uint64_t v5 = sub_1B5BFE044((uint64_t *)&unk_1EB851B10);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B5CB3060();
    uint64_t v8 = sub_1B5CB3090();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1B5CB3090();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___APPCContext_prefetchTimestamp;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1B5BFDFDC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 next:(id)a6 newsContext:(id)a7
{
  return (APPCContext *)sub_1B5C4116C(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *, double, double))Context.init(maxSize:requestedAd:current:next:newsContext:));
}

- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 next:(id)a6
{
  return (APPCContext *)sub_1B5C42BAC(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double, double))Context.init(maxSize:requestedAd:current:next:));
}

- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 adjacent:(id)a6 newsContext:(id)a7
{
  return (APPCContext *)sub_1B5C4116C(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *, double, double))Context.init(maxSize:requestedAd:current:adjacent:newsContext:));
}

- (APPCContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 adjacent:(id)a6
{
  return (APPCContext *)sub_1B5C42BAC(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double, double))Context.init(maxSize:requestedAd:current:adjacent:));
}

- (void)dealloc
{
  v2 = self;
  Context.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B5C16CE8(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCContext_denylistEvaluator));
  sub_1B5C2434C((uint64_t)self + OBJC_IVAR___APPCContext_prefetchTimestamp, (uint64_t *)&unk_1EB851B10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)prefetchPromotedContentWithRequests:(id)a3
{
  type metadata accessor for DesiredPlacement();
  unint64_t v4 = sub_1B5CB34C0();
  uint64_t v5 = self;
  sub_1B5C444B4(v4);

  swift_bridgeObjectRelease();
}

- (id)promotedContentVideoWithSize:(CGSize)a3 placeholderReplacement:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = self;
  v10 = sub_1B5C491B8(3, (uint64_t)sub_1B5C47E58, v8, width, height);

  swift_release();
  return v10;
}

- (id)promotedContentWithType:(int64_t)a3 size:(CGSize)a4 placeholderReplacement:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v9 = _Block_copy(a5);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = self;
  uint64_t v12 = sub_1B5C491B8(a3, (uint64_t)sub_1B5C20DEC, v10, width, height);

  swift_release();
  return v12;
}

- (id)promotedContentWithoutFetchWithType:(int64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_1B5C449C4(a3, width, height);

  return v8;
}

- (id)promotedContentInterstitialWithSize:(CGSize)a3 ready:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = self;
  id v10 = Context.promotedContentInterstitial(size:ready:)((uint64_t)sub_1B5C47E58, v8, width, height);

  swift_release();
  return v10;
}

- (void)nativePromotedContentWithSize:(CGSize)a3 contentFetched:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_1B5C47E58;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1B5C3F420;
  v11[3] = &unk_1F0EDD390;
  uint64_t v9 = _Block_copy(v11);
  id v10 = self;
  swift_retain();
  swift_release();
  -[APPCContext promotedContentNativeWithSize:contentFetched:](v10, sel_promotedContentNativeWithSize_contentFetched_, v9, width, height);
  _Block_release(v9);

  swift_release();
}

- (void)promotedContentNativeWithSize:(CGSize)a3 contentFetched:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = _Block_copy(a4);
  _Block_copy(v7);
  uint64_t v8 = self;
  sub_1B5C47AD8(v8, (void (**)(void, void))v7, width, height);
  _Block_release(v7);
  _Block_release(v7);
}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  unint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = qword_1EB850900;
  uint64_t v7 = self;
  if (v6 != -1) {
    swift_once();
  }
  sub_1B5BF68A0((uint64_t)&qword_1EB851CC8, (uint64_t)v12);
  sub_1B5BF6B08(v12, v12[3]);
  uint64_t v8 = sub_1B5CB30B0();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1B5C379B4;
  *(void *)(v11 + 24) = v5;
  swift_retain();
  sub_1B5C6EA9C(v8, v10, (uint64_t)sub_1B5C52A60, v11);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1B5BF6B4C((uint64_t)v12);

  swift_release();
}

- (void)removeHandler
{
  uint64_t v2 = qword_1EB850900;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  sub_1B5BF68A0((uint64_t)&qword_1EB851CC8, (uint64_t)v6);
  sub_1B5BF6B08(v6, v6[3]);
  uint64_t v4 = sub_1B5CB30B0();
  sub_1B5C6EC48(v4, v5);
  swift_bridgeObjectRelease();
  sub_1B5BF6B4C((uint64_t)v6);
}

@end