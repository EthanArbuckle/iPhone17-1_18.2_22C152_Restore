@interface WFAnisetteResponse
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (WFAnisetteResponse)init;
- (WFAnisetteResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAnisetteResponse

- (NSString)description
{
  return (NSString *)sub_25E7B8FF8(self, (uint64_t)a2, (void (*)(void))sub_25E7B9068);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25E7B9198(v4);
}

- (WFAnisetteResponse)initWithCoder:(id)a3
{
  return (WFAnisetteResponse *)sub_25E7B9500(a3);
}

- (WFAnisetteResponse)init
{
  result = (WFAnisetteResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end