@interface APPBLogMetaData
+ (Class)tiltTrackBlobType;
- (APPBAdSize)clientViewSize;
- (APPBAdSize)screenSize;
- (APPBAdSize)selectedCreativeSize;
- (BOOL)hasActionIdentifier;
- (BOOL)hasAdDataResponseIdentifier;
- (BOOL)hasAdSpace;
- (BOOL)hasAnonymousDemandiAdID;
- (BOOL)hasBatchId;
- (BOOL)hasButtonState;
- (BOOL)hasClickSource;
- (BOOL)hasClientViewSize;
- (BOOL)hasConnectionType;
- (BOOL)hasContentiAdID;
- (BOOL)hasDPID;
- (BOOL)hasDuration;
- (BOOL)hasIAdID;
- (BOOL)hasImpressionIdentifierData;
- (BOOL)hasImpressionSequence;
- (BOOL)hasImpressionSource;
- (BOOL)hasMessageSequence;
- (BOOL)hasOverclickCount;
- (BOOL)hasScreenScale;
- (BOOL)hasScreenSize;
- (BOOL)hasSelectedCreativeSize;
- (BOOL)hasSlotIdentifier;
- (BOOL)hasSlotPosition;
- (BOOL)hasSlotWasVisuallyEngaged;
- (BOOL)hasTiltStationBlob;
- (BOOL)hasTimeSinceAppResume;
- (BOOL)hasTimeStamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)slotWasVisuallyEngaged;
- (NSData)anonymousDemandiAdID;
- (NSData)contentiAdID;
- (NSData)dPID;
- (NSData)iAdID;
- (NSData)impressionIdentifierData;
- (NSData)tiltStationBlob;
- (NSMutableArray)tiltTrackBlobs;
- (NSString)actionIdentifier;
- (NSString)adDataResponseIdentifier;
- (NSString)batchId;
- (NSString)slotIdentifier;
- (double)screenScale;
- (double)timeSinceAppResume;
- (double)timeStamp;
- (id)adSpaceAsString:(int)a3;
- (id)buttonStateAsString:(int)a3;
- (id)clickSourceAsString:(int)a3;
- (id)connectionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)impressionSourceAsString:(int)a3;
- (id)tiltTrackBlobAtIndex:(unint64_t)a3;
- (int)StringAsAdSpace:(id)a3;
- (int)StringAsButtonState:(id)a3;
- (int)StringAsClickSource:(id)a3;
- (int)StringAsConnectionType:(id)a3;
- (int)StringAsImpressionSource:(id)a3;
- (int)adSpace;
- (int)buttonState;
- (int)clickSource;
- (int)connectionType;
- (int)duration;
- (int)impressionSequence;
- (int)impressionSource;
- (int)messageSequence;
- (int)overclickCount;
- (int)slotPosition;
- (unint64_t)hash;
- (unint64_t)tiltTrackBlobsCount;
- (void)addTiltTrackBlob:(id)a3;
- (void)clearTiltTrackBlobs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setAdDataResponseIdentifier:(id)a3;
- (void)setAdSpace:(int)a3;
- (void)setAnonymousDemandiAdID:(id)a3;
- (void)setBatchId:(id)a3;
- (void)setButtonState:(int)a3;
- (void)setClickSource:(int)a3;
- (void)setClientViewSize:(id)a3;
- (void)setConnectionType:(int)a3;
- (void)setContentiAdID:(id)a3;
- (void)setDPID:(id)a3;
- (void)setDuration:(int)a3;
- (void)setHasAdSpace:(BOOL)a3;
- (void)setHasButtonState:(BOOL)a3;
- (void)setHasClickSource:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasImpressionSequence:(BOOL)a3;
- (void)setHasImpressionSource:(BOOL)a3;
- (void)setHasMessageSequence:(BOOL)a3;
- (void)setHasOverclickCount:(BOOL)a3;
- (void)setHasScreenScale:(BOOL)a3;
- (void)setHasSlotPosition:(BOOL)a3;
- (void)setHasSlotWasVisuallyEngaged:(BOOL)a3;
- (void)setHasTimeSinceAppResume:(BOOL)a3;
- (void)setHasTimeStamp:(BOOL)a3;
- (void)setIAdID:(id)a3;
- (void)setImpressionIdentifierData:(id)a3;
- (void)setImpressionSequence:(int)a3;
- (void)setImpressionSource:(int)a3;
- (void)setMessageSequence:(int)a3;
- (void)setOverclickCount:(int)a3;
- (void)setScreenScale:(double)a3;
- (void)setScreenSize:(id)a3;
- (void)setSelectedCreativeSize:(id)a3;
- (void)setSlotIdentifier:(id)a3;
- (void)setSlotPosition:(int)a3;
- (void)setSlotWasVisuallyEngaged:(BOOL)a3;
- (void)setTiltStationBlob:(id)a3;
- (void)setTiltTrackBlobs:(id)a3;
- (void)setTimeSinceAppResume:(double)a3;
- (void)setTimeStamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBLogMetaData

- (BOOL)hasBatchId
{
  return self->_batchId != 0;
}

- (void)setMessageSequence:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_messageSequence = a3;
}

- (void)setHasMessageSequence:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMessageSequence
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasImpressionIdentifierData
{
  return self->_impressionIdentifierData != 0;
}

- (void)setImpressionSequence:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_impressionSequence = a3;
}

- (void)setHasImpressionSequence:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasImpressionSequence
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setOverclickCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_overclickCount = a3;
}

- (void)setHasOverclickCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasOverclickCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)connectionType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_connectionType;
  }
  else {
    return 0;
  }
}

- (void)setConnectionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100235458 + a3);
  }

  return v3;
}

- (int)StringAsConnectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownConnection"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WiFi"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Cellular_2_G"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Cellular_2_5G"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Cellular_3_G"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Cellular_3_5G"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Cellular_3_75G"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Cellular_H_Plus"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Cellular_4G"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Cellular_5G"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)adSpace
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_adSpace;
  }
  else {
    return 0;
  }
}

- (void)setAdSpace:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_adSpace = a3;
}

- (void)setHasAdSpace:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAdSpace
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)adSpaceAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1002354B0 + a3);
  }

  return v3;
}

- (int)StringAsAdSpace:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"StationEntry"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SongSkip"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SongBreak"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FullScreenBanner"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ModalInterstitial"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTiltStationBlob
{
  return self->_tiltStationBlob != 0;
}

- (void)clearTiltTrackBlobs
{
}

- (void)addTiltTrackBlob:(id)a3
{
  id v4 = a3;
  tiltTrackBlobs = self->_tiltTrackBlobs;
  id v8 = v4;
  if (!tiltTrackBlobs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tiltTrackBlobs;
    self->_tiltTrackBlobs = v6;

    id v4 = v8;
    tiltTrackBlobs = self->_tiltTrackBlobs;
  }
  [(NSMutableArray *)tiltTrackBlobs addObject:v4];
}

- (unint64_t)tiltTrackBlobsCount
{
  return (unint64_t)[(NSMutableArray *)self->_tiltTrackBlobs count];
}

- (id)tiltTrackBlobAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tiltTrackBlobs objectAtIndex:a3];
}

+ (Class)tiltTrackBlobType
{
  return (Class)objc_opt_class();
}

- (void)setTimeStamp:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timeStamp = a3;
}

- (void)setHasTimeStamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimeStamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTimeSinceAppResume:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_timeSinceAppResume = a3;
}

- (void)setHasTimeSinceAppResume:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTimeSinceAppResume
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (int)impressionSource
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_impressionSource;
  }
  else {
    return 0;
  }
}

- (void)setImpressionSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_impressionSource = a3;
}

- (void)setHasImpressionSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasImpressionSource
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)impressionSourceAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1002354D8 + a3);
  }

  return v3;
}

- (int)StringAsImpressionSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DefaultImpressionSource"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MiniPlayer"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MiniPlayerLamp"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FullsizePlayer"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HistoryView"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)clickSource
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_clickSource;
  }
  else {
    return 0;
  }
}

- (void)setClickSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_clickSource = a3;
}

- (void)setHasClickSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasClickSource
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)clickSourceAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100235500 + a3);
  }

  return v3;
}

- (int)StringAsClickSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DefaultClickSource"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LogoImage"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BasicSlate"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AlphaSlate"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSlotIdentifier
{
  return self->_slotIdentifier != 0;
}

- (void)setSlotPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_slotPosition = a3;
}

- (void)setHasSlotPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSlotPosition
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSlotWasVisuallyEngaged:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_slotWasVisuallyEngaged = a3;
}

- (void)setHasSlotWasVisuallyEngaged:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSlotWasVisuallyEngaged
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (BOOL)hasScreenSize
{
  return self->_screenSize != 0;
}

- (void)setScreenScale:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_screenScale = a3;
}

- (void)setHasScreenScale:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasScreenScale
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasClientViewSize
{
  return self->_clientViewSize != 0;
}

- (BOOL)hasSelectedCreativeSize
{
  return self->_selectedCreativeSize != 0;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasAdDataResponseIdentifier
{
  return self->_adDataResponseIdentifier != 0;
}

- (int)buttonState
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_buttonState;
  }
  else {
    return 5000;
  }
}

- (void)setButtonState:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_buttonState = a3;
}

- (void)setHasButtonState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasButtonState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)buttonStateAsString:(int)a3
{
  if ((a3 - 5000) >= 8)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100235520 + a3 - 5000);
  }

  return v3;
}

- (int)StringAsButtonState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Get"])
  {
    int v4 = 5000;
  }
  else if ([v3 isEqualToString:@"Purchase"])
  {
    int v4 = 5001;
  }
  else if ([v3 isEqualToString:@"GetArcade"])
  {
    int v4 = 5002;
  }
  else if ([v3 isEqualToString:@"GetPreorder"])
  {
    int v4 = 5003;
  }
  else if ([v3 isEqualToString:@"PurchasePreorder"])
  {
    int v4 = 5004;
  }
  else if ([v3 isEqualToString:@"Update"])
  {
    int v4 = 5005;
  }
  else if ([v3 isEqualToString:@"Download"])
  {
    int v4 = 5006;
  }
  else if ([v3 isEqualToString:@"Open"])
  {
    int v4 = 5007;
  }
  else
  {
    int v4 = 5000;
  }

  return v4;
}

- (void)setDuration:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogMetaData;
  __int16 v3 = [(APPBLogMetaData *)&v7 description];
  int v4 = [(APPBLogMetaData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  batchId = self->_batchId;
  if (batchId) {
    [v3 setObject:batchId forKey:@"batchId"];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v6 = +[NSNumber numberWithInt:self->_messageSequence];
    [v4 setObject:v6 forKey:@"messageSequence"];
  }
  impressionIdentifierData = self->_impressionIdentifierData;
  if (impressionIdentifierData) {
    [v4 setObject:impressionIdentifierData forKey:@"impressionIdentifierData"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v9 = +[NSNumber numberWithInt:self->_impressionSequence];
    [v4 setObject:v9 forKey:@"impressionSequence"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  v10 = +[NSNumber numberWithInt:self->_overclickCount];
  [v4 setObject:v10 forKey:@"overclickCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
LABEL_14:
  uint64_t connectionType = self->_connectionType;
  if (connectionType >= 0xB)
  {
    v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_connectionType];
  }
  else
  {
    v12 = *(&off_100235458 + connectionType);
  }
  [v4 setObject:v12 forKey:@"connectionType"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_18:
    uint64_t adSpace = self->_adSpace;
    if (adSpace >= 5)
    {
      v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_adSpace];
    }
    else
    {
      v14 = *(&off_1002354B0 + adSpace);
    }
    [v4 setObject:v14 forKey:@"adSpace"];
  }
LABEL_22:
  tiltStationBlob = self->_tiltStationBlob;
  if (tiltStationBlob) {
    [v4 setObject:tiltStationBlob forKey:@"tiltStationBlob"];
  }
  tiltTrackBlobs = self->_tiltTrackBlobs;
  if (tiltTrackBlobs) {
    [v4 setObject:tiltTrackBlobs forKey:@"tiltTrackBlob"];
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 4) != 0)
  {
    v18 = +[NSNumber numberWithDouble:self->_timeStamp];
    [v4 setObject:v18 forKey:@"timeStamp"];

    __int16 v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_28:
      if ((v17 & 0x200) == 0) {
        goto LABEL_29;
      }
      goto LABEL_33;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_28;
  }
  v19 = +[NSNumber numberWithDouble:self->_timeSinceAppResume];
  [v4 setObject:v19 forKey:@"timeSinceAppResume"];

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x200) == 0)
  {
LABEL_29:
    if ((v17 & 0x20) == 0) {
      goto LABEL_41;
    }
    goto LABEL_37;
  }
LABEL_33:
  uint64_t impressionSource = self->_impressionSource;
  if (impressionSource >= 5)
  {
    v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_impressionSource];
  }
  else
  {
    v21 = *(&off_1002354D8 + impressionSource);
  }
  [v4 setObject:v21 forKey:@"impressionSource"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_37:
    uint64_t clickSource = self->_clickSource;
    if (clickSource >= 4)
    {
      v23 = +[NSString stringWithFormat:@"(unknown: %i)", self->_clickSource];
    }
    else
    {
      v23 = *(&off_100235500 + clickSource);
    }
    [v4 setObject:v23 forKey:@"clickSource"];
  }
LABEL_41:
  slotIdentifier = self->_slotIdentifier;
  if (slotIdentifier) {
    [v4 setObject:slotIdentifier forKey:@"slotIdentifier"];
  }
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x1000) != 0)
  {
    v26 = +[NSNumber numberWithInt:self->_slotPosition];
    [v4 setObject:v26 forKey:@"slotPosition"];

    __int16 v25 = (__int16)self->_has;
  }
  if ((v25 & 0x2000) != 0)
  {
    v27 = +[NSNumber numberWithBool:self->_slotWasVisuallyEngaged];
    [v4 setObject:v27 forKey:@"slotWasVisuallyEngaged"];
  }
  iAdID = self->_iAdID;
  if (iAdID) {
    [v4 setObject:iAdID forKey:@"iAdID"];
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID) {
    [v4 setObject:anonymousDemandiAdID forKey:@"anonymousDemandiAdID"];
  }
  contentiAdID = self->_contentiAdID;
  if (contentiAdID) {
    [v4 setObject:contentiAdID forKey:@"contentiAdID"];
  }
  dPID = self->_dPID;
  if (dPID) {
    [v4 setObject:dPID forKey:@"DPID"];
  }
  screenSize = self->_screenSize;
  if (screenSize)
  {
    v33 = [(APPBAdSize *)screenSize dictionaryRepresentation];
    [v4 setObject:v33 forKey:@"screenSize"];
  }
  if (*(_WORD *)&self->_has)
  {
    v34 = +[NSNumber numberWithDouble:self->_screenScale];
    [v4 setObject:v34 forKey:@"screenScale"];
  }
  clientViewSize = self->_clientViewSize;
  if (clientViewSize)
  {
    v36 = [(APPBAdSize *)clientViewSize dictionaryRepresentation];
    [v4 setObject:v36 forKey:@"clientViewSize"];
  }
  selectedCreativeSize = self->_selectedCreativeSize;
  if (selectedCreativeSize)
  {
    v38 = [(APPBAdSize *)selectedCreativeSize dictionaryRepresentation];
    [v4 setObject:v38 forKey:@"selectedCreativeSize"];
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v4 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if (adDataResponseIdentifier) {
    [v4 setObject:adDataResponseIdentifier forKey:@"adDataResponseIdentifier"];
  }
  __int16 v41 = (__int16)self->_has;
  if ((v41 & 0x10) != 0)
  {
    int v42 = self->_buttonState - 5000;
    if (v42 >= 8)
    {
      v43 = +[NSString stringWithFormat:@"(unknown: %i)", self->_buttonState];
    }
    else
    {
      v43 = *(&off_100235520 + v42);
    }
    [v4 setObject:v43 forKey:@"buttonState"];

    __int16 v41 = (__int16)self->_has;
  }
  if ((v41 & 0x80) != 0)
  {
    v44 = +[NSNumber numberWithInt:self->_duration];
    [v4 setObject:v44 forKey:@"duration"];
  }
  id v45 = v4;

  return v45;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogMetaDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_batchId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_impressionIdentifierData) {
    PBDataWriterWriteDataField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_59;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_tiltStationBlob) {
    PBDataWriterWriteDataField();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = self->_tiltTrackBlobs;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_23:
      if ((v11 & 0x200) == 0) {
        goto LABEL_24;
      }
      goto LABEL_63;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteDoubleField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_24:
    if ((v11 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_25:
  }
    PBDataWriterWriteInt32Field();
LABEL_26:
  if (self->_slotIdentifier) {
    PBDataWriterWriteStringField();
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 0x2000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_iAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_anonymousDemandiAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_contentiAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_dPID) {
    PBDataWriterWriteDataField();
  }
  if (self->_screenSize) {
    PBDataWriterWriteSubmessage();
  }
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_clientViewSize) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_selectedCreativeSize) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_actionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_adDataResponseIdentifier) {
    PBDataWriterWriteStringField();
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_batchId)
  {
    [v4 setBatchId:];
    id v4 = v14;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v4 + 36) = self->_messageSequence;
    *((_WORD *)v4 + 102) |= 0x400u;
  }
  if (self->_impressionIdentifierData)
  {
    [v14 setImpressionIdentifierData:];
    id v4 = v14;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v4 + 34) = self->_impressionSequence;
    *((_WORD *)v4 + 102) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 37) = self->_overclickCount;
  *((_WORD *)v4 + 102) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_58:
  *((_DWORD *)v4 + 22) = self->_connectionType;
  *((_WORD *)v4 + 102) |= 0x40u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 12) = self->_adSpace;
    *((_WORD *)v4 + 102) |= 8u;
  }
LABEL_12:
  if (self->_tiltStationBlob) {
    [v14 setTiltStationBlob:];
  }
  if ([(APPBLogMetaData *)self tiltTrackBlobsCount])
  {
    [v14 clearTiltTrackBlobs];
    unint64_t v6 = [(APPBLogMetaData *)self tiltTrackBlobsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(APPBLogMetaData *)self tiltTrackBlobAtIndex:i];
        [v14 addTiltTrackBlob:v9];
      }
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = v14;
  if ((v10 & 4) != 0)
  {
    *((void *)v14 + 3) = *(void *)&self->_timeStamp;
    *((_WORD *)v14 + 102) |= 4u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_20:
      if ((v10 & 0x200) == 0) {
        goto LABEL_21;
      }
      goto LABEL_62;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_20;
  }
  *((void *)v14 + 2) = *(void *)&self->_timeSinceAppResume;
  *((_WORD *)v14 + 102) |= 2u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_21:
    if ((v10 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_62:
  *((_DWORD *)v14 + 35) = self->_impressionSource;
  *((_WORD *)v14 + 102) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_22:
    *((_DWORD *)v14 + 19) = self->_clickSource;
    *((_WORD *)v14 + 102) |= 0x20u;
  }
LABEL_23:
  if (self->_slotIdentifier)
  {
    [v14 setSlotIdentifier:];
    __int16 v11 = v14;
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x1000) != 0)
  {
    v11[44] = self->_slotPosition;
    *((_WORD *)v11 + 102) |= 0x1000u;
    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 0x2000) != 0)
  {
    *((unsigned char *)v11 + 200) = self->_slotWasVisuallyEngaged;
    *((_WORD *)v11 + 102) |= 0x2000u;
  }
  if (self->_iAdID)
  {
    [v14 setIAdID:];
    __int16 v11 = v14;
  }
  if (self->_anonymousDemandiAdID)
  {
    [v14 setAnonymousDemandiAdID:];
    __int16 v11 = v14;
  }
  if (self->_contentiAdID)
  {
    [v14 setContentiAdID:];
    __int16 v11 = v14;
  }
  if (self->_dPID)
  {
    [v14 setDPID:];
    __int16 v11 = v14;
  }
  if (self->_screenSize)
  {
    [v14 setScreenSize:];
    __int16 v11 = v14;
  }
  if (*(_WORD *)&self->_has)
  {
    *((void *)v11 + 1) = *(void *)&self->_screenScale;
    *((_WORD *)v11 + 102) |= 1u;
  }
  if (self->_clientViewSize)
  {
    [v14 setClientViewSize:];
    __int16 v11 = v14;
  }
  if (self->_selectedCreativeSize)
  {
    [v14 setSelectedCreativeSize:];
    __int16 v11 = v14;
  }
  if (self->_actionIdentifier)
  {
    [v14 setActionIdentifier:];
    __int16 v11 = v14;
  }
  if (self->_adDataResponseIdentifier)
  {
    [v14 setAdDataResponseIdentifier:];
    __int16 v11 = v14;
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    v11[18] = self->_buttonState;
    *((_WORD *)v11 + 102) |= 0x10u;
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 0x80) != 0)
  {
    v11[28] = self->_duration;
    *((_WORD *)v11 + 102) |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_batchId copyWithZone:a3];
  unint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v5 + 36) = self->_messageSequence;
    *((_WORD *)v5 + 102) |= 0x400u;
  }
  id v8 = [(NSData *)self->_impressionIdentifierData copyWithZone:a3];
  uint64_t v9 = (void *)v5[16];
  v5[16] = v8;

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v5 + 34) = self->_impressionSequence;
    *((_WORD *)v5 + 102) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 37) = self->_overclickCount;
  *((_WORD *)v5 + 102) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_33:
  *((_DWORD *)v5 + 22) = self->_connectionType;
  *((_WORD *)v5 + 102) |= 0x40u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 12) = self->_adSpace;
    *((_WORD *)v5 + 102) |= 8u;
  }
LABEL_8:
  id v11 = [(NSData *)self->_tiltStationBlob copyWithZone:a3];
  __int16 v12 = (void *)v5[23];
  v5[23] = v11;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  __int16 v13 = self->_tiltTrackBlobs;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v43 + 1) + 8 * i) copyWithZone:a3];
        [v5 addTiltTrackBlob:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v15);
  }

  __int16 v19 = (__int16)self->_has;
  if ((v19 & 4) != 0)
  {
    v5[3] = *(void *)&self->_timeStamp;
    *((_WORD *)v5 + 102) |= 4u;
    __int16 v19 = (__int16)self->_has;
    if ((v19 & 2) == 0)
    {
LABEL_17:
      if ((v19 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
  }
  else if ((v19 & 2) == 0)
  {
    goto LABEL_17;
  }
  v5[2] = *(void *)&self->_timeSinceAppResume;
  *((_WORD *)v5 + 102) |= 2u;
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x200) == 0)
  {
LABEL_18:
    if ((v19 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_37:
  *((_DWORD *)v5 + 35) = self->_impressionSource;
  *((_WORD *)v5 + 102) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_19:
    *((_DWORD *)v5 + 19) = self->_clickSource;
    *((_WORD *)v5 + 102) |= 0x20u;
  }
LABEL_20:
  id v20 = -[NSString copyWithZone:](self->_slotIdentifier, "copyWithZone:", a3, (void)v43);
  v21 = (void *)v5[21];
  v5[21] = v20;

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x1000) != 0)
  {
    *((_DWORD *)v5 + 44) = self->_slotPosition;
    *((_WORD *)v5 + 102) |= 0x1000u;
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 0x2000) != 0)
  {
    *((unsigned char *)v5 + 200) = self->_slotWasVisuallyEngaged;
    *((_WORD *)v5 + 102) |= 0x2000u;
  }
  id v23 = [(NSData *)self->_iAdID copyWithZone:a3];
  v24 = (void *)v5[15];
  v5[15] = v23;

  id v25 = [(NSData *)self->_anonymousDemandiAdID copyWithZone:a3];
  v26 = (void *)v5[7];
  v5[7] = v25;

  id v27 = [(NSData *)self->_contentiAdID copyWithZone:a3];
  v28 = (void *)v5[12];
  v5[12] = v27;

  id v29 = [(NSData *)self->_dPID copyWithZone:a3];
  v30 = (void *)v5[13];
  v5[13] = v29;

  id v31 = [(APPBAdSize *)self->_screenSize copyWithZone:a3];
  v32 = (void *)v5[19];
  v5[19] = v31;

  if (*(_WORD *)&self->_has)
  {
    v5[1] = *(void *)&self->_screenScale;
    *((_WORD *)v5 + 102) |= 1u;
  }
  id v33 = [(APPBAdSize *)self->_clientViewSize copyWithZone:a3];
  v34 = (void *)v5[10];
  v5[10] = v33;

  id v35 = [(APPBAdSize *)self->_selectedCreativeSize copyWithZone:a3];
  v36 = (void *)v5[20];
  v5[20] = v35;

  id v37 = [(NSString *)self->_actionIdentifier copyWithZone:a3];
  v38 = (void *)v5[4];
  v5[4] = v37;

  id v39 = [(NSString *)self->_adDataResponseIdentifier copyWithZone:a3];
  v40 = (void *)v5[5];
  v5[5] = v39;

  __int16 v41 = (__int16)self->_has;
  if ((v41 & 0x10) != 0)
  {
    *((_DWORD *)v5 + 18) = self->_buttonState;
    *((_WORD *)v5 + 102) |= 0x10u;
    __int16 v41 = (__int16)self->_has;
  }
  if ((v41 & 0x80) != 0)
  {
    *((_DWORD *)v5 + 28) = self->_duration;
    *((_WORD *)v5 + 102) |= 0x80u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_105;
  }
  batchId = self->_batchId;
  if ((unint64_t)batchId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](batchId, "isEqual:")) {
      goto LABEL_105;
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x400) == 0 || self->_messageSequence != *((_DWORD *)v4 + 36)) {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x400) != 0)
  {
    goto LABEL_105;
  }
  impressionIdentifierData = self->_impressionIdentifierData;
  if ((unint64_t)impressionIdentifierData | *((void *)v4 + 16))
  {
    if (!-[NSData isEqual:](impressionIdentifierData, "isEqual:")) {
      goto LABEL_105;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 102);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x100) == 0 || self->_impressionSequence != *((_DWORD *)v4 + 34)) {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x800) == 0 || self->_overclickCount != *((_DWORD *)v4 + 37)) {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x800) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_connectionType != *((_DWORD *)v4 + 22)) {
      goto LABEL_105;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_adSpace != *((_DWORD *)v4 + 12)) {
      goto LABEL_105;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_105;
  }
  tiltStationBlob = self->_tiltStationBlob;
  if ((unint64_t)tiltStationBlob | *((void *)v4 + 23)
    && !-[NSData isEqual:](tiltStationBlob, "isEqual:"))
  {
    goto LABEL_105;
  }
  tiltTrackBlobs = self->_tiltTrackBlobs;
  if ((unint64_t)tiltTrackBlobs | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](tiltTrackBlobs, "isEqual:")) {
      goto LABEL_105;
    }
  }
  __int16 v11 = (__int16)self->_has;
  __int16 v12 = *((_WORD *)v4 + 102);
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_timeStamp != *((double *)v4 + 3)) {
      goto LABEL_105;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_105;
  }
  if ((v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_timeSinceAppResume != *((double *)v4 + 2)) {
      goto LABEL_105;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_105;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) == 0 || self->_impressionSource != *((_DWORD *)v4 + 35)) {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    goto LABEL_105;
  }
  if ((v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_clickSource != *((_DWORD *)v4 + 19)) {
      goto LABEL_105;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_105;
  }
  slotIdentifier = self->_slotIdentifier;
  if ((unint64_t)slotIdentifier | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](slotIdentifier, "isEqual:")) {
      goto LABEL_105;
    }
    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x1000) == 0 || self->_slotPosition != *((_DWORD *)v4 + 44)) {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x1000) != 0)
  {
    goto LABEL_105;
  }
  if ((v11 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x2000) != 0)
    {
      if (self->_slotWasVisuallyEngaged)
      {
        if (!*((unsigned char *)v4 + 200)) {
          goto LABEL_105;
        }
        goto LABEL_72;
      }
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_72;
      }
    }
LABEL_105:
    BOOL v26 = 0;
    goto LABEL_106;
  }
  if ((*((_WORD *)v4 + 102) & 0x2000) != 0) {
    goto LABEL_105;
  }
LABEL_72:
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((void *)v4 + 15) && !-[NSData isEqual:](iAdID, "isEqual:")) {
    goto LABEL_105;
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:")) {
      goto LABEL_105;
    }
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:")) {
      goto LABEL_105;
    }
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:")) {
      goto LABEL_105;
    }
  }
  screenSize = self->_screenSize;
  if ((unint64_t)screenSize | *((void *)v4 + 19))
  {
    if (!-[APPBAdSize isEqual:](screenSize, "isEqual:")) {
      goto LABEL_105;
    }
  }
  __int16 v19 = *((_WORD *)v4 + 102);
  if (*(_WORD *)&self->_has)
  {
    if ((v19 & 1) == 0 || self->_screenScale != *((double *)v4 + 1)) {
      goto LABEL_105;
    }
  }
  else if (v19)
  {
    goto LABEL_105;
  }
  clientViewSize = self->_clientViewSize;
  if ((unint64_t)clientViewSize | *((void *)v4 + 10) && !-[APPBAdSize isEqual:](clientViewSize, "isEqual:")) {
    goto LABEL_105;
  }
  selectedCreativeSize = self->_selectedCreativeSize;
  if ((unint64_t)selectedCreativeSize | *((void *)v4 + 20))
  {
    if (!-[APPBAdSize isEqual:](selectedCreativeSize, "isEqual:")) {
      goto LABEL_105;
    }
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](actionIdentifier, "isEqual:")) {
      goto LABEL_105;
    }
  }
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if ((unint64_t)adDataResponseIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](adDataResponseIdentifier, "isEqual:")) {
      goto LABEL_105;
    }
  }
  __int16 v24 = (__int16)self->_has;
  __int16 v25 = *((_WORD *)v4 + 102);
  if ((v24 & 0x10) != 0)
  {
    if ((v25 & 0x10) == 0 || self->_buttonState != *((_DWORD *)v4 + 18)) {
      goto LABEL_105;
    }
  }
  else if ((v25 & 0x10) != 0)
  {
    goto LABEL_105;
  }
  if ((v24 & 0x80) != 0)
  {
    if ((v25 & 0x80) == 0 || self->_duration != *((_DWORD *)v4 + 28)) {
      goto LABEL_105;
    }
    BOOL v26 = 1;
  }
  else
  {
    BOOL v26 = (v25 & 0x80) == 0;
  }
LABEL_106:

  return v26;
}

- (unint64_t)hash
{
  NSUInteger v47 = [(NSString *)self->_batchId hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v46 = 2654435761 * self->_messageSequence;
  }
  else {
    uint64_t v46 = 0;
  }
  unint64_t v45 = (unint64_t)[(NSData *)self->_impressionIdentifierData hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v44 = 2654435761 * self->_impressionSequence;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_6:
      uint64_t v43 = 2654435761 * self->_overclickCount;
      if ((has & 0x40) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v42 = 0;
      if ((has & 8) != 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v43 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v42 = 2654435761 * self->_connectionType;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v41 = 2654435761 * self->_adSpace;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v41 = 0;
LABEL_13:
  unint64_t v40 = (unint64_t)[(NSData *)self->_tiltStationBlob hash];
  unint64_t v39 = (unint64_t)[(NSMutableArray *)self->_tiltTrackBlobs hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 4) != 0)
  {
    double timeStamp = self->_timeStamp;
    double v7 = -timeStamp;
    if (timeStamp >= 0.0) {
      double v7 = self->_timeStamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((v4 & 2) != 0)
  {
    double timeSinceAppResume = self->_timeSinceAppResume;
    double v12 = -timeSinceAppResume;
    if (timeSinceAppResume >= 0.0) {
      double v12 = self->_timeSinceAppResume;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((v4 & 0x200) != 0) {
    uint64_t v37 = 2654435761 * self->_impressionSource;
  }
  else {
    uint64_t v37 = 0;
  }
  unint64_t v38 = v10;
  if ((v4 & 0x20) != 0) {
    uint64_t v36 = 2654435761 * self->_clickSource;
  }
  else {
    uint64_t v36 = 0;
  }
  NSUInteger v35 = [(NSString *)self->_slotIdentifier hash];
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    uint64_t v34 = 2654435761 * self->_slotPosition;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_37:
      uint64_t v33 = 2654435761 * self->_slotWasVisuallyEngaged;
      goto LABEL_40;
    }
  }
  uint64_t v33 = 0;
LABEL_40:
  unint64_t v32 = (unint64_t)[(NSData *)self->_iAdID hash];
  unint64_t v31 = (unint64_t)[(NSData *)self->_anonymousDemandiAdID hash];
  unint64_t v30 = (unint64_t)[(NSData *)self->_contentiAdID hash];
  unint64_t v15 = (unint64_t)[(NSData *)self->_dPID hash];
  unint64_t v16 = [(APPBAdSize *)self->_screenSize hash];
  if (*(_WORD *)&self->_has)
  {
    double screenScale = self->_screenScale;
    double v19 = -screenScale;
    if (screenScale >= 0.0) {
      double v19 = self->_screenScale;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  unint64_t v22 = [(APPBAdSize *)self->_clientViewSize hash];
  unint64_t v23 = [(APPBAdSize *)self->_selectedCreativeSize hash];
  NSUInteger v24 = [(NSString *)self->_actionIdentifier hash];
  NSUInteger v25 = [(NSString *)self->_adDataResponseIdentifier hash];
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x10) != 0)
  {
    uint64_t v27 = 2654435761 * self->_buttonState;
    if ((v26 & 0x80) != 0) {
      goto LABEL_50;
    }
LABEL_52:
    uint64_t v28 = 0;
    return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v5 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v15 ^ v16 ^ v17 ^ v22 ^ v23 ^ v24 ^ v25 ^ v27 ^ v28;
  }
  uint64_t v27 = 0;
  if ((v26 & 0x80) == 0) {
    goto LABEL_52;
  }
LABEL_50:
  uint64_t v28 = 2654435761 * self->_duration;
  return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v5 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v15 ^ v16 ^ v17 ^ v22 ^ v23 ^ v24 ^ v25 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[APPBLogMetaData setBatchId:](self, "setBatchId:");
  }
  if ((*((_WORD *)v4 + 102) & 0x400) != 0)
  {
    self->_messageSequence = *((_DWORD *)v4 + 36);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v4 + 16)) {
    -[APPBLogMetaData setImpressionIdentifierData:](self, "setImpressionIdentifierData:");
  }
  __int16 v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x100) != 0)
  {
    self->_impressionSequence = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)v4 + 102);
    if ((v5 & 0x800) == 0)
    {
LABEL_9:
      if ((v5 & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_45;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x800) == 0)
  {
    goto LABEL_9;
  }
  self->_overclickCount = *((_DWORD *)v4 + 37);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 102);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_45:
  self->_uint64_t connectionType = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 102) & 8) != 0)
  {
LABEL_11:
    self->_uint64_t adSpace = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((void *)v4 + 23)) {
    -[APPBLogMetaData setTiltStationBlob:](self, "setTiltStationBlob:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v4 + 24);
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        -[APPBLogMetaData addTiltTrackBlob:](self, "addTiltTrackBlob:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  __int16 v11 = *((_WORD *)v4 + 102);
  if ((v11 & 4) != 0)
  {
    self->_double timeStamp = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
    __int16 v11 = *((_WORD *)v4 + 102);
    if ((v11 & 2) == 0)
    {
LABEL_23:
      if ((v11 & 0x200) == 0) {
        goto LABEL_24;
      }
      goto LABEL_49;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_23;
  }
  self->_double timeSinceAppResume = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v11 = *((_WORD *)v4 + 102);
  if ((v11 & 0x200) == 0)
  {
LABEL_24:
    if ((v11 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_49:
  self->_uint64_t impressionSource = *((_DWORD *)v4 + 35);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 102) & 0x20) != 0)
  {
LABEL_25:
    self->_uint64_t clickSource = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_26:
  if (*((void *)v4 + 21)) {
    -[APPBLogMetaData setSlotIdentifier:](self, "setSlotIdentifier:");
  }
  __int16 v12 = *((_WORD *)v4 + 102);
  if ((v12 & 0x1000) != 0)
  {
    self->_slotPosition = *((_DWORD *)v4 + 44);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v12 = *((_WORD *)v4 + 102);
  }
  if ((v12 & 0x2000) != 0)
  {
    self->_slotWasVisuallyEngaged = *((unsigned char *)v4 + 200);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v4 + 15)) {
    -[APPBLogMetaData setIAdID:](self, "setIAdID:");
  }
  if (*((void *)v4 + 7)) {
    -[APPBLogMetaData setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
  }
  if (*((void *)v4 + 12)) {
    -[APPBLogMetaData setContentiAdID:](self, "setContentiAdID:");
  }
  if (*((void *)v4 + 13)) {
    -[APPBLogMetaData setDPID:](self, "setDPID:");
  }
  screenSize = self->_screenSize;
  uint64_t v14 = *((void *)v4 + 19);
  if (screenSize)
  {
    if (v14) {
      -[APPBAdSize mergeFrom:](screenSize, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[APPBLogMetaData setScreenSize:](self, "setScreenSize:");
  }
  if (*((_WORD *)v4 + 102))
  {
    self->_double screenScale = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  clientViewSize = self->_clientViewSize;
  uint64_t v16 = *((void *)v4 + 10);
  if (clientViewSize)
  {
    if (v16) {
      -[APPBAdSize mergeFrom:](clientViewSize, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[APPBLogMetaData setClientViewSize:](self, "setClientViewSize:");
  }
  selectedCreativeSize = self->_selectedCreativeSize;
  uint64_t v18 = *((void *)v4 + 20);
  if (selectedCreativeSize)
  {
    if (v18) {
      -[APPBAdSize mergeFrom:](selectedCreativeSize, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[APPBLogMetaData setSelectedCreativeSize:](self, "setSelectedCreativeSize:");
  }
  if (*((void *)v4 + 4)) {
    -[APPBLogMetaData setActionIdentifier:](self, "setActionIdentifier:");
  }
  if (*((void *)v4 + 5)) {
    -[APPBLogMetaData setAdDataResponseIdentifier:](self, "setAdDataResponseIdentifier:");
  }
  __int16 v19 = *((_WORD *)v4 + 102);
  if ((v19 & 0x10) != 0)
  {
    self->_buttonState = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v19 = *((_WORD *)v4 + 102);
  }
  if ((v19 & 0x80) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x80u;
  }
}

- (NSString)batchId
{
  return self->_batchId;
}

- (void)setBatchId:(id)a3
{
}

- (int)messageSequence
{
  return self->_messageSequence;
}

- (NSData)impressionIdentifierData
{
  return self->_impressionIdentifierData;
}

- (void)setImpressionIdentifierData:(id)a3
{
}

- (int)impressionSequence
{
  return self->_impressionSequence;
}

- (int)overclickCount
{
  return self->_overclickCount;
}

- (NSData)tiltStationBlob
{
  return self->_tiltStationBlob;
}

- (void)setTiltStationBlob:(id)a3
{
}

- (NSMutableArray)tiltTrackBlobs
{
  return self->_tiltTrackBlobs;
}

- (void)setTiltTrackBlobs:(id)a3
{
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (double)timeSinceAppResume
{
  return self->_timeSinceAppResume;
}

- (NSString)slotIdentifier
{
  return self->_slotIdentifier;
}

- (void)setSlotIdentifier:(id)a3
{
}

- (int)slotPosition
{
  return self->_slotPosition;
}

- (BOOL)slotWasVisuallyEngaged
{
  return self->_slotWasVisuallyEngaged;
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (NSData)anonymousDemandiAdID
{
  return self->_anonymousDemandiAdID;
}

- (void)setAnonymousDemandiAdID:(id)a3
{
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
}

- (APPBAdSize)screenSize
{
  return self->_screenSize;
}

- (void)setScreenSize:(id)a3
{
}

- (double)screenScale
{
  return self->_screenScale;
}

- (APPBAdSize)clientViewSize
{
  return self->_clientViewSize;
}

- (void)setClientViewSize:(id)a3
{
}

- (APPBAdSize)selectedCreativeSize
{
  return self->_selectedCreativeSize;
}

- (void)setSelectedCreativeSize:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)adDataResponseIdentifier
{
  return self->_adDataResponseIdentifier;
}

- (void)setAdDataResponseIdentifier:(id)a3
{
}

- (int)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiltTrackBlobs, 0);
  objc_storeStrong((id *)&self->_tiltStationBlob, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedCreativeSize, 0);
  objc_storeStrong((id *)&self->_screenSize, 0);
  objc_storeStrong((id *)&self->_impressionIdentifierData, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
  objc_storeStrong((id *)&self->_clientViewSize, 0);
  objc_storeStrong((id *)&self->_batchId, 0);
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);
  objc_storeStrong((id *)&self->_adDataResponseIdentifier, 0);

  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end