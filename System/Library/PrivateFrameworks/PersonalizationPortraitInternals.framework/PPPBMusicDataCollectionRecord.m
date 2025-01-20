@interface PPPBMusicDataCollectionRecord
+ (id)options;
- (BOOL)hasAlgorithm;
- (BOOL)hasLabel;
- (BOOL)hasMediaId;
- (BOOL)hasMediaType;
- (BOOL)hasQuantizedScore;
- (BOOL)hasSecondsFromUnixEpoch;
- (BOOL)hasSourceBundleId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)label;
- (NSString)mediaId;
- (NSString)sourceBundleId;
- (double)quantizedScore;
- (double)secondsFromUnixEpoch;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)algorithm;
- (int)mediaType;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasQuantizedScore:(BOOL)a3;
- (void)setHasSecondsFromUnixEpoch:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMediaId:(id)a3;
- (void)setMediaType:(int)a3;
- (void)setQuantizedScore:(double)a3;
- (void)setSecondsFromUnixEpoch:(double)a3;
- (void)setSourceBundleId:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBMusicDataCollectionRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (int)algorithm
{
  return self->_algorithm;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (void)setMediaId:(id)a3
{
}

- (NSString)mediaId
{
  return self->_mediaId;
}

- (void)setSourceBundleId:(id)a3
{
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (double)quantizedScore
{
  return self->_quantizedScore;
}

- (double)secondsFromUnixEpoch
{
  return self->_secondsFromUnixEpoch;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  id v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[PPPBMusicDataCollectionRecord setLabel:](self, "setLabel:");
    id v4 = v7;
  }
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 2) != 0)
  {
    self->_secondsFromUnixEpoch = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 68);
  }
  if (v5)
  {
    self->_quantizedScore = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 7))
  {
    -[PPPBMusicDataCollectionRecord setSourceBundleId:](self, "setSourceBundleId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[PPPBMusicDataCollectionRecord setMediaId:](self, "setMediaId:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 68);
  if ((v6 & 8) != 0)
  {
    self->_mediaType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if ((v6 & 4) != 0)
  {
    self->_algorithm = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_label hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double secondsFromUnixEpoch = self->_secondsFromUnixEpoch;
    double v8 = -secondsFromUnixEpoch;
    if (secondsFromUnixEpoch >= 0.0) {
      double v8 = self->_secondsFromUnixEpoch;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if (has)
  {
    double quantizedScore = self->_quantizedScore;
    double v13 = -quantizedScore;
    if (quantizedScore >= 0.0) {
      double v13 = self->_quantizedScore;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  NSUInteger v16 = [(NSString *)self->_sourceBundleId hash];
  NSUInteger v17 = [(NSString *)self->_mediaId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v18 = 2654435761 * self->_mediaType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_22;
    }
LABEL_24:
    uint64_t v19 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  uint64_t v18 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v19 = 2654435761 * self->_algorithm;
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 68);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 16)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_33;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
    {
LABEL_33:
      BOOL v10 = 0;
      goto LABEL_34;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_secondsFromUnixEpoch != *((double *)v4 + 2)) {
      goto LABEL_33;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_33;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_quantizedScore != *((double *)v4 + 1)) {
      goto LABEL_33;
    }
  }
  else if (v6)
  {
    goto LABEL_33;
  }
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((void *)v4 + 7)
    && !-[NSString isEqual:](sourceBundleId, "isEqual:"))
  {
    goto LABEL_33;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](mediaId, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_mediaType != *((_DWORD *)v4 + 12)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_33;
  }
  BOOL v10 = (*((unsigned char *)v4 + 68) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_algorithm != *((_DWORD *)v4 + 6)) {
      goto LABEL_33;
    }
    BOOL v10 = 1;
  }
LABEL_34:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_type;
    *(unsigned char *)(v5 + 68) |= 0x10u;
  }
  uint64_t v7 = [(NSString *)self->_label copyWithZone:a3];
  double v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_secondsFromUnixEpoch;
    *(unsigned char *)(v6 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v6 + 8) = self->_quantizedScore;
    *(unsigned char *)(v6 + 68) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_sourceBundleId copyWithZone:a3];
  unint64_t v11 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_mediaId copyWithZone:a3];
  double v13 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v12;

  char v14 = (char)self->_has;
  if ((v14 & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_mediaType;
    *(unsigned char *)(v6 + 68) |= 8u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_algorithm;
    *(unsigned char *)(v6 + 68) |= 4u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[16] = self->_type;
    *((unsigned char *)v4 + 68) |= 0x10u;
  }
  uint64_t v7 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_secondsFromUnixEpoch;
    *((unsigned char *)v4 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_quantizedScore;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  if (self->_sourceBundleId)
  {
    objc_msgSend(v7, "setSourceBundleId:");
    id v4 = v7;
  }
  if (self->_mediaId)
  {
    objc_msgSend(v7, "setMediaId:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    v4[12] = self->_mediaType;
    *((unsigned char *)v4 + 68) |= 8u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[6] = self->_algorithm;
    *((unsigned char *)v4 + 68) |= 4u;
  }
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_label) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_sourceBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_mediaId) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBMusicDataCollectionRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    id v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v7 = [NSNumber numberWithDouble:self->_secondsFromUnixEpoch];
    [v3 setObject:v7 forKey:@"secondsFromUnixEpoch"];

    char has = (char)self->_has;
  }
  if (has)
  {
    double v8 = [NSNumber numberWithDouble:self->_quantizedScore];
    [v3 setObject:v8 forKey:@"quantizedScore"];
  }
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId) {
    [v3 setObject:sourceBundleId forKey:@"sourceBundleId"];
  }
  mediaId = self->_mediaId;
  if (mediaId) {
    [v3 setObject:mediaId forKey:@"mediaId"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    uint64_t v12 = [NSNumber numberWithInt:self->_mediaType];
    [v3 setObject:v12 forKey:@"mediaType"];

    char v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    double v13 = [NSNumber numberWithInt:self->_algorithm];
    [v3 setObject:v13 forKey:@"algorithm"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBMusicDataCollectionRecord;
  id v4 = [(PPPBMusicDataCollectionRecord *)&v8 description];
  char v5 = [(PPPBMusicDataCollectionRecord *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAlgorithm
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setAlgorithm:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_algorithm = a3;
}

- (BOOL)hasMediaType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasMediaType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setMediaType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_mediaType = a3;
}

- (BOOL)hasMediaId
{
  return self->_mediaId != 0;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (BOOL)hasQuantizedScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasQuantizedScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setQuantizedScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double quantizedScore = a3;
}

- (BOOL)hasSecondsFromUnixEpoch
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSecondsFromUnixEpoch:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSecondsFromUnixEpoch:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double secondsFromUnixEpoch = a3;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

+ (id)options
{
  if (options_once_4991 != -1) {
    dispatch_once(&options_once_4991, &__block_literal_global_4992);
  }
  v2 = (void *)options_sOptions_4993;
  return v2;
}

void __40__PPPBMusicDataCollectionRecord_options__block_invoke()
{
  v0 = (void *)options_sOptions_4993;
  options_sOptions_4993 = (uint64_t)&unk_1F256B050;
}

@end