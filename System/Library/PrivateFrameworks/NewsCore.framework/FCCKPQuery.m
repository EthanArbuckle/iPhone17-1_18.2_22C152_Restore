@interface FCCKPQuery
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addFilters:(uint64_t)a1;
- (uint64_t)addSorts:(uint64_t)a1;
- (uint64_t)addTypes:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPQuery

- (uint64_t)addFilters:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 8);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v6;

      v5 = *(void **)(a1 + 8);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)addTypes:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_sorts, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v5 = self->_types;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v10 = self->_filters;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v15 = self->_sorts;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
}

- (uint64_t)addSorts:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPQuery;
  id v4 = [(FCCKPQuery *)&v8 description];
  v5 = [(FCCKPQuery *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_types count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_types, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v5 = self->_types;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v38 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"types"];
  }
  if ([(NSMutableArray *)self->_filters count])
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filters, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v12 = self->_filters;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v33 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"filters"];
  }
  if ([(NSMutableArray *)self->_sorts count])
  {
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sorts, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v19 = self->_sorts;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * k), "dictionaryRepresentation", (void)v29);
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"sorts"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    long long v26 = [NSNumber numberWithBool:self->_distinct];
    [v3 setObject:v26 forKey:@"distinct"];

    char has = (char)self->_has;
  }
  if (has)
  {
    long long v27 = [NSNumber numberWithInt:self->_queryOperator];
    [v3 setObject:v27 forKey:@"queryOperator"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v6 = self->_types;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        -[FCCKPQuery addTypes:](v5, v11);
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = self->_filters;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * j) copyWithZone:a3];
        -[FCCKPQuery addFilters:](v5, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v14);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = self->_sorts;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (void)v26);
        -[FCCKPQuery addSorts:](v5, v23);
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_distinct;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_queryOperator;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  types = self->_types;
  if ((unint64_t)types | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](types, "isEqual:")) {
      goto LABEL_20;
    }
  }
  filters = self->_filters;
  if ((unint64_t)filters | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](filters, "isEqual:")) {
      goto LABEL_20;
    }
  }
  sorts = self->_sorts;
  if ((unint64_t)sorts | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](sorts, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_distinct)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_16;
      }
    }
LABEL_20:
    BOOL v8 = 0;
    goto LABEL_21;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  BOOL v8 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_queryOperator != *((_DWORD *)v4 + 4)) {
      goto LABEL_20;
    }
    BOOL v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_types hash];
  uint64_t v4 = [(NSMutableArray *)self->_filters hash];
  uint64_t v5 = [(NSMutableArray *)self->_sorts hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_distinct;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_queryOperator;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

@end