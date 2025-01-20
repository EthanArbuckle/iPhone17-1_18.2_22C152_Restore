@interface UIDictationCommandHandler
- (SRCSCommandRecognitionSystem)cmdRecSystem;
- (SRCSCommandRecognizer)cmdRecognizer;
- (void)recognizeCommandWithPhrases:(id)a3 completionHandler:(id)a4;
- (void)registerCommandIdentifiers:(id)a3 locale:(id)a4;
- (void)setCmdRecSystem:(id)a3;
- (void)setCmdRecognizer:(id)a3;
@end

@implementation UIDictationCommandHandler

- (void)registerCommandIdentifiers:(id)a3 locale:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2050000000;
  v8 = (void *)qword_1EB25EE28;
  uint64_t v36 = qword_1EB25EE28;
  if (!qword_1EB25EE28)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __getSRCSCommandRecognitionSystemClass_block_invoke;
    v31 = &unk_1E52D9900;
    v32 = &v33;
    __getSRCSCommandRecognitionSystemClass_block_invoke((uint64_t)&v28);
    v8 = (void *)v34[3];
  }
  v9 = v8;
  _Block_object_dispose(&v33, 8);
  v10 = (SRCSCommandRecognitionSystem *)[[v9 alloc] initWithLocaleIdentifier:v7];
  cmdRecSystem = self->_cmdRecSystem;
  self->_cmdRecSystem = v10;

  v12 = (void *)[objc_alloc((Class)getSRCSCommandStringsTableClass()) initWithLocaleIdentifier:v7];
  v13 = [v12 supportedCommandIdentifiersForTargetTypes:0];
  v14 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsObject:", v19, (void)v24)) {
          [v14 addObject:v19];
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v37 count:16];
    }
    while (v16);
  }

  if ([v14 count])
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v20 = (void *)qword_1EB25EE30;
    uint64_t v36 = qword_1EB25EE30;
    if (!qword_1EB25EE30)
    {
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      v30 = __getSRCSCommandRecognizerClass_block_invoke;
      v31 = &unk_1E52D9900;
      v32 = &v33;
      __getSRCSCommandRecognizerClass_block_invoke((uint64_t)&v28);
      v20 = (void *)v34[3];
    }
    v21 = v20;
    _Block_object_dispose(&v33, 8);
    v22 = (SRCSCommandRecognizer *)[[v21 alloc] initWithCommandRecognitionSystem:self->_cmdRecSystem commandIdentifiers:v14];
    cmdRecognizer = self->_cmdRecognizer;
    self->_cmdRecognizer = v22;
  }
}

- (void)recognizeCommandWithPhrases:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, void *))a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = [(SRCSCommandRecognitionSystem *)self->_cmdRecSystem spokenCommandFromRecognizedAFSpeechPhrases:v6];
  if (pthread_main_np() == 1)
  {
    v8 = [(id)v15[5] identifier];
    v9 = [(id)v15[5] strings];
    v10 = [(id)v15[5] recognizedParameters];
    v7[2](v7, v8, v9, v10);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__UIDictationCommandHandler_recognizeCommandWithPhrases_completionHandler___block_invoke;
    v11[3] = &unk_1E52DA288;
    v12 = v7;
    v13 = &v14;
    dispatch_sync(MEMORY[0x1E4F14428], v11);
    v8 = v12;
  }

  _Block_object_dispose(&v14, 8);
}

void __75__UIDictationCommandHandler_recognizeCommandWithPhrases_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) identifier];
  v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) strings];
  v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) recognizedParameters];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);
}

- (SRCSCommandRecognitionSystem)cmdRecSystem
{
  return self->_cmdRecSystem;
}

- (void)setCmdRecSystem:(id)a3
{
}

- (SRCSCommandRecognizer)cmdRecognizer
{
  return self->_cmdRecognizer;
}

- (void)setCmdRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmdRecognizer, 0);
  objc_storeStrong((id *)&self->_cmdRecSystem, 0);
}

@end