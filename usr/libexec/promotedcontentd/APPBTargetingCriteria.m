@interface APPBTargetingCriteria
+ (Class)criteriaValuesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)criteriaValues;
- (NSString)criteriaIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)criteriaValuesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)criteriaValuesCount;
- (unint64_t)hash;
- (void)addCriteriaValues:(id)a3;
- (void)clearCriteriaValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCriteriaIdentifier:(id)a3;
- (void)setCriteriaValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBTargetingCriteria

- (void)clearCriteriaValues
{
}

- (void)addCriteriaValues:(id)a3
{
  id v4 = a3;
  criteriaValues = self->_criteriaValues;
  id v8 = v4;
  if (!criteriaValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_criteriaValues;
    self->_criteriaValues = v6;

    id v4 = v8;
    criteriaValues = self->_criteriaValues;
  }
  [(NSMutableArray *)criteriaValues addObject:v4];
}

- (unint64_t)criteriaValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_criteriaValues count];
}

- (id)criteriaValuesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_criteriaValues objectAtIndex:a3];
}

+ (Class)criteriaValuesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBTargetingCriteria;
  v3 = [(APPBTargetingCriteria *)&v7 description];
  id v4 = [(APPBTargetingCriteria *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  criteriaIdentifier = self->_criteriaIdentifier;
  if (criteriaIdentifier) {
    [v3 setObject:criteriaIdentifier forKey:@"criteriaIdentifier"];
  }
  criteriaValues = self->_criteriaValues;
  if (criteriaValues) {
    [v4 setObject:criteriaValues forKey:@"criteriaValues"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBTargetingCriteriaReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_criteriaIdentifier) {
    sub_10019A708();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_criteriaValues;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setCriteriaIdentifier:self->_criteriaIdentifier];
  if ([(APPBTargetingCriteria *)self criteriaValuesCount])
  {
    [v8 clearCriteriaValues];
    unint64_t v4 = [(APPBTargetingCriteria *)self criteriaValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(APPBTargetingCriteria *)self criteriaValuesAtIndex:i];
        [v8 addCriteriaValues:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_criteriaIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_criteriaValues;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addCriteriaValues:v13];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((criteriaIdentifier = self->_criteriaIdentifier, !((unint64_t)criteriaIdentifier | v4[1]))
     || -[NSString isEqual:](criteriaIdentifier, "isEqual:")))
  {
    criteriaValues = self->_criteriaValues;
    if ((unint64_t)criteriaValues | v4[2]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](criteriaValues, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_criteriaIdentifier hash];
  return (unint64_t)[(NSMutableArray *)self->_criteriaValues hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[APPBTargetingCriteria setCriteriaIdentifier:](self, "setCriteriaIdentifier:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[APPBTargetingCriteria addCriteriaValues:](self, "addCriteriaValues:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (void)setCriteriaIdentifier:(id)a3
{
}

- (NSMutableArray)criteriaValues
{
  return self->_criteriaValues;
}

- (void)setCriteriaValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteriaValues, 0);

  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
}

@end