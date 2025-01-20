@interface ClimateSensorTypeConfigurationIntent
- (ClimateSensorTypeConfigurationIntent)init;
- (ClimateSensorTypeConfigurationIntent)initWithCoder:(id)a3;
- (ClimateSensorTypeConfigurationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (ClimateSensorTypeConfigurationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation ClimateSensorTypeConfigurationIntent

- (ClimateSensorTypeConfigurationIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  return [(ClimateSensorTypeConfigurationIntent *)&v3 init];
}

- (ClimateSensorTypeConfigurationIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  return [(ClimateSensorTypeConfigurationIntent *)&v5 initWithCoder:a3];
}

- (ClimateSensorTypeConfigurationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  v11.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  v9 = [(ClimateSensorTypeConfigurationIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (ClimateSensorTypeConfigurationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
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
  v12.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  v10 = [(ClimateSensorTypeConfigurationIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

@end