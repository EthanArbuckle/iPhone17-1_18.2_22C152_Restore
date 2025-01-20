@interface NRPBDeviceCollectionHistory
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addHistory:(uint64_t)a1;
- (unint64_t)hash;
- (void)setHistorys:(uint64_t)a1;
- (void)setSwitchRecords:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation NRPBDeviceCollectionHistory

- (uint64_t)addHistory:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 16);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;

      v5 = *(void **)(a1 + 16);
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
  v8.super_class = (Class)NRPBDeviceCollectionHistory;
  id v4 = [(NRPBDeviceCollectionHistory *)&v8 description];
  v5 = [(NRPBDeviceCollectionHistory *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_startIndex];
    [v3 setObject:v4 forKey:@"startIndex"];
  }
  if ([(NSMutableArray *)self->_historys count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_historys, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = self->_historys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"history"];
  }
  switchRecords = self->_switchRecords;
  if (switchRecords)
  {
    v13 = [(NRPBSwitchRecordCollection *)switchRecords dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"switchRecords"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  id v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        v25 = objc_alloc_init(NRPBSwitchRecordCollection);
        objc_storeStrong((id *)&self->_switchRecords, v25);
        if (!PBReaderPlaceMark()
          || (NRPBSwitchRecordCollectionReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0)
        {
LABEL_42:

          LOBYTE(v26) = 0;
          return v26;
        }
      }
      else
      {
        if (v18 != 2)
        {
          if (v18 == 1)
          {
            char v19 = 0;
            unsigned int v20 = 0;
            int64_t v21 = 0;
            *(unsigned char *)&self->_has |= 1u;
            while (1)
            {
              uint64_t v22 = *v4;
              unint64_t v23 = *(void *)((char *)a3 + v22);
              if (v23 == -1 || v23 >= *(void *)((char *)a3 + *v5)) {
                break;
              }
              char v24 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v23);
              *(void *)((char *)a3 + v22) = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if ((v24 & 0x80) == 0) {
                goto LABEL_37;
              }
              v19 += 7;
              BOOL v15 = v20++ >= 9;
              if (v15)
              {
                int64_t v21 = 0;
                goto LABEL_39;
              }
            }
            *((unsigned char *)a3 + *v6) = 1;
LABEL_37:
            if (*((unsigned char *)a3 + *v6)) {
              int64_t v21 = 0;
            }
LABEL_39:
            self->_startIndex = v21;
          }
          else
          {
            int v26 = PBReaderSkipValueWithTag();
            if (!v26) {
              return v26;
            }
          }
          continue;
        }
        v25 = objc_alloc_init(NRPBDeviceCollectionHistoryEntry);
        -[NRPBDeviceCollectionHistory addHistory:]((uint64_t)self, v25);
        if (!PBReaderPlaceMark()
          || (NRPBDeviceCollectionHistoryEntryReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0)
        {
          goto LABEL_42;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v26) = *((unsigned char *)a3 + *v6) == 0;
  return v26;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_historys;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_switchRecords) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)setSwitchRecords:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_startIndex;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_historys;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        -[NRPBDeviceCollectionHistory addHistory:]((uint64_t)v6, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(NRPBSwitchRecordCollection *)self->_switchRecords copyWithZone:a3];
  char v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_startIndex != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  historys = self->_historys;
  if ((unint64_t)historys | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](historys, "isEqual:"))
  {
    goto LABEL_11;
  }
  switchRecords = self->_switchRecords;
  if ((unint64_t)switchRecords | *((void *)v4 + 3)) {
    char v7 = -[NRPBSwitchRecordCollection isEqual:](switchRecords, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_startIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_historys hash] ^ v3;
  return v4 ^ [(NRPBSwitchRecordCollection *)self->_switchRecords hash];
}

- (void)setHistorys:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchRecords, 0);

  objc_storeStrong((id *)&self->_historys, 0);
}

@end