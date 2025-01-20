@interface SelectPeopleIntent
- (SelectPeopleIntent)init;
- (SelectPeopleIntent)initWithCoder:(id)a3;
- (SelectPeopleIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SelectPeopleIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SelectPeopleIntent

- (SelectPeopleIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SelectPeopleIntent();
  return [(SelectPeopleIntent *)&v3 init];
}

- (SelectPeopleIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelectPeopleIntent();
  return [(SelectPeopleIntent *)&v5 initWithCoder:a3];
}

- (SelectPeopleIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_1C6DBBDE0();
    id v6 = a4;
    v7 = (void *)sub_1C6DBBDB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SelectPeopleIntent();
  v9 = [(SelectPeopleIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (SelectPeopleIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_1C6DBBDE0();
  sub_1C6DBBDE0();
  if (a5) {
    a5 = (id)sub_1C6DBBC30();
  }
  v7 = (void *)sub_1C6DBBDB0();
  swift_bridgeObjectRelease();
  id v8 = (void *)sub_1C6DBBDB0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1C6DBBC20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SelectPeopleIntent();
  v10 = [(SelectPeopleIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9];

  return v10;
}

@end