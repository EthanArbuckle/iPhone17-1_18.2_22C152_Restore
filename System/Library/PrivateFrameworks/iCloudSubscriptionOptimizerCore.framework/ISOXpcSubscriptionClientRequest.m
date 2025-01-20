@interface ISOXpcSubscriptionClientRequest
+ (BOOL)supportsSecureCoding;
- (ISOXpcSubscriptionClientRequest)init;
- (ISOXpcSubscriptionClientRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISOXpcSubscriptionClientRequest

- (ISOXpcSubscriptionClientRequest)initWithCoder:(id)a3
{
  return (ISOXpcSubscriptionClientRequest *)XpcSubscriptionClientRequest.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR___ISOXpcSubscriptionClientRequest_proto;
  id v5 = a3;
  v6 = self;
  sub_2372A29C4((uint64_t)v4, v5, (void (*)(void))type metadata accessor for SubscriptionClientRequest, (unint64_t *)&qword_26AECC8F0, (void (*)(uint64_t))type metadata accessor for SubscriptionClientRequest);
}

- (ISOXpcSubscriptionClientRequest)init
{
  result = (ISOXpcSubscriptionClientRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end