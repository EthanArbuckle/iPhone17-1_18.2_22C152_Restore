@interface TabOverviewInterpolatedValue
- (double)initWithValue:(double)a3 decelerationFactor:;
- (double)resetLastRenderedValue;
- (double)targetValue;
- (double)value;
- (id)description;
- (uint64_t)_dependenciesAreInSteadyState;
- (uint64_t)interpolateByTimeInterval:(uint64_t)result;
- (uint64_t)isInSteadyState;
- (uint64_t)isSteadyAtTargetValue:(uint64_t)a1;
- (uint64_t)setEpsilon:(uint64_t)result;
- (void)_removeFromDependants;
- (void)resetToTargetValue;
- (void)resetToValue:(uint64_t)a1;
- (void)setTargetValue:(uint64_t)a1;
@end

@implementation TabOverviewInterpolatedValue

- (double)initWithValue:(double)a3 decelerationFactor:
{
  if (!a1) {
    return 0;
  }
  v11.receiver = a1;
  v11.super_class = (Class)TabOverviewInterpolatedValue;
  v5 = (double *)objc_msgSendSuper2(&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
    v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    v5[7] = 0.0001;
    v5[8] = a3;
    -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v5, a2);
  }
  return v5;
}

- (void)resetToValue:(uint64_t)a1
{
  if (a1)
  {
    *(double *)(a1 + 24) = a2;
    *(double *)(a1 + 40) = a2;
    *(double *)(a1 + 48) = a2;
    [*(id *)(a1 + 16) removeAllObjects];
    v3 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[TabOverviewInterpolatedValue _removeFromDependants](a1);
  }
}

- (uint64_t)isInSteadyState
{
  if (!a1 || !_SFEqualWithEpsilon()) {
    return 0;
  }
  return _SFEqualWithEpsilon();
}

- (uint64_t)_dependenciesAreInSteadyState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 16);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * v5);
        if (v6 && !-[TabOverviewInterpolatedValue isInSteadyState](v6))
        {
          uint64_t v7 = 0;
          goto LABEL_13;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 1;
LABEL_13:

  return v7;
}

- (uint64_t)interpolateByTimeInterval:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = -[TabOverviewInterpolatedValue _dependenciesAreInSteadyState](result);
    if (result)
    {
      int v4 = _SFEqualWithEpsilon();
      pow(*(long double *)(v3 + 64), a2 * 1000.0);
      _SFInterpolate();
      *(void *)(v3 + 24) = v5;
      _SFInterpolate();
      *(void *)(v3 + 40) = v6;
      if (_SFEqualWithEpsilon()) {
        *(void *)(v3 + 24) = *(void *)(v3 + 48);
      }
      if (_SFEqualWithEpsilon()) {
        *(void *)(v3 + 40) = *(void *)(v3 + 24);
      }
      if (v4) {
        return _SFEqualWithEpsilon() ^ 1;
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

- (void)setTargetValue:(uint64_t)a1
{
  if (a1 && (_SFEqualWithEpsilon() & 1) == 0)
  {
    *(double *)(a1 + 48) = a2;
    -[TabOverviewInterpolatedValue _removeFromDependants](a1);
  }
}

- (void)_removeFromDependants
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(a1 + 8);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
          if (v7) {
            objc_msgSend(*(id *)(v7 + 16), "removeObject:", a1, (void)v9);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }

    uint64_t v8 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
}

- (void)resetToTargetValue
{
  if (a1) {
    -[TabOverviewInterpolatedValue resetToValue:](a1, *(double *)(a1 + 48));
  }
}

- (double)resetLastRenderedValue
{
  if (a1)
  {
    double result = *(double *)(a1 + 40);
    *(double *)(a1 + 32) = result;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; value = %f; targetValue = %f; instantaneousTargetValue = %f",
    v5,
    self,
    *(void *)&self->_value,
    *(void *)&self->_targetValue,
  uint64_t v6 = *(void *)&self->_instantaneousTargetValue);

  if ([(NSHashTable *)self->_dependencies count]) {
    objc_msgSend(v6, "appendFormat:", @"; numberOfDependencies = %d",
  }
      [(NSHashTable *)self->_dependencies count]);
  if ([(NSHashTable *)self->_dependants count]) {
    objc_msgSend(v6, "appendFormat:", @"; numberOfDependants = %d",
  }
      [(NSHashTable *)self->_dependants count]);
  [v6 appendString:@">"];
  return v6;
}

- (uint64_t)isSteadyAtTargetValue:(uint64_t)a1
{
  if (!a1 || !_SFEqualWithEpsilon()) {
    return 0;
  }
  return -[TabOverviewInterpolatedValue isInSteadyState](a1);
}

- (double)value
{
  if (a1) {
    return *(double *)(a1 + 40);
  }
  else {
    return 0.0;
  }
}

- (double)targetValue
{
  if (a1) {
    return *(double *)(a1 + 48);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setEpsilon:(uint64_t)result
{
  if (result) {
    *(double *)(result + 56) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_dependants, 0);
}

@end