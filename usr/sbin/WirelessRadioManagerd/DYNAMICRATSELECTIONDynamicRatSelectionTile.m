@interface DYNAMICRATSELECTIONDynamicRatSelectionTile
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation DYNAMICRATSELECTIONDynamicRatSelectionTile

- (void)dealloc
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, 0, 8);
  }
  v3.receiver = self;
  v3.super_class = (Class)DYNAMICRATSELECTIONDynamicRatSelectionTile;
  [(DYNAMICRATSELECTIONDynamicRatSelectionTile *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)DYNAMICRATSELECTIONDynamicRatSelectionTile;
  return +[NSString stringWithFormat:@"%@ %@", [(DYNAMICRATSELECTIONDynamicRatSelectionTile *)&v3 description], [(DYNAMICRATSELECTIONDynamicRatSelectionTile *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_dratsTiles count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_dratsTiles, "count")];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    dratsTiles = self->_dratsTiles;
    id v6 = [(NSMutableArray *)dratsTiles countByEnumeratingWithState:&v11 objects:v15 count:16];
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
            objc_enumerationMutation(dratsTiles);
          }
          [v4 addObject:[*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) dictionaryRepresentation]];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)dratsTiles countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"drats_tiles"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000274A8(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  dratsTiles = self->_dratsTiles;
  id v4 = (char *)[(NSMutableArray *)dratsTiles countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(dratsTiles);
        }
        PBDataWriterWriteSubmessage();
      }
      v5 = (char *)[(NSMutableArray *)dratsTiles countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  dratsTiles = self->_dratsTiles;
  id v7 = [(NSMutableArray *)dratsTiles countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(dratsTiles);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        sub_100027200(v5, (uint64_t)v11);

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)dratsTiles countByEnumeratingWithState:&v13 objects:v17 count:16];
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
    dratsTiles = self->_dratsTiles;
    if ((unint64_t)dratsTiles | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](dratsTiles, "isEqual:");
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
  return (unint64_t)[(NSMutableArray *)self->_dratsTiles hash];
}

@end