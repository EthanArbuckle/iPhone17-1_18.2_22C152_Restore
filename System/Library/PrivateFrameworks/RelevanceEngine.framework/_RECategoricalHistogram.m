@interface _RECategoricalHistogram
- (BOOL)isEqual:(id)a3;
- (_RECategoricalHistogram)initWithFeature:(id)a3 binningSize:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)countForValue:(unint64_t)a3;
- (unint64_t)countOfValuesBetweenMinValue:(unint64_t)a3 maxValue:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)mean;
- (unint64_t)standardDeviation;
- (void)addValue:(unint64_t)a3;
- (void)enumerateValuesUsingBlock:(id)a3;
- (void)removeValue:(unint64_t)a3;
@end

@implementation _RECategoricalHistogram

- (_RECategoricalHistogram)initWithFeature:(id)a3 binningSize:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_RECategoricalHistogram;
  v4 = [(REHistogram *)&v8 initWithFeature:a3 binningSize:a4];
  if (v4)
  {
    v5 = objc_alloc_init(RETaggedFeatureValueCountedSet);
    values = v4->_values;
    v4->_values = v5;
  }
  return v4;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_RECategoricalHistogram;
  unint64_t v3 = [(REHistogram *)&v5 hash];
  return [(RETaggedFeatureValueCountedSet *)self->_values hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_RECategoricalHistogram *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)_RECategoricalHistogram,
          [(REHistogram *)&v11 isEqual:v4]))
    {
      values = self->_values;
      v6 = v4->_values;
      v7 = values;
      objc_super v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(RETaggedFeatureValueCountedSet *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_RECategoricalHistogram;
  v4 = [(REHistogram *)&v8 copyWithZone:a3];
  uint64_t v5 = [(RETaggedFeatureValueCountedSet *)self->_values copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (unint64_t)count
{
  return [(RETaggedFeatureValueCountedSet *)self->_values count];
}

- (unint64_t)mean
{
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (unint64_t)standardDeviation
{
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (void)addValue:(unint64_t)a3
{
}

- (void)removeValue:(unint64_t)a3
{
}

- (unint64_t)countForValue:(unint64_t)a3
{
  return [(RETaggedFeatureValueCountedSet *)self->_values countForFeatureValue:a3];
}

- (unint64_t)countOfValuesBetweenMinValue:(unint64_t)a3 maxValue:(unint64_t)a4
{
  if (a3 == a4) {
    goto LABEL_4;
  }
  uint64_t v7 = REFeatureValueTypeForTaggedPointer(a3);
  if (v7 != REFeatureValueTypeForTaggedPointer(a4)) {
    goto LABEL_7;
  }
  objc_super v8 = REFeatureValueForTaggedPointer(a3);
  char v9 = REFeatureValueForTaggedPointer(a4);
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
LABEL_4:
    values = self->_values;
    return [(RETaggedFeatureValueCountedSet *)values countForFeatureValue:a3];
  }
  else
  {
LABEL_7:
    unint64_t v13 = [(RETaggedFeatureValueCountedSet *)self->_values countForFeatureValue:a3];
    return [(RETaggedFeatureValueCountedSet *)self->_values countForFeatureValue:a4] + v13;
  }
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    values = self->_values;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53___RECategoricalHistogram_enumerateValuesUsingBlock___block_invoke;
    v7[3] = &unk_2644BED88;
    v7[4] = self;
    id v8 = v4;
    [(RETaggedFeatureValueCountedSet *)values enumerateFeatureValuesUsingBlock:v7];
  }
}

- (void).cxx_destruct
{
}

@end