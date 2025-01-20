@interface PEAdjustmentDataCacheKey
- (BOOL)isEqual:(id)a3;
- (PEAdjustmentDataCacheKey)initWithAsset:(id)a3 originalAdjustmentData:(BOOL)a4;
- (unint64_t)hash;
@end

@implementation PEAdjustmentDataCacheKey

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (unsigned __int8 *)v5;
    BOOL v7 = *((double *)v5 + 2) == self->_adjustmentDate
      && [*((id *)v5 + 1) isEqual:self->_localIdentifier]
      && v6[24] == self->_originalAdjustmentData;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_localIdentifier hash];
}

- (PEAdjustmentDataCacheKey)initWithAsset:(id)a3 originalAdjustmentData:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PEAdjustmentDataCacheKey;
  id v5 = a3;
  v6 = [(PEAdjustmentDataCacheKey *)&v12 init];
  uint64_t v7 = objc_msgSend(v5, "localIdentifier", v12.receiver, v12.super_class);
  localIdentifier = v6->_localIdentifier;
  v6->_localIdentifier = (NSString *)v7;

  v9 = [v5 adjustmentTimestamp];

  [v9 timeIntervalSinceReferenceDate];
  v6->_adjustmentDate = v10;

  v6->_originalAdjustmentData = a4;
  return v6;
}

@end