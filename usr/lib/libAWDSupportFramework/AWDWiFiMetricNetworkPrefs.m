@interface AWDWiFiMetricNetworkPrefs
+ (Class)mostUsedNetworksType;
- (BOOL)atjEnabled;
- (BOOL)hasAdhocNetsCount;
- (BOOL)hasApplePersHotspotNetsCount;
- (BOOL)hasAtjCanceledCount;
- (BOOL)hasAtjEnabled;
- (BOOL)hasAtjUsedCount;
- (BOOL)hasCaptiveNetsCount;
- (BOOL)hasEapNetsCount;
- (BOOL)hasHiddenNetsCount;
- (BOOL)hasMostUsedCount;
- (BOOL)hasOpenNonCaptiveNetsCount;
- (BOOL)hasPrefNetsCount;
- (BOOL)hasTimestamp;
- (BOOL)hasWapiNetsCount;
- (BOOL)hasWepNetsCount;
- (BOOL)hasWpaNetsCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)mostUsedNetworks;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mostUsedNetworksAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mostUsedNetworksCount;
- (unint64_t)timestamp;
- (unsigned)adhocNetsCount;
- (unsigned)applePersHotspotNetsCount;
- (unsigned)atjCanceledCount;
- (unsigned)atjUsedCount;
- (unsigned)captiveNetsCount;
- (unsigned)eapNetsCount;
- (unsigned)hiddenNetsCount;
- (unsigned)mostUsedCount;
- (unsigned)openNonCaptiveNetsCount;
- (unsigned)prefNetsCount;
- (unsigned)wapiNetsCount;
- (unsigned)wepNetsCount;
- (unsigned)wpaNetsCount;
- (void)addMostUsedNetworks:(id)a3;
- (void)clearMostUsedNetworks;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAdhocNetsCount:(unsigned int)a3;
- (void)setApplePersHotspotNetsCount:(unsigned int)a3;
- (void)setAtjCanceledCount:(unsigned int)a3;
- (void)setAtjEnabled:(BOOL)a3;
- (void)setAtjUsedCount:(unsigned int)a3;
- (void)setCaptiveNetsCount:(unsigned int)a3;
- (void)setEapNetsCount:(unsigned int)a3;
- (void)setHasAdhocNetsCount:(BOOL)a3;
- (void)setHasApplePersHotspotNetsCount:(BOOL)a3;
- (void)setHasAtjCanceledCount:(BOOL)a3;
- (void)setHasAtjEnabled:(BOOL)a3;
- (void)setHasAtjUsedCount:(BOOL)a3;
- (void)setHasCaptiveNetsCount:(BOOL)a3;
- (void)setHasEapNetsCount:(BOOL)a3;
- (void)setHasHiddenNetsCount:(BOOL)a3;
- (void)setHasMostUsedCount:(BOOL)a3;
- (void)setHasOpenNonCaptiveNetsCount:(BOOL)a3;
- (void)setHasPrefNetsCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWapiNetsCount:(BOOL)a3;
- (void)setHasWepNetsCount:(BOOL)a3;
- (void)setHasWpaNetsCount:(BOOL)a3;
- (void)setHiddenNetsCount:(unsigned int)a3;
- (void)setMostUsedCount:(unsigned int)a3;
- (void)setMostUsedNetworks:(id)a3;
- (void)setOpenNonCaptiveNetsCount:(unsigned int)a3;
- (void)setPrefNetsCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWapiNetsCount:(unsigned int)a3;
- (void)setWepNetsCount:(unsigned int)a3;
- (void)setWpaNetsCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricNetworkPrefs

- (void)dealloc
{
  [(AWDWiFiMetricNetworkPrefs *)self setMostUsedNetworks:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricNetworkPrefs;
  [(AWDWiFiMetricNetworkPrefs *)&v3 dealloc];
}

- (void)setAtjEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_atjEnabled = a3;
}

- (void)setHasAtjEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasAtjEnabled
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setAtjCanceledCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_atjCanceledCount = a3;
}

- (void)setHasAtjCanceledCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAtjCanceledCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAtjUsedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_atjUsedCount = a3;
}

- (void)setHasAtjUsedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAtjUsedCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAdhocNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_adhocNetsCount = a3;
}

- (void)setHasAdhocNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAdhocNetsCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPrefNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_prefNetsCount = a3;
}

- (void)setHasPrefNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPrefNetsCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCaptiveNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_captiveNetsCount = a3;
}

- (void)setHasCaptiveNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCaptiveNetsCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setApplePersHotspotNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_applePersHotspotNetsCount = a3;
}

- (void)setHasApplePersHotspotNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasApplePersHotspotNetsCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setWapiNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_wapiNetsCount = a3;
}

- (void)setHasWapiNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWapiNetsCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setMostUsedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_mostUsedCount = a3;
}

- (void)setHasMostUsedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMostUsedCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearMostUsedNetworks
{
}

- (void)addMostUsedNetworks:(id)a3
{
  mostUsedNetworks = self->_mostUsedNetworks;
  if (!mostUsedNetworks)
  {
    mostUsedNetworks = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_mostUsedNetworks = mostUsedNetworks;
  }

  [(NSMutableArray *)mostUsedNetworks addObject:a3];
}

- (unint64_t)mostUsedNetworksCount
{
  return [(NSMutableArray *)self->_mostUsedNetworks count];
}

- (id)mostUsedNetworksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mostUsedNetworks objectAtIndex:a3];
}

+ (Class)mostUsedNetworksType
{
  return (Class)objc_opt_class();
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHiddenNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hiddenNetsCount = a3;
}

- (void)setHasHiddenNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHiddenNetsCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWepNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_wepNetsCount = a3;
}

- (void)setHasWepNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWepNetsCount
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setWpaNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_wpaNetsCount = a3;
}

- (void)setHasWpaNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasWpaNetsCount
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setEapNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_eapNetsCount = a3;
}

- (void)setHasEapNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEapNetsCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setOpenNonCaptiveNetsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_openNonCaptiveNetsCount = a3;
}

- (void)setHasOpenNonCaptiveNetsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOpenNonCaptiveNetsCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricNetworkPrefs;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricNetworkPrefs description](&v3, sel_description), -[AWDWiFiMetricNetworkPrefs dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_atjEnabled] forKey:@"atjEnabled"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_atjCanceledCount] forKey:@"atjCanceledCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_atjUsedCount] forKey:@"atjUsedCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_adhocNetsCount] forKey:@"adhocNetsCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_prefNetsCount] forKey:@"prefNetsCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_captiveNetsCount] forKey:@"captiveNetsCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_applePersHotspotNetsCount] forKey:@"applePersHotspotNetsCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wapiNetsCount] forKey:@"wapiNetsCount"];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_mostUsedCount] forKey:@"mostUsedCount"];
LABEL_11:
  if ([(NSMutableArray *)self->_mostUsedNetworks count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_mostUsedNetworks, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    mostUsedNetworks = self->_mostUsedNetworks;
    uint64_t v7 = [(NSMutableArray *)mostUsedNetworks countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(mostUsedNetworks);
          }
          [v5 addObject:[(*(id *)(*((void *)&v13 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)mostUsedNetworks countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"mostUsedNetworks"];
  }
  __int16 v11 = (__int16)self->_has;
  if (v11)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x80) == 0)
    {
LABEL_22:
      if ((v11 & 0x1000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_39;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_22;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_hiddenNetsCount] forKey:@"hiddenNetsCount"];
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x1000) == 0)
  {
LABEL_23:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wepNetsCount] forKey:@"wepNetsCount"];
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x2000) == 0)
  {
LABEL_24:
    if ((v11 & 0x40) == 0) {
      goto LABEL_25;
    }
LABEL_41:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_eapNetsCount] forKey:@"eapNetsCount"];
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return v3;
    }
    goto LABEL_26;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wpaNetsCount] forKey:@"wpaNetsCount"];
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0) {
    goto LABEL_41;
  }
LABEL_25:
  if ((v11 & 0x200) != 0) {
LABEL_26:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_openNonCaptiveNetsCount] forKey:@"openNonCaptiveNetsCount"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricNetworkPrefsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mostUsedNetworks = self->_mostUsedNetworks;
  uint64_t v6 = [(NSMutableArray *)mostUsedNetworks countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(mostUsedNetworks);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)mostUsedNetworks countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  __int16 v10 = (__int16)self->_has;
  if (v10)
  {
    PBDataWriterWriteUint64Field();
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_20:
      if ((v10 & 0x1000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_37;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteUint32Field();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x1000) == 0)
  {
LABEL_21:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x2000) == 0)
  {
LABEL_22:
    if ((v10 & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_23:
    if ((v10 & 0x200) == 0) {
      return;
    }
    goto LABEL_24;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    return;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    *((unsigned char *)a3 + 76) = self->_atjEnabled;
    *((_WORD *)a3 + 40) |= 0x4000u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_atjCanceledCount;
  *((_WORD *)a3 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 7) = self->_atjUsedCount;
  *((_WORD *)a3 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 4) = self->_adhocNetsCount;
  *((_WORD *)a3 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 15) = self->_prefNetsCount;
  *((_WORD *)a3 + 40) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 8) = self->_captiveNetsCount;
  *((_WORD *)a3 + 40) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
LABEL_30:
    *((_DWORD *)a3 + 16) = self->_wapiNetsCount;
    *((_WORD *)a3 + 40) |= 0x800u;
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_29:
  *((_DWORD *)a3 + 5) = self->_applePersHotspotNetsCount;
  *((_WORD *)a3 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0) {
    goto LABEL_30;
  }
LABEL_9:
  if ((has & 0x100) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 11) = self->_mostUsedCount;
    *((_WORD *)a3 + 40) |= 0x100u;
  }
LABEL_11:
  if ([(AWDWiFiMetricNetworkPrefs *)self mostUsedNetworksCount])
  {
    [a3 clearMostUsedNetworks];
    unint64_t v6 = [(AWDWiFiMetricNetworkPrefs *)self mostUsedNetworksCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addMostUsedNetworks:-[AWDWiFiMetricNetworkPrefs mostUsedNetworksAtIndex:](self, "mostUsedNetworksAtIndex:", i)];
    }
  }
  __int16 v9 = (__int16)self->_has;
  if (v9)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 40) |= 1u;
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x80) == 0)
    {
LABEL_17:
      if ((v9 & 0x1000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_34;
    }
  }
  else if ((v9 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)a3 + 10) = self->_hiddenNetsCount;
  *((_WORD *)a3 + 40) |= 0x80u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x1000) == 0)
  {
LABEL_18:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 17) = self->_wepNetsCount;
  *((_WORD *)a3 + 40) |= 0x1000u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x2000) == 0)
  {
LABEL_19:
    if ((v9 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 18) = self->_wpaNetsCount;
  *((_WORD *)a3 + 40) |= 0x2000u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_20:
    if ((v9 & 0x200) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_36:
  *((_DWORD *)a3 + 9) = self->_eapNetsCount;
  *((_WORD *)a3 + 40) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    return;
  }
LABEL_21:
  *((_DWORD *)a3 + 14) = self->_openNonCaptiveNetsCount;
  *((_WORD *)a3 + 40) |= 0x200u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    *(unsigned char *)(v5 + 76) = self->_atjEnabled;
    *(_WORD *)(v5 + 80) |= 0x4000u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_atjCanceledCount;
  *(_WORD *)(v5 + 80) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 28) = self->_atjUsedCount;
  *(_WORD *)(v5 + 80) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 16) = self->_adhocNetsCount;
  *(_WORD *)(v5 + 80) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 60) = self->_prefNetsCount;
  *(_WORD *)(v5 + 80) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 32) = self->_captiveNetsCount;
  *(_WORD *)(v5 + 80) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v5 + 20) = self->_applePersHotspotNetsCount;
  *(_WORD *)(v5 + 80) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_33:
  *(_DWORD *)(v5 + 64) = self->_wapiNetsCount;
  *(_WORD *)(v5 + 80) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 44) = self->_mostUsedCount;
    *(_WORD *)(v5 + 80) |= 0x100u;
  }
LABEL_11:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  mostUsedNetworks = self->_mostUsedNetworks;
  uint64_t v9 = [(NSMutableArray *)mostUsedNetworks countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(mostUsedNetworks);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addMostUsedNetworks:v13];
      }
      uint64_t v10 = [(NSMutableArray *)mostUsedNetworks countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  __int16 v14 = (__int16)self->_has;
  if (v14)
  {
    *(void *)(v6 + 8) = self->_timestamp;
    *(_WORD *)(v6 + 80) |= 1u;
    __int16 v14 = (__int16)self->_has;
    if ((v14 & 0x80) == 0)
    {
LABEL_20:
      if ((v14 & 0x1000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_37;
    }
  }
  else if ((v14 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  *(_DWORD *)(v6 + 40) = self->_hiddenNetsCount;
  *(_WORD *)(v6 + 80) |= 0x80u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x1000) == 0)
  {
LABEL_21:
    if ((v14 & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v6 + 68) = self->_wepNetsCount;
  *(_WORD *)(v6 + 80) |= 0x1000u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x2000) == 0)
  {
LABEL_22:
    if ((v14 & 0x40) == 0) {
      goto LABEL_23;
    }
LABEL_39:
    *(_DWORD *)(v6 + 36) = self->_eapNetsCount;
    *(_WORD *)(v6 + 80) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return (id)v6;
    }
    goto LABEL_24;
  }
LABEL_38:
  *(_DWORD *)(v6 + 72) = self->_wpaNetsCount;
  *(_WORD *)(v6 + 80) |= 0x2000u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x40) != 0) {
    goto LABEL_39;
  }
LABEL_23:
  if ((v14 & 0x200) != 0)
  {
LABEL_24:
    *(_DWORD *)(v6 + 56) = self->_openNonCaptiveNetsCount;
    *(_WORD *)(v6 + 80) |= 0x200u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 40);
  if ((has & 0x4000) == 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x4000) != 0) {
      goto LABEL_82;
    }
    goto LABEL_10;
  }
  if ((*((_WORD *)a3 + 40) & 0x4000) == 0) {
    goto LABEL_82;
  }
  if (self->_atjEnabled)
  {
    if (!*((unsigned char *)a3 + 76)) {
      goto LABEL_82;
    }
    goto LABEL_10;
  }
  if (*((unsigned char *)a3 + 76))
  {
LABEL_82:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_10:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_atjCanceledCount != *((_DWORD *)a3 + 6)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_atjUsedCount != *((_DWORD *)a3 + 7)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_adhocNetsCount != *((_DWORD *)a3 + 4)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x400) == 0 || self->_prefNetsCount != *((_DWORD *)a3 + 15)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x400) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_captiveNetsCount != *((_DWORD *)a3 + 8)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_applePersHotspotNetsCount != *((_DWORD *)a3 + 5)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x800) == 0 || self->_wapiNetsCount != *((_DWORD *)a3 + 16)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x800) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x100) == 0 || self->_mostUsedCount != *((_DWORD *)a3 + 11)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x100) != 0)
  {
    goto LABEL_82;
  }
  mostUsedNetworks = self->_mostUsedNetworks;
  if ((unint64_t)mostUsedNetworks | *((void *)a3 + 6))
  {
    int v5 = -[NSMutableArray isEqual:](mostUsedNetworks, "isEqual:");
    if (!v5) {
      return v5;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)a3 + 40);
  if (has)
  {
    if ((v9 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_82;
    }
  }
  else if (v9)
  {
    goto LABEL_82;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_hiddenNetsCount != *((_DWORD *)a3 + 10)) {
      goto LABEL_82;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x1000) == 0 || self->_wepNetsCount != *((_DWORD *)a3 + 17)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x1000) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x2000) == 0 || self->_wpaNetsCount != *((_DWORD *)a3 + 18)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x2000) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_eapNetsCount != *((_DWORD *)a3 + 9)) {
      goto LABEL_82;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_82;
  }
  LOBYTE(v5) = (v9 & 0x200) == 0;
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x200) == 0 || self->_openNonCaptiveNetsCount != *((_DWORD *)a3 + 14)) {
      goto LABEL_82;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
  {
    uint64_t v22 = 2654435761 * self->_atjEnabled;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_atjCanceledCount;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_atjUsedCount;
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
    uint64_t v5 = 2654435761 * self->_adhocNetsCount;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_prefNetsCount;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_captiveNetsCount;
    if ((has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_applePersHotspotNetsCount;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_wapiNetsCount;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v10 = 2654435761 * self->_mostUsedCount;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v10 = 0;
LABEL_20:
  uint64_t v11 = [(NSMutableArray *)self->_mostUsedNetworks hash];
  __int16 v12 = (__int16)self->_has;
  if (v12)
  {
    unint64_t v13 = 2654435761u * self->_timestamp;
    if ((v12 & 0x80) != 0)
    {
LABEL_22:
      uint64_t v14 = 2654435761 * self->_hiddenNetsCount;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_23;
      }
      goto LABEL_29;
    }
  }
  else
  {
    unint64_t v13 = 0;
    if ((v12 & 0x80) != 0) {
      goto LABEL_22;
    }
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_23:
    uint64_t v15 = 2654435761 * self->_wepNetsCount;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_24:
    uint64_t v16 = 2654435761 * self->_wpaNetsCount;
    if ((v12 & 0x40) != 0) {
      goto LABEL_25;
    }
LABEL_31:
    uint64_t v17 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_26;
    }
LABEL_32:
    uint64_t v18 = 0;
    return v21 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11;
  }
LABEL_30:
  uint64_t v16 = 0;
  if ((v12 & 0x40) == 0) {
    goto LABEL_31;
  }
LABEL_25:
  uint64_t v17 = 2654435761 * self->_eapNetsCount;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_32;
  }
LABEL_26:
  uint64_t v18 = 2654435761 * self->_openNonCaptiveNetsCount;
  return v21 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x4000) != 0)
  {
    self->_atjEnabled = *((unsigned char *)a3 + 76);
    *(_WORD *)&self->_has |= 0x4000u;
    __int16 v5 = *((_WORD *)a3 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_atjCanceledCount = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_atjUsedCount = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_adhocNetsCount = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_prefNetsCount = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_captiveNetsCount = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_applePersHotspotNetsCount = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 40);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_33:
  self->_wapiNetsCount = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)a3 + 40) & 0x100) != 0)
  {
LABEL_10:
    self->_mostUsedCount = *((_DWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_11:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDWiFiMetricNetworkPrefs *)self addMostUsedNetworks:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  __int16 v11 = *((_WORD *)a3 + 40);
  if (v11)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v11 = *((_WORD *)a3 + 40);
    if ((v11 & 0x80) == 0)
    {
LABEL_20:
      if ((v11 & 0x1000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_37;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  self->_hiddenNetsCount = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v11 = *((_WORD *)a3 + 40);
  if ((v11 & 0x1000) == 0)
  {
LABEL_21:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_wepNetsCount = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v11 = *((_WORD *)a3 + 40);
  if ((v11 & 0x2000) == 0)
  {
LABEL_22:
    if ((v11 & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_wpaNetsCount = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v11 = *((_WORD *)a3 + 40);
  if ((v11 & 0x40) == 0)
  {
LABEL_23:
    if ((v11 & 0x200) == 0) {
      return;
    }
    goto LABEL_24;
  }
LABEL_39:
  self->_eapNetsCount = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 40) & 0x200) == 0) {
    return;
  }
LABEL_24:
  self->_openNonCaptiveNetsCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x200u;
}

- (BOOL)atjEnabled
{
  return self->_atjEnabled;
}

- (unsigned)atjCanceledCount
{
  return self->_atjCanceledCount;
}

- (unsigned)atjUsedCount
{
  return self->_atjUsedCount;
}

- (unsigned)adhocNetsCount
{
  return self->_adhocNetsCount;
}

- (unsigned)prefNetsCount
{
  return self->_prefNetsCount;
}

- (unsigned)captiveNetsCount
{
  return self->_captiveNetsCount;
}

- (unsigned)applePersHotspotNetsCount
{
  return self->_applePersHotspotNetsCount;
}

- (unsigned)wapiNetsCount
{
  return self->_wapiNetsCount;
}

- (unsigned)mostUsedCount
{
  return self->_mostUsedCount;
}

- (NSMutableArray)mostUsedNetworks
{
  return self->_mostUsedNetworks;
}

- (void)setMostUsedNetworks:(id)a3
{
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)hiddenNetsCount
{
  return self->_hiddenNetsCount;
}

- (unsigned)wepNetsCount
{
  return self->_wepNetsCount;
}

- (unsigned)wpaNetsCount
{
  return self->_wpaNetsCount;
}

- (unsigned)eapNetsCount
{
  return self->_eapNetsCount;
}

- (unsigned)openNonCaptiveNetsCount
{
  return self->_openNonCaptiveNetsCount;
}

@end