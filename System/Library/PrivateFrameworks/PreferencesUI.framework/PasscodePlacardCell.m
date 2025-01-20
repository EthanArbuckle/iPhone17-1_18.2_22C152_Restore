@interface PasscodePlacardCell
- (_TtC13PreferencesUI19PasscodePlacardCell)initWithCoder:(id)a3;
- (_TtC13PreferencesUI19PasscodePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC13PreferencesUI19PasscodePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PasscodePlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23D365074();
}

- (_TtC13PreferencesUI19PasscodePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_23D368490();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC13PreferencesUI19PasscodePlacardCell *)sub_23D364700(a3, v7, v9, a5);
}

- (_TtC13PreferencesUI19PasscodePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_23D368490();
    a4 = (id)sub_23D368460();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(PasscodePlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC13PreferencesUI19PasscodePlacardCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(PasscodePlacardCell *)&v5 initWithCoder:a3];
}

@end