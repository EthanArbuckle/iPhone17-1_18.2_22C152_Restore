@interface SetTimerAttributeIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SetTimerAttributeIntent)init;
- (SetTimerAttributeIntent)initWithCoder:(id)a3;
- (SetTimerAttributeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SetTimerAttributeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SetTimerAttributeIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetTimerAttributeIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SetTimerAttributeIntent();
  return [(SetTimerAttributeIntent *)&v3 init];
}

- (SetTimerAttributeIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SetTimerAttributeIntent();
  return [(SetTimerAttributeIntent *)&v5 initWithCoder:a3];
}

- (SetTimerAttributeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_25DD202F8();
    id v6 = a4;
    v7 = (void *)sub_25DD202E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SetTimerAttributeIntent();
  v9 = [(SetTimerAttributeIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (SetTimerAttributeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_25DD202F8();
  sub_25DD202F8();
  if (a5) {
    a5 = (id)sub_25DD202C8();
  }
  v7 = (void *)sub_25DD202E8();
  swift_bridgeObjectRelease();
  id v8 = (void *)sub_25DD202E8();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_25DD202B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SetTimerAttributeIntent();
  v10 = [(SetTimerAttributeIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end