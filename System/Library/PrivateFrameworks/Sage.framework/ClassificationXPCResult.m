@interface ClassificationXPCResult
+ (BOOL)supportsSecureCoding;
- (_TtC4Sage23ClassificationXPCResult)init;
- (_TtC4Sage23ClassificationXPCResult)initWithCoder:(id)a3;
@end

@implementation ClassificationXPCResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC4Sage23ClassificationXPCResult)initWithCoder:(id)a3
{
  return (_TtC4Sage23ClassificationXPCResult *)ClassificationXPCResult.init(coder:)(a3);
}

- (_TtC4Sage23ClassificationXPCResult)init
{
}

- (void).cxx_destruct
{
  sub_25B959B4C((char *)self + OBJC_IVAR____TtC4Sage23ClassificationXPCResult_result, v2);
  sub_25B95A9B8((uint64_t)v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _DWORD))sub_25B95AA24);
}

@end