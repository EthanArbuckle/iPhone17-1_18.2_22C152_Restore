@interface _REBlockFeatureTransformer
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_REBlockFeatureTransformer)initWithFeatureCount:(unint64_t)a3 outputFeatureType:(unint64_t)a4 transformation:(id)a5;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
@end

@implementation _REBlockFeatureTransformer

- (BOOL)isEqual:(id)a3
{
  v4 = (_REBlockFeatureTransformer *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = (id)MEMORY[0x223C31700](self->_block);
      id v7 = (id)MEMORY[0x223C31700](v5->_block);
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8) {
          goto LABEL_11;
        }
      }
      if (self->_featureCount == v5->_featureCount)
      {
        BOOL v9 = self->_outputFeatureType == v5->_outputFeatureType;
LABEL_12:

        goto LABEL_13;
      }
LABEL_11:
      BOOL v9 = 0;
      goto LABEL_12;
    }
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  return [self->_block hash];
}

- (_REBlockFeatureTransformer)initWithFeatureCount:(unint64_t)a3 outputFeatureType:(unint64_t)a4 transformation:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_REBlockFeatureTransformer;
  BOOL v9 = [(REFeatureTransformer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_featureCount = a3;
    v9->_outputFeatureType = a4;
    uint64_t v11 = MEMORY[0x223C31700](v8);
    id block = v10->_block;
    v10->_id block = (id)v11;
  }
  return v10;
}

- (int64_t)_bitCount
{
  return -1;
}

- (unint64_t)_featureCount
{
  return self->_featureCount;
}

- (unint64_t)_outputType
{
  return self->_outputFeatureType;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  if (!self->_block) {
    return 0;
  }
  unint64_t v4 = a4;
  for (i = [MEMORY[0x263EFF980] arrayWithCapacity:a4];
  {
    unint64_t v8 = *a3++;
    BOOL v9 = REFeatureValueForTaggedPointer(v8);
    [i addObject:v9];
  }
  v10 = (*((void (**)(void))self->_block + 2))();
  unint64_t v11 = RECreateFeatureValueTaggedPointer(v10);

  return v11;
}

- (BOOL)_validateWithFeatures:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end