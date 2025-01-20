@interface WiFiAnalyticsAWDWiFiDPSEpilogue
+ (Class)accessPointInfoType;
+ (Class)associationChangesType;
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
- (WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences)changes;
- (WiFiAnalyticsAWDWAPeerDiscoveryInfo)discoveredPeerInfo;
- (WiFiAnalyticsAWDWAQuickDpsStats)qDpsStats;
- (WiFiAnalyticsAWDWASymptomsDnsStats)symptomsDnsStats;
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

@implementation WiFiAnalyticsAWDWiFiDPSEpilogue

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
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264467148[a3];
  }
  return v3;
}

- (int)StringAsBeforeAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kAllAcFunctional"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"kSomeAcFunctional"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"kNoAcFunctional"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"kNotAssociated"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
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
  if (a3 <= 15)
  {
    int v4 = @"kNone";
    switch(a3)
    {
      case 0:
        goto LABEL_30;
      case 2:
        int v4 = @"kFullWatchdog";
        break;
      case 4:
        int v4 = @"kFastDPSWatchdog";
        break;
      case 8:
        int v4 = @"kNoneNoFullWatchdogBudget";
        break;
      default:
        goto LABEL_29;
    }
    return v4;
  }
  if (a3 > 63)
  {
    if (a3 == 64)
    {
      int v4 = @"kSymptomsdDPSWatchdog";
    }
    else
    {
      if (a3 != 128) {
        goto LABEL_29;
      }
      int v4 = @"kSymptomsdDPSReassoc";
    }
  }
  else
  {
    if (a3 != 16)
    {
      if (a3 == 32)
      {
        int v4 = @"kUserChanged";
        return v4;
      }
LABEL_29:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_30:
      return v4;
    }
    int v4 = @"kNoneNoFastWatchdogBudget";
  }
  return v4;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"kFullWatchdog"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"kFastDPSWatchdog"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"kNoneNoFullWatchdogBudget"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"kNoneNoFastWatchdogBudget"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"kUserChanged"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"kSymptomsdDPSWatchdog"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"kSymptomsdDPSReassoc"])
  {
    int v4 = 128;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
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
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264467148[a3];
  }
  return v3;
}

- (int)StringAsAfterRecommendedAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kAllAcFunctional"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"kSomeAcFunctional"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"kNoAcFunctional"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"kNotAssociated"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
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
  id v4 = a3;
  associationChanges = self->_associationChanges;
  id v8 = v4;
  if (!associationChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_associationChanges;
    self->_associationChanges = v6;

    id v4 = v8;
    associationChanges = self->_associationChanges;
  }
  [(NSMutableArray *)associationChanges addObject:v4];
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
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"kDPEStudyTypeSymptomsDps";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"kDPEStudyTypeDataStall";
  }
  return v4;
}

- (int)StringAsStudyType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kDPEStudyTypeDataStall"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"kDPEStudyTypeSymptomsDps"];
  }

  return v4;
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
  id v4 = a3;
  accessPointInfos = self->_accessPointInfos;
  id v8 = v4;
  if (!accessPointInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_accessPointInfos;
    self->_accessPointInfos = v6;

    id v4 = v8;
    accessPointInfos = self->_accessPointInfos;
  }
  [(NSMutableArray *)accessPointInfos addObject:v4];
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
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSEpilogue;
  id v4 = [(WiFiAnalyticsAWDWiFiDPSEpilogue *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiDPSEpilogue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

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
  if (beforeAction >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_beforeAction);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_264467148[beforeAction];
  }
  [v3 setObject:v7 forKey:@"beforeAction"];

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
        v9 = @"kSymptomsdDPSWatchdog";
        goto LABEL_26;
      }
      if (action == 128)
      {
        v9 = @"kSymptomsdDPSReassoc";
        goto LABEL_26;
      }
    }
    else
    {
      if (action == 16)
      {
        v9 = @"kNoneNoFastWatchdogBudget";
        goto LABEL_26;
      }
      if (action == 32)
      {
        v9 = @"kUserChanged";
        goto LABEL_26;
      }
    }
LABEL_25:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_action);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = @"kNone";
    switch(action)
    {
      case 0:
        break;
      case 2:
        v9 = @"kFullWatchdog";
        break;
      case 4:
        v9 = @"kFastDPSWatchdog";
        break;
      case 8:
        v9 = @"kNoneNoFullWatchdogBudget";
        break;
      default:
        goto LABEL_25;
    }
  }
LABEL_26:
  [v3 setObject:v9 forKey:@"action"];

  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  uint64_t afterRecommendedAction = self->_afterRecommendedAction;
  if (afterRecommendedAction >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_afterRecommendedAction);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_264467148[afterRecommendedAction];
  }
  [v3 setObject:v11 forKey:@"afterRecommendedAction"];

LABEL_31:
  changes = self->_changes;
  if (changes)
  {
    v13 = [(WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences *)changes dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"changes"];
  }
  if ([(NSMutableArray *)self->_associationChanges count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_associationChanges, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v15 = self->_associationChanges;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v44 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"associationChanges"];
  }
  qDpsStats = self->_qDpsStats;
  if (qDpsStats)
  {
    v22 = [(WiFiAnalyticsAWDWAQuickDpsStats *)qDpsStats dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"qDpsStats"];
  }
  char v23 = (char)self->_has;
  if ((v23 & 4) != 0)
  {
    v37 = [NSNumber numberWithUnsignedInt:self->_actionIntVal];
    [v3 setObject:v37 forKey:@"actionIntVal"];

    char v23 = (char)self->_has;
    if ((v23 & 0x20) == 0)
    {
LABEL_46:
      if ((v23 & 0x40) == 0) {
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
    if (studyType == 1)
    {
      v39 = @"kDPEStudyTypeSymptomsDps";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_studyType);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v39 = @"kDPEStudyTypeDataStall";
  }
  [v3 setObject:v39 forKey:@"studyType"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_47:
    v24 = [NSNumber numberWithBool:self->_isAssociatedAtStudyEnd];
    [v3 setObject:v24 forKey:@"isAssociatedAtStudyEnd"];
  }
LABEL_48:
  symptomsDnsStats = self->_symptomsDnsStats;
  if (symptomsDnsStats)
  {
    v26 = [(WiFiAnalyticsAWDWASymptomsDnsStats *)symptomsDnsStats dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"symptomsDnsStats"];
  }
  discoveredPeerInfo = self->_discoveredPeerInfo;
  if (discoveredPeerInfo)
  {
    v28 = [(WiFiAnalyticsAWDWAPeerDiscoveryInfo *)discoveredPeerInfo dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"discoveredPeerInfo"];
  }
  if ([(NSMutableArray *)self->_accessPointInfos count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_accessPointInfos, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v30 = self->_accessPointInfos;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v41 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v40 + 1) + 8 * j) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v32);
    }

    [v3 setObject:v29 forKey:@"accessPointInfo"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSEpilogueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
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
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_associationChanges;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  if (self->_qDpsStats) {
    PBDataWriterWriteSubmessage();
  }
  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v11 = (char)self->_has;
    if ((v11 & 0x20) == 0)
    {
LABEL_19:
      if ((v11 & 0x40) == 0) {
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
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = self->_accessPointInfos;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 100) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_beforeAction;
  *((unsigned char *)v4 + 100) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_31:
  *((_DWORD *)v4 + 6) = self->_action;
  *((unsigned char *)v4 + 100) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 8) = self->_afterRecommendedAction;
    *((unsigned char *)v4 + 100) |= 8u;
  }
LABEL_6:
  id v15 = v4;
  if (self->_changes) {
    objc_msgSend(v4, "setChanges:");
  }
  if ([(WiFiAnalyticsAWDWiFiDPSEpilogue *)self associationChangesCount])
  {
    [v15 clearAssociationChanges];
    unint64_t v6 = [(WiFiAnalyticsAWDWiFiDPSEpilogue *)self associationChangesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(WiFiAnalyticsAWDWiFiDPSEpilogue *)self associationChangesAtIndex:i];
        [v15 addAssociationChanges:v9];
      }
    }
  }
  if (self->_qDpsStats) {
    objc_msgSend(v15, "setQDpsStats:");
  }
  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v15 + 7) = self->_actionIntVal;
    *((unsigned char *)v15 + 100) |= 4u;
    char v10 = (char)self->_has;
    if ((v10 & 0x20) == 0)
    {
LABEL_16:
      if ((v10 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v15 + 20) = self->_studyType;
  *((unsigned char *)v15 + 100) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    *((unsigned char *)v15 + 96) = self->_isAssociatedAtStudyEnd;
    *((unsigned char *)v15 + 100) |= 0x40u;
  }
LABEL_18:
  if (self->_symptomsDnsStats) {
    objc_msgSend(v15, "setSymptomsDnsStats:");
  }
  if (self->_discoveredPeerInfo) {
    objc_msgSend(v15, "setDiscoveredPeerInfo:");
  }
  if ([(WiFiAnalyticsAWDWiFiDPSEpilogue *)self accessPointInfosCount])
  {
    [v15 clearAccessPointInfos];
    unint64_t v11 = [(WiFiAnalyticsAWDWiFiDPSEpilogue *)self accessPointInfosCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(WiFiAnalyticsAWDWiFiDPSEpilogue *)self accessPointInfoAtIndex:j];
        [v15 addAccessPointInfo:v14];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
  id v8 = [(WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences *)self->_changes copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v8;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  char v10 = self->_associationChanges;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addAssociationChanges:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  id v16 = [(WiFiAnalyticsAWDWAQuickDpsStats *)self->_qDpsStats copyWithZone:a3];
  long long v17 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v16;

  char v18 = (char)self->_has;
  if ((v18 & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_actionIntVal;
    *(unsigned char *)(v6 + 100) |= 4u;
    char v18 = (char)self->_has;
    if ((v18 & 0x20) == 0)
    {
LABEL_15:
      if ((v18 & 0x40) == 0) {
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
  id v19 = [(WiFiAnalyticsAWDWASymptomsDnsStats *)self->_symptomsDnsStats copyWithZone:a3];
  long long v20 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v19;

  id v21 = [(WiFiAnalyticsAWDWAPeerDiscoveryInfo *)self->_discoveredPeerInfo copyWithZone:a3];
  long long v22 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v21;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v23 = self->_accessPointInfos;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * j), "copyWithZone:", a3, (void)v30);
        [(id)v6 addAccessPointInfo:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v25);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_52;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x10) == 0 || self->_beforeAction != *((_DWORD *)v4 + 12)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0 || self->_action != *((_DWORD *)v4 + 6)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 8) == 0 || self->_afterRecommendedAction != *((_DWORD *)v4 + 8)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 8) != 0)
  {
    goto LABEL_52;
  }
  changes = self->_changes;
  if ((unint64_t)changes | *((void *)v4 + 7)
    && !-[WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences isEqual:](changes, "isEqual:"))
  {
    goto LABEL_52;
  }
  associationChanges = self->_associationChanges;
  if ((unint64_t)associationChanges | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](associationChanges, "isEqual:")) {
      goto LABEL_52;
    }
  }
  qDpsStats = self->_qDpsStats;
  if ((unint64_t)qDpsStats | *((void *)v4 + 9))
  {
    if (!-[WiFiAnalyticsAWDWAQuickDpsStats isEqual:](qDpsStats, "isEqual:")) {
      goto LABEL_52;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_actionIntVal != *((_DWORD *)v4 + 7)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x20) == 0 || self->_studyType != *((_DWORD *)v4 + 20)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x40) != 0)
    {
      if (self->_isAssociatedAtStudyEnd)
      {
        if (!*((unsigned char *)v4 + 96)) {
          goto LABEL_52;
        }
        goto LABEL_46;
      }
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_46;
      }
    }
LABEL_52:
    char v11 = 0;
    goto LABEL_53;
  }
  if ((*((unsigned char *)v4 + 100) & 0x40) != 0) {
    goto LABEL_52;
  }
LABEL_46:
  symptomsDnsStats = self->_symptomsDnsStats;
  if ((unint64_t)symptomsDnsStats | *((void *)v4 + 11)
    && !-[WiFiAnalyticsAWDWASymptomsDnsStats isEqual:](symptomsDnsStats, "isEqual:"))
  {
    goto LABEL_52;
  }
  discoveredPeerInfo = self->_discoveredPeerInfo;
  if ((unint64_t)discoveredPeerInfo | *((void *)v4 + 8))
  {
    if (!-[WiFiAnalyticsAWDWAPeerDiscoveryInfo isEqual:](discoveredPeerInfo, "isEqual:")) {
      goto LABEL_52;
    }
  }
  accessPointInfos = self->_accessPointInfos;
  if ((unint64_t)accessPointInfos | *((void *)v4 + 2)) {
    char v11 = -[NSMutableArray isEqual:](accessPointInfos, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_53:

  return v11;
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
  unint64_t v7 = [(WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences *)self->_changes hash];
  uint64_t v8 = [(NSMutableArray *)self->_associationChanges hash];
  unint64_t v9 = [(WiFiAnalyticsAWDWAQuickDpsStats *)self->_qDpsStats hash];
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
  unint64_t v14 = v10 ^ v11 ^ v12 ^ [(WiFiAnalyticsAWDWASymptomsDnsStats *)self->_symptomsDnsStats hash];
  unint64_t v15 = v13 ^ v14 ^ [(WiFiAnalyticsAWDWAPeerDiscoveryInfo *)self->_discoveredPeerInfo hash];
  return v15 ^ [(NSMutableArray *)self->_accessPointInfos hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 100);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 100);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t beforeAction = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 0x10u;
  char v6 = *((unsigned char *)v4 + 100);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_int action = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 100) & 8) != 0)
  {
LABEL_5:
    self->_uint64_t afterRecommendedAction = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  changes = self->_changes;
  uint64_t v8 = *((void *)v5 + 7);
  if (changes)
  {
    if (v8) {
      -[WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences mergeFrom:](changes, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[WiFiAnalyticsAWDWiFiDPSEpilogue setChanges:](self, "setChanges:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = *((id *)v5 + 5);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        [(WiFiAnalyticsAWDWiFiDPSEpilogue *)self addAssociationChanges:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }

  qDpsStats = self->_qDpsStats;
  uint64_t v15 = *((void *)v5 + 9);
  if (qDpsStats)
  {
    if (v15) {
      -[WiFiAnalyticsAWDWAQuickDpsStats mergeFrom:](qDpsStats, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[WiFiAnalyticsAWDWiFiDPSEpilogue setQDpsStats:](self, "setQDpsStats:");
  }
  char v16 = *((unsigned char *)v5 + 100);
  if ((v16 & 4) != 0)
  {
    self->_actionIntVal = *((_DWORD *)v5 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v16 = *((unsigned char *)v5 + 100);
    if ((v16 & 0x20) == 0)
    {
LABEL_29:
      if ((v16 & 0x40) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v5 + 100) & 0x20) == 0)
  {
    goto LABEL_29;
  }
  self->_int studyType = *((_DWORD *)v5 + 20);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v5 + 100) & 0x40) != 0)
  {
LABEL_30:
    self->_isAssociatedAtStudyEnd = *((unsigned char *)v5 + 96);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_31:
  symptomsDnsStats = self->_symptomsDnsStats;
  uint64_t v18 = *((void *)v5 + 11);
  if (symptomsDnsStats)
  {
    if (v18) {
      -[WiFiAnalyticsAWDWASymptomsDnsStats mergeFrom:](symptomsDnsStats, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[WiFiAnalyticsAWDWiFiDPSEpilogue setSymptomsDnsStats:](self, "setSymptomsDnsStats:");
  }
  discoveredPeerInfo = self->_discoveredPeerInfo;
  uint64_t v20 = *((void *)v5 + 8);
  if (discoveredPeerInfo)
  {
    if (v20) {
      -[WiFiAnalyticsAWDWAPeerDiscoveryInfo mergeFrom:](discoveredPeerInfo, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[WiFiAnalyticsAWDWiFiDPSEpilogue setDiscoveredPeerInfo:](self, "setDiscoveredPeerInfo:");
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = *((id *)v5 + 2);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[WiFiAnalyticsAWDWiFiDPSEpilogue addAccessPointInfo:](self, "addAccessPointInfo:", *(void *)(*((void *)&v26 + 1) + 8 * j), (void)v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v23);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences)changes
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

- (WiFiAnalyticsAWDWAQuickDpsStats)qDpsStats
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

- (WiFiAnalyticsAWDWASymptomsDnsStats)symptomsDnsStats
{
  return self->_symptomsDnsStats;
}

- (void)setSymptomsDnsStats:(id)a3
{
}

- (WiFiAnalyticsAWDWAPeerDiscoveryInfo)discoveredPeerInfo
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symptomsDnsStats, 0);
  objc_storeStrong((id *)&self->_qDpsStats, 0);
  objc_storeStrong((id *)&self->_discoveredPeerInfo, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_associationChanges, 0);
  objc_storeStrong((id *)&self->_accessPointInfos, 0);
}

@end