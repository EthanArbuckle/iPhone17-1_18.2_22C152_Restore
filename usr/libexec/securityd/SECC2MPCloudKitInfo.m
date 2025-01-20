@interface SECC2MPCloudKitInfo
+ (Class)clientOperationType;
+ (Class)operationGroupType;
- (BOOL)anonymous;
- (BOOL)hasAnonymous;
- (BOOL)hasClientBundleId;
- (BOOL)hasClientProcessVersion;
- (BOOL)hasContainer;
- (BOOL)hasEnvironment;
- (BOOL)hasReportClientOperationFrequency;
- (BOOL)hasReportClientOperationFrequencyBase;
- (BOOL)hasReportOperationGroupFrequency;
- (BOOL)hasReportOperationGroupFrequencyBase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)clientOperations;
- (NSMutableArray)operationGroups;
- (NSString)clientBundleId;
- (NSString)clientProcessVersion;
- (NSString)container;
- (NSString)environment;
- (id)clientOperationAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)operationGroupAtIndex:(unint64_t)a3;
- (unint64_t)clientOperationsCount;
- (unint64_t)hash;
- (unint64_t)operationGroupsCount;
- (unint64_t)reportClientOperationFrequency;
- (unint64_t)reportClientOperationFrequencyBase;
- (unint64_t)reportOperationGroupFrequency;
- (unint64_t)reportOperationGroupFrequencyBase;
- (void)addClientOperation:(id)a3;
- (void)addOperationGroup:(id)a3;
- (void)clearClientOperations;
- (void)clearOperationGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymous:(BOOL)a3;
- (void)setClientBundleId:(id)a3;
- (void)setClientOperations:(id)a3;
- (void)setClientProcessVersion:(id)a3;
- (void)setContainer:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHasAnonymous:(BOOL)a3;
- (void)setHasReportClientOperationFrequency:(BOOL)a3;
- (void)setHasReportClientOperationFrequencyBase:(BOOL)a3;
- (void)setHasReportOperationGroupFrequency:(BOOL)a3;
- (void)setHasReportOperationGroupFrequencyBase:(BOOL)a3;
- (void)setOperationGroups:(id)a3;
- (void)setReportClientOperationFrequency:(unint64_t)a3;
- (void)setReportClientOperationFrequencyBase:(unint64_t)a3;
- (void)setReportOperationGroupFrequency:(unint64_t)a3;
- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPCloudKitInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroups, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_clientProcessVersion, 0);
  objc_storeStrong((id *)&self->_clientOperations, 0);

  objc_storeStrong((id *)&self->_clientBundleId, 0);
}

- (unint64_t)reportClientOperationFrequencyBase
{
  return self->_reportClientOperationFrequencyBase;
}

- (unint64_t)reportClientOperationFrequency
{
  return self->_reportClientOperationFrequency;
}

- (void)setClientOperations:(id)a3
{
}

- (NSMutableArray)clientOperations
{
  return self->_clientOperations;
}

- (unint64_t)reportOperationGroupFrequencyBase
{
  return self->_reportOperationGroupFrequencyBase;
}

- (unint64_t)reportOperationGroupFrequency
{
  return self->_reportOperationGroupFrequency;
}

- (void)setOperationGroups:(id)a3
{
}

- (NSMutableArray)operationGroups
{
  return self->_operationGroups;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (void)setEnvironment:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setContainer:(id)a3
{
}

- (NSString)container
{
  return self->_container;
}

- (void)setClientBundleId:(id)a3
{
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientProcessVersion:(id)a3
{
}

- (NSString)clientProcessVersion
{
  return self->_clientProcessVersion;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[SECC2MPCloudKitInfo setClientProcessVersion:](self, "setClientProcessVersion:");
  }
  if (*((void *)v4 + 5)) {
    -[SECC2MPCloudKitInfo setClientBundleId:](self, "setClientBundleId:");
  }
  if (*((void *)v4 + 8)) {
    -[SECC2MPCloudKitInfo setContainer:](self, "setContainer:");
  }
  if (*((void *)v4 + 9)) {
    -[SECC2MPCloudKitInfo setEnvironment:](self, "setEnvironment:");
  }
  if ((*((unsigned char *)v4 + 92) & 0x10) != 0)
  {
    self->_anonymous = *((unsigned char *)v4 + 88);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 10);
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SECC2MPCloudKitInfo *)self addOperationGroup:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 92);
  if ((v10 & 4) != 0)
  {
    self->_reportOperationGroupFrequency = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v10 = *((unsigned char *)v4 + 92);
  }
  if ((v10 & 8) != 0)
  {
    self->_reportOperationGroupFrequencyBase = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *((id *)v4 + 6);
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[SECC2MPCloudKitInfo addClientOperation:](self, "addClientOperation:", *(void *)(*((void *)&v17 + 1) + 8 * (void)j), (void)v17);
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = *((unsigned char *)v4 + 92);
  if (v16)
  {
    self->_reportClientOperationFrequency = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v16 = *((unsigned char *)v4 + 92);
  }
  if ((v16 & 2) != 0)
  {
    self->_reportClientOperationFrequencyBase = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v14 = [(NSString *)self->_clientProcessVersion hash];
  NSUInteger v3 = [(NSString *)self->_clientBundleId hash];
  NSUInteger v4 = [(NSString *)self->_container hash];
  NSUInteger v5 = [(NSString *)self->_environment hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v6 = 2654435761 * self->_anonymous;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_operationGroups hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v8 = 2654435761u * self->_reportOperationGroupFrequency;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      unint64_t v9 = 2654435761u * self->_reportOperationGroupFrequencyBase;
      goto LABEL_9;
    }
  }
  unint64_t v9 = 0;
LABEL_9:
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_clientOperations hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v11 = 2654435761u * self->_reportClientOperationFrequency;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    unint64_t v12 = 0;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  unint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  unint64_t v12 = 2654435761u * self->_reportClientOperationFrequencyBase;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  clientProcessVersion = self->_clientProcessVersion;
  if ((unint64_t)clientProcessVersion | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](clientProcessVersion, "isEqual:")) {
      goto LABEL_43;
    }
  }
  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](clientBundleId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  container = self->_container;
  if ((unint64_t)container | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](container, "isEqual:")) {
      goto LABEL_43;
    }
  }
  environment = self->_environment;
  if ((unint64_t)environment | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](environment, "isEqual:")) {
      goto LABEL_43;
    }
  }
  char has = (char)self->_has;
  char v10 = *((unsigned char *)v4 + 92);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x10) == 0) {
      goto LABEL_43;
    }
    if (self->_anonymous)
    {
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_43;
      }
    }
    else if (*((unsigned char *)v4 + 88))
    {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  operationGroups = self->_operationGroups;
  if ((unint64_t)operationGroups | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](operationGroups, "isEqual:")) {
      goto LABEL_43;
    }
    char has = (char)self->_has;
    char v10 = *((unsigned char *)v4 + 92);
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_reportOperationGroupFrequency != *((void *)v4 + 3)) {
      goto LABEL_43;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_reportOperationGroupFrequencyBase != *((void *)v4 + 4)) {
      goto LABEL_43;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_43;
  }
  clientOperations = self->_clientOperations;
  if ((unint64_t)clientOperations | *((void *)v4 + 6))
  {
    if (-[NSMutableArray isEqual:](clientOperations, "isEqual:"))
    {
      char has = (char)self->_has;
      char v10 = *((unsigned char *)v4 + 92);
      goto LABEL_34;
    }
LABEL_43:
    BOOL v13 = 0;
    goto LABEL_44;
  }
LABEL_34:
  if (has)
  {
    if ((v10 & 1) == 0 || self->_reportClientOperationFrequency != *((void *)v4 + 1)) {
      goto LABEL_43;
    }
  }
  else if (v10)
  {
    goto LABEL_43;
  }
  BOOL v13 = (v10 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_reportClientOperationFrequencyBase != *((void *)v4 + 2)) {
      goto LABEL_43;
    }
    BOOL v13 = 1;
  }
LABEL_44:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_clientProcessVersion copyWithZone:a3];
  unint64_t v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = [(NSString *)self->_clientBundleId copyWithZone:a3];
  unint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(NSString *)self->_container copyWithZone:a3];
  unint64_t v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = [(NSString *)self->_environment copyWithZone:a3];
  BOOL v13 = (void *)v5[9];
  v5[9] = v12;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v5 + 88) = self->_anonymous;
    *((unsigned char *)v5 + 92) |= 0x10u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  NSUInteger v14 = self->_operationGroups;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        [v5 addOperationGroup:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v16);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[3] = self->_reportOperationGroupFrequency;
    *((unsigned char *)v5 + 92) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v5[4] = self->_reportOperationGroupFrequencyBase;
    *((unsigned char *)v5 + 92) |= 8u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v21 = self->_clientOperations;
  id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [[*(id *)(*((void *)&v29 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addClientOperation:v26];
      }
      id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }

  char v27 = (char)self->_has;
  if (v27)
  {
    v5[1] = self->_reportClientOperationFrequency;
    *((unsigned char *)v5 + 92) |= 1u;
    char v27 = (char)self->_has;
  }
  if ((v27 & 2) != 0)
  {
    v5[2] = self->_reportClientOperationFrequencyBase;
    *((unsigned char *)v5 + 92) |= 2u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (self->_clientProcessVersion)
  {
    [v4 setClientProcessVersion:];
    id v4 = v15;
  }
  if (self->_clientBundleId)
  {
    [v15 setClientBundleId:];
    id v4 = v15;
  }
  if (self->_container)
  {
    [v15 setContainer:];
    id v4 = v15;
  }
  if (self->_environment)
  {
    [v15 setEnvironment:];
    id v4 = v15;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[88] = self->_anonymous;
    v4[92] |= 0x10u;
  }
  if ([(SECC2MPCloudKitInfo *)self operationGroupsCount])
  {
    [v15 clearOperationGroups];
    unint64_t v5 = [(SECC2MPCloudKitInfo *)self operationGroupsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = [(SECC2MPCloudKitInfo *)self operationGroupAtIndex:i];
        [v15 addOperationGroup:v8];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v15 + 3) = self->_reportOperationGroupFrequency;
    v15[92] |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((void *)v15 + 4) = self->_reportOperationGroupFrequencyBase;
    v15[92] |= 8u;
  }
  if ([(SECC2MPCloudKitInfo *)self clientOperationsCount])
  {
    [v15 clearClientOperations];
    unint64_t v10 = [(SECC2MPCloudKitInfo *)self clientOperationsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        BOOL v13 = [(SECC2MPCloudKitInfo *)self clientOperationAtIndex:j];
        [v15 addClientOperation:v13];
      }
    }
  }
  char v14 = (char)self->_has;
  if (v14)
  {
    *((void *)v15 + 1) = self->_reportClientOperationFrequency;
    v15[92] |= 1u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *((void *)v15 + 2) = self->_reportClientOperationFrequencyBase;
    v15[92] |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_clientProcessVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_container) {
    PBDataWriterWriteStringField();
  }
  if (self->_environment) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v5 = self->_operationGroups;
  unint64_t v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      unint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v11 = self->_clientOperations;
  id v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    BOOL v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      BOOL v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = (char)self->_has;
  if (v16)
  {
    PBDataWriterWriteUint64Field();
    char v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_100165D48(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  clientProcessVersion = self->_clientProcessVersion;
  if (clientProcessVersion) {
    [v3 setObject:clientProcessVersion forKey:@"client_process_version"];
  }
  clientBundleId = self->_clientBundleId;
  if (clientBundleId) {
    [v4 setObject:clientBundleId forKey:@"client_bundle_id"];
  }
  container = self->_container;
  if (container) {
    [v4 setObject:container forKey:@"container"];
  }
  environment = self->_environment;
  if (environment) {
    [v4 setObject:environment forKey:@"environment"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unint64_t v9 = +[NSNumber numberWithBool:self->_anonymous];
    [v4 setObject:v9 forKey:@"anonymous"];
  }
  if ([(NSMutableArray *)self->_operationGroups count])
  {
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_operationGroups, "count")];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    unint64_t v11 = self->_operationGroups;
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          char v16 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"operation_group"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    long long v18 = +[NSNumber numberWithUnsignedLongLong:self->_reportOperationGroupFrequency];
    [v4 setObject:v18 forKey:@"report_operation_group_frequency"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    long long v19 = +[NSNumber numberWithUnsignedLongLong:self->_reportOperationGroupFrequencyBase];
    [v4 setObject:v19 forKey:@"report_operation_group_frequency_base"];
  }
  if ([(NSMutableArray *)self->_clientOperations count])
  {
    id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_clientOperations, "count")];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v21 = self->_clientOperations;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v23; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) dictionaryRepresentation:v31];
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"client_operation"];
  }
  char v27 = (char)self->_has;
  if (v27)
  {
    v28 = +[NSNumber numberWithUnsignedLongLong:self->_reportClientOperationFrequency];
    [v4 setObject:v28 forKey:@"report_client_operation_frequency"];

    char v27 = (char)self->_has;
  }
  if ((v27 & 2) != 0)
  {
    long long v29 = +[NSNumber numberWithUnsignedLongLong:self->_reportClientOperationFrequencyBase];
    [v4 setObject:v29 forKey:@"report_client_operation_frequency_base"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPCloudKitInfo;
  NSUInteger v3 = [(SECC2MPCloudKitInfo *)&v7 description];
  id v4 = [(SECC2MPCloudKitInfo *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasReportClientOperationFrequencyBase
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasReportClientOperationFrequencyBase:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setReportClientOperationFrequencyBase:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_reportClientOperationFrequencyBase = a3;
}

- (BOOL)hasReportClientOperationFrequency
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasReportClientOperationFrequency:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setReportClientOperationFrequency:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reportClientOperationFrequency = a3;
}

- (id)clientOperationAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_clientOperations objectAtIndex:a3];
}

- (unint64_t)clientOperationsCount
{
  return (unint64_t)[(NSMutableArray *)self->_clientOperations count];
}

- (void)addClientOperation:(id)a3
{
  id v4 = a3;
  clientOperations = self->_clientOperations;
  id v8 = v4;
  if (!clientOperations)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_clientOperations;
    self->_clientOperations = v6;

    id v4 = v8;
    clientOperations = self->_clientOperations;
  }
  [(NSMutableArray *)clientOperations addObject:v4];
}

- (void)clearClientOperations
{
}

- (BOOL)hasReportOperationGroupFrequencyBase
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasReportOperationGroupFrequencyBase:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_reportOperationGroupFrequencyBase = a3;
}

- (BOOL)hasReportOperationGroupFrequency
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasReportOperationGroupFrequency:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setReportOperationGroupFrequency:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_reportOperationGroupFrequency = a3;
}

- (id)operationGroupAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_operationGroups objectAtIndex:a3];
}

- (unint64_t)operationGroupsCount
{
  return (unint64_t)[(NSMutableArray *)self->_operationGroups count];
}

- (void)addOperationGroup:(id)a3
{
  id v4 = a3;
  operationGroups = self->_operationGroups;
  id v8 = v4;
  if (!operationGroups)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_operationGroups;
    self->_operationGroups = v6;

    id v4 = v8;
    operationGroups = self->_operationGroups;
  }
  [(NSMutableArray *)operationGroups addObject:v4];
}

- (void)clearOperationGroups
{
}

- (BOOL)hasAnonymous
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasAnonymous:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setAnonymous:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_anonymous = a3;
}

- (BOOL)hasEnvironment
{
  return self->_environment != 0;
}

- (BOOL)hasContainer
{
  return self->_container != 0;
}

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0;
}

- (BOOL)hasClientProcessVersion
{
  return self->_clientProcessVersion != 0;
}

+ (Class)clientOperationType
{
  return (Class)objc_opt_class();
}

+ (Class)operationGroupType
{
  return (Class)objc_opt_class();
}

@end