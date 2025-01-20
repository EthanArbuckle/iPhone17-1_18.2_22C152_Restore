@interface TimingCurveParameter
- (UICubicTimingParameters)cubicTimingParameters;
- (UISpringTimingParameters)springTimingParameters;
- (_TtC8VideosUI20TimingCurveParameter)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)timingCurveType;
- (void)encodeWithCoder:(id)a3;
- (void)setCubicTimingParameters:(id)a3;
- (void)setSpringTimingParameters:(id)a3;
- (void)setTimingCurveType:(int64_t)a3;
@end

@implementation TimingCurveParameter

- (int64_t)timingCurveType
{
  return *(void *)self->timingCurveType;
}

- (void)setTimingCurveType:(int64_t)a3
{
  *(void *)self->timingCurveType = a3;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  return (UICubicTimingParameters *)*(id *)self->cubicTimingParameters;
}

- (void)setCubicTimingParameters:(id)a3
{
  OUTLINED_FUNCTION_2_37();
  v5 = *(void **)self->cubicTimingParameters;
  *(void *)self->cubicTimingParameters = a3;
  id v6 = a3;
}

- (UISpringTimingParameters)springTimingParameters
{
  return (UISpringTimingParameters *)*(id *)self->springTimingParameters;
}

- (void)setSpringTimingParameters:(id)a3
{
  OUTLINED_FUNCTION_2_37();
  v5 = *(void **)self->springTimingParameters;
  *(void *)self->springTimingParameters = a3;
  id v6 = a3;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_TtC8VideosUI20TimingCurveParameter)initWithCoder:(id)a3
{
}

- (id)copyWithZone:(void *)a3
{
  swift_retain();
  sub_1E33B55C0(v5);
  swift_release();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_1E387E238();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

@end