@interface RemoteNotificationSettingCell
- (_TtC9SeymourUI29RemoteNotificationSettingCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI29RemoteNotificationSettingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)switchTappedWithCellSwitch:(id)a3;
@end

@implementation RemoteNotificationSettingCell

- (void)switchTappedWithCellSwitch:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23A2D2E94(v4);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RemoteNotificationSettingCell();
  v2 = (char *)v4.receiver;
  [(RemoteNotificationSettingCell *)&v4 prepareForReuse];
  v3 = &v2[OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_rowIndex];
  *(void *)v3 = 0;
  v3[8] = 1;
}

- (_TtC9SeymourUI29RemoteNotificationSettingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_23A7FF988();
    *(void *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_delegate) = 0;
    swift_unknownObjectWeakInit();
    v6 = (char *)self + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_rowIndex;
    *(void *)v6 = 0;
    v6[8] = 1;
    v7 = (void *)sub_23A7FF948();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_delegate) = 0;
    swift_unknownObjectWeakInit();
    v7 = 0;
    v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_rowIndex;
    *(void *)v8 = 0;
    v8[8] = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RemoteNotificationSettingCell();
  v9 = [(RemoteNotificationSettingCell *)&v11 initWithStyle:a3 reuseIdentifier:v7];

  return v9;
}

- (_TtC9SeymourUI29RemoteNotificationSettingCell)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI29RemoteNotificationSettingCell_rowIndex;
  *(void *)v5 = 0;
  v5[8] = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RemoteNotificationSettingCell();
  return [(RemoteNotificationSettingCell *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end