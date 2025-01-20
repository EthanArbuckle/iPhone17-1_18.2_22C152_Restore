@interface WTStartupOptions
- (BOOL)editable;
- (BOOL)isForAssistant;
- (BOOL)isForInputDashboard;
- (BOOL)isQuestionnairePopover;
- (BOOL)isResumingFromModelEnrollment;
- (BOOL)isWindowingModeEnabled;
- (BOOL)requestPromptEntry;
- (BOOL)wantsFormSheetPresentation;
- (BOOL)wantsInlineEditing;
- (NSString)bundleID;
- (NSString)prompt;
- (NSUUID)analyticsUUID;
- (NSUUID)contextUUID;
- (NSUUID)sessionUUID;
- (NSUUID)suggestionUUID;
- (WTSmartReplyConfiguration)smartReplyConfiguration;
- (_TtC14WritingToolsUI16WTStartupOptions)init;
- (id)asBSActionAndReturnError:(id *)a3;
- (int64_t)formSheetUIType;
- (int64_t)requestedTool;
- (int64_t)sourceResponderHorizontalSizeClass;
- (int64_t)sourceUserInterfaceIdiom;
- (unint64_t)allowedResultOptions;
- (void)setAllowedResultOptions:(unint64_t)a3;
- (void)setAnalyticsUUID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContextUUID:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setFormSheetUIType:(int64_t)a3;
- (void)setIsForAssistant:(BOOL)a3;
- (void)setIsForInputDashboard:(BOOL)a3;
- (void)setIsQuestionnairePopover:(BOOL)a3;
- (void)setIsResumingFromModelEnrollment:(BOOL)a3;
- (void)setIsWindowingModeEnabled:(BOOL)a3;
- (void)setPrompt:(id)a3;
- (void)setRequestPromptEntry:(BOOL)a3;
- (void)setRequestedTool:(int64_t)a3;
- (void)setSessionUUID:(id)a3;
- (void)setSmartReplyConfiguration:(id)a3;
- (void)setSourceResponderHorizontalSizeClass:(int64_t)a3;
- (void)setSourceUserInterfaceIdiom:(int64_t)a3;
- (void)setSuggestionUUID:(id)a3;
- (void)setWantsFormSheetPresentation:(BOOL)a3;
- (void)setWantsInlineEditing:(BOOL)a3;
@end

@implementation WTStartupOptions

- (NSString)prompt
{
  return (NSString *)sub_261C0B374((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_prompt);
}

- (void)setPrompt:(id)a3
{
}

- (int64_t)requestedTool
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool);
  swift_beginAccess();
  return *v2;
}

- (void)setRequestedTool:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestedTool);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)editable
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable;
  swift_beginAccess();
  return *v2;
}

- (void)setEditable:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_editable;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)wantsInlineEditing
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsInlineEditing:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsInlineEditing;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (unint64_t)allowedResultOptions
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
  swift_beginAccess();
  return *v2;
}

- (void)setAllowedResultOptions:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_allowedResultOptions);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (WTSmartReplyConfiguration)smartReplyConfiguration
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  return (WTSmartReplyConfiguration *)*v2;
}

- (void)setSmartReplyConfiguration:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration);
  swift_beginAccess();
  v5 = *v4;
  unint64_t *v4 = a3;
  id v6 = a3;
}

- (BOOL)isForInputDashboard
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard;
  swift_beginAccess();
  return *v2;
}

- (void)setIsForInputDashboard:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForInputDashboard;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isForAssistant
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant;
  swift_beginAccess();
  return *v2;
}

- (void)setIsForAssistant:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isForAssistant;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)wantsFormSheetPresentation
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsFormSheetPresentation;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsFormSheetPresentation:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_wantsFormSheetPresentation;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)formSheetUIType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_formSheetUIType);
  swift_beginAccess();
  return *v2;
}

- (void)setFormSheetUIType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_formSheetUIType);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSUUID)sessionUUID
{
  return (NSUUID *)sub_261C0AF04((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID);
}

- (void)setSessionUUID:(id)a3
{
}

- (NSUUID)suggestionUUID
{
  return (NSUUID *)sub_261C0AF04((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID);
}

- (void)setSuggestionUUID:(id)a3
{
}

- (NSUUID)contextUUID
{
  return (NSUUID *)sub_261C0AF04((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID);
}

- (void)setContextUUID:(id)a3
{
}

- (BOOL)isQuestionnairePopover
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover;
  swift_beginAccess();
  return *v2;
}

- (void)setIsQuestionnairePopover:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isQuestionnairePopover;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)sourceResponderHorizontalSizeClass
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceResponderHorizontalSizeClass);
  swift_beginAccess();
  return *v2;
}

- (void)setSourceResponderHorizontalSizeClass:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceResponderHorizontalSizeClass);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)isWindowingModeEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isWindowingModeEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsWindowingModeEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isWindowingModeEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSUUID)analyticsUUID
{
  return (NSUUID *)sub_261C0AF04((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_analyticsUUID);
}

- (void)setAnalyticsUUID:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)sub_261C0B374((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_bundleID);
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)requestPromptEntry
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestPromptEntry;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestPromptEntry:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_requestPromptEntry;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)sourceUserInterfaceIdiom
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceUserInterfaceIdiom);
  swift_beginAccess();
  return *v2;
}

- (void)setSourceUserInterfaceIdiom:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sourceUserInterfaceIdiom);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)isResumingFromModelEnrollment
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isResumingFromModelEnrollment;
  swift_beginAccess();
  return *v2;
}

- (void)setIsResumingFromModelEnrollment:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_isResumingFromModelEnrollment;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC14WritingToolsUI16WTStartupOptions)init
{
  return (_TtC14WritingToolsUI16WTStartupOptions *)WTStartupOptions.init()();
}

- (id)asBSActionAndReturnError:(id *)a3
{
  sub_261C0E614();
  v4 = self;
  v5 = (void *)sub_261C10BA0();

  return v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_smartReplyConfiguration));
  sub_261C0E108((uint64_t)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_sessionUUID);
  sub_261C0E108((uint64_t)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_suggestionUUID);
  sub_261C0E108((uint64_t)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_contextUUID);
  sub_261C0E108((uint64_t)self + OBJC_IVAR____TtC14WritingToolsUI16WTStartupOptions_analyticsUUID);

  swift_bridgeObjectRelease();
}

@end