@interface _MRUpdateContentItemArtworkMessageProtobuf
+ (Class)contentItemsType;
- (BOOL)hasPlayerPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contentItems;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (id)contentItemsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)contentItemsCount;
- (unint64_t)hash;
- (void)addContentItems:(id)a3;
- (void)clearContentItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentItems:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRUpdateContentItemArtworkMessageProtobuf

- (void)clearContentItems
{
}

- (void)addContentItems:(id)a3
{
  id v4 = a3;
  contentItems = self->_contentItems;
  id v8 = v4;
  if (!contentItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_contentItems;
    self->_contentItems = v6;

    id v4 = v8;
    contentItems = self->_contentItems;
  }
  [(NSMutableArray *)contentItems addObject:v4];
}

- (unint64_t)contentItemsCount
{
  return [(NSMutableArray *)self->_contentItems count];
}

- (id)contentItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contentItems objectAtIndex:a3];
}

+ (Class)contentItemsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRUpdateContentItemArtworkMessageProtobuf;
  id v4 = [(_MRUpdateContentItemArtworkMessageProtobuf *)&v8 description];
  v5 = [(_MRUpdateContentItemArtworkMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_contentItems count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_contentItems, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_contentItems;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"contentItems"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v12 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"playerPath"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRUpdateContentItemArtworkMessageProtobufReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_contentItems;
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

  if (self->_playerPath) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(_MRUpdateContentItemArtworkMessageProtobuf *)self contentItemsCount])
  {
    [v8 clearContentItems];
    unint64_t v4 = [(_MRUpdateContentItemArtworkMessageProtobuf *)self contentItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRUpdateContentItemArtworkMessageProtobuf *)self contentItemsAtIndex:i];
        [v8 addContentItems:v7];
      }
    }
  }
  if (self->_playerPath) {
    objc_msgSend(v8, "setPlayerPath:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_contentItems;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addContentItems:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((contentItems = self->_contentItems, !((unint64_t)contentItems | v4[1]))
     || -[NSMutableArray isEqual:](contentItems, "isEqual:")))
  {
    playerPath = self->_playerPath;
    if ((unint64_t)playerPath | v4[2]) {
      char v7 = -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_contentItems hash];
  return [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_MRUpdateContentItemArtworkMessageProtobuf addContentItems:](self, "addContentItems:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  playerPath = self->_playerPath;
  id v11 = v4[2];
  if (playerPath)
  {
    if (v11) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[_MRUpdateContentItemArtworkMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
}

- (NSMutableArray)contentItems
{
  return self->_contentItems;
}

- (void)setContentItems:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_contentItems, 0);
}

@end