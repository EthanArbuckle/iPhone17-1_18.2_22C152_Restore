@interface MBSKeySet
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)keys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)keysCount;
- (void)addKey:(id)a3;
- (void)clearKeys;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSKeySet

- (void)dealloc
{
  [(MBSKeySet *)self setKeys:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSKeySet;
  [(MBSKeySet *)&v3 dealloc];
}

- (void)clearKeys
{
}

- (void)addKey:(id)a3
{
  keys = self->_keys;
  if (!keys)
  {
    keys = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_keys = keys;
  }
  [(NSMutableArray *)keys addObject:a3];
}

- (unint64_t)keysCount
{
  return (unint64_t)[(NSMutableArray *)self->_keys count];
}

- (id)keyAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_keys objectAtIndex:a3];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSKeySet;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSKeySet *)&v3 description], [(MBSKeySet *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_keys count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_keys, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    keys = self->_keys;
    id v6 = [(NSMutableArray *)keys countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(keys);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "dictionaryRepresentation"));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)keys countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"key"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      if (v6++ >= 9)
      {
        LODWORD(v7) = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v7) = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    if ((v7 & 0x7FFF8) == 8)
    {
      long long v13 = objc_alloc_init(MBSKey);
      [(MBSKeySet *)self addKey:v13];

      if (!PBReaderPlaceMark() || (MBSKeyReadFrom((uint64_t)v13, (uint64_t)a3) & 1) == 0)
      {
        LOBYTE(v14) = 0;
        return v14;
      }
      PBReaderRecallMark();
    }
    else
    {
      int v14 = PBReaderSkipValueWithTag();
      if (!v14) {
        return v14;
      }
    }
  }
  LOBYTE(v14) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
}

- (void)writeTo:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  keys = self->_keys;
  id v4 = (char *)[(NSMutableArray *)keys countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    char v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(keys);
        }
        PBDataWriterWriteSubmessage();
      }
      char v5 = (char *)[(NSMutableArray *)keys countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)copyTo:(id)a3
{
  if ([(MBSKeySet *)self keysCount])
  {
    [a3 clearKeys];
    unint64_t v5 = [(MBSKeySet *)self keysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addKey:", -[MBSKeySet keyAtIndex:](self, "keyAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  keys = self->_keys;
  id v7 = [(NSMutableArray *)keys countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(keys);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addKey:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)keys countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    keys = self->_keys;
    if ((unint64_t)keys | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](keys, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->_keys hash];
}

- (void)mergeFrom:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (void *)*((void *)a3 + 1);
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
        [(MBSKeySet *)self addKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

@end