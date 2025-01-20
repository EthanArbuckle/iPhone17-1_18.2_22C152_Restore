@interface PREAMResponsesViewed
- (BOOL)hasAgeGroup;
- (BOOL)hasExperimentId;
- (BOOL)hasHostProcess;
- (BOOL)hasIsApricotDevice;
- (BOOL)hasLastViewedIndex;
- (BOOL)hasTreatmentId;
- (BOOL)hasTreatmentModelName;
- (BOOL)isApricotDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)experimentId;
- (NSString)hostProcess;
- (NSString)treatmentId;
- (NSString)treatmentModelName;
- (id)ageGroupAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAgeGroup:(id)a3;
- (int)ageGroup;
- (unint64_t)hash;
- (unsigned)lastViewedIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgeGroup:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasAgeGroup:(BOOL)a3;
- (void)setHasIsApricotDevice:(BOOL)a3;
- (void)setHasLastViewedIndex:(BOOL)a3;
- (void)setHostProcess:(id)a3;
- (void)setIsApricotDevice:(BOOL)a3;
- (void)setLastViewedIndex:(unsigned int)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTreatmentModelName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PREAMResponsesViewed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentModelName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_hostProcess, 0);

  objc_storeStrong((id *)&self->_experimentId, 0);
}

- (BOOL)isApricotDevice
{
  return self->_isApricotDevice;
}

- (void)setHostProcess:(id)a3
{
}

- (NSString)hostProcess
{
  return self->_hostProcess;
}

- (void)setTreatmentModelName:(id)a3
{
}

- (NSString)treatmentModelName
{
  return self->_treatmentModelName;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (unsigned)lastViewedIndex
{
  return self->_lastViewedIndex;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_lastViewedIndex = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[PREAMResponsesViewed setExperimentId:](self, "setExperimentId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[PREAMResponsesViewed setTreatmentId:](self, "setTreatmentId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[PREAMResponsesViewed setTreatmentModelName:](self, "setTreatmentModelName:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[PREAMResponsesViewed setHostProcess:](self, "setHostProcess:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_isApricotDevice = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 60);
  }
  if (v5)
  {
    self->_ageGroup = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_lastViewedIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_experimentId hash];
  NSUInteger v5 = [(NSString *)self->_treatmentId hash];
  NSUInteger v6 = [(NSString *)self->_treatmentModelName hash];
  NSUInteger v7 = [(NSString *)self->_hostProcess hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v8 = 2654435761 * self->_isApricotDevice;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_ageGroup;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_lastViewedIndex != *((_DWORD *)v4 + 8)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_27;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 2)
    && !-[NSString isEqual:](experimentId, "isEqual:"))
  {
    goto LABEL_27;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_27;
    }
  }
  treatmentModelName = self->_treatmentModelName;
  if ((unint64_t)treatmentModelName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](treatmentModelName, "isEqual:")) {
      goto LABEL_27;
    }
  }
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) != 0)
    {
      if (self->_isApricotDevice)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_23;
      }
    }
LABEL_27:
    BOOL v9 = 0;
    goto LABEL_28;
  }
  if ((*((unsigned char *)v4 + 60) & 4) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  BOOL v9 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2)) {
      goto LABEL_27;
    }
    BOOL v9 = 1;
  }
LABEL_28:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_lastViewedIndex;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_experimentId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_treatmentId copyWithZone:a3];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_treatmentModelName copyWithZone:a3];
  v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  uint64_t v13 = [(NSString *)self->_hostProcess copyWithZone:a3];
  v14 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v13;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v6 + 56) = self->_isApricotDevice;
    *(unsigned char *)(v6 + 60) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v6 + 8) = self->_ageGroup;
    *(unsigned char *)(v6 + 60) |= 1u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_lastViewedIndex;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  uint64_t v6 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    id v4 = v6;
  }
  if (self->_treatmentId)
  {
    objc_msgSend(v6, "setTreatmentId:");
    id v4 = v6;
  }
  if (self->_treatmentModelName)
  {
    objc_msgSend(v6, "setTreatmentModelName:");
    id v4 = v6;
  }
  if (self->_hostProcess)
  {
    objc_msgSend(v6, "setHostProcess:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_isApricotDevice;
    *((unsigned char *)v4 + 60) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_ageGroup;
    *((unsigned char *)v4 + 60) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_experimentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentModelName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hostProcess) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PREAMResponsesViewedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_lastViewedIndex];
    [v3 setObject:v4 forKey:@"last_viewed_index"];
  }
  experimentId = self->_experimentId;
  if (experimentId) {
    [v3 setObject:experimentId forKey:@"experiment_id"];
  }
  treatmentId = self->_treatmentId;
  if (treatmentId) {
    [v3 setObject:treatmentId forKey:@"treatment_id"];
  }
  treatmentModelName = self->_treatmentModelName;
  if (treatmentModelName) {
    [v3 setObject:treatmentModelName forKey:@"treatment_model_name"];
  }
  hostProcess = self->_hostProcess;
  if (hostProcess) {
    [v3 setObject:hostProcess forKey:@"host_process"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_isApricotDevice];
    [v3 setObject:v10 forKey:@"is_apricot_device"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t ageGroup = self->_ageGroup;
    if (ageGroup >= 7)
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ageGroup);
    }
    else
    {
      v12 = *(&off_1E65B1848 + ageGroup);
    }
    [v3 setObject:v12 forKey:@"age_group"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PREAMResponsesViewed;
  id v4 = [(PREAMResponsesViewed *)&v8 description];
  id v5 = [(PREAMResponsesViewed *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsAgeGroup:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GROUP_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GROUP_0TO18"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GROUP_19TO30"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GROUP_31TO50"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GROUP_51TO65"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GROUP_66TO75"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GROUP_76UP"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)ageGroupAsString:(int)a3
{
  if (a3 >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E65B1848 + a3);
  }

  return v3;
}

- (BOOL)hasAgeGroup
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAgeGroup:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAgeGroup:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t ageGroup = a3;
}

- (int)ageGroup
{
  if (*(unsigned char *)&self->_has) {
    return self->_ageGroup;
  }
  else {
    return 0;
  }
}

- (BOOL)hasIsApricotDevice
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasIsApricotDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setIsApricotDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isApricotDevice = a3;
}

- (BOOL)hasHostProcess
{
  return self->_hostProcess != 0;
}

- (BOOL)hasTreatmentModelName
{
  return self->_treatmentModelName != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasLastViewedIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasLastViewedIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setLastViewedIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastViewedIndex = a3;
}

@end