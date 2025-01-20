@interface NTPBURLMappingPath
+ (Class)channelTagsType;
+ (Class)sectionTagsType;
+ (Class)topicTagsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)channelTags;
- (NSMutableArray)sectionTags;
- (NSMutableArray)topicTags;
- (NSString)path;
- (id)channelTagsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sectionTagsAtIndex:(unint64_t)a3;
- (id)topicTagsAtIndex:(unint64_t)a3;
- (unint64_t)channelTagsCount;
- (unint64_t)hash;
- (unint64_t)sectionTagsCount;
- (unint64_t)topicTagsCount;
- (void)addChannelTags:(id)a3;
- (void)addSectionTags:(id)a3;
- (void)addTopicTags:(id)a3;
- (void)clearChannelTags;
- (void)clearSectionTags;
- (void)clearTopicTags;
- (void)mergeFrom:(id)a3;
- (void)setChannelTags:(id)a3;
- (void)setPath:(id)a3;
- (void)setSectionTags:(id)a3;
- (void)setTopicTags:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBURLMappingPath

- (NSString)path
{
  return self->_path;
}

- (NSMutableArray)topicTags
{
  return self->_topicTags;
}

- (NSMutableArray)sectionTags
{
  return self->_sectionTags;
}

- (NSMutableArray)channelTags
{
  return self->_channelTags;
}

- (void)addTopicTags:(id)a3
{
  id v4 = a3;
  topicTags = self->_topicTags;
  id v8 = v4;
  if (!topicTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicTags;
    self->_topicTags = v6;

    id v4 = v8;
    topicTags = self->_topicTags;
  }
  [(NSMutableArray *)topicTags addObject:v4];
}

- (void)addChannelTags:(id)a3
{
  id v4 = a3;
  channelTags = self->_channelTags;
  id v8 = v4;
  if (!channelTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_channelTags;
    self->_channelTags = v6;

    id v4 = v8;
    channelTags = self->_channelTags;
  }
  [(NSMutableArray *)channelTags addObject:v4];
}

- (void)clearTopicTags
{
}

- (unint64_t)topicTagsCount
{
  return [(NSMutableArray *)self->_topicTags count];
}

- (id)topicTagsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicTags objectAtIndex:a3];
}

+ (Class)topicTagsType
{
  return (Class)objc_opt_class();
}

- (void)clearChannelTags
{
}

- (unint64_t)channelTagsCount
{
  return [(NSMutableArray *)self->_channelTags count];
}

- (id)channelTagsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_channelTags objectAtIndex:a3];
}

+ (Class)channelTagsType
{
  return (Class)objc_opt_class();
}

- (void)clearSectionTags
{
}

- (void)addSectionTags:(id)a3
{
  id v4 = a3;
  sectionTags = self->_sectionTags;
  id v8 = v4;
  if (!sectionTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_sectionTags;
    self->_sectionTags = v6;

    id v4 = v8;
    sectionTags = self->_sectionTags;
  }
  [(NSMutableArray *)sectionTags addObject:v4];
}

- (unint64_t)sectionTagsCount
{
  return [(NSMutableArray *)self->_sectionTags count];
}

- (id)sectionTagsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sectionTags objectAtIndex:a3];
}

+ (Class)sectionTagsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBURLMappingPath;
  id v4 = [(NTPBURLMappingPath *)&v8 description];
  v5 = [(NTPBURLMappingPath *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  path = self->_path;
  if (path) {
    [v3 setObject:path forKey:@"path"];
  }
  if ([(NSMutableArray *)self->_topicTags count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicTags, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v7 = self->_topicTags;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"topic_tags"];
  }
  if ([(NSMutableArray *)self->_channelTags count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_channelTags, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = self->_channelTags;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v32 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"channel_tags"];
  }
  if ([(NSMutableArray *)self->_sectionTags count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_sectionTags, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v21 = self->_sectionTags;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * k), "dictionaryRepresentation", (void)v28);
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"section_tags"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBURLMappingPathReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteStringField();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_topicTags;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_channelTags;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_sectionTags;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_path copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = self->_topicTags;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addTopicTags:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v10);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v14 = self->_channelTags;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * v18) copyWithZone:a3];
        [v5 addChannelTags:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v16);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v20 = self->_sectionTags;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v24), "copyWithZone:", a3, (void)v27);
        [v5 addSectionTags:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v22);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((path = self->_path, !((unint64_t)path | v4[2])) || -[NSString isEqual:](path, "isEqual:"))
    && ((topicTags = self->_topicTags, !((unint64_t)topicTags | v4[4]))
     || -[NSMutableArray isEqual:](topicTags, "isEqual:"))
    && ((channelTags = self->_channelTags, !((unint64_t)channelTags | v4[1]))
     || -[NSMutableArray isEqual:](channelTags, "isEqual:")))
  {
    sectionTags = self->_sectionTags;
    if ((unint64_t)sectionTags | v4[3]) {
      char v9 = -[NSMutableArray isEqual:](sectionTags, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_path hash];
  uint64_t v4 = [(NSMutableArray *)self->_topicTags hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_channelTags hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_sectionTags hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NTPBURLMappingPath setPath:](self, "setPath:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBURLMappingPath *)self addTopicTags:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v4 + 1);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBURLMappingPath *)self addChannelTags:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 3);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NTPBURLMappingPath addSectionTags:](self, "addSectionTags:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)setPath:(id)a3
{
}

- (void)setTopicTags:(id)a3
{
}

- (void)setChannelTags:(id)a3
{
}

- (void)setSectionTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicTags, 0);
  objc_storeStrong((id *)&self->_sectionTags, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_channelTags, 0);
}

@end