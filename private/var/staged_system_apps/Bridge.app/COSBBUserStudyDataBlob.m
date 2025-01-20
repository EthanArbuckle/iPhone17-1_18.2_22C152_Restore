@interface COSBBUserStudyDataBlob
+ (Class)resultsType;
- (BOOL)hasDetectedConfidence;
- (BOOL)hasDetectedCrownOrientation;
- (BOOL)hasDetectedRightWrist;
- (BOOL)hasPhoneProductType;
- (BOOL)hasReportedCrownOrientation;
- (BOOL)hasReportedRightWrist;
- (BOOL)hasUserStudyVersion;
- (BOOL)hasVersion;
- (BOOL)hasWatchMaterial;
- (BOOL)hasWatchProductType;
- (BOOL)hasWatchSizeClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)results;
- (NSString)phoneProductType;
- (NSString)watchProductType;
- (double)detectedConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)resultsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (unsigned)detectedCrownOrientation;
- (unsigned)detectedRightWrist;
- (unsigned)reportedCrownOrientation;
- (unsigned)reportedRightWrist;
- (unsigned)userStudyVersion;
- (unsigned)version;
- (unsigned)watchMaterial;
- (unsigned)watchSizeClass;
- (void)addResults:(id)a3;
- (void)clearResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetectedConfidence:(double)a3;
- (void)setDetectedCrownOrientation:(unsigned int)a3;
- (void)setDetectedRightWrist:(unsigned int)a3;
- (void)setHasDetectedConfidence:(BOOL)a3;
- (void)setHasDetectedCrownOrientation:(BOOL)a3;
- (void)setHasDetectedRightWrist:(BOOL)a3;
- (void)setHasReportedCrownOrientation:(BOOL)a3;
- (void)setHasReportedRightWrist:(BOOL)a3;
- (void)setHasUserStudyVersion:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasWatchMaterial:(BOOL)a3;
- (void)setHasWatchSizeClass:(BOOL)a3;
- (void)setPhoneProductType:(id)a3;
- (void)setReportedCrownOrientation:(unsigned int)a3;
- (void)setReportedRightWrist:(unsigned int)a3;
- (void)setResults:(id)a3;
- (void)setUserStudyVersion:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWatchMaterial:(unsigned int)a3;
- (void)setWatchProductType:(id)a3;
- (void)setWatchSizeClass:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation COSBBUserStudyDataBlob

- (void)setVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasVersion
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setReportedRightWrist:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_reportedRightWrist = a3;
}

- (void)setHasReportedRightWrist:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasReportedRightWrist
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setReportedCrownOrientation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_reportedCrownOrientation = a3;
}

- (void)setHasReportedCrownOrientation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasReportedCrownOrientation
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setUserStudyVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_userStudyVersion = a3;
}

- (void)setHasUserStudyVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasUserStudyVersion
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setWatchSizeClass:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_watchSizeClass = a3;
}

- (void)setHasWatchSizeClass:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWatchSizeClass
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWatchMaterial:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_watchMaterial = a3;
}

- (void)setHasWatchMaterial:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasWatchMaterial
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasWatchProductType
{
  return self->_watchProductType != 0;
}

- (BOOL)hasPhoneProductType
{
  return self->_phoneProductType != 0;
}

- (void)setDetectedRightWrist:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_detectedRightWrist = a3;
}

- (void)setHasDetectedRightWrist:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDetectedRightWrist
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDetectedConfidence:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_detectedConfidence = a3;
}

- (void)setHasDetectedConfidence:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDetectedConfidence
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDetectedCrownOrientation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_detectedCrownOrientation = a3;
}

- (void)setHasDetectedCrownOrientation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDetectedCrownOrientation
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)clearResults
{
}

- (void)addResults:(id)a3
{
  id v4 = a3;
  results = self->_results;
  id v8 = v4;
  if (!results)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_results;
    self->_results = v6;

    id v4 = v8;
    results = self->_results;
  }
  [(NSMutableArray *)results addObject:v4];
}

- (unint64_t)resultsCount
{
  return (unint64_t)[(NSMutableArray *)self->_results count];
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_results objectAtIndex:a3];
}

+ (Class)resultsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)COSBBUserStudyDataBlob;
  __int16 v3 = [(COSBBUserStudyDataBlob *)&v7 description];
  id v4 = [(COSBBUserStudyDataBlob *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v18 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v18 forKey:@"version"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v19 = +[NSNumber numberWithUnsignedInt:self->_reportedRightWrist];
  [v3 setObject:v19 forKey:@"reportedRightWrist"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  v20 = +[NSNumber numberWithUnsignedInt:self->_reportedCrownOrientation];
  [v3 setObject:v20 forKey:@"reportedCrownOrientation"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  v21 = +[NSNumber numberWithUnsignedInt:self->_userStudyVersion];
  [v3 setObject:v21 forKey:@"userStudyVersion"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_32:
  v22 = +[NSNumber numberWithUnsignedInt:self->_watchSizeClass];
  [v3 setObject:v22 forKey:@"watchSizeClass"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    v5 = +[NSNumber numberWithUnsignedInt:self->_watchMaterial];
    [v3 setObject:v5 forKey:@"watchMaterial"];
  }
LABEL_8:
  watchProductType = self->_watchProductType;
  if (watchProductType) {
    [v3 setObject:watchProductType forKey:@"watchProductType"];
  }
  phoneProductType = self->_phoneProductType;
  if (phoneProductType) {
    [v3 setObject:phoneProductType forKey:@"phoneProductType"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    v23 = +[NSNumber numberWithUnsignedInt:self->_detectedRightWrist];
    [v3 setObject:v23 forKey:@"detectedRightWrist"];

    __int16 v8 = (__int16)self->_has;
    if ((v8 & 1) == 0)
    {
LABEL_14:
      if ((v8 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v8 & 1) == 0)
  {
    goto LABEL_14;
  }
  v24 = +[NSNumber numberWithDouble:self->_detectedConfidence];
  [v3 setObject:v24 forKey:@"detectedConfidence"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_15:
    v9 = +[NSNumber numberWithUnsignedInt:self->_detectedCrownOrientation];
    [v3 setObject:v9 forKey:@"detectedCrownOrientation"];
  }
LABEL_16:
  if ([(NSMutableArray *)self->_results count])
  {
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_results, "count")];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v11 = self->_results;
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [(*(id *)(*((void *)&v25 + 1) + 8 * i)) dictionaryRepresentation:v25];
          [v10 addObject:v16];
        }
        id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"results"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COSBBUserStudyDataBlobReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  if (self->_watchProductType) {
    PBDataWriterWriteStringField();
  }
  if (self->_phoneProductType) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_14:
      if ((v6 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 2) != 0) {
LABEL_15:
  }
    PBDataWriterWriteUint32Field();
LABEL_16:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v7 = self->_results;
  __int16 v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[13] = self->_version;
    *((_WORD *)v4 + 38) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = self->_reportedRightWrist;
  *((_WORD *)v4 + 38) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[8] = self->_reportedCrownOrientation;
  *((_WORD *)v4 + 38) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[12] = self->_userStudyVersion;
  *((_WORD *)v4 + 38) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_27:
  v4[18] = self->_watchSizeClass;
  *((_WORD *)v4 + 38) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    v4[14] = self->_watchMaterial;
    *((_WORD *)v4 + 38) |= 0x80u;
  }
LABEL_8:
  v11 = v4;
  if (self->_watchProductType)
  {
    [v4 setWatchProductType:];
    id v4 = v11;
  }
  if (self->_phoneProductType)
  {
    [v11 setPhoneProductType:];
    id v4 = v11;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_30:
    *((void *)v4 + 1) = *(void *)&self->_detectedConfidence;
    *((_WORD *)v4 + 38) |= 1u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v4[5] = self->_detectedRightWrist;
  *((_WORD *)v4 + 38) |= 4u;
  __int16 v6 = (__int16)self->_has;
  if (v6) {
    goto LABEL_30;
  }
LABEL_14:
  if ((v6 & 2) != 0)
  {
LABEL_15:
    v4[4] = self->_detectedCrownOrientation;
    *((_WORD *)v4 + 38) |= 2u;
  }
LABEL_16:
  if ([(COSBBUserStudyDataBlob *)self resultsCount])
  {
    [v11 clearResults];
    unint64_t v7 = [(COSBBUserStudyDataBlob *)self resultsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(COSBBUserStudyDataBlob *)self resultsAtIndex:i];
        [v11 addResults:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v5[13] = self->_version;
    *((_WORD *)v5 + 38) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[9] = self->_reportedRightWrist;
  *((_WORD *)v5 + 38) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  v5[8] = self->_reportedCrownOrientation;
  *((_WORD *)v5 + 38) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  v5[12] = self->_userStudyVersion;
  *((_WORD *)v5 + 38) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_24:
  v5[18] = self->_watchSizeClass;
  *((_WORD *)v5 + 38) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    v5[14] = self->_watchMaterial;
    *((_WORD *)v5 + 38) |= 0x80u;
  }
LABEL_8:
  id v8 = [(NSString *)self->_watchProductType copyWithZone:a3];
  v9 = (void *)v6[8];
  v6[8] = v8;

  id v10 = [(NSString *)self->_phoneProductType copyWithZone:a3];
  v11 = (void *)v6[3];
  v6[3] = v10;

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 4) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_detectedRightWrist;
    *((_WORD *)v6 + 38) |= 4u;
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 1) == 0)
    {
LABEL_10:
      if ((v12 & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((v12 & 1) == 0)
  {
    goto LABEL_10;
  }
  v6[1] = *(void *)&self->_detectedConfidence;
  *((_WORD *)v6 + 38) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 4) = self->_detectedCrownOrientation;
    *((_WORD *)v6 + 38) |= 2u;
  }
LABEL_12:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_results;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v20 + 1) + 8 * i) copyWithZone:a3];
        [v6 addResults:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_version != *((_DWORD *)v4 + 13)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
LABEL_53:
    unsigned __int8 v12 = 0;
    goto LABEL_54;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_reportedRightWrist != *((_DWORD *)v4 + 9)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_reportedCrownOrientation != *((_DWORD *)v4 + 8)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_userStudyVersion != *((_DWORD *)v4 + 12)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_53;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_watchSizeClass != *((_DWORD *)v4 + 18)) {
      goto LABEL_53;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_watchMaterial != *((_DWORD *)v4 + 14)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_53;
  }
  watchProductType = self->_watchProductType;
  if ((unint64_t)watchProductType | *((void *)v4 + 8)
    && !-[NSString isEqual:](watchProductType, "isEqual:"))
  {
    goto LABEL_53;
  }
  phoneProductType = self->_phoneProductType;
  if ((unint64_t)phoneProductType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](phoneProductType, "isEqual:")) {
      goto LABEL_53;
    }
  }
  __int16 v9 = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 38);
  if ((v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_detectedRightWrist != *((_DWORD *)v4 + 5)) {
      goto LABEL_53;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_53;
  }
  if (v9)
  {
    if ((v10 & 1) == 0 || self->_detectedConfidence != *((double *)v4 + 1)) {
      goto LABEL_53;
    }
  }
  else if (v10)
  {
    goto LABEL_53;
  }
  if ((v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_detectedCrownOrientation != *((_DWORD *)v4 + 4)) {
      goto LABEL_53;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_53;
  }
  results = self->_results;
  if ((unint64_t)results | *((void *)v4 + 5)) {
    unsigned __int8 v12 = -[NSMutableArray isEqual:](results, "isEqual:");
  }
  else {
    unsigned __int8 v12 = 1;
  }
LABEL_54:

  return v12;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v21 = 2654435761 * self->_version;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v19 = 2654435761 * self->_reportedRightWrist;
      if ((has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_reportedCrownOrientation;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_userStudyVersion;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_watchSizeClass;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_watchMaterial;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = 0;
LABEL_14:
  NSUInteger v8 = [(NSString *)self->_watchProductType hash];
  NSUInteger v9 = [(NSString *)self->_phoneProductType hash];
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_detectedRightWrist;
    if (v10) {
      goto LABEL_16;
    }
LABEL_21:
    unint64_t v16 = 0;
    goto LABEL_24;
  }
  uint64_t v11 = 0;
  if ((v10 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_16:
  double detectedConfidence = self->_detectedConfidence;
  double v13 = -detectedConfidence;
  if (detectedConfidence >= 0.0) {
    double v13 = self->_detectedConfidence;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0) {
      v16 += (unint64_t)v15;
    }
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_24:
  if ((v10 & 2) != 0) {
    uint64_t v17 = 2654435761 * self->_detectedCrownOrientation;
  }
  else {
    uint64_t v17 = 0;
  }
  return v20 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16 ^ v17 ^ (unint64_t)[(NSMutableArray *)self->_results hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((v6 & 0x40) != 0)
  {
    self->_version = v4[13];
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v6 = *((_WORD *)v4 + 38);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_reportedRightWrist = v4[9];
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_reportedCrownOrientation = v4[8];
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((v6 & 0x20) == 0)
  {
LABEL_5:
    if ((v6 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_userStudyVersion = v4[12];
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((v6 & 0x100) == 0)
  {
LABEL_6:
    if ((v6 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_28:
  self->_watchSizeClass = v4[18];
  *(_WORD *)&self->_has |= 0x100u;
  if ((v4[19] & 0x80) != 0)
  {
LABEL_7:
    self->_watchMaterial = v4[14];
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_8:
  if (*((void *)v4 + 8)) {
    -[COSBBUserStudyDataBlob setWatchProductType:](self, "setWatchProductType:");
  }
  if (*((void *)v5 + 3)) {
    -[COSBBUserStudyDataBlob setPhoneProductType:](self, "setPhoneProductType:");
  }
  __int16 v7 = *((_WORD *)v5 + 38);
  if ((v7 & 4) != 0)
  {
    self->_detectedRightWrist = v5[5];
    *(_WORD *)&self->_has |= 4u;
    __int16 v7 = *((_WORD *)v5 + 38);
    if ((v7 & 1) == 0)
    {
LABEL_14:
      if ((v7 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_14;
  }
  self->_double detectedConfidence = *((double *)v5 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((v5[19] & 2) != 0)
  {
LABEL_15:
    self->_detectedCrownOrientation = v5[4];
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_16:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 5);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[COSBBUserStudyDataBlob addResults:](self, "addResults:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)reportedRightWrist
{
  return self->_reportedRightWrist;
}

- (unsigned)reportedCrownOrientation
{
  return self->_reportedCrownOrientation;
}

- (unsigned)userStudyVersion
{
  return self->_userStudyVersion;
}

- (unsigned)watchSizeClass
{
  return self->_watchSizeClass;
}

- (unsigned)watchMaterial
{
  return self->_watchMaterial;
}

- (NSString)watchProductType
{
  return self->_watchProductType;
}

- (void)setWatchProductType:(id)a3
{
}

- (NSString)phoneProductType
{
  return self->_phoneProductType;
}

- (void)setPhoneProductType:(id)a3
{
}

- (unsigned)detectedRightWrist
{
  return self->_detectedRightWrist;
}

- (double)detectedConfidence
{
  return self->_detectedConfidence;
}

- (unsigned)detectedCrownOrientation
{
  return self->_detectedCrownOrientation;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchProductType, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_phoneProductType, 0);
}

@end