@interface INPerson(PhoneRecents)
- (uint64_t)initWithContact:()PhoneRecents handle:;
@end

@implementation INPerson(PhoneRecents)

- (uint64_t)initWithContact:()PhoneRecents handle:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v51 = a4;
  v54 = [MEMORY[0x1E4F28F30] componentsForContact:v5];
  v6 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 isKeyAvailable:*MEMORY[0x1E4F1AEE0]])
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v50 = v5;
    v7 = [v5 phoneNumbers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v62 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          id v13 = objc_alloc(MEMORY[0x1E4F305B8]);
          v14 = [v12 value];
          v15 = [v14 stringValue];
          v16 = INPersonHandleLabelForCNLabeledValue();
          v17 = (void *)[v13 initWithValue:v15 type:2 label:v16];

          [v6 addObject:v17];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v61 objects:v67 count:16];
      }
      while (v9);
    }

    id v5 = v50;
  }
  if ([v5 isKeyAvailable:*MEMORY[0x1E4F1ADC8]])
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v18 = v5;
    v19 = [v5 emailAddresses];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v58 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          id v25 = objc_alloc(MEMORY[0x1E4F305B8]);
          v26 = [v24 value];
          v27 = INPersonHandleLabelForCNLabeledValue();
          v28 = (void *)[v25 initWithValue:v26 type:1 label:v27];

          [v6 addObject:v28];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v21);
    }

    id v5 = v18;
  }
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __49__INPerson_PhoneRecents__initWithContact_handle___block_invoke;
  v55[3] = &unk_1E6540BB8;
  id v29 = v51;
  id v56 = v29;
  v30 = objc_msgSend(v6, "if_firstObjectPassingTest:", v55);
  v31 = v30;
  if (v30)
  {
    id v32 = v30;
  }
  else
  {
    id v32 = [v6 firstObject];
  }
  v33 = v32;

  if ((unint64_t)[v6 count] < 2)
  {

    v6 = 0;
  }
  else
  {
    [v6 removeObject:v33];
  }
  if ([v5 isKeyAvailable:*MEMORY[0x1E4F1AE08]])
  {
    v34 = [v5 identifier];
  }
  else
  {
    v34 = 0;
  }
  if (![v5 isKeyAvailable:*MEMORY[0x1E4F1AE20]]
    || ![v5 isKeyAvailable:*MEMORY[0x1E4F1AF98]]
    || ![v5 imageDataAvailable]
    || (v35 = (void *)MEMORY[0x1E4F304C0],
        [v5 thumbnailImageData],
        v36 = objc_claimAutoreleasedReturnValue(),
        [v35 imageWithImageData:v36],
        v37 = objc_claimAutoreleasedReturnValue(),
        v36,
        !v37))
  {
    v52 = v33;
    id v38 = v29;
    id v39 = objc_alloc_init(MEMORY[0x1E4F1BB20]);
    v40 = (void *)MEMORY[0x1E4F1BB30];
    v41 = [MEMORY[0x1E4FB46B8] currentDevice];
    [v41 screenScale];
    v43 = objc_msgSend(v40, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, 60.0, 60.0, v42);

    id v65 = v5;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    v45 = [v39 avatarImageForContacts:v44 scope:v43];

    v46 = (void *)[objc_alloc(MEMORY[0x1E4FB4770]) initWithPlatformImage:v45];
    v47 = [v46 PNGRepresentation];
    if (v47)
    {
      v37 = [MEMORY[0x1E4F304C0] imageWithImageData:v47];
    }
    else
    {
      v37 = 0;
    }

    id v29 = v38;
    v33 = v52;
  }
  uint64_t v48 = [a1 initWithPersonHandle:v33 nameComponents:v54 displayName:0 image:v37 contactIdentifier:v34 customIdentifier:0 aliases:v6 suggestionType:0];

  return v48;
}

@end