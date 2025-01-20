@interface ConfigurationIntent
- (ConfigurationIntent)init;
- (ConfigurationIntent)initWithCoder:(id)a3;
- (ConfigurationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (ConfigurationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation ConfigurationIntent

- (ConfigurationIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConfigurationIntent();
  return [(ConfigurationIntent *)&v3 init];
}

- (ConfigurationIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntent();
  return [(ConfigurationIntent *)&v5 initWithCoder:a3];
}

- (ConfigurationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    id v6 = a4;
    v7 = (void *)sub_1A75725E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ConfigurationIntent();
  v9 = [(ConfigurationIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (ConfigurationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  if (a5) {
    a5 = (id)sub_1A75723F0();
  }
  v7 = (void *)sub_1A75725E0();
  swift_bridgeObjectRelease();
  id v8 = (void *)sub_1A75725E0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1A75723D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ConfigurationIntent();
  v10 = [(ConfigurationIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end