@interface FrameSelectionPlist
- (int)_setModelWeights:(id)a3 weights:(id *)a4;
- (int)readPlist:(id)a3;
- (void)applyOverrides;
@end

@implementation FrameSelectionPlist

- (int)_setModelWeights:(id)a3 weights:(id *)a4
{
  id v5 = a3;
  a4->var0 = 0.0;
  a4->var1 = 0.0;
  a4->var3 = 0.0;
  a4->var4 = 0.0;
  v6 = [v5 objectForKeyedSubscript:@"CornerWeight"];

  if (v6
    && ([v5 objectForKeyedSubscript:@"FocusWeight"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7)
    && ([v5 objectForKeyedSubscript:@"GyroWeight"],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __48__FrameSelectionPlist__setModelWeights_weights___block_invoke;
    v11[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v11[4] = a4;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];
    int v9 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
  }

  return v9;
}

void __48__FrameSelectionPlist__setModelWeights_weights___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  *a4 = 0;
  if ([v13 isEqualToString:@"Bias"])
  {
    [v7 doubleValue];
    **(void **)(a1 + 32) = v8;
  }
  else if ([v13 isEqualToString:@"CornerWeight"])
  {
    [v7 doubleValue];
    *(void *)(*(void *)(a1 + 32) + 16) = v9;
  }
  else if ([v13 isEqualToString:@"FocusWeight"])
  {
    [v7 doubleValue];
    *(void *)(*(void *)(a1 + 32) + 24) = v10;
  }
  else if ([v13 isEqualToString:@"MotionWeight"])
  {
    [v7 doubleValue];
    *(void *)(*(void *)(a1 + 32) + 32) = v11;
  }
  else if ([v13 isEqualToString:@"GyroWeight"])
  {
    [v7 doubleValue];
    *(void *)(*(void *)(a1 + 32) + 8) = v12;
  }
}

- (int)readPlist:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v32 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
      if ([v9 isEqualToString:@"ReferenceFrameSelection"])
      {
        uint64_t v10 = [v4 objectForKeyedSubscript:@"ReferenceFrameSelection"];
        self->enableReferenceSelectionWithCombinedWeight = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableReferenceSelectionWithCombinedWeight", 0, 0);
        self->enableReferenceSelectionWithFaceFocusScore = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableReferenceSelectionWithFaceFocusScore", 0, 0);
        LODWORD(v11) = 1028443341;
        objc_msgSend(v10, "cmi_floatValueForKey:defaultValue:found:", @"GlobalSharpnessEquivalencePercentage", 0, v11);
        self->globalSharpnessEquivalencePercentage = v12;
        LODWORD(v13) = 1008981770;
        objc_msgSend(v10, "cmi_floatValueForKey:defaultValue:found:", @"FaceSharpnessEquivalencePercentage", 0, v13);
        self->faceSharpnessEquivalencePercentage = v14;
        self->referenceFrameCandidatesCount = objc_msgSend(v10, "cmi_intValueForKey:defaultValue:found:", @"ReferenceFrameCandidatesCount", 6, 0);
        self->maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = objc_msgSend(v10, "cmi_intValueForKey:defaultValue:found:", @"MaximumNumberOfReferenceFrameCandidatesToHoldForProcessing", 5, 0);
        v15 = [v10 objectForKeyedSubscript:@"ReferenceSelectionRegressionWeightShortFrame"];
        int v16 = [(FrameSelectionPlist *)self _setModelWeights:v15 weights:&self->referenceSelectionRegressionWeightShortFrame];

        if (v16) {
          goto LABEL_21;
        }
        v17 = [v10 objectForKeyedSubscript:@"ReferenceSelectionRegressionWeightLongFrame"];
        int v18 = [(FrameSelectionPlist *)self _setModelWeights:v17 weights:&self->referenceSelectionRegressionWeightLongFrame];

        if (v18) {
          goto LABEL_21;
        }
      }
      else
      {
        if (![v9 isEqualToString:@"BlurryFrameRejection"])
        {
          if (![v9 isEqualToString:@"BlinkDetection"]) {
            break;
          }
          v25 = (BlinkDetectionPlist *)objc_opt_new();
          blinkDetectionPlist = self->blinkDetectionPlist;
          self->blinkDetectionPlist = v25;

          v27 = self->blinkDetectionPlist;
          v28 = [v4 objectForKeyedSubscript:@"BlinkDetection"];
          LODWORD(v27) = [(BlinkDetectionPlist *)v27 readPlist:v28];

          if (v27)
          {
            FigDebugAssert3();
            int v29 = FigSignalErrorAt();
            goto LABEL_20;
          }
          goto LABEL_17;
        }
        uint64_t v10 = [v4 objectForKeyedSubscript:@"BlurryFrameRejection"];
        self->enableBlurFrameDetection = objc_msgSend(v10, "cmi_BOOLValueForKey:defaultValue:found:", @"EnableBlurFrameDetection", 0, 0);
        v19 = [v10 objectForKeyedSubscript:@"BlurFrameRejectionRegressionWeightShortFrame"];
        int v20 = [(FrameSelectionPlist *)self _setModelWeights:v19 weights:&self->blurFrameRejectionRegressionWeightShortFrame];

        if (v20
          || ([v10 objectForKeyedSubscript:@"BlurFrameRejectionRegressionWeightLongFrame"],
              v21 = objc_claimAutoreleasedReturnValue(),
              int v22 = [(FrameSelectionPlist *)self _setModelWeights:v21 weights:&self->blurFrameRejectionRegressionWeightLongFrame], v21, v22))
        {
LABEL_21:
          FigDebugAssert3();
          int v29 = FigSignalErrorAt();

          goto LABEL_20;
        }
        objc_msgSend(v10, "cmi_floatValueForKey:defaultValue:found:", @"BlurFrameWeightAdjustmentLeftLimit", 0, 0.0);
        self->blurFrameWeightAdjustementLeftLimit = v23;
        objc_msgSend(v10, "cmi_floatValueForKey:defaultValue:found:", @"BlurFrameWeightAdjustmentRightLimit", 0, 0.0);
        self->blurFrameWeightAdjustementRightLimit = v24;
      }

LABEL_17:
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  int v29 = 0;
LABEL_20:

  return v29;
}

- (void)applyOverrides
{
  blinkDetectionPlist = self->blinkDetectionPlist;
  if (blinkDetectionPlist) {
    [(BlinkDetectionPlist *)blinkDetectionPlist applyOverrides];
  }
}

- (void).cxx_destruct
{
}

@end