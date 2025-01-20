@interface CellPreformanceTile
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation CellPreformanceTile

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
  }
  v4.receiver = self;
  v4.super_class = (Class)CellPreformanceTile;
  [(CellPreformanceTile *)&v4 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CellPreformanceTile;
  return +[NSString stringWithFormat:@"%@ %@", [(CellPreformanceTile *)&v3 description], [(CellPreformanceTile *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_lteCells count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_lteCells, "count")];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    lteCells = self->_lteCells;
    id v6 = [(NSMutableArray *)lteCells countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(lteCells);
          }
          [v4 addObject:[*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation]];
        }
        id v7 = [(NSMutableArray *)lteCells countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"lteCells"];
  }
  if ([(NSMutableArray *)self->_nrCells count])
  {
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_nrCells, "count")];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    nrCells = self->_nrCells;
    id v12 = [(NSMutableArray *)nrCells countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(nrCells);
          }
          [v10 addObject:[*(id *)(*((void *)&v17 + 1) + 8 * (void)j) dictionaryRepresentation]];
        }
        id v13 = [(NSMutableArray *)nrCells countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"nrCells"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100035F54(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  lteCells = self->_lteCells;
  v5 = (char *)[(NSMutableArray *)lteCells countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(lteCells);
        }
        PBDataWriterWriteSubmessage();
      }
      id v6 = (char *)[(NSMutableArray *)lteCells countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  nrCells = self->_nrCells;
  id v10 = (char *)[(NSMutableArray *)nrCells countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(nrCells);
        }
        PBDataWriterWriteSubmessage();
      }
      v11 = (char *)[(NSMutableArray *)nrCells countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  lteCells = self->_lteCells;
  id v7 = [(NSMutableArray *)lteCells countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(lteCells);
        }
        id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        sub_100035B0C(v5, (uint64_t)v11);
      }
      id v8 = [(NSMutableArray *)lteCells countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  nrCells = self->_nrCells;
  id v13 = [(NSMutableArray *)nrCells countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(nrCells);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)j) copyWithZone:a3];
        sub_100035BF4(v5, (uint64_t)v17);
      }
      id v14 = [(NSMutableArray *)nrCells countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    lteCells = self->_lteCells;
    if (!((unint64_t)lteCells | *((void *)a3 + 1))
      || (unsigned int v5 = -[NSMutableArray isEqual:](lteCells, "isEqual:")) != 0)
    {
      nrCells = self->_nrCells;
      if ((unint64_t)nrCells | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](nrCells, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_lteCells hash];
  return (unint64_t)[(NSMutableArray *)self->_nrCells hash] ^ v3;
}

@end