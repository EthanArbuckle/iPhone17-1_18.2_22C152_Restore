@interface TTRUserDefaults
- (_TtC15RemindersUICore15TTRUserDefaults)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TTRUserDefaults

- (_TtC15RemindersUICore15TTRUserDefaults)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC15RemindersUICore15TTRUserDefaults_userDefaults;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)_s15RemindersUICore15TTRUserDefaultsC04userD033_39AC9311353E6C87A3BD9840BFFEE925LLSo06NSUserD0CSgvpfi_0();
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC15RemindersUICore15TTRUserDefaults_observers) = (Class)MEMORY[0x1E4FBC868];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(TTRUserDefaults *)&v7 init];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_1B996E9F0();
    unint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v16, 0, sizeof(v16));
    id v14 = a5;
    v15 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  uint64_t v9 = 0;
  unint64_t v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  sub_1B9970200();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1B97C8A2C(&qword_1E9EFBBD0, type metadata accessor for NSKeyValueChangeKey);
    sub_1B996E6E0();
  }
LABEL_7:
  _s15RemindersUICore15TTRUserDefaultsC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyf6ChangeH0aypGSgSvSgtF_0(v9, v11, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B90CCA68((uint64_t)v16, &qword_1EB9B4D10);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore15TTRUserDefaults_userDefaults);
}

@end