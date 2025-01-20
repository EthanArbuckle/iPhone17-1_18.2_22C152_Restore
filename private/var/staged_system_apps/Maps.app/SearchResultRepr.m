@interface SearchResultRepr
+ (Class)obsoleteAddressLineType;
- (BOOL)hasAddressID;
- (BOOL)hasAddressRecordID;
- (BOOL)hasFlags;
- (BOOL)hasFloorOrdinal;
- (BOOL)hasHasIncompleteMetadata;
- (BOOL)hasHasIncompleteNavData;
- (BOOL)hasIncompleteMetadata;
- (BOOL)hasIncompleteNavData;
- (BOOL)hasMapsURL;
- (BOOL)hasObsoleteCid;
- (BOOL)hasObsoleteClosedListing;
- (BOOL)hasObsoleteCountryCode;
- (BOOL)hasObsoleteCountryName;
- (BOOL)hasObsoleteDependentLocality;
- (BOOL)hasObsoleteInexactPosition;
- (BOOL)hasObsoleteLatitudeE6Value;
- (BOOL)hasObsoleteLocality;
- (BOOL)hasObsoleteLongitudeE6Value;
- (BOOL)hasObsoleteName;
- (BOOL)hasObsoletePhone;
- (BOOL)hasObsoletePostalCode;
- (BOOL)hasObsoleteReferenceURL;
- (BOOL)hasObsoleteRegion;
- (BOOL)hasObsoleteThoroughfare;
- (BOOL)hasObsoleteUnverifiedListing;
- (BOOL)hasPlace;
- (BOOL)hasResultIndex;
- (BOOL)hasSyncIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)hasZoomLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)obsoleteClosedListing;
- (BOOL)obsoleteInexactPosition;
- (BOOL)obsoleteUnverifiedListing;
- (BOOL)readFrom:(id)a3;
- (GEOPlace)place;
- (NSMutableArray)obsoleteAddressLines;
- (NSString)mapsURL;
- (NSString)obsoleteCountryCode;
- (NSString)obsoleteCountryName;
- (NSString)obsoleteDependentLocality;
- (NSString)obsoleteLocality;
- (NSString)obsoleteName;
- (NSString)obsoletePhone;
- (NSString)obsoletePostalCode;
- (NSString)obsoleteReferenceURL;
- (NSString)obsoleteRegion;
- (NSString)obsoleteThoroughfare;
- (NSString)syncIdentifier;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)obsoleteAddressLineAtIndex:(unint64_t)a3;
- (id)originalTypeAsString:(unsigned int)a3;
- (id)typeAsString:(unsigned int)a3;
- (int)addressID;
- (int)addressRecordID;
- (int)floorOrdinal;
- (int)obsoleteLatitudeE6Value;
- (int)obsoleteLongitudeE6Value;
- (int)resultIndex;
- (int64_t)obsoleteCid;
- (unint64_t)hash;
- (unint64_t)obsoleteAddressLinesCount;
- (unsigned)StringAsOriginalType:(id)a3;
- (unsigned)StringAsType:(id)a3;
- (unsigned)flags;
- (unsigned)originalType;
- (unsigned)type;
- (unsigned)unusedMapType;
- (unsigned)zoomLevel;
- (void)addObsoleteAddressLine:(id)a3;
- (void)clearObsoleteAddressLines;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddressID:(int)a3;
- (void)setAddressRecordID:(int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFloorOrdinal:(int)a3;
- (void)setHasAddressID:(BOOL)a3;
- (void)setHasAddressRecordID:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasFloorOrdinal:(BOOL)a3;
- (void)setHasHasIncompleteMetadata:(BOOL)a3;
- (void)setHasHasIncompleteNavData:(BOOL)a3;
- (void)setHasIncompleteMetadata:(BOOL)a3;
- (void)setHasIncompleteNavData:(BOOL)a3;
- (void)setHasObsoleteCid:(BOOL)a3;
- (void)setHasObsoleteClosedListing:(BOOL)a3;
- (void)setHasObsoleteInexactPosition:(BOOL)a3;
- (void)setHasObsoleteLatitudeE6Value:(BOOL)a3;
- (void)setHasObsoleteLongitudeE6Value:(BOOL)a3;
- (void)setHasObsoleteUnverifiedListing:(BOOL)a3;
- (void)setHasResultIndex:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasZoomLevel:(BOOL)a3;
- (void)setMapsURL:(id)a3;
- (void)setObsoleteAddressLines:(id)a3;
- (void)setObsoleteCid:(int64_t)a3;
- (void)setObsoleteClosedListing:(BOOL)a3;
- (void)setObsoleteCountryCode:(id)a3;
- (void)setObsoleteCountryName:(id)a3;
- (void)setObsoleteDependentLocality:(id)a3;
- (void)setObsoleteInexactPosition:(BOOL)a3;
- (void)setObsoleteLatitudeE6Value:(int)a3;
- (void)setObsoleteLocality:(id)a3;
- (void)setObsoleteLongitudeE6Value:(int)a3;
- (void)setObsoleteName:(id)a3;
- (void)setObsoletePhone:(id)a3;
- (void)setObsoletePostalCode:(id)a3;
- (void)setObsoleteReferenceURL:(id)a3;
- (void)setObsoleteRegion:(id)a3;
- (void)setObsoleteThoroughfare:(id)a3;
- (void)setObsoleteUnverifiedListing:(BOOL)a3;
- (void)setOriginalType:(unsigned int)a3;
- (void)setPlace:(id)a3;
- (void)setResultIndex:(int)a3;
- (void)setSyncIdentifier:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(unsigned int)a3;
- (void)setUnusedMapType:(unsigned int)a3;
- (void)setZoomLevel:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SearchResultRepr

- (void)setHasFloorOrdinal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_obsoleteThoroughfare, 0);
  objc_storeStrong((id *)&self->_obsoleteRegion, 0);
  objc_storeStrong((id *)&self->_obsoleteReferenceURL, 0);
  objc_storeStrong((id *)&self->_obsoletePostalCode, 0);
  objc_storeStrong((id *)&self->_obsoletePhone, 0);
  objc_storeStrong((id *)&self->_obsoleteName, 0);
  objc_storeStrong((id *)&self->_obsoleteLocality, 0);
  objc_storeStrong((id *)&self->_obsoleteDependentLocality, 0);
  objc_storeStrong((id *)&self->_obsoleteCountryName, 0);
  objc_storeStrong((id *)&self->_obsoleteCountryCode, 0);
  objc_storeStrong((id *)&self->_obsoleteAddressLines, 0);

  objc_storeStrong((id *)&self->_mapsURL, 0);
}

- (void)setZoomLevel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_zoomLevel = a3;
}

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setPlace:(id)a3
{
}

- (void)setHasIncompleteMetadata:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_hasIncompleteMetadata = a3;
}

- (void)setOriginalType:(unsigned int)a3
{
  self->_originalType = a3;
}

- (unsigned)originalType
{
  return self->_originalType;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_flags = a3;
}

- (GEOPlace)place
{
  return self->_place;
}

- (void)setHasIncompleteNavData:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_hasIncompleteNavData = a3;
}

- (id)typeAsString:(unsigned int)a3
{
  if (a3 - 3 > 9) {
    return @"Default";
  }
  else {
    return *(&off_101319FF8 + (int)(a3 - 3));
  }
}

- (unsigned)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DroppedPin"])
  {
    unsigned int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CurrentLocation"])
  {
    unsigned int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RefinementEntry"])
  {
    unsigned int v4 = 5;
  }
  else if ([v3 isEqualToString:@"POI"])
  {
    unsigned int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Section"])
  {
    unsigned int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ParkedCar"])
  {
    unsigned int v4 = 12;
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

- (id)originalTypeAsString:(unsigned int)a3
{
  if (a3 - 3 > 9) {
    return @"Default";
  }
  else {
    return *(&off_101319FF8 + (int)(a3 - 3));
  }
}

- (unsigned)StringAsOriginalType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DroppedPin"])
  {
    unsigned int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CurrentLocation"])
  {
    unsigned int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RefinementEntry"])
  {
    unsigned int v4 = 5;
  }
  else if ([v3 isEqualToString:@"POI"])
  {
    unsigned int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Section"])
  {
    unsigned int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ParkedCar"])
  {
    unsigned int v4 = 12;
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

- (BOOL)hasObsoleteName
{
  return self->_obsoleteName != 0;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFlags
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasObsoleteLocality
{
  return self->_obsoleteLocality != 0;
}

- (BOOL)hasObsoleteRegion
{
  return self->_obsoleteRegion != 0;
}

- (BOOL)hasObsoletePostalCode
{
  return self->_obsoletePostalCode != 0;
}

- (BOOL)hasObsoleteCountryCode
{
  return self->_obsoleteCountryCode != 0;
}

- (BOOL)hasObsoleteCountryName
{
  return self->_obsoleteCountryName != 0;
}

- (BOOL)hasObsoletePhone
{
  return self->_obsoletePhone != 0;
}

- (BOOL)hasObsoleteReferenceURL
{
  return self->_obsoleteReferenceURL != 0;
}

- (BOOL)hasMapsURL
{
  return self->_mapsURL != 0;
}

- (BOOL)hasObsoleteDependentLocality
{
  return self->_obsoleteDependentLocality != 0;
}

- (BOOL)hasObsoleteThoroughfare
{
  return self->_obsoleteThoroughfare != 0;
}

- (void)setObsoleteLatitudeE6Value:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_obsoleteLatitudeE6Value = a3;
}

- (void)setHasObsoleteLatitudeE6Value:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasObsoleteLatitudeE6Value
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setObsoleteLongitudeE6Value:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_obsoleteLongitudeE6Value = a3;
}

- (void)setHasObsoleteLongitudeE6Value:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasObsoleteLongitudeE6Value
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasZoomLevel
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setObsoleteInexactPosition:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_obsoleteInexactPosition = a3;
}

- (void)setHasObsoleteInexactPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasObsoleteInexactPosition
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setObsoleteCid:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_obsoleteCid = a3;
}

- (void)setHasObsoleteCid:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasObsoleteCid
{
  return *(_WORD *)&self->_has & 1;
}

- (void)clearObsoleteAddressLines
{
}

- (void)addObsoleteAddressLine:(id)a3
{
  id v4 = a3;
  obsoleteAddressLines = self->_obsoleteAddressLines;
  id v8 = v4;
  if (!obsoleteAddressLines)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_obsoleteAddressLines;
    self->_obsoleteAddressLines = v6;

    id v4 = v8;
    obsoleteAddressLines = self->_obsoleteAddressLines;
  }
  [(NSMutableArray *)obsoleteAddressLines addObject:v4];
}

- (unint64_t)obsoleteAddressLinesCount
{
  return (unint64_t)[(NSMutableArray *)self->_obsoleteAddressLines count];
}

- (id)obsoleteAddressLineAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_obsoleteAddressLines objectAtIndex:a3];
}

+ (Class)obsoleteAddressLineType
{
  return (Class)objc_opt_class();
}

- (void)setObsoleteUnverifiedListing:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_obsoleteUnverifiedListing = a3;
}

- (void)setHasObsoleteUnverifiedListing:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasObsoleteUnverifiedListing
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setObsoleteClosedListing:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_obsoleteClosedListing = a3;
}

- (void)setHasObsoleteClosedListing:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasObsoleteClosedListing
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (void)setHasHasIncompleteMetadata:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasHasIncompleteMetadata
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasHasIncompleteNavData:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasHasIncompleteNavData
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setResultIndex:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_resultIndex = a3;
}

- (void)setHasResultIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasResultIndex
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setFloorOrdinal:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_floorOrdinal = a3;
}

- (BOOL)hasFloorOrdinal
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAddressRecordID:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_addressRecordID = a3;
}

- (void)setHasAddressRecordID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAddressRecordID
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAddressID:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_addressID = a3;
}

- (void)setHasAddressID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAddressID
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SearchResultRepr;
  __int16 v3 = [(SearchResultRepr *)&v7 description];
  id v4 = [(SearchResultRepr *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithUnsignedInt:self->_unusedMapType];
  [v3 setObject:v4 forKey:@"unusedMapType"];

  unsigned int v5 = self->_type - 3;
  if (v5 > 9) {
    CFStringRef v6 = @"Default";
  }
  else {
    CFStringRef v6 = *(&off_101319FF8 + (int)v5);
  }
  [v3 setObject:v6 forKey:@"type"];
  unsigned int v7 = self->_originalType - 3;
  if (v7 > 9) {
    CFStringRef v8 = @"Default";
  }
  else {
    CFStringRef v8 = *(&off_101319FF8 + (int)v7);
  }
  [v3 setObject:v8 forKey:@"originalType"];
  obsoleteName = self->_obsoleteName;
  if (obsoleteName) {
    [v3 setObject:obsoleteName forKey:@"obsoleteName"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v10 = +[NSNumber numberWithUnsignedInt:self->_flags];
    [v3 setObject:v10 forKey:@"flags"];
  }
  obsoleteLocality = self->_obsoleteLocality;
  if (obsoleteLocality) {
    [v3 setObject:obsoleteLocality forKey:@"obsoleteLocality"];
  }
  obsoleteRegion = self->_obsoleteRegion;
  if (obsoleteRegion) {
    [v3 setObject:obsoleteRegion forKey:@"obsoleteRegion"];
  }
  obsoletePostalCode = self->_obsoletePostalCode;
  if (obsoletePostalCode) {
    [v3 setObject:obsoletePostalCode forKey:@"obsoletePostalCode"];
  }
  obsoleteCountryCode = self->_obsoleteCountryCode;
  if (obsoleteCountryCode) {
    [v3 setObject:obsoleteCountryCode forKey:@"obsoleteCountryCode"];
  }
  obsoleteCountryName = self->_obsoleteCountryName;
  if (obsoleteCountryName) {
    [v3 setObject:obsoleteCountryName forKey:@"obsoleteCountryName"];
  }
  obsoletePhone = self->_obsoletePhone;
  if (obsoletePhone) {
    [v3 setObject:obsoletePhone forKey:@"obsoletePhone"];
  }
  obsoleteReferenceURL = self->_obsoleteReferenceURL;
  if (obsoleteReferenceURL) {
    [v3 setObject:obsoleteReferenceURL forKey:@"obsoleteReferenceURL"];
  }
  mapsURL = self->_mapsURL;
  if (mapsURL) {
    [v3 setObject:mapsURL forKey:@"mapsURL"];
  }
  obsoleteDependentLocality = self->_obsoleteDependentLocality;
  if (obsoleteDependentLocality) {
    [v3 setObject:obsoleteDependentLocality forKey:@"obsoleteDependentLocality"];
  }
  obsoleteThoroughfare = self->_obsoleteThoroughfare;
  if (obsoleteThoroughfare) {
    [v3 setObject:obsoleteThoroughfare forKey:@"obsoleteThoroughfare"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v36 = +[NSNumber numberWithInt:self->_obsoleteLatitudeE6Value];
    [v3 setObject:v36 forKey:@"obsoleteLatitudeE6Value"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_33:
      if ((has & 0x200) == 0) {
        goto LABEL_34;
      }
      goto LABEL_59;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_33;
  }
  v37 = +[NSNumber numberWithInt:self->_obsoleteLongitudeE6Value];
  [v3 setObject:v37 forKey:@"obsoleteLongitudeE6Value"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_34:
    if ((has & 0x2000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_60;
  }
LABEL_59:
  v38 = +[NSNumber numberWithUnsignedInt:self->_zoomLevel];
  [v3 setObject:v38 forKey:@"zoomLevel"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_35:
    if ((has & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_60:
  v39 = +[NSNumber numberWithBool:self->_obsoleteInexactPosition];
  [v3 setObject:v39 forKey:@"obsoleteInexactPosition"];

  if (*(_WORD *)&self->_has)
  {
LABEL_36:
    v22 = +[NSNumber numberWithLongLong:self->_obsoleteCid];
    [v3 setObject:v22 forKey:@"obsoleteCid"];
  }
LABEL_37:
  obsoleteAddressLines = self->_obsoleteAddressLines;
  if (obsoleteAddressLines) {
    [v3 setObject:obsoleteAddressLines forKey:@"obsoleteAddressLine"];
  }
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x4000) != 0)
  {
    v25 = +[NSNumber numberWithBool:self->_obsoleteUnverifiedListing];
    [v3 setObject:v25 forKey:@"obsoleteUnverifiedListing"];

    __int16 v24 = (__int16)self->_has;
  }
  if ((v24 & 0x1000) != 0)
  {
    v26 = +[NSNumber numberWithBool:self->_obsoleteClosedListing];
    [v3 setObject:v26 forKey:@"obsoleteClosedListing"];
  }
  place = self->_place;
  if (place)
  {
    v28 = [(GEOPlace *)place dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"place"];
  }
  __int16 v29 = (__int16)self->_has;
  if ((v29 & 0x400) != 0)
  {
    v40 = +[NSNumber numberWithBool:self->_hasIncompleteMetadata];
    [v3 setObject:v40 forKey:@"hasIncompleteMetadata"];

    __int16 v29 = (__int16)self->_has;
    if ((v29 & 0x800) == 0)
    {
LABEL_47:
      if ((v29 & 2) == 0) {
        goto LABEL_48;
      }
      goto LABEL_64;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_47;
  }
  v41 = +[NSNumber numberWithBool:self->_hasIncompleteNavData];
  [v3 setObject:v41 forKey:@"hasIncompleteNavData"];

  __int16 v29 = (__int16)self->_has;
  if ((v29 & 2) == 0)
  {
LABEL_48:
    if ((v29 & 0x100) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_64:
  v42 = +[NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v42 forKey:@"timestamp"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_49:
    v30 = +[NSNumber numberWithInt:self->_resultIndex];
    [v3 setObject:v30 forKey:@"resultIndex"];
  }
LABEL_50:
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier) {
    [v3 setObject:syncIdentifier forKey:@"syncIdentifier"];
  }
  __int16 v32 = (__int16)self->_has;
  if ((v32 & 0x20) == 0)
  {
    if ((v32 & 8) == 0) {
      goto LABEL_54;
    }
LABEL_67:
    v44 = +[NSNumber numberWithInt:self->_addressRecordID];
    [v3 setObject:v44 forKey:@"addressRecordID"];

    if ((*(_WORD *)&self->_has & 4) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  v43 = +[NSNumber numberWithInt:self->_floorOrdinal];
  [v3 setObject:v43 forKey:@"floorOrdinal"];

  __int16 v32 = (__int16)self->_has;
  if ((v32 & 8) != 0) {
    goto LABEL_67;
  }
LABEL_54:
  if ((v32 & 4) != 0)
  {
LABEL_55:
    v33 = +[NSNumber numberWithInt:self->_addressID];
    [v3 setObject:v33 forKey:@"addressID"];
  }
LABEL_56:
  id v34 = v3;

  return v34;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    unsigned int v5 = &OBJC_IVAR___VehicleDetailViewController__strongSelf;
    CFStringRef v6 = &OBJC_IVAR___VehicleDetailViewController__strongSelf;
    unsigned int v7 = &OBJC_IVAR___VehicleDetailViewController__strongSelf;
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        unint64_t v12 = v11 + 1;
        if (v11 == -1 || v12 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v11);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v12;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
      int v15 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          while (1)
          {
            uint64_t v21 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v22 = v21 + 1;
            if (v21 == -1 || v22 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_161;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_163;
            }
          }
          *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_161:
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_163:
          uint64_t v118 = 188;
          goto LABEL_225;
        case 2u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v20 = 0;
          while (2)
          {
            uint64_t v32 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v32);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v33;
              v20 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                BOOL v14 = v31++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_167;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_167:
          uint64_t v118 = 184;
          goto LABEL_225;
        case 3u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v20 = 0;
          while (2)
          {
            uint64_t v37 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v37);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v38;
              v20 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                BOOL v14 = v36++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_171;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_171:
          uint64_t v118 = 152;
          goto LABEL_225;
        case 4u:
        case 7u:
        case 0xFu:
        case 0x10u:
        case 0x14u:
        case 0x1Au:
        case 0x1Cu:
        case 0x20u:
        case 0x21u:
        case 0x24u:
        case 0x25u:
        case 0x26u:
          goto LABEL_35;
        case 5u:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 104;
          goto LABEL_145;
        case 6u:
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x10u;
          unint64_t v42 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v42 <= 0xFFFFFFFFFFFFFFFBLL
            && (unint64_t v43 = v42 + 4, v42 + 4 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)))
          {
            unsigned int v44 = *(_DWORD *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v43;
          }
          else
          {
            unsigned int v44 = 0;
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          self->_flags = v44;
          goto LABEL_226;
        case 8u:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 88;
          goto LABEL_145;
        case 9u:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 136;
          goto LABEL_145;
        case 0xAu:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 120;
          goto LABEL_145;
        case 0xBu:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 56;
          goto LABEL_145;
        case 0xCu:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 64;
          goto LABEL_145;
        case 0xDu:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 112;
          goto LABEL_145;
        case 0xEu:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 128;
          goto LABEL_145;
        case 0x11u:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 40;
          goto LABEL_145;
        case 0x12u:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 72;
          goto LABEL_145;
        case 0x13u:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 144;
          goto LABEL_145;
        case 0x15u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x40u;
          while (2)
          {
            uint64_t v47 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v47);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v48;
              v20 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                BOOL v14 = v46++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_175;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_175:
          uint64_t v118 = 80;
          goto LABEL_225;
        case 0x16u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x80u;
          while (2)
          {
            uint64_t v52 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v52);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v53;
              v20 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                BOOL v14 = v51++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_179;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_179:
          uint64_t v118 = 96;
          goto LABEL_225;
        case 0x17u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x200u;
          while (2)
          {
            uint64_t v57 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v58 = v57 + 1;
            if (v57 == -1 || v58 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v57);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v58;
              v20 |= (unint64_t)(v59 & 0x7F) << v55;
              if (v59 < 0)
              {
                v55 += 7;
                BOOL v14 = v56++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_183;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_183:
          uint64_t v118 = 192;
          goto LABEL_225;
        case 0x18u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v62 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x2000u;
          while (2)
          {
            uint64_t v63 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v64 = v63 + 1;
            if (v63 == -1 || v64 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v63);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v64;
              v62 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                BOOL v14 = v61++ >= 9;
                if (v14)
                {
                  uint64_t v62 = 0;
                  goto LABEL_187;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_187:
          BOOL v119 = v62 != 0;
          uint64_t v120 = 199;
          goto LABEL_208;
        case 0x19u:
          char v66 = 0;
          unsigned int v67 = 0;
          int64_t v68 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 1u;
          while (2)
          {
            uint64_t v69 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v69);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v70;
              v68 |= (unint64_t)(v71 & 0x7F) << v66;
              if (v71 < 0)
              {
                v66 += 7;
                BOOL v14 = v67++ >= 9;
                if (v14)
                {
                  int64_t v68 = 0;
                  goto LABEL_191;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            int64_t v68 = 0;
          }
LABEL_191:
          self->_obsoleteCid = v68;
          goto LABEL_226;
        case 0x1Bu:
          v72 = v5;
          v73 = v7;
          v74 = v6;
          PBReaderReadString();
          id v75 = (id)objc_claimAutoreleasedReturnValue();
          if (v75) {
            [(SearchResultRepr *)self addObsoleteAddressLine:v75];
          }
          goto LABEL_119;
        case 0x1Du:
          char v76 = 0;
          unsigned int v77 = 0;
          uint64_t v78 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x4000u;
          while (2)
          {
            uint64_t v79 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v80 = v79 + 1;
            if (v79 == -1 || v80 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v81 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v79);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v80;
              v78 |= (unint64_t)(v81 & 0x7F) << v76;
              if (v81 < 0)
              {
                v76 += 7;
                BOOL v14 = v77++ >= 9;
                if (v14)
                {
                  uint64_t v78 = 0;
                  goto LABEL_195;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v78 = 0;
          }
LABEL_195:
          BOOL v119 = v78 != 0;
          uint64_t v120 = 200;
          goto LABEL_208;
        case 0x1Eu:
          char v82 = 0;
          unsigned int v83 = 0;
          uint64_t v84 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x1000u;
          while (2)
          {
            uint64_t v85 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v86 = v85 + 1;
            if (v85 == -1 || v86 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v87 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v85);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v86;
              v84 |= (unint64_t)(v87 & 0x7F) << v82;
              if (v87 < 0)
              {
                v82 += 7;
                BOOL v14 = v83++ >= 9;
                if (v14)
                {
                  uint64_t v84 = 0;
                  goto LABEL_199;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v84 = 0;
          }
LABEL_199:
          BOOL v119 = v84 != 0;
          uint64_t v120 = 198;
          goto LABEL_208;
        case 0x1Fu:
          v72 = v5;
          v73 = v7;
          v74 = v6;
          id v75 = objc_alloc_init((Class)GEOPlace);
          objc_storeStrong((id *)&self->_place, v75);
          if (!PBReaderPlaceMark()
            || (objc_msgSend(v75, "readFrom:", a3, 0, 0) & 1) == 0)
          {

            LOBYTE(v29) = 0;
            return v29;
          }
          PBReaderRecallMark();
LABEL_119:

          CFStringRef v6 = v74;
          unsigned int v7 = v73;
          unsigned int v5 = v72;
          goto LABEL_226;
        case 0x22u:
          char v88 = 0;
          unsigned int v89 = 0;
          uint64_t v90 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x400u;
          while (2)
          {
            uint64_t v91 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v92 = v91 + 1;
            if (v91 == -1 || v92 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v93 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v91);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v92;
              v90 |= (unint64_t)(v93 & 0x7F) << v88;
              if (v93 < 0)
              {
                v88 += 7;
                BOOL v14 = v89++ >= 9;
                if (v14)
                {
                  uint64_t v90 = 0;
                  goto LABEL_203;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v90 = 0;
          }
LABEL_203:
          BOOL v119 = v90 != 0;
          uint64_t v120 = 196;
          goto LABEL_208;
        case 0x23u:
          char v94 = 0;
          unsigned int v95 = 0;
          uint64_t v96 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x800u;
          while (2)
          {
            uint64_t v97 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v98 = v97 + 1;
            if (v97 == -1 || v98 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v99 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v97);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v98;
              v96 |= (unint64_t)(v99 & 0x7F) << v94;
              if (v99 < 0)
              {
                v94 += 7;
                BOOL v14 = v95++ >= 9;
                if (v14)
                {
                  uint64_t v96 = 0;
                  goto LABEL_207;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v96 = 0;
          }
LABEL_207:
          BOOL v119 = v96 != 0;
          uint64_t v120 = 197;
LABEL_208:
          self->PBCodable_opaque[v120] = v119;
          goto LABEL_226;
        case 0x27u:
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 2u;
          unint64_t v100 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v100 <= 0xFFFFFFFFFFFFFFF7 && v100 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            double v101 = *(double *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v100);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v100 + 8;
          }
          else
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            double v101 = 0.0;
          }
          self->_timestamp = v101;
          goto LABEL_226;
        case 0x28u:
          char v102 = 0;
          unsigned int v103 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x100u;
          while (2)
          {
            uint64_t v104 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v105 = v104 + 1;
            if (v104 == -1 || v105 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v106 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v104);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v105;
              v20 |= (unint64_t)(v106 & 0x7F) << v102;
              if (v106 < 0)
              {
                v102 += 7;
                BOOL v14 = v103++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_212;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_212:
          uint64_t v118 = 168;
          goto LABEL_225;
        case 0x29u:
          uint64_t v40 = PBReaderReadString();
          uint64_t v41 = 176;
LABEL_145:
          v107 = *(void **)&self->PBCodable_opaque[v41];
          *(void *)&self->PBCodable_opaque[v41] = v40;

          goto LABEL_226;
        case 0x2Au:
          char v108 = 0;
          unsigned int v109 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 0x20u;
          while (2)
          {
            uint64_t v110 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v111 = v110 + 1;
            if (v110 == -1 || v111 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v112 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v110);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v111;
              v20 |= (unint64_t)(v112 & 0x7F) << v108;
              if (v112 < 0)
              {
                v108 += 7;
                BOOL v14 = v109++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_216;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_216:
          uint64_t v118 = 36;
          goto LABEL_225;
        default:
          if (v17 == 101)
          {
            char v113 = 0;
            unsigned int v114 = 0;
            uint64_t v20 = 0;
            *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 8u;
            while (1)
            {
              uint64_t v115 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
              unint64_t v116 = v115 + 1;
              if (v115 == -1 || v116 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
                break;
              }
              char v117 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v115);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v116;
              v20 |= (unint64_t)(v117 & 0x7F) << v113;
              if ((v117 & 0x80) == 0) {
                goto LABEL_222;
              }
              v113 += 7;
              BOOL v14 = v114++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_224;
              }
            }
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_222:
            if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
              LODWORD(v20) = 0;
            }
LABEL_224:
            uint64_t v118 = v6[858];
            goto LABEL_225;
          }
          if (v17 == 102)
          {
            char v24 = 0;
            unsigned int v25 = 0;
            uint64_t v20 = 0;
            *(_WORD *)&self->PBCodable_opaque[v5[831]] |= 4u;
            while (1)
            {
              uint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
              unint64_t v27 = v26 + 1;
              if (v26 == -1 || v27 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
                break;
              }
              char v28 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v27;
              v20 |= (unint64_t)(v28 & 0x7F) << v24;
              if ((v28 & 0x80) == 0) {
                goto LABEL_218;
              }
              v24 += 7;
              BOOL v14 = v25++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_220;
              }
            }
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_218:
            if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
              LODWORD(v20) = 0;
            }
LABEL_220:
            uint64_t v118 = v7[859];
LABEL_225:
            *(_DWORD *)&self->PBCodable_opaque[v118] = v20;
            goto LABEL_226;
          }
LABEL_35:
          int v29 = PBReaderSkipValueWithTag();
          if (!v29) {
            return v29;
          }
LABEL_226:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_232;
          break;
      }
    }
  }
LABEL_232:
  LOBYTE(v29) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v29;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_obsoleteName) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteFixed32Field();
  }
  if (self->_obsoleteLocality) {
    PBDataWriterWriteStringField();
  }
  if (self->_obsoleteRegion) {
    PBDataWriterWriteStringField();
  }
  if (self->_obsoletePostalCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_obsoleteCountryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_obsoleteCountryName) {
    PBDataWriterWriteStringField();
  }
  if (self->_obsoletePhone) {
    PBDataWriterWriteStringField();
  }
  if (self->_obsoleteReferenceURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_mapsURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_obsoleteDependentLocality) {
    PBDataWriterWriteStringField();
  }
  if (self->_obsoleteThoroughfare) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_27:
      if ((has & 0x200) == 0) {
        goto LABEL_28;
      }
      goto LABEL_58;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_28:
    if ((has & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_29:
    if ((has & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  if (*(_WORD *)&self->_has) {
LABEL_30:
  }
    PBDataWriterWriteInt64Field();
LABEL_31:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CFStringRef v6 = self->_obsoleteAddressLines;
  unsigned int v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    char v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      char v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x1000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_place) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x800) == 0)
    {
LABEL_46:
      if ((v12 & 2) == 0) {
        goto LABEL_47;
      }
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_46;
  }
  PBDataWriterWriteBOOLField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 2) == 0)
  {
LABEL_47:
    if ((v12 & 0x100) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_63:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_48:
  }
    PBDataWriterWriteInt32Field();
LABEL_49:
  if (self->_syncIdentifier) {
    PBDataWriterWriteStringField();
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
    if ((v13 & 8) == 0) {
      goto LABEL_53;
    }
LABEL_66:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 4) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  PBDataWriterWriteInt32Field();
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 8) != 0) {
    goto LABEL_66;
  }
LABEL_53:
  if ((v13 & 4) != 0) {
LABEL_54:
  }
    PBDataWriterWriteInt32Field();
LABEL_55:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[47] = self->_unusedMapType;
  v4[46] = self->_type;
  v4[38] = self->_originalType;
  long long v14 = v4;
  if (self->_obsoleteName)
  {
    [v4 setObsoleteName:];
    id v4 = v14;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v4[8] = self->_flags;
    *((_WORD *)v4 + 102) |= 0x10u;
  }
  if (self->_obsoleteLocality)
  {
    [v14 setObsoleteLocality:];
    id v4 = v14;
  }
  if (self->_obsoleteRegion)
  {
    [v14 setObsoleteRegion:];
    id v4 = v14;
  }
  if (self->_obsoletePostalCode)
  {
    [v14 setObsoletePostalCode];
    id v4 = v14;
  }
  if (self->_obsoleteCountryCode)
  {
    [v14 setObsoleteCountryCode:];
    id v4 = v14;
  }
  if (self->_obsoleteCountryName)
  {
    [v14 setObsoleteCountryName:];
    id v4 = v14;
  }
  if (self->_obsoletePhone)
  {
    [v14 setObsoletePhone];
    id v4 = v14;
  }
  if (self->_obsoleteReferenceURL)
  {
    [v14 setObsoleteReferenceURL:];
    id v4 = v14;
  }
  if (self->_mapsURL)
  {
    [v14 setMapsURL:];
    id v4 = v14;
  }
  if (self->_obsoleteDependentLocality)
  {
    [v14 setObsoleteDependentLocality:];
    id v4 = v14;
  }
  if (self->_obsoleteThoroughfare)
  {
    [v14 setObsoleteThoroughfare];
    id v4 = v14;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[20] = self->_obsoleteLatitudeE6Value;
    *((_WORD *)v4 + 102) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_27:
      if ((has & 0x200) == 0) {
        goto LABEL_28;
      }
      goto LABEL_57;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_27;
  }
  v4[24] = self->_obsoleteLongitudeE6Value;
  *((_WORD *)v4 + 102) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_28:
    if ((has & 0x2000) == 0) {
      goto LABEL_29;
    }
LABEL_58:
    *((unsigned char *)v4 + 199) = self->_obsoleteInexactPosition;
    *((_WORD *)v4 + 102) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_57:
  v4[48] = self->_zoomLevel;
  *((_WORD *)v4 + 102) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0) {
    goto LABEL_58;
  }
LABEL_29:
  if (has)
  {
LABEL_30:
    *((void *)v4 + 1) = self->_obsoleteCid;
    *((_WORD *)v4 + 102) |= 1u;
  }
LABEL_31:
  if ([(SearchResultRepr *)self obsoleteAddressLinesCount])
  {
    [v14 clearObsoleteAddressLines];
    unint64_t v6 = [(SearchResultRepr *)self obsoleteAddressLinesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(SearchResultRepr *)self obsoleteAddressLineAtIndex:i];
        [v14 addObsoleteAddressLine:v9];
      }
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = v14;
  if ((v10 & 0x4000) != 0)
  {
    *((unsigned char *)v14 + 200) = self->_obsoleteUnverifiedListing;
    *((_WORD *)v14 + 102) |= 0x4000u;
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x1000) != 0)
  {
    *((unsigned char *)v14 + 198) = self->_obsoleteClosedListing;
    *((_WORD *)v14 + 102) |= 0x1000u;
  }
  if (self->_place)
  {
    [v14 setPlace:];
    __int16 v11 = v14;
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x400) != 0)
  {
    v11[196] = self->_hasIncompleteMetadata;
    *((_WORD *)v11 + 102) |= 0x400u;
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x800) == 0)
    {
LABEL_43:
      if ((v12 & 2) == 0) {
        goto LABEL_44;
      }
      goto LABEL_62;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_43;
  }
  v11[197] = self->_hasIncompleteNavData;
  *((_WORD *)v11 + 102) |= 0x800u;
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 2) == 0)
  {
LABEL_44:
    if ((v12 & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_62:
  *((void *)v11 + 2) = *(void *)&self->_timestamp;
  *((_WORD *)v11 + 102) |= 2u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_45:
    *((_DWORD *)v11 + 42) = self->_resultIndex;
    *((_WORD *)v11 + 102) |= 0x100u;
  }
LABEL_46:
  if (self->_syncIdentifier)
  {
    [v14 setSyncIdentifier:];
    __int16 v11 = v14;
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) != 0)
  {
    *((_DWORD *)v11 + 9) = self->_floorOrdinal;
    *((_WORD *)v11 + 102) |= 0x20u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 8) == 0)
    {
LABEL_50:
      if ((v13 & 4) == 0) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
  }
  else if ((v13 & 8) == 0)
  {
    goto LABEL_50;
  }
  *((_DWORD *)v11 + 7) = self->_addressRecordID;
  *((_WORD *)v11 + 102) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_51:
    *((_DWORD *)v11 + 6) = self->_addressID;
    *((_WORD *)v11 + 102) |= 4u;
  }
LABEL_52:
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v5 = [[objc_opt_class() allocWithZone:a3] init];
  v5[47] = self->_unusedMapType;
  v5[46] = self->_type;
  v5[38] = self->_originalType;
  id v6 = [(NSString *)self->_obsoleteName copyWithZone:a3];
  unint64_t v7 = (void *)*((void *)v5 + 13);
  *((void *)v5 + 13) = v6;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v5[8] = self->_flags;
    *((_WORD *)v5 + 102) |= 0x10u;
  }
  id v8 = [(NSString *)self->_obsoleteLocality copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v5 + 11);
  *((void *)v5 + 11) = v8;

  id v10 = [(NSString *)self->_obsoleteRegion copyWithZone:a3];
  __int16 v11 = (void *)*((void *)v5 + 17);
  *((void *)v5 + 17) = v10;

  id v12 = [(NSString *)self->_obsoletePostalCode copyWithZone:a3];
  __int16 v13 = (void *)*((void *)v5 + 15);
  *((void *)v5 + 15) = v12;

  id v14 = [(NSString *)self->_obsoleteCountryCode copyWithZone:a3];
  long long v15 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v14;

  id v16 = [(NSString *)self->_obsoleteCountryName copyWithZone:a3];
  long long v17 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v16;

  id v18 = [(NSString *)self->_obsoletePhone copyWithZone:a3];
  unsigned int v19 = (void *)*((void *)v5 + 14);
  *((void *)v5 + 14) = v18;

  id v20 = [(NSString *)self->_obsoleteReferenceURL copyWithZone:a3];
  uint64_t v21 = (void *)*((void *)v5 + 16);
  *((void *)v5 + 16) = v20;

  id v22 = [(NSString *)self->_mapsURL copyWithZone:a3];
  char v23 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v22;

  id v24 = [(NSString *)self->_obsoleteDependentLocality copyWithZone:a3];
  unsigned int v25 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v24;

  id v26 = [(NSString *)self->_obsoleteThoroughfare copyWithZone:a3];
  unint64_t v27 = (void *)*((void *)v5 + 18);
  *((void *)v5 + 18) = v26;

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v5[20] = self->_obsoleteLatitudeE6Value;
    *((_WORD *)v5 + 102) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_32;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  v5[24] = self->_obsoleteLongitudeE6Value;
  *((_WORD *)v5 + 102) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  v5[48] = self->_zoomLevel;
  *((_WORD *)v5 + 102) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_33:
  *((unsigned char *)v5 + 199) = self->_obsoleteInexactPosition;
  *((_WORD *)v5 + 102) |= 0x2000u;
  if (*(_WORD *)&self->_has)
  {
LABEL_8:
    *((void *)v5 + 1) = self->_obsoleteCid;
    *((_WORD *)v5 + 102) |= 1u;
  }
LABEL_9:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  int v29 = self->_obsoleteAddressLines;
  id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v31; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = [*(id *)(*((void *)&v43 + 1) + 8 * i) copyWithZone:a3];
        [v5 addObsoleteAddressLine:v34];
      }
      id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v31);
  }

  __int16 v35 = (__int16)self->_has;
  if ((v35 & 0x4000) != 0)
  {
    *((unsigned char *)v5 + 200) = self->_obsoleteUnverifiedListing;
    *((_WORD *)v5 + 102) |= 0x4000u;
    __int16 v35 = (__int16)self->_has;
  }
  if ((v35 & 0x1000) != 0)
  {
    *((unsigned char *)v5 + 198) = self->_obsoleteClosedListing;
    *((_WORD *)v5 + 102) |= 0x1000u;
  }
  id v36 = -[GEOPlace copyWithZone:](self->_place, "copyWithZone:", a3, (void)v43);
  uint64_t v37 = (void *)*((void *)v5 + 20);
  *((void *)v5 + 20) = v36;

  __int16 v38 = (__int16)self->_has;
  if ((v38 & 0x400) != 0)
  {
    *((unsigned char *)v5 + 196) = self->_hasIncompleteMetadata;
    *((_WORD *)v5 + 102) |= 0x400u;
    __int16 v38 = (__int16)self->_has;
    if ((v38 & 0x800) == 0)
    {
LABEL_22:
      if ((v38 & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_22;
  }
  *((unsigned char *)v5 + 197) = self->_hasIncompleteNavData;
  *((_WORD *)v5 + 102) |= 0x800u;
  __int16 v38 = (__int16)self->_has;
  if ((v38 & 2) == 0)
  {
LABEL_23:
    if ((v38 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_37:
  *((void *)v5 + 2) = *(void *)&self->_timestamp;
  *((_WORD *)v5 + 102) |= 2u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_24:
    v5[42] = self->_resultIndex;
    *((_WORD *)v5 + 102) |= 0x100u;
  }
LABEL_25:
  id v39 = [(NSString *)self->_syncIdentifier copyWithZone:a3];
  uint64_t v40 = (void *)*((void *)v5 + 22);
  *((void *)v5 + 22) = v39;

  __int16 v41 = (__int16)self->_has;
  if ((v41 & 0x20) == 0)
  {
    if ((v41 & 8) == 0) {
      goto LABEL_27;
    }
LABEL_40:
    v5[7] = self->_addressRecordID;
    *((_WORD *)v5 + 102) |= 8u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return v5;
    }
    goto LABEL_28;
  }
  v5[9] = self->_floorOrdinal;
  *((_WORD *)v5 + 102) |= 0x20u;
  __int16 v41 = (__int16)self->_has;
  if ((v41 & 8) != 0) {
    goto LABEL_40;
  }
LABEL_27:
  if ((v41 & 4) != 0)
  {
LABEL_28:
    v5[6] = self->_addressID;
    *((_WORD *)v5 + 102) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_126;
  }
  if (self->_unusedMapType != *((_DWORD *)v4 + 47)) {
    goto LABEL_126;
  }
  if (self->_type != *((_DWORD *)v4 + 46)) {
    goto LABEL_126;
  }
  if (self->_originalType != *((_DWORD *)v4 + 38)) {
    goto LABEL_126;
  }
  obsoleteName = self->_obsoleteName;
  if ((unint64_t)obsoleteName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](obsoleteName, "isEqual:")) {
      goto LABEL_126;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_flags != *((_DWORD *)v4 + 8)) {
      goto LABEL_126;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_126;
  }
  obsoleteLocality = self->_obsoleteLocality;
  if ((unint64_t)obsoleteLocality | *((void *)v4 + 11)
    && !-[NSString isEqual:](obsoleteLocality, "isEqual:"))
  {
    goto LABEL_126;
  }
  obsoleteRegion = self->_obsoleteRegion;
  if ((unint64_t)obsoleteRegion | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](obsoleteRegion, "isEqual:")) {
      goto LABEL_126;
    }
  }
  obsoletePostalCode = self->_obsoletePostalCode;
  if ((unint64_t)obsoletePostalCode | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](obsoletePostalCode, "isEqual:")) {
      goto LABEL_126;
    }
  }
  obsoleteCountryCode = self->_obsoleteCountryCode;
  if ((unint64_t)obsoleteCountryCode | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](obsoleteCountryCode, "isEqual:")) {
      goto LABEL_126;
    }
  }
  obsoleteCountryName = self->_obsoleteCountryName;
  if ((unint64_t)obsoleteCountryName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](obsoleteCountryName, "isEqual:")) {
      goto LABEL_126;
    }
  }
  obsoletePhone = self->_obsoletePhone;
  if ((unint64_t)obsoletePhone | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](obsoletePhone, "isEqual:")) {
      goto LABEL_126;
    }
  }
  obsoleteReferenceURL = self->_obsoleteReferenceURL;
  if ((unint64_t)obsoleteReferenceURL | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](obsoleteReferenceURL, "isEqual:")) {
      goto LABEL_126;
    }
  }
  mapsURL = self->_mapsURL;
  if ((unint64_t)mapsURL | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](mapsURL, "isEqual:")) {
      goto LABEL_126;
    }
  }
  obsoleteDependentLocality = self->_obsoleteDependentLocality;
  if ((unint64_t)obsoleteDependentLocality | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](obsoleteDependentLocality, "isEqual:")) {
      goto LABEL_126;
    }
  }
  obsoleteThoroughfare = self->_obsoleteThoroughfare;
  if ((unint64_t)obsoleteThoroughfare | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](obsoleteThoroughfare, "isEqual:")) {
      goto LABEL_126;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v18 = *((_WORD *)v4 + 102);
  if ((has & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0 || self->_obsoleteLatitudeE6Value != *((_DWORD *)v4 + 20)) {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_obsoleteLongitudeE6Value != *((_DWORD *)v4 + 24)) {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) == 0 || self->_zoomLevel != *((_DWORD *)v4 + 48)) {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x2000) == 0) {
      goto LABEL_126;
    }
    if (self->_obsoleteInexactPosition)
    {
      if (!*((unsigned char *)v4 + 199)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 199))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x2000) != 0)
  {
    goto LABEL_126;
  }
  if (has)
  {
    if ((v18 & 1) == 0 || self->_obsoleteCid != *((void *)v4 + 1)) {
      goto LABEL_126;
    }
  }
  else if (v18)
  {
    goto LABEL_126;
  }
  obsoleteAddressLines = self->_obsoleteAddressLines;
  if ((unint64_t)obsoleteAddressLines | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](obsoleteAddressLines, "isEqual:")) {
      goto LABEL_126;
    }
    __int16 has = (__int16)self->_has;
    __int16 v18 = *((_WORD *)v4 + 102);
  }
  if ((has & 0x4000) != 0)
  {
    if ((v18 & 0x4000) == 0) {
      goto LABEL_126;
    }
    if (self->_obsoleteUnverifiedListing)
    {
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 200))
    {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x4000) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v18 & 0x1000) == 0) {
      goto LABEL_126;
    }
    if (self->_obsoleteClosedListing)
    {
      if (!*((unsigned char *)v4 + 198)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 198))
    {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x1000) != 0)
  {
    goto LABEL_126;
  }
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 20))
  {
    if (!-[GEOPlace isEqual:](place, "isEqual:")) {
      goto LABEL_126;
    }
    __int16 has = (__int16)self->_has;
    __int16 v18 = *((_WORD *)v4 + 102);
  }
  if ((has & 0x400) != 0)
  {
    if ((v18 & 0x400) == 0) {
      goto LABEL_126;
    }
    if (self->_hasIncompleteMetadata)
    {
      if (!*((unsigned char *)v4 + 196)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 196))
    {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x400) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x800) != 0)
  {
    if ((v18 & 0x800) == 0) {
      goto LABEL_126;
    }
    if (self->_hasIncompleteNavData)
    {
      if (!*((unsigned char *)v4 + 197)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 197))
    {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x800) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_126;
    }
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x100) != 0)
  {
    if ((v18 & 0x100) == 0 || self->_resultIndex != *((_DWORD *)v4 + 42)) {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x100) != 0)
  {
    goto LABEL_126;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((void *)v4 + 22))
  {
    if (-[NSString isEqual:](syncIdentifier, "isEqual:"))
    {
      __int16 has = (__int16)self->_has;
      __int16 v18 = *((_WORD *)v4 + 102);
      goto LABEL_111;
    }
LABEL_126:
    BOOL v22 = 0;
    goto LABEL_127;
  }
LABEL_111:
  if ((has & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_floorOrdinal != *((_DWORD *)v4 + 9)) {
      goto LABEL_126;
    }
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_addressRecordID != *((_DWORD *)v4 + 7)) {
      goto LABEL_126;
    }
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_addressID != *((_DWORD *)v4 + 6)) {
      goto LABEL_126;
    }
    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = (v18 & 4) == 0;
  }
LABEL_127:

  return v22;
}

- (unint64_t)hash
{
  unsigned int unusedMapType = self->_unusedMapType;
  unsigned int type = self->_type;
  unsigned int originalType = self->_originalType;
  NSUInteger v40 = [(NSString *)self->_obsoleteName hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v39 = 2654435761 * self->_flags;
  }
  else {
    uint64_t v39 = 0;
  }
  NSUInteger v38 = [(NSString *)self->_obsoleteLocality hash];
  NSUInteger v35 = [(NSString *)self->_obsoleteRegion hash];
  NSUInteger v37 = [(NSString *)self->_obsoletePostalCode hash];
  NSUInteger v36 = [(NSString *)self->_obsoleteCountryCode hash];
  NSUInteger v34 = [(NSString *)self->_obsoleteCountryName hash];
  NSUInteger v33 = [(NSString *)self->_obsoletePhone hash];
  NSUInteger v32 = [(NSString *)self->_obsoleteReferenceURL hash];
  NSUInteger v31 = [(NSString *)self->_mapsURL hash];
  NSUInteger v30 = [(NSString *)self->_obsoleteDependentLocality hash];
  NSUInteger v29 = [(NSString *)self->_obsoleteThoroughfare hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v28 = 2654435761 * self->_obsoleteLatitudeE6Value;
    if ((has & 0x80) != 0)
    {
LABEL_6:
      uint64_t v27 = 2654435761 * self->_obsoleteLongitudeE6Value;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v27 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v26 = 2654435761 * self->_zoomLevel;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v25 = 0;
    if (has) {
      goto LABEL_9;
    }
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v26 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v25 = 2654435761 * self->_obsoleteInexactPosition;
  if (has)
  {
LABEL_9:
    uint64_t v24 = 2654435761 * self->_obsoleteCid;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v24 = 0;
LABEL_15:
  id v22 = [(NSMutableArray *)self->_obsoleteAddressLines hash];
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    uint64_t v4 = 2654435761 * self->_obsoleteUnverifiedListing;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_17:
      uint64_t v5 = 2654435761 * self->_obsoleteClosedListing;
      goto LABEL_20;
    }
  }
  uint64_t v5 = 0;
LABEL_20:
  unint64_t v6 = (unint64_t)[(GEOPlace *)self->_place hash];
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x400) == 0)
  {
    uint64_t v8 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_22;
    }
LABEL_28:
    uint64_t v9 = 0;
    if ((v7 & 2) != 0) {
      goto LABEL_23;
    }
LABEL_29:
    unint64_t v14 = 0;
    goto LABEL_32;
  }
  uint64_t v8 = 2654435761 * self->_hasIncompleteMetadata;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_28;
  }
LABEL_22:
  uint64_t v9 = 2654435761 * self->_hasIncompleteNavData;
  if ((v7 & 2) == 0) {
    goto LABEL_29;
  }
LABEL_23:
  double timestamp = self->_timestamp;
  double v11 = -timestamp;
  if (timestamp >= 0.0) {
    double v11 = self->_timestamp;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_32:
  if ((v7 & 0x100) != 0) {
    uint64_t v15 = 2654435761 * self->_resultIndex;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v16 = [(NSString *)self->_syncIdentifier hash];
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x20) == 0)
  {
    uint64_t v18 = 0;
    if ((v17 & 8) != 0) {
      goto LABEL_37;
    }
LABEL_40:
    uint64_t v19 = 0;
    if ((v17 & 4) != 0) {
      goto LABEL_38;
    }
LABEL_41:
    uint64_t v20 = 0;
    return (2654435761 * type) ^ (2654435761 * unusedMapType) ^ (2654435761 * originalType) ^ v40 ^ v39 ^ v38 ^ v35 ^ v37 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20;
  }
  uint64_t v18 = 2654435761 * self->_floorOrdinal;
  if ((v17 & 8) == 0) {
    goto LABEL_40;
  }
LABEL_37:
  uint64_t v19 = 2654435761 * self->_addressRecordID;
  if ((v17 & 4) == 0) {
    goto LABEL_41;
  }
LABEL_38:
  uint64_t v20 = 2654435761 * self->_addressID;
  return (2654435761 * type) ^ (2654435761 * unusedMapType) ^ (2654435761 * originalType) ^ v40 ^ v39 ^ v38 ^ v35 ^ v37 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int unusedMapType = *((_DWORD *)v4 + 47);
  self->_unsigned int type = *((_DWORD *)v4 + 46);
  self->_unsigned int originalType = *((_DWORD *)v4 + 38);
  if (*((void *)v4 + 13)) {
    -[SearchResultRepr setObsoleteName:](self, "setObsoleteName:");
  }
  if ((*((_WORD *)v4 + 102) & 0x10) != 0)
  {
    self->_flags = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 11)) {
    -[SearchResultRepr setObsoleteLocality:](self, "setObsoleteLocality:");
  }
  if (*((void *)v4 + 17)) {
    -[SearchResultRepr setObsoleteRegion:](self, "setObsoleteRegion:");
  }
  if (*((void *)v4 + 15)) {
    -[SearchResultRepr setObsoletePostalCode:](self, "setObsoletePostalCode:");
  }
  if (*((void *)v4 + 7)) {
    -[SearchResultRepr setObsoleteCountryCode:](self, "setObsoleteCountryCode:");
  }
  if (*((void *)v4 + 8)) {
    -[SearchResultRepr setObsoleteCountryName:](self, "setObsoleteCountryName:");
  }
  if (*((void *)v4 + 14)) {
    -[SearchResultRepr setObsoletePhone:](self, "setObsoletePhone:");
  }
  if (*((void *)v4 + 16)) {
    -[SearchResultRepr setObsoleteReferenceURL:](self, "setObsoleteReferenceURL:");
  }
  if (*((void *)v4 + 5)) {
    -[SearchResultRepr setMapsURL:](self, "setMapsURL:");
  }
  if (*((void *)v4 + 9)) {
    -[SearchResultRepr setObsoleteDependentLocality:](self, "setObsoleteDependentLocality:");
  }
  if (*((void *)v4 + 18)) {
    -[SearchResultRepr setObsoleteThoroughfare:](self, "setObsoleteThoroughfare:");
  }
  __int16 v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x40) != 0)
  {
    self->_obsoleteLatitudeE6Value = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v5 = *((_WORD *)v4 + 102);
    if ((v5 & 0x80) == 0)
    {
LABEL_27:
      if ((v5 & 0x200) == 0) {
        goto LABEL_28;
      }
      goto LABEL_47;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_27;
  }
  self->_obsoleteLongitudeE6Value = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x200) == 0)
  {
LABEL_28:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_zoomLevel = *((_DWORD *)v4 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x2000) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_48:
  self->_obsoleteInexactPosition = *((unsigned char *)v4 + 199);
  *(_WORD *)&self->_has |= 0x2000u;
  if (*((_WORD *)v4 + 102))
  {
LABEL_30:
    self->_obsoleteCid = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_31:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = *((id *)v4 + 6);
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        -[SearchResultRepr addObsoleteAddressLine:](self, "addObsoleteAddressLine:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  __int16 v11 = *((_WORD *)v4 + 102);
  if ((v11 & 0x4000) != 0)
  {
    self->_obsoleteUnverifiedListing = *((unsigned char *)v4 + 200);
    *(_WORD *)&self->_has |= 0x4000u;
    __int16 v11 = *((_WORD *)v4 + 102);
  }
  if ((v11 & 0x1000) != 0)
  {
    self->_obsoleteClosedListing = *((unsigned char *)v4 + 198);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  place = self->_place;
  uint64_t v13 = *((void *)v4 + 20);
  if (place)
  {
    if (v13) {
      -[GEOPlace mergeFrom:](place, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[SearchResultRepr setPlace:](self, "setPlace:");
  }
  __int16 v14 = *((_WORD *)v4 + 102);
  if ((v14 & 0x400) != 0)
  {
    self->_hasIncompleteMetadata = *((unsigned char *)v4 + 196);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v14 = *((_WORD *)v4 + 102);
    if ((v14 & 0x800) == 0)
    {
LABEL_54:
      if ((v14 & 2) == 0) {
        goto LABEL_55;
      }
      goto LABEL_66;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x800) == 0)
  {
    goto LABEL_54;
  }
  self->_hasIncompleteNavData = *((unsigned char *)v4 + 197);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v14 = *((_WORD *)v4 + 102);
  if ((v14 & 2) == 0)
  {
LABEL_55:
    if ((v14 & 0x100) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_66:
  self->_double timestamp = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
LABEL_56:
    self->_resultIndex = *((_DWORD *)v4 + 42);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_57:
  if (*((void *)v4 + 22)) {
    -[SearchResultRepr setSyncIdentifier:](self, "setSyncIdentifier:");
  }
  __int16 v15 = *((_WORD *)v4 + 102);
  if ((v15 & 0x20) == 0)
  {
    if ((v15 & 8) == 0) {
      goto LABEL_61;
    }
LABEL_69:
    self->_addressRecordID = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 102) & 4) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
  self->_floorOrdinal = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v15 = *((_WORD *)v4 + 102);
  if ((v15 & 8) != 0) {
    goto LABEL_69;
  }
LABEL_61:
  if ((v15 & 4) != 0)
  {
LABEL_62:
    self->_addressID = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_63:
}

- (unsigned)unusedMapType
{
  return self->_unusedMapType;
}

- (void)setUnusedMapType:(unsigned int)a3
{
  self->_unsigned int unusedMapType = a3;
}

- (NSString)obsoleteName
{
  return self->_obsoleteName;
}

- (void)setObsoleteName:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)obsoleteLocality
{
  return self->_obsoleteLocality;
}

- (void)setObsoleteLocality:(id)a3
{
}

- (NSString)obsoleteRegion
{
  return self->_obsoleteRegion;
}

- (void)setObsoleteRegion:(id)a3
{
}

- (NSString)obsoletePostalCode
{
  return self->_obsoletePostalCode;
}

- (void)setObsoletePostalCode:(id)a3
{
}

- (NSString)obsoleteCountryCode
{
  return self->_obsoleteCountryCode;
}

- (void)setObsoleteCountryCode:(id)a3
{
}

- (NSString)obsoleteCountryName
{
  return self->_obsoleteCountryName;
}

- (void)setObsoleteCountryName:(id)a3
{
}

- (NSString)obsoletePhone
{
  return self->_obsoletePhone;
}

- (void)setObsoletePhone:(id)a3
{
}

- (NSString)obsoleteReferenceURL
{
  return self->_obsoleteReferenceURL;
}

- (void)setObsoleteReferenceURL:(id)a3
{
}

- (NSString)mapsURL
{
  return self->_mapsURL;
}

- (void)setMapsURL:(id)a3
{
}

- (NSString)obsoleteDependentLocality
{
  return self->_obsoleteDependentLocality;
}

- (void)setObsoleteDependentLocality:(id)a3
{
}

- (NSString)obsoleteThoroughfare
{
  return self->_obsoleteThoroughfare;
}

- (void)setObsoleteThoroughfare:(id)a3
{
}

- (int)obsoleteLatitudeE6Value
{
  return self->_obsoleteLatitudeE6Value;
}

- (int)obsoleteLongitudeE6Value
{
  return self->_obsoleteLongitudeE6Value;
}

- (unsigned)zoomLevel
{
  return self->_zoomLevel;
}

- (BOOL)obsoleteInexactPosition
{
  return self->_obsoleteInexactPosition;
}

- (int64_t)obsoleteCid
{
  return self->_obsoleteCid;
}

- (NSMutableArray)obsoleteAddressLines
{
  return self->_obsoleteAddressLines;
}

- (void)setObsoleteAddressLines:(id)a3
{
}

- (BOOL)obsoleteUnverifiedListing
{
  return self->_obsoleteUnverifiedListing;
}

- (BOOL)obsoleteClosedListing
{
  return self->_obsoleteClosedListing;
}

- (BOOL)hasIncompleteMetadata
{
  return self->_hasIncompleteMetadata;
}

- (BOOL)hasIncompleteNavData
{
  return self->_hasIncompleteNavData;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)resultIndex
{
  return self->_resultIndex;
}

- (NSString)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
}

- (int)floorOrdinal
{
  return self->_floorOrdinal;
}

- (int)addressRecordID
{
  return self->_addressRecordID;
}

- (int)addressID
{
  return self->_addressID;
}

@end