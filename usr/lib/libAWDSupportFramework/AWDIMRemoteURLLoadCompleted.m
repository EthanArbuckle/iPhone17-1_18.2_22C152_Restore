@interface AWDIMRemoteURLLoadCompleted
- (BOOL)hasConnectEndToRequestStartMillis;
- (BOOL)hasConnectStartToConnectEndMillis;
- (BOOL)hasConnectStartToSecureConnectionStartMillis;
- (BOOL)hasDomainLookupEndToConnectStartMillis;
- (BOOL)hasDomainLookupStartToDomainLookupEndMillis;
- (BOOL)hasFetchStartToDomainLookupStartMillis;
- (BOOL)hasNavigationStartToRedirectStartMillis;
- (BOOL)hasRedirectEndToFetchStartMillis;
- (BOOL)hasRedirectStartToRedirectEndMillis;
- (BOOL)hasRequestStartToResponseStartMillis;
- (BOOL)hasResponseStartToResponseEndMillis;
- (BOOL)hasSecureConnectionStartToConnectEndMillis;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)connectEndToRequestStartMillis;
- (unint64_t)connectStartToConnectEndMillis;
- (unint64_t)connectStartToSecureConnectionStartMillis;
- (unint64_t)domainLookupEndToConnectStartMillis;
- (unint64_t)domainLookupStartToDomainLookupEndMillis;
- (unint64_t)fetchStartToDomainLookupStartMillis;
- (unint64_t)hash;
- (unint64_t)navigationStartToRedirectStartMillis;
- (unint64_t)redirectEndToFetchStartMillis;
- (unint64_t)redirectStartToRedirectEndMillis;
- (unint64_t)requestStartToResponseStartMillis;
- (unint64_t)responseStartToResponseEndMillis;
- (unint64_t)secureConnectionStartToConnectEndMillis;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectEndToRequestStartMillis:(unint64_t)a3;
- (void)setConnectStartToConnectEndMillis:(unint64_t)a3;
- (void)setConnectStartToSecureConnectionStartMillis:(unint64_t)a3;
- (void)setDomainLookupEndToConnectStartMillis:(unint64_t)a3;
- (void)setDomainLookupStartToDomainLookupEndMillis:(unint64_t)a3;
- (void)setFetchStartToDomainLookupStartMillis:(unint64_t)a3;
- (void)setHasConnectEndToRequestStartMillis:(BOOL)a3;
- (void)setHasConnectStartToConnectEndMillis:(BOOL)a3;
- (void)setHasConnectStartToSecureConnectionStartMillis:(BOOL)a3;
- (void)setHasDomainLookupEndToConnectStartMillis:(BOOL)a3;
- (void)setHasDomainLookupStartToDomainLookupEndMillis:(BOOL)a3;
- (void)setHasFetchStartToDomainLookupStartMillis:(BOOL)a3;
- (void)setHasNavigationStartToRedirectStartMillis:(BOOL)a3;
- (void)setHasRedirectEndToFetchStartMillis:(BOOL)a3;
- (void)setHasRedirectStartToRedirectEndMillis:(BOOL)a3;
- (void)setHasRequestStartToResponseStartMillis:(BOOL)a3;
- (void)setHasResponseStartToResponseEndMillis:(BOOL)a3;
- (void)setHasSecureConnectionStartToConnectEndMillis:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNavigationStartToRedirectStartMillis:(unint64_t)a3;
- (void)setRedirectEndToFetchStartMillis:(unint64_t)a3;
- (void)setRedirectStartToRedirectEndMillis:(unint64_t)a3;
- (void)setRequestStartToResponseStartMillis:(unint64_t)a3;
- (void)setResponseStartToResponseEndMillis:(unint64_t)a3;
- (void)setSecureConnectionStartToConnectEndMillis:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIMRemoteURLLoadCompleted

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setNavigationStartToRedirectStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_navigationStartToRedirectStartMillis = a3;
}

- (void)setHasNavigationStartToRedirectStartMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNavigationStartToRedirectStartMillis
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRedirectStartToRedirectEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_redirectStartToRedirectEndMillis = a3;
}

- (void)setHasRedirectStartToRedirectEndMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRedirectStartToRedirectEndMillis
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRedirectEndToFetchStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_redirectEndToFetchStartMillis = a3;
}

- (void)setHasRedirectEndToFetchStartMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRedirectEndToFetchStartMillis
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setFetchStartToDomainLookupStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_fetchStartToDomainLookupStartMillis = a3;
}

- (void)setHasFetchStartToDomainLookupStartMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFetchStartToDomainLookupStartMillis
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDomainLookupStartToDomainLookupEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_domainLookupStartToDomainLookupEndMillis = a3;
}

- (void)setHasDomainLookupStartToDomainLookupEndMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDomainLookupStartToDomainLookupEndMillis
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDomainLookupEndToConnectStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_domainLookupEndToConnectStartMillis = a3;
}

- (void)setHasDomainLookupEndToConnectStartMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDomainLookupEndToConnectStartMillis
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setConnectStartToSecureConnectionStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_connectStartToSecureConnectionStartMillis = a3;
}

- (void)setHasConnectStartToSecureConnectionStartMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConnectStartToSecureConnectionStartMillis
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setConnectStartToConnectEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectStartToConnectEndMillis = a3;
}

- (void)setHasConnectStartToConnectEndMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectStartToConnectEndMillis
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSecureConnectionStartToConnectEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_secureConnectionStartToConnectEndMillis = a3;
}

- (void)setHasSecureConnectionStartToConnectEndMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSecureConnectionStartToConnectEndMillis
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setConnectEndToRequestStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_connectEndToRequestStartMillis = a3;
}

- (void)setHasConnectEndToRequestStartMillis:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasConnectEndToRequestStartMillis
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRequestStartToResponseStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_requestStartToResponseStartMillis = a3;
}

- (void)setHasRequestStartToResponseStartMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRequestStartToResponseStartMillis
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setResponseStartToResponseEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_responseStartToResponseEndMillis = a3;
}

- (void)setHasResponseStartToResponseEndMillis:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasResponseStartToResponseEndMillis
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIMRemoteURLLoadCompleted;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIMRemoteURLLoadCompleted description](&v3, sel_description), -[AWDIMRemoteURLLoadCompleted dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_navigationStartToRedirectStartMillis] forKey:@"navigationStartToRedirectStartMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_redirectStartToRedirectEndMillis] forKey:@"redirectStartToRedirectEndMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_redirectEndToFetchStartMillis] forKey:@"redirectEndToFetchStartMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_fetchStartToDomainLookupStartMillis] forKey:@"fetchStartToDomainLookupStartMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_domainLookupStartToDomainLookupEndMillis] forKey:@"domainLookupStartToDomainLookupEndMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_domainLookupEndToConnectStartMillis] forKey:@"domainLookupEndToConnectStartMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectStartToSecureConnectionStartMillis] forKey:@"connectStartToSecureConnectionStartMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectStartToConnectEndMillis] forKey:@"connectStartToConnectEndMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_secureConnectionStartToConnectEndMillis] forKey:@"secureConnectionStartToConnectEndMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
LABEL_27:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestStartToResponseStartMillis] forKey:@"requestStartToResponseStartMillis"];
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      return v3;
    }
    goto LABEL_14;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectEndToRequestStartMillis] forKey:@"connectEndToRequestStartMillis"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_27;
  }
LABEL_13:
  if ((has & 0x400) != 0) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_responseStartToResponseEndMillis] forKey:@"responseStartToResponseEndMillis"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMRemoteURLLoadCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
LABEL_26:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      return;
    }
    goto LABEL_27;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_26;
  }
LABEL_13:
  if ((has & 0x400) == 0) {
    return;
  }
LABEL_27:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((void *)a3 + 13) = self->_timestamp;
    *((_WORD *)a3 + 56) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 7) = self->_navigationStartToRedirectStartMillis;
  *((_WORD *)a3 + 56) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 9) = self->_redirectStartToRedirectEndMillis;
  *((_WORD *)a3 + 56) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 8) = self->_redirectEndToFetchStartMillis;
  *((_WORD *)a3 + 56) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 6) = self->_fetchStartToDomainLookupStartMillis;
  *((_WORD *)a3 + 56) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 5) = self->_domainLookupStartToDomainLookupEndMillis;
  *((_WORD *)a3 + 56) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 4) = self->_domainLookupEndToConnectStartMillis;
  *((_WORD *)a3 + 56) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 3) = self->_connectStartToSecureConnectionStartMillis;
  *((_WORD *)a3 + 56) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 2) = self->_connectStartToConnectEndMillis;
  *((_WORD *)a3 + 56) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)a3 + 12) = self->_secureConnectionStartToConnectEndMillis;
  *((_WORD *)a3 + 56) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)a3 + 1) = self->_connectEndToRequestStartMillis;
  *((_WORD *)a3 + 56) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0) {
      return;
    }
LABEL_27:
    *((void *)a3 + 11) = self->_responseStartToResponseEndMillis;
    *((_WORD *)a3 + 56) |= 0x400u;
    return;
  }
LABEL_26:
  *((void *)a3 + 10) = self->_requestStartToResponseStartMillis;
  *((_WORD *)a3 + 56) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    goto LABEL_27;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((void *)result + 13) = self->_timestamp;
    *((_WORD *)result + 56) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 7) = self->_navigationStartToRedirectStartMillis;
  *((_WORD *)result + 56) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 9) = self->_redirectStartToRedirectEndMillis;
  *((_WORD *)result + 56) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 8) = self->_redirectEndToFetchStartMillis;
  *((_WORD *)result + 56) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 6) = self->_fetchStartToDomainLookupStartMillis;
  *((_WORD *)result + 56) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 5) = self->_domainLookupStartToDomainLookupEndMillis;
  *((_WORD *)result + 56) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 4) = self->_domainLookupEndToConnectStartMillis;
  *((_WORD *)result + 56) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 3) = self->_connectStartToSecureConnectionStartMillis;
  *((_WORD *)result + 56) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 2) = self->_connectStartToConnectEndMillis;
  *((_WORD *)result + 56) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)result + 12) = self->_secureConnectionStartToConnectEndMillis;
  *((_WORD *)result + 56) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)result + 1) = self->_connectEndToRequestStartMillis;
  *((_WORD *)result + 56) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0) {
      return result;
    }
    goto LABEL_14;
  }
LABEL_27:
  *((void *)result + 10) = self->_requestStartToResponseStartMillis;
  *((_WORD *)result + 56) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    return result;
  }
LABEL_14:
  *((void *)result + 11) = self->_responseStartToResponseEndMillis;
  *((_WORD *)result + 56) |= 0x400u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 56);
    if ((has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x1000) == 0 || self->_timestamp != *((void *)a3 + 13)) {
        goto LABEL_66;
      }
    }
    else if ((*((_WORD *)a3 + 56) & 0x1000) != 0)
    {
LABEL_66:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_navigationStartToRedirectStartMillis != *((void *)a3 + 7)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x100) == 0 || self->_redirectStartToRedirectEndMillis != *((void *)a3 + 9)) {
        goto LABEL_66;
      }
    }
    else if ((*((_WORD *)a3 + 56) & 0x100) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_redirectEndToFetchStartMillis != *((void *)a3 + 8)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_fetchStartToDomainLookupStartMillis != *((void *)a3 + 6)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_domainLookupStartToDomainLookupEndMillis != *((void *)a3 + 5)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_domainLookupEndToConnectStartMillis != *((void *)a3 + 4)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_connectStartToSecureConnectionStartMillis != *((void *)a3 + 3)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_connectStartToConnectEndMillis != *((void *)a3 + 2)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x800) == 0 || self->_secureConnectionStartToConnectEndMillis != *((void *)a3 + 12)) {
        goto LABEL_66;
      }
    }
    else if ((*((_WORD *)a3 + 56) & 0x800) != 0)
    {
      goto LABEL_66;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_connectEndToRequestStartMillis != *((void *)a3 + 1)) {
        goto LABEL_66;
      }
    }
    else if (v7)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x200) == 0 || self->_requestStartToResponseStartMillis != *((void *)a3 + 10)) {
        goto LABEL_66;
      }
    }
    else if ((*((_WORD *)a3 + 56) & 0x200) != 0)
    {
      goto LABEL_66;
    }
    LOBYTE(v5) = (v7 & 0x400) == 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x400) == 0 || self->_responseStartToResponseEndMillis != *((void *)a3 + 11)) {
        goto LABEL_66;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_navigationStartToRedirectStartMillis;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_redirectStartToRedirectEndMillis;
    if ((has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v5 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_redirectEndToFetchStartMillis;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_fetchStartToDomainLookupStartMillis;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_domainLookupStartToDomainLookupEndMillis;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_domainLookupEndToConnectStartMillis;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_connectStartToSecureConnectionStartMillis;
    if ((has & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v10 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_connectStartToConnectEndMillis;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_secureConnectionStartToConnectEndMillis;
    if (has) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v12 = 0;
  if (has)
  {
LABEL_12:
    unint64_t v13 = 2654435761u * self->_connectEndToRequestStartMillis;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    unint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_14;
    }
LABEL_27:
    unint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  unint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  unint64_t v14 = 2654435761u * self->_requestStartToResponseStartMillis;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_27;
  }
LABEL_14:
  unint64_t v15 = 2654435761u * self->_responseStartToResponseEndMillis;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x1000) != 0)
  {
    self->_timestamp = *((void *)a3 + 13);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v3 = *((_WORD *)a3 + 56);
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_navigationStartToRedirectStartMillis = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_redirectStartToRedirectEndMillis = *((void *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_redirectEndToFetchStartMillis = *((void *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_fetchStartToDomainLookupStartMillis = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_domainLookupStartToDomainLookupEndMillis = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_domainLookupEndToConnectStartMillis = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_connectStartToSecureConnectionStartMillis = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 2) == 0)
  {
LABEL_10:
    if ((v3 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_connectStartToConnectEndMillis = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x800) == 0)
  {
LABEL_11:
    if ((v3 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_secureConnectionStartToConnectEndMillis = *((void *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 1) == 0)
  {
LABEL_12:
    if ((v3 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_connectEndToRequestStartMillis = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x200) == 0)
  {
LABEL_13:
    if ((v3 & 0x400) == 0) {
      return;
    }
LABEL_27:
    self->_responseStartToResponseEndMillis = *((void *)a3 + 11);
    *(_WORD *)&self->_has |= 0x400u;
    return;
  }
LABEL_26:
  self->_requestStartToResponseStartMillis = *((void *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 56) & 0x400) != 0) {
    goto LABEL_27;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)navigationStartToRedirectStartMillis
{
  return self->_navigationStartToRedirectStartMillis;
}

- (unint64_t)redirectStartToRedirectEndMillis
{
  return self->_redirectStartToRedirectEndMillis;
}

- (unint64_t)redirectEndToFetchStartMillis
{
  return self->_redirectEndToFetchStartMillis;
}

- (unint64_t)fetchStartToDomainLookupStartMillis
{
  return self->_fetchStartToDomainLookupStartMillis;
}

- (unint64_t)domainLookupStartToDomainLookupEndMillis
{
  return self->_domainLookupStartToDomainLookupEndMillis;
}

- (unint64_t)domainLookupEndToConnectStartMillis
{
  return self->_domainLookupEndToConnectStartMillis;
}

- (unint64_t)connectStartToSecureConnectionStartMillis
{
  return self->_connectStartToSecureConnectionStartMillis;
}

- (unint64_t)connectStartToConnectEndMillis
{
  return self->_connectStartToConnectEndMillis;
}

- (unint64_t)secureConnectionStartToConnectEndMillis
{
  return self->_secureConnectionStartToConnectEndMillis;
}

- (unint64_t)connectEndToRequestStartMillis
{
  return self->_connectEndToRequestStartMillis;
}

- (unint64_t)requestStartToResponseStartMillis
{
  return self->_requestStartToResponseStartMillis;
}

- (unint64_t)responseStartToResponseEndMillis
{
  return self->_responseStartToResponseEndMillis;
}

@end