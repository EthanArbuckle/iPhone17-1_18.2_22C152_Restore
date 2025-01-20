@interface PeopleUserDefaults
- (_TtC6People18PeopleUserDefaults)initWithSuiteName:(id)a3;
@end

@implementation PeopleUserDefaults

- (_TtC6People18PeopleUserDefaults)initWithSuiteName:(id)a3
{
  if (a3)
  {
    sub_1C6DBBDE0();
    v4 = (void *)sub_1C6DBBDB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PeopleUserDefaults();
  v5 = [(PeopleUserDefaults *)&v7 initWithSuiteName:v4];

  if (v5) {
  return v5;
  }
}

@end