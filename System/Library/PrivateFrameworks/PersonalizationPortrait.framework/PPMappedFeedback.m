@interface PPMappedFeedback
- (PPMappedFeedback)initWithExplicitlyEngagedString:(id)a3 mappingId:(id)a4;
- (PPMappedFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6 mappingId:(id)a7;
- (PPMappedFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6 offeredStrings:(id)a7 mappingId:(id)a8;
- (PPMappedFeedback)initWithExplicitlyEngagedStrings:(id)a3 implicitlyEngagedStrings:(id)a4 offeredStrings:(id)a5 mappingId:(id)a6;
- (PPMappedFeedback)initWithExplicitlyRejectedString:(id)a3 mappingId:(id)a4;
- (PPMappedFeedback)initWithImplicitlyEngagedString:(id)a3 mappingId:(id)a4;
- (PPMappedFeedback)initWithImplicitlyRejectedString:(id)a3 mappingId:(id)a4;
- (PPMappedFeedback)initWithOfferedString:(id)a3 mappingId:(id)a4;
@end

@implementation PPMappedFeedback

- (PPMappedFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6 offeredStrings:(id)a7 mappingId:(id)a8
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v51 = a7;
  id v52 = a8;
  v17 = objc_opt_new();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v18 = v13;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v73;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v73 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = -[PPFeedbackItem initWithItemString:itemFeedbackType:]([PPFeedbackItem alloc], "initWithItemString:itemFeedbackType:", *(void *)(*((void *)&v72 + 1) + 8 * v22), 1, v51);
        [v17 addObject:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }
    while (v20);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v24 = v14;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v69;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v69 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [[PPFeedbackItem alloc] initWithItemString:*(void *)(*((void *)&v68 + 1) + 8 * v28) itemFeedbackType:3];
        [v17 addObject:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v68 objects:v79 count:16];
    }
    while (v26);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v30 = v15;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v64 objects:v78 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v65;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v65 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = [[PPFeedbackItem alloc] initWithItemString:*(void *)(*((void *)&v64 + 1) + 8 * v34) itemFeedbackType:2];
        [v17 addObject:v35];

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v64 objects:v78 count:16];
    }
    while (v32);
  }
  v53 = v18;

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v36 = v16;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v60 objects:v77 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v61;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v61 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = [[PPFeedbackItem alloc] initWithItemString:*(void *)(*((void *)&v60 + 1) + 8 * v40) itemFeedbackType:4];
        [v17 addObject:v41];

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [v36 countByEnumeratingWithState:&v60 objects:v77 count:16];
    }
    while (v38);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v42 = v51;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v56 objects:v76 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v57;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v57 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = [[PPFeedbackItem alloc] initWithItemString:*(void *)(*((void *)&v56 + 1) + 8 * v46) itemFeedbackType:5];
        [v17 addObject:v47];

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [v42 countByEnumeratingWithState:&v56 objects:v76 count:16];
    }
    while (v44);
  }

  v48 = (void *)[v17 copy];
  v55.receiver = self;
  v55.super_class = (Class)PPMappedFeedback;
  v49 = [(PPBaseFeedback *)&v55 initWithFeedbackItems:v48 mappingId:v52];

  return v49;
}

- (PPMappedFeedback)initWithExplicitlyEngagedStrings:(id)a3 implicitlyEngagedStrings:(id)a4 offeredStrings:(id)a5 mappingId:(id)a6
{
  return [(PPMappedFeedback *)self initWithExplicitlyEngagedStrings:a3 explicitlyRejectedStrings:0 implicitlyEngagedStrings:a4 implicitlyRejectedStrings:0 offeredStrings:a5 mappingId:a6];
}

- (PPMappedFeedback)initWithExplicitlyEngagedStrings:(id)a3 explicitlyRejectedStrings:(id)a4 implicitlyEngagedStrings:(id)a5 implicitlyRejectedStrings:(id)a6 mappingId:(id)a7
{
  return [(PPMappedFeedback *)self initWithExplicitlyEngagedStrings:a3 explicitlyRejectedStrings:a4 implicitlyEngagedStrings:a5 implicitlyRejectedStrings:a6 offeredStrings:0 mappingId:a7];
}

- (PPMappedFeedback)initWithOfferedString:(id)a3 mappingId:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", 0, 0, 0, 0, v9, v7, v12, v13);
  return v10;
}

- (PPMappedFeedback)initWithImplicitlyRejectedString:(id)a3 mappingId:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", 0, 0, 0, v9, 0, v7, v12, v13);
  return v10;
}

- (PPMappedFeedback)initWithImplicitlyEngagedString:(id)a3 mappingId:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", 0, 0, v9, 0, 0, v7, v12, v13);
  return v10;
}

- (PPMappedFeedback)initWithExplicitlyRejectedString:(id)a3 mappingId:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", 0, v9, 0, 0, 0, v7, v12, v13);
  return v10;
}

- (PPMappedFeedback)initWithExplicitlyEngagedString:(id)a3 mappingId:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = -[PPMappedFeedback initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:](self, "initWithExplicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:offeredStrings:mappingId:", v9, 0, 0, 0, 0, v7, v12, v13);
  return v10;
}

@end