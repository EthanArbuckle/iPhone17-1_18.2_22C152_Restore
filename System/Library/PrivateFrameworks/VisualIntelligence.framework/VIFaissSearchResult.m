@interface VIFaissSearchResult
- (BOOL)isValid;
- (NSArray)embedding;
- (NSArray)residual;
- (VIFaissSearchResult)initWithIdentifier:(int64_t)a3 distance:(float)a4 embedding:(id)a5 residual:(id)a6;
- (float)distance;
- (id)description;
- (int64_t)identifier;
- (void)setDistance:(float)a3;
- (void)setEmbedding:(id)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setResidual:(id)a3;
@end

@implementation VIFaissSearchResult

- (VIFaissSearchResult)initWithIdentifier:(int64_t)a3 distance:(float)a4 embedding:(id)a5 residual:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)VIFaissSearchResult;
  v12 = [(VIFaissSearchResult *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_identifier = a3;
    v12->_distance = a4;
    uint64_t v14 = [v10 copy];
    embedding = v13->_embedding;
    v13->_embedding = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    residual = v13->_residual;
    v13->_residual = (NSArray *)v16;

    v18 = v13;
  }

  return v13;
}

- (id)description
{
  if ([(VIFaissSearchResult *)self isValid])
  {
    v3 = [NSNumber numberWithLongLong:self->_identifier];
    v4 = [v3 description];

    *(float *)&double v5 = self->_distance;
    v6 = [NSNumber numberWithFloat:v5];
    v7 = [v6 description];

    embedding = self->_embedding;
    if (embedding)
    {
      _descriptionForFloatArray(embedding);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = @"nil";
    }
    residual = self->_residual;
    if (residual)
    {
      _descriptionForFloatArray(residual);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = @"nil";
    }
  }
  else
  {
    v4 = @"INVALID";
    id v10 = @"nil";
    v9 = @"nil";
    v7 = @"INVALID";
  }
  v12 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)VIFaissSearchResult;
  v13 = [(VIFaissSearchResult *)&v16 description];
  uint64_t v14 = [v12 stringWithFormat:@"%@: {identifier: %@, distance: %@, embedding: %@, residual: %@}", v13, v4, v7, v9, v10];

  return v14;
}

- (BOOL)isValid
{
  return self->_identifier != 0x7FFFFFFFFFFFFFFFLL;
}

- (float)distance
{
  if ([(VIFaissSearchResult *)self isValid]) {
    return self->_distance;
  }
  else {
    return NAN;
  }
}

- (NSArray)embedding
{
  if ([(VIFaissSearchResult *)self isValid]) {
    embedding = self->_embedding;
  }
  else {
    embedding = 0;
  }
  return embedding;
}

- (NSArray)residual
{
  if ([(VIFaissSearchResult *)self isValid]) {
    residual = self->_residual;
  }
  else {
    residual = 0;
  }
  return residual;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (void)setDistance:(float)a3
{
  self->_distance = a3;
}

- (void)setEmbedding:(id)a3
{
}

- (void)setResidual:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residual, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end