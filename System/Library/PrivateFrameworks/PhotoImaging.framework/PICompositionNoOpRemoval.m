@interface PICompositionNoOpRemoval
+ (id)_noOpRemovalFunctions;
+ (id)copyOfAdjustmentRemovingNoOps:(id)a3 identifier:(id)a4;
+ (id)copyOfCompositionRemovingNoOps:(id)a3;
+ (id)noOpRemovalFunctions;
@end

@implementation PICompositionNoOpRemoval

+ (id)copyOfCompositionRemovingNoOps:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[v4 copy];
  v18 = v4;
  v6 = [v4 schema];
  v7 = [v6 contents];
  v8 = [v7 allKeys];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v15 = [v5 objectForKeyedSubscript:v14];
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = (void *)[a1 copyOfAdjustmentRemovingNoOps:v15 identifier:v14];
            [v5 setObject:v16 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v5;
}

+ (id)copyOfAdjustmentRemovingNoOps:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[PICompositionSerializerConstants mapForSerialization];
  id v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [v9 objectForKeyedSubscript:@"omitIfDisabled"];
  if ([v10 BOOLValue])
  {
    uint64_t v11 = [v6 objectForKeyedSubscript:@"enabled"];
    int v12 = [v11 BOOLValue];

    if (!v12)
    {
      v13 = 0;
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v14 = [a1 noOpRemovalFunctions];
  v15 = [v14 objectForKeyedSubscript:v7];

  if (v15)
  {
    v16 = (void *)[v6 copy];
    v13 = ((void (**)(void, void *))v15)[2](v15, v16);
  }
  else
  {
    v13 = (void *)[v6 copy];
  }

LABEL_9:
  return v13;
}

+ (id)noOpRemovalFunctions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PICompositionNoOpRemoval_noOpRemovalFunctions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (noOpRemovalFunctions_onceToken != -1) {
    dispatch_once(&noOpRemovalFunctions_onceToken, block);
  }
  v2 = (void *)noOpRemovalFunctions_noOpRules;
  return v2;
}

uint64_t __48__PICompositionNoOpRemoval_noOpRemovalFunctions__block_invoke(uint64_t a1)
{
  noOpRemovalFunctions_noOpRules = [*(id *)(a1 + 32) _noOpRemovalFunctions];
  return MEMORY[0x1F41817F8]();
}

+ (id)_noOpRemovalFunctions
{
  v5[36] = *MEMORY[0x1E4F143B8];
  v4[0] = @"apertureRedEye";
  v4[1] = @"autoLoop";
  v5[0] = &__block_literal_global_10106;
  v5[1] = &__block_literal_global_10106;
  v4[2] = @"cinematicAudio";
  v4[3] = @"cropStraighten";
  v5[2] = &__block_literal_global_10106;
  v5[3] = &__block_literal_global_10106;
  v4[4] = @"curves";
  v4[5] = @"definition";
  v5[4] = &__block_literal_global_10106;
  v5[5] = &__block_literal_global_10106;
  v4[6] = @"depthEffect";
  v4[7] = @"effect";
  v5[6] = &__block_literal_global_10106;
  v5[7] = &__block_literal_global_10106;
  v4[8] = @"effect3D";
  v4[9] = @"grain";
  v5[8] = &__block_literal_global_10106;
  v5[9] = &__block_literal_global_10106;
  v4[10] = @"highResFusion";
  v4[11] = @"levels";
  v5[10] = &__block_literal_global_10106;
  v5[11] = &__block_literal_global_10106;
  v4[12] = @"livePhotoKeyFrame";
  v4[13] = @"mute";
  v5[12] = &__block_literal_global_10106;
  v5[13] = &__block_literal_global_10106;
  v4[14] = @"noiseReduction";
  v4[15] = @"orientation";
  v5[14] = &__block_literal_global_10106;
  v5[15] = &__block_literal_global_10106;
  v4[16] = @"portraitEffect";
  v4[17] = @"portraitVideo";
  v5[16] = &__block_literal_global_10106;
  v5[17] = &__block_literal_global_10106;
  v4[18] = @"raw";
  v4[19] = @"rawNoiseReduction";
  v5[18] = &__block_literal_global_10106;
  v5[19] = &__block_literal_global_10106;
  v4[20] = @"redEye";
  v4[21] = @"retouch";
  v5[20] = &__block_literal_global_10106;
  v5[21] = &__block_literal_global_10106;
  v4[22] = @"inpaint";
  v4[23] = @"selectiveColor";
  v5[22] = &__block_literal_global_10106;
  v5[23] = &__block_literal_global_10106;
  v4[24] = @"semanticEnhance";
  v4[25] = @"semanticStyle";
  v5[24] = &__block_literal_global_10106;
  v5[25] = &__block_literal_global_10106;
  v4[26] = @"sharpen";
  v4[27] = @"slomo";
  v5[26] = &__block_literal_global_10106;
  v5[27] = &__block_literal_global_10106;
  v4[28] = @"smartBlackAndWhite";
  v4[29] = @"smartColor";
  v5[28] = &__block_literal_global_10106;
  v5[29] = &__block_literal_global_10106;
  v4[30] = @"smartTone";
  v4[31] = @"trim";
  v5[30] = &__block_literal_global_93;
  v5[31] = &__block_literal_global_10106;
  v4[32] = @"videoPosterFrame";
  v4[33] = @"videoStabilize";
  v5[32] = &__block_literal_global_10106;
  v5[33] = &__block_literal_global_10106;
  v4[34] = @"vignette";
  v4[35] = @"whiteBalance";
  v5[34] = &__block_literal_global_10106;
  v5[35] = &__block_literal_global_116;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:36];
  return v2;
}

id __49__PICompositionNoOpRemoval__noOpRemovalFunctions__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = [v4 objectForKeyedSubscript:@"faceI"];
  if (v5)
  {
    v2 = [v4 objectForKeyedSubscript:@"faceI"];
    if (([v2 isEqual:&unk_1F0009B18] & 1) == 0)
    {

      goto LABEL_70;
    }
  }
  id v6 = [v4 objectForKeyedSubscript:@"faceQ"];
  if (!v6
    || ([v4 objectForKeyedSubscript:@"faceQ"],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 isEqual:&unk_1F0009B18]))
  {
    v8 = [v4 objectForKeyedSubscript:@"faceStrength"];
    if (v8)
    {
      id v9 = [v4 objectForKeyedSubscript:@"faceStrength"];
      if (![v9 isEqual:&unk_1F0009B18])
      {
        char v7 = 0;
LABEL_63:

LABEL_64:
        if (!v6) {
          goto LABEL_66;
        }
        goto LABEL_65;
      }
      v43 = v9;
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"faceWarmth"];
    if (v10)
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"faceWarmth"];
      if (![v11 isEqual:&unk_1F0009B18])
      {
        char v7 = 0;
LABEL_61:

LABEL_62:
        id v9 = v43;
        if (!v8) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }
      v42 = v11;
    }
    int v12 = [v4 objectForKeyedSubscript:@"grayI"];
    if (v12)
    {
      v41 = [v4 objectForKeyedSubscript:@"grayI"];
      if (![v41 isEqual:&unk_1F0009B18])
      {
        char v7 = 0;
LABEL_59:

LABEL_60:
        uint64_t v11 = v42;
        if (!v10) {
          goto LABEL_62;
        }
        goto LABEL_61;
      }
    }
    v13 = [v4 objectForKeyedSubscript:@"grayQ"];
    if (v13)
    {
      v39 = [v4 objectForKeyedSubscript:@"grayQ"];
      if (![v39 isEqual:&unk_1F0009B18])
      {
        char v7 = 0;
LABEL_57:

LABEL_58:
        if (!v12) {
          goto LABEL_60;
        }
        goto LABEL_59;
      }
    }
    uint64_t v38 = [v4 objectForKeyedSubscript:@"grayWarmth"];
    v40 = v13;
    if (v38)
    {
      v36 = [v4 objectForKeyedSubscript:@"grayWarmth"];
      if (![v36 isEqual:&unk_1F0009B18])
      {
        char v7 = 0;
        v15 = (void *)v38;
LABEL_55:

LABEL_56:
        v13 = v40;
        if (!v40) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      v37 = v3;
    }
    else
    {
      v37 = v3;
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"grayY"];
    if (v14)
    {
      v34 = [v4 objectForKeyedSubscript:@"grayY"];
      if (![v34 isEqual:&unk_1F0009B18])
      {
        char v7 = 0;
        v15 = (void *)v38;
LABEL_53:

LABEL_54:
        v3 = v37;
        if (!v15) {
          goto LABEL_56;
        }
        goto LABEL_55;
      }
    }
    uint64_t v33 = [v4 objectForKeyedSubscript:@"temperature"];
    v35 = v14;
    if (v33)
    {
      v32 = [v4 objectForKeyedSubscript:@"temperature"];
      if (![v32 isEqual:&unk_1F0009B30])
      {
        char v7 = 0;
        v15 = (void *)v38;
        v16 = (void *)v33;
LABEL_51:

LABEL_52:
        uint64_t v14 = v35;
        if (!v35) {
          goto LABEL_54;
        }
        goto LABEL_53;
      }
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"tint"];
    if (v17)
    {
      v29 = [v4 objectForKeyedSubscript:@"tint"];
      if (![v29 isEqual:&unk_1F0009B18])
      {
        v18 = (void *)v17;
        char v7 = 0;
        v15 = (void *)v38;
LABEL_49:

LABEL_50:
        v16 = (void *)v33;
        if (!v33) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
    }
    [v4 objectForKeyedSubscript:@"warmFace"];
    uint64_t v31 = v30 = (void *)v17;
    if (v31)
    {
      v27 = [v4 objectForKeyedSubscript:@"warmFace"];
      if (![v27 isEqual:&unk_1F0009B18])
      {
        char v7 = 0;
        v15 = (void *)v38;
        long long v19 = (void *)v31;
LABEL_47:

LABEL_48:
        v18 = v30;
        if (!v30) {
          goto LABEL_50;
        }
        goto LABEL_49;
      }
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"warmTemp"];
    if (!v28
      || ([v4 objectForKeyedSubscript:@"warmTemp"],
          v26 = objc_claimAutoreleasedReturnValue(),
          [v26 isEqual:&unk_1F0009B18]))
    {
      uint64_t v21 = [v4 objectForKeyedSubscript:@"warmTint"];
      if (v21)
      {
        long long v22 = (void *)v21;
        v23 = [v4 objectForKeyedSubscript:@"warmTint"];
        char v7 = [v23 isEqual:&unk_1F0009B18];
      }
      else
      {
        char v7 = 1;
      }
      v15 = (void *)v38;
      long long v20 = (void *)v28;
      if (!v28)
      {
LABEL_46:
        long long v19 = (void *)v31;
        if (!v31) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
    }
    else
    {
      char v7 = 0;
      v15 = (void *)v38;
      long long v20 = (void *)v28;
    }

    goto LABEL_46;
  }
  char v7 = 0;
LABEL_65:

LABEL_66:
  if (v5) {

  }
  if (v7)
  {
    id v24 = 0;
    goto LABEL_71;
  }
LABEL_70:
  id v24 = v4;
LABEL_71:

  return v24;
}

id __49__PICompositionNoOpRemoval__noOpRemovalFunctions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"inputImage"];
  int v4 = [v3 isEqual:@"primary"];

  if (v4) {
    [v2 setObject:0 forKeyedSubscript:@"inputImage"];
  }
  return v2;
}

id __49__PICompositionNoOpRemoval__noOpRemovalFunctions__block_invoke(int a1, id a2)
{
  return a2;
}

@end