@interface RCCompositionComposedAssetWriter
- (RCComposition)composition;
- (RCCompositionComposedAssetWriter)initWithComposition:(id)a3;
- (float)progress;
- (void)cancel;
- (void)writeCompositionWithCompletionBlock:(id)a3;
@end

@implementation RCCompositionComposedAssetWriter

- (RCCompositionComposedAssetWriter)initWithComposition:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCCompositionComposedAssetWriter;
  v6 = [(RCCompositionComposedAssetWriter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_composition, a3);
  }

  return v7;
}

- (void)cancel
{
}

- (float)progress
{
  exportSession = self->_exportSession;
  if (!exportSession) {
    return 0.0;
  }
  [(AVAssetExportSession *)exportSession progress];
  return result;
}

- (void)writeCompositionWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__4;
  v64 = __Block_byref_object_dispose__4;
  id v65 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke;
  v57[3] = &unk_1E6496DC8;
  id v5 = v4;
  id v58 = v5;
  v59 = &v60;
  v6 = (void (**)(void, void, void))MEMORY[0x1C8778060](v57);
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__4;
  v55 = __Block_byref_object_dispose__4;
  id v56 = (id)*MEMORY[0x1E4F156D8];
  v7 = [(RCComposition *)self->_composition composedFragments];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_2;
  v50[3] = &unk_1E64969F0;
  v50[4] = &v51;
  [v7 enumerateObjectsUsingBlock:v50];

  v8 = [(RCComposition *)self->_composition composedAVURL];
  objc_super v9 = [v8 pathExtension];
  v10 = @"qta";
  if ([v9 isEqualToString:@"qta"])
  {
  }
  else
  {
    BOOL v11 = [(RCComposition *)self->_composition hasMultipleTracks];

    if (!v11) {
      v10 = @"m4a";
    }
  }
  v12 = v10;
  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  v14 = [(RCComposition *)self->_composition composedAVURL];
  id v49 = 0;
  uint64_t v15 = [v13 URLForDirectory:99 inDomain:1 appropriateForURL:v14 create:1 error:&v49];
  id v16 = v49;
  v17 = (void *)v61[5];
  v61[5] = v15;

  if (v61[5])
  {
    v18 = [(RCComposition *)self->_composition savedRecordingUUID];
    if (v18)
    {
      v47[0] = 0;
      v47[1] = v47;
      v47[2] = 0x3032000000;
      v47[3] = __Block_byref_object_copy__4;
      v47[4] = __Block_byref_object_dispose__4;
      v19 = [(id)v61[5] URLByAppendingPathComponent:v18];
      id v48 = [v19 URLByAppendingPathExtension:v12];

      composition = self->_composition;
      id v46 = 0;
      v21 = [(RCComposition *)composition compositionAssetForExport:&v46];
      id v22 = v46;
      v23 = v22;
      if (v21)
      {
        id v30 = v22;
        v31 = v12;
        id v32 = v5;
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x3032000000;
        v43 = __Block_byref_object_copy__4;
        v44 = __Block_byref_object_dispose__4;
        id v45 = (id)*MEMORY[0x1E4F15A78];
        v24 = (void *)MEMORY[0x1E4F16360];
        uint64_t v25 = v52[5];
        uint64_t v26 = v41[5];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_7;
        v33[3] = &unk_1E6496E18;
        v37 = &v51;
        v38 = &v40;
        v39 = v47;
        id v34 = v21;
        v35 = self;
        v36 = v6;
        [v24 determineCompatibilityOfExportPreset:v25 withAsset:v34 outputFileType:v26 completionHandler:v33];

        _Block_object_dispose(&v40, 8);
        v12 = v31;
        id v5 = v32;
        v23 = v30;
      }
      else
      {
        v29 = RCGenericErrorWithUnderlyingError(v22);
        ((void (**)(void, void, void *))v6)[2](v6, 0, v29);
      }
      _Block_object_dispose(v47, 8);
    }
    else
    {
      v28 = RCGenericErrorWithUnderlyingError(0);
      ((void (**)(void, void, void *))v6)[2](v6, 0, v28);
    }
  }
  else
  {
    v27 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:]((uint64_t)v16, v27);
    }

    v18 = RCGenericErrorWithUnderlyingError(v16);
    ((void (**)(void, void, void *))v6)[2](v6, 0, v18);
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v60, 8);
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v7 = [v6 objectForKey:@"RCSlowComposeDelay"];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F29060];
    [v7 doubleValue];
    objc_msgSend(v8, "sleepForTimeInterval:");
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v11, v5);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v10 removeItemAtURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:0];
  }
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 AVOutputURL];
  v6 = [MEMORY[0x1E4F166C8] assetWithURL:v5];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v7 = objc_msgSend(v6, "rc_audioTracks");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    uint64_t v18 = *(void *)v26;
    v19 = a4;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v13 = [v12 formatDescriptions];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              if (CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((void *)&v21 + 1) + 8 * j)) == 1634492771)
              {
                objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (id)*MEMORY[0x1E4F15770]);
                unsigned char *v19 = 1;

                goto LABEL_18;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v10 = v18;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
LABEL_18:
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_7(uint64_t a1, int a2)
{
  if (a2
    && (objc_msgSend(*(id *)(a1 + 32), "rc_audioTracks"),
        v3 = objc_claimAutoreleasedReturnValue(),
        unint64_t v4 = [v3 count],
        v3,
        v4 < 2))
  {
    id v5 = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), (id)*MEMORY[0x1E4F15758]);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), (id)*MEMORY[0x1E4F15AB0]);
    id v5 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "rc_URLByReplacingPathExtensionWithExtension:", @"qt");
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F16360]) initWithAsset:*(void *)(a1 + 32) presetName:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = v6;

  [*(id *)(*(void *)(a1 + 40) + 8) setOutputFileType:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v9 = v5;
  if (!v5) {
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  [*(id *)(*(void *)(a1 + 40) + 8) setOutputURL:v9];
  uint64_t v10 = +[RCCaptureFormat AVAssetAuthoringMetadataWithComposition:*(void *)(*(void *)(a1 + 40) + 16)];
  [*(id *)(*(void *)(a1 + 40) + 8) setMetadata:v10];

  uint64_t v11 = *(void *)(a1 + 40);
  v12 = *(void **)(v11 + 8);
  if (v12)
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    char v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__4;
    v24[4] = __Block_byref_object_dispose__4;
    id v25 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_9;
    v18[3] = &unk_1E6496DF0;
    v18[4] = v11;
    long long v21 = v26;
    long long v22 = v24;
    id v13 = v5;
    uint64_t v14 = *(void *)(a1 + 72);
    id v19 = v13;
    uint64_t v23 = v14;
    id v20 = *(id *)(a1 + 48);
    [v12 exportAsynchronouslyWithCompletionHandler:v18];

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);
  }
  else
  {
    uint64_t v15 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_7_cold_1(v15);
    }

    uint64_t v16 = *(void *)(a1 + 48);
    v17 = RCGenericErrorWithUnderlyingError(0);
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);
  }
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_9(void *a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (uint64_t)(a1 + 4);
  if ([*(id *)(a1[4] + 8) status] == 4)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    uint64_t v3 = [*(id *)(a1[4] + 8) error];
    uint64_t v4 = *(void *)(a1[8] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_9_cold_2(v2, (uint64_t)(a1 + 8), v6);
    }
  }
  if ([*(id *)(*(void *)v2 + 8) status] != 3)
  {
    uint64_t v15 = a1[6];
    uint64_t v16 = [*(id *)(a1[4] + 8) error];
    v17 = RCGenericErrorWithUnderlyingError(v16);
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v17);

    return;
  }
  if (a1[5])
  {
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = a1[5];
    uint64_t v9 = *(void *)(*(void *)(a1[9] + 8) + 40);
    id v23 = 0;
    int v10 = [v7 moveItemAtURL:v8 toURL:v9 error:&v23];
    id v11 = v23;

    if (!v10)
    {
      (*(void (**)(void))(a1[6] + 16))();

      return;
    }
  }
  v12 = [MEMORY[0x1E4F166C8] assetWithURL:*(void *)(*(void *)(a1[9] + 8) + 40)];
  id v13 = objc_msgSend(v12, "rc_audioTracks");
  uint64_t v14 = [v13 count];

  if (v14)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v18 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_9_cold_1(v18);
    }

    uint64_t v19 = a1[6];
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28588];
    v25[0] = @"No audio tracks after export";
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    long long v22 = [v20 errorWithDomain:@"com.apple.VoiceMemos.ErrorDomain" code:401 userInfo:v21];
    (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v22);
  }
}

- (RCComposition)composition
{
  return self->_composition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_exportSession, 0);
}

- (void)writeCompositionWithCompletionBlock:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1C3964000, a2, OS_LOG_TYPE_FAULT, "%s -- ERROR: Unable to create temporary directory URLForDirectory error = %@", (uint8_t *)&v2, 0x16u);
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_7_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:]_block_invoke";
  _os_log_error_impl(&dword_1C3964000, log, OS_LOG_TYPE_ERROR, "%s -- ERROR: Unable to compose recording - there was a problem determining export settings", (uint8_t *)&v1, 0xCu);
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_9_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:]_block_invoke";
  _os_log_fault_impl(&dword_1C3964000, log, OS_LOG_TYPE_FAULT, "%s -- Export session produced file with no audio tracks", (uint8_t *)&v1, 0xCu);
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_9_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 8);
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v5 = 136315650;
  uint64_t v6 = "-[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_1C3964000, log, OS_LOG_TYPE_ERROR, "%s -- ERROR: Unable to compose recording - _exportSession = %@, underlying error = %@", (uint8_t *)&v5, 0x20u);
}

@end