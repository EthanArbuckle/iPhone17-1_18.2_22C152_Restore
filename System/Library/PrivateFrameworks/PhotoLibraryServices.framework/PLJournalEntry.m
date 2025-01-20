@interface PLJournalEntry
- (BOOL)_readFromFileHandle:(id)a3 decodePayload:(BOOL)a4 payloadClass:(Class)a5 error:(id *)a6;
- (BOOL)readFromFileHandle:(id)a3 decodePayload:(BOOL)a4 payloadClass:(Class)a5 entryOffset:(unint64_t *)a6 error:(id *)a7;
- (BOOL)writeToFileHandle:(id)a3 checksumContext:(id)a4 error:(id *)a5;
- (Class)payloadClass;
- (NSPersistentHistoryToken)historyToken;
- (PLJournalEntry)init;
- (PLJournalEntry)initWithPayloadID:(id)a3 payload:(id)a4 payloadClass:(Class)a5 entryType:(int)a6;
- (PLJournalEntryHeader)header;
- (PLJournalEntryPayload)payload;
- (PLJournalEntryPayloadID)payloadID;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithBuilder:(id)a3;
- (id)entryTypeDescription;
- (id)initForDeleteWithPayloadID:(id)a3 payloadClass:(Class)a4;
- (id)initForInsertWithPayload:(id)a3;
- (id)initForUpdateWithPayload:(id)a3;
- (unint64_t)entryType;
- (unsigned)payloadVersion;
- (void)_appendHeaderData:(id)a3 headerCRC:(unsigned __int16)a4 payloadData:(id)a5 toFileHandle:(id)a6 checksumContext:(id)a7;
- (void)setHeader:(id)a3;
- (void)setHistoryToken:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPayloadID:(id)a3;
- (void)setPayloadVersion:(unsigned int)a3;
- (void)writeBytes:(const void *)a3 length:(unint64_t)a4 toFileHandle:(id)a5 checksumContext:(id)a6;
@end

@implementation PLJournalEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_payloadClass, 0);
  objc_storeStrong((id *)&self->_payloadID, 0);
}

- (void)setHistoryToken:(id)a3
{
}

- (NSPersistentHistoryToken)historyToken
{
  return self->_historyToken;
}

- (void)setHeader:(id)a3
{
}

- (PLJournalEntryHeader)header
{
  return self->_header;
}

- (void)setPayload:(id)a3
{
}

- (PLJournalEntryPayload)payload
{
  return self->_payload;
}

- (Class)payloadClass
{
  return self->_payloadClass;
}

- (void)setPayloadID:(id)a3
{
}

- (PLJournalEntryPayloadID)payloadID
{
  return self->_payloadID;
}

- (id)entryTypeDescription
{
  v2 = [(PLJournalEntry *)self header];
  uint64_t v3 = [v2 entryType];
  if (v3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E586E5E8[v3];
  }

  return v4;
}

- (id)descriptionWithBuilder:(id)a3
{
  id v4 = a3;
  v5 = [(PLJournalEntry *)self header];
  uint64_t v6 = [v5 entryType];
  if (v6 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E586E5E8[v6];
  }
  [v4 appendName:@"type" object:v7];

  v8 = [(PLJournalEntry *)self payloadID];

  if (v8)
  {
    v9 = [(PLJournalEntry *)self payloadID];
    [v4 appendName:@"payloadID" object:v9];
  }
  v10 = [(PLJournalEntry *)self header];
  int v11 = [v10 entryType];

  if (v11 != 2) {
    objc_msgSend(v4, "appendName:integerValue:", @"version", -[PLJournalEntry payloadVersion](self, "payloadVersion"));
  }
  v12 = [(PLJournalEntry *)self payload];

  if (v12)
  {
    if ([v4 style] == 3)
    {
      v13 = -[PLJournalEntryPayload prettyDescriptionForEntry:indent:](self->_payload, "prettyDescriptionForEntry:indent:", self, [v4 indent] + 1);
      [v4 appendName:@"payload" object:v13];
    }
    else
    {
      v14 = NSString;
      v13 = [(PLJournalEntryPayload *)self->_payload descriptionForEntry:self];
      v15 = [v14 stringWithFormat:@"[%@]", v13];
      [v4 appendName:@"payload" object:v15];
    }
  }
  v16 = [v4 build];

  return v16;
}

- (id)debugDescription
{
  uint64_t v3 = [[PLDescriptionBuilder alloc] initWithObject:self style:3 indent:0];
  id v4 = [(PLJournalEntry *)self descriptionWithBuilder:v3];

  return v4;
}

- (id)description
{
  uint64_t v3 = [[PLDescriptionBuilder alloc] initWithObject:self style:1 indent:0];
  id v4 = [(PLJournalEntry *)self descriptionWithBuilder:v3];

  return v4;
}

- (BOOL)writeToFileHandle:(id)a3 checksumContext:(id)a4 error:(id *)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  payload = self->_payload;
  if (!payload)
  {
    int v11 = 0;
LABEL_7:
    id v15 = objc_alloc_init(MEMORY[0x1E4F94098]);
    v17 = [(PLJournalEntryPayloadID *)self->_payloadID payloadUUIDData];
    if (v17)
    {
      [(PLJournalEntryHeader *)self->_header setPayloadUUID:v17];
    }
    else
    {
      v18 = [(PLJournalEntryPayloadID *)self->_payloadID payloadIDString];
      [(PLJournalEntryHeader *)self->_header setPayloadID:v18];
    }
    if ([v11 length])
    {
      id v19 = v11;
      [v19 bytes];
      [v19 length];
      CNCRC();
      [(PLJournalEntryHeader *)self->_header setPayloadCRC:0];
      -[PLJournalEntryHeader setPayloadLength:](self->_header, "setPayloadLength:", [v19 length]);
    }
    [(PLJournalEntryHeader *)self->_header writeTo:v15];
    id v20 = [v15 immutableData];
    [v20 bytes];
    [v20 length];
    CNCRC();
    [(PLJournalEntryHeader *)self->_header setPayloadID:0];
    [(PLJournalEntry *)self appendHeaderData:v20 headerCRC:0 payloadData:v11 toFileHandle:v8 checksumContext:v9];
    BOOL v16 = 1;

    v13 = v11;
    goto LABEL_13;
  }
  v22[0] = 0;
  int v11 = [(PLJournalEntryPayload *)payload payloadDataWithError:v22];
  id v12 = v22[0];
  v13 = v12;
  if (!a5 || v11)
  {

    if (!v11)
    {
      BOOL v16 = 0;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v23 = *MEMORY[0x1E4F28A50];
  v24[0] = v12;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  [v14 errorWithDomain:*MEMORY[0x1E4F8C500] code:51002 userInfo:v15];
  BOOL v16 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
  return v16;
}

- (void)_appendHeaderData:(id)a3 headerCRC:(unsigned __int16)a4 payloadData:(id)a5 toFileHandle:(id)a6 checksumContext:(id)a7
{
  unsigned int v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  [(PLJournalEntry *)self writeBytes:&kPLJournalEntryMagic length:1 toFileHandle:v14 checksumContext:v15];
  __int16 v23 = __rev16(v10);
  [(PLJournalEntry *)self writeBytes:&v23 length:2 toFileHandle:v14 checksumContext:v15];
  if ((unint64_t)[v12 length] >= 0x10000)
  {
    [v12 length];
    BOOL v16 = (PLJournalEntry *)_PFAssertFailHandler();
    [(PLJournalEntry *)v16 writeBytes:v18 length:v19 toFileHandle:v20 checksumContext:v21];
  }
  else
  {
    __int16 v22 = bswap32([v12 length]) >> 16;
    [(PLJournalEntry *)self writeBytes:&v22 length:2 toFileHandle:v14 checksumContext:v15];
    [v14 writeData:v12];
    [v15 update:v12];
    if (v13)
    {
      [v14 writeData:v13];
      [v15 update:v13];
    }
  }
}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4 toFileHandle:(id)a5 checksumContext:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = (id)[[v9 alloc] initWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  [v10 update:v12];

  [v11 writeData:v12];
}

- (BOOL)readFromFileHandle:(id)a3 decodePayload:(BOOL)a4 payloadClass:(Class)a5 entryOffset:(unint64_t *)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  unint64_t v13 = [v12 offsetInFile];
  id v22 = 0;
  BOOL v14 = [(PLJournalEntry *)self _readFromFileHandle:v12 decodePayload:v10 payloadClass:a5 error:&v22];
  id v15 = v22;
  if (v14)
  {
    BOOL v16 = 1;
    if (!a6) {
      goto LABEL_9;
    }
LABEL_8:
    *a6 = v13;
    goto LABEL_9;
  }
  while (1)
  {
    uint64_t v17 = [v15 code];
    BOOL v16 = v17 == 51001;
    if (v17 != 51001) {
      break;
    }
    [v12 seekToFileOffset:++v13];
    id v21 = v15;
    BOOL v18 = [(PLJournalEntry *)self _readFromFileHandle:v12 decodePayload:v10 payloadClass:a5 error:&v21];
    id v19 = v21;

    id v15 = v19;
    if (v18)
    {
      BOOL v16 = 1;
      id v15 = v19;
      break;
    }
  }
  if (a6) {
    goto LABEL_8;
  }
LABEL_9:
  if (a7) {
    *a7 = v15;
  }

  return v16;
}

- (BOOL)_readFromFileHandle:(id)a3 decodePayload:(BOOL)a4 payloadClass:(Class)a5 error:(id *)a6
{
  BOOL v8 = a4;
  v48[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [v10 readDataOfLength:1];
  if ([v11 length] == 1)
  {
    id v12 = v11;
    if (*(unsigned char *)[v12 bytes] == 64)
    {

      unint64_t v13 = [v10 readDataOfLength:2];
      if ([v13 length] == 2)
      {
        LOWORD(v48[0]) = 0;
        [v13 getBytes:v48 length:2];
        unsigned int v14 = LOWORD(v48[0]);

        id v15 = [v10 readDataOfLength:2];
        if ([v15 length] == 2)
        {
          LOWORD(v48[0]) = 0;
          [v15 getBytes:v48 length:2];
          unsigned int v16 = LOWORD(v48[0]);

          if (v16)
          {
            unint64_t v17 = __rev16(v16);
            BOOL v18 = [v10 readDataOfLength:v17];
            if (![v18 length])
            {
              uint64_t v19 = 51005;
              goto LABEL_21;
            }
            if ([v18 length] < v17)
            {
              uint64_t v19 = 51001;
LABEL_21:

              goto LABEL_12;
            }
            v48[0] = 0;
            id v23 = v18;
            [v23 bytes];
            [v23 length];
            CNCRC();
            if (v48[0] == bswap32(v14) >> 16)
            {
              v24 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v23];
              if (PLJournalEntryHeaderReadFrom((uint64_t)self->_header, (uint64_t)v24))
              {
                if (![(PLJournalEntryHeader *)self->_header hasPayloadUUID]
                  || ([(PLJournalEntryHeader *)self->_header payloadUUID],
                      v25 = objc_claimAutoreleasedReturnValue(),
                      BOOL v26 = [v25 length] == 16,
                      v25,
                      v26))
                {
                  if ([(PLJournalEntryHeader *)self->_header hasPayloadUUID])
                  {
                    id v27 = [(PLJournalEntryHeader *)self->_header payloadUUID];
                    +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDBytes:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDBytes:", [v27 bytes]);
                    v28 = (PLJournalEntryPayloadID *)objc_claimAutoreleasedReturnValue();
                    payloadID = self->_payloadID;
                    self->_payloadID = v28;

                    [(PLJournalEntryHeader *)self->_header setPayloadUUID:0];
                    goto LABEL_31;
                  }
                  if ([(PLJournalEntryHeader *)self->_header hasPayloadID])
                  {
                    v30 = [(PLJournalEntryHeader *)self->_header payloadID];
                    v31 = +[PLJournalEntryPayloadIDFactory payloadIDWithString:v30];
                    v32 = self->_payloadID;
                    self->_payloadID = v31;

LABEL_31:
                    objc_storeStrong((id *)&self->_payloadClass, a5);
                    unint64_t v33 = [(PLJournalEntryHeader *)self->_header payloadLength];
                    v34 = [(PLJournalEntryHeader *)self->_header nilProperties];
                    if (v34)
                    {
                      id v35 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                      v36 = [(PLJournalEntryHeader *)self->_header nilProperties];
                      v37 = (void *)[v35 initWithArray:v36];
                    }
                    else
                    {
                      v37 = 0;
                    }

                    if (v33)
                    {
                      id v38 = [v10 readDataOfLength:v33];
                      if ([v38 length] >= v33)
                      {
                        v48[0] = 0;
                        id v38 = v38;
                        [v38 bytes];
                        [v38 length];
                        CNCRC();
                        uint64_t v40 = v48[0];
                        unsigned int v41 = [(PLJournalEntryHeader *)self->_header payloadCRC];
                        id v20 = 0;
                        BOOL v42 = v40 == v41;
                        int v21 = v42;
                        if (v40 == v41) {
                          uint64_t v19 = 0;
                        }
                        else {
                          uint64_t v19 = 51001;
                        }
                        if (v42 && v8)
                        {
                          v43 = self->_payloadID;
                          uint64_t v44 = [(PLJournalEntryHeader *)self->_header payloadVersion];
                          id v47 = 0;
                          v45 = [(objc_class *)a5 payloadWithData:v38 forPayloadID:v43 version:v44 andNilProperties:v37 error:&v47];
                          id v20 = v47;
                          payload = self->_payload;
                          self->_payload = v45;

                          if (v20)
                          {
                            int v21 = 0;
                            uint64_t v19 = 51001;
                          }
                          else
                          {
                            uint64_t v19 = 0;
                            int v21 = 1;
                          }
                        }
                      }
                      else
                      {
                        id v20 = 0;
                        int v21 = 0;
                        uint64_t v19 = 51005;
                      }
                    }
                    else
                    {
                      uint64_t v19 = 0;
                      int v21 = 1;
                      id v20 = 0;
                      if ([(PLJournalEntryHeader *)self->_header entryType] == 2 || !v8) {
                        goto LABEL_52;
                      }
                      v39 = [(objc_class *)a5 payloadWithData:0 forPayloadID:self->_payloadID version:[(PLJournalEntryHeader *)self->_header payloadVersion] andNilProperties:v37 error:0];
                      uint64_t v19 = 0;
                      id v20 = 0;
                      id v38 = self->_payload;
                      self->_payload = v39;
                    }

LABEL_52:
                    goto LABEL_13;
                  }
                }
              }
            }
            else
            {
            }
          }
          id v20 = 0;
          int v21 = 0;
          uint64_t v19 = 51001;
          goto LABEL_13;
        }
      }
      else
      {
      }
      id v20 = 0;
      int v21 = 0;
      uint64_t v19 = 51005;
      goto LABEL_13;
    }
    uint64_t v19 = 51001;
  }
  else
  {
    uint64_t v19 = 51005;
  }

LABEL_12:
  id v20 = 0;
  int v21 = 0;
LABEL_13:
  if (a6 && v19)
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:v19 userInfo:0];
  }

  return v21 != 0;
}

- (unint64_t)entryType
{
  return [(PLJournalEntryHeader *)self->_header entryType];
}

- (void)setPayloadVersion:(unsigned int)a3
{
}

- (unsigned)payloadVersion
{
  return [(PLJournalEntryHeader *)self->_header payloadVersion];
}

- (id)initForDeleteWithPayloadID:(id)a3 payloadClass:(Class)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [(objc_class *)a4 payloadClassID];
    [v10 handleFailureInMethod:a2, self, @"PLJournal.m", 278, @"payloadID must be non-nil (payloadClassID: %@)", v11 object file lineNumber description];
  }
  BOOL v8 = [(PLJournalEntry *)self initWithPayloadID:v7 payload:0 payloadClass:a4 entryType:2];

  return v8;
}

- (id)initForUpdateWithPayload:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 payloadID];

  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [(id)objc_opt_class() payloadClassID];
    [v10 handleFailureInMethod:a2, self, @"PLJournal.m", 273, @"payloadID must be non-nil (payloadClassID: %@)", v11 object file lineNumber description];
  }
  id v7 = [v5 payloadID];
  BOOL v8 = [(PLJournalEntry *)self initWithPayloadID:v7 payload:v5 payloadClass:objc_opt_class() entryType:1];

  return v8;
}

- (id)initForInsertWithPayload:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 payloadID];

  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [(id)objc_opt_class() payloadClassID];
    [v10 handleFailureInMethod:a2, self, @"PLJournal.m", 268, @"payloadID must be non-nil (payloadClassID: %@)", v11 object file lineNumber description];
  }
  id v7 = [v5 payloadID];
  BOOL v8 = [(PLJournalEntry *)self initWithPayloadID:v7 payload:v5 payloadClass:objc_opt_class() entryType:0];

  return v8;
}

- (PLJournalEntry)initWithPayloadID:(id)a3 payload:(id)a4 payloadClass:(Class)a5 entryType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PLJournalEntry;
  unint64_t v13 = [(PLJournalEntry *)&v27 init];
  unsigned int v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_payloadID, a3);
    id v15 = objc_alloc_init(PLJournalEntryHeader);
    header = v14->_header;
    v14->_header = v15;

    [(PLJournalEntryHeader *)v14->_header setEntryType:v6];
    objc_storeStrong((id *)&v14->_payloadClass, a5);
    if (v12)
    {
      -[PLJournalEntryHeader setPayloadVersion:](v14->_header, "setPayloadVersion:", [v12 payloadVersion]);
      if (v6 == 1)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        unint64_t v17 = objc_msgSend(v12, "nilProperties", 0);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v24;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v24 != v20) {
                objc_enumerationMutation(v17);
              }
              [(PLJournalEntryHeader *)v14->_header addNilProperties:*(void *)(*((void *)&v23 + 1) + 8 * v21++)];
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
          }
          while (v19);
        }
      }
      objc_storeStrong((id *)&v14->_payload, a4);
    }
  }

  return v14;
}

- (PLJournalEntry)init
{
  return [(PLJournalEntry *)self initWithPayloadID:0 payload:0 payloadClass:0 entryType:0];
}

@end