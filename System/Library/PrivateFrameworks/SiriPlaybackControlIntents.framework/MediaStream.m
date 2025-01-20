@interface MediaStream
+ (BOOL)supportsSecureCoding;
- (MediaStream)initWithCoder:(id)a3;
- (MediaStream)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
- (NSString)description;
@end

@implementation MediaStream

- (NSString)description
{
  v2 = self;
  MediaStream.description.getter();

  v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MediaStream)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (MediaStream *)MediaStream.init(identifier:display:pronunciationHint:)();
}

- (MediaStream)initWithCoder:(id)a3
{
  return (MediaStream *)MediaStream.init(coder:)(a3);
}

@end