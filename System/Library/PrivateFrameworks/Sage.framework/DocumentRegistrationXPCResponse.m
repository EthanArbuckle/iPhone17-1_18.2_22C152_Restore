@interface DocumentRegistrationXPCResponse
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_registration;
- (_TtC4Sage31DocumentRegistrationXPCResponse)init;
- (_TtC4Sage31DocumentRegistrationXPCResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DocumentRegistrationXPCResponse

- (NSData)_registration
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B97072C);
}

+ (BOOL)supportsSecureCoding
{
  return static DocumentRegistrationXPCResponse.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage31DocumentRegistrationXPCResponse)initWithCoder:(id)a3
{
  return (_TtC4Sage31DocumentRegistrationXPCResponse *)DocumentRegistrationXPCResponse.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DocumentRegistrationXPCResponse.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage31DocumentRegistrationXPCResponse)init
{
}

- (void).cxx_destruct
{
}

@end