@interface REHistogram
- (BOOL)isEqual:(id)a3;
- (REFeature)feature;
- (REHistogram)initWithFeature:(id)a3;
- (REHistogram)initWithFeature:(id)a3 binningSize:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)countForValue:(unint64_t)a3;
- (unint64_t)countOfValuesBetweenMinValue:(unint64_t)a3 maxValue:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)mean;
- (unint64_t)standardDeviation;
@end

@implementation REHistogram

- (void).cxx_destruct
{
}

- (REHistogram)initWithFeature:(id)a3
{
  id v4 = a3;
  if ([v4 featureType] == 2) {
    uint64_t v5 = RECreateDoubleFeatureValueTaggedPointer();
  }
  else {
    uint64_t v5 = RECreateIntegerFeatureValueTaggedPointer(1);
  }
  v6 = (const void *)v5;
  v7 = [(REHistogram *)self initWithFeature:v4 binningSize:v5];

  v8 = v7;
  REReleaseFeatureValueTaggedPointer(v6);

  return v8;
}

- (REHistogram)initWithFeature:(id)a3 binningSize:(unint64_t)a4
{
  id v7 = a3;
  if ([(REHistogram *)self isMemberOfClass:objc_opt_class()])
  {
    if ([v7 featureType] == 2) {
      v8 = _REContinuousHistogram;
    }
    else {
      v8 = _RECategoricalHistogram;
    }
    v11 = (REHistogram *)[[v8 alloc] initWithFeature:v7 binningSize:a4];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)REHistogram;
    v9 = [(REHistogram *)&v14 init];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_feature, a3);
    }
    v11 = v10;
    self = v11;
  }
  v12 = v11;

  return v12;
}

- (unint64_t)hash
{
  return [(REFeature *)self->_feature hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REHistogram *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      feature = self->_feature;
      v6 = v4->_feature;
      id v7 = feature;
      v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(REFeature *)v7 isEqual:v6];
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
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_feature);
  return v4;
}

- (unint64_t)count
{
  return 0;
}

- (unint64_t)mean
{
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (unint64_t)standardDeviation
{
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (unint64_t)countForValue:(unint64_t)a3
{
  return 0;
}

- (unint64_t)countOfValuesBetweenMinValue:(unint64_t)a3 maxValue:(unint64_t)a4
{
  return 0;
}

- (REFeature)feature
{
  return self->_feature;
}

@end