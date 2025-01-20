@interface NMSMediaSyncServiceKeepLocalOptions
- (BOOL)hasCellularBundleIdentifier;
- (BOOL)hasDownloadOffPowerPolicy;
- (BOOL)hasDownloadOnCellularPolicy;
- (BOOL)hasQualityOfService;
- (BOOL)hasRequiresValidation;
- (BOOL)hasTimeout;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresValidation;
- (NSString)cellularBundleIdentifier;
- (double)timeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)downloadOffPowerPolicyAsString:(int)a3;
- (id)downloadOnCellularPolicyAsString:(int)a3;
- (id)qualityOfServiceAsString:(int)a3;
- (int)StringAsDownloadOffPowerPolicy:(id)a3;
- (int)StringAsDownloadOnCellularPolicy:(id)a3;
- (int)StringAsQualityOfService:(id)a3;
- (int)downloadOffPowerPolicy;
- (int)downloadOnCellularPolicy;
- (int)qualityOfService;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCellularBundleIdentifier:(id)a3;
- (void)setDownloadOffPowerPolicy:(int)a3;
- (void)setDownloadOnCellularPolicy:(int)a3;
- (void)setHasDownloadOffPowerPolicy:(BOOL)a3;
- (void)setHasDownloadOnCellularPolicy:(BOOL)a3;
- (void)setHasQualityOfService:(BOOL)a3;
- (void)setHasRequiresValidation:(BOOL)a3;
- (void)setHasTimeout:(BOOL)a3;
- (void)setQualityOfService:(int)a3;
- (void)setRequiresValidation:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NMSMediaSyncServiceKeepLocalOptions

- (void)setRequiresValidation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_requiresValidation = a3;
}

- (void)setHasRequiresValidation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRequiresValidation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)downloadOffPowerPolicy
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_downloadOffPowerPolicy;
  }
  else {
    return 0;
  }
}

- (void)setDownloadOffPowerPolicy:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_downloadOffPowerPolicy = a3;
}

- (void)setHasDownloadOffPowerPolicy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDownloadOffPowerPolicy
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)downloadOffPowerPolicyAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264634268[a3];
  }

  return v3;
}

- (int)StringAsDownloadOffPowerPolicy:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Allowed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NotAllowed"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)downloadOnCellularPolicy
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_downloadOnCellularPolicy;
  }
  else {
    return 0;
  }
}

- (void)setDownloadOnCellularPolicy:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_downloadOnCellularPolicy = a3;
}

- (void)setHasDownloadOnCellularPolicy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDownloadOnCellularPolicy
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)downloadOnCellularPolicyAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264634268[a3];
  }

  return v3;
}

- (int)StringAsDownloadOnCellularPolicy:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Allowed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NotAllowed"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)qualityOfService
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_qualityOfService;
  }
  else {
    return 4;
  }
}

- (void)setQualityOfService:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_qualityOfService = a3;
}

- (void)setHasQualityOfService:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasQualityOfService
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)qualityOfServiceAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264634280[a3];
  }

  return v3;
}

- (int)StringAsQualityOfService:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UserInteractive"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UserInitiated"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Utility"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Background"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else
  {
    int v4 = 4;
  }

  return v4;
}

- (void)setTimeout:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeout = a3;
}

- (void)setHasTimeout:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeout
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCellularBundleIdentifier
{
  return self->_cellularBundleIdentifier != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NMSMediaSyncServiceKeepLocalOptions;
  int v4 = [(NMSMediaSyncServiceKeepLocalOptions *)&v8 description];
  v5 = [(NMSMediaSyncServiceKeepLocalOptions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_requiresValidation];
    [v3 setObject:v8 forKey:@"requiresValidation"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t downloadOffPowerPolicy = self->_downloadOffPowerPolicy;
  if (downloadOffPowerPolicy >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_downloadOffPowerPolicy);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_264634268[downloadOffPowerPolicy];
  }
  [v3 setObject:v10 forKey:@"downloadOffPowerPolicy"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_17:
  uint64_t downloadOnCellularPolicy = self->_downloadOnCellularPolicy;
  if (downloadOnCellularPolicy >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_downloadOnCellularPolicy);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_264634268[downloadOnCellularPolicy];
  }
  [v3 setObject:v12 forKey:@"downloadOnCellularPolicy"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_21:
  uint64_t qualityOfService = self->_qualityOfService;
  if (qualityOfService >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_qualityOfService);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_264634280[qualityOfService];
  }
  [v3 setObject:v14 forKey:@"qualityOfService"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v5 = [NSNumber numberWithDouble:self->_timeout];
    [v3 setObject:v5 forKey:@"timeout"];
  }
LABEL_7:
  cellularBundleIdentifier = self->_cellularBundleIdentifier;
  if (cellularBundleIdentifier) {
    [v3 setObject:cellularBundleIdentifier forKey:@"cellularBundleIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NMSMediaSyncServiceKeepLocalOptionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
  if (self->_cellularBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[36] = self->_requiresValidation;
    v4[40] |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_downloadOffPowerPolicy;
  v4[40] |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 7) = self->_downloadOnCellularPolicy;
  v4[40] |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  *((_DWORD *)v4 + 8) = self->_qualityOfService;
  v4[40] |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = *(void *)&self->_timeout;
    v4[40] |= 1u;
  }
LABEL_7:
  if (self->_cellularBundleIdentifier)
  {
    id v6 = v4;
    objc_msgSend(v4, "setCellularBundleIdentifier:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 36) = self->_requiresValidation;
    *(unsigned char *)(v5 + 40) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_downloadOffPowerPolicy;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v5 + 32) = self->_qualityOfService;
    *(unsigned char *)(v5 + 40) |= 8u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 28) = self->_downloadOnCellularPolicy;
  *(unsigned char *)(v5 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    *(double *)(v5 + 8) = self->_timeout;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
LABEL_7:
  uint64_t v8 = [(NSString *)self->_cellularBundleIdentifier copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
    {
      if (self->_requiresValidation)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_32;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_10;
      }
    }
LABEL_32:
    char v6 = 0;
    goto LABEL_33;
  }
  if ((*((unsigned char *)v4 + 40) & 0x10) != 0) {
    goto LABEL_32;
  }
LABEL_10:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_downloadOffPowerPolicy != *((_DWORD *)v4 + 6)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_downloadOnCellularPolicy != *((_DWORD *)v4 + 7)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_qualityOfService != *((_DWORD *)v4 + 8)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timeout != *((double *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_32;
  }
  cellularBundleIdentifier = self->_cellularBundleIdentifier;
  if ((unint64_t)cellularBundleIdentifier | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](cellularBundleIdentifier, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_33:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_requiresValidation;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_downloadOffPowerPolicy;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_downloadOnCellularPolicy;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_13:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ [(NSString *)self->_cellularBundleIdentifier hash];
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_qualityOfService;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  double timeout = self->_timeout;
  double v8 = -timeout;
  if (timeout >= 0.0) {
    double v8 = self->_timeout;
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ [(NSString *)self->_cellularBundleIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x10) != 0)
  {
    self->_requiresValidation = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t downloadOffPowerPolicy = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_uint64_t downloadOnCellularPolicy = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  self->_uint64_t qualityOfService = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 40))
  {
LABEL_6:
    self->_double timeout = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[NMSMediaSyncServiceKeepLocalOptions setCellularBundleIdentifier:](self, "setCellularBundleIdentifier:");
    id v4 = v6;
  }
}

- (BOOL)requiresValidation
{
  return self->_requiresValidation;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSString)cellularBundleIdentifier
{
  return self->_cellularBundleIdentifier;
}

- (void)setCellularBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end