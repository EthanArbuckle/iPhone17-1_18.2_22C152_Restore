@interface SDAirDropUserSafetyInterventionAlert
- (_TtC16DaemoniOSLibrary36SDAirDropUserSafetyInterventionAlert)init;
- (void)showInterventionWithIsSend:(BOOL)a3 completion:(id)a4;
@end

@implementation SDAirDropUserSafetyInterventionAlert

- (void)showInterventionWithIsSend:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  *(unsigned char *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = self;
  *(void *)(v13 + 48) = sub_1004B29B4;
  *(void *)(v13 + 56) = v11;
  v14 = self;
  swift_retain();
  sub_10028CFA8((uint64_t)v9, (uint64_t)&unk_100975F18, v13);

  swift_release();
  swift_release();
}

- (_TtC16DaemoniOSLibrary36SDAirDropUserSafetyInterventionAlert)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SDAirDropUserSafetyInterventionAlert *)&v3 init];
}

@end