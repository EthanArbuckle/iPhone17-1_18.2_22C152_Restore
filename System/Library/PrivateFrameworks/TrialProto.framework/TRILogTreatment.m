@interface TRILogTreatment
+ (Class)namespaceNameType;
+ (Class)namespaceType;
- (BOOL)hasDeploymentId;
- (BOOL)hasExperimentId;
- (BOOL)hasTreatmentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)namespaceNames;
- (NSMutableArray)namespaces;
- (NSString)experimentId;
- (NSString)treatmentId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)namespaceAtIndex:(unint64_t)a3;
- (id)namespaceNameAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)namespaceIdsCount;
- (unint64_t)namespaceNamesCount;
- (unint64_t)namespacesCount;
- (unsigned)deploymentId;
- (unsigned)namespaceIdAtIndex:(unint64_t)a3;
- (unsigned)namespaceIds;
- (void)addNamespace:(id)a3;
- (void)addNamespaceId:(unsigned int)a3;
- (void)addNamespaceName:(id)a3;
- (void)clearNamespaceIds;
- (void)clearNamespaceNames;
- (void)clearNamespaces;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDeploymentId:(unsigned int)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasDeploymentId:(BOOL)a3;
- (void)setNamespaceIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNamespaceNames:(id)a3;
- (void)setNamespaces:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRILogTreatment

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)TRILogTreatment;
  [(TRILogTreatment *)&v3 dealloc];
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (unint64_t)namespaceIdsCount
{
  return self->_namespaceIds.count;
}

- (unsigned)namespaceIds
{
  return self->_namespaceIds.list;
}

- (void)clearNamespaceIds
{
}

- (void)addNamespaceId:(unsigned int)a3
{
}

- (unsigned)namespaceIdAtIndex:(unint64_t)a3
{
  p_namespaceIds = &self->_namespaceIds;
  unint64_t count = self->_namespaceIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_namespaceIds->list[a3];
}

- (void)setNamespaceIds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setDeploymentId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deploymentId = a3;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeploymentId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearNamespaces
{
}

- (void)addNamespace:(id)a3
{
  id v4 = a3;
  namespaces = self->_namespaces;
  id v8 = v4;
  if (!namespaces)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_namespaces;
    self->_namespaces = v6;

    id v4 = v8;
    namespaces = self->_namespaces;
  }
  [(NSMutableArray *)namespaces addObject:v4];
}

- (unint64_t)namespacesCount
{
  return [(NSMutableArray *)self->_namespaces count];
}

- (id)namespaceAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_namespaces objectAtIndex:a3];
}

+ (Class)namespaceType
{
  return (Class)objc_opt_class();
}

- (void)clearNamespaceNames
{
}

- (void)addNamespaceName:(id)a3
{
  id v4 = a3;
  namespaceNames = self->_namespaceNames;
  id v8 = v4;
  if (!namespaceNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_namespaceNames;
    self->_namespaceNames = v6;

    id v4 = v8;
    namespaceNames = self->_namespaceNames;
  }
  [(NSMutableArray *)namespaceNames addObject:v4];
}

- (unint64_t)namespaceNamesCount
{
  return [(NSMutableArray *)self->_namespaceNames count];
}

- (id)namespaceNameAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_namespaceNames objectAtIndex:a3];
}

+ (Class)namespaceNameType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRILogTreatment;
  id v4 = [(TRILogTreatment *)&v8 description];
  v5 = [(TRILogTreatment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  experimentId = self->_experimentId;
  if (experimentId) {
    [v3 setObject:experimentId forKey:@"experiment_id"];
  }
  treatmentId = self->_treatmentId;
  if (treatmentId) {
    [v4 setObject:treatmentId forKey:@"treatment_id"];
  }
  uint64_t v7 = PBRepeatedUInt32NSArray();
  [v4 setObject:v7 forKey:@"namespace_id"];

  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_deploymentId];
    [v4 setObject:v8 forKey:@"deployment_id"];
  }
  if ([(NSMutableArray *)self->_namespaces count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_namespaces, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = self->_namespaces;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"namespace"];
  }
  namespaceNames = self->_namespaceNames;
  if (namespaceNames) {
    [v4 setObject:namespaceNames forKey:@"namespace_name"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogTreatmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_experimentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_namespaceIds.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_namespaceIds.count);
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_namespaceNames;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = self->_namespaces;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  id v15 = a3;
  if (self->_experimentId) {
    objc_msgSend(v15, "setExperimentId:");
  }
  if (self->_treatmentId) {
    objc_msgSend(v15, "setTreatmentId:");
  }
  if ([(TRILogTreatment *)self namespaceIdsCount])
  {
    [v15 clearNamespaceIds];
    unint64_t v4 = [(TRILogTreatment *)self namespaceIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v15, "addNamespaceId:", -[TRILogTreatment namespaceIdAtIndex:](self, "namespaceIdAtIndex:", i));
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v15 + 8) = self->_deploymentId;
    *((unsigned char *)v15 + 72) |= 1u;
  }
  if ([(TRILogTreatment *)self namespaceNamesCount])
  {
    [v15 clearNamespaceNames];
    unint64_t v7 = [(TRILogTreatment *)self namespaceNamesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(TRILogTreatment *)self namespaceNameAtIndex:j];
        [v15 addNamespaceName:v10];
      }
    }
  }
  if ([(TRILogTreatment *)self namespacesCount])
  {
    [v15 clearNamespaces];
    unint64_t v11 = [(TRILogTreatment *)self namespacesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        uint64_t v14 = [(TRILogTreatment *)self namespaceAtIndex:k];
        [v15 addNamespace:v14];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_experimentId copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_treatmentId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  PBRepeatedUInt32Copy();
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_deploymentId;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = self->_namespaceNames;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v14) copyWithZone:a3];
        [(id)v5 addNamespaceName:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_namespaces;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (void)v23);
        [(id)v5 addNamespace:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:")) {
      goto LABEL_16;
    }
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](treatmentId, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_deploymentId != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_16:
    char v9 = 0;
    goto LABEL_17;
  }
  namespaceNames = self->_namespaceNames;
  if ((unint64_t)namespaceNames | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](namespaceNames, "isEqual:"))
  {
    goto LABEL_16;
  }
  namespaces = self->_namespaces;
  if ((unint64_t)namespaces | *((void *)v4 + 7)) {
    char v9 = -[NSMutableArray isEqual:](namespaces, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  NSUInteger v4 = [(NSString *)self->_treatmentId hash];
  uint64_t v5 = PBRepeatedUInt32Hash();
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_deploymentId;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_namespaceNames hash];
  return v7 ^ [(NSMutableArray *)self->_namespaces hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[TRILogTreatment setExperimentId:](self, "setExperimentId:");
  }
  if (*((void *)v4 + 8)) {
    -[TRILogTreatment setTreatmentId:](self, "setTreatmentId:");
  }
  uint64_t v5 = [v4 namespaceIdsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[TRILogTreatment addNamespaceId:](self, "addNamespaceId:", [v4 namespaceIdAtIndex:i]);
  }
  if (*((unsigned char *)v4 + 72))
  {
    self->_deploymentId = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = *((id *)v4 + 6);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [(TRILogTreatment *)self addNamespaceName:*(void *)(*((void *)&v22 + 1) + 8 * j)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v4 + 7);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[TRILogTreatment addNamespace:](self, "addNamespace:", *(void *)(*((void *)&v18 + 1) + 8 * k), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (unsigned)deploymentId
{
  return self->_deploymentId;
}

- (NSMutableArray)namespaces
{
  return self->_namespaces;
}

- (void)setNamespaces:(id)a3
{
}

- (NSMutableArray)namespaceNames
{
  return self->_namespaceNames;
}

- (void)setNamespaceNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_namespaceNames, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end