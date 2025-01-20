@interface UIFontPickerLoadRecentsMatchingConfigurationForSuite
@end

@implementation UIFontPickerLoadRecentsMatchingConfigurationForSuite

void ___UIFontPickerLoadRecentsMatchingConfigurationForSuite_block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  v35 = a3;
  v36 = a1;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [a1[4] _clientRecentFonts];
  uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  v7 = off_1E52D5000;
  if (!v6) {
    goto LABEL_22;
  }
  uint64_t v8 = v6;
  uint64_t v9 = *(void *)v42;
  v31 = (char *)(v35 + 2);
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v42 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = (void *)[objc_alloc(v7[247]) initWithFontDescriptor:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      v12 = [v11 familyName];
      if ((v5[2](v5, v12) & 1) == 0)
      {

        goto LABEL_18;
      }
      uint64_t v13 = [v11 fontName];
      if (v13)
      {
        v14 = (void *)v13;
        v15 = [v11 fontName];
        int v16 = v35[2](v35, v15);

        v7 = off_1E52D5000;
        if (!v16) {
          goto LABEL_18;
        }
      }
      else
      {
      }
      if (objc_msgSend(v11, "isFontFamilyAvailable", v31)
        && [v11 matchesConfiguration:v36[4]])
      {
        id v17 = v36[5];
        if ([v36[4] includeFaces])
        {
          [v17 addObject:v11];
        }
        else
        {
          v18 = [v11 familyInfo];
          [v17 addObject:v18];
        }
      }
      if ((unint64_t)[v36[5] count] >= 7)
      {

        goto LABEL_22;
      }
LABEL_18:
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_22:

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obja = v36[6];
  uint64_t v19 = [obja countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (!v19) {
    goto LABEL_43;
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v38;
  v32 = (char *)(v35 + 2);
  while (2)
  {
    uint64_t v22 = 0;
    while (2)
    {
      if (*(void *)v38 != v21) {
        objc_enumerationMutation(obja);
      }
      v23 = -[__objc2_class infoWithName:](v7[247], "infoWithName:", *(void *)(*((void *)&v37 + 1) + 8 * v22), v32);
      v24 = [v23 familyName];
      if ((v5[2](v5, v24) & 1) == 0)
      {

        goto LABEL_39;
      }
      uint64_t v25 = [v23 fontName];
      if (v25)
      {
        v26 = (void *)v25;
        v27 = [v23 fontName];
        int v28 = v35[2](v35, v27);

        v7 = off_1E52D5000;
        if (!v28) {
          goto LABEL_39;
        }
      }
      else
      {
      }
      if ([v23 isFontFamilyAvailable]
        && [v23 matchesConfiguration:v36[4]])
      {
        id v29 = v36[5];
        if ([v36[4] includeFaces])
        {
          [v29 addObject:v23];
        }
        else
        {
          v30 = [v23 familyInfo];
          [v29 addObject:v30];
        }
      }
      if ((unint64_t)[v36[5] count] >= 7)
      {

        goto LABEL_43;
      }
LABEL_39:

      if (v20 != ++v22) {
        continue;
      }
      break;
    }
    uint64_t v20 = [obja countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_43:
}

@end