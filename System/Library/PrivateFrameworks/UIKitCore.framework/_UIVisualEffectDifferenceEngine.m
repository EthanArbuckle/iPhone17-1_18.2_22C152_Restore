@interface _UIVisualEffectDifferenceEngine
- (NSArray)destination;
- (NSArray)merged;
- (NSArray)source;
- (id)describeMergeTable;
- (id)description;
- (id)mergeSource:(id)a3 andDestination:(id)a4;
- (void)_calculate;
- (void)_calculateLCSSTable;
- (void)_calculateMerge;
- (void)_calculatePrefixAndSuffix;
- (void)_reset;
- (void)dealloc;
- (void)setDestination:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation _UIVisualEffectDifferenceEngine

- (void)dealloc
{
  free(self->_mergeTable);
  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectDifferenceEngine;
  [(_UIVisualEffectDifferenceEngine *)&v3 dealloc];
}

- (void)_reset
{
  merged = self->_merged;
  self->_merged = 0;

  free(self->_mergeTable);
  self->_mergeTable = 0;
}

- (void)_calculatePrefixAndSuffix
{
  self->_int64_t prefixCount = 0;
  self->_int64_t suffixCount = 0;
  int64_t sourceCount = self->_sourceCount;
  if (sourceCount && self->_destinationCount)
  {
    if (sourceCount < 1)
    {
      int64_t prefixCount = 0;
    }
    else
    {
      int64_t prefixCount = 0;
      do
      {
        if (prefixCount >= self->_destinationCount) {
          break;
        }
        v5 = -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:");
        v6 = [(NSArray *)self->_destination objectAtIndexedSubscript:self->_prefixCount];
        int v7 = [v5 isSameTypeOfEffect:v6];

        int64_t prefixCount = self->_prefixCount;
        if (!v7) {
          break;
        }
        self->_int64_t prefixCount = ++prefixCount;
      }
      while (prefixCount < self->_sourceCount);
    }
    int64_t innerSourceCount = self->_innerSourceCount;
    int64_t innerDestinationCount = self->_innerDestinationCount;
    int64_t v10 = innerDestinationCount - prefixCount;
    int64_t v11 = innerSourceCount - prefixCount;
    self->_int64_t innerSourceCount = innerSourceCount - prefixCount;
    self->_int64_t innerDestinationCount = innerDestinationCount - prefixCount;
    if (innerSourceCount != prefixCount && innerDestinationCount != prefixCount)
    {
      int64_t suffixCount = self->_suffixCount;
      while (suffixCount < v11 && suffixCount < v10)
      {
        v15 = [(NSArray *)self->_source objectAtIndexedSubscript:self->_sourceCount + ~suffixCount];
        v16 = [(NSArray *)self->_destination objectAtIndexedSubscript:self->_destinationCount + ~self->_suffixCount];
        char v17 = [v15 isSameTypeOfEffect:v16];

        int64_t suffixCount = self->_suffixCount;
        int64_t v11 = self->_innerSourceCount;
        if ((v17 & 1) == 0)
        {
          int64_t v10 = self->_innerDestinationCount;
          break;
        }
        self->_int64_t suffixCount = ++suffixCount;
        int64_t v10 = self->_innerDestinationCount;
      }
      self->_int64_t innerSourceCount = v11 - suffixCount;
      self->_int64_t innerDestinationCount = v10 - suffixCount;
    }
  }
}

- (void)_calculateLCSSTable
{
  int64_t innerSourceCount = self->_innerSourceCount;
  if (innerSourceCount)
  {
    int64_t innerDestinationCount = self->_innerDestinationCount;
    if (innerDestinationCount)
    {
      self->_mergeTable = (int64_t *)malloc_type_calloc(innerDestinationCount * innerSourceCount, 8uLL, 0x100004000313F17uLL);
      if (self->_innerDestinationCount >= 1)
      {
        id v18 = 0;
        v5 = 0;
        int64_t v6 = 0;
        uint64_t v7 = -1;
        do
        {
          v8 = v5;
          v5 = [(NSArray *)self->_destination objectAtIndexedSubscript:self->_prefixCount + v6];

          if (self->_innerSourceCount < 1)
          {
            id v12 = v18;
          }
          else
          {
            uint64_t v9 = 0;
            int64_t v10 = v18;
            do
            {
              id v19 = [(NSArray *)self->_source objectAtIndexedSubscript:v9 + self->_prefixCount];

              if ([v19 isSameTypeOfEffect:v5])
              {
                int64_t v11 = 0;
                if (v6)
                {
                  id v12 = v19;
                  if (v9)
                  {
                    int64_t v13 = self->_innerSourceCount;
                    if (v9 <= v13 && v6 <= self->_innerDestinationCount) {
                      int64_t v11 = self->_mergeTable[v9 - 1 + v7 * v13];
                    }
                    else {
                      int64_t v11 = 0;
                    }
                  }
                }
                else
                {
                  id v12 = v19;
                }
                int64_t v15 = v11 + 1;
              }
              else
              {
                if (v6 && (int64_t v14 = self->_innerSourceCount, v9 < v14) && v6 <= self->_innerDestinationCount) {
                  int64_t v15 = self->_mergeTable[v9 + v7 * v14];
                }
                else {
                  int64_t v15 = 0;
                }
                id v12 = v19;
                if (v9 && (int64_t v16 = self->_innerSourceCount, v9 <= v16) && v6 < self->_innerDestinationCount) {
                  int64_t v17 = self->_mergeTable[v9 - 1 + v6 * v16];
                }
                else {
                  int64_t v17 = 0;
                }
                if (v17 > v15) {
                  int64_t v15 = v17;
                }
              }
              self->_mergeTable[v9 + v6 * self->_innerSourceCount] = v15;
              ++v9;
              int64_t v10 = v12;
            }
            while (v9 < self->_innerSourceCount);
          }
          id v18 = v12;
          ++v6;
          ++v7;
        }
        while (v6 < self->_innerDestinationCount);
      }
    }
  }
}

- (void)_calculateMerge
{
  id v46 = [MEMORY[0x1E4F1CA48] array];
  if (self->_prefixCount < 1)
  {
    v5 = 0;
    v4 = 0;
    objc_super v3 = 0;
    int64_t prefixCount = 0;
  }
  else
  {
    objc_super v3 = 0;
    v4 = 0;
    v5 = 0;
    int64_t v6 = 0;
    do
    {
      uint64_t v7 = v4;
      v8 = v3;
      objc_super v3 = [(NSArray *)self->_source objectAtIndexedSubscript:v6];

      v4 = [(NSArray *)self->_destination objectAtIndexedSubscript:v6];

      if ([v3 canTransitionToEffect:v4])
      {
        uint64_t v9 = [v3 copyForTransitionToEffect:v4];
        int64_t v10 = v5;
      }
      else
      {
        int64_t v10 = (void *)[v3 copyForTransitionOut];

        [v46 addObject:v10];
        uint64_t v9 = [v4 copyWithZone:0];
      }
      v5 = (void *)v9;

      [v46 addObject:v5];
      ++v6;
      int64_t prefixCount = self->_prefixCount;
    }
    while (v6 < prefixCount);
  }
  int64_t innerSourceCount = self->_innerSourceCount;
  int64_t innerDestinationCount = self->_innerDestinationCount;
  if (innerSourceCount)
  {
    if (innerDestinationCount)
    {
      uint64_t v14 = prefixCount - 1 + innerSourceCount;
      uint64_t v15 = innerDestinationCount + prefixCount - 1;
      uint64_t v16 = [v46 count];
      uint64_t v17 = [(NSArray *)self->_source objectAtIndexedSubscript:v14];

      uint64_t v18 = [(NSArray *)self->_destination objectAtIndexedSubscript:v15];

      while (1)
      {
        while (1)
        {
          if (!(v17 | v18))
          {
            v4 = 0;
            objc_super v3 = 0;
            int64_t v33 = self->_innerDestinationCount + prefixCount;
            prefixCount += self->_innerSourceCount;
            goto LABEL_57;
          }
          if (v18) {
            break;
          }
          if (v17) {
            goto LABEL_31;
          }
          uint64_t v18 = 0;
          uint64_t v17 = 0;
          if (v5) {
            goto LABEL_46;
          }
        }
        if ([(id)v17 isSameTypeOfEffect:v18])
        {
          if ([(id)v17 canTransitionToEffect:v18])
          {
            uint64_t v19 = [(id)v17 copyForTransitionToEffect:v18];
          }
          else
          {
            v31 = (void *)[(id)v18 copyWithZone:0];
            [v46 insertObject:v31 atIndex:v16];

            uint64_t v19 = [(id)v17 copyForTransitionOut];
          }
          uint64_t v27 = v19;

          if (v14 < 1)
          {
            uint64_t v28 = 0;
          }
          else
          {
            uint64_t v28 = [(NSArray *)self->_source objectAtIndexedSubscript:v14 - 1];
            --v14;
          }

          if (v15 < 1)
          {
            v29 = (void *)v18;
LABEL_44:
            uint64_t v18 = 0;
            goto LABEL_45;
          }
          uint64_t v32 = [(NSArray *)self->_destination objectAtIndexedSubscript:v15 - 1];
          v29 = (void *)v18;
          --v15;
          uint64_t v18 = v32;
        }
        else
        {
          if (v17)
          {
            int64_t v20 = self->_innerSourceCount;
            int64_t v21 = v14 + v20 * (v15 - 1);
            if ((v21 & 0x8000000000000000) == 0)
            {
              int64_t v22 = v20 * v15;
              int64_t v23 = self->_innerDestinationCount * v20;
              uint64_t v24 = v22 + v14;
              BOOL v25 = v21 >= v23 || v24 < 1;
              BOOL v26 = !v25 && v24 <= v23;
              if (v26 && self->_mergeTable[v21] < self->_mergeTable[v14 - 1 + v22])
              {
LABEL_31:
                uint64_t v27 = [(id)v17 copyForTransitionOut];

                if (v14 < 1)
                {
                  uint64_t v28 = 0;
                  v29 = (void *)v17;
                }
                else
                {
                  uint64_t v28 = [(NSArray *)self->_source objectAtIndexedSubscript:v14 - 1];
                  v29 = (void *)v17;
                  --v14;
                }
                goto LABEL_45;
              }
            }
          }
          uint64_t v27 = [(id)v18 copyWithZone:0];

          if (v15 < 1)
          {
            v29 = (void *)v18;
            uint64_t v28 = v17;
            goto LABEL_44;
          }
          uint64_t v30 = [(NSArray *)self->_destination objectAtIndexedSubscript:v15 - 1];
          v29 = (void *)v18;
          --v15;
          uint64_t v18 = v30;
          uint64_t v28 = v17;
        }
LABEL_45:

        v5 = (void *)v27;
        uint64_t v17 = v28;
        if (v27) {
LABEL_46:
        }
          [v46 insertObject:v5 atIndex:v16];
      }
    }
    if (innerSourceCount >= 1)
    {
      int64_t v37 = 0;
      do
      {
        v38 = v5;
        v39 = v3;
        objc_super v3 = [(NSArray *)self->_source objectAtIndexedSubscript:prefixCount + v37];

        v5 = (void *)[v3 copyForTransitionOut];
        [v46 addObject:v5];
        ++v37;
      }
      while (v37 < self->_innerSourceCount);
      int64_t v33 = prefixCount;
      prefixCount += v37;
      goto LABEL_57;
    }
  }
  else if (innerDestinationCount >= 1)
  {
    int64_t v34 = 0;
    do
    {
      v35 = v5;
      v36 = v4;
      v4 = [(NSArray *)self->_destination objectAtIndexedSubscript:prefixCount + v34];

      v5 = (void *)[v4 copyWithZone:0];
      [v46 addObject:v5];
      ++v34;
    }
    while (v34 < self->_innerDestinationCount);
    int64_t v33 = prefixCount + v34;
    goto LABEL_57;
  }
  int64_t v33 = prefixCount;
LABEL_57:
  if (self->_suffixCount < 1)
  {
    v43 = v5;
    v42 = v4;
    v41 = v3;
  }
  else
  {
    int64_t v40 = 0;
    do
    {
      v41 = [(NSArray *)self->_source objectAtIndexedSubscript:prefixCount + v40];

      v42 = [(NSArray *)self->_destination objectAtIndexedSubscript:v33 + v40];

      v43 = (void *)[v41 copyForTransitionToEffect:v42];
      [v46 addObject:v43];
      ++v40;
      objc_super v3 = v41;
      v4 = v42;
      v5 = v43;
    }
    while (v40 < self->_suffixCount);
  }
  v44 = (NSArray *)[v46 copy];
  merged = self->_merged;
  self->_merged = v44;
}

- (void)_calculate
{
  int64_t v3 = [(NSArray *)self->_source count];
  self->_int64_t innerSourceCount = v3;
  self->_int64_t sourceCount = v3;
  int64_t v4 = [(NSArray *)self->_destination count];
  self->_int64_t innerDestinationCount = v4;
  self->_destinationCount = v4;
  [(_UIVisualEffectDifferenceEngine *)self _calculatePrefixAndSuffix];
  [(_UIVisualEffectDifferenceEngine *)self _calculateLCSSTable];
  [(_UIVisualEffectDifferenceEngine *)self _calculateMerge];
}

- (void)setSource:(id)a3
{
  if (self->_source != a3)
  {
    id v4 = a3;
    [(_UIVisualEffectDifferenceEngine *)self _reset];
    v5 = (NSArray *)[v4 copy];

    source = self->_source;
    self->_source = v5;
  }
}

- (void)setDestination:(id)a3
{
  if (self->_destination != a3)
  {
    id v4 = a3;
    [(_UIVisualEffectDifferenceEngine *)self _reset];
    v5 = (NSArray *)[v4 copy];

    destination = self->_destination;
    self->_destination = v5;
  }
}

- (NSArray)merged
{
  merged = self->_merged;
  if (!merged)
  {
    [(_UIVisualEffectDifferenceEngine *)self _calculate];
    merged = self->_merged;
  }
  return merged;
}

- (id)mergeSource:(id)a3 andDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_UIVisualEffectDifferenceEngine *)self _reset];
  v8 = (NSArray *)[v7 copy];

  source = self->_source;
  self->_source = v8;

  int64_t v10 = (NSArray *)[v6 copy];
  destination = self->_destination;
  self->_destination = v10;

  [(_UIVisualEffectDifferenceEngine *)self _calculate];
  merged = self->_merged;
  return merged;
}

- (id)describeMergeTable
{
  int64_t v3 = [MEMORY[0x1E4F28E78] string];
  if (self->_innerDestinationCount >= 1)
  {
    int64_t v4 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", @"{%li", self->_mergeTable[self->_innerSourceCount * v4]);
      int64_t innerSourceCount = self->_innerSourceCount;
      if (innerSourceCount >= 2)
      {
        for (uint64_t i = 1; i < innerSourceCount; ++i)
        {
          [v3 appendFormat:@", %li", self->_mergeTable[i + v4 * innerSourceCount]];
          int64_t innerSourceCount = self->_innerSourceCount;
        }
      }
      [v3 appendString:@"},\n"];
      ++v4;
    }
    while (v4 < self->_innerDestinationCount);
  }
  [v3 appendString:@"}"];
  return v3;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)_UIVisualEffectDifferenceEngine;
  int64_t v3 = [(_UIVisualEffectDifferenceEngine *)&v9 description];
  int64_t v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @" prefixLength=%li sourceCount=%li destinationCount=%li suffixCount=%li innerSourceCount=%li innerDestinationCount=%li", self->_prefixCount, self->_sourceCount, self->_destinationCount, self->_suffixCount, self->_innerSourceCount, self->_innerDestinationCount);
  [v4 appendFormat:@"\nSource\n%@", self->_source];
  [v4 appendFormat:@"\nDestination\n%@", self->_destination];
  if (self->_mergeTable)
  {
    [v4 appendString:@"\nLCSS Table\n"];
    if (self->_innerDestinationCount >= 1)
    {
      int64_t v5 = 0;
      do
      {
        objc_msgSend(v4, "appendFormat:", @"{%li", self->_mergeTable[self->_innerSourceCount * v5]);
        int64_t innerSourceCount = self->_innerSourceCount;
        if (innerSourceCount >= 2)
        {
          for (uint64_t i = 1; i < innerSourceCount; ++i)
          {
            [v4 appendFormat:@", %li", self->_mergeTable[i + v5 * innerSourceCount]];
            int64_t innerSourceCount = self->_innerSourceCount;
          }
        }
        [v4 appendString:@"},\n"];
        ++v5;
      }
      while (v5 < self->_innerDestinationCount);
    }
    [v4 appendString:@"}"];
  }
  if (self->_merged) {
    [v4 appendFormat:@"\nMerged\n%@", self->_merged];
  }
  return v4;
}

- (NSArray)source
{
  return self->_source;
}

- (NSArray)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_merged, 0);
}

@end