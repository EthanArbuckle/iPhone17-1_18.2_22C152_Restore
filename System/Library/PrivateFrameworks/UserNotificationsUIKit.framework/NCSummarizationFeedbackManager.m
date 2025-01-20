@interface NCSummarizationFeedbackManager
- (BOOL)showInternalFeedbackMenu;
- (NCSummarizationFeedbackManager)init;
- (NCSummarizationFeedbackManager)initWithRequest:(id)a3 isShowingStackSummary:(BOOL)a4;
- (id)reportConcernImage;
- (id)sectionTitle;
- (id)thumbsDownImage;
- (id)thumbsUpImage;
- (void)reportConcern;
- (void)thumbsDown;
- (void)thumbsUp;
@end

@implementation NCSummarizationFeedbackManager

- (NCSummarizationFeedbackManager)initWithRequest:(id)a3 isShowingStackSummary:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  v7 = sub_1D7D28B54(v5);
  if (v7)
  {
    v9 = (char *)v6 + OBJC_IVAR___NCSummarizationFeedbackManager_summarizationFeedbackManagerSwift;
    *(void *)v9 = v7;
    v9[8] = v8 & 1;
    v9[9] = HIBYTE(v8);

    v12.receiver = v6;
    v12.super_class = (Class)NCSummarizationFeedbackManager;
    v10 = [(NCSummarizationFeedbackManager *)&v12 init];
  }
  else
  {

    type metadata accessor for NCSummarizationFeedbackManager();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v10;
}

- (id)thumbsUpImage
{
  return sub_1D7D26EE0(self, (uint64_t)a2, MEMORY[0x1E4F618F8]);
}

- (id)thumbsDownImage
{
  return sub_1D7D26EE0(self, (uint64_t)a2, MEMORY[0x1E4F618E8]);
}

- (id)reportConcernImage
{
  return sub_1D7D26EE0(self, (uint64_t)a2, MEMORY[0x1E4F618F0]);
}

- (void)thumbsUp
{
}

- (void)thumbsDown
{
}

- (void)reportConcern
{
}

- (BOOL)showInternalFeedbackMenu
{
  v2 = self;
  if ((os_variant_has_internal_content() & 1) != 0 || _NCDeviceIsRunningSeedBuild())
  {
    if (qword_1EA878BA0 != -1) {
      swift_once();
    }
    char v3 = byte_1EA879038;

    char v4 = v3 ^ 1;
  }
  else
  {

    char v4 = 0;
  }
  return v4 & 1;
}

- (id)sectionTitle
{
  sub_1D7D28BF4();
  v2 = (void *)sub_1D7D7F760();
  swift_bridgeObjectRelease();

  return v2;
}

- (NCSummarizationFeedbackManager)init
{
  result = (NCSummarizationFeedbackManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___NCSummarizationFeedbackManager_summarizationFeedbackManagerSwift));
}

@end