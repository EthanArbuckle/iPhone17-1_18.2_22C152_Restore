@interface MIPSmartPlaylistInfo
- (BOOL)dynamic;
- (BOOL)enabledItemsOnly;
- (BOOL)filtered;
- (BOOL)genius;
- (BOOL)hasDynamic;
- (BOOL)hasEnabledItemsOnly;
- (BOOL)hasEvaluationOrder;
- (BOOL)hasFiltered;
- (BOOL)hasGenius;
- (BOOL)hasLimitKind;
- (BOOL)hasLimitOrder;
- (BOOL)hasLimitValue;
- (BOOL)hasLimited;
- (BOOL)hasReverseLimitOrder;
- (BOOL)hasSmartCriteria;
- (BOOL)isEqual:(id)a3;
- (BOOL)limited;
- (BOOL)readFrom:(id)a3;
- (BOOL)reverseLimitOrder;
- (NSData)smartCriteria;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)limitKind;
- (unint64_t)hash;
- (unsigned)evaluationOrder;
- (unsigned)limitOrder;
- (unsigned)limitValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDynamic:(BOOL)a3;
- (void)setEnabledItemsOnly:(BOOL)a3;
- (void)setEvaluationOrder:(unsigned int)a3;
- (void)setFiltered:(BOOL)a3;
- (void)setGenius:(BOOL)a3;
- (void)setHasDynamic:(BOOL)a3;
- (void)setHasEnabledItemsOnly:(BOOL)a3;
- (void)setHasEvaluationOrder:(BOOL)a3;
- (void)setHasFiltered:(BOOL)a3;
- (void)setHasGenius:(BOOL)a3;
- (void)setHasLimitKind:(BOOL)a3;
- (void)setHasLimitOrder:(BOOL)a3;
- (void)setHasLimitValue:(BOOL)a3;
- (void)setHasLimited:(BOOL)a3;
- (void)setHasReverseLimitOrder:(BOOL)a3;
- (void)setLimitKind:(int)a3;
- (void)setLimitOrder:(unsigned int)a3;
- (void)setLimitValue:(unsigned int)a3;
- (void)setLimited:(BOOL)a3;
- (void)setReverseLimitOrder:(BOOL)a3;
- (void)setSmartCriteria:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPSmartPlaylistInfo

- (void).cxx_destruct
{
}

- (BOOL)genius
{
  return self->_genius;
}

- (void)setSmartCriteria:(id)a3
{
}

- (NSData)smartCriteria
{
  return self->_smartCriteria;
}

- (BOOL)reverseLimitOrder
{
  return self->_reverseLimitOrder;
}

- (BOOL)enabledItemsOnly
{
  return self->_enabledItemsOnly;
}

- (unsigned)limitValue
{
  return self->_limitValue;
}

- (unsigned)limitOrder
{
  return self->_limitOrder;
}

- (unsigned)evaluationOrder
{
  return self->_evaluationOrder;
}

- (int)limitKind
{
  return self->_limitKind;
}

- (BOOL)limited
{
  return self->_limited;
}

- (BOOL)filtered
{
  return self->_filtered;
}

- (BOOL)dynamic
{
  return self->_dynamic;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 20);
  if ((v5 & 0x10) != 0)
  {
    self->_dynamic = *((unsigned char *)v4 + 32);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 20);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_filtered = *((unsigned char *)v4 + 34);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 20);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_limited = *((unsigned char *)v4 + 36);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 20);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_limitKind = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 20);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_evaluationOrder = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_limitOrder = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 20);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_limitValue = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 20);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  self->_enabledItemsOnly = *((unsigned char *)v4 + 33);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 20) & 0x200) != 0)
  {
LABEL_10:
    self->_reverseLimitOrder = *((unsigned char *)v4 + 37);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_11:
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[MIPSmartPlaylistInfo setSmartCriteria:](self, "setSmartCriteria:");
    id v4 = v6;
  }
  if ((*((_WORD *)v4 + 20) & 0x80) != 0)
  {
    self->_genius = *((unsigned char *)v4 + 35);
    *(_WORD *)&self->_has |= 0x80u;
  }
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v16 = 2654435761 * self->_dynamic;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v14 = 2654435761 * self->_filtered;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_limited;
    if ((has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_limitKind;
    if (has) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if (has)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_evaluationOrder;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_limitOrder;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_limitValue;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_enabledItemsOnly;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v10 = 2654435761 * self->_reverseLimitOrder;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v10 = 0;
LABEL_20:
  uint64_t v11 = [(NSData *)self->_smartCriteria hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v12 = 2654435761 * self->_genius;
  }
  else {
    uint64_t v12 = 0;
  }
  return v15 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_68;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 20);
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_68;
    }
    if (self->_dynamic)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_68;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_68;
    }
    if (self->_filtered)
    {
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 34))
    {
      goto LABEL_68;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 20) & 0x100) == 0) {
      goto LABEL_68;
    }
    if (self->_limited)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)v4 + 20) & 0x100) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_limitKind != *((_DWORD *)v4 + 3)) {
      goto LABEL_68;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_68;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_evaluationOrder != *((_DWORD *)v4 + 2)) {
      goto LABEL_68;
    }
  }
  else if (v6)
  {
    goto LABEL_68;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_limitOrder != *((_DWORD *)v4 + 4)) {
      goto LABEL_68;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_limitValue != *((_DWORD *)v4 + 5)) {
      goto LABEL_68;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_68;
    }
    if (self->_enabledItemsOnly)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_68;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 20) & 0x200) == 0) {
      goto LABEL_68;
    }
    if (self->_reverseLimitOrder)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)v4 + 20) & 0x200) != 0)
  {
    goto LABEL_68;
  }
  smartCriteria = self->_smartCriteria;
  if ((unint64_t)smartCriteria | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](smartCriteria, "isEqual:")) {
      goto LABEL_68;
    }
    __int16 has = (__int16)self->_has;
    __int16 v6 = *((_WORD *)v4 + 20);
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_genius)
      {
        if (!*((unsigned char *)v4 + 35)) {
          goto LABEL_68;
        }
      }
      else if (*((unsigned char *)v4 + 35))
      {
        goto LABEL_68;
      }
      BOOL v8 = 1;
      goto LABEL_69;
    }
LABEL_68:
    BOOL v8 = 0;
    goto LABEL_69;
  }
  BOOL v8 = (v6 & 0x80) == 0;
LABEL_69:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_dynamic;
    *(_WORD *)(v5 + 40) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 34) = self->_filtered;
  *(_WORD *)(v5 + 40) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(unsigned char *)(v5 + 36) = self->_limited;
  *(_WORD *)(v5 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 12) = self->_limitKind;
  *(_WORD *)(v5 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 8) = self->_evaluationOrder;
  *(_WORD *)(v5 + 40) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 16) = self->_limitOrder;
  *(_WORD *)(v5 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 20) = self->_limitValue;
  *(_WORD *)(v5 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  *(unsigned char *)(v5 + 33) = self->_enabledItemsOnly;
  *(_WORD *)(v5 + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    *(unsigned char *)(v5 + 37) = self->_reverseLimitOrder;
    *(_WORD *)(v5 + 40) |= 0x200u;
  }
LABEL_11:
  uint64_t v8 = [(NSData *)self->_smartCriteria copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(unsigned char *)(v6 + 35) = self->_genius;
    *(_WORD *)(v6 + 40) |= 0x80u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[32] = self->_dynamic;
    *((_WORD *)v4 + 20) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v4[34] = self->_filtered;
  *((_WORD *)v4 + 20) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[36] = self->_limited;
  *((_WORD *)v4 + 20) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 3) = self->_limitKind;
  *((_WORD *)v4 + 20) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 2) = self->_evaluationOrder;
  *((_WORD *)v4 + 20) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 4) = self->_limitOrder;
  *((_WORD *)v4 + 20) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 5) = self->_limitValue;
  *((_WORD *)v4 + 20) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  v4[33] = self->_enabledItemsOnly;
  *((_WORD *)v4 + 20) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v4[37] = self->_reverseLimitOrder;
    *((_WORD *)v4 + 20) |= 0x200u;
  }
LABEL_11:
  if (self->_smartCriteria)
  {
    uint64_t v6 = v4;
    objc_msgSend(v4, "setSmartCriteria:");
    id v4 = v6;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v4[35] = self->_genius;
    *((_WORD *)v4 + 20) |= 0x80u;
  }
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_smartCriteria) {
    PBDataWriterWriteDataField();
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPSmartPlaylistInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v9 = [NSNumber numberWithBool:self->_dynamic];
    [v3 setObject:v9 forKey:@"dynamic"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v10 = [NSNumber numberWithBool:self->_filtered];
  [v3 setObject:v10 forKey:@"filtered"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v11 = [NSNumber numberWithBool:self->_limited];
  [v3 setObject:v11 forKey:@"limited"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v12 = [NSNumber numberWithInt:self->_limitKind];
  [v3 setObject:v12 forKey:@"limitKind"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v13 = [NSNumber numberWithUnsignedInt:self->_evaluationOrder];
  [v3 setObject:v13 forKey:@"evaluationOrder"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v14 = [NSNumber numberWithUnsignedInt:self->_limitOrder];
  [v3 setObject:v14 forKey:@"limitOrder"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v15 = [NSNumber numberWithUnsignedInt:self->_limitValue];
  [v3 setObject:v15 forKey:@"limitValue"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  uint64_t v16 = [NSNumber numberWithBool:self->_enabledItemsOnly];
  [v3 setObject:v16 forKey:@"enabledItemsOnly"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    id v5 = [NSNumber numberWithBool:self->_reverseLimitOrder];
    [v3 setObject:v5 forKey:@"reverseLimitOrder"];
  }
LABEL_11:
  smartCriteria = self->_smartCriteria;
  if (smartCriteria) {
    [v3 setObject:smartCriteria forKey:@"smartCriteria"];
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    uint64_t v7 = [NSNumber numberWithBool:self->_genius];
    [v3 setObject:v7 forKey:@"genius"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPSmartPlaylistInfo;
  id v4 = [(MIPSmartPlaylistInfo *)&v8 description];
  id v5 = [(MIPSmartPlaylistInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasGenius
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasGenius:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setGenius:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_genius = a3;
}

- (BOOL)hasSmartCriteria
{
  return self->_smartCriteria != 0;
}

- (BOOL)hasReverseLimitOrder
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasReverseLimitOrder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setReverseLimitOrder:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_reverseLimitOrder = a3;
}

- (BOOL)hasEnabledItemsOnly
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasEnabledItemsOnly:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setEnabledItemsOnly:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_enabledItemsOnly = a3;
}

- (BOOL)hasLimitValue
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasLimitValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setLimitValue:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_limitValue = a3;
}

- (BOOL)hasLimitOrder
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasLimitOrder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setLimitOrder:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_limitOrder = a3;
}

- (BOOL)hasEvaluationOrder
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasEvaluationOrder:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setEvaluationOrder:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_evaluationOrder = a3;
}

- (BOOL)hasLimitKind
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasLimitKind:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setLimitKind:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_limitKind = a3;
}

- (BOOL)hasLimited
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasLimited:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setLimited:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_limited = a3;
}

- (BOOL)hasFiltered
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasFiltered:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setFiltered:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_filtered = a3;
}

- (BOOL)hasDynamic
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasDynamic:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setDynamic:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dynamic = a3;
}

@end