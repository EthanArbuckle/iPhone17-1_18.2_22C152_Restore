@interface SecurityAccessoryConfigurationIntent
- (SecurityAccessoryConfigurationIntent)init;
- (SecurityAccessoryConfigurationIntent)initWithCoder:(id)a3;
- (SecurityAccessoryConfigurationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SecurityAccessoryConfigurationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SecurityAccessoryConfigurationIntent

- (SecurityAccessoryConfigurationIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  return [(SecurityAccessoryConfigurationIntent *)&v3 init];
}

- (SecurityAccessoryConfigurationIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  return [(SecurityAccessoryConfigurationIntent *)&v5 initWithCoder:a3];
}

- (SecurityAccessoryConfigurationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_100029EF8();
    id v6 = a4;
    NSString v7 = sub_100029EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  v9 = [(SecurityAccessoryConfigurationIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (SecurityAccessoryConfigurationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_100029EF8();
  sub_100029EF8();
  if (a5) {
    a5 = (id)sub_100029E88();
  }
  NSString v7 = sub_100029EE8();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100029EE8();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = sub_100029E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  v10 = [(SecurityAccessoryConfigurationIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

@end