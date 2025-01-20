@interface PPFeedback
- (PPFeedback)initWithExplicitlyEngagedString:(id)a3;
- (PPFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6;
- (PPFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6 offeredStrings:(id)a7;
- (PPFeedback)initWithExplicitlyEngagedStrings:(id)a3 implicitlyEngagedStrings:(id)a4 offeredStrings:(id)a5;
- (PPFeedback)initWithExplicitlyRejectedString:(id)a3;
- (PPFeedback)initWithImplicitlyEngagedString:(id)a3;
- (PPFeedback)initWithImplicitlyRejectedString:(id)a3;
- (PPFeedback)initWithOfferedString:(id)a3;
@end

@implementation PPFeedback

- (PPFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6 offeredStrings:(id)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v49 = a7;
  v15 = objc_opt_new();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v70;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v70 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [[PPFeedbackItem alloc] initWithItemString:*(void *)(*((void *)&v69 + 1) + 8 * v20) itemFeedbackType:1];
        [v15 addObject:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v18);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v22 = v12;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v66;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v66 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [[PPFeedbackItem alloc] initWithItemString:*(void *)(*((void *)&v65 + 1) + 8 * v26) itemFeedbackType:3];
        [v15 addObject:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v24);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v28 = v13;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v62;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v62 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = [[PPFeedbackItem alloc] initWithItemString:*(void *)(*((void *)&v61 + 1) + 8 * v32) itemFeedbackType:2];
        [v15 addObject:v33];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v30);
  }
  v50 = v16;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v34 = v14;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v57 objects:v74 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v58;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = [[PPFeedbackItem alloc] initWithItemString:*(void *)(*((void *)&v57 + 1) + 8 * v38) itemFeedbackType:4];
        [v15 addObject:v39];

        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [v34 countByEnumeratingWithState:&v57 objects:v74 count:16];
    }
    while (v36);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v40 = v49;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v53 objects:v73 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v54;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v54 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = [[PPFeedbackItem alloc] initWithItemString:*(void *)(*((void *)&v53 + 1) + 8 * v44) itemFeedbackType:5];
        [v15 addObject:v45];

        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [v40 countByEnumeratingWithState:&v53 objects:v73 count:16];
    }
    while (v42);
  }

  v46 = (void *)[v15 copy];
  v52.receiver = self;
  v52.super_class = (Class)PPFeedback;
  v47 = [(PPBaseFeedback *)&v52 initWithFeedbackItems:v46 mappingId:0];

  return v47;
}

- (PPFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6
{
  return [(PPFeedback *)self initWithExplicitlyEngagedStrings:a3 explicitlyRejectedStrings:a4 implicitlyEngagedStrings:a5 implicitlyRejectedStrings:a6 offeredStrings:0];
}

- (PPFeedback)initWithExplicitlyEngagedStrings:(id)a3 implicitlyEngagedStrings:(id)a4 offeredStrings:(id)a5
{
  return [(PPFeedback *)self initWithExplicitlyEngagedStrings:a3 explicitlyRejectedStrings:0 implicitlyEngagedStrings:a4 implicitlyRejectedStrings:0 offeredStrings:a5];
}

- (PPFeedback)initWithOfferedString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", 0, 0, 0, 0, v6, v9, v10);
  return v7;
}

- (PPFeedback)initWithImplicitlyRejectedString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", 0, 0, 0, v6, 0, v9, v10);
  return v7;
}

- (PPFeedback)initWithImplicitlyEngagedString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", 0, 0, v6, 0, 0, v9, v10);
  return v7;
}

- (PPFeedback)initWithExplicitlyRejectedString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", 0, v6, 0, 0, 0, v9, v10);
  return v7;
}

- (PPFeedback)initWithExplicitlyEngagedString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[PPFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:", v6, 0, 0, 0, 0, v9, v10);
  return v7;
}

@end