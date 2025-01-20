@interface PRUISIncomingCallSnapshotDefinition
- (PRUISIncomingCallSnapshotDefinition)initWithBaseIdentifier:(id)a3 context:(id)a4 attachmentUniqueIdentifiers:(id)a5;
- (void)applySceneSettings:(id)a3;
@end

@implementation PRUISIncomingCallSnapshotDefinition

- (PRUISIncomingCallSnapshotDefinition)initWithBaseIdentifier:(id)a3 context:(id)a4 attachmentUniqueIdentifiers:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id obj = a4;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[v8 copy];
  v12 = _PRUISIncomingCallPosterSnapshotDefinitionLevelSetsForIdentifier(v8);
  v13 = [v12 firstObject];
  int v44 = objc_msgSend(v13, "containsLevel:", +[PRUISPosterAppearanceObservingAttachmentProvider obscurableContentAttachmentLevel](PRUISPosterAppearanceObservingAttachmentProvider, "obscurableContentAttachmentLevel"));
  v42 = v13;
  int v14 = objc_msgSend(v13, "containsLevel:", +[PRUISPosterAppearanceObservingAttachmentProvider overlayContentAttachmentLevel](PRUISPosterAppearanceObservingAttachmentProvider, "overlayContentAttachmentLevel"));
  v45 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v43 = v9;
  if (!v10 || ![v10 count])
  {
    int v24 = 0;
    int v23 = 0;
    if (!v9) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v40 = v10;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v37 = self;
    v38 = v12;
    id v39 = v8;
    char v18 = 0;
    uint64_t v19 = *(void *)v52;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        int v22 = _PRUISIncomingCallPosterSnapshotAttachmentTypeIdentifierIsPredefined(v21);
        int v23 = _PRUISIncomingCallPosterSnapshotAttachmentTypeIdentifierWillIncludeName(v21);
        if (!v22)
        {
          char v18 = 1;
LABEL_12:
          [v45 addObject:v21];
          continue;
        }
        if (([v21 isEqualToString:PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel] & v44 | v14) == 1)goto LABEL_12; {
      }
        }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (!v17)
      {
        v12 = v38;
        id v8 = v39;
        id v9 = v43;
        self = v37;
        goto LABEL_19;
      }
    }
  }
  char v18 = 0;
  int v23 = 0;
LABEL_19:

  int v24 = v18 & 1;
  id v10 = v40;
  if (v9)
  {
LABEL_20:
    objc_storeStrong((id *)&self->_context, obj);
    if ((v23 | v24) == 1)
    {
      v25 = [v9 identifierForSnapshotting];
      uint64_t v26 = [v11 stringByAppendingFormat:@"-%@", v25];

      v11 = (void *)v26;
    }
  }
LABEL_22:
  v27 = self;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v28 = v10;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
    do
    {
      uint64_t v32 = 0;
      v33 = v11;
      do
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v28);
        }
        v11 = [v33 stringByAppendingFormat:@"-%@", *(void *)(*((void *)&v47 + 1) + 8 * v32)];

        ++v32;
        v33 = v11;
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v30);
  }

  v34 = [v11 stringByAppendingFormat:@"_%@", &unk_2707FAA98];

  v46.receiver = v27;
  v46.super_class = (Class)PRUISIncomingCallSnapshotDefinition;
  v35 = [(PRPosterSnapshotDefinition *)&v46 initWithUniqueIdentifier:v34 includeHeaderElements:0 includesComplications:0 levelSets:v12 isUnlocked:0 renderingContent:0 renderingMode:1 previewContent:1];

  return v35;
}

- (void)applySceneSettings:(id)a3
{
  context = self->_context;
  id v5 = a3;
  [(PRUISIncomingCallPosterContext *)context horizontalTitleBoundingRect];
  objc_msgSend(v5, "pr_setHorizontalTitleBoundingRect:");
  [(PRUISIncomingCallPosterContext *)self->_context verticalTitleBoundingRect];
  objc_msgSend(v5, "pr_setVerticalTitleBoundingRect:");
  v6.receiver = self;
  v6.super_class = (Class)PRUISIncomingCallSnapshotDefinition;
  [(PRPosterSnapshotDefinition *)&v6 applySceneSettings:v5];
}

- (void).cxx_destruct
{
}

@end