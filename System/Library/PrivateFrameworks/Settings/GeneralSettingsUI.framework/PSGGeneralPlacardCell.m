@interface PSGGeneralPlacardCell
- (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell)initWithCoder:(id)a3;
- (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSGGeneralPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23D2C1AC8();
}

- (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_23D2C30D0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell *)sub_23D2C1660(a3, v7, v9, a5);
}

- (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_23D2C30D0();
    a4 = (id)sub_23D2C30A0();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(PSGGeneralPlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(PSGGeneralPlacardCell *)&v5 initWithCoder:a3];
}

@end