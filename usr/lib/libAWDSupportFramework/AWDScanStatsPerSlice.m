@interface AWDScanStatsPerSlice
+ (Class)scanObjectType;
- (BOOL)hasAvgAgeScan;
- (BOOL)hasNumAbort;
- (BOOL)hasNumScanWifiCritical;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)scanObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)scanObjectAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)numAbort;
- (unint64_t)numChanScannedsCount;
- (unint64_t)numScanBlankedsCount;
- (unint64_t)numScanModesCount;
- (unint64_t)scanObjectsCount;
- (unsigned)avgAgeScan;
- (unsigned)numChanScannedAtIndex:(unint64_t)a3;
- (unsigned)numChanScanneds;
- (unsigned)numScanBlankedAtIndex:(unint64_t)a3;
- (unsigned)numScanBlankeds;
- (unsigned)numScanModeAtIndex:(unint64_t)a3;
- (unsigned)numScanModes;
- (unsigned)numScanWifiCritical;
- (void)addNumChanScanned:(unsigned int)a3;
- (void)addNumScanBlanked:(unsigned int)a3;
- (void)addNumScanMode:(unsigned int)a3;
- (void)addScanObject:(id)a3;
- (void)clearNumChanScanneds;
- (void)clearNumScanBlankeds;
- (void)clearNumScanModes;
- (void)clearScanObjects;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAvgAgeScan:(unsigned int)a3;
- (void)setHasAvgAgeScan:(BOOL)a3;
- (void)setHasNumAbort:(BOOL)a3;
- (void)setHasNumScanWifiCritical:(BOOL)a3;
- (void)setNumAbort:(unint64_t)a3;
- (void)setNumChanScanneds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNumScanBlankeds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNumScanModes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNumScanWifiCritical:(unsigned int)a3;
- (void)setScanObjects:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDScanStatsPerSlice

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  [(AWDScanStatsPerSlice *)self setScanObjects:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDScanStatsPerSlice;
  [(AWDScanStatsPerSlice *)&v3 dealloc];
}

- (void)setNumAbort:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numAbort = a3;
}

- (void)setHasNumAbort:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumAbort
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumScanWifiCritical:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numScanWifiCritical = a3;
}

- (void)setHasNumScanWifiCritical:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumScanWifiCritical
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAvgAgeScan:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_avgAgeScan = a3;
}

- (void)setHasAvgAgeScan:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAvgAgeScan
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)numChanScannedsCount
{
  return self->_numChanScanneds.count;
}

- (unsigned)numChanScanneds
{
  return self->_numChanScanneds.list;
}

- (void)clearNumChanScanneds
{
}

- (void)addNumChanScanned:(unsigned int)a3
{
}

- (unsigned)numChanScannedAtIndex:(unint64_t)a3
{
  p_numChanScanneds = &self->_numChanScanneds;
  unint64_t count = self->_numChanScanneds.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_numChanScanneds->list[a3];
}

- (void)setNumChanScanneds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)numScanModesCount
{
  return self->_numScanModes.count;
}

- (unsigned)numScanModes
{
  return self->_numScanModes.list;
}

- (void)clearNumScanModes
{
}

- (void)addNumScanMode:(unsigned int)a3
{
}

- (unsigned)numScanModeAtIndex:(unint64_t)a3
{
  p_numScanModes = &self->_numScanModes;
  unint64_t count = self->_numScanModes.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_numScanModes->list[a3];
}

- (void)setNumScanModes:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)numScanBlankedsCount
{
  return self->_numScanBlankeds.count;
}

- (unsigned)numScanBlankeds
{
  return self->_numScanBlankeds.list;
}

- (void)clearNumScanBlankeds
{
}

- (void)addNumScanBlanked:(unsigned int)a3
{
}

- (unsigned)numScanBlankedAtIndex:(unint64_t)a3
{
  p_numScanBlankeds = &self->_numScanBlankeds;
  unint64_t count = self->_numScanBlankeds.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_numScanBlankeds->list[a3];
}

- (void)setNumScanBlankeds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearScanObjects
{
}

- (void)addScanObject:(id)a3
{
  scanObjects = self->_scanObjects;
  if (!scanObjects)
  {
    scanObjects = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_scanObjects = scanObjects;
  }

  [(NSMutableArray *)scanObjects addObject:a3];
}

- (unint64_t)scanObjectsCount
{
  return [(NSMutableArray *)self->_scanObjects count];
}

- (id)scanObjectAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_scanObjects objectAtIndex:a3];
}

+ (Class)scanObjectType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDScanStatsPerSlice;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDScanStatsPerSlice description](&v3, sel_description), -[AWDScanStatsPerSlice dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numAbort] forKey:@"num_abort"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numScanWifiCritical] forKey:@"num_scan_wifi_critical"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_avgAgeScan] forKey:@"avg_age_scan"];
LABEL_5:
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"num_chan_scanned"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"num_scan_mode"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"num_scan_blanked"];
  if ([(NSMutableArray *)self->_scanObjects count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_scanObjects, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    scanObjects = self->_scanObjects;
    uint64_t v7 = [(NSMutableArray *)scanObjects countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(scanObjects);
          }
          [v5 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)scanObjects countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"scan_object"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDScanStatsPerSliceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_numChanScanneds.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_numChanScanneds.count);
  }
  if (self->_numScanModes.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_numScanModes.count);
  }
  if (self->_numScanBlankeds.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_numScanBlankeds.count);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  scanObjects = self->_scanObjects;
  uint64_t v9 = [(NSMutableArray *)scanObjects countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(scanObjects);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSMutableArray *)scanObjects countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_23:
    *((_DWORD *)a3 + 23) = self->_numScanWifiCritical;
    *((unsigned char *)a3 + 104) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((void *)a3 + 10) = self->_numAbort;
  *((unsigned char *)a3 + 104) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_23;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 22) = self->_avgAgeScan;
    *((unsigned char *)a3 + 104) |= 2u;
  }
LABEL_5:
  if ([(AWDScanStatsPerSlice *)self numChanScannedsCount])
  {
    [a3 clearNumChanScanneds];
    unint64_t v6 = [(AWDScanStatsPerSlice *)self numChanScannedsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addNumChanScanned:-[AWDScanStatsPerSlice numChanScannedAtIndex:](self, "numChanScannedAtIndex:", i)];
    }
  }
  if ([(AWDScanStatsPerSlice *)self numScanModesCount])
  {
    [a3 clearNumScanModes];
    unint64_t v9 = [(AWDScanStatsPerSlice *)self numScanModesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addNumScanMode:-[AWDScanStatsPerSlice numScanModeAtIndex:](self, "numScanModeAtIndex:", j)];
    }
  }
  if ([(AWDScanStatsPerSlice *)self numScanBlankedsCount])
  {
    [a3 clearNumScanBlankeds];
    unint64_t v12 = [(AWDScanStatsPerSlice *)self numScanBlankedsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [a3 addNumScanBlanked:-[AWDScanStatsPerSlice numScanBlankedAtIndex:](self, "numScanBlankedAtIndex:", k)];
    }
  }
  if ([(AWDScanStatsPerSlice *)self scanObjectsCount])
  {
    [a3 clearScanObjects];
    unint64_t v15 = [(AWDScanStatsPerSlice *)self scanObjectsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [a3 addScanObject:-[AWDScanStatsPerSlice scanObjectAtIndex:](self, "scanObjectAtIndex:", m)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 80) = self->_numAbort;
    *(unsigned char *)(v5 + 104) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 92) = self->_numScanWifiCritical;
  *(unsigned char *)(v5 + 104) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 88) = self->_avgAgeScan;
    *(unsigned char *)(v5 + 104) |= 2u;
  }
LABEL_5:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  scanObjects = self->_scanObjects;
  uint64_t v9 = [(NSMutableArray *)scanObjects countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(scanObjects);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addScanObject:v13];
      }
      uint64_t v10 = [(NSMutableArray *)scanObjects countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 104) & 1) == 0 || self->_numAbort != *((void *)a3 + 10)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)a3 + 104))
    {
LABEL_22:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 104) & 4) == 0 || self->_numScanWifiCritical != *((_DWORD *)a3 + 23)) {
        goto LABEL_22;
      }
    }
    else if ((*((unsigned char *)a3 + 104) & 4) != 0)
    {
      goto LABEL_22;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 104) & 2) == 0 || self->_avgAgeScan != *((_DWORD *)a3 + 22)) {
        goto LABEL_22;
      }
    }
    else if ((*((unsigned char *)a3 + 104) & 2) != 0)
    {
      goto LABEL_22;
    }
    int IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      int IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        int IsEqual = PBRepeatedUInt32IsEqual();
        if (IsEqual)
        {
          scanObjects = self->_scanObjects;
          if ((unint64_t)scanObjects | *((void *)a3 + 12))
          {
            LOBYTE(IsEqual) = -[NSMutableArray isEqual:](scanObjects, "isEqual:");
          }
          else
          {
            LOBYTE(IsEqual) = 1;
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  unint64_t v3 = 2654435761u * self->_numAbort;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_numScanWifiCritical;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_avgAgeScan;
LABEL_8:
  uint64_t v6 = v4 ^ v3 ^ v5 ^ PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt32Hash();
  uint64_t v8 = v6 ^ v7 ^ PBRepeatedUInt32Hash();
  return v8 ^ [(NSMutableArray *)self->_scanObjects hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 104);
  if (v5)
  {
    self->_numAbort = *((void *)a3 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 104);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 104) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numScanWifiCritical = *((_DWORD *)a3 + 23);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 104) & 2) != 0)
  {
LABEL_4:
    self->_avgAgeScan = *((_DWORD *)a3 + 22);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  uint64_t v6 = [a3 numChanScannedsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDScanStatsPerSlice addNumChanScanned:](self, "addNumChanScanned:", [a3 numChanScannedAtIndex:i]);
  }
  uint64_t v9 = [a3 numScanModesCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[AWDScanStatsPerSlice addNumScanMode:](self, "addNumScanMode:", [a3 numScanModeAtIndex:j]);
  }
  uint64_t v12 = [a3 numScanBlankedsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[AWDScanStatsPerSlice addNumScanBlanked:](self, "addNumScanBlanked:", [a3 numScanBlankedAtIndex:k]);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v15 = (void *)*((void *)a3 + 12);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t m = 0; m != v17; ++m)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [(AWDScanStatsPerSlice *)self addScanObject:*(void *)(*((void *)&v20 + 1) + 8 * m)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (unint64_t)numAbort
{
  return self->_numAbort;
}

- (unsigned)numScanWifiCritical
{
  return self->_numScanWifiCritical;
}

- (unsigned)avgAgeScan
{
  return self->_avgAgeScan;
}

- (NSMutableArray)scanObjects
{
  return self->_scanObjects;
}

- (void)setScanObjects:(id)a3
{
}

@end