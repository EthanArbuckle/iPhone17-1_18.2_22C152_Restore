@interface _MRGroupSessionMemberSyncMessageProtobuf
+ (Class)membersType;
+ (Class)participantsType;
+ (Class)pendingParticipantsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)members;
- (NSMutableArray)participants;
- (NSMutableArray)pendingParticipants;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)membersAtIndex:(unint64_t)a3;
- (id)participantsAtIndex:(unint64_t)a3;
- (id)pendingParticipantsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)membersCount;
- (unint64_t)participantsCount;
- (unint64_t)pendingParticipantsCount;
- (void)addMembers:(id)a3;
- (void)addParticipants:(id)a3;
- (void)addPendingParticipants:(id)a3;
- (void)clearMembers;
- (void)clearParticipants;
- (void)clearPendingParticipants;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMembers:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPendingParticipants:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionMemberSyncMessageProtobuf

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

- (void)clearMembers
{
}

- (void)addMembers:(id)a3
{
  id v4 = a3;
  members = self->_members;
  id v8 = v4;
  if (!members)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_members;
    self->_members = v6;

    id v4 = v8;
    members = self->_members;
  }
  [(NSMutableArray *)members addObject:v4];
}

- (unint64_t)membersCount
{
  return [(NSMutableArray *)self->_members count];
}

- (id)membersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_members objectAtIndex:a3];
}

+ (Class)membersType
{
  return (Class)objc_opt_class();
}

- (void)clearPendingParticipants
{
}

- (void)addPendingParticipants:(id)a3
{
  id v4 = a3;
  pendingParticipants = self->_pendingParticipants;
  id v8 = v4;
  if (!pendingParticipants)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_pendingParticipants;
    self->_pendingParticipants = v6;

    id v4 = v8;
    pendingParticipants = self->_pendingParticipants;
  }
  [(NSMutableArray *)pendingParticipants addObject:v4];
}

- (unint64_t)pendingParticipantsCount
{
  return [(NSMutableArray *)self->_pendingParticipants count];
}

- (id)pendingParticipantsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pendingParticipants objectAtIndex:a3];
}

+ (Class)pendingParticipantsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionMemberSyncMessageProtobuf;
  id v4 = [(_MRGroupSessionMemberSyncMessageProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionMemberSyncMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_participants count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_participants, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v5 = self->_participants;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"participants"];
  }
  if ([(NSMutableArray *)self->_members count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_members, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v12 = self->_members;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v30 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"members"];
  }
  if ([(NSMutableArray *)self->_pendingParticipants count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pendingParticipants, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v19 = self->_pendingParticipants;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "dictionaryRepresentation", (void)v26);
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"pendingParticipants"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionMemberSyncMessageProtobufReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_participants;
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
  v10 = self->_members;
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
  uint64_t v15 = self->_pendingParticipants;
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

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if ([(_MRGroupSessionMemberSyncMessageProtobuf *)self participantsCount])
  {
    [v16 clearParticipants];
    unint64_t v4 = [(_MRGroupSessionMemberSyncMessageProtobuf *)self participantsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRGroupSessionMemberSyncMessageProtobuf *)self participantsAtIndex:i];
        [v16 addParticipants:v7];
      }
    }
  }
  if ([(_MRGroupSessionMemberSyncMessageProtobuf *)self membersCount])
  {
    [v16 clearMembers];
    unint64_t v8 = [(_MRGroupSessionMemberSyncMessageProtobuf *)self membersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(_MRGroupSessionMemberSyncMessageProtobuf *)self membersAtIndex:j];
        [v16 addMembers:v11];
      }
    }
  }
  if ([(_MRGroupSessionMemberSyncMessageProtobuf *)self pendingParticipantsCount])
  {
    [v16 clearPendingParticipants];
    unint64_t v12 = [(_MRGroupSessionMemberSyncMessageProtobuf *)self pendingParticipantsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(_MRGroupSessionMemberSyncMessageProtobuf *)self pendingParticipantsAtIndex:k];
        [v16 addPendingParticipants:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = self->_participants;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addParticipants:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v12 = self->_members;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addMembers:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = self->_pendingParticipants;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addPendingParticipants:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((participants = self->_participants, !((unint64_t)participants | v4[2]))
     || -[NSMutableArray isEqual:](participants, "isEqual:"))
    && ((members = self->_members, !((unint64_t)members | v4[1]))
     || -[NSMutableArray isEqual:](members, "isEqual:")))
  {
    pendingParticipants = self->_pendingParticipants;
    if ((unint64_t)pendingParticipants | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](pendingParticipants, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_participants hash];
  uint64_t v4 = [(NSMutableArray *)self->_members hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_pendingParticipants hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
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
        [(_MRGroupSessionMemberSyncMessageProtobuf *)self addParticipants:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
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
        [(_MRGroupSessionMemberSyncMessageProtobuf *)self addMembers:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[3];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
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
        -[_MRGroupSessionMemberSyncMessageProtobuf addPendingParticipants:](self, "addPendingParticipants:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSMutableArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
}

- (NSMutableArray)pendingParticipants
{
  return self->_pendingParticipants;
}

- (void)setPendingParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingParticipants, 0);
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_members, 0);
}

@end