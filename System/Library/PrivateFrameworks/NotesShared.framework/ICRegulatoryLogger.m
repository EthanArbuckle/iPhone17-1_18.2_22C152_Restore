@interface ICRegulatoryLogger
- (ICRegulatoryLogger)init;
- (ct_green_tea_logger_s)greenTeaLogger;
- (void)dealloc;
- (void)didReadAttachment:(id)a3;
- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3;
@end

@implementation ICRegulatoryLogger

- (ICRegulatoryLogger)init
{
  v10.receiver = self;
  v10.super_class = (Class)ICRegulatoryLogger;
  v2 = [(ICRegulatoryLogger *)&v10 init];
  if (v2)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    v3 = (uint64_t (*)(const char *))getct_green_tea_logger_createSymbolLoc_ptr;
    v19 = getct_green_tea_logger_createSymbolLoc_ptr;
    if (!getct_green_tea_logger_createSymbolLoc_ptr)
    {
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __getct_green_tea_logger_createSymbolLoc_block_invoke;
      v14 = &unk_1E64A45A0;
      v15 = &v16;
      v4 = (void *)libCTGreenTeaLoggerLibrary();
      v5 = dlsym(v4, "ct_green_tea_logger_create");
      *(void *)(v15[1] + 24) = v5;
      getct_green_tea_logger_createSymbolLoc_ptr = *(_UNKNOWN **)(v15[1] + 24);
      v3 = (uint64_t (*)(const char *))v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v3)
    {
      v9 = (_Unwind_Exception *)__35__ICSearchQueryOperation_nlpParser__block_invoke_cold_1();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(v9);
    }
    [(ICRegulatoryLogger *)v2 setGreenTeaLogger:v3("com.apple.mobilenotes")];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_didReadAttachment_ name:@"ICRegulatoryLoggerAttachmentAddedNotification" object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel_didReadAttachment_ name:@"ICRegulatoryLoggerAttachmentPlayedNotification" object:0];
  }
  return v2;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICRegulatoryLogger;
  [(ICRegulatoryLogger *)&v4 dealloc];
}

- (void)didReadAttachment:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 userInfo];

  v6 = [v5 objectForKeyedSubscript:@"ICRegulatoryLoggerAttachmentKey"];
  v7 = ICDynamicCast();

  v8 = [v7 managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__ICRegulatoryLogger_didReadAttachment___block_invoke;
  v10[3] = &unk_1E64A4218;
  id v11 = v7;
  uint64_t v12 = self;
  id v9 = v7;
  [v8 performBlock:v10];
}

void __40__ICRegulatoryLogger_didReadAttachment___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) attachmentType] == 4)
  {
    v2 = soft_getCTGreenTeaOsLogHandle([*(id *)(a1 + 40) greenTeaLogger]);
    v3 = v2;
    if (!v2 || !os_log_type_enabled(v2, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    __int16 v8 = 0;
    id v4 = "Reading audio data";
    v5 = (uint8_t *)&v8;
    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) attachmentType] != 5) {
    return;
  }
  v6 = soft_getCTGreenTeaOsLogHandle([*(id *)(a1 + 40) greenTeaLogger]);
  v3 = v6;
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = 0;
    id v4 = "Reading video data";
    v5 = (uint8_t *)&v7;
LABEL_9:
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
  }
LABEL_10:
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

@end