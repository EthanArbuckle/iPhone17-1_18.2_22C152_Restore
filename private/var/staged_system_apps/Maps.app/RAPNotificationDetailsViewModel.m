@interface RAPNotificationDetailsViewModel
- (BOOL)editMode;
- (BOOL)hasButton;
- (GEOMapRegion)mapRegion;
- (GEORPButton)button;
- (GEORPUpdatedLabel)updatedLabel;
- (NSArray)mapItems;
- (NSString)linkButtonLink;
- (NSString)linkButtonText;
- (NSString)reportId;
- (RAPNotificationDetailsViewModelDescriptionInfo)descriptionInfo;
- (RAPRecord)rapRecord;
- (_TtC4Maps31RAPNotificationDetailsViewModel)init;
- (_TtC4Maps31RAPNotificationDetailsViewModel)initWithDescriptionInfo:(id)a3 displayStyle:(int64_t)a4 mapType:(int)a5 mapRegion:(id)a6 mapItems:(id)a7 reportId:(id)a8 updatedLabel:(id)a9 hasButton:(BOOL)a10 button:(id)a11 rapRecord:(id)a12;
- (_TtC4Maps31RAPNotificationDetailsViewModel)initWithProblemStatus:(id)a3;
- (_TtC4Maps31RAPNotificationDetailsViewModel)initWithRapRecord:(id)a3;
- (int)mapType;
- (int64_t)displayStyle;
- (void)setRapRecord:(id)a3;
@end

@implementation RAPNotificationDetailsViewModel

- (RAPNotificationDetailsViewModelDescriptionInfo)descriptionInfo
{
  return (RAPNotificationDetailsViewModelDescriptionInfo *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_descriptionInfo);
}

- (int64_t)displayStyle
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_displayStyle);
}

- (int)mapType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_mapType);
}

- (GEOMapRegion)mapRegion
{
  return (GEOMapRegion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_mapRegion));
}

- (NSArray)mapItems
{
  sub_100100830(0, &qword_1015CF128);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSString)reportId
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (GEORPUpdatedLabel)updatedLabel
{
  return (GEORPUpdatedLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_updatedLabel));
}

- (BOOL)hasButton
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_hasButton);
}

- (GEORPButton)button
{
  return (GEORPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_button));
}

- (RAPRecord)rapRecord
{
  return (RAPRecord *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_rapRecord));
}

- (void)setRapRecord:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_rapRecord);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_rapRecord) = (Class)a3;
  id v3 = a3;
}

- (BOOL)editMode
{
  NSString v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_rapRecord);
  if (v2) {
    LOBYTE(v2) = [v2 reportStatus] == 2;
  }
  return (char)v2;
}

- (NSString)linkButtonLink
{
  return (NSString *)sub_1001C3BC4(self, (uint64_t)a2, (void (*)(void))sub_1001C3AB0);
}

- (NSString)linkButtonText
{
  return (NSString *)sub_1001C3BC4(self, (uint64_t)a2, sub_1001C3C44);
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)initWithDescriptionInfo:(id)a3 displayStyle:(int64_t)a4 mapType:(int)a5 mapRegion:(id)a6 mapItems:(id)a7 reportId:(id)a8 updatedLabel:(id)a9 hasButton:(BOOL)a10 button:(id)a11 rapRecord:(id)a12
{
  sub_100100830(0, &qword_1015CF128);
  uint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  id v17 = a3;
  id v18 = a6;
  id v19 = a9;
  id v20 = a11;
  id v21 = a12;
  v22 = (_TtC4Maps31RAPNotificationDetailsViewModel *)sub_1001C4B1C(v17, a4, a5, v18, v24, v14, v16, a9, a10, a11, a12);

  return v22;
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)init
{
  result = (_TtC4Maps31RAPNotificationDetailsViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31RAPNotificationDetailsViewModel_rapRecord);
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)initWithRapRecord:(id)a3
{
  return (_TtC4Maps31RAPNotificationDetailsViewModel *)sub_1001C4110(a3);
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)initWithProblemStatus:(id)a3
{
  sub_1001C46BC(a3);
  return result;
}

@end