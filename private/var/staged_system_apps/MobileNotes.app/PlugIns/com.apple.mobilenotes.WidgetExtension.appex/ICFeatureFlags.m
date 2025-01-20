@interface ICFeatureFlags
+ (BOOL)appShortcutsEnabled;
+ (BOOL)audioTranscriptionEnabled;
+ (BOOL)blockQuoteEnabled;
+ (BOOL)callRecordingEnabled;
+ (BOOL)emphasisEnabled;
+ (BOOL)generationTool;
+ (BOOL)graphingEnabled;
+ (BOOL)greyParrotEnabled;
+ (BOOL)greyParrotUniversalAppEnabled;
+ (BOOL)imapSyncEnabled;
+ (BOOL)inlineFormFillingEnabled;
+ (BOOL)lockedNotesV1NeoEnabled;
+ (BOOL)mathEnabled;
+ (BOOL)offlineCallTranscriptionEnabled;
+ (BOOL)pagesHandoffEnabled;
+ (BOOL)realtimeCollaborationEnabled;
+ (BOOL)scrubbingEnabled;
+ (BOOL)siriSMART;
+ (BOOL)transcriptionEvaluationEnabled;
+ (BOOL)uniquelyiPadFluidTransitionsEnabled;
- (_TtC37com_apple_mobilenotes_WidgetExtension14ICFeatureFlags)init;
@end

@implementation ICFeatureFlags

+ (BOOL)appShortcutsEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"AppShortcuts", 12);
}

+ (BOOL)realtimeCollaborationEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"RealtimeCollaboration", 21);
}

+ (BOOL)pagesHandoffEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"PagesHandoff", 12);
}

+ (BOOL)lockedNotesV1NeoEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"LockedNotesV1Neo", 16);
}

+ (BOOL)blockQuoteEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"BlockQuote", 10);
}

+ (BOOL)imapSyncEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"IMAPSync_iOS", 12);
}

+ (BOOL)audioTranscriptionEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"AudioTranscription", 18);
}

+ (BOOL)callRecordingEnabled
{
  v8 = &type metadata for NotesFeature;
  unint64_t v9 = sub_10002F430();
  v5 = "AudioTranscription";
  uint64_t v6 = 18;
  char v7 = 2;
  char v2 = sub_10007C250();
  sub_10000A340((uint64_t)&v5);
  if (v2)
  {
    v8 = &type metadata for TelephonyUtilitiesFeature;
    unint64_t v9 = sub_10002F8C0();
    v5 = "CallRecording";
    uint64_t v6 = 13;
    char v7 = 2;
    char v3 = sub_10007C250();
    sub_10000A340((uint64_t)&v5);
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

+ (BOOL)transcriptionEvaluationEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for TelephonyUtilitiesFeature, (uint64_t (*)(void))sub_10002F8C0, (uint64_t)"transcriptionEvaluationEnabled", 30);
}

+ (BOOL)mathEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"Math", 4);
}

+ (BOOL)graphingEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"Graphing", 8);
}

+ (BOOL)scrubbingEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"Scrubbing", 9);
}

+ (BOOL)greyParrotEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"GreyParrot", 10);
}

+ (BOOL)greyParrotUniversalAppEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for GreyParrotFeature, (uint64_t (*)(void))sub_10002F7EC, (uint64_t)"UniversalApp", 12);
}

+ (BOOL)emphasisEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"Emphasis", 8);
}

+ (BOOL)inlineFormFillingEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"InlineFormFilling", 17);
}

+ (BOOL)siriSMART
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for SiriSMARTFeature, (uint64_t (*)(void))sub_10002F718, (uint64_t)"SMART", 5);
}

+ (BOOL)uniquelyiPadFluidTransitionsEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for UniquelyiPadFeature, (uint64_t (*)(void))sub_10002F644, (uint64_t)"uip_fluid_transitions", 21);
}

+ (BOOL)generationTool
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"GenerationTool", 14);
}

+ (BOOL)offlineCallTranscriptionEnabled
{
  return sub_10007B910((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_10002F430, (uint64_t)"OfflineCallTranscription", 24);
}

- (_TtC37com_apple_mobilenotes_WidgetExtension14ICFeatureFlags)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICFeatureFlags *)&v3 init];
}

@end