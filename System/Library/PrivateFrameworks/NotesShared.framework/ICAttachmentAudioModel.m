@interface ICAttachmentAudioModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)deleteSummaryAndReturnError:(id *)a3;
- (BOOL)hidesSubAttachmentsInAttachmentBrowser;
- (BOOL)isReadyToPresent;
- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4;
- (BOOL)needsTranscription;
- (BOOL)providesStandaloneTitleForNote;
- (BOOL)recordedInNotes;
- (BOOL)saveAttachmentAndReturnError:(id *)a3;
- (ICAttachmentAudioModel)initWithAttachment:(id)a3;
- (ICTTAudioDocument)audioDocument;
- (NSArray)composedAudioAssetURLs;
- (id)asset;
- (id)bitFlippeddUUIDWithUuid:(id)a3;
- (id)createSubattachmentForRecordingAndReturnError:(id *)a3;
- (id)searchableTextContent;
- (id)standaloneTitleForNote;
- (void)assetWithCompletion:(id)a3;
- (void)attachmentDidRefresh:(BOOL)a3;
- (void)attachmentWillRefresh:(BOOL)a3;
- (void)attachmentWillTurnIntoFault;
- (void)audioDocument;
- (void)composedAudioAssetURLs;
- (void)setAudioDocument:(id)a3;
- (void)setRecordedInNotes:(BOOL)a3;
- (void)transformNewlyAddedMediaAttachment;
- (void)updateAfterLoadWithSubAttachmentIdentifierMap:(id)a3;
- (void)updateFileBasedAttributes;
- (void)writeMergeableData;
@end

@implementation ICAttachmentAudioModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  v4 = NSString;
  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_AUDIO_RECORDINGS_%lu" value:@"NOTE_LIST_AUDIO_RECORDINGS_%lu" table:0 allowSiri:1];
  v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (id)searchableTextContent
{
  v2 = [(ICAttachmentAudioModel *)self audioDocument];
  v3 = [v2 transcriptAsPlainText];

  return v3;
}

- (ICAttachmentAudioModel)initWithAttachment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentAudioModel;
  return [(ICAttachmentModel *)&v4 initWithAttachment:a3];
}

- (BOOL)isReadyToPresent
{
  v2 = [(ICAttachmentModel *)self attachment];
  char v3 = [v2 isUnsupported] ^ 1;

  return v3;
}

- (ICTTAudioDocument)audioDocument
{
  p_audioDocument = &self->_audioDocument;
  audioDocument = self->_audioDocument;
  if (audioDocument)
  {
    objc_super v4 = audioDocument;
  }
  else
  {
    v6 = [(ICAttachmentModel *)self attachment];
    v7 = [v6 mergeableData];

    v8 = [(ICAttachmentModel *)self currentReplicaID];
    if (v7)
    {
      v9 = +[ICTTAudioDocument unarchiveFromData:v7 replicaID:v8];
      if (v9)
      {
        objc_storeStrong((id *)p_audioDocument, v9);
      }
      else
      {
        v15 = os_log_create("com.apple.notes", "AudioTranscription");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[ICAttachmentAudioModel audioDocument](self);
        }
      }
    }
    else
    {
      v10 = [ICTTAudioDocument alloc];
      v11 = [(ICAttachmentModel *)self attachment];
      v12 = [v11 currentReplicaID];
      uint64_t v13 = [(ICTTAudioDocument *)v10 initWithReplicaID:v12 compatibleDocument:0];
      v14 = *p_audioDocument;
      *p_audioDocument = (ICTTAudioDocument *)v13;
    }
    objc_super v4 = *p_audioDocument;
  }
  return v4;
}

- (void)attachmentWillTurnIntoFault
{
  if (![(ICAttachmentModel *)self isMergeableDataDirty])
  {
    audioDocument = self->_audioDocument;
    self->_audioDocument = 0;
  }
}

- (void)attachmentWillRefresh:(BOOL)a3
{
  if (![(ICAttachmentModel *)self isMergeableDataDirty])
  {
    audioDocument = self->_audioDocument;
    self->_audioDocument = 0;
  }
}

- (void)attachmentDidRefresh:(BOOL)a3
{
  if (self->_audioDocument)
  {
    if ([(ICAttachmentModel *)self isMergeableDataDirty])
    {
      objc_super v4 = [(ICAttachmentModel *)self attachment];
      v5 = [v4 mergeableData];

      if (v5)
      {
        id v7 = [(ICAttachmentModel *)self attachment];
        v6 = [v7 mergeableData];
        [(ICAttachmentModel *)self mergeWithMergeableData:v6];
      }
    }
  }
}

- (NSArray)composedAudioAssetURLs
{
  char v3 = [(ICAttachmentAudioModel *)self audioDocument];
  objc_super v4 = [v3 orderedFragmentUUIDs];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__ICAttachmentAudioModel_composedAudioAssetURLs__block_invoke;
  v11[3] = &unk_1E64A9700;
  v11[4] = self;
  v5 = objc_msgSend(v4, "ic_compactMap:", v11);
  uint64_t v6 = [v5 count];
  if (v6 != [v4 count])
  {
    id v7 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentAudioModel composedAudioAssetURLs](self);
    }
  }
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v9 = v8;

  return v9;
}

id __48__ICAttachmentAudioModel_composedAudioAssetURLs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) attachment];
  v5 = [v4 subAttachments];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__ICAttachmentAudioModel_composedAudioAssetURLs__block_invoke_2;
  v13[3] = &unk_1E64A96D8;
  id v6 = v3;
  id v14 = v6;
  id v7 = objc_msgSend(v5, "ic_objectPassingTest:", v13);

  v8 = [v7 media];
  if (![v8 isValid])
  {
    v11 = 0;
    goto LABEL_5;
  }
  v9 = [v7 typeUTI];
  BOOL v10 = +[ICAttachment typeUTIIsPlayableAudio:v9];

  if (v10)
  {
    v8 = [v7 media];
    v11 = [v8 mediaURL];
LABEL_5:

    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

uint64_t __48__ICAttachmentAudioModel_composedAudioAssetURLs__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  objc_super v4 = [*(id *)(a1 + 32) UUIDString];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)asset
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__57;
  v15 = __Block_byref_object_dispose__57;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__ICAttachmentAudioModel_asset__block_invoke;
  v8[3] = &unk_1E64A9728;
  BOOL v10 = &v11;
  objc_super v4 = v3;
  v9 = v4;
  [(ICAttachmentAudioModel *)self assetWithCompletion:v8];
  dispatch_time_t v5 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v4, v5);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __31__ICAttachmentAudioModel_asset__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)assetWithCompletion:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v4 = [(ICAttachmentModel *)self attachment];
  dispatch_time_t v5 = [v4 subAttachments];
  BOOL v6 = [v5 count] == 0;

  id v7 = [(ICAttachmentModel *)self attachment];
  v8 = v7;
  if (v6)
  {
    v18 = [v7 media];
    int v19 = [v18 isValid];

    if (v19
      && ([(ICAttachmentModel *)self attachment],
          v20 = objc_claimAutoreleasedReturnValue(),
          [v20 typeUTI],
          v21 = objc_claimAutoreleasedReturnValue(),
          BOOL v22 = +[ICAttachment typeUTIIsPlayableAudio:v21],
          v21,
          v20,
          v22))
    {
      v23 = (void *)MEMORY[0x1E4F166C8];
      v24 = [(ICAttachmentModel *)self attachment];
      v25 = [v24 media];
      v26 = [v25 mediaURL];
      v27 = objc_msgSend(v23, "ic_safeURLAssetWithURL:", v26);

      v28 = v43;
      if (v43) {
        (*((void (**)(id, void *))v43 + 2))(v43, v27);
      }
    }
    else
    {
      v28 = v43;
      if (v43) {
        (*((void (**)(id, void))v43 + 2))(v43, 0);
      }
    }
  }
  else
  {
    v9 = [v7 shortLoggingDescription];

    BOOL v10 = [(ICAttachmentAudioModel *)self composedAudioAssetURLs];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke;
    v58[3] = &unk_1E64A9750;
    id v46 = v9;
    id v59 = v46;
    v44 = objc_msgSend(v10, "ic_compactMap:", v58);

    if ([v44 count])
    {
      uint64_t v11 = [v44 count];
      v12 = [(ICAttachmentModel *)self attachment];
      uint64_t v13 = [v12 subAttachments];
      BOOL v14 = v11 == [v13 count];

      if (!v14)
      {
        v15 = os_log_create("com.apple.notes", "AudioTranscription");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = [v44 count];
          v40 = [(ICAttachmentModel *)self attachment];
          v41 = [v40 subAttachments];
          uint64_t v42 = [v41 count];
          *(_DWORD *)buf = 134218498;
          *(void *)&buf[4] = v39;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v42;
          *(_WORD *)&buf[22] = 2112;
          v62 = (uint64_t (*)(uint64_t, uint64_t))v46;
          _os_log_error_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_ERROR, "Warning: ICAttachmentAudioModelCompositionInfo count %ld does not match subattachment count %ld - {attachment: %@}", buf, 0x20u);
        }
      }
      if ([v44 count] == 1)
      {
        if (v43)
        {
          id v16 = [v44 firstObject];
          v17 = [v16 asset];
          (*((void (**)(id, void *))v43 + 2))(v43, v17);
        }
      }
      else
      {
        v30 = os_log_create("com.apple.notes", "AudioTranscription");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[ICAttachmentAudioModel assetWithCompletion:]((uint64_t)v46);
        }

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v62 = __Block_byref_object_copy__57;
        v63 = __Block_byref_object_dispose__57;
        dispatch_group_t v64 = dispatch_group_create();
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id obj = v44;
        uint64_t v31 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v55;
          uint64_t v33 = *MEMORY[0x1E4F15BA8];
          do
          {
            uint64_t v34 = 0;
            do
            {
              if (*(void *)v55 != v32) {
                objc_enumerationMutation(obj);
              }
              v35 = *(void **)(*((void *)&v54 + 1) + 8 * v34);
              dispatch_group_enter(*(dispatch_group_t *)(*(void *)&buf[8] + 40));
              v36 = [v35 asset];
              v51[0] = MEMORY[0x1E4F143A8];
              v51[1] = 3221225472;
              v51[2] = __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_57;
              v51[3] = &unk_1E64A9778;
              v51[4] = v35;
              id v52 = v46;
              v53 = buf;
              [v36 loadTracksWithMediaType:v33 completionHandler:v51];

              ++v34;
            }
            while (v31 != v34);
            uint64_t v31 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
          }
          while (v31);
        }

        v37 = *(NSObject **)(*(void *)&buf[8] + 40);
        v38 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_59;
        block[3] = &unk_1E64A4578;
        id v48 = v46;
        id v49 = obj;
        id v50 = v43;
        dispatch_group_notify(v37, v38, block);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      v29 = os_log_create("com.apple.notes", "AudioTranscription");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ICAttachmentAudioModel assetWithCompletion:]((uint64_t)v46, v29);
      }

      if (v43) {
        (*((void (**)(id, void))v43 + 2))(v43, 0);
      }
    }

    v28 = v43;
  }
}

ICAttachmentAudioModelCompositionInfo *__46__ICAttachmentAudioModel_assetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "ic_isReachable"))
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F166C8], "ic_safeURLAssetWithURL:", v3);
    if (v4)
    {
      dispatch_time_t v5 = [[ICAttachmentAudioModelCompositionInfo alloc] initWithURL:v3 asset:v4];
      goto LABEL_10;
    }
    BOOL v6 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_cold_1(a1);
    }
  }
  else
  {
    id v4 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_cold_2(a1);
    }
  }
  dispatch_time_t v5 = 0;
LABEL_10:

  return v5;
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    id v7 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_57_cold_1(a1);
    }
  }
  else
  {
    id v7 = [v5 firstObject];
    [*(id *)(a1 + 32) setTrack:v7];
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_59(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.notes", "AudioTranscription");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_59_cold_1(a1, v2);
  }

  id v3 = objc_alloc_init(MEMORY[0x1E4F16590]);
  CMTime v37 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  id v26 = v3;
  id v4 = [v3 addMutableTrackWithMediaType:*MEMORY[0x1E4F15BA8] preferredTrackID:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v27 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        BOOL v10 = os_log_create("com.apple.notes", "AudioTranscription");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          CMTimeValue v17 = *(void *)(v27 + 32);
          v18 = [v9 url];
          LODWORD(buf.value) = 138412546;
          *(CMTimeValue *)((char *)&buf.value + 4) = v17;
          LOWORD(buf.flags) = 2112;
          *(void *)((char *)&buf.flags + 2) = v18;
          _os_log_debug_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_DEBUG, "Splicing audio track into composition {attachment: %@, url: %@}", (uint8_t *)&buf, 0x16u);
        }
        uint64_t v11 = [v9 track];
        v12 = v11;
        if (v11) {
          [v11 timeRange];
        }
        else {
          memset(v32, 0, sizeof(v32));
        }
        uint64_t v13 = [v9 track];
        id v31 = 0;
        CMTime buf = v37;
        int v14 = [v4 insertTimeRange:v32 ofTrack:v13 atTime:&buf error:&v31];
        id v15 = v31;

        if (v14)
        {
          if (v4) {
            [v4 timeRange];
          }
          else {
            memset(&range, 0, sizeof(range));
          }
          CMTimeRangeGetEnd(&v37, &range);
        }
        else
        {
          id v16 = os_log_create("com.apple.notes", "AudioTranscription");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            CMTimeValue v19 = *(void *)(v27 + 32);
            v20 = [v9 url];
            LODWORD(buf.value) = 138412802;
            *(CMTimeValue *)((char *)&buf.value + 4) = v19;
            LOWORD(buf.flags) = 2112;
            *(void *)((char *)&buf.flags + 2) = v20;
            HIWORD(buf.epoch) = 2112;
            id v39 = v15;
            _os_log_error_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_ERROR, "Failed to splice audio track into composition {attachment: %@, url: %@, error: %@}", (uint8_t *)&buf, 0x20u);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v6);
  }

  v21 = os_log_create("com.apple.notes", "AudioTranscription");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    CMTimeValue v24 = *(void *)(v27 + 32);
    if (v26) {
      [v26 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);
    LODWORD(buf.value) = 138412546;
    *(CMTimeValue *)((char *)&buf.value + 4) = v24;
    LOWORD(buf.flags) = 2048;
    *(void *)((char *)&buf.flags + 2) = (unint64_t)Seconds;
    _os_log_debug_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_DEBUG, "Finished composition {attachment: %@, duration: %lu}", (uint8_t *)&buf, 0x16u);
  }

  uint64_t v22 = *(void *)(v27 + 48);
  if (v22)
  {
    v23 = (void *)[v26 copy];
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);
  }
}

- (void)writeMergeableData
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 attachment];
  id v4 = objc_msgSend(v3, "ic_loggingIdentifier");
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Wrote mergeable data {attachment: %@}", (uint8_t *)&v5, 0xCu);
}

- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(ICAttachmentAudioModel *)self audioDocument];
  uint64_t v7 = [(ICAttachmentModel *)self currentReplicaID];
  uint64_t v8 = [v6 mergeWithMergeableData:v5 replicaID:v7];

  if (v8 == 2)
  {
    v9 = os_log_create("com.apple.notes", "AudioTranscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentAudioModel mergeWithMergeableData:mergeableFieldState:](self, v9);
    }

    [(ICAttachmentModel *)self setMergeableDataDirty:1];
  }
  return v8 == 2;
}

- (void)updateAfterLoadWithSubAttachmentIdentifierMap:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentAudioModel *)self audioDocument];
  [v5 updateAfterLoadWithSubAttachmentIdentifierMap:v4];

  [(ICAttachmentModel *)self setMergeableDataDirty:1];
  id v6 = [(ICAttachmentModel *)self attachment];
  [v6 saveMergeableDataIfNeeded];
}

- (void)updateFileBasedAttributes
{
  v11.receiver = self;
  v11.super_class = (Class)ICAttachmentAudioModel;
  [(ICAttachmentModel *)&v11 updateFileBasedAttributes];
  id v3 = [(ICAttachmentModel *)self attachment];
  id v4 = [v3 managedObjectContext];

  id v5 = [(ICAttachmentModel *)self attachment];
  id v6 = [v5 attachmentModel];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ICAttachmentAudioModel_updateFileBasedAttributes__block_invoke;
  v8[3] = &unk_1E64A97A0;
  id v9 = v4;
  BOOL v10 = self;
  id v7 = v4;
  [v6 assetWithCompletion:v8];
}

void __51__ICAttachmentAudioModel_updateFileBasedAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ICAttachmentAudioModel_updateFileBasedAttributes__block_invoke_2;
  v7[3] = &unk_1E64A4218;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 performBlock:v7];
}

void __51__ICAttachmentAudioModel_updateFileBasedAttributes__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) attachment];
    [v2 duration];
    double v4 = v3;
    id v5 = *(void **)(a1 + 32);
    if (v5) {
      [v5 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double v6 = vabdd_f64(v4, CMTimeGetSeconds(&time));

    if (v6 < 0.01)
    {
      id v7 = *(void **)(a1 + 32);
      if (v7) {
        [v7 duration];
      }
      else {
        memset(&v11, 0, sizeof(v11));
      }
      double Seconds = CMTimeGetSeconds(&v11);
      uint64_t v9 = [*(id *)(a1 + 40) attachment];
      [v9 setDuration:Seconds];

      BOOL v10 = [*(id *)(a1 + 40) attachment];
      [v10 updateChangeCountWithReason:@"Updated duration from audio asset"];
    }
  }
}

- (BOOL)providesStandaloneTitleForNote
{
  return 1;
}

- (id)standaloneTitleForNote
{
  double v3 = [(ICAttachmentModel *)self attachment];
  double v4 = [v3 userTitle];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(ICAttachmentModel *)self attachment];
    id v6 = [v7 title];
  }
  return v6;
}

- (BOOL)hidesSubAttachmentsInAttachmentBrowser
{
  return 1;
}

- (BOOL)recordedInNotes
{
  return self->_recordedInNotes;
}

- (void)setRecordedInNotes:(BOOL)a3
{
  self->_recordedInNotes = a3;
}

- (void)setAudioDocument:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)needsTranscription
{
  v2 = self;
  char v3 = ICAttachmentAudioModel.needsTranscription.getter();

  return v3 & 1;
}

- (void)transformNewlyAddedMediaAttachment
{
  v2 = self;
  ICAttachmentAudioModel.transformNewlyAddedMediaAttachment()();
}

- (id)createSubattachmentForRecordingAndReturnError:(id *)a3
{
  double v4 = self;
  ICAttachmentAudioModel.createSubattachmentForRecording()(v5);
  id v8 = v7;

  if (v6)
  {
    if (a3)
    {
      uint64_t v9 = (void *)sub_1C3DB8788();

      id v10 = v9;
      id v8 = 0;
      *a3 = v9;
    }
    else
    {

      id v8 = 0;
    }
  }
  return v8;
}

- (BOOL)deleteSummaryAndReturnError:(id *)a3
{
  return sub_1C3C2EB98(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ICAttachmentAudioModel.deleteSummary());
}

- (BOOL)saveAttachmentAndReturnError:(id *)a3
{
  return sub_1C3C2EB98(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ICAttachmentAudioModel.saveAttachment());
}

- (id)bitFlippeddUUIDWithUuid:(id)a3
{
  uint64_t v4 = sub_1C3DB8B98();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  id v10 = (char *)&v15 - v9;
  sub_1C3DB8B58();
  CMTime v11 = self;
  sub_1C3DB8B78();
  sub_1C3DB8B68();

  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  uint64_t v13 = (void *)sub_1C3DB8B38();
  v12(v10, v4);
  return v13;
}

- (void)audioDocument
{
  v1 = [a1 attachment];
  uint64_t v7 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_1_10();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);
}

- (void)composedAudioAssetURLs
{
  v1 = [a1 attachment];
  uint64_t v7 = objc_msgSend(v1, "ic_loggingDescription");
  OUTLINED_FUNCTION_1_10();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

- (void)assetWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Failed to collect any ICAttachmentAudioModelCompositionInfo {attachment: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)assetWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_DEBUG, "Composing AVAudioAsset {attachment: %@, infos: %@}", (uint8_t *)&v2, 0x16u);
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v1, v2, "Failed to create AVURLAsset {attachment: %@, url: %@}", (void)v3, DWORD2(v3));
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v1, v2, "Audio file is not reachable {attachment: %@, url: %@}", (void)v3, DWORD2(v3));
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_57_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) url];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_10();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x20u);
}

void __46__ICAttachmentAudioModel_assetWithCompletion___block_invoke_59_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Finished loading audio tracks {attachment: %@}", (uint8_t *)&v3, 0xCu);
}

- (void)mergeWithMergeableData:(void *)a1 mergeableFieldState:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 attachment];
  uint64_t v5 = objc_msgSend(v4, "ic_loggingIdentifier");
  uint64_t v6 = [a1 audioDocument];
  uint64_t v7 = [v6 orderedFragmentUUIDs];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Audio model updated from merge {attachment: %@, fragments: %@}", v8, 0x16u);
}

@end