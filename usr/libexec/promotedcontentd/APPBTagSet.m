@interface APPBTagSet
+ (Class)tagsType;
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tags;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tagsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tagsCount;
- (void)addTags:(id)a3;
- (void)clearTags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTags:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBTagSet

+ (id)options
{
  if (qword_100289AF0 != -1) {
    dispatch_once(&qword_100289AF0, &stru_100236090);
  }
  v2 = (void *)qword_100289AE8;

  return v2;
}

- (void)clearTags
{
}

- (void)addTags:(id)a3
{
  id v4 = a3;
  tags = self->_tags;
  id v8 = v4;
  if (!tags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tags;
    self->_tags = v6;

    id v4 = v8;
    tags = self->_tags;
  }
  [(NSMutableArray *)tags addObject:v4];
}

- (unint64_t)tagsCount
{
  return (unint64_t)[(NSMutableArray *)self->_tags count];
}

- (id)tagsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tags objectAtIndex:a3];
}

+ (Class)tagsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBTagSet;
  v3 = [(APPBTagSet *)&v7 description];
  id v4 = [(APPBTagSet *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  tags = self->_tags;
  if (tags) {
    [v3 setObject:tags forKey:@"tags"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBTagSetReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_tags;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(APPBTagSet *)self tagsCount])
  {
    [v8 clearTags];
    unint64_t v4 = [(APPBTagSet *)self tagsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(APPBTagSet *)self tagsAtIndex:i];
        [v8 addTags:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_tags;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addTags:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    tags = self->_tags;
    if ((unint64_t)tags | v4[1]) {
      unsigned __int8 v6 = -[NSMutableArray isEqual:](tags, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->_tags hash];
}

- (void)mergeFrom:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[APPBTagSet addTags:](self, "addTags:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (void).cxx_destruct
{
}

@end