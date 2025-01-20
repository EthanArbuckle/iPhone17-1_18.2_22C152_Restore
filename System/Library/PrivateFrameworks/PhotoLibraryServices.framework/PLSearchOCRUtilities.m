@interface PLSearchOCRUtilities
+ (id)_ocrTextLineCandidatesFromTextBlockObservation:(id)a3 tokenizer:(id)a4 allowLowConfidence:(BOOL)a5;
+ (id)_ocrTextLinesFromDocumentObservation:(id)a3 allowLowConfidence:(BOOL)a4;
+ (id)_textFoundLine;
+ (id)_wordsFromString:(id)a3 usingTokenizer:(id)a4;
+ (id)jsonOCRTextLinesFromDocumentObservation:(id)a3;
+ (id)ocrTextLinesFromDocumentObservation:(id)a3;
+ (id)spotlightTextLinesFromDocumentObservation:(id)a3;
@end

@implementation PLSearchOCRUtilities

+ (id)_wordsFromString:(id)a3 usingTokenizer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v5 setString:v6];

  v8 = [v5 string];
  uint64_t v9 = [v8 length];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__PLSearchOCRUtilities__wordsFromString_usingTokenizer___block_invoke;
  v15[3] = &unk_1E5871ED0;
  id v16 = v5;
  id v10 = v7;
  id v17 = v10;
  id v11 = v5;
  objc_msgSend(v11, "enumerateTokensInRange:usingBlock:", 0, v9, v15);
  v12 = v17;
  id v13 = v10;

  return v13;
}

void __56__PLSearchOCRUtilities__wordsFromString_usingTokenizer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) string];
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  v8 = [v11 stringByTrimmingCharactersInSet:v7];

  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = [v8 localizedLowercaseString];
  [v9 addObject:v10];
}

+ (id)_ocrTextLineCandidatesFromTextBlockObservation:(id)a3 tokenizer:(id)a4 allowLowConfidence:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v27 = a4;
  if (v7)
  {
    id v28 = (id)objc_opt_new();
    id v25 = v7;
    v8 = [v7 topCandidates:1];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [v13 confidence];
          if (v14 > 0.3 || v5)
          {
            id v16 = [v13 string];
            id v17 = [a1 _wordsFromString:v16 usingTokenizer:v27];
            v18 = v17;
            if (!v17)
            {
              v19 = PLSearchBackendModelTranslationGetLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v34 = v16;
                _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to get NL tokenized words for OCR line %@", buf, 0xCu);
              }

              v18 = (void *)MEMORY[0x1E4F1CBF0];
            }
            v20 = [PLSearchOCRTextLineCandidate alloc];
            [v13 confidence];
            v22 = [(PLSearchOCRTextLineCandidate *)v20 initWithLine:v16 words:v18 confidence:v21];
            [v28 addObject:v22];
            v23 = PLSearchBackendModelTranslationGetLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v22;
              _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Added OCRTextLineCandidate: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v10);
    }

    id v7 = v25;
  }
  else
  {
    id v28 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v28;
}

+ (id)_ocrTextLinesFromDocumentObservation:(id)a3 allowLowConfidence:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
    id v24 = (id)objc_opt_new();
    id v23 = v6;
    v8 = objc_msgSend(v6, "blocksWithTypes:inRegion:", 8, 0.0, 0.0, 1.0, 1.0);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          float v14 = [a1 _ocrTextLineCandidatesFromTextBlockObservation:v13 tokenizer:v7 allowLowConfidence:v4];
          if ([v14 count])
          {
            v15 = [PLSearchOCRTextLine alloc];
            [v13 boundingBox];
            v20 = -[PLSearchOCRTextLine initWithTextBounds:isTitle:candidates:](v15, "initWithTextBounds:isTitle:candidates:", [v13 isTitle], v14, v16, v17, v18, v19);
            [v24 addObject:v20];
            float v21 = PLSearchBackendModelTranslationGetLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v30 = v20;
              _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Added OCRTextLine: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v10);
    }

    id v6 = v23;
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

+ (id)_textFoundLine
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
  BOOL v4 = PLServicesLocalizedFrameworkString();
  BOOL v5 = [a1 _wordsFromString:v4 usingTokenizer:v3];
  id v6 = [[PLSearchOCRTextLineCandidate alloc] initWithLine:v4 words:v5 confidence:1.0];
  id v7 = [PLSearchOCRTextLine alloc];
  v11[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = -[PLSearchOCRTextLine initWithTextBounds:isTitle:candidates:](v7, "initWithTextBounds:isTitle:candidates:", 1, v8, 0.0, 0.0, 1.0, 1.0);

  return v9;
}

+ (id)jsonOCRTextLinesFromDocumentObservation:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v31 = (id)objc_opt_new();
    id v28 = v4;
    BOOL v5 = +[PLSearchOCRUtilities _ocrTextLinesFromDocumentObservation:v4 allowLowConfidence:1];
    if ([v5 count])
    {
      id v6 = [a1 _textFoundLine];
      uint64_t v7 = [v5 arrayByAddingObject:v6];

      BOOL v5 = (void *)v7;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v5;
    uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v32)
    {
      uint64_t v30 = *(void *)v41;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v8;
          uint64_t v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
          uint64_t v10 = objc_opt_new();
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          v33 = v9;
          id v35 = [v9 candidates];
          uint64_t v11 = [v35 countByEnumeratingWithState:&v36 objects:v48 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v37 != v13) {
                  objc_enumerationMutation(v35);
                }
                v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                [v15 confidence];
                BOOL v17 = v16 > 0.3;
                v46[0] = @"line";
                double v18 = [v15 line];
                v47[0] = v18;
                v46[1] = @"words";
                double v19 = [v15 words];
                v47[1] = v19;
                v46[2] = @"confidence";
                v20 = NSNumber;
                [v15 confidence];
                float v21 = objc_msgSend(v20, "numberWithDouble:");
                v47[2] = v21;
                v46[3] = @"isAboveThreshold";
                v22 = [NSNumber numberWithBool:v17];
                v47[3] = v22;
                id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:4];

                [v10 addObject:v23];
              }
              uint64_t v12 = [v35 countByEnumeratingWithState:&v36 objects:v48 count:16];
            }
            while (v12);
          }

          v44[0] = @"isTitle";
          id v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v33, "isTitle"));
          v45[0] = v24;
          v44[1] = @"textBounds";
          [v33 textBounds];
          long long v25 = NSStringFromRect(v52);
          v44[2] = @"lineCandidates";
          v45[1] = v25;
          v45[2] = v10;
          long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];

          [v31 addObject:v26];
          uint64_t v8 = v34 + 1;
        }
        while (v34 + 1 != v32);
        uint64_t v32 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v32);
    }

    id v4 = v28;
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

+ (id)spotlightTextLinesFromDocumentObservation:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (spotlightTextLinesFromDocumentObservation__onceToken != -1) {
      dispatch_once(&spotlightTextLinesFromDocumentObservation__onceToken, &__block_literal_global_94779);
    }
    id v29 = (id)objc_opt_new();
    BOOL v5 = +[PLSearchOCRUtilities ocrTextLinesFromDocumentObservation:v4];
    id v26 = v4;
    if ([v5 count])
    {
      id v6 = [a1 _textFoundLine];
      uint64_t v7 = [v5 arrayByAddingObject:v6];

      BOOL v5 = (void *)v7;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v5;
    uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v30)
    {
      uint64_t v28 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v10 = objc_alloc(MEMORY[0x1E4F23808]);
          [v9 textBounds];
          v15 = objc_msgSend(v10, "initWithTextBounds:isTitle:", objc_msgSend(v9, "isTitle"), v11, v12, v13, v14);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          double v16 = [v9 candidates];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v32;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v32 != v19) {
                  objc_enumerationMutation(v16);
                }
                float v21 = *(void **)(*((void *)&v31 + 1) + 8 * j);
                int v22 = spotlightTextLinesFromDocumentObservation__disableOCRDonationWorkaround;
                id v23 = [v21 line];
                if (v22) {
                  [v21 confidence];
                }
                else {
                  double v24 = 1.0;
                }
                [v15 addCandidate:v23 confidence:v24];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v18);
          }

          [v29 addObject:v15];
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v30);
    }

    id v4 = v26;
  }
  else
  {
    id v29 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v29;
}

void __66__PLSearchOCRUtilities_spotlightTextLinesFromDocumentObservation___block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  spotlightTextLinesFromDocumentObservation__disableOCRDonationWorkaround = [v0 BOOLForKey:@"disableOCRDonationWorkaround"];

  if (spotlightTextLinesFromDocumentObservation__disableOCRDonationWorkaround)
  {
    v1 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_19B3C7000, v1, OS_LOG_TYPE_DEFAULT, "disableOCRDonationWorkaround user default set", v2, 2u);
    }
  }
}

+ (id)ocrTextLinesFromDocumentObservation:(id)a3
{
  return (id)[a1 _ocrTextLinesFromDocumentObservation:a3 allowLowConfidence:0];
}

@end