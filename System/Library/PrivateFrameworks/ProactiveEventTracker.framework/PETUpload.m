@interface PETUpload
+ (Class)aggregatedMessagesType;
+ (Class)unaggregatedMessagesType;
- (BOOL)hasCompressedData;
- (BOOL)hasCompressedMessages;
- (BOOL)hasIsCompressed;
- (BOOL)hasMetadata;
- (BOOL)isCompressed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)compressedData;
- (NSData)compressedMessages;
- (NSMutableArray)aggregatedMessages;
- (NSMutableArray)unaggregatedMessages;
- (PETMetadata)metadata;
- (id)aggregatedMessagesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)unaggregatedMessagesAtIndex:(unint64_t)a3;
- (unint64_t)aggregatedMessagesCount;
- (unint64_t)hash;
- (unint64_t)unaggregatedMessagesCount;
- (void)addAggregatedMessages:(id)a3;
- (void)addUnaggregatedMessages:(id)a3;
- (void)clearAggregatedMessages;
- (void)clearUnaggregatedMessages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAggregatedMessages:(id)a3;
- (void)setCompressedData:(id)a3;
- (void)setCompressedMessages:(id)a3;
- (void)setHasIsCompressed:(BOOL)a3;
- (void)setIsCompressed:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setUnaggregatedMessages:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETUpload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unaggregatedMessages, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_compressedMessages, 0);
  objc_storeStrong((id *)&self->_compressedData, 0);

  objc_storeStrong((id *)&self->_aggregatedMessages, 0);
}

- (void)setCompressedMessages:(id)a3
{
}

- (NSData)compressedMessages
{
  return self->_compressedMessages;
}

- (void)setCompressedData:(id)a3
{
}

- (NSData)compressedData
{
  return self->_compressedData;
}

- (BOOL)isCompressed
{
  return self->_isCompressed;
}

- (void)setUnaggregatedMessages:(id)a3
{
}

- (NSMutableArray)unaggregatedMessages
{
  return self->_unaggregatedMessages;
}

- (void)setAggregatedMessages:(id)a3
{
}

- (NSMutableArray)aggregatedMessages
{
  return self->_aggregatedMessages;
}

- (void)setMetadata:(id)a3
{
}

- (PETMetadata)metadata
{
  return self->_metadata;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  metadata = self->_metadata;
  uint64_t v6 = *((void *)v4 + 4);
  if (metadata)
  {
    if (v6) {
      -[PETMetadata mergeFrom:](metadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PETUpload setMetadata:](self, "setMetadata:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PETUpload *)self addAggregatedMessages:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
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
        -[PETUpload addUnaggregatedMessages:](self, "addUnaggregatedMessages:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if (*((unsigned char *)v4 + 52))
  {
    self->_isCompressed = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[PETUpload setCompressedData:](self, "setCompressedData:");
  }
  if (*((void *)v4 + 3)) {
    -[PETUpload setCompressedMessages:](self, "setCompressedMessages:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PETMetadata *)self->_metadata hash];
  uint64_t v4 = [(NSMutableArray *)self->_aggregatedMessages hash];
  uint64_t v5 = [(NSMutableArray *)self->_unaggregatedMessages hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_isCompressed;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v8 = [(NSData *)self->_compressedData hash];
  return v7 ^ v8 ^ [(NSData *)self->_compressedMessages hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 4))
  {
    if (!-[PETMetadata isEqual:](metadata, "isEqual:")) {
      goto LABEL_20;
    }
  }
  aggregatedMessages = self->_aggregatedMessages;
  if ((unint64_t)aggregatedMessages | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](aggregatedMessages, "isEqual:")) {
      goto LABEL_20;
    }
  }
  unaggregatedMessages = self->_unaggregatedMessages;
  if ((unint64_t)unaggregatedMessages | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](unaggregatedMessages, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 52))
    {
      if (self->_isCompressed)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_16;
      }
    }
LABEL_20:
    char v10 = 0;
    goto LABEL_21;
  }
  if (*((unsigned char *)v4 + 52)) {
    goto LABEL_20;
  }
LABEL_16:
  compressedData = self->_compressedData;
  if ((unint64_t)compressedData | *((void *)v4 + 2)
    && !-[NSData isEqual:](compressedData, "isEqual:"))
  {
    goto LABEL_20;
  }
  compressedMessages = self->_compressedMessages;
  if ((unint64_t)compressedMessages | *((void *)v4 + 3)) {
    char v10 = -[NSData isEqual:](compressedMessages, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_21:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PETMetadata *)self->_metadata copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = self->_aggregatedMessages;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addAggregatedMessages:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v14 = self->_unaggregatedMessages;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v18), "copyWithZone:", a3, (void)v25);
        [(id)v5 addUnaggregatedMessages:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v16);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 48) = self->_isCompressed;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v20 = -[NSData copyWithZone:](self->_compressedData, "copyWithZone:", a3, (void)v25);
  long long v21 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v20;

  uint64_t v22 = [(NSData *)self->_compressedMessages copyWithZone:a3];
  long long v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = a3;
  if (self->_metadata) {
    objc_msgSend(v13, "setMetadata:");
  }
  if ([(PETUpload *)self aggregatedMessagesCount])
  {
    [v13 clearAggregatedMessages];
    unint64_t v4 = [(PETUpload *)self aggregatedMessagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(PETUpload *)self aggregatedMessagesAtIndex:i];
        [v13 addAggregatedMessages:v7];
      }
    }
  }
  if ([(PETUpload *)self unaggregatedMessagesCount])
  {
    [v13 clearUnaggregatedMessages];
    unint64_t v8 = [(PETUpload *)self unaggregatedMessagesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(PETUpload *)self unaggregatedMessagesAtIndex:j];
        [v13 addUnaggregatedMessages:v11];
      }
    }
  }
  uint64_t v12 = v13;
  if (*(unsigned char *)&self->_has)
  {
    v13[48] = self->_isCompressed;
    v13[52] |= 1u;
  }
  if (self->_compressedData)
  {
    objc_msgSend(v13, "setCompressedData:");
    uint64_t v12 = v13;
  }
  if (self->_compressedMessages)
  {
    objc_msgSend(v13, "setCompressedMessages:");
    uint64_t v12 = v13;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_metadata) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_aggregatedMessages;
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

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_unaggregatedMessages;
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_compressedData) {
    PBDataWriterWriteDataField();
  }
  if (self->_compressedMessages) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETUploadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  metadata = self->_metadata;
  if (metadata)
  {
    unint64_t v5 = [(PETMetadata *)metadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"metadata"];
  }
  if ([(NSMutableArray *)self->_aggregatedMessages count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_aggregatedMessages, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = self->_aggregatedMessages;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"aggregated_messages"];
  }
  if ([(NSMutableArray *)self->_unaggregatedMessages count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_unaggregatedMessages, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v14 = self->_unaggregatedMessages;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"unaggregated_messages"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v20 = [NSNumber numberWithBool:self->_isCompressed];
    [v3 setObject:v20 forKey:@"is_compressed"];
  }
  compressedData = self->_compressedData;
  if (compressedData) {
    [v3 setObject:compressedData forKey:@"compressed_data"];
  }
  compressedMessages = self->_compressedMessages;
  if (compressedMessages) {
    [v3 setObject:compressedMessages forKey:@"compressed_messages"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PETUpload;
  id v4 = [(PETUpload *)&v8 description];
  unint64_t v5 = [(PETUpload *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCompressedMessages
{
  return self->_compressedMessages != 0;
}

- (BOOL)hasCompressedData
{
  return self->_compressedData != 0;
}

- (BOOL)hasIsCompressed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIsCompressed:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIsCompressed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isCompressed = a3;
}

- (id)unaggregatedMessagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_unaggregatedMessages objectAtIndex:a3];
}

- (unint64_t)unaggregatedMessagesCount
{
  return [(NSMutableArray *)self->_unaggregatedMessages count];
}

- (void)addUnaggregatedMessages:(id)a3
{
  id v4 = a3;
  unaggregatedMessages = self->_unaggregatedMessages;
  id v8 = v4;
  if (!unaggregatedMessages)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_unaggregatedMessages;
    self->_unaggregatedMessages = v6;

    id v4 = v8;
    unaggregatedMessages = self->_unaggregatedMessages;
  }
  [(NSMutableArray *)unaggregatedMessages addObject:v4];
}

- (void)clearUnaggregatedMessages
{
}

- (id)aggregatedMessagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_aggregatedMessages objectAtIndex:a3];
}

- (unint64_t)aggregatedMessagesCount
{
  return [(NSMutableArray *)self->_aggregatedMessages count];
}

- (void)addAggregatedMessages:(id)a3
{
  id v4 = a3;
  aggregatedMessages = self->_aggregatedMessages;
  id v8 = v4;
  if (!aggregatedMessages)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_aggregatedMessages;
    self->_aggregatedMessages = v6;

    id v4 = v8;
    aggregatedMessages = self->_aggregatedMessages;
  }
  [(NSMutableArray *)aggregatedMessages addObject:v4];
}

- (void)clearAggregatedMessages
{
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

+ (Class)unaggregatedMessagesType
{
  return (Class)objc_opt_class();
}

+ (Class)aggregatedMessagesType
{
  return (Class)objc_opt_class();
}

@end