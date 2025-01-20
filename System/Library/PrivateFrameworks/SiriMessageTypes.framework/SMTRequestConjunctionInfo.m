@interface SMTRequestConjunctionInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (SMTRequestConjunctionInfo)init;
- (SMTRequestConjunctionInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMTRequestConjunctionInfo

+ (BOOL)supportsSecureCoding
{
  return static RequestConjunctionInfo.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (SMTRequestConjunctionInfo)initWithCoder:(id)a3
{
  return (SMTRequestConjunctionInfo *)RequestConjunctionInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  RequestConjunctionInfo.encode(with:)((NSCoder)v4);
}

- (NSString)debugDescription
{
  v2 = self;
  RequestConjunctionInfo.debugDescription.getter();

  v3 = (void *)sub_25D0BD2D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_25D0BD580();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = RequestConjunctionInfo.isEqual(_:)((uint64_t)v8);

  sub_25D01E2F0((uint64_t)v8);
  return v6;
}

- (SMTRequestConjunctionInfo)init
{
}

@end