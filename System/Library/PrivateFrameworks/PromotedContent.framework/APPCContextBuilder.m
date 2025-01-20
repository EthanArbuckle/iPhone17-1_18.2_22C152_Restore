@interface APPCContextBuilder
- (APPCContext)context;
- (APPCContextBuilder)init;
- (APPCContextBuilder)initWithMaxSize:(CGSize)a3 current:(id)a4 newsContext:(id)a5 requestedAd:(id)a6;
- (APPCContextBuilder)initWithMaxSize:(CGSize)a3 current:(id)a4 next:(id)a5 newsContext:(id)a6 requestedAd:(id)a7;
- (APPCNewsSupplementalContext)newsContext;
- (APPCPromotableContentDepiction)current;
- (BOOL)addAdjacentWithAdjacent:(id)a3 error:(id *)a4;
- (CGSize)maxSize;
- (NSArray)adjacent;
- (NSArray)next;
- (NSString)requestedAd;
- (NSUUID)identifier;
- (void)removeAdjacentWithAdjacent:(id)a3;
- (void)setCurrent:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setNewsContext:(id)a3;
- (void)setNext:(id)a3;
- (void)setRequestedAd:(id)a3;
@end

@implementation APPCContextBuilder

- (NSUUID)identifier
{
  uint64_t v3 = sub_1B5CB3100();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___APPCContextBuilder_identifier;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1B5CB30C0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = sub_1B5CB3100();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CB30E0();
  v8 = (char *)self + OBJC_IVAR___APPCContextBuilder_identifier;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (CGSize)maxSize
{
  v2 = (double *)((char *)self + OBJC_IVAR___APPCContextBuilder_maxSize);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = (CGFloat *)((char *)self + OBJC_IVAR___APPCContextBuilder_maxSize);
  swift_beginAccess();
  *uint64_t v5 = width;
  v5[1] = height;
}

- (APPCPromotableContentDepiction)current
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (APPCPromotableContentDepiction *)v2;
}

- (void)setCurrent:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1B5C1EB7C(a3);

  swift_unknownObjectRelease();
}

- (NSArray)next
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B5BFE044(&qword_1EB850E20);
  v2 = (void *)sub_1B5CB34B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setNext:(id)a3
{
  sub_1B5BFE044(&qword_1EB850E20);
  uint64_t v4 = sub_1B5CB34C0();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCContextBuilder_next);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)adjacent
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContextBuilder_resourceLock);
  double v3 = self;
  objc_msgSend(v2, sel_lock);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  objc_msgSend(v2, sel_unlock);

  sub_1B5BFE044(&qword_1EB850E20);
  uint64_t v4 = (void *)sub_1B5CB34B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (NSString)requestedAd
{
  v2 = (char *)self + OBJC_IVAR___APPCContextBuilder_requestedAd;
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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APPCContextBuilder_requestedAd);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (APPCNewsSupplementalContext)newsContext
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___APPCContextBuilder_newsContext);
  swift_beginAccess();
  return (APPCNewsSupplementalContext *)*v2;
}

- (void)setNewsContext:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___APPCContextBuilder_newsContext);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (APPCContext)context
{
  v2 = self;
  double v3 = sub_1B5C1D8E0();

  return (APPCContext *)v3;
}

- (APPCContextBuilder)initWithMaxSize:(CGSize)a3 current:(id)a4 next:(id)a5 newsContext:(id)a6 requestedAd:(id)a7
{
  double height = a3.height;
  double width = a3.width;
  sub_1B5BFE044(&qword_1EB850E20);
  uint64_t v11 = sub_1B5CB34C0();
  if (a7)
  {
    a7 = (id)sub_1B5CB33C0();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a6;
  uint64_t v15 = swift_unknownObjectRetain();
  v16 = (APPCContextBuilder *)sub_1B5C1EC30(v15, v11, a6, (uint64_t)a7, v13, width, height);
  swift_unknownObjectRelease();

  return v16;
}

- (APPCContextBuilder)initWithMaxSize:(CGSize)a3 current:(id)a4 newsContext:(id)a5 requestedAd:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  if (a6)
  {
    uint64_t v10 = sub_1B5CB33C0();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  swift_unknownObjectRetain();
  id v13 = a5;
  id v14 = (APPCContextBuilder *)sub_1B5C1EDD0((uint64_t)a4, a5, v10, v12, width, height);
  swift_unknownObjectRelease();

  return v14;
}

- (BOOL)addAdjacentWithAdjacent:(id)a3 error:(id *)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  sub_1B5C1DF64(a3);

  swift_unknownObjectRelease();
  return 1;
}

- (void)removeAdjacentWithAdjacent:(id)a3
{
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContextBuilder_resourceLock);
  swift_unknownObjectRetain();
  id v6 = self;
  objc_msgSend(v5, sel_lock);
  v7 = (uint64_t *)((char *)v6 + OBJC_IVAR___APPCContextBuilder_adjacentInternal);
  swift_beginAccess();
  swift_unknownObjectRetain();
  uint64_t v8 = sub_1B5C1F0F0(v7, a3);
  swift_unknownObjectRelease();
  if ((unint64_t)*v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1B5CB39E0();
    swift_bridgeObjectRelease();
    if (v9 >= v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9 >= v8)
    {
LABEL_3:
      sub_1B5C1F4D4(v8, v9);
      swift_endAccess();
      objc_msgSend(v5, sel_unlock);
      swift_unknownObjectRelease();

      return;
    }
  }
  __break(1u);
}

- (APPCContextBuilder)init
{
  CGSize result = (APPCContextBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = (char *)self + OBJC_IVAR___APPCContextBuilder_identifier;
  uint64_t v4 = sub_1B5CB3100();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end