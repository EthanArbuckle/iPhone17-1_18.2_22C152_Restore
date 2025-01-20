@interface IPAAdjustmentStack
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAdjustmentStack:(id)a3;
- (IPAAdjustmentStack)init;
- (IPAAdjustmentVersionInfo)versionInfo;
- (NSArray)adjustments;
- (id)_debugDescriptionSuffix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)minimumVersionForFormat:(id)a3;
- (void)setAdjustments:(id)a3;
- (void)setVersionInfo:(id)a3;
@end

@implementation IPAAdjustmentStack

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustments, 0);
  objc_storeStrong((id *)&self->_versionInfo, 0);
}

- (void)setAdjustments:(id)a3
{
}

- (NSArray)adjustments
{
  return self->_adjustments;
}

- (void)setVersionInfo:(id)a3
{
}

- (IPAAdjustmentVersionInfo)versionInfo
{
  return self->_versionInfo;
}

- (id)_debugDescriptionSuffix
{
  return 0;
}

- (id)debugDescription
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"<%@:%p ", objc_opt_class(), self];
  v4 = [(IPAAdjustmentStack *)self versionInfo];
  [v3 appendFormat:@"versionInfo=%@", v4];

  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
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
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) debugDescription];
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v12 = [v5 componentsJoinedByString:@","];
  [v3 appendFormat:@"adjustments=[%@]", v12];

  v13 = [(IPAAdjustmentStack *)self _debugDescriptionSuffix];
  if (v13)
  {
    [v3 appendString:@" "];
    [v3 appendString:v13];
  }
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToAdjustmentStack:(id)a3
{
  v4 = self->_adjustments;
  v5 = [a3 adjustments];
  uint64_t v6 = [(NSArray *)v4 count];
  if (v6 == [v5 count])
  {
    if (v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6 - 1;
      do
      {
        uint64_t v9 = [(NSArray *)v4 objectAtIndexedSubscript:v7];
        v10 = [v5 objectAtIndexedSubscript:v7];
        int v11 = [v9 isEqualToAdjustment:v10];

        if (!v11) {
          break;
        }
      }
      while (v8 != v7++);
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(IPAAdjustmentStack *)self isEqualToAdjustmentStack:v4];

  return v5;
}

- (id)minimumVersionForFormat:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v5 = [(IPAAdjustmentStack *)self versionInfo];
  [v4 setVersionInfo:v5];

  uint64_t v6 = [(IPAAdjustmentStack *)self adjustments];
  [v4 setAdjustments:v6];

  return v4;
}

- (IPAAdjustmentStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)IPAAdjustmentStack;
  v2 = [(IPAAdjustmentStack *)&v6 init];
  v3 = v2;
  if (v2)
  {
    adjustments = v2->_adjustments;
    v2->_adjustments = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

@end