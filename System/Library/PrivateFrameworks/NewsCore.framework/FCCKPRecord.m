@interface FCCKPRecord
+ (Class)conflictLoserEtagsType;
+ (Class)fieldsType;
- (BOOL)hasCreatedBy;
- (BOOL)hasEtag;
- (BOOL)hasModifiedBy;
- (BOOL)hasModifiedByDevice;
- (BOOL)hasRecordIdentifier;
- (BOOL)hasTimeStatistics;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FCCKPDateStatistics)timeStatistics;
- (FCCKPIdentifier)createdBy;
- (FCCKPIdentifier)modifiedBy;
- (FCCKPRecordIdentifier)recordIdentifier;
- (FCCKPRecordType)type;
- (NSMutableArray)conflictLoserEtags;
- (NSMutableArray)fields;
- (NSString)etag;
- (NSString)modifiedByDevice;
- (id)conflictLoserEtagsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldsAtIndex:(unint64_t)a3;
- (unint64_t)conflictLoserEtagsCount;
- (unint64_t)fieldsCount;
- (unint64_t)hash;
- (void)addConflictLoserEtags:(id)a3;
- (void)addFields:(id)a3;
- (void)clearConflictLoserEtags;
- (void)clearFields;
- (void)mergeFrom:(id)a3;
- (void)setConflictLoserEtags:(id)a3;
- (void)setCreatedBy:(id)a3;
- (void)setEtag:(id)a3;
- (void)setFields:(id)a3;
- (void)setModifiedBy:(id)a3;
- (void)setModifiedByDevice:(id)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setTimeStatistics:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRecord

- (FCCKPDateStatistics)timeStatistics
{
  return self->_timeStatistics;
}

- (FCCKPRecordType)type
{
  return self->_type;
}

- (FCCKPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (BOOL)hasTimeStatistics
{
  return self->_timeStatistics != 0;
}

- (NSMutableArray)fields
{
  return self->_fields;
}

- (NSString)etag
{
  return self->_etag;
}

- (NSMutableArray)conflictLoserEtags
{
  return self->_conflictLoserEtags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_timeStatistics, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedByDevice, 0);
  objc_storeStrong((id *)&self->_modifiedBy, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_createdBy, 0);
  objc_storeStrong((id *)&self->_conflictLoserEtags, 0);
}

- (void)addFields:(id)a3
{
  id v4 = a3;
  fields = self->_fields;
  id v8 = v4;
  if (!fields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_fields;
    self->_fields = v6;

    id v4 = v8;
    fields = self->_fields;
  }
  [(NSMutableArray *)fields addObject:v4];
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasCreatedBy
{
  return self->_createdBy != 0;
}

- (void)clearFields
{
}

- (unint64_t)fieldsCount
{
  return [(NSMutableArray *)self->_fields count];
}

- (id)fieldsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_fields objectAtIndex:a3];
}

+ (Class)fieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasModifiedBy
{
  return self->_modifiedBy != 0;
}

- (void)clearConflictLoserEtags
{
}

- (void)addConflictLoserEtags:(id)a3
{
  id v4 = a3;
  conflictLoserEtags = self->_conflictLoserEtags;
  id v8 = v4;
  if (!conflictLoserEtags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_conflictLoserEtags;
    self->_conflictLoserEtags = v6;

    id v4 = v8;
    conflictLoserEtags = self->_conflictLoserEtags;
  }
  [(NSMutableArray *)conflictLoserEtags addObject:v4];
}

- (unint64_t)conflictLoserEtagsCount
{
  return [(NSMutableArray *)self->_conflictLoserEtags count];
}

- (id)conflictLoserEtagsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_conflictLoserEtags objectAtIndex:a3];
}

+ (Class)conflictLoserEtagsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasModifiedByDevice
{
  return self->_modifiedByDevice != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecord;
  id v4 = [(FCCKPRecord *)&v8 description];
  v5 = [(FCCKPRecord *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  etag = self->_etag;
  if (etag) {
    [v3 setObject:etag forKey:@"etag"];
  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    v7 = [(FCCKPRecordIdentifier *)recordIdentifier dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"recordIdentifier"];
  }
  type = self->_type;
  if (type)
  {
    v9 = [(FCCKPRecordType *)type dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"type"];
  }
  createdBy = self->_createdBy;
  if (createdBy)
  {
    v11 = [(FCCKPIdentifier *)createdBy dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"createdBy"];
  }
  timeStatistics = self->_timeStatistics;
  if (timeStatistics)
  {
    v13 = [(FCCKPDateStatistics *)timeStatistics dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"timeStatistics"];
  }
  if ([(NSMutableArray *)self->_fields count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fields, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = self->_fields;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"fields"];
  }
  modifiedBy = self->_modifiedBy;
  if (modifiedBy)
  {
    v22 = [(FCCKPIdentifier *)modifiedBy dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"modifiedBy"];
  }
  conflictLoserEtags = self->_conflictLoserEtags;
  if (conflictLoserEtags) {
    [v4 setObject:conflictLoserEtags forKey:@"conflictLoserEtags"];
  }
  modifiedByDevice = self->_modifiedByDevice;
  if (modifiedByDevice) {
    [v4 setObject:modifiedByDevice forKey:@"modifiedByDevice"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_etag) {
    PBDataWriterWriteStringField();
  }
  if (self->_recordIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_type) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_createdBy) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_timeStatistics) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_fields;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_modifiedBy) {
    PBDataWriterWriteSubmessage();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_conflictLoserEtags;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_modifiedByDevice) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_etag copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(FCCKPRecordIdentifier *)self->_recordIdentifier copyWithZone:a3];
  uint64_t v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(FCCKPRecordType *)self->_type copyWithZone:a3];
  uint64_t v11 = (void *)v5[9];
  v5[9] = v10;

  id v12 = [(FCCKPIdentifier *)self->_createdBy copyWithZone:a3];
  uint64_t v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(FCCKPDateStatistics *)self->_timeStatistics copyWithZone:a3];
  long long v15 = (void *)v5[8];
  v5[8] = v14;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v16 = self->_fields;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addFields:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v18);
  }

  id v22 = [(FCCKPIdentifier *)self->_modifiedBy copyWithZone:a3];
  v23 = (void *)v5[5];
  v5[5] = v22;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v24 = self->_conflictLoserEtags;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v34;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v28), "copyWithZone:", a3, (void)v33);
        [v5 addConflictLoserEtags:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v26);
  }

  uint64_t v30 = [(NSString *)self->_modifiedByDevice copyWithZone:a3];
  uint64_t v31 = (void *)v5[6];
  v5[6] = v30;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  etag = self->_etag;
  if ((unint64_t)etag | v4[3])
  {
    if (!-[NSString isEqual:](etag, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (((recordIdentifier = self->_recordIdentifier, !((unint64_t)recordIdentifier | v4[7]))
     || -[FCCKPRecordIdentifier isEqual:](recordIdentifier, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[9])) || -[FCCKPRecordType isEqual:](type, "isEqual:"))
    && ((createdBy = self->_createdBy, !((unint64_t)createdBy | v4[2]))
     || -[FCCKPIdentifier isEqual:](createdBy, "isEqual:"))
    && ((timeStatistics = self->_timeStatistics, !((unint64_t)timeStatistics | v4[8]))
     || -[FCCKPDateStatistics isEqual:](timeStatistics, "isEqual:"))
    && ((fields = self->_fields, !((unint64_t)fields | v4[4]))
     || -[NSMutableArray isEqual:](fields, "isEqual:"))
    && ((modifiedBy = self->_modifiedBy, !((unint64_t)modifiedBy | v4[5]))
     || -[FCCKPIdentifier isEqual:](modifiedBy, "isEqual:"))
    && ((conflictLoserEtags = self->_conflictLoserEtags, !((unint64_t)conflictLoserEtags | v4[1]))
     || -[NSMutableArray isEqual:](conflictLoserEtags, "isEqual:")))
  {
    modifiedByDevice = self->_modifiedByDevice;
    if ((unint64_t)modifiedByDevice | v4[6]) {
      char v14 = -[NSString isEqual:](modifiedByDevice, "isEqual:");
    }
    else {
      char v14 = 1;
    }
  }
  else
  {
LABEL_20:
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_etag hash];
  unint64_t v4 = [(FCCKPRecordIdentifier *)self->_recordIdentifier hash] ^ v3;
  unint64_t v5 = [(FCCKPRecordType *)self->_type hash];
  unint64_t v6 = v4 ^ v5 ^ [(FCCKPIdentifier *)self->_createdBy hash];
  unint64_t v7 = [(FCCKPDateStatistics *)self->_timeStatistics hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_fields hash];
  unint64_t v9 = v6 ^ v8 ^ [(FCCKPIdentifier *)self->_modifiedBy hash];
  uint64_t v10 = [(NSMutableArray *)self->_conflictLoserEtags hash];
  return v9 ^ v10 ^ [(NSString *)self->_modifiedByDevice hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[FCCKPRecord setEtag:](self, "setEtag:");
  }
  recordIdentifier = self->_recordIdentifier;
  unint64_t v6 = (void *)*((void *)v4 + 7);
  if (recordIdentifier)
  {
    if (v6) {
      -[FCCKPRecordIdentifier mergeFrom:]((uint64_t)recordIdentifier, v6);
    }
  }
  else if (v6)
  {
    [(FCCKPRecord *)self setRecordIdentifier:*((void *)v4 + 7)];
  }
  type = self->_type;
  uint64_t v8 = *((void *)v4 + 9);
  if (type)
  {
    if (v8) {
      -[FCCKPRecordType mergeFrom:](type, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[FCCKPRecord setType:](self, "setType:");
  }
  createdBy = self->_createdBy;
  uint64_t v10 = (void *)*((void *)v4 + 2);
  if (createdBy)
  {
    if (v10) {
      -[FCCKPIdentifier mergeFrom:]((uint64_t)createdBy, v10);
    }
  }
  else if (v10)
  {
    [(FCCKPRecord *)self setCreatedBy:*((void *)v4 + 2)];
  }
  timeStatistics = self->_timeStatistics;
  id v12 = (void *)*((void *)v4 + 8);
  if (timeStatistics)
  {
    if (v12) {
      -[FCCKPDateStatistics mergeFrom:]((uint64_t)timeStatistics, v12);
    }
  }
  else if (v12)
  {
    [(FCCKPRecord *)self setTimeStatistics:*((void *)v4 + 8)];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = *((id *)v4 + 4);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        [(FCCKPRecord *)self addFields:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v15);
  }

  modifiedBy = self->_modifiedBy;
  uint64_t v19 = (void *)*((void *)v4 + 5);
  if (modifiedBy)
  {
    if (v19) {
      -[FCCKPIdentifier mergeFrom:]((uint64_t)modifiedBy, v19);
    }
  }
  else if (v19)
  {
    [(FCCKPRecord *)self setModifiedBy:*((void *)v4 + 5)];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = *((id *)v4 + 1);
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
        -[FCCKPRecord addConflictLoserEtags:](self, "addConflictLoserEtags:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v22);
  }

  if (*((void *)v4 + 6)) {
    -[FCCKPRecord setModifiedByDevice:](self, "setModifiedByDevice:");
  }
}

- (void)setEtag:(id)a3
{
}

- (void)setRecordIdentifier:(id)a3
{
}

- (void)setType:(id)a3
{
}

- (FCCKPIdentifier)createdBy
{
  return self->_createdBy;
}

- (void)setCreatedBy:(id)a3
{
}

- (void)setTimeStatistics:(id)a3
{
}

- (void)setFields:(id)a3
{
}

- (FCCKPIdentifier)modifiedBy
{
  return self->_modifiedBy;
}

- (void)setModifiedBy:(id)a3
{
}

- (void)setConflictLoserEtags:(id)a3
{
}

- (NSString)modifiedByDevice
{
  return self->_modifiedByDevice;
}

- (void)setModifiedByDevice:(id)a3
{
}

@end