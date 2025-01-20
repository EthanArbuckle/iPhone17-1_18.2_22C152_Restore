@interface APPBKeyedParameterList
+ (Class)parameterListType;
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)parameterLists;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)parameterListAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)parameterListsCount;
- (void)addParameterList:(id)a3;
- (void)clearParameterLists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setParameterLists:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBKeyedParameterList

+ (id)options
{
  if (qword_100289AC0 != -1) {
    dispatch_once(&qword_100289AC0, &stru_100235FF0);
  }
  v2 = (void *)qword_100289AB8;

  return v2;
}

- (void)clearParameterLists
{
}

- (void)addParameterList:(id)a3
{
  id v4 = a3;
  parameterLists = self->_parameterLists;
  id v8 = v4;
  if (!parameterLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_parameterLists;
    self->_parameterLists = v6;

    id v4 = v8;
    parameterLists = self->_parameterLists;
  }
  [(NSMutableArray *)parameterLists addObject:v4];
}

- (unint64_t)parameterListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_parameterLists count];
}

- (id)parameterListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_parameterLists objectAtIndex:a3];
}

+ (Class)parameterListType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBKeyedParameterList;
  v3 = [(APPBKeyedParameterList *)&v7 description];
  id v4 = [(APPBKeyedParameterList *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if ([(NSMutableArray *)self->_parameterLists count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_parameterLists, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v7 = self->_parameterLists;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation:v14];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"parameterList"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBKeyedParameterListReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    sub_10019A7E4();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_parameterLists;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
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
  [v8 setKey:self->_key];
  if ([(APPBKeyedParameterList *)self parameterListsCount])
  {
    [v8 clearParameterLists];
    unint64_t v4 = [(APPBKeyedParameterList *)self parameterListsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(APPBKeyedParameterList *)self parameterListAtIndex:i];
        [v8 addParameterList:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_key copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_parameterLists;
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
        [v5 addParameterList:v13];

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
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    parameterLists = self->_parameterLists;
    if ((unint64_t)parameterLists | v4[2]) {
      unsigned __int8 v7 = -[NSMutableArray isEqual:](parameterLists, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_key hash];
  return (unint64_t)[(NSMutableArray *)self->_parameterLists hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[APPBKeyedParameterList setKey:](self, "setKey:");
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
        -[APPBKeyedParameterList addParameterList:](self, "addParameterList:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSMutableArray)parameterLists
{
  return self->_parameterLists;
}

- (void)setParameterLists:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterLists, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end