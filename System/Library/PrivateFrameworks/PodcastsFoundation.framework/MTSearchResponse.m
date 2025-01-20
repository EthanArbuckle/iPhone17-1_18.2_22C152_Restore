@interface MTSearchResponse
- (MTSearchResponse)init;
- (id)itemInSection:(int64_t)a3 row:(int64_t)a4;
- (id)itemsFor:(int64_t)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
@end

@implementation MTSearchResponse

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  v6 = self;
  v7 = (void *)sub_1ACC2D67C(a3, a4);

  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  v4 = self;
  unint64_t v5 = sub_1ACC2D7AC(a3);

  return v5;
}

- (unint64_t)numberOfSections
{
  v2 = (char *)self + OBJC_IVAR___MTSearchResponse_params;
  return *(void *)(*(void *)&v2[*(int *)(type metadata accessor for MediaRequest.Params() + 120)] + 16);
}

- (id)sectionAtIndex:(unint64_t)a3
{
  v4 = self;
  unint64_t v5 = (void *)sub_1ACC2D90C(a3);

  return v5;
}

- (id)itemsFor:(int64_t)a3
{
  v4 = self;
  sub_1ACC2DE04(a3);

  unint64_t v5 = (void *)sub_1ACE76558();
  swift_bridgeObjectRelease();
  return v5;
}

- (MTSearchResponse)init
{
  result = (MTSearchResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1ACA39598((uint64_t)self + OBJC_IVAR___MTSearchResponse_params);
  swift_bridgeObjectRelease();
}

@end