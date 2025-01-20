@interface VCPBWorkflow
+ (Class)inputClassesType;
+ (Class)workflowTypesType;
- (BOOL)hasAccessResourcePerWorkflowStateData;
- (BOOL)hasActionsData;
- (BOOL)hasCreationDate;
- (BOOL)hasIconColor;
- (BOOL)hasIconGlyph;
- (BOOL)hasImportQuestionsData;
- (BOOL)hasIntegerLastMigratedClientVersion;
- (BOOL)hasIntegerMinimumClientVersion;
- (BOOL)hasLastMigratedClientVersion;
- (BOOL)hasMinimumClientVersion;
- (BOOL)hasModificationDate;
- (BOOL)hasName;
- (BOOL)hasRemoteQuarantineStatus;
- (BOOL)hasSubtitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)accessResourcePerWorkflowStateData;
- (NSData)actionsData;
- (NSData)importQuestionsData;
- (NSMutableArray)inputClasses;
- (NSMutableArray)workflowTypes;
- (NSString)lastMigratedClientVersion;
- (NSString)minimumClientVersion;
- (NSString)name;
- (NSString)subtitle;
- (double)creationDate;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inputClassesAtIndex:(unint64_t)a3;
- (id)remoteQuarantineStatusAsString:(int)a3;
- (id)workflowTypesAtIndex:(unint64_t)a3;
- (int)StringAsRemoteQuarantineStatus:(id)a3;
- (int)remoteQuarantineStatus;
- (unint64_t)hash;
- (unint64_t)inputClassesCount;
- (unint64_t)integerLastMigratedClientVersion;
- (unint64_t)integerMinimumClientVersion;
- (unint64_t)workflowTypesCount;
- (unsigned)iconColor;
- (unsigned)iconGlyph;
- (void)addInputClasses:(id)a3;
- (void)addWorkflowTypes:(id)a3;
- (void)clearInputClasses;
- (void)clearWorkflowTypes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessResourcePerWorkflowStateData:(id)a3;
- (void)setActionsData:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasIconColor:(BOOL)a3;
- (void)setHasIconGlyph:(BOOL)a3;
- (void)setHasIntegerLastMigratedClientVersion:(BOOL)a3;
- (void)setHasIntegerMinimumClientVersion:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setHasRemoteQuarantineStatus:(BOOL)a3;
- (void)setIconColor:(unsigned int)a3;
- (void)setIconGlyph:(unsigned int)a3;
- (void)setImportQuestionsData:(id)a3;
- (void)setInputClasses:(id)a3;
- (void)setIntegerLastMigratedClientVersion:(unint64_t)a3;
- (void)setIntegerMinimumClientVersion:(unint64_t)a3;
- (void)setLastMigratedClientVersion:(id)a3;
- (void)setMinimumClientVersion:(id)a3;
- (void)setModificationDate:(double)a3;
- (void)setName:(id)a3;
- (void)setRemoteQuarantineStatus:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setWorkflowTypes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPBWorkflow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowTypes, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_minimumClientVersion, 0);
  objc_storeStrong((id *)&self->_lastMigratedClientVersion, 0);
  objc_storeStrong((id *)&self->_inputClasses, 0);
  objc_storeStrong((id *)&self->_importQuestionsData, 0);
  objc_storeStrong((id *)&self->_actionsData, 0);
  objc_storeStrong((id *)&self->_accessResourcePerWorkflowStateData, 0);
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setAccessResourcePerWorkflowStateData:(id)a3
{
}

- (NSData)accessResourcePerWorkflowStateData
{
  return self->_accessResourcePerWorkflowStateData;
}

- (void)setLastMigratedClientVersion:(id)a3
{
}

- (NSString)lastMigratedClientVersion
{
  return self->_lastMigratedClientVersion;
}

- (void)setMinimumClientVersion:(id)a3
{
}

- (NSString)minimumClientVersion
{
  return self->_minimumClientVersion;
}

- (unint64_t)integerLastMigratedClientVersion
{
  return self->_integerLastMigratedClientVersion;
}

- (unint64_t)integerMinimumClientVersion
{
  return self->_integerMinimumClientVersion;
}

- (void)setImportQuestionsData:(id)a3
{
}

- (NSData)importQuestionsData
{
  return self->_importQuestionsData;
}

- (void)setActionsData:(id)a3
{
}

- (NSData)actionsData
{
  return self->_actionsData;
}

- (void)setInputClasses:(id)a3
{
}

- (NSMutableArray)inputClasses
{
  return self->_inputClasses;
}

- (void)setWorkflowTypes:(id)a3
{
}

- (NSMutableArray)workflowTypes
{
  return self->_workflowTypes;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (unsigned)iconGlyph
{
  return self->_iconGlyph;
}

- (unsigned)iconColor
{
  return self->_iconColor;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 12)) {
    -[VCPBWorkflow setName:](self, "setName:");
  }
  char v5 = *((unsigned char *)v4 + 128);
  if ((v5 & 0x10) != 0)
  {
    self->_iconColor = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 128);
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 0x20) == 0)
  {
    goto LABEL_5;
  }
  self->_iconGlyph = *((_DWORD *)v4 + 15);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 128);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_43:
  self->_creationDate = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 128) & 8) != 0)
  {
LABEL_7:
    self->_modificationDate = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *((id *)v4 + 15);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
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
        [(VCPBWorkflow *)self addWorkflowTypes:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *((id *)v4 + 9);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[VCPBWorkflow addInputClasses:](self, "addInputClasses:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  if (*((void *)v4 + 6)) {
    -[VCPBWorkflow setActionsData:](self, "setActionsData:");
  }
  if (*((void *)v4 + 8)) {
    -[VCPBWorkflow setImportQuestionsData:](self, "setImportQuestionsData:");
  }
  char v16 = *((unsigned char *)v4 + 128);
  if ((v16 & 4) != 0)
  {
    self->_integerMinimumClientVersion = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v16 = *((unsigned char *)v4 + 128);
  }
  if ((v16 & 2) != 0)
  {
    self->_integerLastMigratedClientVersion = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 11)) {
    -[VCPBWorkflow setMinimumClientVersion:](self, "setMinimumClientVersion:");
  }
  if (*((void *)v4 + 10)) {
    -[VCPBWorkflow setLastMigratedClientVersion:](self, "setLastMigratedClientVersion:");
  }
  if (*((void *)v4 + 5)) {
    -[VCPBWorkflow setAccessResourcePerWorkflowStateData:](self, "setAccessResourcePerWorkflowStateData:");
  }
  if ((*((unsigned char *)v4 + 128) & 0x40) != 0)
  {
    self->_remoteQuarantineStatus = *((_DWORD *)v4 + 26);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 14)) {
    -[VCPBWorkflow setSubtitle:](self, "setSubtitle:");
  }
}

- (unint64_t)hash
{
  NSUInteger v28 = [(NSString *)self->_name hash];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    uint64_t v27 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v26 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    goto LABEL_13;
  }
  uint64_t v27 = 2654435761 * self->_iconColor;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v26 = 2654435761 * self->_iconGlyph;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double creationDate = self->_creationDate;
  double v5 = -creationDate;
  if (creationDate >= 0.0) {
    double v5 = self->_creationDate;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  unint64_t v25 = v8;
  if ((has & 8) != 0)
  {
    double modificationDate = self->_modificationDate;
    double v11 = -modificationDate;
    if (modificationDate >= 0.0) {
      double v11 = self->_modificationDate;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  uint64_t v24 = [(NSMutableArray *)self->_workflowTypes hash];
  uint64_t v23 = [(NSMutableArray *)self->_inputClasses hash];
  uint64_t v14 = [(NSData *)self->_actionsData hash];
  uint64_t v15 = [(NSData *)self->_importQuestionsData hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v16 = 2654435761u * self->_integerMinimumClientVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_23:
      unint64_t v17 = 2654435761u * self->_integerLastMigratedClientVersion;
      goto LABEL_26;
    }
  }
  unint64_t v17 = 0;
LABEL_26:
  NSUInteger v18 = [(NSString *)self->_minimumClientVersion hash];
  NSUInteger v19 = [(NSString *)self->_lastMigratedClientVersion hash];
  uint64_t v20 = [(NSData *)self->_accessResourcePerWorkflowStateData hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v21 = 2654435761 * self->_remoteQuarantineStatus;
  }
  else {
    uint64_t v21 = 0;
  }
  return v27 ^ v28 ^ v26 ^ v25 ^ v9 ^ v24 ^ v23 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ [(NSString *)self->_subtitle hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 0x10) == 0 || self->_iconColor != *((_DWORD *)v4 + 14)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 0x10) != 0)
  {
LABEL_55:
    char v14 = 0;
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 0x20) == 0 || self->_iconGlyph != *((_DWORD *)v4 + 15)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 128) & 1) == 0 || self->_creationDate != *((double *)v4 + 1)) {
      goto LABEL_55;
    }
  }
  else if (*((unsigned char *)v4 + 128))
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 8) == 0 || self->_modificationDate != *((double *)v4 + 4)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 8) != 0)
  {
    goto LABEL_55;
  }
  workflowTypes = self->_workflowTypes;
  if ((unint64_t)workflowTypes | *((void *)v4 + 15)
    && !-[NSMutableArray isEqual:](workflowTypes, "isEqual:"))
  {
    goto LABEL_55;
  }
  inputClasses = self->_inputClasses;
  if ((unint64_t)inputClasses | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](inputClasses, "isEqual:")) {
      goto LABEL_55;
    }
  }
  actionsData = self->_actionsData;
  if ((unint64_t)actionsData | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](actionsData, "isEqual:")) {
      goto LABEL_55;
    }
  }
  importQuestionsData = self->_importQuestionsData;
  if ((unint64_t)importQuestionsData | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](importQuestionsData, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 4) == 0 || self->_integerMinimumClientVersion != *((void *)v4 + 3)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 4) != 0)
  {
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 2) == 0 || self->_integerLastMigratedClientVersion != *((void *)v4 + 2)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 2) != 0)
  {
    goto LABEL_55;
  }
  minimumClientVersion = self->_minimumClientVersion;
  if ((unint64_t)minimumClientVersion | *((void *)v4 + 11)
    && !-[NSString isEqual:](minimumClientVersion, "isEqual:"))
  {
    goto LABEL_55;
  }
  lastMigratedClientVersion = self->_lastMigratedClientVersion;
  if ((unint64_t)lastMigratedClientVersion | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](lastMigratedClientVersion, "isEqual:")) {
      goto LABEL_55;
    }
  }
  accessResourcePerWorkflowStateData = self->_accessResourcePerWorkflowStateData;
  if ((unint64_t)accessResourcePerWorkflowStateData | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](accessResourcePerWorkflowStateData, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 0x40) == 0 || self->_remoteQuarantineStatus != *((_DWORD *)v4 + 26)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 0x40) != 0)
  {
    goto LABEL_55;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 14)) {
    char v14 = -[NSString isEqual:](subtitle, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_56:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  double v7 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v6;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_iconColor;
    *(unsigned char *)(v5 + 128) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 60) = self->_iconGlyph;
  *(unsigned char *)(v5 + 128) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_29:
  *(double *)(v5 + 8) = self->_creationDate;
  *(unsigned char *)(v5 + 128) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *(double *)(v5 + 32) = self->_modificationDate;
    *(unsigned char *)(v5 + 128) |= 8u;
  }
LABEL_6:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  unint64_t v9 = self->_workflowTypes;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addWorkflowTypes:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v11);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v15 = self->_inputClasses;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * j), "copyWithZone:", a3, (void)v35);
        [(id)v5 addInputClasses:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v17);
  }

  uint64_t v21 = [(NSData *)self->_actionsData copyWithZone:a3];
  long long v22 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v21;

  uint64_t v23 = [(NSData *)self->_importQuestionsData copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v23;

  char v25 = (char)self->_has;
  if ((v25 & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_integerMinimumClientVersion;
    *(unsigned char *)(v5 + 128) |= 4u;
    char v25 = (char)self->_has;
  }
  if ((v25 & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_integerLastMigratedClientVersion;
    *(unsigned char *)(v5 + 128) |= 2u;
  }
  uint64_t v26 = -[NSString copyWithZone:](self->_minimumClientVersion, "copyWithZone:", a3, (void)v35);
  uint64_t v27 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v26;

  uint64_t v28 = [(NSString *)self->_lastMigratedClientVersion copyWithZone:a3];
  v29 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v28;

  uint64_t v30 = [(NSData *)self->_accessResourcePerWorkflowStateData copyWithZone:a3];
  v31 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v30;

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_remoteQuarantineStatus;
    *(unsigned char *)(v5 + 128) |= 0x40u;
  }
  uint64_t v32 = [(NSString *)self->_subtitle copyWithZone:a3];
  v33 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v32;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v16;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_iconColor;
    *((unsigned char *)v4 + 128) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
LABEL_39:
      *((void *)v4 + 1) = *(void *)&self->_creationDate;
      *((unsigned char *)v4 + 128) |= 1u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 15) = self->_iconGlyph;
  *((unsigned char *)v4 + 128) |= 0x20u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_39;
  }
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *((void *)v4 + 4) = *(void *)&self->_modificationDate;
    *((unsigned char *)v4 + 128) |= 8u;
  }
LABEL_8:
  if ([(VCPBWorkflow *)self workflowTypesCount])
  {
    [v16 clearWorkflowTypes];
    unint64_t v6 = [(VCPBWorkflow *)self workflowTypesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        unint64_t v9 = [(VCPBWorkflow *)self workflowTypesAtIndex:i];
        [v16 addWorkflowTypes:v9];
      }
    }
  }
  if ([(VCPBWorkflow *)self inputClassesCount])
  {
    [v16 clearInputClasses];
    unint64_t v10 = [(VCPBWorkflow *)self inputClassesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        double v13 = [(VCPBWorkflow *)self inputClassesAtIndex:j];
        [v16 addInputClasses:v13];
      }
    }
  }
  if (self->_actionsData) {
    objc_msgSend(v16, "setActionsData:");
  }
  char v14 = v16;
  if (self->_importQuestionsData)
  {
    objc_msgSend(v16, "setImportQuestionsData:");
    char v14 = v16;
  }
  char v15 = (char)self->_has;
  if ((v15 & 4) != 0)
  {
    v14[3] = self->_integerMinimumClientVersion;
    *((unsigned char *)v14 + 128) |= 4u;
    char v15 = (char)self->_has;
  }
  if ((v15 & 2) != 0)
  {
    v14[2] = self->_integerLastMigratedClientVersion;
    *((unsigned char *)v14 + 128) |= 2u;
  }
  if (self->_minimumClientVersion)
  {
    objc_msgSend(v16, "setMinimumClientVersion:");
    char v14 = v16;
  }
  if (self->_lastMigratedClientVersion)
  {
    objc_msgSend(v16, "setLastMigratedClientVersion:");
    char v14 = v16;
  }
  if (self->_accessResourcePerWorkflowStateData)
  {
    objc_msgSend(v16, "setAccessResourcePerWorkflowStateData:");
    char v14 = v16;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v14 + 26) = self->_remoteQuarantineStatus;
    *((unsigned char *)v14 + 128) |= 0x40u;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v16, "setSubtitle:");
    char v14 = v16;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteFixed32Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_43;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteFixed32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_43:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v6 = self->_workflowTypes;
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
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v11 = self->_inputClasses;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  if (self->_actionsData) {
    PBDataWriterWriteDataField();
  }
  if (self->_importQuestionsData) {
    PBDataWriterWriteDataField();
  }
  char v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_minimumClientVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastMigratedClientVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_accessResourcePerWorkflowStateData) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return VCPBWorkflowReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    long long v20 = [NSNumber numberWithUnsignedInt:self->_iconColor];
    [v4 setObject:v20 forKey:@"iconColor"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  long long v21 = [NSNumber numberWithUnsignedInt:self->_iconGlyph];
  [v4 setObject:v21 forKey:@"iconGlyph"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_31:
  long long v22 = [NSNumber numberWithDouble:self->_creationDate];
  [v4 setObject:v22 forKey:@"creationDate"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v7 = [NSNumber numberWithDouble:self->_modificationDate];
    [v4 setObject:v7 forKey:@"modificationDate"];
  }
LABEL_8:
  workflowTypes = self->_workflowTypes;
  if (workflowTypes) {
    [v4 setObject:workflowTypes forKey:@"workflowTypes"];
  }
  inputClasses = self->_inputClasses;
  if (inputClasses) {
    [v4 setObject:inputClasses forKey:@"inputClasses"];
  }
  actionsData = self->_actionsData;
  if (actionsData) {
    [v4 setObject:actionsData forKey:@"actionsData"];
  }
  importQuestionsData = self->_importQuestionsData;
  if (importQuestionsData) {
    [v4 setObject:importQuestionsData forKey:@"importQuestionsData"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 4) != 0)
  {
    uint64_t v13 = [NSNumber numberWithUnsignedLongLong:self->_integerMinimumClientVersion];
    [v4 setObject:v13 forKey:@"integerMinimumClientVersion"];

    char v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    uint64_t v14 = [NSNumber numberWithUnsignedLongLong:self->_integerLastMigratedClientVersion];
    [v4 setObject:v14 forKey:@"integerLastMigratedClientVersion"];
  }
  minimumClientVersion = self->_minimumClientVersion;
  if (minimumClientVersion) {
    [v4 setObject:minimumClientVersion forKey:@"minimumClientVersion"];
  }
  lastMigratedClientVersion = self->_lastMigratedClientVersion;
  if (lastMigratedClientVersion) {
    [v4 setObject:lastMigratedClientVersion forKey:@"lastMigratedClientVersion"];
  }
  accessResourcePerWorkflowStateData = self->_accessResourcePerWorkflowStateData;
  if (accessResourcePerWorkflowStateData) {
    [v4 setObject:accessResourcePerWorkflowStateData forKey:@"accessResourcePerWorkflowStateData"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    unsigned int v18 = self->_remoteQuarantineStatus - 1;
    if (v18 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_remoteQuarantineStatus);
      long long v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v19 = off_1E6540950[v18];
    }
    [v4 setObject:v19 forKey:@"remoteQuarantineStatus"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPBWorkflow;
  id v4 = [(VCPBWorkflow *)&v8 description];
  uint64_t v5 = [(VCPBWorkflow *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (int)StringAsRemoteQuarantineStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotQuarantined"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Quarantined"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"QuarantinedAllowedByUser"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)remoteQuarantineStatusAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6540950[a3 - 1];
  }
  return v3;
}

- (BOOL)hasRemoteQuarantineStatus
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasRemoteQuarantineStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setRemoteQuarantineStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_remoteQuarantineStatus = a3;
}

- (int)remoteQuarantineStatus
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_remoteQuarantineStatus;
  }
  else {
    return 1;
  }
}

- (BOOL)hasAccessResourcePerWorkflowStateData
{
  return self->_accessResourcePerWorkflowStateData != 0;
}

- (BOOL)hasLastMigratedClientVersion
{
  return self->_lastMigratedClientVersion != 0;
}

- (BOOL)hasMinimumClientVersion
{
  return self->_minimumClientVersion != 0;
}

- (BOOL)hasIntegerLastMigratedClientVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasIntegerLastMigratedClientVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setIntegerLastMigratedClientVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_integerLastMigratedClientVersion = a3;
}

- (BOOL)hasIntegerMinimumClientVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasIntegerMinimumClientVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setIntegerMinimumClientVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_integerMinimumClientVersion = a3;
}

- (BOOL)hasImportQuestionsData
{
  return self->_importQuestionsData != 0;
}

- (BOOL)hasActionsData
{
  return self->_actionsData != 0;
}

- (id)inputClassesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_inputClasses objectAtIndex:a3];
}

- (unint64_t)inputClassesCount
{
  return [(NSMutableArray *)self->_inputClasses count];
}

- (void)addInputClasses:(id)a3
{
  id v4 = a3;
  inputClasses = self->_inputClasses;
  id v8 = v4;
  if (!inputClasses)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_inputClasses;
    self->_inputClasses = v6;

    id v4 = v8;
    inputClasses = self->_inputClasses;
  }
  [(NSMutableArray *)inputClasses addObject:v4];
}

- (void)clearInputClasses
{
}

- (id)workflowTypesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_workflowTypes objectAtIndex:a3];
}

- (unint64_t)workflowTypesCount
{
  return [(NSMutableArray *)self->_workflowTypes count];
}

- (void)addWorkflowTypes:(id)a3
{
  id v4 = a3;
  workflowTypes = self->_workflowTypes;
  id v8 = v4;
  if (!workflowTypes)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_workflowTypes;
    self->_workflowTypes = v6;

    id v4 = v8;
    workflowTypes = self->_workflowTypes;
  }
  [(NSMutableArray *)workflowTypes addObject:v4];
}

- (void)clearWorkflowTypes
{
}

- (BOOL)hasModificationDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasModificationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double modificationDate = a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double creationDate = a3;
}

- (BOOL)hasIconGlyph
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasIconGlyph:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setIconGlyph:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_iconGlyph = a3;
}

- (BOOL)hasIconColor
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasIconColor:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setIconColor:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_iconColor = a3;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

+ (Class)inputClassesType
{
  return (Class)objc_opt_class();
}

+ (Class)workflowTypesType
{
  return (Class)objc_opt_class();
}

@end