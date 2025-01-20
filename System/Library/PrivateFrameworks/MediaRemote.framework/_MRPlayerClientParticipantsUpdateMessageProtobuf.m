@interface _MRPlayerClientParticipantsUpdateMessageProtobuf
+ (Class)participantsType;
- (BOOL)hasPlayerPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)participants;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)participantsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (void)addParticipants:(id)a3;
- (void)clearParticipants;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlayerClientParticipantsUpdateMessageProtobuf

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (void)clearParticipants
{
}

- (void)addParticipants:(id)a3
{
  id v4 = a3;
  participants = self->_participants;
  id v8 = v4;
  if (!participants)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_participants;
    self->_participants = v6;

    id v4 = v8;
    participants = self->_participants;
  }
  [(NSMutableArray *)participants addObject:v4];
}

- (unint64_t)participantsCount
{
  return [(NSMutableArray *)self->_participants count];
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_participants objectAtIndex:a3];
}

+ (Class)participantsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlayerClientParticipantsUpdateMessageProtobuf;
  id v4 = [(_MRPlayerClientParticipantsUpdateMessageProtobuf *)&v8 description];
  v5 = [(_MRPlayerClientParticipantsUpdateMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v5 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"playerPath"];
  }
  if ([(NSMutableArray *)self->_participants count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_participants, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_participants;
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

    [v3 setObject:v6 forKey:@"participants"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlayerClientParticipantsUpdateMessageProtobufReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_playerPath) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_participants;
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
  if (self->_playerPath) {
    objc_msgSend(v8, "setPlayerPath:");
  }
  if ([(_MRPlayerClientParticipantsUpdateMessageProtobuf *)self participantsCount])
  {
    [v8 clearParticipants];
    unint64_t v4 = [(_MRPlayerClientParticipantsUpdateMessageProtobuf *)self participantsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRPlayerClientParticipantsUpdateMessageProtobuf *)self participantsAtIndex:i];
        [v8 addParticipants:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_participants;
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
        [v5 addParticipants:v13];

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
    && ((playerPath = self->_playerPath, !((unint64_t)playerPath | v4[2]))
     || -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")))
  {
    participants = self->_participants;
    if ((unint64_t)participants | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](participants, "isEqual:");
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
  unint64_t v3 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
  return [(NSMutableArray *)self->_participants hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  playerPath = self->_playerPath;
  uint64_t v6 = *((void *)v4 + 2);
  if (playerPath)
  {
    if (v6) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRPlayerClientParticipantsUpdateMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
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
        -[_MRPlayerClientParticipantsUpdateMessageProtobuf addParticipants:](self, "addParticipants:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

@end