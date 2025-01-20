@interface CACVoiceOverShortDescriptionGenerator
+ (id)sharedInstance;
- (id)_items:(id)a3 byKeyGeneratedUsingBlock:(id)a4;
- (id)_lowerPitchForString:(id)a3;
- (id)shortDescriptionsForItems:(id)a3 style:(int64_t)a4;
- (void)_addToItemShortDescriptionPairs:(id)a3 foritems:(id)a4 keyGenerationBlocks:(id)a5 shortDescriptionGenerationBlocks:(id)a6 lastResortShortDescriptionGenerationBlock:(id)a7;
@end

@implementation CACVoiceOverShortDescriptionGenerator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_26);
  }
  v2 = (void *)sharedInstance_Generator;
  return v2;
}

uint64_t __55__CACVoiceOverShortDescriptionGenerator_sharedInstance__block_invoke()
{
  sharedInstance_Generator = objc_alloc_init(CACVoiceOverShortDescriptionGenerator);
  return MEMORY[0x270F9A758]();
}

- (id)_items:(id)a3 byKeyGeneratedUsingBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v14 = v6[2](v6, v13);
        if (v14)
        {
          v15 = objc_msgSend(v7, "objectForKeyedSubscript:", v14, (void)v17);
          if (!v15)
          {
            v15 = [MEMORY[0x263EFF980] array];
            [v7 setObject:v15 forKeyedSubscript:v14];
          }
          [v15 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_addToItemShortDescriptionPairs:(id)a3 foritems:(id)a4 keyGenerationBlocks:(id)a5 shortDescriptionGenerationBlocks:(id)a6 lastResortShortDescriptionGenerationBlock:(id)a7
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v42 = a6;
  v15 = (void (**)(id, void))a7;
  v16 = [v14 firstObject];
  v39 = self;
  v37 = v13;
  long long v17 = [(CACVoiceOverShortDescriptionGenerator *)self _items:v13 byKeyGeneratedUsingBlock:v16];

  long long v18 = v14;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v19 = v17;
  uint64_t v44 = [v19 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v52;
    id v41 = v19;
    id v38 = v14;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v52 != v43) {
          objc_enumerationMutation(v19);
        }
        v21 = [v19 objectForKeyedSubscript:*(void *)(*((void *)&v51 + 1) + 8 * v20)];
        if ([v21 count] == 1)
        {
          uint64_t v22 = objc_alloc_init(CACVoiceOverItemShortDescriptionPair);
          v23 = [v21 firstObject];
          [(CACVoiceOverItemShortDescriptionPair *)v22 setItem:v23];
          v24 = [v42 firstObject];
          ((void (**)(void, void *))v24)[2](v24, v23);
          v45 = v21;
          v25 = v18;
          v27 = uint64_t v26 = v20;
          [(CACVoiceOverItemShortDescriptionPair *)v22 setShortDescription:v27];

          uint64_t v20 = v26;
          long long v18 = v25;
          v21 = v45;
          [v12 addObject:v22];

          id v19 = v41;
          goto LABEL_8;
        }
        if ((unint64_t)[v21 count] >= 2)
        {
          if ((unint64_t)[v18 count] < 2)
          {
            v28 = CACLogAccessibility();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              v57 = v21;
              _os_log_impl(&dword_238377000, v28, OS_LOG_TYPE_DEFAULT, "Unable to provide unique short descriptions for elements: %{private}@", buf, 0xCu);
            }

            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            uint64_t v22 = v21;
            uint64_t v29 = [(CACVoiceOverItemShortDescriptionPair *)v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              v46 = v21;
              uint64_t v40 = v20;
              uint64_t v31 = *(void *)v48;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v48 != v31) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                  v34 = objc_alloc_init(CACVoiceOverItemShortDescriptionPair);
                  [(CACVoiceOverItemShortDescriptionPair *)v34 setItem:v33];
                  v35 = v15[2](v15, v33);
                  [(CACVoiceOverItemShortDescriptionPair *)v34 setShortDescription:v35];

                  [v12 addObject:v34];
                }
                uint64_t v30 = [(CACVoiceOverItemShortDescriptionPair *)v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }
              while (v30);
              long long v18 = v38;
              uint64_t v20 = v40;
              id v19 = v41;
              v21 = v46;
            }
          }
          else
          {
            objc_msgSend(v18, "subarrayWithRange:", 1, objc_msgSend(v18, "count") - 1);
            uint64_t v22 = (CACVoiceOverItemShortDescriptionPair *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v42, "subarrayWithRange:", 1, objc_msgSend(v42, "count") - 1);
            [(CACVoiceOverShortDescriptionGenerator *)v39 _addToItemShortDescriptionPairs:v12 foritems:v21 keyGenerationBlocks:v22 shortDescriptionGenerationBlocks:v23 lastResortShortDescriptionGenerationBlock:v15];
LABEL_8:
          }
        }

        ++v20;
      }
      while (v20 != v44);
      uint64_t v36 = [v19 countByEnumeratingWithState:&v51 objects:v58 count:16];
      uint64_t v44 = v36;
    }
    while (v36);
  }
}

- (id)_lowerPitchForString:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F21660];
    id v4 = a3;
    id v5 = (void *)[[v3 alloc] initWithString:v4];

    [v5 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F217D8]];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)shortDescriptionsForItems:(id)a3 style:(int64_t)a4
{
  v63[5] = *MEMORY[0x263EF8340];
  id v39 = a3;
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke;
  v61[3] = &__block_descriptor_40_e45___NSString_16__0___CACVoiceOverDescribable__8l;
  v61[4] = a4;
  v6 = (void *)MEMORY[0x23EC8F1E0](v61);
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_2;
  v58[3] = &unk_264D12430;
  id v59 = v6;
  int64_t v60 = a4;
  int64_t v38 = a4;
  v58[4] = self;
  id v37 = v6;
  v7 = (void *)MEMORY[0x23EC8F1E0](v58);
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_4;
  v54[3] = &unk_264D12478;
  int64_t v57 = a4;
  v54[4] = self;
  id v55 = &__block_literal_global_291;
  id v8 = v7;
  id v56 = v8;
  uint64_t v36 = (void *)MEMORY[0x23EC8F1E0](v54);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_6;
  v51[3] = &unk_264D124A0;
  id v9 = v8;
  v51[4] = self;
  id v52 = v9;
  id v53 = &__block_literal_global_293;
  v34 = (void *)MEMORY[0x23EC8F1E0](v51);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_8;
  v48[3] = &unk_264D124A0;
  id v10 = v9;
  v48[4] = self;
  id v49 = v10;
  uint64_t v29 = self;
  id v50 = &__block_literal_global_295;
  v32 = (void *)MEMORY[0x23EC8F1E0](v48);
  uint64_t v11 = [MEMORY[0x263F21668] systemWideElement];
  id v12 = [v11 systemApplication];
  uint64_t v13 = [v12 applicationOrientation];

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_9;
  v47[3] = &__block_descriptor_40_e45___NSString_16__0___CACVoiceOverDescribable__8l;
  v47[4] = v13;
  id v14 = (void *)MEMORY[0x23EC8F1E0](v47);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_10;
  v44[3] = &unk_264D124A0;
  v44[4] = self;
  id v45 = v10;
  id v46 = v14;
  id v35 = v14;
  id v15 = v10;
  uint64_t v31 = (void *)MEMORY[0x23EC8F1E0](v44);
  v28 = [MEMORY[0x263EFF980] array];
  uint64_t v30 = (void *)MEMORY[0x23EC8F1E0](v37);
  v63[0] = v30;
  v63[1] = &__block_literal_global_291;
  v63[2] = &__block_literal_global_293;
  v63[3] = &__block_literal_global_295;
  v16 = (void *)MEMORY[0x23EC8F1E0](v35);
  v63[4] = v16;
  long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:5];
  uint64_t v33 = v15;
  long long v18 = (void *)MEMORY[0x23EC8F1E0](v15);
  v62[0] = v18;
  id v19 = (void *)MEMORY[0x23EC8F1E0](v36);
  v62[1] = v19;
  uint64_t v20 = (void *)MEMORY[0x23EC8F1E0](v34);
  v62[2] = v20;
  v21 = (void *)MEMORY[0x23EC8F1E0](v32);
  v62[3] = v21;
  uint64_t v22 = (void *)MEMORY[0x23EC8F1E0](v31);
  v62[4] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:5];
  [(CACVoiceOverShortDescriptionGenerator *)v29 _addToItemShortDescriptionPairs:v28 foritems:v39 keyGenerationBlocks:v17 shortDescriptionGenerationBlocks:v23 lastResortShortDescriptionGenerationBlock:v15];

  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_11;
  v41[3] = &unk_264D124C8;
  id v42 = v39;
  int64_t v43 = v38;
  id v24 = v39;
  v25 = [v28 sortedArrayUsingComparator:v41];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_12;
  v40[3] = &__block_descriptor_40_e46__16__0__CACVoiceOverItemShortDescriptionPair_8l;
  v40[4] = v38;
  uint64_t v26 = objc_msgSend(v25, "ax_flatMappedArrayUsingBlock:", v40);

  return v26;
}

void *__73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = a1[4];
  if (v5 == 1)
  {
    a1 = [v3 recognitionLabel];
  }
  else if (!v5)
  {
    v6 = [v3 unfilteredRecognitionLabel];
    a1 = CACNonNilStringWithinLengthLimit(v6, 10, 0x32uLL);
  }
  return a1;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_2(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = a1[6];
  if (v6 == 1)
  {
    v2 = (*(void (**)(void))(a1[5] + 16))();
  }
  else if (!v6)
  {
    v7 = [v4 numberedLabel];
    id v8 = (void *)a1[4];
    id v9 = (*(void (**)(void))(a1[5] + 16))();
    uint64_t v11 = [v8 _lowerPitchForString:v9];
    v2 = __AXStringForVariables();
  }
  return v2;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 fullLabel];
  id v3 = CACNonNilStringWithinLengthLimit(v2, 10, 0x32uLL);

  return v3;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_4(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = a1[7];
  if (v6 == 1)
  {
    uint64_t v7 = (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (v6) {
      goto LABEL_6;
    }
    uint64_t v7 = [v4 numberedLabel];
  }
  id v8 = (void *)v7;
  id v9 = (void *)a1[4];
  id v10 = (*(void (**)(void))(a1[5] + 16))();
  id v12 = [v9 _lowerPitchForString:v10];
  v2 = __AXStringForVariables();

LABEL_6:
  return v2;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 valueLabel];
  id v3 = CACNonNilStringWithinLengthLimit(v2, 10, 0x32uLL);

  return v3;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_6(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  uint64_t v6 = v4(v3, v5);
  uint64_t v7 = (void *)a1[4];
  id v8 = (*(void (**)(void))(a1[6] + 16))();

  uint64_t v11 = [v7 _lowerPitchForString:v8];
  id v9 = __AXStringForVariables();

  return v9;
}

__CFString *__73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 traits];
  uint64_t v3 = v2;
  if ((*MEMORY[0x263F219B0] & v2) != 0)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v4;
    uint64_t v6 = @"Trait.BackButton";
LABEL_7:
    v21 = [v4 localizedStringForKey:v6 value:&stru_26EB332F0 table:0];
    uint64_t v26 = @"__AXStringForVariablesSentinel";
    __AXStringForVariables();
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if ((*MEMORY[0x263F21A38] & v2) != 0)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v4;
    uint64_t v6 = @"Trait.KeyboardKey";
    goto LABEL_7;
  }
  if ((*MEMORY[0x263F219B8] & v2) != 0)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = v4;
    uint64_t v6 = @"Trait.Button";
    goto LABEL_7;
  }
  uint64_t v7 = &stru_26EB332F0;
LABEL_8:
  if ((*MEMORY[0x263F21A28] & v3) != 0)
  {
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v8 localizedStringForKey:@"Trait.Image" value:&stru_26EB332F0 table:0];
    uint64_t v26 = @"__AXStringForVariablesSentinel";
    uint64_t v9 = __AXStringForVariables();

    uint64_t v7 = (__CFString *)v9;
  }
  if ((*MEMORY[0x263F21AD8] & v3) != 0)
  {
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = v10;
    id v12 = @"Trait.SearchField";
  }
  else
  {
    if ((*MEMORY[0x263F21B68] & v3) == 0) {
      goto LABEL_15;
    }
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = v10;
    id v12 = @"Trait.TextEntry";
  }
  uint64_t v22 = objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_26EB332F0, 0, v21, v26);
  uint64_t v13 = __AXStringForVariables();

  uint64_t v7 = (__CFString *)v13;
LABEL_15:
  if ((*MEMORY[0x263F21910] & v3) != 0)
  {
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v14 localizedStringForKey:@"Trait.Adjustable" value:&stru_26EB332F0 table:0];
    uint64_t v15 = __AXStringForVariables();

    uint64_t v7 = (__CFString *)v15;
  }
  if ((*MEMORY[0x263F21A18] & v3) != 0)
  {
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v24 = [v16 localizedStringForKey:@"Trait.Header" value:&stru_26EB332F0 table:0];
    uint64_t v17 = __AXStringForVariables();

    uint64_t v7 = (__CFString *)v17;
  }
  if ((*MEMORY[0x263F21A48] & v3) != 0)
  {
    long long v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v25 = [v18 localizedStringForKey:@"Trait.Link" value:&stru_26EB332F0 table:0];
    uint64_t v19 = __AXStringForVariables();

    uint64_t v7 = (__CFString *)v19;
  }
  return v7;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_8(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  uint64_t v6 = v4(v3, v5);
  uint64_t v7 = (void *)a1[4];
  id v8 = (*(void (**)(void))(a1[6] + 16))();

  uint64_t v11 = [v7 _lowerPitchForString:v8];
  uint64_t v9 = __AXStringForVariables();

  return v9;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_9(uint64_t a1, void *a2)
{
  [a2 frame];
  AXDeviceGetMainScreenBounds();
  AX_CGRectToOrientation();
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  AX_CGRectToOrientation();
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v28 = v16;
  v31.origin.x = v3;
  v31.origin.y = v5;
  v31.size.width = v7;
  v31.size.height = v9;
  CGFloat v29 = CGRectGetWidth(v31) / 3.0;
  v32.origin.x = v3;
  v32.origin.y = v5;
  v32.size.width = v7;
  v32.size.height = v9;
  double Width = CGRectGetWidth(v32);
  v33.origin.x = v3;
  v33.origin.y = v5;
  v33.size.width = v7;
  v33.size.height = v9;
  double v27 = CGRectGetHeight(v33) / 3.0;
  v34.origin.x = v3;
  v34.origin.y = v5;
  v34.size.width = v7;
  v34.size.height = v9;
  CGFloat Height = CGRectGetHeight(v34);
  double v18 = (Height + Height) / 3.0;
  v35.origin.x = v11;
  v35.origin.y = v13;
  v35.size.width = v15;
  v35.size.height = v28;
  double MidX = CGRectGetMidX(v35);
  v36.origin.x = v11;
  v36.origin.y = v13;
  v36.size.width = v15;
  v36.size.height = v28;
  double MidY = CGRectGetMidY(v36);
  if (MidX >= v29)
  {
    if (MidX >= (Width + Width) / 3.0)
    {
      if (MidY < v27)
      {
        v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v22 = v21;
        v23 = @"Frame.TopRight";
        goto LABEL_19;
      }
      uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (MidY >= v18) {
        v23 = @"Frame.BottomRight";
      }
      else {
        v23 = @"Frame.MiddleRight";
      }
    }
    else
    {
      if (MidY < v27)
      {
        v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v22 = v21;
        v23 = @"Frame.TopCenter";
        goto LABEL_19;
      }
      uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (MidY >= v18) {
        v23 = @"Frame.BottomCenter";
      }
      else {
        v23 = @"Frame.MiddleCenter";
      }
    }
  }
  else
  {
    if (MidY < v27)
    {
      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v22 = v21;
      v23 = @"Frame.TopLeft";
      goto LABEL_19;
    }
    uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (MidY >= v18) {
      v23 = @"Frame.BottomLeft";
    }
    else {
      v23 = @"Frame.MiddleLeft";
    }
  }
  v21 = v22;
LABEL_19:
  id v24 = objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_26EB332F0, 0, *(void *)&Width);

  return v24;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_10(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  double v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  double v6 = v4(v3, v5);
  CGFloat v7 = (void *)a1[4];
  double v8 = (*(void (**)(void))(a1[6] + 16))();

  CGFloat v11 = [v7 _lowerPitchForString:v8];
  CGFloat v9 = __AXStringForVariables();

  return v9;
}

uint64_t __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 == 1)
  {
    double v16 = *(void **)(a1 + 32);
    uint64_t v17 = [v5 item];
    unint64_t v18 = [v16 indexOfObject:v17];

    uint64_t v19 = *(void **)(a1 + 32);
    uint64_t v20 = [v6 item];
    unint64_t v21 = [v19 indexOfObject:v20];

    BOOL v14 = v18 == v21;
    uint64_t v15 = -1;
    if (v18 >= v21) {
      uint64_t v15 = 1;
    }
  }
  else
  {
    if (v7) {
      goto LABEL_11;
    }
    double v8 = [v5 item];
    CGFloat v9 = [v8 numberedLabel];
    uint64_t v10 = [v9 integerValue];

    CGFloat v11 = [v6 item];
    double v12 = [v11 numberedLabel];
    uint64_t v13 = [v12 integerValue];

    BOOL v14 = v10 == v13;
    uint64_t v15 = -1;
    if (v10 >= v13) {
      uint64_t v15 = 1;
    }
  }
  if (v14) {
    a1 = 0;
  }
  else {
    a1 = v15;
  }
LABEL_11:

  return a1;
}

id __73__CACVoiceOverShortDescriptionGenerator_shortDescriptionsForItems_style___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = v3;
  if (*(void *)(a1 + 32) == 1
    && ([v3 item],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 recognitionLabel],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v5,
        !v7))
  {
    uint64_t v10 = CACLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      CGFloat v11 = [v4 item];
      int v12 = 138477827;
      uint64_t v13 = v11;
      _os_log_impl(&dword_238377000, v10, OS_LOG_TYPE_INFO, "No name found for %{private}@, so not describing it", (uint8_t *)&v12, 0xCu);
    }
    double v8 = 0;
  }
  else
  {
    double v8 = [v4 shortDescription];
  }

  return v8;
}

@end