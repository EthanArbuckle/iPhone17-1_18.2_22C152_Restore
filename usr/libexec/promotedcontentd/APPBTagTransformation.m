@interface APPBTagTransformation
+ (Class)requiredTagsType;
+ (Class)resultTagsType;
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)requiredTags;
- (NSMutableArray)resultTags;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requiredTagsAtIndex:(unint64_t)a3;
- (id)resultTagsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)requiredTagsCount;
- (unint64_t)resultTagsCount;
- (void)addRequiredTags:(id)a3;
- (void)addResultTags:(id)a3;
- (void)clearRequiredTags;
- (void)clearResultTags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRequiredTags:(id)a3;
- (void)setResultTags:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBTagTransformation

+ (id)options
{
  if (qword_100289960 != -1) {
    dispatch_once(&qword_100289960, &stru_1002356A0);
  }
  v2 = (void *)qword_100289958;

  return v2;
}

- (void)clearRequiredTags
{
}

- (void)addRequiredTags:(id)a3
{
  id v4 = a3;
  requiredTags = self->_requiredTags;
  id v8 = v4;
  if (!requiredTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_requiredTags;
    self->_requiredTags = v6;

    id v4 = v8;
    requiredTags = self->_requiredTags;
  }
  [(NSMutableArray *)requiredTags addObject:v4];
}

- (unint64_t)requiredTagsCount
{
  return (unint64_t)[(NSMutableArray *)self->_requiredTags count];
}

- (id)requiredTagsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_requiredTags objectAtIndex:a3];
}

+ (Class)requiredTagsType
{
  return (Class)objc_opt_class();
}

- (void)clearResultTags
{
}

- (void)addResultTags:(id)a3
{
  id v4 = a3;
  resultTags = self->_resultTags;
  id v8 = v4;
  if (!resultTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_resultTags;
    self->_resultTags = v6;

    id v4 = v8;
    resultTags = self->_resultTags;
  }
  [(NSMutableArray *)resultTags addObject:v4];
}

- (unint64_t)resultTagsCount
{
  return (unint64_t)[(NSMutableArray *)self->_resultTags count];
}

- (id)resultTagsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_resultTags objectAtIndex:a3];
}

+ (Class)resultTagsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBTagTransformation;
  v3 = [(APPBTagTransformation *)&v7 description];
  id v4 = [(APPBTagTransformation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  requiredTags = self->_requiredTags;
  if (requiredTags) {
    [v3 setObject:requiredTags forKey:@"requiredTags"];
  }
  resultTags = self->_resultTags;
  if (resultTags) {
    [v4 setObject:resultTags forKey:@"resultTags"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBTagTransformationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_requiredTags;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_resultTags;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
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
  if ([(APPBTagTransformation *)self requiredTagsCount])
  {
    [v12 clearRequiredTags];
    unint64_t v4 = [(APPBTagTransformation *)self requiredTagsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(APPBTagTransformation *)self requiredTagsAtIndex:i];
        [v12 addRequiredTags:v7];
      }
    }
  }
  if ([(APPBTagTransformation *)self resultTagsCount])
  {
    [v12 clearResultTags];
    unint64_t v8 = [(APPBTagTransformation *)self resultTagsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(APPBTagTransformation *)self resultTagsAtIndex:j];
        [v12 addResultTags:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = self->_requiredTags;
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
        [v5 addRequiredTags:v11];

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
  id v12 = self->_resultTags;
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
        [v5 addResultTags:v17];

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
    && ((requiredTags = self->_requiredTags, !((unint64_t)requiredTags | v4[1]))
     || -[NSMutableArray isEqual:](requiredTags, "isEqual:")))
  {
    resultTags = self->_resultTags;
    if ((unint64_t)resultTags | v4[2]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](resultTags, "isEqual:");
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
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_requiredTags hash];
  return (unint64_t)[(NSMutableArray *)self->_resultTags hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[1];
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
        [(APPBTagTransformation *)self addRequiredTags:*(void *)(*((void *)&v19 + 1) + 8 * (void)v9)];
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
  id v10 = v4[2];
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
        -[APPBTagTransformation addResultTags:](self, "addResultTags:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), (void)v15);
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)requiredTags
{
  return self->_requiredTags;
}

- (void)setRequiredTags:(id)a3
{
}

- (NSMutableArray)resultTags
{
  return self->_resultTags;
}

- (void)setResultTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTags, 0);

  objc_storeStrong((id *)&self->_requiredTags, 0);
}

@end