@interface COMAPPLEPROACTIVEGMSGMSAssetEvent
- (BOOL)hasLatencyMillis;
- (BOOL)hasLoadReason;
- (BOOL)hasLoadResult;
- (BOOL)hasLoadType;
- (BOOL)hasMemoryCostKB;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)latencyMillis;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)loadReasonAsString:(int)a3;
- (id)loadResultAsString:(int)a3;
- (id)loadTypeAsString:(int)a3;
- (int)StringAsLoadReason:(id)a3;
- (int)StringAsLoadResult:(id)a3;
- (int)StringAsLoadType:(id)a3;
- (int)loadReason;
- (int)loadResult;
- (int)loadType;
- (int64_t)version;
- (unint64_t)hash;
- (unint64_t)memoryCostKB;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLatencyMillis:(BOOL)a3;
- (void)setHasLoadReason:(BOOL)a3;
- (void)setHasLoadResult:(BOOL)a3;
- (void)setHasLoadType:(BOOL)a3;
- (void)setHasMemoryCostKB:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLatencyMillis:(double)a3;
- (void)setLoadReason:(int)a3;
- (void)setLoadResult:(int)a3;
- (void)setLoadType:(int)a3;
- (void)setMemoryCostKB:(unint64_t)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEPROACTIVEGMSGMSAssetEvent

- (double)latencyMillis
{
  return self->_latencyMillis;
}

- (unint64_t)memoryCostKB
{
  return self->_memoryCostKB;
}

- (int64_t)version
{
  return self->_version;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_version = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_loadType = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_loadReason = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_loadResult = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_memoryCostKB = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 44))
  {
LABEL_7:
    self->_latencyMillis = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_version;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_loadType;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_loadReason;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_loadResult;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    unint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v11 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v11;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_memoryCostKB;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  double latencyMillis = self->_latencyMillis;
  double v8 = -latencyMillis;
  if (latencyMillis >= 0.0) {
    double v8 = self->_latencyMillis;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_version != *((void *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0 || self->_loadType != *((_DWORD *)v4 + 10)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_loadReason != *((_DWORD *)v4 + 8)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0 || self->_loadResult != *((_DWORD *)v4 + 9)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_memoryCostKB != *((void *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_latencyMillis != *((double *)v4 + 1)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_version;
    *((unsigned char *)result + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_loadType;
  *((unsigned char *)result + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_loadReason;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 9) = self->_loadResult;
  *((unsigned char *)result + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)result + 2) = self->_memoryCostKB;
  *((unsigned char *)result + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_7:
  *((void *)result + 1) = *(void *)&self->_latencyMillis;
  *((unsigned char *)result + 44) |= 1u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_version;
    *((unsigned char *)v4 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_loadType;
  *((unsigned char *)v4 + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v4 + 8) = self->_loadReason;
  *((unsigned char *)v4 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 9) = self->_loadResult;
  *((unsigned char *)v4 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v4[2] = self->_memoryCostKB;
  *((unsigned char *)v4 + 44) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v4[1] = *(void *)&self->_latencyMillis;
    *((unsigned char *)v4 + 44) |= 1u;
  }
LABEL_8:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSAssetEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithLongLong:self->_version];
    [v3 setObject:v7 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  uint64_t loadType = self->_loadType;
  if (loadType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_loadType);
    long double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long double v9 = off_1E56C43D0[loadType];
  }
  [v3 setObject:v9 forKey:@"loadType"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_16:
  uint64_t loadReason = self->_loadReason;
  if (loadReason >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_loadReason);
    unint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v11 = off_1E56C43E8[loadReason];
  }
  [v3 setObject:v11 forKey:@"loadReason"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_20:
  uint64_t loadResult = self->_loadResult;
  if (loadResult >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_loadResult);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E56C4410[loadResult];
  }
  [v3 setObject:v13 forKey:@"loadResult"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_24:
  v14 = [NSNumber numberWithUnsignedLongLong:self->_memoryCostKB];
  [v3 setObject:v14 forKey:@"memoryCostKB"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    id v5 = [NSNumber numberWithDouble:self->_latencyMillis];
    [v3 setObject:v5 forKey:@"latencyMillis"];
  }
LABEL_8:

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSAssetEvent;
  id v4 = [(COMAPPLEPROACTIVEGMSGMSAssetEvent *)&v8 description];
  id v5 = [(COMAPPLEPROACTIVEGMSGMSAssetEvent *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLatencyMillis
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLatencyMillis:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLatencyMillis:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double latencyMillis = a3;
}

- (BOOL)hasMemoryCostKB
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMemoryCostKB:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMemoryCostKB:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_memoryCostKB = a3;
}

- (int)StringAsLoadResult:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GMS_LOAD_RESULT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_RESULT_LOADED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_RESULT_UNLOADED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_RESULT_LOAD_FAILURE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_RESULT_UNLOAD_FAILURE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)loadResultAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E56C4410[a3];
  }

  return v3;
}

- (BOOL)hasLoadResult
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasLoadResult:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setLoadResult:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_uint64_t loadResult = a3;
}

- (int)loadResult
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_loadResult;
  }
  else {
    return 0;
  }
}

- (int)StringAsLoadReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GMS_LOAD_REASON_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_REASON_USER_INITIATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_REASON_POLICY_CHANGE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_REASON_MEMORY_BUDGET_PRESSURE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_REASON_ACQUISITION_ERROR"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)loadReasonAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E56C43E8[a3];
  }

  return v3;
}

- (BOOL)hasLoadReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasLoadReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setLoadReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t loadReason = a3;
}

- (int)loadReason
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_loadReason;
  }
  else {
    return 0;
  }
}

- (int)StringAsLoadType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GMS_LOAD_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_TYPE_LOAD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GMS_LOAD_TYPE_UNLOAD"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)loadTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E56C43D0[a3];
  }

  return v3;
}

- (BOOL)hasLoadType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasLoadType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setLoadType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_uint64_t loadType = a3;
}

- (int)loadType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_loadType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

@end