@interface ALSNearbyRequest
- (ALSMeta)meta;
- (BOOL)hasMeta;
- (BOOL)hasNeedCellsTowers;
- (BOOL)hasNumberOfSurroundingWifis;
- (BOOL)hasRadius;
- (BOOL)hasTechnology;
- (BOOL)hasWifiAltitudeScale;
- (BOOL)hasWifiGranularity;
- (BOOL)isEqual:(id)a3;
- (BOOL)needCellsTowers;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)technologyAsString:(int)a3;
- (id)wifiAltitudeScaleAsString:(int)a3;
- (id)wifiBandsAsString:(int)a3;
- (id)wifiGranularityAsString:(int)a3;
- (int)StringAsTechnology:(id)a3;
- (int)StringAsWifiAltitudeScale:(id)a3;
- (int)StringAsWifiBands:(id)a3;
- (int)StringAsWifiGranularity:(id)a3;
- (int)numberOfSurroundingWifis;
- (int)radius;
- (int)technology;
- (int)wifiAltitudeScale;
- (int)wifiBands;
- (int)wifiBandsAtIndex:(unint64_t)a3;
- (int)wifiGranularity;
- (int64_t)latitude;
- (int64_t)longitude;
- (unint64_t)hash;
- (unint64_t)wifiBandsCount;
- (unsigned)requestTypeCode;
- (void)addWifiBands:(int)a3;
- (void)clearWifiBands;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasNeedCellsTowers:(BOOL)a3;
- (void)setHasNumberOfSurroundingWifis:(BOOL)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setHasTechnology:(BOOL)a3;
- (void)setHasWifiAltitudeScale:(BOOL)a3;
- (void)setHasWifiGranularity:(BOOL)a3;
- (void)setLatitude:(int64_t)a3;
- (void)setLongitude:(int64_t)a3;
- (void)setMeta:(id)a3;
- (void)setNeedCellsTowers:(BOOL)a3;
- (void)setNumberOfSurroundingWifis:(int)a3;
- (void)setRadius:(int)a3;
- (void)setTechnology:(int)a3;
- (void)setWifiAltitudeScale:(int)a3;
- (void)setWifiBands:(int *)a3 count:(unint64_t)a4;
- (void)setWifiGranularity:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSNearbyRequest

- (void)dealloc
{
  PBRepeatedInt32Clear();
  [(ALSNearbyRequest *)self setMeta:0];
  v3.receiver = self;
  v3.super_class = (Class)ALSNearbyRequest;
  [(ALSNearbyRequest *)&v3 dealloc];
}

- (void)setNeedCellsTowers:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_needCellsTowers = a3;
}

- (void)setHasNeedCellsTowers:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNeedCellsTowers
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNumberOfSurroundingWifis:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberOfSurroundingWifis = a3;
}

- (void)setHasNumberOfSurroundingWifis:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfSurroundingWifis
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)technology
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_technology;
  }
  else {
    return 1;
  }
}

- (void)setTechnology:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_technology = a3;
}

- (void)setHasTechnology:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTechnology
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)technologyAsString:(int)a3
{
  if (a3 > 31)
  {
    if (a3 > 127)
    {
      if (a3 == 128) {
        return @"kRadioAccessTechnologySCDMA";
      }
      if (a3 == 256) {
        return @"kRadioAccessTechnologyNR5G";
      }
    }
    else
    {
      if (a3 == 32) {
        return @"kRadioAccessTechnologyCDMAHybrid";
      }
      if (a3 == 64) {
        return @"kRadioAccessTechnologyLTE";
      }
    }
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  id result = @"kRadioAccessTechnologyGSM";
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      id result = @"kRadioAccessTechnologyGSMCompact";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    case 4:
      id result = @"kRadioAccessTechnologyUTRAN";
      break;
    case 8:
      id result = @"kRadioAccessTechnologyCDMA1x";
      break;
    default:
      if (a3 != 16) {
        return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
      }
      id result = @"kRadioAccessTechnologyCDMAEVDO";
      break;
  }
  return result;
}

- (int)StringAsTechnology:(id)a3
{
  if ([a3 isEqualToString:@"kRadioAccessTechnologyGSM"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kRadioAccessTechnologyGSMCompact"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kRadioAccessTechnologyUTRAN"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"kRadioAccessTechnologyCDMA1x"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"kRadioAccessTechnologyCDMAEVDO"]) {
    return 16;
  }
  if ([a3 isEqualToString:@"kRadioAccessTechnologyCDMAHybrid"]) {
    return 32;
  }
  if ([a3 isEqualToString:@"kRadioAccessTechnologyLTE"]) {
    return 64;
  }
  if ([a3 isEqualToString:@"kRadioAccessTechnologySCDMA"]) {
    return 128;
  }
  if ([a3 isEqualToString:@"kRadioAccessTechnologyNR5G"]) {
    return 256;
  }
  return 1;
}

- (int)wifiGranularity
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_wifiGranularity;
  }
  else {
    return 1;
  }
}

- (void)setWifiGranularity:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_wifiGranularity = a3;
}

- (void)setHasWifiGranularity:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWifiGranularity
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)wifiGranularityAsString:(int)a3
{
  switch(a3)
  {
    case 1:
      return @"kGranularityFine";
    case 4:
      return @"kGranularityNearby";
    case 2:
      return @"kGranularityCoarse";
  }
  return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsWifiGranularity:(id)a3
{
  if ([a3 isEqualToString:@"kGranularityFine"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kGranularityCoarse"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kGranularityNearby"]) {
    return 4;
  }
  return 1;
}

- (void)setRadius:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRadius
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)wifiBandsCount
{
  return self->_wifiBands.count;
}

- (int)wifiBands
{
  return self->_wifiBands.list;
}

- (void)clearWifiBands
{
}

- (void)addWifiBands:(int)a3
{
}

- (int)wifiBandsAtIndex:(unint64_t)a3
{
  p_wifiBands = &self->_wifiBands;
  unint64_t count = self->_wifiBands.count;
  if (count <= a3) {
    [+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], 0) raise];
  }
  return p_wifiBands->list[a3];
}

- (void)setWifiBands:(int *)a3 count:(unint64_t)a4
{
}

- (id)wifiBandsAsString:(int)a3
{
  if (a3 == 1) {
    return @"k2dot4GHZ";
  }
  if (a3 == 2) {
    return @"k5GHZ";
  }
  return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsWifiBands:(id)a3
{
  int v4 = 1;
  if (([a3 isEqualToString:@"k2dot4GHZ"] & 1) == 0)
  {
    if ([a3 isEqualToString:@"k5GHZ"]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return v4;
}

- (int)wifiAltitudeScale
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_wifiAltitudeScale;
  }
  else {
    return 1;
  }
}

- (void)setWifiAltitudeScale:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_wifiAltitudeScale = a3;
}

- (void)setHasWifiAltitudeScale:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWifiAltitudeScale
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)wifiAltitudeScaleAsString:(int)a3
{
  if (a3 == 1) {
    return @"kWifiAltitudeScaleNone";
  }
  if (a3 == 2) {
    return @"kWifiAltitudeScale10toThe2";
  }
  return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsWifiAltitudeScale:(id)a3
{
  int v4 = 1;
  if (([a3 isEqualToString:@"kWifiAltitudeScaleNone"] & 1) == 0)
  {
    if ([a3 isEqualToString:@"kWifiAltitudeScale10toThe2"]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return v4;
}

- (BOOL)hasMeta
{
  return self->_meta != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALSNearbyRequest;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSNearbyRequest *)&v3 description], [(ALSNearbyRequest *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_latitude)] forKey:@"Latitude"];
  [v3 setObject:[+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_longitude)] forKey:@"Longitude"];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_needCellsTowers)] forKey:@"needCellsTowers"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingWifis)] forKey:@"numberOfSurroundingWifis"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_47;
  }
LABEL_23:
  int technology = self->_technology;
  if (technology > 31)
  {
    if (technology > 127)
    {
      if (technology == 128)
      {
        CFStringRef v13 = @"kRadioAccessTechnologySCDMA";
        goto LABEL_46;
      }
      if (technology == 256)
      {
        CFStringRef v13 = @"kRadioAccessTechnologyNR5G";
        goto LABEL_46;
      }
    }
    else
    {
      if (technology == 32)
      {
        CFStringRef v13 = @"kRadioAccessTechnologyCDMAHybrid";
        goto LABEL_46;
      }
      if (technology == 64)
      {
        CFStringRef v13 = @"kRadioAccessTechnologyLTE";
        goto LABEL_46;
      }
    }
LABEL_41:
    CFStringRef v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_technology];
    goto LABEL_46;
  }
  CFStringRef v13 = @"kRadioAccessTechnologyGSM";
  switch(technology)
  {
    case 1:
      break;
    case 2:
      CFStringRef v13 = @"kRadioAccessTechnologyGSMCompact";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_41;
    case 4:
      CFStringRef v13 = @"kRadioAccessTechnologyUTRAN";
      break;
    case 8:
      CFStringRef v13 = @"kRadioAccessTechnologyCDMA1x";
      break;
    default:
      if (technology != 16) {
        goto LABEL_41;
      }
      CFStringRef v13 = @"kRadioAccessTechnologyCDMAEVDO";
      break;
  }
LABEL_46:
  [v3 setObject:v13 forKey:@"technology"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_47:
  int wifiGranularity = self->_wifiGranularity;
  switch(wifiGranularity)
  {
    case 1:
      CFStringRef v17 = @"kGranularityFine";
      break;
    case 4:
      CFStringRef v17 = @"kGranularityNearby";
      break;
    case 2:
      CFStringRef v17 = @"kGranularityCoarse";
      break;
    default:
      CFStringRef v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_wifiGranularity];
      break;
  }
  [v3 setObject:v17 forKey:@"wifiGranularity"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_radius)] forKey:@"radius"];
LABEL_7:
  p_wifiBands = &self->_wifiBands;
  if (self->_wifiBands.count)
  {
    v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (self->_wifiBands.count)
    {
      unint64_t v7 = 0;
      do
      {
        int v8 = p_wifiBands->list[v7];
        if (v8 == 1)
        {
          CFStringRef v9 = @"k2dot4GHZ";
        }
        else if (v8 == 2)
        {
          CFStringRef v9 = @"k5GHZ";
        }
        else
        {
          CFStringRef v9 = +[NSString stringWithFormat:@"(unknown: %i)", p_wifiBands->list[v7]];
        }
        [(NSMutableArray *)v6 addObject:v9];
        ++v7;
      }
      while (v7 < self->_wifiBands.count);
    }
    [v3 setObject:v6 forKey:@"wifiBands"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int wifiAltitudeScale = self->_wifiAltitudeScale;
    if (wifiAltitudeScale == 1)
    {
      CFStringRef v11 = @"kWifiAltitudeScaleNone";
    }
    else if (wifiAltitudeScale == 2)
    {
      CFStringRef v11 = @"kWifiAltitudeScale10toThe2";
    }
    else
    {
      CFStringRef v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_wifiAltitudeScale];
    }
    [v3 setObject:v11 forKey:@"wifiAltitudeScale"];
  }
  meta = self->_meta;
  if (meta) {
    [v3 setObject:meta.dictionaryRepresentation forKey:@"meta"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100FAB814((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_wifiBands.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_wifiBands.count);
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_meta)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (unsigned)requestTypeCode
{
  return 3;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 4) = self->_latitude;
  *((void *)a3 + 5) = self->_longitude;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)a3 + 76) = self->_needCellsTowers;
    *((unsigned char *)a3 + 80) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 14) = self->_numberOfSurroundingWifis;
  *((unsigned char *)a3 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_20:
    *((_DWORD *)a3 + 18) = self->_wifiGranularity;
    *((unsigned char *)a3 + 80) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  *((_DWORD *)a3 + 16) = self->_technology;
  *((unsigned char *)a3 + 80) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 15) = self->_radius;
    *((unsigned char *)a3 + 80) |= 2u;
  }
LABEL_7:
  if ([(ALSNearbyRequest *)self wifiBandsCount])
  {
    [a3 clearWifiBands];
    unint64_t v6 = [(ALSNearbyRequest *)self wifiBandsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addWifiBands:-[ALSNearbyRequest wifiBandsAtIndex:](self, "wifiBandsAtIndex:", i)];
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_wifiAltitudeScale;
    *((unsigned char *)a3 + 80) |= 8u;
  }
  if (self->_meta)
  {
    [a3 setMeta:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  v5[4] = self->_latitude;
  v5[5] = self->_longitude;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v5 + 76) = self->_needCellsTowers;
    *((unsigned char *)v5 + 80) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 14) = self->_numberOfSurroundingWifis;
  *((unsigned char *)v5 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v5 + 16) = self->_technology;
  *((unsigned char *)v5 + 80) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v5 + 18) = self->_wifiGranularity;
  *((unsigned char *)v5 + 80) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 15) = self->_radius;
    *((unsigned char *)v5 + 80) |= 2u;
  }
LABEL_7:
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_wifiAltitudeScale;
    *((unsigned char *)v6 + 80) |= 8u;
  }

  *((void *)v6 + 6) = [(ALSMeta *)self->_meta copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (!IsEqual) {
    return IsEqual;
  }
  if (self->_latitude != *((void *)a3 + 4) || self->_longitude != *((void *)a3 + 5)) {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    if ((*((unsigned char *)a3 + 80) & 0x20) != 0) {
      goto LABEL_40;
    }
    goto LABEL_12;
  }
  if ((*((unsigned char *)a3 + 80) & 0x20) == 0) {
    goto LABEL_40;
  }
  if (self->_needCellsTowers)
  {
    if (!*((unsigned char *)a3 + 76)) {
      goto LABEL_40;
    }
    goto LABEL_12;
  }
  if (*((unsigned char *)a3 + 76))
  {
LABEL_40:
    LOBYTE(IsEqual) = 0;
    return IsEqual;
  }
LABEL_12:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 80) & 1) == 0 || self->_numberOfSurroundingWifis != *((_DWORD *)a3 + 14)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)a3 + 80))
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 80) & 4) == 0 || self->_technology != *((_DWORD *)a3 + 16)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 80) & 0x10) == 0 || self->_wifiGranularity != *((_DWORD *)a3 + 18)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 80) & 2) == 0 || self->_radius != *((_DWORD *)a3 + 15)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 2) != 0)
  {
    goto LABEL_40;
  }
  unsigned int IsEqual = PBRepeatedInt32IsEqual();
  if (IsEqual)
  {
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 80) & 8) == 0 || self->_wifiAltitudeScale != *((_DWORD *)a3 + 17)) {
        goto LABEL_40;
      }
    }
    else if ((*((unsigned char *)a3 + 80) & 8) != 0)
    {
      goto LABEL_40;
    }
    meta = self->_meta;
    if ((unint64_t)meta | *((void *)a3 + 6))
    {
      LOBYTE(IsEqual) = -[ALSMeta isEqual:](meta, "isEqual:");
    }
    else
    {
      LOBYTE(IsEqual) = 1;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_needCellsTowers;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_numberOfSurroundingWifis;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_technology;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v6 = 2654435761 * self->_wifiGranularity;
  }
  else {
    uint64_t v6 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_radius;
  }
  else {
    uint64_t v7 = 0;
  }
  int64_t latitude = self->_latitude;
  int64_t longitude = self->_longitude;
  uint64_t v10 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_wifiAltitudeScale;
  }
  else {
    uint64_t v11 = 0;
  }
  return (2654435761 * longitude) ^ (2654435761 * latitude) ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v10 ^ v11 ^ [(ALSMeta *)self->_meta hash];
}

- (void)mergeFrom:(id)a3
{
  self->_int64_t latitude = *((void *)a3 + 4);
  self->_int64_t longitude = *((void *)a3 + 5);
  char v5 = *((unsigned char *)a3 + 80);
  if ((v5 & 0x20) != 0)
  {
    self->_needCellsTowers = *((unsigned char *)a3 + 76);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)a3 + 80);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfSurroundingWifis = *((_DWORD *)a3 + 14);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)a3 + 80);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_int technology = *((_DWORD *)a3 + 16);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 80);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_20:
  self->_int wifiGranularity = *((_DWORD *)a3 + 18);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 80) & 2) != 0)
  {
LABEL_6:
    self->_radius = *((_DWORD *)a3 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
  uint64_t v6 = (char *)[a3 wifiBandsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[ALSNearbyRequest addWifiBands:](self, "addWifiBands:", [a3 wifiBandsAtIndex:i]);
  }
  if ((*((unsigned char *)a3 + 80) & 8) != 0)
  {
    self->_int wifiAltitudeScale = *((_DWORD *)a3 + 17);
    *(unsigned char *)&self->_has |= 8u;
  }
  meta = self->_meta;
  uint64_t v10 = *((void *)a3 + 6);
  if (meta)
  {
    if (v10)
    {
      -[ALSMeta mergeFrom:](meta, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[ALSNearbyRequest setMeta:](self, "setMeta:");
  }
}

- (int64_t)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(int64_t)a3
{
  self->_int64_t latitude = a3;
}

- (int64_t)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(int64_t)a3
{
  self->_int64_t longitude = a3;
}

- (BOOL)needCellsTowers
{
  return self->_needCellsTowers;
}

- (int)numberOfSurroundingWifis
{
  return self->_numberOfSurroundingWifis;
}

- (int)radius
{
  return self->_radius;
}

- (ALSMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

@end