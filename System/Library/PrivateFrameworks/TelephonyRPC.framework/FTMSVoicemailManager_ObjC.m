@interface FTMSVoicemailManager_ObjC
+ (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC)shared;
- (NSArray)allVoicemail;
- (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC)init;
- (void)markVoicemailAsRead:(id)a3;
- (void)setAllVoicemail:(id)a3;
- (void)trashVoicemail:(id)a3;
@end

@implementation FTMSVoicemailManager_ObjC

+ (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC)shared
{
  if (qword_2687AAA68 != -1) {
    swift_once();
  }
  v2 = (void *)qword_2687AB988;
  return (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC *)v2;
}

- (NSArray)allVoicemail
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TelephonyRPC25FTMSVoicemailManager_ObjC_allVoicemail))
  {
    sub_23466B8B0(0, &qword_2687AAD80);
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2346739E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setAllVoicemail:(id)a3
{
  if (a3)
  {
    sub_23466B8B0(0, &qword_2687AAD80);
    v4 = (objc_class *)sub_2346739F8();
  }
  else
  {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TelephonyRPC25FTMSVoicemailManager_ObjC_allVoicemail) = v4;
  v5 = self;
  swift_bridgeObjectRelease();
  sub_23466F668();
}

- (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC)init
{
  return (_TtC12TelephonyRPC25FTMSVoicemailManager_ObjC *)sub_23466F7DC();
}

- (void)markVoicemailAsRead:(id)a3
{
}

- (void)trashVoicemail:(id)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end