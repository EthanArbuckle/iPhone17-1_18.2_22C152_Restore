@interface PXConcreteAudioAssetEntryPoint
- (BOOL)isEqual:(id)a3;
- (NSArray)fadeInKeyGainValues;
- (NSArray)fadeInKeyTimeOffsets;
- (NSString)description;
- (PXConcreteAudioAssetEntryPoint)initWithTime:(double)a3 fadeInKeyTimeOffsets:(id)a4 fadeInKeyGainValues:(id)a5;
- (double)time;
- (float)fadeInGainAtOffset:(double)a3;
- (unint64_t)hash;
@end

@implementation PXConcreteAudioAssetEntryPoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeInKeyGainValues, 0);
  objc_storeStrong((id *)&self->_fadeInKeyTimeOffsets, 0);
}

- (NSArray)fadeInKeyGainValues
{
  return self->_fadeInKeyGainValues;
}

- (NSArray)fadeInKeyTimeOffsets
{
  return self->_fadeInKeyTimeOffsets;
}

- (double)time
{
  return self->_time;
}

- (unint64_t)hash
{
  [(PXConcreteAudioAssetEntryPoint *)self time];
  unint64_t v4 = (unint64_t)(v3 * 100.0);
  v5 = [(PXConcreteAudioAssetEntryPoint *)self fadeInKeyGainValues];
  uint64_t v6 = [v5 hash];
  v7 = [(PXConcreteAudioAssetEntryPoint *)self fadeInKeyTimeOffsets];
  unint64_t v8 = v6 ^ [v7 hash] ^ v4;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PXConcreteAudioAssetEntryPoint *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(PXConcreteAudioAssetEntryPoint *)self time];
      double v7 = v6;
      [(PXConcreteAudioAssetEntryPoint *)v5 time];
      if (v7 == v8)
      {
        v9 = [(PXConcreteAudioAssetEntryPoint *)self fadeInKeyTimeOffsets];
        v10 = [(PXConcreteAudioAssetEntryPoint *)v5 fadeInKeyTimeOffsets];
        if ([v9 isEqual:v10])
        {
          v11 = [(PXConcreteAudioAssetEntryPoint *)self fadeInKeyGainValues];
          v12 = [(PXConcreteAudioAssetEntryPoint *)v5 fadeInKeyGainValues];
          char v13 = [v11 isEqual:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (float)fadeInGainAtOffset:(double)a3
{
  unint64_t v4 = [(PXConcreteAudioAssetEntryPoint *)self fadeInKeyGainValues];
  if ([v4 count])
  {
    v5 = [(PXConcreteAudioAssetEntryPoint *)self fadeInKeyTimeOffsets];
    double v6 = [(PXConcreteAudioAssetEntryPoint *)self fadeInKeyGainValues];
    double v7 = [v6 firstObject];
    [v7 doubleValue];

    [v5 count];
    v5;
    PXLastIndexInSortedRangePassingTest();
  }

  return 1.0;
}

BOOL __53__PXConcreteAudioAssetEntryPoint_fadeInGainAtOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v3 doubleValue];
  BOOL v5 = v4 <= *(double *)(a1 + 40);

  return v5;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  double v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  [(PXConcreteAudioAssetEntryPoint *)self time];
  uint64_t v7 = v6;
  double v8 = [(PXConcreteAudioAssetEntryPoint *)self fadeInKeyTimeOffsets];
  v9 = [(PXConcreteAudioAssetEntryPoint *)self fadeInKeyGainValues];
  v10 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; Time: %.2f; Gain Curve Offsets: %@; Gain Curve Values: %@>",
                  v5,
                  self,
                  v7,
                  v8,
                  v9);

  return (NSString *)v10;
}

- (PXConcreteAudioAssetEntryPoint)initWithTime:(double)a3 fadeInKeyTimeOffsets:(id)a4 fadeInKeyGainValues:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXConcreteAudioAssetEntryPoint;
  v10 = [(PXConcreteAudioAssetEntryPoint *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_time = a3;
    uint64_t v12 = [v8 copy];
    fadeInKeyTimeOffsets = v11->_fadeInKeyTimeOffsets;
    v11->_fadeInKeyTimeOffsets = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    fadeInKeyGainValues = v11->_fadeInKeyGainValues;
    v11->_fadeInKeyGainValues = (NSArray *)v14;
  }
  return v11;
}

@end