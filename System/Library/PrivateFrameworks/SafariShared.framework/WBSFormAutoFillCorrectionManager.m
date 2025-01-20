@interface WBSFormAutoFillCorrectionManager
- (WBSFormAutoFillCorrectionManager)initWithCorrectionsStore:(id)a3;
- (WBSFormAutoFillCorrectionManagerDelegate)delegate;
- (id)_feedbackProcessor;
- (void)_setCorrections:(id)a3 forFingerprint:(id)a4 onDomain:(id)a5;
- (void)getCorrectionsForFormFieldFingerprint:(id)a3 onDomain:(id)a4 completionHandler:(id)a5;
- (void)setCorrectionSet:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WBSFormAutoFillCorrectionManager

- (WBSFormAutoFillCorrectionManager)initWithCorrectionsStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSFormAutoFillCorrectionManager;
  v6 = [(WBSFormAutoFillCorrectionManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_correctionsStore, a3);
    v8 = v7;
  }

  return v7;
}

- (void)getCorrectionsForFormFieldFingerprint:(id)a3 onDomain:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  correctionsStore = self->_correctionsStore;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__WBSFormAutoFillCorrectionManager_getCorrectionsForFormFieldFingerprint_onDomain_completionHandler___block_invoke;
  v11[3] = &unk_1E5C8D410;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(WBSFormAutoFillCorrectionsStore *)correctionsStore getClassificationForFieldWithFingerprint:a3 onDomain:a4 completionHandler:v11];
}

void __101__WBSFormAutoFillCorrectionManager_getCorrectionsForFormFieldFingerprint_onDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__WBSFormAutoFillCorrectionManager_getCorrectionsForFormFieldFingerprint_onDomain_completionHandler___block_invoke_2;
  block[3] = &unk_1E5C8D578;
  id v4 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = v4;
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __101__WBSFormAutoFillCorrectionManager_getCorrectionsForFormFieldFingerprint_onDomain_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[6];
  id v2 = [*(id *)(a1[4] + 16) transformedValue:a1[5]];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)_setCorrections:(id)a3 forFingerprint:(id)a4 onDomain:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v16;
  id v11 = v9;
  classificationToCorrectionsTransformer = self->_classificationToCorrectionsTransformer;
  if (!classificationToCorrectionsTransformer)
  {
    v13 = objc_alloc_init(WBSFormAutoFillClassificationToCorrectionsTransformer);
    v14 = self->_classificationToCorrectionsTransformer;
    self->_classificationToCorrectionsTransformer = v13;

    classificationToCorrectionsTransformer = self->_classificationToCorrectionsTransformer;
    id v10 = v16;
  }
  v15 = [(WBSFormAutoFillClassificationToCorrectionsTransformer *)classificationToCorrectionsTransformer reverseTransformedValue:v10];
  if (v15) {
    [(WBSFormAutoFillCorrectionsStore *)self->_correctionsStore setLocalClassification:v15 forFieldWithFingerprint:v8 onDomain:v11 completionHandler:0];
  }
}

- (void)setCorrectionSet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fingerprintsToCorrections];
  v6 = [v4 domain];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __53__WBSFormAutoFillCorrectionManager_setCorrectionSet___block_invoke;
  v15 = &unk_1E5C9AE58;
  id v16 = self;
  id v7 = v6;
  id v17 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:&v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(WeakRetained, "autoFillCorrectionManagerShouldProcessFeedback:", self, v12, v13, v14, v15, v16) & 1) == 0)
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[WBSFormAutoFillCorrectionManager setCorrectionSet:](v11);
    }
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(WBSFormAutoFillCorrectionManager *)(uint64_t)v4 setCorrectionSet:v9];
    }
    id v10 = [(WBSFormAutoFillCorrectionManager *)self _feedbackProcessor];
    [v10 sendFeedbackWithCorrectionSet:v4];
  }
}

uint64_t __53__WBSFormAutoFillCorrectionManager_setCorrectionSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _setCorrections:a3 forFingerprint:a2 onDomain:*(void *)(a1 + 40)];
}

- (id)_feedbackProcessor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [WeakRetained feedbackProcessorForAutoFillCorrectionManager:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (WBSFormAutoFillCorrectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSFormAutoFillCorrectionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_classificationToCorrectionsTransformer, 0);
  objc_storeStrong((id *)&self->_correctionsStore, 0);
}

- (void)setCorrectionSet:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Preparing to send AutoFill corrections: %@ on domain: %@", (uint8_t *)&v3, 0x16u);
}

- (void)setCorrectionSet:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Not sending AutoFill feedback since the correction manager told us not to", v1, 2u);
}

@end