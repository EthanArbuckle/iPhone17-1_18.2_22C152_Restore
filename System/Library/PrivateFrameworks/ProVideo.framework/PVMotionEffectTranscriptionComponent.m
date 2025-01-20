@interface PVMotionEffectTranscriptionComponent
+ (id)motionEffectPropertyKeyToPublishedParameterNameMap;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration_NoLock:(SEL)a3;
- (BOOL)disableWordFadeOutForPreview;
- (BOOL)isSingleWordTranscription;
- (BOOL)isTranscription;
- (BOOL)shouldDisableWordFadeOut_NoLock:(const void *)a3;
- (BOOL)transcriptionHitTest:(CGPoint)a3 time:(id *)a4;
- (void)clearTranscription;
- (void)computeLoopMarkerBasedOnTranscription_NoLock:(const void *)a3;
- (void)disableWordFadeOutIfNecessary_NoLock:(const void *)a3;
- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5;
- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5;
- (void)motionEffect:(id)a3 didLoad:(const void *)a4;
- (void)resetToDefaultTranscriptionForLocaleID:(id)a3;
- (void)setTranscriptionText:(id)a3;
- (void)setupTranscriptionParameters_NoLock:(id)a3 documentInfo:(const void *)a4;
@end

@implementation PVMotionEffectTranscriptionComponent

- (void)setupTranscriptionParameters_NoLock:(id)a3 documentInfo:(const void *)a4
{
  id v6 = a3;
  v7 = [(PVMotionEffectComponent *)self motionEffect];
  [v7 assertDocumentIsLocked];

  v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentStatusIsLoadedOrReady];

  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription])
  {
    v9 = +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap];
    v10 = [v6 objectForKeyedSubscript:@"Transcription"];

    if (v10)
    {
      v34.value = 0;
      PCString::set((PCString *)&v34, @"IsRecording");
      uint64_t v11 = *(void *)a4;
      v12 = [(PVMotionEffectComponent *)self motionEffect];
      OZXSetPublishedCheckBox((void *)v11, (PCString *)&v34, [v12 isRecording]);

      PCString::~PCString((PCString *)&v34);
      v13 = [v6 objectForKeyedSubscript:@"Transcription"];
      objc_opt_class();
      LOBYTE(v11) = objc_opt_isKindOfClass();

      if (v11)
      {
        v14 = [v6 objectForKeyedSubscript:@"Transcription"];
        v15 = [v14 objectForKeyedSubscript:@"TranscriptionArray"];

        v16 = [v14 objectForKeyedSubscript:@"TranscriptionFormattedString"];
        memset(&v34, 0, sizeof(v34));
        v17 = [v14 objectForKeyedSubscript:@"TranscriptionTime"];
        v18 = v17;
        if (v17) {
          [v17 CMTimeValue];
        }
        else {
          memset(&v34, 0, sizeof(v34));
        }

        v19 = [v14 objectForKeyedSubscript:@"TranscriptionIsFinal"];
        uint64_t v20 = [v19 BOOLValue];

        OZXSetTranscription(*(void *)a4, v15, v16, &v34, v20);
        if ([(PVMotionEffectTranscriptionComponent *)self isSingleWordTranscription])
        {
          v21 = [v9 objectForKeyedSubscript:@"TranscriptionWordFadeOut"];
          v33.var0 = 0;
          PCString::set(&v33, v21);

          OZXSetPublishedCheckBox(*(void **)a4, &v33, v20);
          PCString::~PCString(&v33);
        }
      }
      PCString::PCString((PCString *)&v34, "TranscriptionLineShift");
      OZXAdjustTranscriptionLineSpacingForCurrentFont(*(void **)a4, (const PCString *)&v34);
      BOOL v32 = 0;
      OZXIsUsingSubstituteFont(*(void *)a4, &v32);
      v33.var0 = 0;
      PCString::set(&v33, @"EnableDynamicLineSpacing");
      OZXSetPublishedCheckBox(*(void **)a4, &v33, v32);
      PCString::~PCString(&v33);
      PCString::~PCString((PCString *)&v34);
    }
    v22 = [v6 objectForKeyedSubscript:@"RenderStartOffset"];
    v23 = v22;
    if (v22)
    {
      memset(&v34, 0, sizeof(v34));
      [v22 CMTimeValue];
      OZXSetTranscriptionMediaOffset(*(void *)a4, &v34);
    }
    [(PVMotionEffectTranscriptionComponent *)self disableWordFadeOutIfNecessary_NoLock:a4];
    v24 = [v6 objectForKeyedSubscript:@"TranscriptionLocale"];

    if (v24)
    {
      v25 = [v6 objectForKeyedSubscript:@"TranscriptionLocale"];
      OZXSetTranscriptionLocale(*(void *)a4, v25);
      uint64_t v26 = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v25];
      v27 = [(PVMotionEffectComponent *)self motionEffect];
      v28 = [v27 textComponent];
      objc_msgSend(v28, "setIsRightToLeft_NoLock:documentInfo:", v26 == 2, a4);
    }
    v29 = [v6 objectForKeyedSubscript:@"LiveTitleFontName"];

    if (v29)
    {
      v30 = [v6 objectForKeyedSubscript:@"LiveTitleFontName"];
      v31 = [v9 objectForKeyedSubscript:@"LiveTitleFontName"];
      v34.value = 0;
      PCString::set((PCString *)&v34, v31);

      OZXSetPublishedTextFont(*(void **)a4, (PCString *)&v34, v30);
      PCString::~PCString((PCString *)&v34);
    }
  }
}

- (BOOL)isTranscription
{
  isTranscription = self->_isTranscription;
  if (!isTranscription)
  {
    v4 = [(PVMotionEffectComponent *)self motionEffect];
    v5 = [v4 contentRegistryPropertyForKey:@"effectType"];

    if (v5)
    {
      objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isEqualToString:", @"LiveTitle"));
      id v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v7 = self->_isTranscription;
      self->_isTranscription = v6;
    }
    else
    {
      v8 = [(PVMotionEffectComponent *)self motionEffect];
      v7 = [v8 effectID];

      if (([v7 isEqualToString:@"6561CB61-577E-403C-A533-81E23A1B9308"] & 1) != 0
        || ([v7 isEqualToString:@"A0F0CBC6-16F5-4973-B45D-7F15B90F17F8"] & 1) != 0
        || ([v7 isEqualToString:@"4D82B147-6A27-42E2-AA56-C7CBA653D5B8"] & 1) != 0
        || ([v7 isEqualToString:@"5645A248-34A3-4654-8CEB-AEE59C6F7BCB"] & 1) != 0
        || ([v7 isEqualToString:@"58D36D1B-D0F8-4709-BD10-4DCF2CEC9FC3"] & 1) != 0
        || ([v7 isEqualToString:@"3485E1D8-0A05-4EAF-859B-8930899EC5A8"] & 1) != 0
        || ([v7 isEqualToString:@"15A33011-A4E4-44E8-9127-1766525161F3"] & 1) != 0
        || ([v7 isEqualToString:@"A6409851-8835-43BC-BC4B-39B8AC431632"] & 1) != 0
        || ([v7 isEqualToString:@"AB4E2A80-1B3B-4492-8E66-F655E123B106"] & 1) != 0
        || ([v7 isEqualToString:@"7CDB9627-80F6-4024-8AE9-C14AE68A42F0"] & 1) != 0
        || ([v7 isEqualToString:@"DCB06633-5C51-422E-9A10-2C63DF1C8054"] & 1) != 0
        || ([v7 isEqualToString:@"F8663D3B-D1D6-4DEC-BA5B-016CFD5D1E41"] & 1) != 0
        || ([v7 isEqualToString:@"7C600E39-6465-4495-8AA4-66935176CAA2"] & 1) != 0
        || ([v7 isEqualToString:@"CA33687A-1B4E-4519-8CB1-69A4E2E8D74A"] & 1) != 0
        || ([v7 isEqualToString:@"ED3EDF36-B5A1-42B4-9CAB-78CDB10494CD"] & 1) != 0
        || ([v7 isEqualToString:@"D2542CC4-A256-493C-9546-81E17145A4A1"] & 1) != 0)
      {
        uint64_t v9 = 1;
      }
      else
      {
        uint64_t v9 = [v7 isEqualToString:@"A4C8F76A-3336-4296-9C54-CA3ACC13ED61"];
      }
      v10 = [NSNumber numberWithBool:v9];
      uint64_t v11 = self->_isTranscription;
      self->_isTranscription = v10;
    }
    isTranscription = self->_isTranscription;
  }

  return [(NSNumber *)isTranscription BOOLValue];
}

- (BOOL)isSingleWordTranscription
{
  isSingleWordTranscription = self->_isSingleWordTranscription;
  if (!isSingleWordTranscription)
  {
    v4 = [(PVMotionEffectComponent *)self motionEffect];
    v5 = [v4 contentRegistryPropertyForKey:@"isSingleWordTranscription"];

    if (v5)
    {
      id v6 = v5;
      v7 = self->_isSingleWordTranscription;
      self->_isSingleWordTranscription = v6;
    }
    else
    {
      v8 = [(PVMotionEffectComponent *)self motionEffect];
      v7 = [v8 effectID];

      if ([v7 isEqualToString:@"4D82B147-6A27-42E2-AA56-C7CBA653D5B8"]) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = [v7 isEqualToString:@"5645A248-34A3-4654-8CEB-AEE59C6F7BCB"];
      }
      v10 = [NSNumber numberWithBool:v9];
      uint64_t v11 = self->_isSingleWordTranscription;
      self->_isSingleWordTranscription = v10;
    }
    isSingleWordTranscription = self->_isSingleWordTranscription;
  }

  return [(NSNumber *)isSingleWordTranscription BOOLValue];
}

- (BOOL)disableWordFadeOutForPreview
{
  disableWordFadeOutForPreview = self->_disableWordFadeOutForPreview;
  if (!disableWordFadeOutForPreview)
  {
    v4 = [(PVMotionEffectComponent *)self motionEffect];
    v5 = [v4 contentRegistryPropertyForKey:@"disableWordFadeOutForPreview"];

    if (v5)
    {
      id v6 = v5;
      v7 = self->_disableWordFadeOutForPreview;
      self->_disableWordFadeOutForPreview = v6;
    }
    else
    {
      v8 = [(PVMotionEffectComponent *)self motionEffect];
      v7 = [v8 effectID];

      uint64_t v9 = [v7 isEqualToString:@"15A33011-A4E4-44E8-9127-1766525161F3"];
      v10 = [NSNumber numberWithBool:v9];
      uint64_t v11 = self->_disableWordFadeOutForPreview;
      self->_disableWordFadeOutForPreview = v10;
    }
    disableWordFadeOutForPreview = self->_disableWordFadeOutForPreview;
  }

  return [(NSNumber *)disableWordFadeOutForPreview BOOLValue];
}

- (void)clearTranscription
{
  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription])
  {
    id v3 = [(PVMotionEffectComponent *)self motionEffect];
    [v3 runEnsuringDocumentReadyAndLockingDocument:&__block_literal_global_12];
  }
}

uint64_t __58__PVMotionEffectTranscriptionComponent_clearTranscription__block_invoke(uint64_t a1, uint64_t *a2)
{
  return OZXClearTranscription(*a2);
}

- (void)resetToDefaultTranscriptionForLocaleID:(id)a3
{
  id v4 = a3;
  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription])
  {
    v5 = [(PVMotionEffectComponent *)self motionEffect];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = *(void *)"";
    v6[2] = __79__PVMotionEffectTranscriptionComponent_resetToDefaultTranscriptionForLocaleID___block_invoke;
    v6[3] = &unk_1E6169498;
    id v7 = v4;
    v8 = self;
    [v5 runEnsuringDocumentReadyAndLockingDocument:v6];
  }
}

void __79__PVMotionEffectTranscriptionComponent_resetToDefaultTranscriptionForLocaleID___block_invoke(uint64_t a1, uint64_t *a2)
{
  OZXSetTranscriptionLocale(*a2, *(NSString **)(a1 + 32));
  OZXResetToDefaultTranscription(*a2);
  uint64_t v4 = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:*(void *)(a1 + 32)];
  id v6 = [*(id *)(a1 + 40) motionEffect];
  v5 = [v6 textComponent];
  objc_msgSend(v5, "setIsRightToLeft_NoLock:documentInfo:", v4 == 2, a2);
}

- (void)setTranscriptionText:(id)a3
{
  id v4 = a3;
  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription])
  {
    v5 = [(PVMotionEffectComponent *)self motionEffect];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = *(void *)"";
    v6[2] = __61__PVMotionEffectTranscriptionComponent_setTranscriptionText___block_invoke;
    v6[3] = &unk_1E6168D48;
    id v7 = v4;
    [v5 runEnsuringDocumentReadyAndLockingDocument:v6];
  }
}

uint64_t __61__PVMotionEffectTranscriptionComponent_setTranscriptionText___block_invoke(uint64_t a1, uint64_t *a2)
{
  return OZXSetTranscriptionText(*a2, *(NSString **)(a1 + 32));
}

- (BOOL)transcriptionHitTest:(CGPoint)a3 time:(id *)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (![(PVMotionEffectTranscriptionComponent *)self isTranscription]) {
    return 0;
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  int v15 = 11;
  v8 = [(PVMotionEffectComponent *)self motionEffect];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = *(void *)"";
  v11[2] = __66__PVMotionEffectTranscriptionComponent_transcriptionHitTest_time___block_invoke;
  v11[3] = &unk_1E6169D68;
  long long v12 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v11[4] = self;
  v11[5] = v14;
  *(CGFloat *)&v11[7] = x;
  *(CGFloat *)&v11[8] = y;
  v11[6] = &v16;
  [v8 runEnsuringDocumentReadyAndLockingDocument:v11];

  BOOL v9 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __66__PVMotionEffectTranscriptionComponent_transcriptionHitTest_time___block_invoke(uint64_t a1, void **a2)
{
  id v4 = [*(id *)(a1 + 32) motionEffect];
  v5 = [v4 timelineComponent];
  uint64_t v6 = [v5 isForceRenderAtPosterFrameEnabled];

  memset(&v13, 0, sizeof(v13));
  id v7 = [*(id *)(a1 + 32) motionEffect];
  v8 = [v7 timelineComponent];
  BOOL v9 = v8;
  long long v11 = *(_OWORD *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 88);
  if (v8) {
    objc_msgSend(v8, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v11, v6, a2);
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }

  uint64_t result = OZXTranscriptionHitTest(*a2, *(CGPoint *)(a1 + 56), &v13, (BOOL *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)computeLoopMarkerBasedOnTranscription_NoLock:(const void *)a3
{
  v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoaded];

  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription])
  {
    if (OZXSetLoopMarkerFromTranscription(*(void **)a3)) {
      NSLog(&cfstr_SCouldNotSetLo.isa, "-[PVMotionEffectTranscriptionComponent computeLoopMarkerBasedOnTranscription_NoLock:]");
    }
  }
}

- (void)disableWordFadeOutIfNecessary_NoLock:(const void *)a3
{
  v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription])
  {
    id v7 = +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap];
    int v8 = [(PVMotionEffectTranscriptionComponent *)self shouldDisableWordFadeOut_NoLock:a3];
    BOOL v9 = [v7 objectForKeyedSubscript:@"TranscriptionWordFadeOut"];
    v12.var0 = 0;
    PCString::set(&v12, v9);

    OZXDisableElementWithPublishedParam(*(void **)a3, &v12, v8);
    v10 = *(void **)a3;
    long long v11 = [(PVMotionEffectComponent *)self motionEffect];
    OZXTranscriptionSetShouldDisableFadeOut((uint64_t)v10, [v11 shouldDisableFadeOut]);

    PCString::~PCString(&v12);
  }
}

- (BOOL)shouldDisableWordFadeOut_NoLock:(const void *)a3
{
  v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  if (![(PVMotionEffectTranscriptionComponent *)self isTranscription]) {
    return 0;
  }
  id v7 = [(PVMotionEffectComponent *)self motionEffect];
  int v8 = [v7 shouldDisableFadeOut];

  if (!v8) {
    return 0;
  }
  if (![(PVMotionEffectTranscriptionComponent *)self disableWordFadeOutForPreview]) {
    return 1;
  }
  unsigned int v10 = 0;
  OZXTranscriptionGetLineCount(*(void *)a3, &v10);
  return v10 < 3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration
{
  uint64_t v9 = 0;
  unsigned int v10 = &v9;
  uint64_t v11 = 0x4812000000;
  PCString v12 = __Block_byref_object_copy__6;
  CMTime v13 = __Block_byref_object_dispose__6;
  v14 = &unk_1B876C866;
  long long v15 = *MEMORY[0x1E4F1FA48];
  uint64_t v16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription])
  {
    v5 = [(PVMotionEffectComponent *)self motionEffect];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = *(void *)"";
    v8[2] = __61__PVMotionEffectTranscriptionComponent_transcriptionDuration__block_invoke;
    v8[3] = &unk_1E6169758;
    v8[4] = self;
    v8[5] = &v9;
    [v5 runEnsuringDocumentReadyAndLockingDocument:v8];
  }
  uint64_t v6 = v10;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v10 + 3);
  retstr->int64_t var3 = v6[8];
  _Block_object_dispose(&v9, 8);
  return result;
}

double __61__PVMotionEffectTranscriptionComponent_transcriptionDuration__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "transcriptionDuration_NoLock:", a2);
  }
  else
  {
    long long v6 = 0uLL;
    uint64_t v7 = 0;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v6;
  *(_OWORD *)(v4 + 48) = v6;
  *(void *)(v4 + 64) = v7;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration_NoLock:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PVMotionEffectTranscriptionComponent *)self isTranscription];
  if (result)
  {
    uint64_t v7 = *(void *)a4;
    OZXGetTranscriptionDuration(v7, (CMTime *)retstr);
  }
  return result;
}

- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PVMotionEffectTranscriptionComponent;
  [(PVMotionEffectComponent *)&v14 effect:v8 updateProperties:v9 allProperties:v10];
  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription])
  {
    uint64_t v11 = [(PVMotionEffectComponent *)self motionEffect];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = *(void *)"";
    v12[2] = __78__PVMotionEffectTranscriptionComponent_effect_updateProperties_allProperties___block_invoke;
    v12[3] = &unk_1E6169498;
    v12[4] = self;
    id v13 = v9;
    objc_msgSend(v11, "runWithDocument_NoLock:", v12);
  }
}

uint64_t __78__PVMotionEffectTranscriptionComponent_effect_updateProperties_allProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupTranscriptionParameters_NoLock:documentInfo:", *(void *)(a1 + 40), a2);
}

- (void)motionEffect:(id)a3 didLoad:(const void *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVMotionEffectTranscriptionComponent;
  [(PVMotionEffectComponent *)&v13 motionEffect:v6 didLoad:a4];
  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription])
  {
    OZXSetDuration(*(void **)a4, MEMORY[0x1E4F1F9F0]);
    [(PVMotionEffectTranscriptionComponent *)self computeLoopMarkerBasedOnTranscription_NoLock:a4];
    long long v11 = 0uLL;
    uint64_t v12 = 0;
    [(PVMotionEffectTranscriptionComponent *)self transcriptionDuration_NoLock:a4];
    uint64_t v7 = [(PVMotionEffectComponent *)self motionEffect];
    id v8 = [v7 timelineComponent];
    long long v9 = v11;
    uint64_t v10 = v12;
    objc_msgSend(v8, "setLoopTimeOverride_NoLock:", &v9);
  }
}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTranscriptionComponent;
  [(PVMotionEffectComponent *)&v10 motionEffect:v8 didBecomeReady:a4 properties:v9];
  if ([(PVMotionEffectTranscriptionComponent *)self isTranscription]) {
    [(PVMotionEffectTranscriptionComponent *)self setupTranscriptionParameters_NoLock:v9 documentInfo:a4];
  }
}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PVMotionEffectTranscriptionComponent;
  v2 = objc_msgSendSuper2(&v7, sel_motionEffectPropertyKeyToPublishedParameterNameMap);
  id v3 = (void *)[v2 mutableCopy];

  v8[0] = @"TranscriptionWordFadeOut";
  v8[1] = @"LiveTitleFontName";
  v9[0] = @"WordFadeOut";
  v9[1] = @"Font";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  if ([v3 count])
  {
    [v3 addEntriesFromDictionary:v4];
    id v5 = v3;

    uint64_t v4 = v5;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableWordFadeOutForPreview, 0);
  objc_storeStrong((id *)&self->_isSingleWordTranscription, 0);

  objc_storeStrong((id *)&self->_isTranscription, 0);
}

@end