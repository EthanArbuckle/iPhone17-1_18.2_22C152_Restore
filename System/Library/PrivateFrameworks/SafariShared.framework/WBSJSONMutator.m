@interface WBSJSONMutator
- (WBSJSONMutator)initWithSource:(id)a3 protectedFields:(id)a4;
- (double)collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults;
- (double)fieldDeletionProbability;
- (double)fieldTypeChangeProbability;
- (double)fieldValueChangeProbability;
- (id)_mutatedArrayField:(id)a3 shouldProtectRootObject:(BOOL)a4;
- (id)_mutatedCollectionField:(id)a3;
- (id)_mutatedDictionaryField:(id)a3 shouldProtectRootObject:(BOOL)a4;
- (id)_randomDateGenerator;
- (id)_randomFieldTypeChanger;
- (id)_randomIntegerGenerator;
- (id)_randomNumberGenerator;
- (id)_randomStringGenerator;
- (id)_randomValueForField:(id)a3;
- (id)mutatedJSONProtectingRootObject:(BOOL)a3;
- (int64_t)_actionToPerformOnFieldOfType:(int64_t)a3;
- (void)setCollectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults:(double)a3;
- (void)setFieldDeletionProbability:(double)a3;
- (void)setFieldTypeChangeProbability:(double)a3;
- (void)setFieldValueChangeProbability:(double)a3;
@end

@implementation WBSJSONMutator

- (WBSJSONMutator)initWithSource:(id)a3 protectedFields:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSJSONMutator;
  v9 = [(WBSJSONMutator *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_originalJSONSource, a3);
    *(_OWORD *)&v10->_fieldDeletionProbability = xmmword_1A6D5F010;
    *(_OWORD *)&v10->_fieldTypeChangeProbability = xmmword_1A6D5F020;
    objc_storeStrong((id *)&v10->_protectedFields, a4);
    v11 = v10;
  }

  return v10;
}

- (id)mutatedJSONProtectingRootObject:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id originalJSONSource = self->_originalJSONSource;
  if (isKindOfClass) {
    [(WBSJSONMutator *)self _mutatedDictionaryField:originalJSONSource shouldProtectRootObject:v3];
  }
  else {
  id v7 = [(WBSJSONMutator *)self _mutatedArrayField:originalJSONSource shouldProtectRootObject:v3];
  }
  return v7;
}

- (id)_mutatedArrayField:(id)a3 shouldProtectRootObject:(BOOL)a4
{
  id v6 = a3;
  if (a4 || [(WBSJSONMutator *)self _actionToPerformOnFieldOfType:0])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__WBSJSONMutator__mutatedArrayField_shouldProtectRootObject___block_invoke;
    v9[3] = &unk_1E5C9DBF0;
    v9[4] = self;
    id v7 = objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", v9);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __61__WBSJSONMutator__mutatedArrayField_shouldProtectRootObject___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mutatedCollectionField:a2];
}

- (id)_mutatedDictionaryField:(id)a3 shouldProtectRootObject:(BOOL)a4
{
  id v6 = a3;
  if (a4 || [(WBSJSONMutator *)self _actionToPerformOnFieldOfType:0])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__WBSJSONMutator__mutatedDictionaryField_shouldProtectRootObject___block_invoke;
    v9[3] = &unk_1E5C9DC18;
    v9[4] = self;
    id v7 = objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v9);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __66__WBSJSONMutator__mutatedDictionaryField_shouldProtectRootObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:a2])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) _mutatedCollectionField:v5];
  }
  id v7 = v6;

  return v7;
}

- (id)_mutatedCollectionField:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(WBSJSONMutator *)self _mutatedArrayField:v4 shouldProtectRootObject:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WBSJSONMutator *)self _mutatedDictionaryField:v4 shouldProtectRootObject:0];
    }
    else
    {
      int64_t v6 = [(WBSJSONMutator *)self _actionToPerformOnFieldOfType:1];
      switch(v6)
      {
        case 0:
          id v7 = 0;
          goto LABEL_13;
        case 2:
          id v5 = [(WBSJSONMutator *)self _randomFieldTypeChanger];
          break;
        case 1:
          id v5 = [(WBSJSONMutator *)self _randomValueForField:v4];
          break;
        default:
          id v5 = v4;
          break;
      }
    }
  }
  id v7 = v5;
LABEL_13:

  return v7;
}

- (int64_t)_actionToPerformOnFieldOfType:(int64_t)a3
{
  double collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults = 1.0;
  if (!a3) {
    double collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults = self->_collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults;
  }
  if (collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults * (self->_fieldDeletionProbability * 1000.0) >= (double)(arc4random_uniform(0x3E8u) + 1)) {
    return 0;
  }
  if (collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults * (self->_fieldValueChangeProbability * 1000.0) >= (double)(arc4random_uniform(0x3E8u) + 1)) {
    return 1;
  }
  if (collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults * (self->_fieldTypeChangeProbability * 1000.0) >= (double)(arc4random_uniform(0x3E8u) + 1)) {
    return 2;
  }
  return 3;
}

- (id)_randomValueForField:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 doubleValue];
    if (v5 == 1.0 || v5 == 0.0)
    {
      id v7 = objc_alloc(NSNumber);
      int v8 = [v4 intValue];
      if (v8 >= 1) {
        uint64_t v9 = (v8 - 1);
      }
      else {
        uint64_t v9 = (1 - v8);
      }
      uint64_t v6 = [v7 initWithInt:v9];
    }
    else
    {
      if (*(unsigned char *)[v4 objCType] == 105) {
        [(WBSJSONMutator *)self _randomIntegerGenerator];
      }
      else {
      uint64_t v6 = [(WBSJSONMutator *)self _randomNumberGenerator];
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(WBSJSONMutator *)self _randomStringGenerator];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = 0;
        goto LABEL_18;
      }
      uint64_t v6 = [(WBSJSONMutator *)self _randomDateGenerator];
    }
  }
  v10 = (void *)v6;
LABEL_18:

  return v10;
}

- (id)_randomFieldTypeChanger
{
  uint32_t v3 = arc4random_uniform(3u);
  if (v3 == 2)
  {
    id v4 = [(WBSJSONMutator *)self _randomStringGenerator];
  }
  else if (v3 == 1)
  {
    id v4 = [(WBSJSONMutator *)self _randomNumberGenerator];
  }
  else
  {
    if (v3) {
      [(WBSJSONMutator *)self _randomDateGenerator];
    }
    else {
    id v4 = [(WBSJSONMutator *)self _randomIntegerGenerator];
    }
  }
  return v4;
}

- (id)_randomIntegerGenerator
{
  v2 = (void *)[objc_alloc(NSNumber) initWithInt:rand()];
  return v2;
}

- (id)_randomNumberGenerator
{
  id v2 = objc_alloc(NSNumber);
  *(float *)&double v3 = (float)random();
  id v4 = (void *)[v2 initWithFloat:v3];
  return v4;
}

- (id)_randomStringGenerator
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint32_t v3 = arc4random_uniform(0x64u);
  if (v3)
  {
    uint64_t v4 = v3;
    do
    {
      objc_msgSend(v2, "appendFormat:", @"%c", (char)(arc4random_uniform(0x5Du) + 33));
      --v4;
    }
    while (v4);
  }
  return v2;
}

- (id)_randomDateGenerator
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:(double)rand()];
  return v2;
}

- (double)fieldDeletionProbability
{
  return self->_fieldDeletionProbability;
}

- (void)setFieldDeletionProbability:(double)a3
{
  self->_fieldDeletionProbability = a3;
}

- (double)fieldValueChangeProbability
{
  return self->_fieldValueChangeProbability;
}

- (void)setFieldValueChangeProbability:(double)a3
{
  self->_fieldValueChangeProbability = a3;
}

- (double)fieldTypeChangeProbability
{
  return self->_fieldTypeChangeProbability;
}

- (void)setFieldTypeChangeProbability:(double)a3
{
  self->_fieldTypeChangeProbability = a3;
}

- (double)collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults
{
  return self->_collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults;
}

- (void)setCollectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults:(double)a3
{
  self->_double collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedFields, 0);
  objc_storeStrong(&self->_originalJSONSource, 0);
}

@end