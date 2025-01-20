@interface ICDonateDynamicAppVocabularyLaunchTask
- (BOOL)shouldAttemptLaunchTask;
- (ICDonateDynamicAppVocabularyLaunchTask)init;
- (void)runLaunchTaskWithCompletionHandler:(id)a3;
@end

@implementation ICDonateDynamicAppVocabularyLaunchTask

- (BOOL)shouldAttemptLaunchTask
{
  v2 = self;
  if (static SiriVocabulary.dynamicVocabularyEnabled.getter())
  {
    v7 = &type metadata for NotesFeature;
    unint64_t v8 = sub_100035D4C();
    v5[0] = "SiriDynamicVocabulary";
    v5[1] = 21;
    char v6 = 2;
    char v3 = isFeatureEnabled(_:)();
    sub_100018FE8((uint64_t)v5);
  }
  else
  {

    char v3 = 0;
  }
  return v3 & 1;
}

- (void)runLaunchTaskWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10002F214(&qword_1006A09A0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1006A6118;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1006A3590;
  v12[5] = v11;
  v13 = self;
  sub_1003E0CC4((uint64_t)v7, (uint64_t)&unk_1006A3598, (uint64_t)v12);
  swift_release();
}

- (ICDonateDynamicAppVocabularyLaunchTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICDonateDynamicAppVocabularyLaunchTask *)&v3 init];
}

@end