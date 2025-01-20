@interface PMMPredictionItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPredictionItem:(id)a3;
- (NSDictionary)reasonMetadata;
- (NSString)bundleId;
- (PMMPredictionItem)initWithBundleId:(id)a3 predictionSource:(unint64_t)a4 reason:(int64_t)a5 reasonMetadata:(id)a6 anchorType:(int64_t)a7 confidence:(double)a8;
- (double)confidence;
- (id)description;
- (int64_t)anchorType;
- (int64_t)reason;
- (unint64_t)hash;
- (unint64_t)predictionSource;
@end

@implementation PMMPredictionItem

- (PMMPredictionItem)initWithBundleId:(id)a3 predictionSource:(unint64_t)a4 reason:(int64_t)a5 reasonMetadata:(id)a6 anchorType:(int64_t)a7 confidence:(double)a8
{
  id v15 = a3;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PMMPredictionItem;
  v17 = [(PMMPredictionItem *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleId, a3);
    v18->_predictionSource = a4;
    v18->_reason = a5;
    objc_storeStrong((id *)&v18->_reasonMetadata, a6);
    v18->_anchorType = a7;
    v18->_confidence = a8;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PMMPredictionItem *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PMMPredictionItem *)self isEqualToPredictionItem:v5];

  return v6;
}

- (BOOL)isEqualToPredictionItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*(_OWORD *)&self->_predictionSource != *((_OWORD *)v4 + 1) || self->_confidence != *((double *)v4 + 6)) {
    goto LABEL_3;
  }
  bundleId = self->_bundleId;
  v9 = (NSString *)*((id *)v4 + 1);
  if (bundleId == v9)
  {
  }
  else
  {
    v10 = v9;
    v11 = bundleId;
    char v12 = [(NSString *)v11 isEqual:v10];

    if ((v12 & 1) == 0)
    {
LABEL_3:
      char v6 = 0;
      goto LABEL_4;
    }
  }
  v13 = self->_reasonMetadata;
  v14 = v13;
  if (v13 == (NSDictionary *)v5[4]) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSDictionary isEqual:](v13, "isEqual:");
  }

LABEL_4:
  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  unint64_t v4 = self->_predictionSource - v3 + 32 * v3;
  return self->_reason - v4 + 32 * v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  bundleId = self->_bundleId;
  v5 = +[PMMTypes predictionSourceToString:self->_predictionSource];
  char v6 = [v3 stringWithFormat:@"BundleId: %@\nPredictionSource: %@\nConfidence: %lf\nReason: %ld\nAnchorType: %ld", bundleId, v5, *(void *)&self->_confidence, self->_reason, self->_anchorType];

  return v6;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (unint64_t)predictionSource
{
  return self->_predictionSource;
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSDictionary)reasonMetadata
{
  return self->_reasonMetadata;
}

- (int64_t)anchorType
{
  return self->_anchorType;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonMetadata, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end