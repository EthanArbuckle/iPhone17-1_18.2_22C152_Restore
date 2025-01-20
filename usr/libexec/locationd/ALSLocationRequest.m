@interface ALSLocationRequest
+ (Class)cdmaCellTowerType;
+ (Class)cdmaEvdoTowerType;
+ (Class)cellTowerType;
+ (Class)lteCellTowerType;
+ (Class)nr5GCellTowerType;
+ (Class)scdmaCellTowerType;
+ (Class)wirelessAPType;
- (ALSMeta)meta;
- (BOOL)hasAppBundleId;
- (BOOL)hasMeta;
- (BOOL)hasNumberOfSurroundingCdmaCells;
- (BOOL)hasNumberOfSurroundingCdmaEvdoCells;
- (BOOL)hasNumberOfSurroundingCells;
- (BOOL)hasNumberOfSurroundingLteCells;
- (BOOL)hasNumberOfSurroundingNr5GCells;
- (BOOL)hasNumberOfSurroundingScdmaCells;
- (BOOL)hasNumberOfSurroundingWifis;
- (BOOL)hasWifiAltitudeScale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSMutableArray)cdmaCellTowers;
- (NSMutableArray)cdmaEvdoTowers;
- (NSMutableArray)cellTowers;
- (NSMutableArray)lteCellTowers;
- (NSMutableArray)nr5GCellTowers;
- (NSMutableArray)scdmaCellTowers;
- (NSMutableArray)wirelessAPs;
- (NSString)appBundleId;
- (id)cdmaCellTowerAtIndex:(unint64_t)a3;
- (id)cdmaEvdoTowerAtIndex:(unint64_t)a3;
- (id)cellTowerAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lteCellTowerAtIndex:(unint64_t)a3;
- (id)nr5GCellTowerAtIndex:(unint64_t)a3;
- (id)scdmaCellTowerAtIndex:(unint64_t)a3;
- (id)surroundingWifiBandsAsString:(int)a3;
- (id)wifiAltitudeScaleAsString:(int)a3;
- (id)wirelessAPAtIndex:(unint64_t)a3;
- (int)StringAsSurroundingWifiBands:(id)a3;
- (int)StringAsWifiAltitudeScale:(id)a3;
- (int)numberOfSurroundingCdmaCells;
- (int)numberOfSurroundingCdmaEvdoCells;
- (int)numberOfSurroundingCells;
- (int)numberOfSurroundingLteCells;
- (int)numberOfSurroundingNr5GCells;
- (int)numberOfSurroundingScdmaCells;
- (int)numberOfSurroundingWifis;
- (int)surroundingWifiBands;
- (int)surroundingWifiBandsAtIndex:(unint64_t)a3;
- (int)wifiAltitudeScale;
- (unint64_t)cdmaCellTowersCount;
- (unint64_t)cdmaEvdoTowersCount;
- (unint64_t)cellTowersCount;
- (unint64_t)hash;
- (unint64_t)lteCellTowersCount;
- (unint64_t)nr5GCellTowersCount;
- (unint64_t)scdmaCellTowersCount;
- (unint64_t)surroundingWifiBandsCount;
- (unint64_t)wirelessAPsCount;
- (unsigned)requestTypeCode;
- (void)addCdmaCellTower:(id)a3;
- (void)addCdmaEvdoTower:(id)a3;
- (void)addCellTower:(id)a3;
- (void)addLteCellTower:(id)a3;
- (void)addNr5GCellTower:(id)a3;
- (void)addScdmaCellTower:(id)a3;
- (void)addSurroundingWifiBands:(int)a3;
- (void)addWirelessAP:(id)a3;
- (void)clearCdmaCellTowers;
- (void)clearCdmaEvdoTowers;
- (void)clearCellTowers;
- (void)clearLteCellTowers;
- (void)clearNr5GCellTowers;
- (void)clearScdmaCellTowers;
- (void)clearSurroundingWifiBands;
- (void)clearWirelessAPs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setCdmaCellTowers:(id)a3;
- (void)setCdmaEvdoTowers:(id)a3;
- (void)setCellTowers:(id)a3;
- (void)setHasNumberOfSurroundingCdmaCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingCdmaEvdoCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingLteCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingNr5GCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingScdmaCells:(BOOL)a3;
- (void)setHasNumberOfSurroundingWifis:(BOOL)a3;
- (void)setHasWifiAltitudeScale:(BOOL)a3;
- (void)setLteCellTowers:(id)a3;
- (void)setMeta:(id)a3;
- (void)setNr5GCellTowers:(id)a3;
- (void)setNumberOfSurroundingCdmaCells:(int)a3;
- (void)setNumberOfSurroundingCdmaEvdoCells:(int)a3;
- (void)setNumberOfSurroundingCells:(int)a3;
- (void)setNumberOfSurroundingLteCells:(int)a3;
- (void)setNumberOfSurroundingNr5GCells:(int)a3;
- (void)setNumberOfSurroundingScdmaCells:(int)a3;
- (void)setNumberOfSurroundingWifis:(int)a3;
- (void)setScdmaCellTowers:(id)a3;
- (void)setSurroundingWifiBands:(int *)a3 count:(unint64_t)a4;
- (void)setWifiAltitudeScale:(int)a3;
- (void)setWirelessAPs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSLocationRequest

- (void)dealloc
{
  [(ALSLocationRequest *)self setCellTowers:0];
  [(ALSLocationRequest *)self setWirelessAPs:0];
  [(ALSLocationRequest *)self setAppBundleId:0];
  [(ALSLocationRequest *)self setCdmaCellTowers:0];
  [(ALSLocationRequest *)self setCdmaEvdoTowers:0];
  [(ALSLocationRequest *)self setLteCellTowers:0];
  [(ALSLocationRequest *)self setScdmaCellTowers:0];
  [(ALSLocationRequest *)self setNr5GCellTowers:0];
  PBRepeatedInt32Clear();
  [(ALSLocationRequest *)self setMeta:0];
  v3.receiver = self;
  v3.super_class = (Class)ALSLocationRequest;
  [(ALSLocationRequest *)&v3 dealloc];
}

- (void)clearCellTowers
{
}

- (void)addCellTower:(id)a3
{
  cellTowers = self->_cellTowers;
  if (!cellTowers)
  {
    cellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_cellTowers = cellTowers;
  }

  [(NSMutableArray *)cellTowers addObject:a3];
}

- (unint64_t)cellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_cellTowers count];
}

- (id)cellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_cellTowers objectAtIndex:a3];
}

+ (Class)cellTowerType
{
  return (Class)objc_opt_class();
}

- (void)clearWirelessAPs
{
}

- (void)addWirelessAP:(id)a3
{
  wirelessAPs = self->_wirelessAPs;
  if (!wirelessAPs)
  {
    wirelessAPs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_wirelessAPs = wirelessAPs;
  }

  [(NSMutableArray *)wirelessAPs addObject:a3];
}

- (unint64_t)wirelessAPsCount
{
  return (unint64_t)[(NSMutableArray *)self->_wirelessAPs count];
}

- (id)wirelessAPAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_wirelessAPs objectAtIndex:a3];
}

+ (Class)wirelessAPType
{
  return (Class)objc_opt_class();
}

- (void)setNumberOfSurroundingCells:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numberOfSurroundingCells = a3;
}

- (void)setHasNumberOfSurroundingCells:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfSurroundingCells
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumberOfSurroundingWifis:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_numberOfSurroundingWifis = a3;
}

- (void)setHasNumberOfSurroundingWifis:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasNumberOfSurroundingWifis
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)clearCdmaCellTowers
{
}

- (void)addCdmaCellTower:(id)a3
{
  cdmaCellTowers = self->_cdmaCellTowers;
  if (!cdmaCellTowers)
  {
    cdmaCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_cdmaCellTowers = cdmaCellTowers;
  }

  [(NSMutableArray *)cdmaCellTowers addObject:a3];
}

- (unint64_t)cdmaCellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_cdmaCellTowers count];
}

- (id)cdmaCellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_cdmaCellTowers objectAtIndex:a3];
}

+ (Class)cdmaCellTowerType
{
  return (Class)objc_opt_class();
}

- (void)clearCdmaEvdoTowers
{
}

- (void)addCdmaEvdoTower:(id)a3
{
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  if (!cdmaEvdoTowers)
  {
    cdmaEvdoTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_cdmaEvdoTowers = cdmaEvdoTowers;
  }

  [(NSMutableArray *)cdmaEvdoTowers addObject:a3];
}

- (unint64_t)cdmaEvdoTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_cdmaEvdoTowers count];
}

- (id)cdmaEvdoTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_cdmaEvdoTowers objectAtIndex:a3];
}

+ (Class)cdmaEvdoTowerType
{
  return (Class)objc_opt_class();
}

- (void)setNumberOfSurroundingCdmaCells:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberOfSurroundingCdmaCells = a3;
}

- (void)setHasNumberOfSurroundingCdmaCells:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfSurroundingCdmaCells
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberOfSurroundingCdmaEvdoCells:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberOfSurroundingCdmaEvdoCells = a3;
}

- (void)setHasNumberOfSurroundingCdmaEvdoCells:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfSurroundingCdmaEvdoCells
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearLteCellTowers
{
}

- (void)addLteCellTower:(id)a3
{
  lteCellTowers = self->_lteCellTowers;
  if (!lteCellTowers)
  {
    lteCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_lteCellTowers = lteCellTowers;
  }

  [(NSMutableArray *)lteCellTowers addObject:a3];
}

- (unint64_t)lteCellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_lteCellTowers count];
}

- (id)lteCellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_lteCellTowers objectAtIndex:a3];
}

+ (Class)lteCellTowerType
{
  return (Class)objc_opt_class();
}

- (void)setNumberOfSurroundingLteCells:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numberOfSurroundingLteCells = a3;
}

- (void)setHasNumberOfSurroundingLteCells:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfSurroundingLteCells
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearScdmaCellTowers
{
}

- (void)addScdmaCellTower:(id)a3
{
  scdmaCellTowers = self->_scdmaCellTowers;
  if (!scdmaCellTowers)
  {
    scdmaCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_scdmaCellTowers = scdmaCellTowers;
  }

  [(NSMutableArray *)scdmaCellTowers addObject:a3];
}

- (unint64_t)scdmaCellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_scdmaCellTowers count];
}

- (id)scdmaCellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_scdmaCellTowers objectAtIndex:a3];
}

+ (Class)scdmaCellTowerType
{
  return (Class)objc_opt_class();
}

- (void)setNumberOfSurroundingScdmaCells:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_numberOfSurroundingScdmaCells = a3;
}

- (void)setHasNumberOfSurroundingScdmaCells:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumberOfSurroundingScdmaCells
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)clearNr5GCellTowers
{
}

- (void)addNr5GCellTower:(id)a3
{
  nr5GCellTowers = self->_nr5GCellTowers;
  if (!nr5GCellTowers)
  {
    nr5GCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_nr5GCellTowers = nr5GCellTowers;
  }

  [(NSMutableArray *)nr5GCellTowers addObject:a3];
}

- (unint64_t)nr5GCellTowersCount
{
  return (unint64_t)[(NSMutableArray *)self->_nr5GCellTowers count];
}

- (id)nr5GCellTowerAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_nr5GCellTowers objectAtIndex:a3];
}

+ (Class)nr5GCellTowerType
{
  return (Class)objc_opt_class();
}

- (void)setNumberOfSurroundingNr5GCells:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numberOfSurroundingNr5GCells = a3;
}

- (void)setHasNumberOfSurroundingNr5GCells:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumberOfSurroundingNr5GCells
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (unint64_t)surroundingWifiBandsCount
{
  return self->_surroundingWifiBands.count;
}

- (int)surroundingWifiBands
{
  return self->_surroundingWifiBands.list;
}

- (void)clearSurroundingWifiBands
{
}

- (void)addSurroundingWifiBands:(int)a3
{
}

- (int)surroundingWifiBandsAtIndex:(unint64_t)a3
{
  p_surroundingWifiBands = &self->_surroundingWifiBands;
  unint64_t count = self->_surroundingWifiBands.count;
  if (count <= a3) {
    [+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], 0) raise];
  }
  return p_surroundingWifiBands->list[a3];
}

- (void)setSurroundingWifiBands:(int *)a3 count:(unint64_t)a4
{
}

- (id)surroundingWifiBandsAsString:(int)a3
{
  if (a3 == 1) {
    return @"k2dot4GHZ";
  }
  if (a3 == 2) {
    return @"k5GHZ";
  }
  return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsSurroundingWifiBands:(id)a3
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
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    return self->_wifiAltitudeScale;
  }
  else {
    return 1;
  }
}

- (void)setWifiAltitudeScale:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_wifiAltitudeScale = a3;
}

- (void)setHasWifiAltitudeScale:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasWifiAltitudeScale
{
  return *(unsigned char *)&self->_has >> 7;
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
  v3.super_class = (Class)ALSLocationRequest;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSLocationRequest *)&v3 description], [(ALSLocationRequest *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_cellTowers count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_cellTowers, "count")];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    cellTowers = self->_cellTowers;
    id v6 = [(NSMutableArray *)cellTowers countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v83;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v83 != v8) {
            objc_enumerationMutation(cellTowers);
          }
          [v4 addObject:[(*(id *)(*((void *)&v82 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        id v7 = [(NSMutableArray *)cellTowers countByEnumeratingWithState:&v82 objects:v92 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"cellTower"];
  }
  if ([(NSMutableArray *)self->_wirelessAPs count])
  {
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_wirelessAPs, "count")];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    wirelessAPs = self->_wirelessAPs;
    id v12 = [(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v78 objects:v91 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v79;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v79 != v14) {
            objc_enumerationMutation(wirelessAPs);
          }
          [v10 addObject:[*(id *)(*((void *)&v78 + 1) + 8 * (void)j) dictionaryRepresentation]];
        }
        id v13 = [(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v78 objects:v91 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"wirelessAP"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingCells)] forKey:@"numberOfSurroundingCells"];
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0) {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingWifis)] forKey:@"numberOfSurroundingWifis"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v3 setObject:appBundleId forKey:@"appBundleId"];
  }
  if ([(NSMutableArray *)self->_cdmaCellTowers count])
  {
    id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_cdmaCellTowers, "count")];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    cdmaCellTowers = self->_cdmaCellTowers;
    id v20 = [(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v74 objects:v90 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v75;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v75 != v22) {
            objc_enumerationMutation(cdmaCellTowers);
          }
          [v18 addObject:[k dictionaryRepresentation]];
        }
        id v21 = [(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v74 objects:v90 count:16];
      }
      while (v21);
    }
    [v3 setObject:v18 forKey:@"cdmaCellTower"];
  }
  if ([(NSMutableArray *)self->_cdmaEvdoTowers count])
  {
    id v24 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_cdmaEvdoTowers, "count")];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    cdmaEvdoTowers = self->_cdmaEvdoTowers;
    id v26 = [(NSMutableArray *)cdmaEvdoTowers countByEnumeratingWithState:&v70 objects:v89 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v71;
      do
      {
        for (m = 0; m != v27; m = (char *)m + 1)
        {
          if (*(void *)v71 != v28) {
            objc_enumerationMutation(cdmaEvdoTowers);
          }
          [v24 addObject:[m dictionaryRepresentation]];
        }
        id v27 = [(NSMutableArray *)cdmaEvdoTowers countByEnumeratingWithState:&v70 objects:v89 count:16];
      }
      while (v27);
    }
    [v3 setObject:v24 forKey:@"cdmaEvdoTower"];
  }
  char v30 = (char)self->_has;
  if (v30)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingCdmaCells)] forKey:@"numberOfSurroundingCdmaCells"];
    char v30 = (char)self->_has;
  }
  if ((v30 & 2) != 0) {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingCdmaEvdoCells)] forKey:@"numberOfSurroundingCdmaEvdoCells"];
  }
  if ([(NSMutableArray *)self->_lteCellTowers count])
  {
    id v31 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_lteCellTowers, "count")];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    lteCellTowers = self->_lteCellTowers;
    id v33 = [(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v66 objects:v88 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v67;
      do
      {
        for (n = 0; n != v34; n = (char *)n + 1)
        {
          if (*(void *)v67 != v35) {
            objc_enumerationMutation(lteCellTowers);
          }
          [v31 addObject:[*(id *)(*((void *)&v66 + 1) + 8 * (void)n) dictionaryRepresentation]];
        }
        id v34 = [(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v66 objects:v88 count:16];
      }
      while (v34);
    }
    [v3 setObject:v31 forKey:@"lteCellTower"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingLteCells)] forKey:@"numberOfSurroundingLteCells"];
  }
  if ([(NSMutableArray *)self->_scdmaCellTowers count])
  {
    id v37 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_scdmaCellTowers, "count")];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    scdmaCellTowers = self->_scdmaCellTowers;
    id v39 = [(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v62 objects:v87 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v63;
      do
      {
        for (ii = 0; ii != v40; ii = (char *)ii + 1)
        {
          if (*(void *)v63 != v41) {
            objc_enumerationMutation(scdmaCellTowers);
          }
          [v37 addObject:[*(id *)(*((void *)&v62 + 1) + 8 * (void)ii) dictionaryRepresentation]];
        }
        id v40 = [(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v62 objects:v87 count:16];
      }
      while (v40);
    }
    [v3 setObject:v37 forKey:@"scdmaCellTower"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingScdmaCells)] forKey:@"numberOfSurroundingScdmaCells"];
  }
  if ([(NSMutableArray *)self->_nr5GCellTowers count])
  {
    id v43 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_nr5GCellTowers, "count")];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    nr5GCellTowers = self->_nr5GCellTowers;
    id v45 = [(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v58 objects:v86 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v59;
      do
      {
        for (jj = 0; jj != v46; jj = (char *)jj + 1)
        {
          if (*(void *)v59 != v47) {
            objc_enumerationMutation(nr5GCellTowers);
          }
          [v43 addObject:[*(id *)(*((void *)&v58 + 1) + 8 * (void)jj) dictionaryRepresentation]];
        }
        id v46 = [(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v58 objects:v86 count:16];
      }
      while (v46);
    }
    [v3 setObject:v43 forKey:@"nr5GCellTower"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingNr5GCells)] forKey:@"numberOfSurroundingNr5GCells"];
  }
  p_surroundingWifiBands = &self->_surroundingWifiBands;
  if (self->_surroundingWifiBands.count)
  {
    v50 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (self->_surroundingWifiBands.count)
    {
      unint64_t v51 = 0;
      do
      {
        int v52 = p_surroundingWifiBands->list[v51];
        if (v52 == 1)
        {
          CFStringRef v53 = @"k2dot4GHZ";
        }
        else if (v52 == 2)
        {
          CFStringRef v53 = @"k5GHZ";
        }
        else
        {
          CFStringRef v53 = +[NSString stringWithFormat:@"(unknown: %i)", p_surroundingWifiBands->list[v51]];
        }
        [(NSMutableArray *)v50 addObject:v53];
        ++v51;
      }
      while (v51 < self->_surroundingWifiBands.count);
    }
    [v3 setObject:v50 forKey:@"surroundingWifiBands"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    int wifiAltitudeScale = self->_wifiAltitudeScale;
    if (wifiAltitudeScale == 1)
    {
      CFStringRef v55 = @"kWifiAltitudeScaleNone";
    }
    else if (wifiAltitudeScale == 2)
    {
      CFStringRef v55 = @"kWifiAltitudeScale10toThe2";
    }
    else
    {
      CFStringRef v55 = +[NSString stringWithFormat:@"(unknown: %i)", self->_wifiAltitudeScale];
    }
    [v3 setObject:v55 forKey:@"wifiAltitudeScale"];
  }
  meta = self->_meta;
  if (meta) {
    [v3 setObject:-[ALSMeta dictionaryRepresentation](meta, "dictionaryRepresentation") forKey:@"meta"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F9894C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  cellTowers = self->_cellTowers;
  v5 = (char *)[(NSMutableArray *)cellTowers countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v67;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v67 != v7) {
          objc_enumerationMutation(cellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      id v6 = (char *)[(NSMutableArray *)cellTowers countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v6);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v10 = (char *)[(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = *(void *)v63;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(wirelessAPs);
        }
        PBDataWriterWriteSubmessage();
      }
      v11 = (char *)[(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v11);
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  v16 = (char *)[(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v16)
  {
    v17 = v16;
    uint64_t v18 = *(void *)v59;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(void *)v59 != v18) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      v17 = (char *)[(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v17);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  id v21 = (char *)[(NSMutableArray *)cdmaEvdoTowers countByEnumeratingWithState:&v54 objects:v73 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v55;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(void *)v55 != v23) {
          objc_enumerationMutation(cdmaEvdoTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = (char *)[(NSMutableArray *)cdmaEvdoTowers countByEnumeratingWithState:&v54 objects:v73 count:16];
    }
    while (v22);
  }
  char v25 = (char)self->_has;
  if (v25)
  {
    PBDataWriterWriteInt32Field();
    char v25 = (char)self->_has;
  }
  if ((v25 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  lteCellTowers = self->_lteCellTowers;
  id v27 = (char *)[(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v50 objects:v72 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v51;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(lteCellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v28 = (char *)[(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v50 objects:v72 count:16];
    }
    while (v28);
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  v32 = (char *)[(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v46 objects:v71 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v47;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      id v33 = (char *)[(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v46 objects:v71 count:16];
    }
    while (v33);
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v37 = (char *)[(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v42 objects:v70 count:16];
  if (v37)
  {
    v38 = v37;
    uint64_t v39 = *(void *)v43;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(void *)v43 != v39) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        PBDataWriterWriteSubmessage();
      }
      v38 = (char *)[(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v42 objects:v70 count:16];
    }
    while (v38);
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_surroundingWifiBands.count)
  {
    unint64_t v41 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v41;
    }
    while (v41 < self->_surroundingWifiBands.count);
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_meta) {
    PBDataWriterWriteSubmessage();
  }
}

- (unsigned)requestTypeCode
{
  return 1;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  if ([(ALSLocationRequest *)self cellTowersCount])
  {
    [a3 clearCellTowers];
    unint64_t v5 = [(ALSLocationRequest *)self cellTowersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addCellTower:-[ALSLocationRequest cellTowerAtIndex:](self, "cellTowerAtIndex:", i)];
    }
  }
  if ([(ALSLocationRequest *)self wirelessAPsCount])
  {
    [a3 clearWirelessAPs];
    unint64_t v8 = [(ALSLocationRequest *)self wirelessAPsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addWirelessAP:-[ALSLocationRequest wirelessAPAtIndex:](self, "wirelessAPAtIndex:", j)];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 24) = self->_numberOfSurroundingCells;
    *((unsigned char *)a3 + 144) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 28) = self->_numberOfSurroundingWifis;
    *((unsigned char *)a3 + 144) |= 0x40u;
  }
  if (self->_appBundleId) {
    [a3 setAppBundleId:];
  }
  if ([(ALSLocationRequest *)self cdmaCellTowersCount])
  {
    [a3 clearCdmaCellTowers];
    unint64_t v12 = [(ALSLocationRequest *)self cdmaCellTowersCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [a3 addCdmaCellTower:-[ALSLocationRequest cdmaCellTowerAtIndex:](self, "cdmaCellTowerAtIndex:", k)];
    }
  }
  if ([(ALSLocationRequest *)self cdmaEvdoTowersCount])
  {
    [a3 clearCdmaEvdoTowers];
    unint64_t v15 = [(ALSLocationRequest *)self cdmaEvdoTowersCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [a3 addCdmaEvdoTower:-[ALSLocationRequest cdmaEvdoTowerAtIndex:](self, "cdmaEvdoTowerAtIndex:", m)];
    }
  }
  char v18 = (char)self->_has;
  if (v18)
  {
    *((_DWORD *)a3 + 22) = self->_numberOfSurroundingCdmaCells;
    *((unsigned char *)a3 + 144) |= 1u;
    char v18 = (char)self->_has;
  }
  if ((v18 & 2) != 0)
  {
    *((_DWORD *)a3 + 23) = self->_numberOfSurroundingCdmaEvdoCells;
    *((unsigned char *)a3 + 144) |= 2u;
  }
  if ([(ALSLocationRequest *)self lteCellTowersCount])
  {
    [a3 clearLteCellTowers];
    unint64_t v19 = [(ALSLocationRequest *)self lteCellTowersCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
        [a3 addLteCellTower:-[ALSLocationRequest lteCellTowerAtIndex:](self, "lteCellTowerAtIndex:", n)];
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 25) = self->_numberOfSurroundingLteCells;
    *((unsigned char *)a3 + 144) |= 8u;
  }
  if ([(ALSLocationRequest *)self scdmaCellTowersCount])
  {
    [a3 clearScdmaCellTowers];
    unint64_t v22 = [(ALSLocationRequest *)self scdmaCellTowersCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (iuint64_t i = 0; ii != v23; ++ii)
        [a3 addScdmaCellTower:-[ALSLocationRequest scdmaCellTowerAtIndex:](self, "scdmaCellTowerAtIndex:", ii)];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 27) = self->_numberOfSurroundingScdmaCells;
    *((unsigned char *)a3 + 144) |= 0x20u;
  }
  if ([(ALSLocationRequest *)self nr5GCellTowersCount])
  {
    [a3 clearNr5GCellTowers];
    unint64_t v25 = [(ALSLocationRequest *)self nr5GCellTowersCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (juint64_t j = 0; jj != v26; ++jj)
        [a3 addNr5GCellTower:-[ALSLocationRequest nr5GCellTowerAtIndex:](self, "nr5GCellTowerAtIndex:", jj)];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_numberOfSurroundingNr5GCells;
    *((unsigned char *)a3 + 144) |= 0x10u;
  }
  if ([(ALSLocationRequest *)self surroundingWifiBandsCount])
  {
    [a3 clearSurroundingWifiBands];
    unint64_t v28 = [(ALSLocationRequest *)self surroundingWifiBandsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (kuint64_t k = 0; kk != v29; ++kk)
        [a3 addSurroundingWifiBands:-[ALSLocationRequest surroundingWifiBandsAtIndex:](self, "surroundingWifiBandsAtIndex:", kk)];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)a3 + 32) = self->_wifiAltitudeScale;
    *((unsigned char *)a3 + 144) |= 0x80u;
  }
  if (self->_meta)
  {
    [a3 setMeta:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  cellTowers = self->_cellTowers;
  id v7 = [(NSMutableArray *)cellTowers countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v76 != v9) {
          objc_enumerationMutation(cellTowers);
        }
        id v11 = [*(id *)(*((void *)&v75 + 1) + 8 * i) copyWithZone:a3];
        [v5 addCellTower:v11];
      }
      id v8 = [(NSMutableArray *)cellTowers countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v8);
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  wirelessAPs = self->_wirelessAPs;
  id v13 = [(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v72 != v15) {
          objc_enumerationMutation(wirelessAPs);
        }
        id v17 = [*(id *)(*((void *)&v71 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addWirelessAP:v17];
      }
      id v14 = [(NSMutableArray *)wirelessAPs countByEnumeratingWithState:&v71 objects:v84 count:16];
    }
    while (v14);
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_numberOfSurroundingCells;
    *((unsigned char *)v5 + 144) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 28) = self->_numberOfSurroundingWifis;
    *((unsigned char *)v5 + 144) |= 0x40u;
  }

  v5[4] = [(NSString *)self->_appBundleId copyWithZone:a3];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  id v20 = [(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v67 objects:v83 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v21; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v68 != v22) {
          objc_enumerationMutation(cdmaCellTowers);
        }
        id v24 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)k) copyWithZone:a3];
        [v5 addCdmaCellTower:v24];
      }
      id v21 = [(NSMutableArray *)cdmaCellTowers countByEnumeratingWithState:&v67 objects:v83 count:16];
    }
    while (v21);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  id v26 = [(NSMutableArray *)cdmaEvdoTowers countByEnumeratingWithState:&v63 objects:v82 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v64;
    do
    {
      for (uint64_t m = 0; m != v27; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v64 != v28) {
          objc_enumerationMutation(cdmaEvdoTowers);
        }
        id v30 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)m) copyWithZone:a3];
        [v5 addCdmaEvdoTower:v30];
      }
      id v27 = [(NSMutableArray *)cdmaEvdoTowers countByEnumeratingWithState:&v63 objects:v82 count:16];
    }
    while (v27);
  }
  char v31 = (char)self->_has;
  if (v31)
  {
    *((_DWORD *)v5 + 22) = self->_numberOfSurroundingCdmaCells;
    *((unsigned char *)v5 + 144) |= 1u;
    char v31 = (char)self->_has;
  }
  if ((v31 & 2) != 0)
  {
    *((_DWORD *)v5 + 23) = self->_numberOfSurroundingCdmaEvdoCells;
    *((unsigned char *)v5 + 144) |= 2u;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  lteCellTowers = self->_lteCellTowers;
  id v33 = [(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v59 objects:v81 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v60;
    do
    {
      for (uint64_t n = 0; n != v34; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v60 != v35) {
          objc_enumerationMutation(lteCellTowers);
        }
        id v37 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)n) copyWithZone:a3];
        [v5 addLteCellTower:v37];
      }
      id v34 = [(NSMutableArray *)lteCellTowers countByEnumeratingWithState:&v59 objects:v81 count:16];
    }
    while (v34);
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v5 + 25) = self->_numberOfSurroundingLteCells;
    *((unsigned char *)v5 + 144) |= 8u;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  id v39 = [(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v55 objects:v80 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v56;
    do
    {
      for (iuint64_t i = 0; ii != v40; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v56 != v41) {
          objc_enumerationMutation(scdmaCellTowers);
        }
        id v43 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)ii) copyWithZone:a3];
        [v5 addScdmaCellTower:v43];
      }
      id v40 = [(NSMutableArray *)scdmaCellTowers countByEnumeratingWithState:&v55 objects:v80 count:16];
    }
    while (v40);
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v5 + 27) = self->_numberOfSurroundingScdmaCells;
    *((unsigned char *)v5 + 144) |= 0x20u;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  id v45 = [(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v51 objects:v79 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v52;
    do
    {
      for (juint64_t j = 0; jj != v46; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v52 != v47) {
          objc_enumerationMutation(nr5GCellTowers);
        }
        id v49 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)jj) copyWithZone:a3];
        [v5 addNr5GCellTower:v49];
      }
      id v46 = [(NSMutableArray *)nr5GCellTowers countByEnumeratingWithState:&v51 objects:v79 count:16];
    }
    while (v46);
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_numberOfSurroundingNr5GCells;
    *((unsigned char *)v5 + 144) |= 0x10u;
  }
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v5 + 32) = self->_wifiAltitudeScale;
    *((unsigned char *)v5 + 144) |= 0x80u;
  }

  v5[9] = [(ALSMeta *)self->_meta copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    cellTowers = self->_cellTowers;
    if (!((unint64_t)cellTowers | *((void *)a3 + 7))
      || (unsigned int IsEqual = -[NSMutableArray isEqual:](cellTowers, "isEqual:")) != 0)
    {
      wirelessAPs = self->_wirelessAPs;
      if (!((unint64_t)wirelessAPs | *((void *)a3 + 17))
        || (unsigned int IsEqual = -[NSMutableArray isEqual:](wirelessAPs, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 4) != 0)
        {
          if ((*((unsigned char *)a3 + 144) & 4) == 0 || self->_numberOfSurroundingCells != *((_DWORD *)a3 + 24)) {
            goto LABEL_63;
          }
        }
        else if ((*((unsigned char *)a3 + 144) & 4) != 0)
        {
          goto LABEL_63;
        }
        if ((*(unsigned char *)&self->_has & 0x40) != 0)
        {
          if ((*((unsigned char *)a3 + 144) & 0x40) == 0 || self->_numberOfSurroundingWifis != *((_DWORD *)a3 + 28)) {
            goto LABEL_63;
          }
        }
        else if ((*((unsigned char *)a3 + 144) & 0x40) != 0)
        {
          goto LABEL_63;
        }
        appBundleId = self->_appBundleId;
        if (!((unint64_t)appBundleId | *((void *)a3 + 4))
          || (unsigned int IsEqual = -[NSString isEqual:](appBundleId, "isEqual:")) != 0)
        {
          cdmaCellTowers = self->_cdmaCellTowers;
          if (!((unint64_t)cdmaCellTowers | *((void *)a3 + 5))
            || (unsigned int IsEqual = -[NSMutableArray isEqual:](cdmaCellTowers, "isEqual:")) != 0)
          {
            cdmaEvdoTowers = self->_cdmaEvdoTowers;
            if (!((unint64_t)cdmaEvdoTowers | *((void *)a3 + 6))
              || (unsigned int IsEqual = -[NSMutableArray isEqual:](cdmaEvdoTowers, "isEqual:")) != 0)
            {
              char has = (char)self->_has;
              if (has)
              {
                if ((*((unsigned char *)a3 + 144) & 1) == 0 || self->_numberOfSurroundingCdmaCells != *((_DWORD *)a3 + 22)) {
                  goto LABEL_63;
                }
              }
              else if (*((unsigned char *)a3 + 144))
              {
                goto LABEL_63;
              }
              if ((*(unsigned char *)&self->_has & 2) != 0)
              {
                if ((*((unsigned char *)a3 + 144) & 2) == 0 || self->_numberOfSurroundingCdmaEvdoCells != *((_DWORD *)a3 + 23)) {
                  goto LABEL_63;
                }
              }
              else if ((*((unsigned char *)a3 + 144) & 2) != 0)
              {
                goto LABEL_63;
              }
              lteCellTowers = self->_lteCellTowers;
              if ((unint64_t)lteCellTowers | *((void *)a3 + 8))
              {
                unsigned int IsEqual = -[NSMutableArray isEqual:](lteCellTowers, "isEqual:");
                if (!IsEqual) {
                  return IsEqual;
                }
                char has = (char)self->_has;
              }
              if ((has & 8) != 0)
              {
                if ((*((unsigned char *)a3 + 144) & 8) == 0 || self->_numberOfSurroundingLteCells != *((_DWORD *)a3 + 25)) {
                  goto LABEL_63;
                }
              }
              else if ((*((unsigned char *)a3 + 144) & 8) != 0)
              {
                goto LABEL_63;
              }
              scdmaCellTowers = self->_scdmaCellTowers;
              if ((unint64_t)scdmaCellTowers | *((void *)a3 + 15))
              {
                unsigned int IsEqual = -[NSMutableArray isEqual:](scdmaCellTowers, "isEqual:");
                if (!IsEqual) {
                  return IsEqual;
                }
                char has = (char)self->_has;
              }
              if ((has & 0x20) != 0)
              {
                if ((*((unsigned char *)a3 + 144) & 0x20) == 0 || self->_numberOfSurroundingScdmaCells != *((_DWORD *)a3 + 27)) {
                  goto LABEL_63;
                }
              }
              else if ((*((unsigned char *)a3 + 144) & 0x20) != 0)
              {
                goto LABEL_63;
              }
              nr5GCellTowers = self->_nr5GCellTowers;
              if ((unint64_t)nr5GCellTowers | *((void *)a3 + 10))
              {
                unsigned int IsEqual = -[NSMutableArray isEqual:](nr5GCellTowers, "isEqual:");
                if (!IsEqual) {
                  return IsEqual;
                }
                char has = (char)self->_has;
              }
              if ((has & 0x10) != 0)
              {
                if ((*((unsigned char *)a3 + 144) & 0x10) == 0 || self->_numberOfSurroundingNr5GCells != *((_DWORD *)a3 + 26)) {
                  goto LABEL_63;
                }
              }
              else if ((*((unsigned char *)a3 + 144) & 0x10) != 0)
              {
                goto LABEL_63;
              }
              unsigned int IsEqual = PBRepeatedInt32IsEqual();
              if (IsEqual)
              {
                int v15 = *((char *)a3 + 144);
                if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
                {
                  if ((v15 & 0x80000000) == 0 || self->_wifiAltitudeScale != *((_DWORD *)a3 + 32)) {
                    goto LABEL_63;
                  }
                }
                else if (v15 < 0)
                {
LABEL_63:
                  LOBYTE(IsEqual) = 0;
                  return IsEqual;
                }
                meta = self->_meta;
                if ((unint64_t)meta | *((void *)a3 + 9))
                {
                  LOBYTE(IsEqual) = -[ALSMeta isEqual:](meta, "isEqual:");
                }
                else
                {
                  LOBYTE(IsEqual) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  id v3 = [(NSMutableArray *)self->_cellTowers hash];
  id v4 = [(NSMutableArray *)self->_wirelessAPs hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v20 = 2654435761 * self->_numberOfSurroundingCells;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v23 = (unint64_t)v4;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v19 = 2654435761 * self->_numberOfSurroundingWifis;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_appBundleId hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_cdmaCellTowers hash];
  id v7 = [(NSMutableArray *)self->_cdmaEvdoTowers hash];
  unint64_t v24 = (unint64_t)v3;
  if (*(unsigned char *)&self->_has) {
    uint64_t v18 = 2654435761 * self->_numberOfSurroundingCdmaCells;
  }
  else {
    uint64_t v18 = 0;
  }
  unint64_t v22 = (unint64_t)v7;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    id v8 = [(NSMutableArray *)self->_lteCellTowers hash];
  }
  else {
    id v8 = [(NSMutableArray *)self->_lteCellTowers hash];
  }
  unint64_t v21 = (unint64_t)v8;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v9 = 2654435761 * self->_numberOfSurroundingLteCells;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_scdmaCellTowers hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v11 = 2654435761 * self->_numberOfSurroundingScdmaCells;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = (unint64_t)[(NSMutableArray *)self->_nr5GCellTowers hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v13 = 2654435761 * self->_numberOfSurroundingNr5GCells;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v15 = 2654435761 * self->_wifiAltitudeScale;
  }
  else {
    uint64_t v15 = 0;
  }
  return v23 ^ v24 ^ v20 ^ v19 ^ v5 ^ v6 ^ v22 ^ v18 ^ v17 ^ v21 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(ALSMeta *)self->_meta hash];
}

- (void)mergeFrom:(id)a3
{
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  NSUInteger v5 = (void *)*((void *)a3 + 7);
  id v6 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v72 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ALSLocationRequest *)self addCellTower:*(void *)(*((void *)&v71 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v7);
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  unint64_t v10 = (void *)*((void *)a3 + 17);
  id v11 = [v10 countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v68 != v13) {
          objc_enumerationMutation(v10);
        }
        [(ALSLocationRequest *)self addWirelessAP:*(void *)(*((void *)&v67 + 1) + 8 * (void)j)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v67 objects:v80 count:16];
    }
    while (v12);
  }
  char v15 = *((unsigned char *)a3 + 144);
  if ((v15 & 4) != 0)
  {
    self->_numberOfSurroundingCells = *((_DWORD *)a3 + 24);
    *(unsigned char *)&self->_has |= 4u;
    char v15 = *((unsigned char *)a3 + 144);
  }
  if ((v15 & 0x40) != 0)
  {
    self->_numberOfSurroundingWifis = *((_DWORD *)a3 + 28);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)a3 + 4)) {
    -[ALSLocationRequest setAppBundleId:](self, "setAppBundleId:");
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  unint64_t v16 = (void *)*((void *)a3 + 5);
  id v17 = [v16 countByEnumeratingWithState:&v63 objects:v79 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v18; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v64 != v19) {
          objc_enumerationMutation(v16);
        }
        [(ALSLocationRequest *)self addCdmaCellTower:*(void *)(*((void *)&v63 + 1) + 8 * (void)k)];
      }
      id v18 = [v16 countByEnumeratingWithState:&v63 objects:v79 count:16];
    }
    while (v18);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  unint64_t v21 = (void *)*((void *)a3 + 6);
  id v22 = [v21 countByEnumeratingWithState:&v59 objects:v78 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v60;
    do
    {
      for (uint64_t m = 0; m != v23; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v60 != v24) {
          objc_enumerationMutation(v21);
        }
        [(ALSLocationRequest *)self addCdmaEvdoTower:*(void *)(*((void *)&v59 + 1) + 8 * (void)m)];
      }
      id v23 = [v21 countByEnumeratingWithState:&v59 objects:v78 count:16];
    }
    while (v23);
  }
  char v26 = *((unsigned char *)a3 + 144);
  if (v26)
  {
    self->_numberOfSurroundingCdmaCells = *((_DWORD *)a3 + 22);
    *(unsigned char *)&self->_has |= 1u;
    char v26 = *((unsigned char *)a3 + 144);
  }
  if ((v26 & 2) != 0)
  {
    self->_numberOfSurroundingCdmaEvdoCells = *((_DWORD *)a3 + 23);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v27 = (void *)*((void *)a3 + 8);
  id v28 = [v27 countByEnumeratingWithState:&v55 objects:v77 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v56;
    do
    {
      for (uint64_t n = 0; n != v29; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v56 != v30) {
          objc_enumerationMutation(v27);
        }
        [(ALSLocationRequest *)self addLteCellTower:*(void *)(*((void *)&v55 + 1) + 8 * (void)n)];
      }
      id v29 = [v27 countByEnumeratingWithState:&v55 objects:v77 count:16];
    }
    while (v29);
  }
  if ((*((unsigned char *)a3 + 144) & 8) != 0)
  {
    self->_numberOfSurroundingLteCells = *((_DWORD *)a3 + 25);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v32 = (void *)*((void *)a3 + 15);
  id v33 = [v32 countByEnumeratingWithState:&v51 objects:v76 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v52;
    do
    {
      for (iuint64_t i = 0; ii != v34; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(v32);
        }
        [(ALSLocationRequest *)self addScdmaCellTower:*(void *)(*((void *)&v51 + 1) + 8 * (void)ii)];
      }
      id v34 = [v32 countByEnumeratingWithState:&v51 objects:v76 count:16];
    }
    while (v34);
  }
  if ((*((unsigned char *)a3 + 144) & 0x20) != 0)
  {
    self->_numberOfSurroundingScdmaCells = *((_DWORD *)a3 + 27);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v37 = (void *)*((void *)a3 + 10);
  id v38 = [v37 countByEnumeratingWithState:&v47 objects:v75 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v48;
    do
    {
      for (juint64_t j = 0; jj != v39; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v48 != v40) {
          objc_enumerationMutation(v37);
        }
        [(ALSLocationRequest *)self addNr5GCellTower:*(void *)(*((void *)&v47 + 1) + 8 * (void)jj)];
      }
      id v39 = [v37 countByEnumeratingWithState:&v47 objects:v75 count:16];
    }
    while (v39);
  }
  if ((*((unsigned char *)a3 + 144) & 0x10) != 0)
  {
    self->_numberOfSurroundingNr5GCells = *((_DWORD *)a3 + 26);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v42 = (char *)[a3 surroundingWifiBandsCount];
  if (v42)
  {
    id v43 = v42;
    for (kuint64_t k = 0; kk != v43; ++kk)
      -[ALSLocationRequest addSurroundingWifiBands:](self, "addSurroundingWifiBands:", [a3 surroundingWifiBandsAtIndex:kk]);
  }
  if (*((char *)a3 + 144) < 0)
  {
    self->_int wifiAltitudeScale = *((_DWORD *)a3 + 32);
    *(unsigned char *)&self->_has |= 0x80u;
  }
  meta = self->_meta;
  uint64_t v46 = *((void *)a3 + 9);
  if (meta)
  {
    if (v46) {
      -[ALSMeta mergeFrom:](meta, "mergeFrom:");
    }
  }
  else if (v46)
  {
    -[ALSLocationRequest setMeta:](self, "setMeta:");
  }
}

- (NSMutableArray)cellTowers
{
  return self->_cellTowers;
}

- (void)setCellTowers:(id)a3
{
}

- (NSMutableArray)wirelessAPs
{
  return self->_wirelessAPs;
}

- (void)setWirelessAPs:(id)a3
{
}

- (int)numberOfSurroundingCells
{
  return self->_numberOfSurroundingCells;
}

- (int)numberOfSurroundingWifis
{
  return self->_numberOfSurroundingWifis;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSMutableArray)cdmaCellTowers
{
  return self->_cdmaCellTowers;
}

- (void)setCdmaCellTowers:(id)a3
{
}

- (NSMutableArray)cdmaEvdoTowers
{
  return self->_cdmaEvdoTowers;
}

- (void)setCdmaEvdoTowers:(id)a3
{
}

- (int)numberOfSurroundingCdmaCells
{
  return self->_numberOfSurroundingCdmaCells;
}

- (int)numberOfSurroundingCdmaEvdoCells
{
  return self->_numberOfSurroundingCdmaEvdoCells;
}

- (NSMutableArray)lteCellTowers
{
  return self->_lteCellTowers;
}

- (void)setLteCellTowers:(id)a3
{
}

- (int)numberOfSurroundingLteCells
{
  return self->_numberOfSurroundingLteCells;
}

- (NSMutableArray)scdmaCellTowers
{
  return self->_scdmaCellTowers;
}

- (void)setScdmaCellTowers:(id)a3
{
}

- (int)numberOfSurroundingScdmaCells
{
  return self->_numberOfSurroundingScdmaCells;
}

- (NSMutableArray)nr5GCellTowers
{
  return self->_nr5GCellTowers;
}

- (void)setNr5GCellTowers:(id)a3
{
}

- (int)numberOfSurroundingNr5GCells
{
  return self->_numberOfSurroundingNr5GCells;
}

- (ALSMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

@end