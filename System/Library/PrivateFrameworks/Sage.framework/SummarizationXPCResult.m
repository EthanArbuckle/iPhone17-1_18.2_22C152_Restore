@interface SummarizationXPCResult
+ (BOOL)supportsSecureCoding;
- (_TtC4Sage22SummarizationXPCResult)init;
- (_TtC4Sage22SummarizationXPCResult)initWithCoder:(id)a3;
@end

@implementation SummarizationXPCResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC4Sage22SummarizationXPCResult)initWithCoder:(id)a3
{
  return (_TtC4Sage22SummarizationXPCResult *)SummarizationXPCResult.init(coder:)(a3);
}

- (_TtC4Sage22SummarizationXPCResult)init
{
}

- (void).cxx_destruct
{
}

@end