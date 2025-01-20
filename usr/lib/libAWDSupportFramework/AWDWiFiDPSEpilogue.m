@interface AWDWiFiDPSEpilogue
+ (Class)accessPointInfoType;
+ (Class)associationChangesType;
- (AWDWADiagnosisActionAssociationDifferences)changes;
- (AWDWAPeerDiscoveryInfo)discoveredPeerInfo;
- (AWDWAQuickDpsStats)qDpsStats;
- (AWDWASymptomsDnsStats)symptomsDnsStats;
- (BOOL)hasAction;
- (BOOL)hasActionIntVal;
- (BOOL)hasAfterRecommendedAction;
- (BOOL)hasBeforeAction;
- (BOOL)hasChanges;
- (BOOL)hasDiscoveredPeerInfo;
- (BOOL)hasIsAssociatedAtStudyEnd;
- (BOOL)hasQDpsStats;
- (BOOL)hasStudyType;
- (BOOL)hasSymptomsDnsStats;
- (BOOL)hasTimestamp;
- (BOOL)isAssociatedAtStudyEnd;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)accessPointInfos;
- (NSMutableArray)associationChanges;
- (id)accessPointInfoAtIndex:(unint64_t)a3;
- (id)actionAsString:(int)a3;
- (id)afterRecommendedActionAsString:(int)a3;
- (id)associationChangesAtIndex:(unint64_t)a3;
- (id)beforeActionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)studyTypeAsString:(int)a3;
- (int)StringAsAction:(id)a3;
- (int)StringAsAfterRecommendedAction:(id)a3;
- (int)StringAsBeforeAction:(id)a3;
- (int)StringAsStudyType:(id)a3;
- (int)action;
- (int)afterRecommendedAction;
- (int)beforeAction;
- (int)studyType;
- (unint64_t)accessPointInfosCount;
- (unint64_t)associationChangesCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)actionIntVal;
- (void)addAccessPointInfo:(id)a3;
- (void)addAssociationChanges:(id)a3;
- (void)clearAccessPointInfos;
- (void)clearAssociationChanges;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessPointInfos:(id)a3;
- (void)setAction:(int)a3;
- (void)setActionIntVal:(unsigned int)a3;
- (void)setAfterRecommendedAction:(int)a3;
- (void)setAssociationChanges:(id)a3;
- (void)setBeforeAction:(int)a3;
- (void)setChanges:(id)a3;
- (void)setDiscoveredPeerInfo:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasActionIntVal:(BOOL)a3;
- (void)setHasAfterRecommendedAction:(BOOL)a3;
- (void)setHasBeforeAction:(BOOL)a3;
- (void)setHasIsAssociatedAtStudyEnd:(BOOL)a3;
- (void)setHasStudyType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsAssociatedAtStudyEnd:(BOOL)a3;
- (void)setQDpsStats:(id)a3;
- (void)setStudyType:(int)a3;
- (void)setSymptomsDnsStats:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiDPSEpilogue

- (void)dealloc
{
  [(AWDWiFiDPSEpilogue *)self setChanges:0];
  [(AWDWiFiDPSEpilogue *)self setAssociationChanges:0];
  [(AWDWiFiDPSEpilogue *)self setQDpsStats:0];
  [(AWDWiFiDPSEpilogue *)self setSymptomsDnsStats:0];
  [(AWDWiFiDPSEpilogue *)self setDiscoveredPeerInfo:0];
  [(AWDWiFiDPSEpilogue *)self setAccessPointInfos:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSEpilogue;
  [(AWDWiFiDPSEpilogue *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)beforeAction
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_beforeAction;
  }
  else {
    return 0;
  }
}

- (void)setBeforeAction:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_beforeAction = a3;
}

- (void)setHasBeforeAction:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBeforeAction
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)beforeActionAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA2B0[a3];
  }
}

- (int)StringAsBeforeAction:(id)a3
{
  if ([a3 isEqualToString:@"kAllAcFunctional"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kSomeAcFunctional"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kNoAcFunctional"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kNotAssociated"]) {
    return 3;
  }
  return 0;
}

- (int)action
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 > 15)
  {
    if (a3 > 63)
    {
      if (a3 == 64) {
        return @"kSymptomsdDPSWatchdog";
      }
      if (a3 == 128) {
        return @"kSymptomsdDPSReassoc";
      }
    }
    else
    {
      if (a3 == 16) {
        return @"kNoneNoFastWatchdogBudget";
      }
      if (a3 == 32) {
        return @"kUserChanged";
      }
    }
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id result = @"kNone";
    switch(a3)
    {
      case 0:
        return result;
      case 2:
        id result = @"kFullWatchdog";
        break;
      case 4:
        id result = @"kFastDPSWatchdog";
        break;
      case 8:
        id result = @"kNoneNoFullWatchdogBudget";
        break;
      default:
        return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  return result;
}

- (int)StringAsAction:(id)a3
{
  if ([a3 isEqualToString:@"kNone"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kFullWatchdog"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kFastDPSWatchdog"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"kNoneNoFullWatchdogBudget"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"kNoneNoFastWatchdogBudget"]) {
    return 16;
  }
  if ([a3 isEqualToString:@"kUserChanged"]) {
    return 32;
  }
  if ([a3 isEqualToString:@"kSymptomsdDPSWatchdog"]) {
    return 64;
  }
  if ([a3 isEqualToString:@"kSymptomsdDPSReassoc"]) {
    return 128;
  }
  return 0;
}

- (int)afterRecommendedAction
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_afterRecommendedAction;
  }
  else {
    return 0;
  }
}

- (void)setAfterRecommendedAction:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_afterRecommendedAction = a3;
}

- (void)setHasAfterRecommendedAction:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAfterRecommendedAction
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)afterRecommendedActionAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA2B0[a3];
  }
}

- (int)StringAsAfterRecommendedAction:(id)a3
{
  if ([a3 isEqualToString:@"kAllAcFunctional"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kSomeAcFunctional"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kNoAcFunctional"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kNotAssociated"]) {
    return 3;
  }
  return 0;
}

- (BOOL)hasChanges
{
  return self->_changes != 0;
}

- (void)clearAssociationChanges
{
}

- (void)addAssociationChanges:(id)a3
{
  associationChanges = self->_associationChanges;
  if (!associationChanges)
  {
    associationChanges = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_associationChanges = associationChanges;
  }

  [(NSMutableArray *)associationChanges addObject:a3];
}

- (unint64_t)associationChangesCount
{
  return [(NSMutableArray *)self->_associationChanges count];
}

- (id)associationChangesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_associationChanges objectAtIndex:a3];
}

+ (Class)associationChangesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasQDpsStats
{
  return self->_qDpsStats != 0;
}

- (void)setActionIntVal:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_actionIntVal = a3;
}

- (void)setHasActionIntVal:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActionIntVal
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)studyType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_studyType;
  }
  else {
    return 0;
  }
}

- (void)setStudyType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_studyType = a3;
}

- (void)setHasStudyType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStudyType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)studyTypeAsString:(int)a3
{
  if (!a3) {
    return @"kDPEStudyTypeDataStall";
  }
  if (a3 == 1) {
    return @"kDPEStudyTypeSymptomsDps";
  }
  return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsStudyType:(id)a3
{
  if ([a3 isEqualToString:@"kDPEStudyTypeDataStall"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"kDPEStudyTypeSymptomsDps"];
  }
}

- (void)setIsAssociatedAtStudyEnd:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isAssociatedAtStudyEnd = a3;
}

- (void)setHasIsAssociatedAtStudyEnd:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsAssociatedAtStudyEnd
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasSymptomsDnsStats
{
  return self->_symptomsDnsStats != 0;
}

- (BOOL)hasDiscoveredPeerInfo
{
  return self->_discoveredPeerInfo != 0;
}

- (void)clearAccessPointInfos
{
}

- (void)addAccessPointInfo:(id)a3
{
  accessPointInfos = self->_accessPointInfos;
  if (!accessPointInfos)
  {
    accessPointInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_accessPointInfos = accessPointInfos;
  }

  [(NSMutableArray *)accessPointInfos addObject:a3];
}

- (unint64_t)accessPointInfosCount
{
  return [(NSMutableArray *)self->_accessPointInfos count];
}

- (id)accessPointInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_accessPointInfos objectAtIndex:a3];
}

+ (Class)accessPointInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSEpilogue;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiDPSEpilogue description](&v3, sel_description), -[AWDWiFiDPSEpilogue dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  uint64_t beforeAction = self->_beforeAction;
  if (beforeAction >= 4) {
    v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_beforeAction];
  }
  else {
    v6 = off_2641BA2B0[beforeAction];
  }
  [v3 setObject:v6 forKey:@"beforeAction"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_31;
    }
    goto LABEL_27;
  }
LABEL_11:
  int action = self->_action;
  if (action > 15)
  {
    if (action > 63)
    {
      if (action == 64)
      {
        v8 = @"kSymptomsdDPSWatchdog";
        goto LABEL_26;
      }
      if (action == 128)
      {
        v8 = @"kSymptomsdDPSReassoc";
        goto LABEL_26;
      }
    }
    else
    {
      if (action == 16)
      {
        v8 = @"kNoneNoFastWatchdogBudget";
        goto LABEL_26;
      }
      if (action == 32)
      {
        v8 = @"kUserChanged";
        goto LABEL_26;
      }
    }
LABEL_25:
    v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_action];
  }
  else
  {
    v8 = @"kNone";
    switch(action)
    {
      case 0:
        break;
      case 2:
        v8 = @"kFullWatchdog";
        break;
      case 4:
        v8 = @"kFastDPSWatchdog";
        break;
      case 8:
        v8 = @"kNoneNoFullWatchdogBudget";
        break;
      default:
        goto LABEL_25;
    }
  }
LABEL_26:
  [v3 setObject:v8 forKey:@"action"];
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  uint64_t afterRecommendedAction = self->_afterRecommendedAction;
  if (afterRecommendedAction >= 4) {
    v10 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_afterRecommendedAction];
  }
  else {
    v10 = off_2641BA2B0[afterRecommendedAction];
  }
  [v3 setObject:v10 forKey:@"afterRecommendedAction"];
LABEL_31:
  changes = self->_changes;
  if (changes) {
    [v3 setObject:-[AWDWADiagnosisActionAssociationDifferences dictionaryRepresentation](changes, "dictionaryRepresentation") forKey:@"changes"];
  }
  if ([(NSMutableArray *)self->_associationChanges count])
  {
    v12 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_associationChanges, "count")];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    associationChanges = self->_associationChanges;
    uint64_t v14 = [(NSMutableArray *)associationChanges countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(associationChanges);
          }
          [v12 addObject:[*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v15 = [(NSMutableArray *)associationChanges countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v15);
    }
    [v3 setObject:v12 forKey:@"associationChanges"];
  }
  qDpsStats = self->_qDpsStats;
  if (qDpsStats) {
    [v3 setObject:[[-[AWDWAQuickDpsStats dictionaryRepresentation](qDpsStats, "dictionaryRepresentation")] forKey:@"qDpsStats"];
  }
  char v19 = (char)self->_has;
  if ((v19 & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_actionIntVal] forKey:@"actionIntVal"];
    char v19 = (char)self->_has;
    if ((v19 & 0x20) == 0)
    {
LABEL_46:
      if ((v19 & 0x40) == 0) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_46;
  }
  int studyType = self->_studyType;
  if (studyType)
  {
    if (studyType == 1) {
      v30 = @"kDPEStudyTypeSymptomsDps";
    }
    else {
      v30 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_studyType];
    }
  }
  else
  {
    v30 = @"kDPEStudyTypeDataStall";
  }
  [v3 setObject:v30 forKey:@"studyType"];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_47:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_isAssociatedAtStudyEnd] forKey:@"isAssociatedAtStudyEnd"];
LABEL_48:
  symptomsDnsStats = self->_symptomsDnsStats;
  if (symptomsDnsStats) {
    [v3 setObject:-[AWDWASymptomsDnsStats dictionaryRepresentation](symptomsDnsStats, "dictionaryRepresentation") forKey:@"symptomsDnsStats"];
  }
  discoveredPeerInfo = self->_discoveredPeerInfo;
  if (discoveredPeerInfo) {
    [v3 setObject:discoveredPeerInfo dictionaryRepresentation forKey:@"discoveredPeerInfo"];
  }
  if ([(NSMutableArray *)self->_accessPointInfos count])
  {
    v22 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_accessPointInfos, "count")];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    accessPointInfos = self->_accessPointInfos;
    uint64_t v24 = [(NSMutableArray *)accessPointInfos countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(accessPointInfos);
          }
          [v22 addObject:[v31 dictionaryRepresentation]];
        }
        uint64_t v25 = [(NSMutableArray *)accessPointInfos countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v25);
    }
    [v3 setObject:v22 forKey:@"accessPointInfo"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSEpilogueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  if (self->_changes) {
    PBDataWriterWriteSubmessage();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  associationChanges = self->_associationChanges;
  uint64_t v6 = [(NSMutableArray *)associationChanges countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(associationChanges);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)associationChanges countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  if (self->_qDpsStats) {
    PBDataWriterWriteSubmessage();
  }
  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v10 = (char)self->_has;
    if ((v10 & 0x20) == 0)
    {
LABEL_19:
      if ((v10 & 0x40) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_20:
  }
    PBDataWriterWriteBOOLField();
LABEL_21:
  if (self->_symptomsDnsStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_discoveredPeerInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  accessPointInfos = self->_accessPointInfos;
  uint64_t v12 = [(NSMutableArray *)accessPointInfos countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(accessPointInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)accessPointInfos countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 100) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 12) = self->_beforeAction;
  *((unsigned char *)a3 + 100) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_29:
  *((_DWORD *)a3 + 6) = self->_action;
  *((unsigned char *)a3 + 100) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 8) = self->_afterRecommendedAction;
    *((unsigned char *)a3 + 100) |= 8u;
  }
LABEL_6:
  if (self->_changes) {
    [a3 setChanges:];
  }
  if ([(AWDWiFiDPSEpilogue *)self associationChangesCount])
  {
    [a3 clearAssociationChanges];
    unint64_t v6 = [(AWDWiFiDPSEpilogue *)self associationChangesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addAssociationChanges:-[AWDWiFiDPSEpilogue associationChangesAtIndex:](self, "associationChangesAtIndex:", i)];
    }
  }
  if (self->_qDpsStats) {
    [a3 setQDpsStats:];
  }
  char v9 = (char)self->_has;
  if ((v9 & 4) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_actionIntVal;
    *((unsigned char *)a3 + 100) |= 4u;
    char v9 = (char)self->_has;
    if ((v9 & 0x20) == 0)
    {
LABEL_16:
      if ((v9 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 20) = self->_studyType;
  *((unsigned char *)a3 + 100) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    *((unsigned char *)a3 + 96) = self->_isAssociatedAtStudyEnd;
    *((unsigned char *)a3 + 100) |= 0x40u;
  }
LABEL_18:
  if (self->_symptomsDnsStats) {
    [a3 setSymptomsDnsStats:];
  }
  if (self->_discoveredPeerInfo) {
    [a3 setDiscoveredPeerInfo:];
  }
  if ([(AWDWiFiDPSEpilogue *)self accessPointInfosCount])
  {
    [a3 clearAccessPointInfos];
    unint64_t v10 = [(AWDWiFiDPSEpilogue *)self accessPointInfosCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addAccessPointInfo:-[AWDWiFiDPSEpilogue accessPointInfoAtIndex:](self, "accessPointInfoAtIndex:", j)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 100) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_beforeAction;
  *(unsigned char *)(v5 + 100) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  *(_DWORD *)(v5 + 24) = self->_action;
  *(unsigned char *)(v5 + 100) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_afterRecommendedAction;
    *(unsigned char *)(v5 + 100) |= 8u;
  }
LABEL_6:

  *(void *)(v6 + 56) = [(AWDWADiagnosisActionAssociationDifferences *)self->_changes copyWithZone:a3];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  associationChanges = self->_associationChanges;
  uint64_t v9 = [(NSMutableArray *)associationChanges countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(associationChanges);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addAssociationChanges:v13];
      }
      uint64_t v10 = [(NSMutableArray *)associationChanges countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  *(void *)(v6 + 72) = [(AWDWAQuickDpsStats *)self->_qDpsStats copyWithZone:a3];
  char v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_actionIntVal;
    *(unsigned char *)(v6 + 100) |= 4u;
    char v14 = (char)self->_has;
    if ((v14 & 0x20) == 0)
    {
LABEL_15:
      if ((v14 & 0x40) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 80) = self->_studyType;
  *(unsigned char *)(v6 + 100) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_16:
    *(unsigned char *)(v6 + 96) = self->_isAssociatedAtStudyEnd;
    *(unsigned char *)(v6 + 100) |= 0x40u;
  }
LABEL_17:

  *(void *)(v6 + 88) = [(AWDWASymptomsDnsStats *)self->_symptomsDnsStats copyWithZone:a3];
  *(void *)(v6 + 64) = [(AWDWAPeerDiscoveryInfo *)self->_discoveredPeerInfo copyWithZone:a3];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  accessPointInfos = self->_accessPointInfos;
  uint64_t v16 = [(NSMutableArray *)accessPointInfos countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(accessPointInfos);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addAccessPointInfo:v20];
      }
      uint64_t v17 = [(NSMutableArray *)accessPointInfos countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 100) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)a3 + 100))
    {
      goto LABEL_42;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 100) & 0x10) == 0 || self->_beforeAction != *((_DWORD *)a3 + 12)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 100) & 0x10) != 0)
    {
      goto LABEL_42;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 100) & 2) == 0 || self->_action != *((_DWORD *)a3 + 6)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 100) & 2) != 0)
    {
      goto LABEL_42;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 100) & 8) == 0 || self->_afterRecommendedAction != *((_DWORD *)a3 + 8)) {
        goto LABEL_42;
      }
    }
    else if ((*((unsigned char *)a3 + 100) & 8) != 0)
    {
      goto LABEL_42;
    }
    changes = self->_changes;
    if (!((unint64_t)changes | *((void *)a3 + 7))
      || (int v5 = -[AWDWADiagnosisActionAssociationDifferences isEqual:](changes, "isEqual:")) != 0)
    {
      associationChanges = self->_associationChanges;
      if (!((unint64_t)associationChanges | *((void *)a3 + 5))
        || (int v5 = -[NSMutableArray isEqual:](associationChanges, "isEqual:")) != 0)
      {
        qDpsStats = self->_qDpsStats;
        if (!((unint64_t)qDpsStats | *((void *)a3 + 9))
          || (int v5 = -[AWDWAQuickDpsStats isEqual:](qDpsStats, "isEqual:")) != 0)
        {
          if ((*(unsigned char *)&self->_has & 4) != 0)
          {
            if ((*((unsigned char *)a3 + 100) & 4) == 0 || self->_actionIntVal != *((_DWORD *)a3 + 7)) {
              goto LABEL_42;
            }
          }
          else if ((*((unsigned char *)a3 + 100) & 4) != 0)
          {
            goto LABEL_42;
          }
          if ((*(unsigned char *)&self->_has & 0x20) != 0)
          {
            if ((*((unsigned char *)a3 + 100) & 0x20) == 0 || self->_studyType != *((_DWORD *)a3 + 20)) {
              goto LABEL_42;
            }
          }
          else if ((*((unsigned char *)a3 + 100) & 0x20) != 0)
          {
            goto LABEL_42;
          }
          if ((*(unsigned char *)&self->_has & 0x40) != 0)
          {
            if ((*((unsigned char *)a3 + 100) & 0x40) != 0)
            {
              if (self->_isAssociatedAtStudyEnd)
              {
                if (!*((unsigned char *)a3 + 96)) {
                  goto LABEL_42;
                }
                goto LABEL_48;
              }
              if (!*((unsigned char *)a3 + 96))
              {
LABEL_48:
                symptomsDnsStats = self->_symptomsDnsStats;
                if (!((unint64_t)symptomsDnsStats | *((void *)a3 + 11))
                  || (int v5 = -[AWDWASymptomsDnsStats isEqual:](symptomsDnsStats, "isEqual:")) != 0)
                {
                  discoveredPeerInfo = self->_discoveredPeerInfo;
                  if (!((unint64_t)discoveredPeerInfo | *((void *)a3 + 8))
                    || (int v5 = -[AWDWAPeerDiscoveryInfo isEqual:](discoveredPeerInfo, "isEqual:")) != 0)
                  {
                    accessPointInfos = self->_accessPointInfos;
                    if ((unint64_t)accessPointInfos | *((void *)a3 + 2))
                    {
                      LOBYTE(v5) = -[NSMutableArray isEqual:](accessPointInfos, "isEqual:");
                    }
                    else
                    {
                      LOBYTE(v5) = 1;
                    }
                  }
                }
                return v5;
              }
            }
          }
          else if ((*((unsigned char *)a3 + 100) & 0x40) == 0)
          {
            goto LABEL_48;
          }
LABEL_42:
          LOBYTE(v5) = 0;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_beforeAction;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_action;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_afterRecommendedAction;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  unint64_t v7 = [(AWDWADiagnosisActionAssociationDifferences *)self->_changes hash];
  uint64_t v8 = [(NSMutableArray *)self->_associationChanges hash];
  unint64_t v9 = [(AWDWAQuickDpsStats *)self->_qDpsStats hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  uint64_t v10 = 2654435761 * self->_actionIntVal;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v11 = 2654435761 * self->_studyType;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_isAssociatedAtStudyEnd;
LABEL_17:
  unint64_t v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v14 = v10 ^ v11 ^ v12 ^ [(AWDWASymptomsDnsStats *)self->_symptomsDnsStats hash];
  unint64_t v15 = v13 ^ v14 ^ [(AWDWAPeerDiscoveryInfo *)self->_discoveredPeerInfo hash];
  return v15 ^ [(NSMutableArray *)self->_accessPointInfos hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 100);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 100);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 100) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t beforeAction = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 100);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_int action = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 100) & 8) != 0)
  {
LABEL_5:
    self->_uint64_t afterRecommendedAction = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  changes = self->_changes;
  uint64_t v7 = *((void *)a3 + 7);
  if (changes)
  {
    if (v7) {
      -[AWDWADiagnosisActionAssociationDifferences mergeFrom:](changes, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDWiFiDPSEpilogue setChanges:](self, "setChanges:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = (void *)*((void *)a3 + 5);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        [(AWDWiFiDPSEpilogue *)self addAssociationChanges:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }
  qDpsStats = self->_qDpsStats;
  uint64_t v14 = *((void *)a3 + 9);
  if (qDpsStats)
  {
    if (v14) {
      -[AWDWAQuickDpsStats mergeFrom:](qDpsStats, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[AWDWiFiDPSEpilogue setQDpsStats:](self, "setQDpsStats:");
  }
  char v15 = *((unsigned char *)a3 + 100);
  if ((v15 & 4) != 0)
  {
    self->_actionIntVal = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v15 = *((unsigned char *)a3 + 100);
    if ((v15 & 0x20) == 0)
    {
LABEL_29:
      if ((v15 & 0x40) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)a3 + 100) & 0x20) == 0)
  {
    goto LABEL_29;
  }
  self->_int studyType = *((_DWORD *)a3 + 20);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 100) & 0x40) != 0)
  {
LABEL_30:
    self->_isAssociatedAtStudyEnd = *((unsigned char *)a3 + 96);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_31:
  symptomsDnsStats = self->_symptomsDnsStats;
  uint64_t v17 = *((void *)a3 + 11);
  if (symptomsDnsStats)
  {
    if (v17) {
      -[AWDWASymptomsDnsStats mergeFrom:](symptomsDnsStats, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[AWDWiFiDPSEpilogue setSymptomsDnsStats:](self, "setSymptomsDnsStats:");
  }
  discoveredPeerInfo = self->_discoveredPeerInfo;
  uint64_t v19 = *((void *)a3 + 8);
  if (discoveredPeerInfo)
  {
    if (v19) {
      -[AWDWAPeerDiscoveryInfo mergeFrom:](discoveredPeerInfo, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[AWDWiFiDPSEpilogue setDiscoveredPeerInfo:](self, "setDiscoveredPeerInfo:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v20 = (void *)*((void *)a3 + 2);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        [(AWDWiFiDPSEpilogue *)self addAccessPointInfo:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v22);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWADiagnosisActionAssociationDifferences)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
}

- (NSMutableArray)associationChanges
{
  return self->_associationChanges;
}

- (void)setAssociationChanges:(id)a3
{
}

- (AWDWAQuickDpsStats)qDpsStats
{
  return self->_qDpsStats;
}

- (void)setQDpsStats:(id)a3
{
}

- (unsigned)actionIntVal
{
  return self->_actionIntVal;
}

- (BOOL)isAssociatedAtStudyEnd
{
  return self->_isAssociatedAtStudyEnd;
}

- (AWDWASymptomsDnsStats)symptomsDnsStats
{
  return self->_symptomsDnsStats;
}

- (void)setSymptomsDnsStats:(id)a3
{
}

- (AWDWAPeerDiscoveryInfo)discoveredPeerInfo
{
  return self->_discoveredPeerInfo;
}

- (void)setDiscoveredPeerInfo:(id)a3
{
}

- (NSMutableArray)accessPointInfos
{
  return self->_accessPointInfos;
}

- (void)setAccessPointInfos:(id)a3
{
}

@end