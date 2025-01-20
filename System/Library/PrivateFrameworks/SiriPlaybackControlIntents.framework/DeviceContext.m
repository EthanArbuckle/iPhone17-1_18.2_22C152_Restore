@interface DeviceContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DeviceContext)initWithCoder:(id)a3;
- (DeviceContext)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
- (NSString)description;
@end

@implementation DeviceContext

- (DeviceContext)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (DeviceContext *)DeviceContext.init(identifier:display:pronunciationHint:)();
}

- (NSString)description
{
  v2 = self;
  DeviceContext.description.getter();

  v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_232A68A68();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = DeviceContext.isEqual(_:)((uint64_t)v8);

  sub_232829EB4((uint64_t)v8, &qword_2687234B8);
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DeviceContext)initWithCoder:(id)a3
{
  return (DeviceContext *)DeviceContext.init(coder:)(a3);
}

@end