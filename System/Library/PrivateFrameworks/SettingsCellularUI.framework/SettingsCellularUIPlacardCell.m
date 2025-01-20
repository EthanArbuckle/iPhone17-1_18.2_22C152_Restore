@interface SettingsCellularUIPlacardCell
- (_TtC18SettingsCellularUI29SettingsCellularUIPlacardCell)initWithCoder:(id)a3;
- (_TtC18SettingsCellularUI29SettingsCellularUIPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC18SettingsCellularUI29SettingsCellularUIPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation SettingsCellularUIPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_221B1BB70();
}

- (_TtC18SettingsCellularUI29SettingsCellularUIPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_221B96B28();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC18SettingsCellularUI29SettingsCellularUIPlacardCell *)sub_221B1B220(a3, v7, v9, a5);
}

- (_TtC18SettingsCellularUI29SettingsCellularUIPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_221B96B28();
    a4 = (id)sub_221B96AF8();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(SettingsCellularUIPlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC18SettingsCellularUI29SettingsCellularUIPlacardCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(SettingsCellularUIPlacardCell *)&v5 initWithCoder:a3];
}

@end