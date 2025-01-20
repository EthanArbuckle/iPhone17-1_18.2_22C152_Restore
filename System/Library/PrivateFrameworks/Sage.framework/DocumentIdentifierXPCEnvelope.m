@interface DocumentIdentifierXPCEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)_document;
- (_TtC4Sage29DocumentIdentifierXPCEnvelope)init;
- (_TtC4Sage29DocumentIdentifierXPCEnvelope)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_document:(id)a3;
@end

@implementation DocumentIdentifierXPCEnvelope

- (NSData)_document
{
  return (NSData *)sub_25B97457C((uint64_t)self, (uint64_t)a2, sub_25B9702E0);
}

- (void)set_document:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static DocumentIdentifierXPCEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC4Sage29DocumentIdentifierXPCEnvelope)initWithCoder:(id)a3
{
  return (_TtC4Sage29DocumentIdentifierXPCEnvelope *)DocumentIdentifierXPCEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DocumentIdentifierXPCEnvelope.encode(with:)((NSCoder)v4);
}

- (_TtC4Sage29DocumentIdentifierXPCEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end