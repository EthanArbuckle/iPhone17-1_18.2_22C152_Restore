@interface ICCRRegisterLatest
- (BOOL)isEqualContents:(id)a3;
- (ICCRRegisterLatest)initWithContents:(id)a3 document:(id)a4;
- (ICCRRegisterLatest)initWithContents:(id)a3 timestamp:(id)a4 document:(id)a5;
- (ICCRRegisterLatest)initWithICCRCoder:(id)a3;
- (ICCRRegisterLatest)initWithProtobufRegisterLatest:(const void *)a3 decoder:(id)a4;
- (ICCRTimestamp)timestamp;
- (id)contents;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)description;
- (void)_setContents:(id)a3;
- (void)encodeIntoProtobufRegisterLatest:(void *)a3 coder:(id)a4;
- (void)encodeWithICCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)mergeWithRegisterLatest:(id)a3;
- (void)realizeLocalChangesIn:(id)a3;
- (void)setContents:(id)a3;
- (void)setDocument:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)walkGraph:(id)a3;
@end

@implementation ICCRRegisterLatest

- (ICCRRegisterLatest)initWithContents:(id)a3 document:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [ICCRTimestamp alloc];
  v9 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
  v10 = [(ICCRTimestamp *)v8 initWithReplica:v9 andCounter:0];

  v11 = [(ICCRRegisterLatest *)self initWithContents:v6 timestamp:v10 document:v7];
  return v11;
}

- (ICCRRegisterLatest)initWithContents:(id)a3 timestamp:(id)a4 document:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICCRRegisterLatest;
  v11 = [(ICCRRegister *)&v14 initWithDocument:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timestamp, a4);
    objc_storeStrong((id *)&v12->_contents, a3);
  }

  return v12;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 1)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 1;
    operator new();
  }
  [(ICCRRegisterLatest *)self encodeIntoProtobufRegisterLatest:*(void *)(v4 + 40) coder:v6];
}

- (ICCRRegisterLatest)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 1)
  {
    id v6 = [(ICCRRegisterLatest *)self initWithProtobufRegisterLatest:*(void *)(v5 + 40) decoder:v4];
  }
  else
  {
    id v7 = [v4 document];
    id v6 = [(ICCRRegisterLatest *)self initWithContents:0 document:v7];
  }
  return v6;
}

- (ICCRRegisterLatest)initWithProtobufRegisterLatest:(const void *)a3 decoder:(id)a4
{
  id v6 = (CRDT::RegisterLatest *)a4;
  id v7 = v6;
  int v8 = *((_DWORD *)a3 + 8);
  if ((v8 & 2) != 0)
  {
    uint64_t v10 = *((void *)a3 + 6);
    if (!v10) {
      uint64_t v10 = *(void *)(CRDT::RegisterLatest::default_instance(v6) + 48);
    }
    uint64_t v11 = [(CRDT::RegisterLatest *)v7 decodeObjectForProtobufObjectID:v10];
    int v8 = *((_DWORD *)a3 + 8);
    id v9 = (void *)v11;
  }
  else
  {
    id v9 = 0;
  }
  if (v8)
  {
    v16 = [ICCRTimestamp alloc];
    v17 = v16;
    uint64_t v18 = *((void *)a3 + 5);
    if (!v18) {
      uint64_t v18 = *(void *)(CRDT::RegisterLatest::default_instance((CRDT::RegisterLatest *)v16) + 40);
    }
    v15 = [(ICCRTimestamp *)v17 initWithProtobufTimestamp:v18 decoder:v7];
  }
  else
  {
    v12 = [ICCRTimestamp alloc];
    v13 = [(CRDT::RegisterLatest *)v7 document];
    objc_super v14 = [v13 replica];
    v15 = [(ICCRTimestamp *)v12 initWithReplica:v14 andCounter:0];
  }
  v19 = [(CRDT::RegisterLatest *)v7 document];
  v20 = [(ICCRRegisterLatest *)self initWithContents:v9 timestamp:v15 document:v19];

  return v20;
}

- (void)encodeIntoProtobufRegisterLatest:(void *)a3 coder:(id)a4
{
  id v13 = a4;
  id v6 = [(ICCRRegisterLatest *)self timestamp];
  *((_DWORD *)a3 + 8) |= 1u;
  uint64_t v7 = *((void *)a3 + 5);
  if (!v7) {
    operator new();
  }
  [v6 encodeIntoProtobufTimestamp:v7 coder:v13];

  int v8 = [(ICCRRegisterLatest *)self contents];

  if (v8)
  {
    id v9 = [(ICCRRegisterLatest *)self contents];
    int v10 = [v9 conformsToProtocol:&unk_1F1F737E0];

    if (v10)
    {
      uint64_t v11 = [(ICCRRegisterLatest *)self contents];
      *((_DWORD *)a3 + 8) |= 2u;
      uint64_t v12 = *((void *)a3 + 6);
      if (!v12) {
        operator new();
      }
      [v13 encodeObject:v11 forObjectID:v12];
    }
  }
}

- (id)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  v16 = (ICCRDataType *)a3;
  if (self->_contents != v16)
  {
    objc_storeStrong((id *)&self->_contents, a3);
    uint64_t v5 = [(ICCRRegisterLatest *)self timestamp];
    id v6 = [v5 replica];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");

    if (v6 != v7)
    {
      int v8 = [(ICCRRegister *)self document];
      uint64_t v9 = [v8 replicaClock];

      int v10 = [(ICCRRegisterLatest *)self timestamp];
      uint64_t v11 = [v10 counter];

      if (v9 > v11) {
        uint64_t v11 = v9;
      }
      uint64_t v12 = [ICCRTimestamp alloc];
      id v13 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
      objc_super v14 = [(ICCRTimestamp *)v12 initWithReplica:v13 andCounter:v11 + 1];
      [(ICCRRegisterLatest *)self setTimestamp:v14];
    }
    v15 = [(ICCRRegister *)self document];
    [v15 setDocumentFor:v16];
  }
}

- (void)_setContents:(id)a3
{
}

- (BOOL)isEqualContents:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ICCRRegisterLatest *)self contents];
    id v6 = [v4 contents];
    if ([v5 isEqual:v6])
    {
      uint64_t v7 = [(ICCRRegisterLatest *)self timestamp];
      int v8 = [v4 timestamp];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)realizeLocalChangesIn:(id)a3
{
  id v15 = a3;
  id v4 = [(ICCRRegisterLatest *)self timestamp];
  uint64_t v5 = [v4 replica];
  id v6 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");

  if (v5 == v6)
  {
    uint64_t v7 = [(ICCRRegisterLatest *)self timestamp];
    if ([v7 counter])
    {
      int v8 = [(ICCRRegisterLatest *)self timestamp];
      uint64_t v9 = [v8 counter];
    }
    else
    {
      uint64_t v9 = [v15 replicaClock] + 1;
    }

    int v10 = [ICCRTimestamp alloc];
    uint64_t v11 = [v15 replica];
    uint64_t v12 = [(ICCRTimestamp *)v10 initWithReplica:v11 andCounter:v9];
    [(ICCRRegisterLatest *)self setTimestamp:v12];

    uint64_t v13 = [v15 unserializedReplicaClock];
    if (v9 <= v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v9;
    }
    [v15 setUnserializedReplicaClock:v14];
  }
}

- (void)mergeWith:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid ICCRRegisterLatest merge, classes must be equal for merge.", 0 reason userInfo];
      objc_exception_throw(v4);
    }
    [(ICCRRegisterLatest *)self mergeWithRegisterLatest:v5];
  }
}

- (void)mergeWithRegisterLatest:(id)a3
{
  id v9 = a3;
  id v4 = [(ICCRRegisterLatest *)self timestamp];
  id v5 = [v9 timestamp];
  uint64_t v6 = [v4 compare:v5];

  if (v6 == -1)
  {
    uint64_t v7 = [v9 contents];
    [(ICCRRegisterLatest *)self setContents:v7];

    int v8 = [v9 timestamp];
    [(ICCRRegisterLatest *)self setTimestamp:v8];
  }
}

- (void)setDocument:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICCRRegisterLatest;
  [(ICCRRegister *)&v8 setDocument:v4];
  id v5 = [(ICCRRegisterLatest *)self contents];
  uint64_t v6 = [v4 localObject:v5];
  contents = self->_contents;
  self->_contents = v6;
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(ICCRRegisterLatest *)self timestamp];
  id v9 = [v8 replica];
  int v10 = [v6 timestampForReplica:v9];
  uint64_t v11 = [(ICCRRegisterLatest *)self timestamp];
  uint64_t v12 = [v10 compare:v11];

  if (v12)
  {
    if (v12 == -1)
    {
      uint64_t v13 = [ICCRRegisterLatest alloc];
      uint64_t v14 = [(ICCRRegisterLatest *)self contents];
      id v15 = [(ICCRRegisterLatest *)self timestamp];
      uint64_t v16 = [(ICCRRegisterLatest *)v13 initWithContents:v14 timestamp:v15 document:v7];
LABEL_6:
      v19 = (void *)v16;

      goto LABEL_8;
    }
  }
  else
  {
    v17 = [(ICCRRegisterLatest *)self contents];
    uint64_t v14 = [v17 deltaSince:v6 in:v7];

    if (v14)
    {
      uint64_t v18 = [ICCRRegisterLatest alloc];
      id v15 = [(ICCRRegisterLatest *)self timestamp];
      uint64_t v16 = [(ICCRRegisterLatest *)v18 initWithContents:v14 timestamp:v15 document:v7];
      goto LABEL_6;
    }
  }
  v19 = 0;
LABEL_8:

  return v19;
}

- (void)walkGraph:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  id v4 = [(ICCRRegisterLatest *)self contents];
  v5[2](v5, v4);
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(ICCRRegisterLatest *)self timestamp];
  id v7 = [v6 shortDescription];
  objc_super v8 = [(ICCRRegisterLatest *)self contents];
  id v9 = [v3 stringWithFormat:@"<%@ %p %@ %@>", v5, self, v7, v8];

  return v9;
}

- (ICCRTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end