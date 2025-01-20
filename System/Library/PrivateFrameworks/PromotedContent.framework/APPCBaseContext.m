@interface APPCBaseContext
- (APPCBaseContext)init;
- (APPCBaseContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 adjacent:(id)a6;
- (APPCBaseContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 next:(id)a6;
- (APPCPromotableContentDepiction)current;
- (CGSize)maxSize;
- (NSArray)adjacent;
- (NSArray)next;
- (NSString)requestedAd;
- (NSUUID)identifier;
- (void)setRequestedAd:(id)a3;
@end

@implementation APPCBaseContext

- (NSUUID)identifier
{
  v2 = (void *)sub_1B5CB30C0();
  return (NSUUID *)v2;
}

- (CGSize)maxSize
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___APPCBaseContext_maxSize);
  double v3 = *(double *)&self->adjacentInternal[OBJC_IVAR___APPCBaseContext_maxSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (APPCPromotableContentDepiction)current
{
  double v2 = (void *)swift_unknownObjectRetain();
  return (APPCPromotableContentDepiction *)v2;
}

- (NSArray)next
{
  return (NSArray *)sub_1B5C5129C();
}

- (NSArray)adjacent
{
  return (NSArray *)sub_1B5C5129C();
}

- (NSString)requestedAd
{
  double v2 = (char *)self + OBJC_IVAR___APPCBaseContext_requestedAd;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    double v3 = (void *)sub_1B5CB33B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setRequestedAd:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B5CB33C0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APPCBaseContext_requestedAd);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (APPCBaseContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 next:(id)a6
{
  return (APPCBaseContext *)sub_1B5C519E0(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double, double))BaseContext.init(maxSize:requestedAd:current:next:));
}

- (APPCBaseContext)initWithMaxSize:(CGSize)a3 requestedAd:(id)a4 current:(id)a5 adjacent:(id)a6
{
  return (APPCBaseContext *)sub_1B5C519E0(a3.width, a3.height, (uint64_t)self, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, double, double))BaseContext.init(maxSize:requestedAd:current:adjacent:));
}

- (APPCBaseContext)init
{
  CGSize result = (APPCBaseContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  double v3 = (char *)self + OBJC_IVAR___APPCBaseContext_identifier;
  uint64_t v4 = sub_1B5CB3100();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end