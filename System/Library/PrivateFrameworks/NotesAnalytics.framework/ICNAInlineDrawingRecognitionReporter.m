@interface ICNAInlineDrawingRecognitionReporter
+ (id)sharedReporter;
- (ICNAInlineDrawingRecognitionReporter)init;
- (NSMutableDictionary)stagedReports;
- (void)analyticsSessionWillEnd:(id)a3;
- (void)createReportForDrawing:(id)a3 drawingID:(id)a4 insideNote:(id)a5;
- (void)dealloc;
- (void)reportNotification:(id)a3;
- (void)setStagedReports:(id)a3;
- (void)submitReportsWithEventReporter:(id)a3;
@end

@implementation ICNAInlineDrawingRecognitionReporter

+ (id)sharedReporter
{
  if (s_onceToken_0 != -1) {
    dispatch_once(&s_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedReporter_s_instance_0;
  return v2;
}

uint64_t __54__ICNAInlineDrawingRecognitionReporter_sharedReporter__block_invoke()
{
  sharedReporter_s_instance_0 = objc_alloc_init(ICNAInlineDrawingRecognitionReporter);
  return MEMORY[0x1F41817F8]();
}

- (ICNAInlineDrawingRecognitionReporter)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICNAInlineDrawingRecognitionReporter;
  v2 = [(ICNAInlineDrawingRecognitionReporter *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stagedReports = v2->_stagedReports;
    v2->_stagedReports = v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_reportNotification_ name:*MEMORY[0x1E4F838C8] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_analyticsSessionWillEnd_ name:@"ICNASessionWillEndNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICNAInlineDrawingRecognitionReporter;
  [(ICNAInlineDrawingRecognitionReporter *)&v4 dealloc];
}

- (void)reportNotification:(id)a3
{
  id v12 = [a3 userInfo];
  objc_opt_class();
  objc_super v4 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F838D0]];
  v5 = ICDynamicCast();

  objc_opt_class();
  v6 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F838D8]];
  v7 = ICDynamicCast();

  objc_opt_class();
  objc_super v8 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F838E0]];
  v9 = ICDynamicCast();

  if (v5) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v9 != 0) {
    [(ICNAInlineDrawingRecognitionReporter *)self createReportForDrawing:v5 drawingID:v7 insideNote:v9];
  }
}

- (void)createReportForDrawing:(id)a3 drawingID:(id)a4 insideNote:(id)a5
{
  id v8 = a5;
  id v35 = a4;
  id v9 = a3;
  v36 = objc_alloc_init(ICNAInlineDrawingRecognitionReport);
  BOOL v10 = [(ICNAObject *)self eventReporter];
  v11 = [v10 noteDataForModernNote:v8];
  [(ICNAInlineDrawingRecognitionReport *)v36 setNoteData:v11];

  id v12 = [(ICNAObject *)self eventReporter];
  v13 = [v12 noteAccessDataForModernNote:v8];
  [(ICNAInlineDrawingRecognitionReport *)v36 setNoteAccessData:v13];

  v14 = [(ICNAObject *)self eventReporter];
  v15 = [v8 account];

  v16 = [v14 accountDataForModernAccount:v15];
  [(ICNAInlineDrawingRecognitionReport *)v36 setAccountData:v16];

  v17 = +[ICNAIdentityManager sharedManager];
  v34 = [v17 saltedID:v35 forClass:objc_opt_class()];

  v18 = [(ICNAObject *)self eventReporter];
  uint64_t v19 = [v18 pencilStrokeCountForDrawing:v9];

  v20 = [v9 strokes];
  uint64_t v21 = [v20 count] - v19;

  v22 = [v9 indexableContent];

  v23 = [v22 presentableTextRepresentation];

  uint64_t v24 = [(__CFString *)v23 length];
  uint64_t v25 = [(__CFString *)v23 ic_numberOfLines];
  v38.length = [(__CFString *)v23 length];
  v38.location = 0;
  v26 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v23, v38);
  v27 = [ICASDrawingRecognitionData alloc];
  v28 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v19)];
  v29 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v21)];
  v30 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v24)];
  v31 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v25)];
  v32 = [(ICASDrawingRecognitionData *)v27 initWithCountOfPencilStrokes:v28 countOfFingerStrokes:v29 countOfRecognizedHandwrittenCharacters:v30 countOfRecognizedLines:v31 handwritingLanguage:v26 drawingID:v34];
  [(ICNAInlineDrawingRecognitionReport *)v36 setDrawingRecognitionData:v32];

  v33 = [(ICNAInlineDrawingRecognitionReporter *)self stagedReports];
  [v33 setObject:v36 forKeyedSubscript:v35];
}

- (void)analyticsSessionWillEnd:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 object];

  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v6 = [ICNAEventReporter alloc];
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = [(ICNAEventReporter *)v6 initWithSubTrackerName:v8 windowScene:v10];

    [(ICNAInlineDrawingRecognitionReporter *)self submitReportsWithEventReporter:v9];
  }
}

- (void)submitReportsWithEventReporter:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  v23 = self;
  id obj = [(ICNAInlineDrawingRecognitionReporter *)self stagedReports];
  objc_sync_enter(obj);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [(ICNAInlineDrawingRecognitionReporter *)self stagedReports];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v20 = v4;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v24 = v5;
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v20);
        }
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v8 = [(ICNAInlineDrawingRecognitionReporter *)v23 stagedReports];
        id v9 = [v8 objectForKeyedSubscript:v7];

        id v10 = +[ICNAController sharedController];
        uint64_t v11 = objc_opt_class();
        id v12 = [v9 noteData];
        v29[0] = v12;
        v13 = [v9 noteAccessData];
        v29[1] = v13;
        v14 = [v9 accountData];
        v29[2] = v14;
        v15 = [v9 drawingRecognitionData];
        v29[3] = v15;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
        v17 = [v22 subTracker];
        [v10 submitEventOfType:v11 pushThenPopDataObjects:v16 subTracker:v17];
      }
      id v4 = v20;
      uint64_t v5 = [v20 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  v18 = [(ICNAInlineDrawingRecognitionReporter *)v23 stagedReports];
  [v18 removeAllObjects];

  objc_sync_exit(obj);
}

- (NSMutableDictionary)stagedReports
{
  return self->_stagedReports;
}

- (void)setStagedReports:(id)a3
{
}

- (void).cxx_destruct
{
}

@end