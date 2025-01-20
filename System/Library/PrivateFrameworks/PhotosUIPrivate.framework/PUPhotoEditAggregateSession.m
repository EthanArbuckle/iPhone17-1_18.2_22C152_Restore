@interface PUPhotoEditAggregateSession
- (BOOL)_autoCropAdjusted;
- (BOOL)_autoCropReset;
- (BOOL)_hasCropSuggestion;
- (BOOL)_hasPerspectiveCropSuggestion;
- (BOOL)pluginSaved;
- (BOOL)pluginStarted;
- (BOOL)shouldUseVideoKeys;
- (BOOL)toggledOriginal;
- (NSArray)_autoCropKeys;
- (NSString)pluginIdentifier;
- (__CFString)_keyForSessionEnd:(int64_t)a3;
- (double)originalDuration;
- (id)_sessionKeysWithEnd:(int64_t)a3;
- (id)finishSessionWithEnd:(int64_t)a3 newCompositionController:(id)a4 oldCompositionController:(id)a5;
- (void)_recordKeys:(id)a3;
- (void)_setAutoCropAdjusted:(BOOL)a3;
- (void)_setAutoCropReset:(BOOL)a3;
- (void)_setHasCropSuggestion:(BOOL)a3;
- (void)_setHasPerspectiveCropSuggestion:(BOOL)a3;
- (void)finishSessionWithEnd:(int64_t)a3;
- (void)notifyDidAdjustCrop;
- (void)notifyDidApplyAutoCrop;
- (void)notifyDidApplyPerspectiveAutoCrop;
- (void)notifyDidResetCrop;
- (void)setOriginalDuration:(double)a3;
- (void)setPluginIdentifier:(id)a3;
- (void)setPluginSaved:(BOOL)a3;
- (void)setPluginStarted:(BOOL)a3;
- (void)setShouldUseVideoKeys:(BOOL)a3;
- (void)setToggledOriginal:(BOOL)a3;
@end

@implementation PUPhotoEditAggregateSession

- (void).cxx_destruct
{
}

- (void)_setAutoCropReset:(BOOL)a3
{
  self->__autoCropReset = a3;
}

- (BOOL)_autoCropReset
{
  return self->__autoCropReset;
}

- (void)_setAutoCropAdjusted:(BOOL)a3
{
  self->__autoCropAdjusted = a3;
}

- (BOOL)_autoCropAdjusted
{
  return self->__autoCropAdjusted;
}

- (void)_setHasPerspectiveCropSuggestion:(BOOL)a3
{
  self->__hasPerspectiveCropSuggestion = a3;
}

- (BOOL)_hasPerspectiveCropSuggestion
{
  return self->__hasPerspectiveCropSuggestion;
}

- (void)_setHasCropSuggestion:(BOOL)a3
{
  self->__hasCropSuggestion = a3;
}

- (BOOL)_hasCropSuggestion
{
  return self->__hasCropSuggestion;
}

- (void)setOriginalDuration:(double)a3
{
  self->_originalDuration = a3;
}

- (double)originalDuration
{
  return self->_originalDuration;
}

- (void)setShouldUseVideoKeys:(BOOL)a3
{
  self->_shouldUseVideoKeys = a3;
}

- (BOOL)shouldUseVideoKeys
{
  return self->_shouldUseVideoKeys;
}

- (void)setPluginIdentifier:(id)a3
{
}

- (NSString)pluginIdentifier
{
  return self->_pluginIdentifier;
}

- (void)setPluginSaved:(BOOL)a3
{
  self->_pluginSaved = a3;
}

- (BOOL)pluginSaved
{
  return self->_pluginSaved;
}

- (void)setPluginStarted:(BOOL)a3
{
  self->_pluginStarted = a3;
}

- (BOOL)pluginStarted
{
  return self->_pluginStarted;
}

- (void)setToggledOriginal:(BOOL)a3
{
  self->_toggledOriginal = a3;
}

- (BOOL)toggledOriginal
{
  return self->_toggledOriginal;
}

- (void)finishSessionWithEnd:(int64_t)a3
{
  id v3 = [(PUPhotoEditAggregateSession *)self finishSessionWithEnd:a3 newCompositionController:0 oldCompositionController:0];
}

- (id)finishSessionWithEnd:(int64_t)a3 newCompositionController:(id)a4 oldCompositionController:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(PUPhotoEditAggregateSession *)self _sessionKeysWithEnd:a3];
  v11 = (void *)[v10 mutableCopy];
  if (v8 && v9)
  {
    v12 = [MEMORY[0x1E4F8A748] compositionController:v8 aggregateKeysForPreviousComposition:v9];
    [v11 addObjectsFromArray:v12];
    if (!a3)
    {
      v13 = [v9 composition];
      v29[0] = *MEMORY[0x1E4F8A5A0];
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      char v15 = [v8 isEqual:v13 forKeys:v14 visualChangesOnly:0];

      if ((v15 & 1) == 0)
      {
        v16 = [v8 trimAdjustmentController];

        if (v16)
        {
          v17 = [v8 trimAdjustmentController];
          v18 = v17;
          if (v17) {
            [v17 endTime];
          }
          else {
            memset(&time, 0, sizeof(time));
          }
          CMTimeGetSeconds(&time);
          v19 = [v8 trimAdjustmentController];
          v20 = v19;
          if (v19) {
            [v19 startTime];
          }
          else {
            memset(&v26, 0, sizeof(v26));
          }
          CMTimeGetSeconds(&v26);

          [(PUPhotoEditAggregateSession *)self originalDuration];
          objc_msgSend(v11, "pu_addCFString:", PLSAggregateDictionaryKeyForVideoEditOriginalTrimDuration());
          objc_msgSend(v11, "pu_addCFString:", PLSAggregateDictionaryKeyForVideoEditFinalTrimDuration());
        }
      }
      v21 = [v9 composition];
      uint64_t v28 = *MEMORY[0x1E4F8A580];
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      char v23 = [v8 isEqual:v21 forKeys:v22 visualChangesOnly:0];

      if ((v23 & 1) == 0)
      {
        v24 = [v8 slomoAdjustmentController];

        if (v24) {
          objc_msgSend(v11, "pu_addCFString:", *MEMORY[0x1E4F8B420]);
        }
      }
    }
  }
  [(PUPhotoEditAggregateSession *)self _recordKeys:v11];

  return v11;
}

- (void)_recordKeys:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    uint64_t v7 = MEMORY[0x1E4F1CC08];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [MEMORY[0x1E4F56658] sendEvent:*(void *)(*((void *)&v9 + 1) + 8 * v8++) withPayload:v7];
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_sessionKeysWithEnd:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v5, "pu_addCFString:", *MEMORY[0x1E4F8B3D8]);
  objc_msgSend(v5, "pu_addCFString:", -[PUPhotoEditAggregateSession _keyForSessionEnd:](self, "_keyForSessionEnd:", a3));
  if (!a3)
  {
    uint64_t v6 = [(PUPhotoEditAggregateSession *)self _autoCropKeys];
    [v5 addObjectsFromArray:v6];
  }
  if ([(PUPhotoEditAggregateSession *)self toggledOriginal]) {
    objc_msgSend(v5, "pu_addCFString:", *MEMORY[0x1E4F8B3F0]);
  }
  if ([(PUPhotoEditAggregateSession *)self pluginStarted])
  {
    BOOL v7 = [(PUPhotoEditAggregateSession *)self shouldUseVideoKeys];
    uint64_t v8 = (void *)MEMORY[0x1E4F8B410];
    if (!v7) {
      uint64_t v8 = (void *)MEMORY[0x1E4F8B378];
    }
    objc_msgSend(v5, "pu_addCFString:", *v8);
  }
  if ([(PUPhotoEditAggregateSession *)self pluginSaved])
  {
    BOOL v9 = [(PUPhotoEditAggregateSession *)self shouldUseVideoKeys];
    long long v10 = (void *)MEMORY[0x1E4F8B408];
    if (!v9) {
      long long v10 = (void *)MEMORY[0x1E4F8B370];
    }
    objc_msgSend(v5, "pu_addCFString:", *v10);
  }
  return v5;
}

- (NSArray)_autoCropKeys
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if ([(PUPhotoEditAggregateSession *)self _hasCropSuggestion]) {
    objc_msgSend(v3, "pu_addCFString:", *MEMORY[0x1E4F8B2F0]);
  }
  if ([(PUPhotoEditAggregateSession *)self _hasPerspectiveCropSuggestion]) {
    objc_msgSend(v3, "pu_addCFString:", *MEMORY[0x1E4F8B2E0]);
  }
  if ([(PUPhotoEditAggregateSession *)self _autoCropAdjusted])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F8B2D8];
  }
  else
  {
    if (![(PUPhotoEditAggregateSession *)self _autoCropReset]) {
      goto LABEL_10;
    }
    uint64_t v4 = (void *)MEMORY[0x1E4F8B2E8];
  }
  objc_msgSend(v3, "pu_addCFString:", *v4);
LABEL_10:
  return (NSArray *)v3;
}

- (void)notifyDidAdjustCrop
{
  if ([(PUPhotoEditAggregateSession *)self _hasCropSuggestion]
    && ![(PUPhotoEditAggregateSession *)self _autoCropReset])
  {
    [(PUPhotoEditAggregateSession *)self _setAutoCropAdjusted:1];
  }
}

- (void)notifyDidResetCrop
{
  if ([(PUPhotoEditAggregateSession *)self _hasCropSuggestion])
  {
    [(PUPhotoEditAggregateSession *)self _setAutoCropReset:1];
    [(PUPhotoEditAggregateSession *)self _setAutoCropAdjusted:0];
  }
}

- (void)notifyDidApplyPerspectiveAutoCrop
{
}

- (void)notifyDidApplyAutoCrop
{
  [(PUPhotoEditAggregateSession *)self _setHasCropSuggestion:1];
  [(PUPhotoEditAggregateSession *)self _setAutoCropAdjusted:0];
  [(PUPhotoEditAggregateSession *)self _setAutoCropReset:0];
}

- (__CFString)_keyForSessionEnd:(int64_t)a3
{
  result = 0;
  switch(a3)
  {
    case 0:
      uint64_t v5 = (__CFString **)MEMORY[0x1E4F8B3A0];
      goto LABEL_9;
    case 1:
      BOOL v6 = [(PUPhotoEditAggregateSession *)self shouldUseVideoKeys];
      uint64_t v5 = (__CFString **)MEMORY[0x1E4F8B418];
      if (!v6) {
        uint64_t v5 = (__CFString **)MEMORY[0x1E4F8B388];
      }
      goto LABEL_9;
    case 3:
      uint64_t v5 = (__CFString **)MEMORY[0x1E4F8B330];
      goto LABEL_9;
    case 4:
      uint64_t v5 = (__CFString **)MEMORY[0x1E4F8B338];
      goto LABEL_9;
    case 5:
      uint64_t v5 = (__CFString **)MEMORY[0x1E4F8B318];
LABEL_9:
      result = *v5;
      break;
    default:
      return result;
  }
  return result;
}

@end