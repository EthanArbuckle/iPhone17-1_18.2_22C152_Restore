@interface PaginationSwipeTimingParameters
- (UICubicTimingParameters)cubicTimingParameters;
- (UISpringTimingParameters)springTimingParameters;
- (_TtC8VideosUI31PaginationSwipeTimingParameters)init;
- (_TtC8VideosUI31PaginationSwipeTimingParameters)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)timingCurveType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PaginationSwipeTimingParameters

- (int64_t)timingCurveType
{
  return 3;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  v2 = self;
  id v3 = sub_1E36F1E64();

  return (UICubicTimingParameters *)v3;
}

- (UISpringTimingParameters)springTimingParameters
{
  v2 = self;
  id v3 = sub_1E36F1F1C();

  return (UISpringTimingParameters *)v3;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_TtC8VideosUI31PaginationSwipeTimingParameters)initWithCoder:(id)a3
{
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  sub_1E36F20A0(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1E387E238();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (_TtC8VideosUI31PaginationSwipeTimingParameters)init
{
}

@end