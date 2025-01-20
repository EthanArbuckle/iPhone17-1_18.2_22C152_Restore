@interface APPBTargetingDimensions
+ (Class)exclusionCriteriaType;
+ (Class)inclusionCriteriaType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)exclusionCriterias;
- (NSMutableArray)inclusionCriterias;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exclusionCriteriaAtIndex:(unint64_t)a3;
- (id)inclusionCriteriaAtIndex:(unint64_t)a3;
- (unint64_t)exclusionCriteriasCount;
- (unint64_t)hash;
- (unint64_t)inclusionCriteriasCount;
- (void)addExclusionCriteria:(id)a3;
- (void)addInclusionCriteria:(id)a3;
- (void)clearExclusionCriterias;
- (void)clearInclusionCriterias;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExclusionCriterias:(id)a3;
- (void)setInclusionCriterias:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBTargetingDimensions

- (void)clearInclusionCriterias
{
}

- (void)addInclusionCriteria:(id)a3
{
  id v4 = a3;
  inclusionCriterias = self->_inclusionCriterias;
  id v8 = v4;
  if (!inclusionCriterias)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_inclusionCriterias;
    self->_inclusionCriterias = v6;

    id v4 = v8;
    inclusionCriterias = self->_inclusionCriterias;
  }
  [(NSMutableArray *)inclusionCriterias addObject:v4];
}

- (unint64_t)inclusionCriteriasCount
{
  return (unint64_t)[(NSMutableArray *)self->_inclusionCriterias count];
}

- (id)inclusionCriteriaAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_inclusionCriterias objectAtIndex:a3];
}

+ (Class)inclusionCriteriaType
{
  return (Class)objc_opt_class();
}

- (void)clearExclusionCriterias
{
}

- (void)addExclusionCriteria:(id)a3
{
  id v4 = a3;
  exclusionCriterias = self->_exclusionCriterias;
  id v8 = v4;
  if (!exclusionCriterias)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_exclusionCriterias;
    self->_exclusionCriterias = v6;

    id v4 = v8;
    exclusionCriterias = self->_exclusionCriterias;
  }
  [(NSMutableArray *)exclusionCriterias addObject:v4];
}

- (unint64_t)exclusionCriteriasCount
{
  return (unint64_t)[(NSMutableArray *)self->_exclusionCriterias count];
}

- (id)exclusionCriteriaAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_exclusionCriterias objectAtIndex:a3];
}

+ (Class)exclusionCriteriaType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBTargetingDimensions;
  v3 = [(APPBTargetingDimensions *)&v7 description];
  id v4 = [(APPBTargetingDimensions *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_inclusionCriterias count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_inclusionCriterias, "count")];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_inclusionCriterias;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"inclusionCriteria"];
  }
  if ([(NSMutableArray *)self->_exclusionCriterias count])
  {
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_exclusionCriterias, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_exclusionCriterias;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)j) dictionaryRepresentation:v19];
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"exclusionCriteria"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBTargetingDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_inclusionCriterias;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_exclusionCriterias;
  id v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(APPBTargetingDimensions *)self inclusionCriteriasCount])
  {
    [v12 clearInclusionCriterias];
    unint64_t v4 = [(APPBTargetingDimensions *)self inclusionCriteriasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(APPBTargetingDimensions *)self inclusionCriteriaAtIndex:i];
        [v12 addInclusionCriteria:v7];
      }
    }
  }
  if ([(APPBTargetingDimensions *)self exclusionCriteriasCount])
  {
    [v12 clearExclusionCriterias];
    unint64_t v8 = [(APPBTargetingDimensions *)self exclusionCriteriasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(APPBTargetingDimensions *)self exclusionCriteriaAtIndex:j];
        [v12 addExclusionCriteria:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = self->_inclusionCriterias;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addInclusionCriteria:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_exclusionCriterias;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) copyWithZone:a3];
        [v5 addExclusionCriteria:v17];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((inclusionCriterias = self->_inclusionCriterias, !((unint64_t)inclusionCriterias | v4[2]))
     || -[NSMutableArray isEqual:](inclusionCriterias, "isEqual:")))
  {
    exclusionCriterias = self->_exclusionCriterias;
    if ((unint64_t)exclusionCriterias | v4[1]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](exclusionCriterias, "isEqual:");
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
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_inclusionCriterias hash];
  return (unint64_t)[(NSMutableArray *)self->_exclusionCriterias hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(APPBTargetingDimensions *)self addInclusionCriteria:*(void *)(*((void *)&v19 + 1) + 8 * (void)v9)];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[APPBTargetingDimensions addExclusionCriteria:](self, "addExclusionCriteria:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), (void)v15);
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)inclusionCriterias
{
  return self->_inclusionCriterias;
}

- (void)setInclusionCriterias:(id)a3
{
}

- (NSMutableArray)exclusionCriterias
{
  return self->_exclusionCriterias;
}

- (void)setExclusionCriterias:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inclusionCriterias, 0);

  objc_storeStrong((id *)&self->_exclusionCriterias, 0);
}

@end