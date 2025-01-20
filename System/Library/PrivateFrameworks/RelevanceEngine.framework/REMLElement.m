@interface REMLElement
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (REFeatureMap)featureMap;
- (REMLElement)initWithIdentifier:(id)a3 featureMap:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation REMLElement

- (REMLElement)initWithIdentifier:(id)a3 featureMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMLElement;
  v9 = [(REMLElement *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_featureMap, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(REFeatureMap *)self->_featureMap hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMLElement *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      identifier = self->_identifier;
      id v7 = v5->_identifier;
      if (identifier == v7)
      {
      }
      else
      {
        id v8 = v7;
        v9 = identifier;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      featureMap = self->_featureMap;
      v13 = v5->_featureMap;
      v14 = featureMap;
      v15 = v14;
      if (v14 == v13) {
        char v11 = 1;
      }
      else {
        char v11 = [(REFeatureMap *)v14 isEqual:v13];
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  v6 = (void *)[(REFeatureMap *)self->_featureMap copy];
  id v7 = (void *)[v4 initWithIdentifier:identifier featureMap:v6];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (REFeatureMap)featureMap
{
  return self->_featureMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureMap, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end