@interface REMReplicaEntry
- (BOOL)hasEqualPersistedPropertiesAs:(id)a3;
- (BOOL)inUse;
- (REMClockElementList)clockElementList;
- (REMReplicaEntry)initWithEntryArchive:(const void *)a3;
- (REMReplicaEntry)initWithReplicaUUIDIndex:(unsigned int)a3 clockElementList:(id)a4 inUse:(BOOL)a5 forClient:(id)a6;
- (REMReplicaManagerClient)client;
- (id)description;
- (id)persistenceDescription;
- (unsigned)replicaUUIDIndex;
- (void)encodeIntoEntryArchive:(void *)a3;
- (void)setClient:(id)a3;
- (void)setClockElementList:(id)a3;
- (void)setInUse:(BOOL)a3;
- (void)setReplicaUUIDIndex:(unsigned int)a3;
@end

@implementation REMReplicaEntry

- (REMReplicaEntry)initWithReplicaUUIDIndex:(unsigned int)a3 clockElementList:(id)a4 inUse:(BOOL)a5 forClient:(id)a6
{
  id v11 = a4;
  v12 = (REMReplicaManagerClient *)a6;
  v16.receiver = self;
  v16.super_class = (Class)REMReplicaEntry;
  v13 = [(REMReplicaEntry *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_replicaUUIDIndex = a3;
    objc_storeStrong((id *)&v13->_clockElementList, a4);
    v14->_inUse = a5;
    v14->_client = v12;
  }

  return v14;
}

- (void)encodeIntoEntryArchive:(void *)a3
{
  unsigned int v5 = [(REMReplicaEntry *)self replicaUUIDIndex];
  *((_DWORD *)a3 + 8) |= 2u;
  *((_DWORD *)a3 + 11) = v5;
  id v6 = [(REMReplicaEntry *)self clockElementList];
  [v6 encodeIntoEntryArchive:a3];
}

- (REMReplicaEntry)initWithEntryArchive:(const void *)a3
{
  unsigned int v5 = [[REMClockElementList alloc] initWithEntryArchive:a3];
  id v6 = [(REMReplicaEntry *)self initWithReplicaUUIDIndex:*((unsigned int *)a3 + 11) clockElementList:v5 inUse:0 forClient:0];

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(REMReplicaEntry *)self replicaUUIDIndex];
  id v6 = [(REMReplicaEntry *)self clockElementList];
  BOOL v7 = [(REMReplicaEntry *)self inUse];
  v8 = @"Available";
  if (v7) {
    v8 = @"In Use";
  }
  v9 = [v3 stringWithFormat:@"<%@: %p>{UUID: %d, clock: %@, state: %@}", v4, self, v5, v6, v8];

  return v9;
}

- (id)persistenceDescription
{
  v3 = NSString;
  uint64_t v4 = [(REMReplicaEntry *)self replicaUUIDIndex];
  uint64_t v5 = [(REMReplicaEntry *)self clockElementList];
  id v6 = [v3 stringWithFormat:@"{UUID: %d, clock: %@}", v4, v5];

  return v6;
}

- (BOOL)hasEqualPersistedPropertiesAs:(id)a3
{
  uint64_t v4 = (REMReplicaEntry *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    unsigned int v5 = [(REMReplicaEntry *)self replicaUUIDIndex];
    if (v5 == [(REMReplicaEntry *)v4 replicaUUIDIndex])
    {
      id v6 = [(REMReplicaEntry *)self clockElementList];
      BOOL v7 = [(REMReplicaEntry *)v4 clockElementList];
      if (v6 == v7)
      {
        char v10 = 1;
        BOOL v7 = v6;
      }
      else
      {
        v8 = [(REMReplicaEntry *)self clockElementList];
        v9 = [(REMReplicaEntry *)v4 clockElementList];
        char v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unsigned)replicaUUIDIndex
{
  return self->_replicaUUIDIndex;
}

- (void)setReplicaUUIDIndex:(unsigned int)a3
{
  self->_replicaUUIDIndex = a3;
}

- (REMClockElementList)clockElementList
{
  return self->_clockElementList;
}

- (void)setClockElementList:(id)a3
{
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (REMReplicaManagerClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  self->_client = (REMReplicaManagerClient *)a3;
}

- (void).cxx_destruct
{
}

@end