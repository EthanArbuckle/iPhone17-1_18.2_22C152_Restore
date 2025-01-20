@interface ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported
- (BOOL)hasCollectionStatus;
- (BOOL)hasUserSamplingId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)odsampleIds;
- (NSData)jsonData;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported)initWithDictionary:(id)a3;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported)initWithJSON:(id)a3;
- (SISchemaUUID)userSamplingId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)odsampleIdsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)collectionStatus;
- (unint64_t)hash;
- (unint64_t)odsampleIdsCount;
- (void)addOdsampleIds:(id)a3;
- (void)clearOdsampleIds;
- (void)deleteCollectionStatus;
- (void)deleteUserSamplingId;
- (void)setCollectionStatus:(int)a3;
- (void)setHasCollectionStatus:(BOOL)a3;
- (void)setHasUserSamplingId:(BOOL)a3;
- (void)setOdsampleIds:(id)a3;
- (void)setUserSamplingId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self userSamplingId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self deleteUserSamplingId];
  }
  v9 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self odsampleIds];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self setOdsampleIds:v10];

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odsampleIds, 0);
  objc_storeStrong((id *)&self->_userSamplingId, 0);
}

- (void)setHasUserSamplingId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)collectionStatus
{
  return self->_collectionStatus;
}

- (void)setOdsampleIds:(id)a3
{
}

- (NSArray)odsampleIds
{
  return self->_odsampleIds;
}

- (void)setUserSamplingId:(id)a3
{
}

- (SISchemaUUID)userSamplingId
{
  return self->_userSamplingId;
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported;
  v5 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"userSamplingId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)v5 setUserSamplingId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"odsampleIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
              [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)v5 addOdsampleIds:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      v6 = v19;
    }
    v16 = [v4 objectForKeyedSubscript:@"collectionStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported setCollectionStatus:](v5, "setCollectionStatus:", [v16 intValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self collectionStatus]
       - 1;
    if (v4 > 2) {
      v5 = @"ODSAMPLECOLLECTIONSTATUS_UNKNOWN";
    }
    else {
      v5 = off_1E5EC0FA0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"collectionStatus"];
  }
  if ([(NSArray *)self->_odsampleIds count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = self->_odsampleIds;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"odsampleIds"];
  }
  if (self->_userSamplingId)
  {
    uint64_t v14 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self userSamplingId];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"userSamplingId"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"userSamplingId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_userSamplingId hash];
  uint64_t v4 = [(NSArray *)self->_odsampleIds hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_collectionStatus;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self userSamplingId];
  v6 = [v4 userSamplingId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self userSamplingId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self userSamplingId];
    uint64_t v10 = [v4 userSamplingId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self odsampleIds];
  v6 = [v4 odsampleIds];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self odsampleIds];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self odsampleIds];
    v15 = [v4 odsampleIds];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int collectionStatus = self->_collectionStatus,
          collectionStatus == [v4 collectionStatus]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self userSamplingId];

  if (v5)
  {
    v6 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReported *)self userSamplingId];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_odsampleIds;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleManifestReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteCollectionStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCollectionStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCollectionStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCollectionStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int collectionStatus = a3;
}

- (id)odsampleIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_odsampleIds objectAtIndexedSubscript:a3];
}

- (unint64_t)odsampleIdsCount
{
  return [(NSArray *)self->_odsampleIds count];
}

- (void)addOdsampleIds:(id)a3
{
  id v4 = a3;
  odsampleIds = self->_odsampleIds;
  id v8 = v4;
  if (!odsampleIds)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_odsampleIds;
    self->_odsampleIds = v6;

    id v4 = v8;
    odsampleIds = self->_odsampleIds;
  }
  [(NSArray *)odsampleIds addObject:v4];
}

- (void)clearOdsampleIds
{
}

- (void)deleteUserSamplingId
{
}

- (BOOL)hasUserSamplingId
{
  return self->_userSamplingId != 0;
}

@end