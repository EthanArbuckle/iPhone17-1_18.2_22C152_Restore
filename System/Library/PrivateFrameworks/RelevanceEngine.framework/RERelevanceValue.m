@interface RERelevanceValue
- (BOOL)isEqual:(id)a3;
- (BOOL)isHistoric;
- (RERelevanceValue)initWithValues:(id)a3 isHistoric:(BOOL)a4;
- (RETaggedFeatureValueArray)values;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation RERelevanceValue

- (RERelevanceValue)initWithValues:(id)a3 isHistoric:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RERelevanceValue;
  v8 = [(RERelevanceValue *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_values, a3);
    v9->_historic = v4;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__RERelevanceValue_initWithValues_isHistoric___block_invoke;
    v12[3] = &unk_2644BE7E0;
    v10 = v9;
    v13 = v10;
    [v7 enumerateFeatureValuesUsingBlock:v12];
    v10->_hash ^= v4;
  }
  return v9;
}

uint64_t __46__RERelevanceValue_initWithValues_isHistoric___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = REFeatureValueHashForTaggedPointer(a2);
  *(void *)(*(void *)(a1 + 32) + 8) ^= result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(RERelevanceValue *)self values];
  v6 = objc_msgSend(v4, "initWithValues:isHistoric:", v5, -[RERelevanceValue isHistoric](self, "isHistoric"));

  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RERelevanceValue *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(RERelevanceValue *)self values];
      id v7 = [(RERelevanceValue *)v5 values];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          LOBYTE(v9) = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      BOOL v10 = [(RERelevanceValue *)self isHistoric];
      BOOL v9 = v10 ^ [(RERelevanceValue *)v5 isHistoric] ^ 1;
      goto LABEL_10;
    }
    LOBYTE(v9) = 0;
  }
LABEL_11:

  return v9;
}

- (RETaggedFeatureValueArray)values
{
  return self->_values;
}

- (BOOL)isHistoric
{
  return self->_historic;
}

- (void).cxx_destruct
{
}

@end