@interface SearchTimerIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
+ (BOOL)supportsSecureCoding;
- (SearchTimerIntent)init;
- (SearchTimerIntent)initWithCoder:(id)a3;
- (SearchTimerIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SearchTimerIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SearchTimerIntent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SearchTimerIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchTimerIntent();
  return [(SearchTimerIntent *)&v3 init];
}

- (SearchTimerIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SearchTimerIntent();
  return [(SearchTimerIntent *)&v5 initWithCoder:a3];
}

- (SearchTimerIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  v11.super_class = (Class)type metadata accessor for SearchTimerIntent();
  v9 = [(SearchTimerIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (SearchTimerIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
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
  v12.super_class = (Class)type metadata accessor for SearchTimerIntent();
  v10 = [(SearchTimerIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end