@interface RTFusedInferredMapItem
+ (id)sortFusedInferredMapItems:(id)a3 confidenceEqualityEpsilon:(double)a4 referenceLocation:(id)a5 distanceCalculator:(id)a6 ascending:(BOOL)a7;
- (BOOL)isEqual:(id)a3;
- (RTFusedInferredMapItem)init;
- (RTFusedInferredMapItem)initWithInferredMapItem:(id)a3;
- (RTFusedInferredMapItem)initWithMapItem:(id)a3 confidence:(double)a4 source:(unint64_t)a5;
- (RTMapItem)mapItem;
- (double)confidence;
- (id)convertToInferredMapItem;
- (id)description;
- (unint64_t)hash;
- (unint64_t)source;
- (void)setConfidence:(double)a3;
- (void)setMapItem:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation RTFusedInferredMapItem

- (RTFusedInferredMapItem)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapItem_confidence_source_);
}

- (RTFusedInferredMapItem)initWithMapItem:(id)a3 confidence:(double)a4 source:(unint64_t)a5
{
  id v9 = a3;
  if (a4 < 0.0 || a4 > 1.0)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: kRTFusedInferredMapItemConfidenceMin <= confidence && confidence <= kRTFusedInferredMapItemConfidenceMax", buf, 2u);
    }

    goto LABEL_10;
  }
  if ((a5 & 0xFFFFFFFFFFF00020) != 0)
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTFusedInferredMapItem;
  v14 = [(RTFusedInferredMapItem *)&v16 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mapItem, a3);
    v15->_confidence = a4;
    v15->_source = a5;
  }
  self = v15;
  v12 = self;
LABEL_11:

  return v12;
}

- (RTFusedInferredMapItem)initWithInferredMapItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 mapItem];
    [v5 confidence];
    self = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](self, "initWithMapItem:confidence:source:", v6, [v5 source], v7);

    v8 = self;
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", v11, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)convertToInferredMapItem
{
  if (self->_mapItem) {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F5CDF8]) initWithMapItem:self->_mapItem confidence:self->_source source:self->_confidence];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (unint64_t)hash
{
  v3 = [(RTFusedInferredMapItem *)self mapItem];

  if (v3)
  {
    uint64_t v4 = [(RTMapItem *)self->_mapItem hash];
    v5 = [NSNumber numberWithDouble:self->_confidence];
    uint64_t v6 = [v5 hash] ^ v4;
    double v7 = [NSNumber numberWithUnsignedInteger:self->_source];
    uint64_t v8 = [v7 hash];
  }
  else
  {
    v5 = [NSNumber numberWithDouble:self->_confidence];
    uint64_t v8 = [v5 hash];
    double v7 = [NSNumber numberWithUnsignedInteger:self->_source];
    uint64_t v6 = [v7 hash];
  }

  return v6 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RTFusedInferredMapItem *)a3;
  if (self == v4)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(RTFusedInferredMapItem *)self mapItem];
      double v7 = [(RTFusedInferredMapItem *)v5 mapItem];
      char v8 = [v6 isEqual:v7];

      id v9 = [(RTFusedInferredMapItem *)self mapItem];
      if (!v9)
      {
        v10 = [(RTFusedInferredMapItem *)v5 mapItem];

        if (!v10) {
          char v8 = 1;
        }
      }

      [(RTFusedInferredMapItem *)self confidence];
      double v12 = v11;
      [(RTFusedInferredMapItem *)v5 confidence];
      double v14 = v13;
      unint64_t v15 = [(RTFusedInferredMapItem *)self source];
      uint64_t v16 = [(RTFusedInferredMapItem *)v5 source];
      if (v12 == v14) {
        char v17 = v8;
      }
      else {
        char v17 = 0;
      }
      if (v15 == v16) {
        BOOL v18 = v17;
      }
      else {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(RTFusedInferredMapItem *)self mapItem];
  [(RTFusedInferredMapItem *)self confidence];
  uint64_t v6 = v5;
  double v7 = [[MEMORY[0x1E4F5CE38] sourceToString:-[RTFusedInferredMapItem source](self, "source")];
  char v8 = [v3 stringWithFormat:@"mapItem, %@, confidence, %.3f, source, %@", v4, v6, v7];

  return v8;
}

+ (id)sortFusedInferredMapItems:(id)a3 confidenceEqualityEpsilon:(double)a4 referenceLocation:(id)a5 distanceCalculator:(id)a6 ascending:(BOOL)a7
{
  BOOL v7 = a7;
  v28[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: fusedInferredMapItems";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_15;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: RTCommonValidConfidence(confidenceEqualityEpsilon)";
    goto LABEL_14;
  }
  if (!v12)
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: referenceLocation";
    goto LABEL_14;
  }
  if (v13)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke;
    v26[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
    *(double *)&v26[4] = a4;
    double v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:v7 comparator:v26];
    unint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"mapItem" ascending:v7 comparator:&__block_literal_global_37];
    uint64_t v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"mapItem" ascending:v7 comparator:&__block_literal_global_32];
    char v17 = (void *)MEMORY[0x1E4F29008];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke_4;
    v23[3] = &unk_1E6B94EF0;
    id v24 = v13;
    id v25 = v12;
    BOOL v18 = [v17 sortDescriptorWithKey:@"mapItem" ascending:v7 comparator:v23];
    v28[0] = v14;
    v28[1] = v15;
    v28[2] = v16;
    v28[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    v20 = [v11 sortedArrayUsingDescriptors:v19];

    goto LABEL_16;
  }
  double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_14;
  }
LABEL_15:
  v20 = 0;
LABEL_16:

  return v20;
}

uint64_t __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 doubleValue];
  double v8 = v7;
  [v6 doubleValue];
  if (vabdd_f64(v8, v9) >= *(double *)(a1 + 32))
  {
    [v5 doubleValue];
    double v12 = v11;
    [v6 doubleValue];
    if (v12 > v13) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    return a3 == 0;
  }
  else {
    return -1;
  }
}

uint64_t __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 extendedAttributes];
  uint64_t v6 = [v5 wifiFingerprintLabelType];

  double v7 = [v4 extendedAttributes];

  uint64_t v8 = [v7 wifiFingerprintLabelType];
  uint64_t v9 = 1;
  uint64_t v10 = -1;
  if (v6 == 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = -1;
  }
  if (v8 != 2) {
    uint64_t v10 = v11;
  }
  if (v6 != 2) {
    uint64_t v9 = v10;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

uint64_t __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  double v7 = [a2 location];
  [v5 distanceFromLocation:v7 toLocation:*(void *)(a1 + 40) error:0];
  double v9 = v8;

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v6 location];

  [v10 distanceFromLocation:v11 toLocation:*(void *)(a1 + 40) error:0];
  double v13 = v12;

  uint64_t v14 = -1;
  if (v9 < v13) {
    uint64_t v14 = 1;
  }
  if (v9 == v13) {
    return 0;
  }
  else {
    return v14;
  }
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
}

@end