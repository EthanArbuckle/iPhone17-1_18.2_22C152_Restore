@interface ISOXpcSubscriptionClientResponse
+ (BOOL)supportsSecureCoding;
- (ISOXpcSubscriptionClientResponse)init;
- (ISOXpcSubscriptionClientResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISOXpcSubscriptionClientResponse

- (ISOXpcSubscriptionClientResponse)initWithCoder:(id)a3
{
  return (ISOXpcSubscriptionClientResponse *)XpcSubscriptionClientResponse.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR___ISOXpcSubscriptionClientResponse_proto;
  id v5 = a3;
  v6 = self;
  sub_2372A297C((uint64_t)v4, v5);
}

- (ISOXpcSubscriptionClientResponse)init
{
  result = (ISOXpcSubscriptionClientResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end