@interface WBSBrowsingAssistantAvailabilityLabels
+ (id)possibleLabelsForContentOptions:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)representsSupersetOfContentOptions:(unint64_t)a3;
- (WBSBrowsingAssistantAvailabilityLabels)initWithContentOptions:(unint64_t)a3 template:(int64_t)a4;
- (WBSBrowsingAssistantAvailabilityLabels)initWithRepresentedOptions:(id)a3 groups:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)possibleLabelsByIncorporatingContentOptions:(unint64_t)a3 intoLabelsAfterIndex:(unint64_t)a4;
- (id)textForOptionsAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)representedOptionsAtIndex:(unint64_t)a3;
@end

@implementation WBSBrowsingAssistantAvailabilityLabels

+ (id)possibleLabelsForContentOptions:(unint64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = [[WBSBrowsingAssistantAvailabilityLabels alloc] initWithContentOptions:a3 template:0];
    int8x8_t v5 = [(WBSBrowsingAssistantAvailabilityLabels *)v4 representedOptionsAtIndex:0];
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] == 1)
    {
      v15[0] = v4;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    else
    {
      v8 = [[WBSBrowsingAssistantAvailabilityLabels alloc] initWithContentOptions:a3 template:2];
      v9 = v8;
      if ((~v5.i32[0] & 0x21) != 0 || (*(void *)&v5 & 0xFFFFFFFFFFFFFFDELL) == 0)
      {
        v13[0] = v4;
        v13[1] = v8;
        v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      }
      else
      {
        v11 = [[WBSBrowsingAssistantAvailabilityLabels alloc] initWithContentOptions:a3 template:1];
        v14[0] = v4;
        v14[1] = v11;
        v14[2] = v9;
        v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
      }
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

- (WBSBrowsingAssistantAvailabilityLabels)initWithContentOptions:(unint64_t)a3 template:(int64_t)a4
{
  char v5 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  if ((v5 & 0x61) == 0) {
    goto LABEL_9;
  }
  switch(a4)
  {
    case 2:
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __74__WBSBrowsingAssistantAvailabilityLabels_initWithContentOptions_template___block_invoke_2;
      v19 = &unk_1E5E46DB0;
      id v20 = v7;
      id v21 = v8;
      WBSBrowsingAssistantContentOptionsEnumerateOptionsUsingBlock();

      v10 = v20;
LABEL_8:

      break;
    case 1:
      v11 = [NSNumber numberWithUnsignedInteger:v5 & 0x21];
      [v7 addObject:v11];

      [v8 addObject:&unk_1F0341A00];
      id v22 = v7;
      id v23 = v8;
      WBSBrowsingAssistantContentOptionsEnumerateOptionsUsingBlock();

      v10 = v22;
      goto LABEL_8;
    case 0:
      v9 = [NSNumber numberWithUnsignedInteger:v5 & 0x61];
      [v7 addObject:v9];

      [v8 addObject:&unk_1F0341A00];
      break;
  }
LABEL_9:
  uint64_t v12 = WBSBrowsingAssistantContentOptionsMostProminentRemoteOption();
  if (v12)
  {
    v13 = [NSNumber numberWithUnsignedInteger:v12];
    [v7 addObject:v13];

    [v8 addObject:&unk_1F0341A18];
  }
  v14 = -[WBSBrowsingAssistantAvailabilityLabels initWithRepresentedOptions:groups:](self, "initWithRepresentedOptions:groups:", v7, v8, v16, v17, v18, v19);

  return v14;
}

uint64_t __74__WBSBrowsingAssistantAvailabilityLabels_initWithContentOptions_template___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  [v3 addObject:v4];

  char v5 = *(void **)(a1 + 40);
  return [v5 addObject:&unk_1F0341A00];
}

uint64_t __74__WBSBrowsingAssistantAvailabilityLabels_initWithContentOptions_template___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  [v3 addObject:v4];

  char v5 = *(void **)(a1 + 40);
  return [v5 addObject:&unk_1F0341A00];
}

- (WBSBrowsingAssistantAvailabilityLabels)initWithRepresentedOptions:(id)a3 groups:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)WBSBrowsingAssistantAvailabilityLabels;
  id v5 = a4;
  id v6 = a3;
  v7 = [(WBSBrowsingAssistantAvailabilityLabels *)&v13 init];
  uint64_t v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  representedOptions = v7->_representedOptions;
  v7->_representedOptions = (NSArray *)v8;

  uint64_t v10 = [v5 copy];
  representedOptionsGroups = v7->_representedOptionsGroups;
  v7->_representedOptionsGroups = (NSArray *)v10;

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = v3;
  if (self->_previouslyConsumedOptions) {
    objc_msgSend(v3, "appendFormat:", @"; previousOptions = %lu", self->_previouslyConsumedOptions);
  }
  [v4 appendFormat:@"; labels = {\n"];
  unint64_t v5 = [(WBSBrowsingAssistantAvailabilityLabels *)self count];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [(WBSBrowsingAssistantAvailabilityLabels *)self textForOptionsAtIndex:i];
      unint64_t v9 = [(WBSBrowsingAssistantAvailabilityLabels *)self representedOptionsAtIndex:i];
      uint64_t v10 = [(NSArray *)self->_representedOptionsGroups objectAtIndexedSubscript:i];
      objc_msgSend(v4, "appendFormat:", @"\t%lu = \"%@\" (options = %lu; group = %lu),\n",
        i,
        v8,
        v9,
        [v10 unsignedIntegerValue]);
    }
  }
  [v4 appendString:@"}>"];
  return v4;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = v3;
  if (self->_previouslyConsumedOptions) {
    objc_msgSend(v3, "appendFormat:", @"; previousOptions = %lu", self->_previouslyConsumedOptions);
  }
  [v4 appendString:@"; labels ="];
  unint64_t v5 = [(WBSBrowsingAssistantAvailabilityLabels *)self count];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = 0;
    unint64_t v8 = v5 - 1;
    do
    {
      unint64_t v9 = [(WBSBrowsingAssistantAvailabilityLabels *)self textForOptionsAtIndex:v7];
      [v4 appendFormat:@" \"%@\"", v9];

      if (v7 < v8) {
        [v4 appendString:@","];
      }
      ++v7;
    }
    while (v6 != v7);
  }
  [v4 appendString:@">"];
  return v4;
}

- (unint64_t)count
{
  return [(NSArray *)self->_representedOptions count];
}

- (id)textForOptionsAtIndex:(unint64_t)a3
{
  labels = self->_labels;
  if (!labels)
  {
    unint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    NSUInteger v8 = [(NSArray *)self->_representedOptions count];
    if (v8)
    {
      NSUInteger v9 = v8;
      uint64_t v10 = 0;
      while (1)
      {
        v11 = [(NSArray *)self->_representedOptions objectAtIndexedSubscript:v10];
        uint64_t v12 = [v11 unsignedIntegerValue];
        objc_super v13 = [(NSArray *)self->_representedOptionsGroups objectAtIndexedSubscript:v10];
        uint64_t v14 = [v13 integerValue];
        uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
        v15.i16[0] = vaddlv_u8(v15);
        if (v15.u32[0] == 1 || v14 == 1) {
          break;
        }
        if (!v14)
        {
          if (v12 > 95)
          {
            if (v12 != 96)
            {
              v3 = &stru_1F031A860;
              if (v12 != 97) {
                goto LABEL_13;
              }
            }
          }
          else if (v12 != 33)
          {
            v3 = &stru_1F031A860;
            if (v12 != 65) {
              goto LABEL_13;
            }
          }
          uint64_t v16 = _WBSLocalizedString();
          goto LABEL_12;
        }
LABEL_13:
        [(NSArray *)v7 addObject:v3];

        if (v9 == ++v10) {
          goto LABEL_18;
        }
      }
      uint64_t v16 = WBSBrowsingAssistantContentTypeAvailabilityLabel();
LABEL_12:
      v3 = (__CFString *)v16;
      goto LABEL_13;
    }
LABEL_18:
    uint64_t v17 = self->_labels;
    self->_labels = v7;

    labels = self->_labels;
  }
  return [(NSArray *)labels objectAtIndexedSubscript:a3];
}

- (unint64_t)representedOptionsAtIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_representedOptions objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)representsSupersetOfContentOptions:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t previouslyConsumedOptions = self->_previouslyConsumedOptions;
  unint64_t v5 = self->_representedOptions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        previouslyConsumedOptions |= objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "unsignedIntegerValue", (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return (a3 & ~previouslyConsumedOptions) == 0;
}

- (id)possibleLabelsByIncorporatingContentOptions:(unint64_t)a3 intoLabelsAfterIndex:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  unint64_t previouslyConsumedOptions = self->_previouslyConsumedOptions;
  representedOptions = self->_representedOptions;
  unint64_t v23 = previouslyConsumedOptions;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  unint64_t v19 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __107__WBSBrowsingAssistantAvailabilityLabels_possibleLabelsByIncorporatingContentOptions_intoLabelsAfterIndex___block_invoke;
  v15[3] = &unk_1E5E46DD8;
  v15[5] = &v16;
  v15[6] = a4;
  v15[4] = &v20;
  [(NSArray *)representedOptions enumerateObjectsUsingBlock:v15];
  v17[3] &= ~v21[3];
  +[WBSBrowsingAssistantAvailabilityLabels possibleLabelsForContentOptions:](WBSBrowsingAssistantAvailabilityLabels, "possibleLabelsForContentOptions:");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        *(void *)(*(void *)(*((void *)&v11 + 1) + 8 * i) + 8) = v21[3];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v24 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v6;
}

uint64_t __107__WBSBrowsingAssistantAvailabilityLabels_possibleLabelsByIncorporatingContentOptions_intoLabelsAfterIndex___block_invoke(void *a1, void *a2, unint64_t a3)
{
  unint64_t v5 = a1[6];
  uint64_t result = [a2 unsignedIntegerValue];
  if (v5 <= a3) {
    uint64_t v7 = a1[5];
  }
  else {
    uint64_t v7 = a1[4];
  }
  *(void *)(*(void *)(v7 + 8) + 24) |= result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (WBSBrowsingAssistantAvailabilityLabels *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      if ([(NSArray *)self->_representedOptions isEqualToArray:v5->_representedOptions]) {
        BOOL v6 = self->_previouslyConsumedOptions == v5->_previouslyConsumedOptions;
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_representedOptionsGroups, 0);
  objc_storeStrong((id *)&self->_representedOptions, 0);
}

@end