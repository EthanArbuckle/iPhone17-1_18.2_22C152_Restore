@interface REMComplicationDataViewFetchModelInvocationResult
+ (BOOL)supportsSecureCoding;
- (REMComplicationDataViewFetchModelInvocationResult)init;
- (REMComplicationDataViewFetchModelInvocationResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMComplicationDataViewFetchModelInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMComplicationDataViewFetchModelInvocationResult)initWithCoder:(id)a3
{
  return (REMComplicationDataViewFetchModelInvocationResult *)REMComplicationDataView.FetchModelInvocation.Result.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  REMComplicationDataView.FetchModelInvocation.Result.encode(with:)((NSCoder)v4);
}

- (REMComplicationDataViewFetchModelInvocationResult)init
{
  result = (REMComplicationDataViewFetchModelInvocationResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end