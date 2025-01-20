@interface SIRINLUEXTERNALEntityCandidate
+ (Class)annotationsType;
- (BOOL)hasAppBundleId;
- (BOOL)hasEntity;
- (BOOL)hasEntityId;
- (BOOL)hasGroupId;
- (BOOL)hasMetadata;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)annotations;
- (SIRICOMMONDoubleValue)score;
- (SIRICOMMONStringValue)appBundleId;
- (SIRICOMMONStringValue)entityId;
- (SIRINLUEXTERNALRRGroupIdentifier)groupId;
- (SIRINLUEXTERNALRRMetadata)metadata;
- (SIRINLUEXTERNALUsoGraph)entity;
- (id)annotationsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)annotationsCount;
- (unint64_t)hash;
- (void)addAnnotations:(id)a3;
- (void)clearAnnotations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setEntity:(id)a3;
- (void)setEntityId:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setScore:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALEntityCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
}

- (void)setMetadata:(id)a3
{
}

- (SIRINLUEXTERNALRRMetadata)metadata
{
  return self->_metadata;
}

- (void)setAnnotations:(id)a3
{
}

- (NSMutableArray)annotations
{
  return self->_annotations;
}

- (void)setGroupId:(id)a3
{
}

- (SIRINLUEXTERNALRRGroupIdentifier)groupId
{
  return self->_groupId;
}

- (void)setAppBundleId:(id)a3
{
}

- (SIRICOMMONStringValue)appBundleId
{
  return self->_appBundleId;
}

- (void)setEntityId:(id)a3
{
}

- (SIRICOMMONStringValue)entityId
{
  return self->_entityId;
}

- (void)setScore:(id)a3
{
}

- (SIRICOMMONDoubleValue)score
{
  return self->_score;
}

- (void)setEntity:(id)a3
{
}

- (SIRINLUEXTERNALUsoGraph)entity
{
  return self->_entity;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  entity = self->_entity;
  uint64_t v6 = *((void *)v4 + 3);
  if (entity)
  {
    if (v6) {
      -[SIRINLUEXTERNALUsoGraph mergeFrom:](entity, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALEntityCandidate setEntity:](self, "setEntity:");
  }
  score = self->_score;
  uint64_t v8 = *((void *)v4 + 7);
  if (score)
  {
    if (v8) {
      -[SIRICOMMONDoubleValue mergeFrom:](score, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALEntityCandidate setScore:](self, "setScore:");
  }
  entityId = self->_entityId;
  uint64_t v10 = *((void *)v4 + 4);
  if (entityId)
  {
    if (v10) {
      -[SIRICOMMONStringValue mergeFrom:](entityId, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALEntityCandidate setEntityId:](self, "setEntityId:");
  }
  appBundleId = self->_appBundleId;
  uint64_t v12 = *((void *)v4 + 2);
  if (appBundleId)
  {
    if (v12) {
      -[SIRICOMMONStringValue mergeFrom:](appBundleId, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SIRINLUEXTERNALEntityCandidate setAppBundleId:](self, "setAppBundleId:");
  }
  groupId = self->_groupId;
  uint64_t v14 = *((void *)v4 + 5);
  if (groupId)
  {
    if (v14) {
      -[SIRINLUEXTERNALRRGroupIdentifier mergeFrom:](groupId, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SIRINLUEXTERNALEntityCandidate setGroupId:](self, "setGroupId:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = *((id *)v4 + 1);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        -[SIRINLUEXTERNALEntityCandidate addAnnotations:](self, "addAnnotations:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  metadata = self->_metadata;
  uint64_t v21 = *((void *)v4 + 6);
  if (metadata)
  {
    if (v21) {
      -[SIRINLUEXTERNALRRMetadata mergeFrom:](metadata, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[SIRINLUEXTERNALEntityCandidate setMetadata:](self, "setMetadata:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUsoGraph *)self->_entity hash];
  unint64_t v4 = [(SIRICOMMONDoubleValue *)self->_score hash] ^ v3;
  unint64_t v5 = [(SIRICOMMONStringValue *)self->_entityId hash];
  unint64_t v6 = v4 ^ v5 ^ [(SIRICOMMONStringValue *)self->_appBundleId hash];
  unint64_t v7 = [(SIRINLUEXTERNALRRGroupIdentifier *)self->_groupId hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_annotations hash];
  return v6 ^ v8 ^ [(SIRINLUEXTERNALRRMetadata *)self->_metadata hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((entity = self->_entity, !((unint64_t)entity | v4[3]))
     || -[SIRINLUEXTERNALUsoGraph isEqual:](entity, "isEqual:"))
    && ((score = self->_score, !((unint64_t)score | v4[7]))
     || -[SIRICOMMONDoubleValue isEqual:](score, "isEqual:"))
    && ((entityId = self->_entityId, !((unint64_t)entityId | v4[4]))
     || -[SIRICOMMONStringValue isEqual:](entityId, "isEqual:"))
    && ((appBundleId = self->_appBundleId, !((unint64_t)appBundleId | v4[2]))
     || -[SIRICOMMONStringValue isEqual:](appBundleId, "isEqual:"))
    && ((groupId = self->_groupId, !((unint64_t)groupId | v4[5]))
     || -[SIRINLUEXTERNALRRGroupIdentifier isEqual:](groupId, "isEqual:"))
    && ((annotations = self->_annotations, !((unint64_t)annotations | v4[1]))
     || -[NSMutableArray isEqual:](annotations, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[6]) {
      char v12 = -[SIRINLUEXTERNALRRMetadata isEqual:](metadata, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUsoGraph *)self->_entity copyWithZone:a3];
  unint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(SIRICOMMONDoubleValue *)self->_score copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(SIRICOMMONStringValue *)self->_entityId copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(SIRICOMMONStringValue *)self->_appBundleId copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(SIRINLUEXTERNALRRGroupIdentifier *)self->_groupId copyWithZone:a3];
  id v15 = (void *)v5[5];
  v5[5] = v14;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = self->_annotations;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v20), "copyWithZone:", a3, (void)v25);
        [v5 addAnnotations:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  id v22 = [(SIRINLUEXTERNALRRMetadata *)self->_metadata copyWithZone:a3];
  long long v23 = (void *)v5[6];
  v5[6] = v22;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_entity) {
    objc_msgSend(v8, "setEntity:");
  }
  if (self->_score) {
    objc_msgSend(v8, "setScore:");
  }
  if (self->_entityId) {
    objc_msgSend(v8, "setEntityId:");
  }
  if (self->_appBundleId) {
    objc_msgSend(v8, "setAppBundleId:");
  }
  if (self->_groupId) {
    objc_msgSend(v8, "setGroupId:");
  }
  if ([(SIRINLUEXTERNALEntityCandidate *)self annotationsCount])
  {
    [v8 clearAnnotations];
    unint64_t v4 = [(SIRINLUEXTERNALEntityCandidate *)self annotationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(SIRINLUEXTERNALEntityCandidate *)self annotationsAtIndex:i];
        [v8 addAnnotations:v7];
      }
    }
  }
  if (self->_metadata) {
    objc_msgSend(v8, "setMetadata:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_entity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_score) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_entityId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appBundleId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_groupId) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_annotations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_metadata) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALEntityCandidateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  entity = self->_entity;
  if (entity)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUsoGraph *)entity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"entity"];
  }
  score = self->_score;
  if (score)
  {
    uint64_t v7 = [(SIRICOMMONDoubleValue *)score dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"score"];
  }
  entityId = self->_entityId;
  if (entityId)
  {
    uint64_t v9 = [(SIRICOMMONStringValue *)entityId dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"entity_id"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId)
  {
    long long v11 = [(SIRICOMMONStringValue *)appBundleId dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"app_bundle_id"];
  }
  groupId = self->_groupId;
  if (groupId)
  {
    long long v13 = [(SIRINLUEXTERNALRRGroupIdentifier *)groupId dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"group_id"];
  }
  if ([(NSMutableArray *)self->_annotations count])
  {
    id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_annotations, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v15 = self->_annotations;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (void)v24);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"annotations"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    id v22 = [(SIRINLUEXTERNALRRMetadata *)metadata dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"metadata"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALEntityCandidate;
  id v4 = [(SIRINLUEXTERNALEntityCandidate *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALEntityCandidate *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)annotationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_annotations objectAtIndex:a3];
}

- (unint64_t)annotationsCount
{
  return [(NSMutableArray *)self->_annotations count];
}

- (void)addAnnotations:(id)a3
{
  id v4 = a3;
  annotations = self->_annotations;
  id v8 = v4;
  if (!annotations)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_annotations;
    self->_annotations = v6;

    id v4 = v8;
    annotations = self->_annotations;
  }
  [(NSMutableArray *)annotations addObject:v4];
}

- (void)clearAnnotations
{
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

- (BOOL)hasScore
{
  return self->_score != 0;
}

- (BOOL)hasEntity
{
  return self->_entity != 0;
}

+ (Class)annotationsType
{
  return (Class)objc_opt_class();
}

@end