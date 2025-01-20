@interface PrivacySettingsPlacardCell
- (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell)initWithCoder:(id)a3;
- (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PrivacySettingsPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4B3C0A0();
}

- (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_1E4B3E828();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell *)sub_1E4B3BC38(a3, v7, v9, a5);
}

- (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_1E4B3E828();
    a4 = (id)sub_1E4B3E7F8();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(PrivacySettingsPlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(PrivacySettingsPlacardCell *)&v5 initWithCoder:a3];
}

@end