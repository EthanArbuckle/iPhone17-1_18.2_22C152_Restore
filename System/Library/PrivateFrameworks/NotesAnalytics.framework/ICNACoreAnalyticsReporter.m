@interface ICNACoreAnalyticsReporter
+ (id)analyticsQueue;
+ (id)sharedReporter;
- (ICNACoreAnalyticsReporter)init;
- (NSString)currentlyViewedNoteIdentifier;
- (NSString)noteViewApproach;
- (id)consumeNoteViewApproach;
- (void)appSessionWillEnd:(id)a3;
- (void)fireDeepLinkCreationEventWithNote:(id)a3 contentItem:(id)a4;
- (void)fireNoteViewEventWithNote:(id)a3 noteData:(id)a4 noteContentData:(id)a5;
- (void)fireSnapshotWithNoteReportToDevice:(id)a3;
- (void)fireUpdateHandWritingContentEventWithNoteData:(id)a3 pencilIsUsed:(BOOL)a4;
- (void)setCurrentlyViewedNoteIdentifier:(id)a3;
- (void)setNoteViewApproach:(id)a3;
@end

@implementation ICNACoreAnalyticsReporter

+ (id)sharedReporter
{
  if (s_onceToken_3 != -1) {
    dispatch_once(&s_onceToken_3, &__block_literal_global_7);
  }
  v2 = (void *)sharedReporter_s_instance_1;
  return v2;
}

uint64_t __43__ICNACoreAnalyticsReporter_sharedReporter__block_invoke()
{
  sharedReporter_s_instance_1 = objc_alloc_init(ICNACoreAnalyticsReporter);
  return MEMORY[0x1F41817F8]();
}

- (ICNACoreAnalyticsReporter)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICNACoreAnalyticsReporter;
  v2 = [(ICNAOptedInObject *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_appSessionWillEnd_ name:@"ICNASessionWillEndNotification" object:0];
  }
  return v2;
}

+ (id)analyticsQueue
{
  if (analyticsQueue_onceToken != -1) {
    dispatch_once(&analyticsQueue_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)analyticsQueue_sAnalyticsQueue;
  return v2;
}

void __43__ICNACoreAnalyticsReporter_analyticsQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.notes.analytics", v2);
  v1 = (void *)analyticsQueue_sAnalyticsQueue;
  analyticsQueue_sAnalyticsQueue = (uint64_t)v0;
}

- (id)consumeNoteViewApproach
{
  noteViewApproach = self->_noteViewApproach;
  if (noteViewApproach) {
    v4 = (__CFString *)[(NSString *)noteViewApproach copy];
  }
  else {
    v4 = @"iOSInAppSelection";
  }
  objc_super v5 = self->_noteViewApproach;
  self->_noteViewApproach = 0;

  return v4;
}

- (void)appSessionWillEnd:(id)a3
{
  v4 = [(id)objc_opt_class() analyticsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ICNACoreAnalyticsReporter_appSessionWillEnd___block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __47__ICNACoreAnalyticsReporter_appSessionWillEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentlyViewedNoteIdentifier:0];
}

- (void)fireUpdateHandWritingContentEventWithNoteData:(id)a3 pencilIsUsed:(BOOL)a4
{
  BOOL v4 = a4;
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"isSystemPaper";
  objc_super v5 = [a3 isScrapPaper];
  v8[1] = @"isUpdatedByApplePencil";
  v9[0] = v5;
  v6 = [NSNumber numberWithBool:v4];
  v9[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  AnalyticsSendEvent();
}

- (void)fireDeepLinkCreationEventWithNote:(id)a3 contentItem:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 sourceIdentifier];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = +[ICNAEventReporter maskString:v6 withoutPrefix:@"com.apple." withMask:@"thirdPartyBundleID"];
  }
  else
  {
    v8 = @"unknown";
  }
  v11[0] = @"isDestinationNoteSystemPaper";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isSystemPaper"));
  v11[1] = @"sourceAppBundleID";
  v12[0] = v9;
  v12[1] = v8;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  AnalyticsSendEvent();
}

- (void)fireNoteViewEventWithNote:(id)a3 noteData:(id)a4 noteContentData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(id)objc_opt_class() analyticsQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke;
  v15[3] = &unk_1E64B9888;
  id v16 = v8;
  v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke(id *a1)
{
  v2 = [a1[4] managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke_2;
  v5[3] = &unk_1E64B9888;
  int8x16_t v4 = *((int8x16_t *)a1 + 2);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = a1[6];
  id v8 = a1[7];
  [v2 performBlock:v5];
}

void __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke_2(id *a1)
{
  v40[10] = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] currentlyViewedNoteIdentifier];
  id v3 = [a1[5] identifier];
  char v4 = [v2 isEqualToString:v3];

  if ((v4 & 1) == 0)
  {
    id v5 = [a1[6] hasPaperKitDrawing];
    if ([v5 BOOLValue])
    {
      uint64_t v6 = 1;
    }
    else
    {
      id v7 = [a1[6] hasAttachmentInlineDrawingV1];
      if ([v7 BOOLValue])
      {
        uint64_t v6 = 1;
      }
      else
      {
        id v8 = [a1[6] hasAttachmentInlineDrawingV2];
        if ([v8 BOOLValue])
        {
          uint64_t v6 = 1;
        }
        else
        {
          id v9 = [a1[6] hasAttachmentFullscreenDrawing];
          uint64_t v6 = [v9 BOOLValue];
        }
      }
    }
    id v10 = [a1[5] textStorageWithoutCreating];
    v11 = [v10 string];
    uint64_t v12 = objc_msgSend(v11, "ic_containsNonWhitespaceAndAttachmentCharacters");

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    id v13 = [a1[5] visibleAttachments];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke_3;
    v26[3] = &unk_1E64B9860;
    v26[4] = &v35;
    v26[5] = &v31;
    v26[6] = &v27;
    [v13 enumerateObjectsUsingBlock:v26];

    v39[0] = @"hasDrawing";
    v25 = [NSNumber numberWithBool:v6];
    v40[0] = v25;
    v39[1] = @"hasImage";
    v24 = [a1[6] hasAttachedPhoto];
    v40[1] = v24;
    v39[2] = @"hasOtherLinks";
    id v14 = [NSNumber numberWithBool:*((unsigned __int8 *)v28 + 24)];
    v40[2] = v14;
    v39[3] = @"hasDeeplinks";
    v15 = [NSNumber numberWithBool:*((unsigned __int8 *)v32 + 24)];
    v40[3] = v15;
    v39[4] = @"hasTable";
    id v16 = [a1[6] hasTable];
    v40[4] = v16;
    v39[5] = @"hasTypedText";
    v17 = [NSNumber numberWithBool:v12];
    v40[5] = v17;
    v39[6] = @"hasWebHighlights";
    id v18 = [NSNumber numberWithBool:*((unsigned __int8 *)v36 + 24)];
    v40[6] = v18;
    v39[7] = @"isSystemPaper";
    id v19 = [a1[7] isScrapPaper];
    v40[7] = v19;
    v39[8] = @"noteIsNewlyCreated";
    v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "isEmpty"));
    v40[8] = v20;
    v39[9] = @"systemPaperInvocationMethod";
    v21 = [a1[4] consumeNoteViewApproach];
    v40[9] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:10];
    AnalyticsSendEvent();

    v23 = [a1[5] identifier];
    [a1[4] setCurrentlyViewedNoteIdentifier:v23];

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
  }
}

void __80__ICNACoreAnalyticsReporter_fireNoteViewEventWithNote_noteData_noteContentData___block_invoke_3(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v9 = v5;
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    BOOL v6 = +[ICNAEventReporter attachmentHasDeepLinkSafariHighlight:v5];
    id v5 = v9;
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) |= v6;
  }
  char v7 = [v5 hasDeepLink];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) |= v7;
  if ((v7 & 1) == 0 && !*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= [v9 isURL];
  }
  char v8 = *(unsigned char *)(*(void *)(a1[4] + 8) + 24);
  if (v8)
  {
    char v8 = *(unsigned char *)(*(void *)(a1[5] + 8) + 24);
    if (v8) {
      char v8 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24) != 0;
    }
  }
  *a3 = v8;
}

- (void)fireSnapshotWithNoteReportToDevice:(id)a3
{
  v23[14] = *MEMORY[0x1E4F143B8];
  v22[0] = @"countOfModernNotes";
  id v3 = NSNumber;
  id v4 = a3;
  v21 = objc_msgSend(v3, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotes")));
  v23[0] = v21;
  v22[1] = @"countOfModernNotesWithDeeplinks";
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithDeeplink")));
  v23[1] = v20;
  v22[2] = @"countOfModernNotesWithDrawing";
  id v19 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithDrawing")));
  v23[2] = v19;
  v22[3] = @"countOfModernNotesWithImage";
  id v18 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithImage")));
  v23[3] = v18;
  v22[4] = @"countOfModernNotesWithOtherLinks";
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithLinks")));
  v23[4] = v17;
  v22[5] = @"countOfModernNotesWithTable";
  id v16 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithTable")));
  v23[5] = v16;
  v22[6] = @"countOfModernNotesWithWebHighlights";
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfModernNotesWithWebHighlights")));
  v23[6] = v5;
  v22[7] = @"countOfSystemPaper";
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapers")));
  v23[7] = v6;
  v22[8] = @"countOfSystemPaperWithDeeplinks";
  char v7 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithDeepLink")));
  v23[8] = v7;
  v22[9] = @"countOfSystemPaperWithDrawing";
  char v8 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithDrawing")));
  v23[9] = v8;
  v22[10] = @"countOfSystemPaperWithImage";
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithImage")));
  v23[10] = v9;
  v22[11] = @"countOfSystemPaperWithOtherLinks";
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithLinks")));
  v23[11] = v10;
  v22[12] = @"countOfSystemPaperWithTable";
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v4, "countOfScrapPapersWithTables")));
  v23[12] = v11;
  v22[13] = @"countOfSystemPaperWithWebHighlights";
  uint64_t v12 = NSNumber;
  uint64_t v13 = [v4 countOfScrapPapersWithWebHighlights];

  id v14 = [v12 numberWithInteger:ICNARoundTo2SigFigsInt(v13)];
  v23[13] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:14];
  AnalyticsSendEvent();
}

- (NSString)noteViewApproach
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNoteViewApproach:(id)a3
{
}

- (NSString)currentlyViewedNoteIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentlyViewedNoteIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyViewedNoteIdentifier, 0);
  objc_storeStrong((id *)&self->_noteViewApproach, 0);
}

@end