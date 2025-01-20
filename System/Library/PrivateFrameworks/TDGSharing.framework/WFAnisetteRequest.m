@interface WFAnisetteRequest
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (WFAnisetteRequest)init;
- (WFAnisetteRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAnisetteRequest

- (NSString)description
{
  return (NSString *)sub_25E7B8FF8(self, (uint64_t)a2, (void (*)(void))sub_25E7B8160);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25E7B8264(v4);
}

- (WFAnisetteRequest)initWithCoder:(id)a3
{
  return (WFAnisetteRequest *)sub_25E7B85CC(a3);
}

- (WFAnisetteRequest)init
{
  result = (WFAnisetteRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end