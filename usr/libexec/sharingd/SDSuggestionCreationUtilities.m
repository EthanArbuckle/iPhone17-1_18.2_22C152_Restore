@interface SDSuggestionCreationUtilities
+ (void)retrieveSuggestionForRecipients:(NSArray *)a3 inActivityType:(NSString *)a4 completionHandler:(id)a5;
- (_TtC16DaemoniOSLibrary29SDSuggestionCreationUtilities)init;
@end

@implementation SDSuggestionCreationUtilities

+ (void)retrieveSuggestionForRecipients:(NSArray *)a3 inActivityType:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10096EB08;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10096EB10;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_10070697C((uint64_t)v11, (uint64_t)&unk_10096EB18, (uint64_t)v16);
  swift_release();
}

- (_TtC16DaemoniOSLibrary29SDSuggestionCreationUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SDSuggestionCreationUtilities();
  return [(SDSuggestionCreationUtilities *)&v3 init];
}

@end