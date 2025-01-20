@interface CACRecordedUserAction
+ (BOOL)supportsSecureCoding;
- (BOOL)canIgnoreFailure;
- (BOOL)isReplayableGesture;
- (BOOL)isSpokenCommand;
- (CACRecordedUserAction)initWithCoder:(id)a3;
- (CACRecordedUserAction)initWithSpokenCommand:(id)a3;
- (CACRecordedUserActionFlow)ownerFlow;
- (CGRect)_rectFromDictionary:(id)a3;
- (id)_derivedTargetAttributesFromSpokenCommand:(id)a3;
- (id)_dictionaryFromRect:(CGRect)a3;
- (id)_labeledElementsFromMatchingCriteria:(id)a3;
- (id)description;
- (id)plistDescription;
- (id)spokenCommand;
- (void)beginExecutingWithCompletionBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOwnerFlow:(id)a3;
@end

@implementation CACRecordedUserAction

- (CACRecordedUserAction)initWithSpokenCommand:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CACRecordedUserAction;
  v6 = [(CACRecordedUserAction *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong(&v6->_object, a3);
    uint64_t v8 = [v5 identifier];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    uint64_t v10 = [(CACRecordedUserAction *)v7 _derivedTargetAttributesFromSpokenCommand:v5];
    targetAttributes = v7->_targetAttributes;
    v7->_targetAttributes = (NSDictionary *)v10;
  }
  return v7;
}

- (id)spokenCommand
{
  if ([(CACRecordedUserAction *)self isSpokenCommand]) {
    id object = self->_object;
  }
  else {
    id object = 0;
  }
  return object;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"Version"];
  [v4 encodeInteger:self->_type forKey:@"Type"];
  [v4 encodeObject:self->_identifier forKey:@"CommandIdentifier"];
  [v4 encodeObject:self->_targetAttributes forKey:@"TargetAttributes"];
  [v4 encodeBool:self->_canIgnoreFailure forKey:@"CanIgnoreFailure"];
}

- (CACRecordedUserAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CACRecordedUserAction;
  id v5 = [(CACRecordedUserAction *)&v20 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"Type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CommandIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    objc_super v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"TargetAttributes"];
    targetAttributes = v5->_targetAttributes;
    v5->_targetAttributes = (NSDictionary *)v14;

    v5->_canIgnoreFailure = [v4 decodeBoolForKey:@"CanIgnoreFailure"];
    if (v5->_type == 1)
    {
      if (v5->_identifier)
      {
        v16 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        uint64_t v17 = [v16 copySupportedCommandWithIdentifier:v5->_identifier];
        id object = v5->_object;
        v5->_id object = (id)v17;

        [v5->_object setExecutedIndirectly:1];
      }
    }
  }

  return v5;
}

- (id)_dictionaryFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = objc_alloc(NSDictionary);
  *(float *)&double v8 = x;
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  *(float *)&double v10 = y;
  uint64_t v11 = [NSNumber numberWithFloat:v10];
  *(float *)&double v12 = width;
  objc_super v13 = [NSNumber numberWithFloat:v12];
  *(float *)&double v14 = height;
  v15 = [NSNumber numberWithFloat:v14];
  v16 = objc_msgSend(v7, "initWithObjectsAndKeys:", v9, @"x", v11, @"y", v13, @"width", v15, @"height", 0);

  return v16;
}

- (CGRect)_rectFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"x"];
  [v4 floatValue];
  double v6 = v5;
  id v7 = [v3 objectForKey:@"y"];
  [v7 floatValue];
  double v9 = v8;
  double v10 = [v3 objectForKey:@"width"];
  [v10 floatValue];
  double v12 = v11;
  objc_super v13 = [v3 objectForKey:@"height"];

  [v13 floatValue];
  double v15 = v14;

  double v16 = v6;
  double v17 = v9;
  double v18 = v12;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (id)_derivedTargetAttributesFromSpokenCommand:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = objc_opt_new();
  v59 = self;
  if (self->_type == 1)
  {
    id v51 = v4;
    double v6 = [v4 recognizedParameters];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v7 = [v6 allKeys];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v69 objects:v75 count:16];
    if (!v8) {
      goto LABEL_57;
    }
    uint64_t v9 = v8;
    unint64_t v10 = 0x263EFF000uLL;
    float v11 = (void *)MEMORY[0x263F78C38];
    uint64_t v12 = *(void *)v70;
    v53 = v6;
    v54 = v5;
    v52 = v7;
    uint64_t v56 = *(void *)v70;
    while (1)
    {
      uint64_t v13 = 0;
      uint64_t v55 = v9;
      do
      {
        if (*(void *)v70 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v61 = v13;
        float v14 = *(void **)(*((void *)&v69 + 1) + 8 * v13);
        if (([v14 isEqualToString:kCACCommandParameterText] & 1) != 0
          || [v14 isEqualToString:kCACCommandParameterTextVariants])
        {
          double v15 = [v6 objectForKey:v14];
          [v5 setObject:v15 forKey:v14];
          goto LABEL_10;
        }
        uint64_t v16 = *MEMORY[0x263F78BF8];
        v74[0] = *v11;
        v74[1] = v16;
        uint64_t v17 = *MEMORY[0x263F78C58];
        v74[2] = *MEMORY[0x263F78C00];
        v74[3] = v17;
        uint64_t v18 = *MEMORY[0x263F78C30];
        v74[4] = *MEMORY[0x263F78C28];
        v74[5] = v18;
        uint64_t v19 = *MEMORY[0x263F78C48];
        v74[6] = *MEMORY[0x263F78BF0];
        v74[7] = v19;
        uint64_t v20 = *MEMORY[0x263F78C20];
        v74[8] = *MEMORY[0x263F78C18];
        v74[9] = v20;
        v21 = [*(id *)(v10 + 2240) arrayWithObjects:v74 count:10];
        int v22 = [v21 containsObject:v14];

        uint64_t v12 = v56;
        if (v22)
        {
          double v15 = objc_opt_new();
          v58 = v14;
          v23 = [v6 objectForKey:v14];
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          v24 = [v23 allKeys];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v65 objects:v73 count:16];
          if (!v25) {
            goto LABEL_55;
          }
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v66;
          v60 = v24;
          while (1)
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v66 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v65 + 1) + 8 * v28);
              if (([v29 isEqualToString:kCACCommandParameterText] & 1) != 0
                || ([v29 isEqualToString:kCACCommandParameterTextVariants] & 1) != 0
                || ([v29 isEqualToString:kCACCommandParameterMatchingApps] & 1) != 0
                || ([v29 isEqualToString:kCACCommandParameterAppIdentifier] & 1) != 0
                || [v29 isEqualToString:kCACCommandParameterAttributedText])
              {
                v30 = [v23 objectForKey:v29];
                [v15 setObject:v30 forKey:v29];
                goto LABEL_25;
              }
              if (([v29 isEqualToString:kCACCommandParameterLabeledElement] & 1) != 0
                || [v29 isEqualToString:kCACCommandParameterLabeledElementForDisambiguation])
              {
                v30 = [v23 objectForKey:v29];
                v31 = [v30 element];
                v63 = v31;
                v64 = objc_opt_new();
                if (v31)
                {
                  [v31 frame];
                  -[CACRecordedUserAction _dictionaryFromRect:](v59, "_dictionaryFromRect:");
                  v33 = v32 = v31;
                  [v64 setObject:v33 forKey:@"ScreenRect"];

                  v34 = [v32 uiElement];
                  v35 = [v34 stringWithAXAttribute:5019];

                  if ([v35 length]) {
                    [v64 setObject:v35 forKey:@"AXElementIdentifier"];
                  }
                  v62 = v35;
                  if ([v58 isEqualToString:*MEMORY[0x263F78C58]])
                  {
                    v36 = [v23 objectForKey:kCACCommandParameterText];
                    if ([v36 length]) {
                      [v64 setObject:v36 forKey:@"AXElementLabel"];
                    }
                    [v64 setObject:@"ItemName" forKey:@"RecordedApproach"];
                    goto LABEL_51;
                  }
                  if (([v58 isEqualToString:*MEMORY[0x263F78C28]] & 1) != 0
                    || [v58 isEqualToString:*MEMORY[0x263F78C30]])
                  {
                    v45 = [v63 recognitionStrings];
                    v36 = [v45 firstObject];

                    if ([v36 length]) {
                      [v64 setObject:v36 forKey:@"AXElementLabel"];
                    }
                    v46 = [v23 objectForKey:kCACCommandParameterText];
                    if (v46) {
                      [v64 setObject:v46 forKey:@"NumberedLabel"];
                    }
                    [v64 setObject:@"ItemNumber" forKey:@"RecordedApproach"];

LABEL_51:
                  }
                  v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v29, "isEqualToString:", kCACCommandParameterLabeledElementForDisambiguation));
                  v44 = v64;
                  [v64 setObject:v47 forKey:@"RequiredDisambiguation"];

                  [v15 setObject:v64 forKey:@"MatchingCriteria"];
                }
                else
                {
                  v37 = [0 recognitionStrings];
                  v38 = [v37 firstObject];

                  if ([v38 length]) {
                    [v64 setObject:v38 forKey:@"AXElementLabel"];
                  }
                  v62 = v38;
                  [v30 rectangle];
                  v39 = -[CACRecordedUserAction _dictionaryFromRect:](v59, "_dictionaryFromRect:");
                  [v64 setObject:v39 forKey:@"ScreenRect"];

                  uint64_t v40 = [v30 numberedLabel];
                  if (v40) {
                    [v64 setObject:v40 forKey:@"NumberedLabel"];
                  }
                  v57 = (void *)v40;
                  v41 = [v30 element];
                  v42 = [v41 uiElement];
                  v43 = [v42 stringWithAXAttribute:5019];

                  v44 = v64;
                  if ([v43 length]) {
                    [v64 setObject:v43 forKey:@"AXElementIdentifier"];
                  }
                  [v64 setObject:@"GridNumber" forKey:@"RecordedApproach"];
                  [v15 setObject:v64 forKey:@"MatchingCriteria"];
                }
                v24 = v60;
LABEL_25:
              }
              ++v28;
            }
            while (v26 != v28);
            uint64_t v48 = [v24 countByEnumeratingWithState:&v65 objects:v73 count:16];
            uint64_t v26 = v48;
            if (!v48)
            {
LABEL_55:

              float v5 = v54;
              [v54 setObject:v15 forKey:v58];

              id v7 = v52;
              double v6 = v53;
              uint64_t v9 = v55;
              uint64_t v12 = v56;
              unint64_t v10 = 0x263EFF000;
              float v11 = (void *)MEMORY[0x263F78C38];
LABEL_10:

              break;
            }
          }
        }
        uint64_t v13 = v61 + 1;
      }
      while (v61 + 1 != v9);
      uint64_t v49 = [v7 countByEnumeratingWithState:&v69 objects:v75 count:16];
      uint64_t v9 = v49;
      if (!v49)
      {
LABEL_57:

        id v4 = v51;
        break;
      }
    }
  }

  return v5;
}

- (id)_labeledElementsFromMatchingCriteria:(id)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  float v5 = [v4 labeledScreenElementsCollection];
  double v6 = (void *)[v5 copyTableOfCollectedElementsByTitle];

  id v7 = [v3 objectForKey:@"AXElementLabel"];
  uint64_t v76 = v3;
  if (v7)
  {
    uint64_t v8 = [v3 objectForKey:@"AXElementLabel"];
    uint64_t v9 = [v8 lowercaseString];
    unint64_t v10 = [v6 objectForKey:v9];
  }
  else
  {
    unint64_t v10 = 0;
  }

  if ((unint64_t)[v10 count] >= 2)
  {
    float v11 = [v3 objectForKey:@"RecordedApproach"];
    char v12 = [v11 isEqualToString:@"ItemName"];

    if ((v12 & 1) == 0)
    {

      unint64_t v10 = 0;
    }
  }
  if ([v10 count])
  {
    id v13 = v10;
    float v14 = 0;
LABEL_9:
    id v15 = 0;
    id v16 = 0;
    goto LABEL_52;
  }
  long long v68 = v10;
  long long v69 = v6;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = [v6 allValues];
  uint64_t v17 = v3;
  uint64_t v72 = [obj countByEnumeratingWithState:&v81 objects:v91 count:16];
  id v18 = 0;
  id v15 = 0;
  id v16 = 0;
  if (v72)
  {
    uint64_t v71 = *(void *)v82;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v82 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v73 = v19;
        uint64_t v20 = *(void **)(*((void *)&v81 + 1) + 8 * v19);
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v74 = v20;
        uint64_t v21 = [v74 countByEnumeratingWithState:&v77 objects:v90 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v78;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v78 != v23) {
                objc_enumerationMutation(v74);
              }
              uint64_t v25 = *(void **)(*((void *)&v77 + 1) + 8 * i);
              uint64_t v26 = [v17 objectForKey:@"NumberedLabel"];
              uint64_t v27 = (void *)v26;
              if (!v15 && v26)
              {
                uint64_t v28 = [v25 numberedLabel];
                int v29 = [v28 isEqualToString:v27];

                if (v29) {
                  id v15 = v25;
                }
                else {
                  id v15 = 0;
                }
                uint64_t v17 = v76;
              }
              id v30 = v15;
              uint64_t v31 = [v17 objectForKey:@"AXElementIdentifier"];
              v32 = (void *)v31;
              id v33 = v18;
              if (!v16 && v31)
              {
                v34 = [v25 axIdentifier];
                int v35 = [v34 isEqualToString:v32];

                if (v35) {
                  id v16 = v25;
                }
                else {
                  id v16 = 0;
                }
              }
              v36 = [v76 objectForKey:@"ScreenRect"];
              [(CACRecordedUserAction *)self _rectFromDictionary:v36];
              CGFloat v38 = v37;
              CGFloat v40 = v39;
              CGFloat v42 = v41;
              CGFloat v44 = v43;

              id v18 = v33;
              id v15 = v30;
              if (!v18)
              {
                v93.origin.double x = v38;
                v93.origin.double y = v40;
                v93.size.double width = v42;
                v93.size.double height = v44;
                if (CGRectIsEmpty(v93)) {
                  goto LABEL_35;
                }
                [v25 rectangle];
                v95.origin.double x = v45;
                v95.origin.double y = v46;
                v95.size.double width = v47;
                v95.size.double height = v48;
                v94.origin.double x = v38;
                v94.origin.double y = v40;
                v94.size.double width = v42;
                v94.size.double height = v44;
                if (!CGRectEqualToRect(v94, v95)) {
LABEL_35:
                }
                  id v18 = 0;
                else {
                  id v18 = v25;
                }
              }

              uint64_t v17 = v76;
            }
            uint64_t v22 = [v74 countByEnumeratingWithState:&v77 objects:v90 count:16];
          }
          while (v22);
        }

        uint64_t v19 = v73 + 1;
      }
      while (v73 + 1 != v72);
      uint64_t v72 = [obj countByEnumeratingWithState:&v81 objects:v91 count:16];
    }
    while (v72);
  }
  id v49 = v18;

  v50 = [v17 objectForKey:@"RecordedApproach"];
  if ([v50 isEqualToString:@"ItemNumber"])
  {

    unint64_t v10 = v68;
    double v6 = v69;
LABEL_43:
    if (!v15)
    {
      float v14 = v49;
      if (v16)
      {
        id v88 = v16;
        id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
        id v15 = 0;
        goto LABEL_52;
      }
      if (!v49)
      {
        id v15 = 0;
        id v16 = 0;
        id v13 = 0;
        goto LABEL_52;
      }
      id v87 = v49;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
      goto LABEL_9;
    }
    id v89 = v15;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
LABEL_51:
    float v14 = v49;
    goto LABEL_52;
  }
  id v51 = [v17 objectForKey:@"RecordedApproach"];
  int v52 = [v51 isEqualToString:@"ItemName"];

  unint64_t v10 = v68;
  double v6 = v69;
  if (v52) {
    goto LABEL_43;
  }
  v53 = [v76 objectForKey:@"RecordedApproach"];
  int v54 = [v53 isEqualToString:@"GridNumber"];

  if (!v54)
  {
    id v13 = 0;
    goto LABEL_51;
  }
  if (v49)
  {
    float v14 = v49;
    id v86 = v49;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
  }
  else
  {
    v57 = [v76 objectForKey:@"ScreenRect"];
    [(CACRecordedUserAction *)self _rectFromDictionary:v57];
    double v59 = v58;
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;

    long long v66 = [CACLabeledElement alloc];
    long long v67 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v66, "initWithElement:recognitionStrings:rectangle:", 0, MEMORY[0x263EFFA68], v59, v61, v63, v65);
    v85 = v67;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];

    float v14 = 0;
  }
LABEL_52:
  id v55 = v13;

  return v55;
}

- (void)beginExecutingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (self->_type == 1)
  {
    float v5 = dispatch_get_global_queue(21, 0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__CACRecordedUserAction_beginExecutingWithCompletionBlock___block_invoke;
    v7[3] = &unk_264D116E0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    double v6 = CACMakeError(3006, 0);
    (*((void (**)(id, void *))v4 + 2))(v4, v6);
  }
}

void __59__CACRecordedUserAction_beginExecutingWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = 12;
  while (![v2 isListening])
  {
    if (v3 < 1) {
      goto LABEL_11;
    }
LABEL_9:
    usleep(0x3D090u);
    --v3;
  }
  id v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  if ([v4 isSynchronizingRecognizers])
  {
LABEL_6:

    if (v3 <= 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  float v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  if ([v5 isFetchingElements])
  {

    goto LABEL_6;
  }

LABEL_11:
  if (![v2 isListening])
  {
    uint64_t v48 = *(void *)(v1 + 40);
    id v49 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandPlayback.Error.NotAppropriateForContext"];
    v50 = CACMakeError(3002, v49);
    (*(void (**)(uint64_t, void *))(v48 + 16))(v48, v50);

    goto LABEL_54;
  }
  id v56 = v2;
  double v6 = objc_opt_new();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = [*(id *)(*(void *)(v1 + 32) + 24) allKeys];
  v57 = v6;
  uint64_t v62 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (!v62)
  {
LABEL_44:

    id v2 = v56;
LABEL_52:
    int v54 = v57;
    objc_msgSend(v2, "setRecognizedParameters:", v57, v56);
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __59__CACRecordedUserAction_beginExecutingWithCompletionBlock___block_invoke_2;
    v63[3] = &unk_264D11FF8;
    id v64 = *(id *)(v1 + 40);
    [v2 setCompletionBlock:v63];
    id v55 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v55 handleRecognizedCommand:v2];

    v53 = v64;
    goto LABEL_53;
  }
  uint64_t v61 = *(void *)v66;
  unint64_t v7 = 0x263EFF000uLL;
  id v8 = (void *)MEMORY[0x263F78C20];
  uint64_t v59 = v1;
  while (2)
  {
    uint64_t v9 = 0;
LABEL_15:
    if (*(void *)v66 != v61) {
      objc_enumerationMutation(obj);
    }
    uint64_t v10 = *(void *)(*((void *)&v65 + 1) + 8 * v9);
    v71[0] = kCACCommandParameterText;
    v71[1] = kCACCommandParameterTextVariants;
    uint64_t v11 = *MEMORY[0x263F78BF8];
    v71[2] = *MEMORY[0x263F78C38];
    v71[3] = v11;
    uint64_t v12 = *MEMORY[0x263F78BF0];
    v71[4] = *MEMORY[0x263F78C00];
    v71[5] = v12;
    uint64_t v13 = *MEMORY[0x263F78C18];
    v71[6] = *MEMORY[0x263F78C48];
    v71[7] = v13;
    v71[8] = *v8;
    float v14 = objc_msgSend(*(id *)(v7 + 2240), "arrayWithObjects:count:", v71, 9, v56);
    int v15 = [v14 containsObject:v10];

    if (v15)
    {
      id v16 = [*(id *)(*(void *)(v1 + 32) + 24) objectForKey:v10];
      [v6 setObject:v16 forKey:v10];
      goto LABEL_41;
    }
    uint64_t v70 = *MEMORY[0x263F78C58];
    uint64_t v17 = [*(id *)(v7 + 2240) arrayWithObjects:&v70 count:1];
    int v18 = [v17 containsObject:v10];

    if (!v18)
    {
      uint64_t v25 = *MEMORY[0x263F78C30];
      v69[0] = *MEMORY[0x263F78C28];
      v69[1] = v25;
      uint64_t v26 = [*(id *)(v7 + 2240) arrayWithObjects:v69 count:2];
      int v27 = [v26 containsObject:v10];

      unint64_t v7 = 0x263EFF000;
      if (v27)
      {
        uint64_t v28 = objc_opt_new();
        int v29 = *(id **)(v1 + 32);
        id v30 = [v29[3] objectForKey:v10];
        uint64_t v31 = [v30 objectForKey:@"MatchingCriteria"];
        uint64_t v23 = [v29 _labeledElementsFromMatchingCriteria:v31];

        if ([v23 count] != 1)
        {
          id v51 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandPlayback.Error.CannotFindElementNumber"];
          v53 = CACMakeError(3005, v51);
          goto LABEL_50;
        }
        v32 = [v23 firstObject];
        [v28 setObject:v32 forKey:kCACCommandParameterLabeledElement];

        [v6 setObject:v28 forKey:v10];
        unint64_t v7 = 0x263EFF000;
        id v16 = v28;
        goto LABEL_41;
      }
LABEL_42:
      if (++v9 == v62)
      {
        uint64_t v62 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
        if (v62) {
          continue;
        }
        goto LABEL_44;
      }
      goto LABEL_15;
    }
    break;
  }
  double v58 = objc_opt_new();
  uint64_t v19 = *(id **)(v1 + 32);
  uint64_t v20 = [v19[3] objectForKey:v10];
  uint64_t v21 = [v20 objectForKey:@"MatchingCriteria"];
  uint64_t v22 = [v19 _labeledElementsFromMatchingCriteria:v21];

  if ([v22 count])
  {
    uint64_t v23 = v22;
    uint64_t v24 = v59;
  }
  else
  {
    unint64_t v33 = 20;
    uint64_t v24 = v59;
    do
    {
      v34 = *(id **)(v59 + 32);
      int v35 = [v34[3] objectForKey:v10];
      v36 = [v35 objectForKey:@"MatchingCriteria"];
      uint64_t v23 = [v34 _labeledElementsFromMatchingCriteria:v36];

      usleep(0x3D090u);
      if ([v23 count]) {
        BOOL v37 = 0;
      }
      else {
        BOOL v37 = v33 > 1;
      }
      --v33;
      uint64_t v22 = v23;
    }
    while (v37);
  }
  CGFloat v38 = [*(id *)(*(void *)(v24 + 32) + 24) objectForKey:v10];
  double v39 = [v38 objectForKey:@"MatchingCriteria"];
  CGFloat v40 = [v39 objectForKey:@"RequiredDisambiguation"];
  int v41 = [v40 BOOLValue];

  if ([v23 count] == 1)
  {
    CGFloat v42 = [v23 firstObject];
    id v16 = v58;
    [v58 setObject:v42 forKey:kCACCommandParameterLabeledElement];

    double v6 = v57;
    unint64_t v7 = 0x263EFF000;
    uint64_t v1 = v59;
    id v8 = (void *)MEMORY[0x263F78C20];
    if (v41)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v59 + 32) + 48));
      [WeakRetained setSkipNextAction:1];
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  unint64_t v44 = [v23 count];
  double v6 = v57;
  uint64_t v1 = v59;
  id v8 = (void *)MEMORY[0x263F78C20];
  if (v44 >= 2)
  {
    unint64_t v7 = 0x263EFF000;
    if (!v41) {
      goto LABEL_46;
    }
    id v45 = objc_loadWeakRetained((id *)(*(void *)(v59 + 32) + 48));
    if ([v45 doesNextSpokenCommandMatchIdentifier:@"System.OverlayChooseLabel"])
    {
    }
    else
    {
      id v46 = objc_loadWeakRetained((id *)(*(void *)(v59 + 32) + 48));
      int v47 = [v46 doesNextSpokenCommandMatchIdentifier:@"System.OverlayChooseLabelWithoutPrefix"];

      unint64_t v7 = 0x263EFF000;
      if (!v47)
      {
LABEL_46:
        id v51 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandPlayback.Error.UnexpectedDisambiguation"];
        uint64_t v52 = 3003;
        goto LABEL_49;
      }
    }
    WeakRetained = [v23 firstObject];
    id v16 = v58;
    [v58 setObject:WeakRetained forKey:kCACCommandParameterLabeledElementForDisambiguation];
LABEL_39:

LABEL_40:
    [v6 setObject:v16 forKey:v10];

LABEL_41:
    goto LABEL_42;
  }
  id v51 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandPlayback.Error.CannotFindElementName"];
  uint64_t v52 = 3004;
LABEL_49:
  v53 = CACMakeError(v52, v51);
  uint64_t v28 = v58;
LABEL_50:

  id v2 = v56;
  if (!v53) {
    goto LABEL_52;
  }
  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
  int v54 = v57;
LABEL_53:

LABEL_54:
}

uint64_t __59__CACRecordedUserAction_beginExecutingWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isSpokenCommand
{
  return self->_type == 1;
}

- (BOOL)isReplayableGesture
{
  return self->_type == 2;
}

- (BOOL)canIgnoreFailure
{
  return self->_canIgnoreFailure;
}

- (id)plistDescription
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  id v4 = [NSNumber numberWithInteger:self->_type];
  [v3 setObject:v4 forKey:@"UserActionTypeValue"];

  uint64_t v22 = v3;
  if (self->_object)
  {
    float v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    [v3 setObject:v6 forKey:@"UserActionTypeDescription"];
  }
  else
  {
    [v3 setObject:@"Unknown" forKey:@"UserActionTypeDescription"];
  }
  unint64_t v7 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = self->_targetAttributes;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    uint64_t v12 = MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if ([&unk_26EB4D070 containsObject:v14])
        {
          [v7 setObject:v12 forKey:v14];
        }
        else
        {
          int v15 = [(NSDictionary *)self->_targetAttributes objectForKey:v14];
          [v7 setObject:v15 forKey:v14];
        }
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  [v22 setObject:v7 forKey:@"UserActionTargetAttributes"];
  if (self->_type == 1)
  {
    id v16 = self->_object;
    uint64_t v17 = [v16 identifier];
    [v22 setObject:v17 forKey:@"SpokenCommandIdentifier"];

    if ([v16 action])
    {
      int v18 = NSStringFromSelector((SEL)[v16 action]);
      [v22 setObject:v18 forKey:@"SpokenCommandAction"];
    }
    uint64_t v19 = [v16 contextEvaluation];

    if (v19)
    {
      uint64_t v20 = [v16 contextEvaluation];
      [v22 setObject:v20 forKey:@"SpokenCommandContext"];
    }
  }

  return v22;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"User Action: (%ld) %@, attributes: %@", self->_type, self->_object, self->_targetAttributes];
}

- (CACRecordedUserActionFlow)ownerFlow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ownerFlow);
  return (CACRecordedUserActionFlow *)WeakRetained;
}

- (void)setOwnerFlow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ownerFlow);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_targetAttributes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end