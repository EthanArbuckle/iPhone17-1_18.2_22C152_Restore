@interface PFAdjustmentStack
+ (BOOL)isValidEnvelopeDictionary:(id)a3 errors:(id)a4;
- (PFAdjustmentStack)init;
- (PFAdjustmentStack)initWithAdjustments:(id)a3;
- (PFAdjustmentStack)initWithEnvelopeDictionary:(id)a3;
- (id)adjustmentAtIndex:(unint64_t)a3;
- (id)adjustmentsWithIdentifier:(id)a3;
- (id)debugDescription;
- (id)envelopeDictionary;
- (id)firstAdjustmentWithIdentifier:(id)a3;
- (id)maskUUIDs;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation PFAdjustmentStack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskUUIDs, 0);
  objc_storeStrong((id *)&self->_adjustments, 0);
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@:%p adjustments=%@ masks=%@>", objc_opt_class(), self, self->_adjustments, self->_maskUUIDs];
}

- (unint64_t)count
{
  return [(NSArray *)self->_adjustments count];
}

- (id)maskUUIDs
{
  return self->_maskUUIDs;
}

- (id)adjustmentsWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_adjustments;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "identifier", (void)v15);
          if ([v12 isEqual:v4]) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v5, (void)v15);

  return v13;
}

- (id)firstAdjustmentWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = self->_adjustments;
    id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "identifier", (void)v12);
          if ([v10 isEqual:v4])
          {
            id v6 = v9;

            goto LABEL_12;
          }
        }
        id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)adjustmentAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_adjustments objectAtIndex:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_adjustments countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (PFAdjustmentStack)initWithAdjustments:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PFAdjustmentStack *)self init];
  if (v5)
  {
    id v6 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v10 = 0;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v6 addObject:v13];
          long long v14 = [v13 maskUUID];

          if (v14)
          {
            if (!v10)
            {
              v10 = [MEMORY[0x1E4F1CA70] orderedSet];
            }
            long long v15 = [v13 maskUUID];
            [v10 addObject:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];
    adjustments = v5->_adjustments;
    v5->_adjustments = (NSArray *)v16;

    if (v10)
    {
      uint64_t v18 = [MEMORY[0x1E4F1CAA0] orderedSetWithOrderedSet:v10];
      maskUUIDs = v5->_maskUUIDs;
      v5->_maskUUIDs = (NSOrderedSet *)v18;
    }
    id v4 = v21;
  }

  return v5;
}

- (PFAdjustmentStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFAdjustmentStack;
  v2 = [(PFAdjustmentStack *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    adjustments = v2->_adjustments;
    v2->_adjustments = (NSArray *)v3;

    v2->_formatVersion = 1;
  }
  return v2;
}

- (id)envelopeDictionary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_adjustments, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_adjustments;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "archiveDictionary", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v10 setObject:&unk_1EEBF0BA8 forKeyedSubscript:PFAdjustmentEnvelopeEnvelopeVersionKey];
  [v10 setObject:v3 forKeyedSubscript:PFAdjustmentEnvelopeAdjustmentsKey];

  return v10;
}

- (PFAdjustmentStack)initWithEnvelopeDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v28.receiver = self;
    v28.super_class = (Class)PFAdjustmentStack;
    uint64_t v5 = [(PFAdjustmentStack *)&v28 init];
    if (v5)
    {
      id v23 = v4;
      uint64_t v6 = [v4 objectForKeyedSubscript:PFAdjustmentEnvelopeAdjustmentsKey];
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSet];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v9 = v6;
      uint64_t v10 = [(NSOrderedSet *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = [[PFAdjustment alloc] initWithArchiveDictionary:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            if (!v14)
            {

              uint64_t v5 = 0;
              maskUUIDs = v9;
              goto LABEL_17;
            }
            long long v15 = v14;
            [v7 addObject:v14];
            uint64_t v16 = [(PFAdjustment *)v15 maskUUID];
            if (v16) {
              [v8 addObject:v16];
            }
          }
          uint64_t v11 = [(NSOrderedSet *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
      adjustments = v5->_adjustments;
      v5->_adjustments = (NSArray *)v17;

      if (v8)
      {
        uint64_t v19 = [MEMORY[0x1E4F1CAA0] orderedSetWithOrderedSet:v8];
        maskUUIDs = v5->_maskUUIDs;
        v5->_maskUUIDs = (NSOrderedSet *)v19;
LABEL_17:
        id v4 = v23;
      }
      else
      {
        id v4 = v23;
      }
    }
    self = v5;
    id v21 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"envelope must not be nil"];
    id v21 = 0;
  }

  return v21;
}

+ (BOOL)isValidEnvelopeDictionary:(id)a3 errors:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (+[PFAdjustmentSerialization validateArchive:v5 containsEntryWithKey:PFAdjustmentEnvelopeEnvelopeVersionKey ofType:objc_opt_class() errors:v6])
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:PFAdjustmentEnvelopeEnvelopeVersionKey];
    if ([v7 unsignedIntegerValue] != 1)
    {
      long long v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = PFAdjustmentEnvelopeEnvelopeVersionKey;
      v24[0] = v7;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      uint64_t v16 = [v15 errorWithDomain:@"PFAdjustmentErrorDomain" code:4 userInfo:v8];
      [v6 addObject:v16];

      BOOL v14 = 0;
LABEL_20:

      goto LABEL_21;
    }

    if (+[PFAdjustmentSerialization validateArchive:v5 containsEntryWithKey:PFAdjustmentEnvelopeAdjustmentsKey ofType:objc_opt_class() errors:v6])
    {
      [v5 objectForKeyedSubscript:PFAdjustmentEnvelopeAdjustmentsKey];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            if (!+[PFAdjustmentSerialization validateValue:isOfType:errors:](PFAdjustmentSerialization, "validateValue:isOfType:errors:", v13, objc_opt_class(), v6, (void)v18)|| !+[PFAdjustment isValidArchiveDictionary:v13 errors:v6])
            {
              BOOL v14 = 0;
              goto LABEL_19;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          BOOL v14 = 1;
          if (v10) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v14 = 1;
      }
LABEL_19:
      uint64_t v7 = v8;
      goto LABEL_20;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_21:

  return v14;
}

@end