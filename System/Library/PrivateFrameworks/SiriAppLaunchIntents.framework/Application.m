@interface Application
+ (BOOL)supportsSecureCoding;
- (Application)initWithCoder:(id)a3;
- (Application)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
- (NSString)description;
@end

@implementation Application

- (NSString)description
{
  v2 = self;
  Application.description.getter();

  v3 = (void *)sub_23785B6A0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Application)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_23785B6B0();
  }
  sub_23785B6B0();
  if (a5) {
    sub_23785B6B0();
  }
  return (Application *)Application.init(identifier:display:pronunciationHint:)();
}

- (Application)initWithCoder:(id)a3
{
  return (Application *)Application.init(coder:)(a3);
}

@end