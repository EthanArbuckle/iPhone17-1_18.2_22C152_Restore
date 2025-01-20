@interface COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata
+ (Class)topicTagMetadataType;
- (BOOL)hasChannelTagMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)channelTagMetadata;
- (NSMutableArray)topicTagMetadatas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)topicTagMetadataAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)topicTagMetadatasCount;
- (void)addTopicTagMetadata:(id)a3;
- (void)clearTopicTagMetadatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelTagMetadata:(id)a3;
- (void)setTopicTagMetadatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata

- (BOOL)hasChannelTagMetadata
{
  return self->_channelTagMetadata != 0;
}

- (void)clearTopicTagMetadatas
{
}

- (void)addTopicTagMetadata:(id)a3
{
  id v4 = a3;
  topicTagMetadatas = self->_topicTagMetadatas;
  id v8 = v4;
  if (!topicTagMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicTagMetadatas;
    self->_topicTagMetadatas = v6;

    id v4 = v8;
    topicTagMetadatas = self->_topicTagMetadatas;
  }
  [(NSMutableArray *)topicTagMetadatas addObject:v4];
}

- (unint64_t)topicTagMetadatasCount
{
  return [(NSMutableArray *)self->_topicTagMetadatas count];
}

- (id)topicTagMetadataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicTagMetadatas objectAtIndex:a3];
}

+ (Class)topicTagMetadataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata;
  id v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  channelTagMetadata = self->_channelTagMetadata;
  if (channelTagMetadata)
  {
    v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)channelTagMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"channel_tag_metadata"];
  }
  if ([(NSMutableArray *)self->_topicTagMetadatas count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicTagMetadatas, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_topicTagMetadatas;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"topic_tag_metadata"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_channelTagMetadata) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_topicTagMetadatas;
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
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_channelTagMetadata) {
    objc_msgSend(v8, "setChannelTagMetadata:");
  }
  if ([(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata *)self topicTagMetadatasCount])
  {
    [v8 clearTopicTagMetadatas];
    unint64_t v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata *)self topicTagMetadatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata *)self topicTagMetadataAtIndex:i];
        [v8 addTopicTagMetadata:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)self->_channelTagMetadata copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_topicTagMetadatas;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addTopicTagMetadata:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((channelTagMetadata = self->_channelTagMetadata, !((unint64_t)channelTagMetadata | v4[1]))
     || -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata isEqual:](channelTagMetadata, "isEqual:")))
  {
    topicTagMetadatas = self->_topicTagMetadatas;
    if ((unint64_t)topicTagMetadatas | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](topicTagMetadatas, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)self->_channelTagMetadata hash];
  return [(NSMutableArray *)self->_topicTagMetadatas hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  channelTagMetadata = self->_channelTagMetadata;
  uint64_t v6 = *((void *)v4 + 1);
  if (channelTagMetadata)
  {
    if (v6) {
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata mergeFrom:](channelTagMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata setChannelTagMetadata:](self, "setChannelTagMetadata:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleTagMetadata addTopicTagMetadata:](self, "addTopicTagMetadata:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)channelTagMetadata
{
  return self->_channelTagMetadata;
}

- (void)setChannelTagMetadata:(id)a3
{
}

- (NSMutableArray)topicTagMetadatas
{
  return self->_topicTagMetadatas;
}

- (void)setTopicTagMetadatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicTagMetadatas, 0);

  objc_storeStrong((id *)&self->_channelTagMetadata, 0);
}

@end