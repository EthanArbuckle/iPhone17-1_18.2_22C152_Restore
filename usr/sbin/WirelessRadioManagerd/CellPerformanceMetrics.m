@interface CellPerformanceMetrics
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation CellPerformanceMetrics

- (void)dealloc
{
  if (self) {
    objc_setProperty_nonatomic(self, a2, 0, 16);
  }
  v3.receiver = self;
  v3.super_class = (Class)CellPerformanceMetrics;
  [(CellPerformanceMetrics *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CellPerformanceMetrics;
  return +[NSString stringWithFormat:@"%@ %@", [(CellPerformanceMetrics *)&v3 description], [(CellPerformanceMetrics *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  gci = self->_gci;
  if (gci) {
    [v3 setObject:gci forKey:@"gci"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBandwidth)] forKey:@"dl_bandwidth"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrFr1)] forKey:@"nr_fr1"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrFr2)] forKey:@"nr_fr2"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrRsrp)] forKey:@"nr_rsrp"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrSinr)] forKey:@"nr_sinr"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrBw)] forKey:@"nr_bw"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_stallRate)] forKey:@"stall_rate"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_latency)] forKey:@"latency"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_stCount)] forKey:@"st_count"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_count)] forKey:@"count"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
LABEL_29:
    [v4 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lteRsrpFr2)] forKey:@"lte_rsrp_fr2"];
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return v4;
    }
    goto LABEL_16;
  }
LABEL_28:
  [v4 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lteRsrpFr1)] forKey:@"lte_rsrp_fr1"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_29;
  }
LABEL_15:
  if ((has & 0x200) != 0) {
LABEL_16:
  }
    [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrSabw)] forKey:@"nr_sabw"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100038C24((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_gci) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
LABEL_28:
    PBDataWriterWriteSint32Field();
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return;
    }
    goto LABEL_29;
  }
LABEL_27:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_28;
  }
LABEL_15:
  if ((has & 0x200) == 0) {
    return;
  }
LABEL_29:

  PBDataWriterWriteUint32Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[2] = [(NSString *)self->_gci copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 3) = self->_dlBandwidth;
    *((_WORD *)v5 + 34) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_nrFr1;
  *((_WORD *)v5 + 34) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 11) = self->_nrFr2;
  *((_WORD *)v5 + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 12) = self->_nrRsrp;
  *((_WORD *)v5 + 34) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v5 + 14) = self->_nrSinr;
  *((_WORD *)v5 + 34) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 9) = self->_nrBw;
  *((_WORD *)v5 + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 16) = self->_stallRate;
  *((_WORD *)v5 + 34) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 6) = self->_latency;
  *((_WORD *)v5 + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 15) = self->_stCount;
  *((_WORD *)v5 + 34) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 2) = self->_count;
  *((_WORD *)v5 + 34) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
LABEL_27:
    *((_DWORD *)v5 + 8) = self->_lteRsrpFr2;
    *((_WORD *)v5 + 34) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return v5;
    }
    goto LABEL_14;
  }
LABEL_26:
  *((_DWORD *)v5 + 7) = self->_lteRsrpFr1;
  *((_WORD *)v5 + 34) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_27;
  }
LABEL_13:
  if ((has & 0x200) != 0)
  {
LABEL_14:
    *((_DWORD *)v5 + 13) = self->_nrSabw;
    *((_WORD *)v5 + 34) |= 0x200u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    gci = self->_gci;
    if (!((unint64_t)gci | *((void *)a3 + 2))
      || (unsigned int v5 = -[NSString isEqual:](gci, "isEqual:")) != 0)
    {
      __int16 has = (__int16)self->_has;
      __int16 v8 = *((_WORD *)a3 + 34);
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_dlBandwidth != *((_DWORD *)a3 + 3)) {
          goto LABEL_68;
        }
      }
      else if ((v8 & 2) != 0)
      {
LABEL_68:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_nrFr1 != *((_DWORD *)a3 + 10)) {
          goto LABEL_68;
        }
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_nrFr2 != *((_DWORD *)a3 + 11)) {
          goto LABEL_68;
        }
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_68;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x100) == 0 || self->_nrRsrp != *((_DWORD *)a3 + 12)) {
          goto LABEL_68;
        }
      }
      else if ((*((_WORD *)a3 + 34) & 0x100) != 0)
      {
        goto LABEL_68;
      }
      if ((*(_WORD *)&self->_has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x400) == 0 || self->_nrSinr != *((_DWORD *)a3 + 14)) {
          goto LABEL_68;
        }
      }
      else if ((*((_WORD *)a3 + 34) & 0x400) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_nrBw != *((_DWORD *)a3 + 9)) {
          goto LABEL_68;
        }
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_68;
      }
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x1000) == 0 || self->_stallRate != *((_DWORD *)a3 + 16)) {
          goto LABEL_68;
        }
      }
      else if ((*((_WORD *)a3 + 34) & 0x1000) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_latency != *((_DWORD *)a3 + 6)) {
          goto LABEL_68;
        }
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_68;
      }
      if ((*(_WORD *)&self->_has & 0x800) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x800) == 0 || self->_stCount != *((_DWORD *)a3 + 15)) {
          goto LABEL_68;
        }
      }
      else if ((*((_WORD *)a3 + 34) & 0x800) != 0)
      {
        goto LABEL_68;
      }
      if (has)
      {
        if ((v8 & 1) == 0 || self->_count != *((_DWORD *)a3 + 2)) {
          goto LABEL_68;
        }
      }
      else if (v8)
      {
        goto LABEL_68;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_lteRsrpFr1 != *((_DWORD *)a3 + 7)) {
          goto LABEL_68;
        }
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_lteRsrpFr2 != *((_DWORD *)a3 + 8)) {
          goto LABEL_68;
        }
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_68;
      }
      LOBYTE(v5) = (v8 & 0x200) == 0;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x200) == 0 || self->_nrSabw != *((_DWORD *)a3 + 13)) {
          goto LABEL_68;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_gci hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_dlBandwidth;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_nrFr1;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_nrFr2;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_nrRsrp;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_nrSinr;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_nrBw;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_stallRate;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_latency;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_10:
    uint64_t v13 = 2654435761 * self->_stCount;
    if (has) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v13 = 0;
  if (has)
  {
LABEL_11:
    uint64_t v14 = 2654435761 * self->_count;
    if ((has & 8) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_12:
    uint64_t v15 = 2654435761 * self->_lteRsrpFr1;
    if ((has & 0x10) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_14;
    }
LABEL_27:
    uint64_t v17 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_25:
  uint64_t v15 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v16 = 2654435761 * self->_lteRsrpFr2;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_27;
  }
LABEL_14:
  uint64_t v17 = 2654435761 * self->_nrSabw;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

@end