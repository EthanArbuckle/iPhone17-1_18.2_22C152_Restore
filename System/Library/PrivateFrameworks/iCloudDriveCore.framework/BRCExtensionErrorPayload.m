@interface BRCExtensionErrorPayload
+ (Class)recordIdsType;
- (BOOL)hasFieldName;
- (BOOL)hasMinimumOSName;
- (BOOL)hasRecordId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)recordIds;
- (NSString)fieldName;
- (NSString)minimumOSName;
- (NSString)recordId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)recordIdsCount;
- (void)addRecordIds:(id)a3;
- (void)clearRecordIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFieldName:(id)a3;
- (void)setMinimumOSName:(id)a3;
- (void)setRecordId:(id)a3;
- (void)setRecordIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRCExtensionErrorPayload

- (BOOL)hasMinimumOSName
{
  return self->_minimumOSName != 0;
}

- (BOOL)hasRecordId
{
  return self->_recordId != 0;
}

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (void)clearRecordIds
{
}

- (void)addRecordIds:(id)a3
{
  id v4 = a3;
  recordIds = self->_recordIds;
  id v8 = v4;
  if (!recordIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_recordIds;
    self->_recordIds = v6;

    id v4 = v8;
    recordIds = self->_recordIds;
  }
  [(NSMutableArray *)recordIds addObject:v4];
}

- (unint64_t)recordIdsCount
{
  return [(NSMutableArray *)self->_recordIds count];
}

- (id)recordIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recordIds objectAtIndex:a3];
}

+ (Class)recordIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRCExtensionErrorPayload;
  id v4 = [(BRCExtensionErrorPayload *)&v8 description];
  v5 = [(BRCExtensionErrorPayload *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  minimumOSName = self->_minimumOSName;
  if (minimumOSName) {
    [v3 setObject:minimumOSName forKey:@"minimumOSName"];
  }
  recordId = self->_recordId;
  if (recordId) {
    [v4 setObject:recordId forKey:@"recordId"];
  }
  fieldName = self->_fieldName;
  if (fieldName) {
    [v4 setObject:fieldName forKey:@"fieldName"];
  }
  recordIds = self->_recordIds;
  if (recordIds) {
    [v4 setObject:recordIds forKey:@"recordIds"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRCExtensionErrorPayloadReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_minimumOSName) {
    PBDataWriterWriteStringField();
  }
  if (self->_recordId) {
    PBDataWriterWriteStringField();
  }
  if (self->_fieldName) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_recordIds;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_minimumOSName) {
    objc_msgSend(v8, "setMinimumOSName:");
  }
  if (self->_recordId) {
    objc_msgSend(v8, "setRecordId:");
  }
  if (self->_fieldName) {
    objc_msgSend(v8, "setFieldName:");
  }
  if ([(BRCExtensionErrorPayload *)self recordIdsCount])
  {
    [v8 clearRecordIds];
    unint64_t v4 = [(BRCExtensionErrorPayload *)self recordIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BRCExtensionErrorPayload *)self recordIdsAtIndex:i];
        [v8 addRecordIds:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_minimumOSName copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_recordId copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_fieldName copyWithZone:a3];
  long long v11 = (void *)v5[1];
  v5[1] = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_recordIds;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addRecordIds:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((minimumOSName = self->_minimumOSName, !((unint64_t)minimumOSName | v4[2]))
     || -[NSString isEqual:](minimumOSName, "isEqual:"))
    && ((recordId = self->_recordId, !((unint64_t)recordId | v4[3]))
     || -[NSString isEqual:](recordId, "isEqual:"))
    && ((fieldName = self->_fieldName, !((unint64_t)fieldName | v4[1]))
     || -[NSString isEqual:](fieldName, "isEqual:")))
  {
    recordIds = self->_recordIds;
    if ((unint64_t)recordIds | v4[4]) {
      char v9 = -[NSMutableArray isEqual:](recordIds, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_minimumOSName hash];
  NSUInteger v4 = [(NSString *)self->_recordId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_fieldName hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_recordIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[BRCExtensionErrorPayload setMinimumOSName:](self, "setMinimumOSName:");
  }
  if (*((void *)v4 + 3)) {
    -[BRCExtensionErrorPayload setRecordId:](self, "setRecordId:");
  }
  if (*((void *)v4 + 1)) {
    -[BRCExtensionErrorPayload setFieldName:](self, "setFieldName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[BRCExtensionErrorPayload addRecordIds:](self, "addRecordIds:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)minimumOSName
{
  return self->_minimumOSName;
}

- (void)setMinimumOSName:(id)a3
{
}

- (NSString)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (NSMutableArray)recordIds
{
  return self->_recordIds;
}

- (void)setRecordIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIds, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_minimumOSName, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end