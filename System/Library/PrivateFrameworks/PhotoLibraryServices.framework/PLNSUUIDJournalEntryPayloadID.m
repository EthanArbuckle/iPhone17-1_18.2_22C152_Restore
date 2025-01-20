@interface PLNSUUIDJournalEntryPayloadID
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PLNSUUIDJournalEntryPayloadID)initWithUUIDBytes:(unsigned __int8)a3[16];
- (PLNSUUIDJournalEntryPayloadID)initWithUUIDString:(id)a3;
- (id)payloadIDString;
- (id)payloadUUIDData;
- (unint64_t)hash;
@end

@implementation PLNSUUIDJournalEntryPayloadID

- (void).cxx_destruct
{
}

- (id)payloadUUIDData
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = 0;
  [(NSUUID *)self->_payloadID getUUIDBytes:v4];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v4 length:16];
  return v2;
}

- (id)payloadIDString
{
  return [(NSUUID *)self->_payloadID UUIDString];
}

- (NSString)description
{
  return (NSString *)[(NSUUID *)self->_payloadID description];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLNSUUIDJournalEntryPayloadID *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      char v6 = [(NSUUID *)self->_payloadID isEqual:v4->_payloadID];
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_payloadID hash];
}

- (PLNSUUIDJournalEntryPayloadID)initWithUUIDString:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  char v6 = (void *)[[v4 alloc] initWithUUIDString:v5];

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)PLNSUUIDJournalEntryPayloadID;
    v7 = [(PLNSUUIDJournalEntryPayloadID *)&v10 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_payloadID, v6);
    }
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (PLNSUUIDJournalEntryPayloadID)initWithUUIDBytes:(unsigned __int8)a3[16]
{
  v8.receiver = self;
  v8.super_class = (Class)PLNSUUIDJournalEntryPayloadID;
  v4 = [(PLNSUUIDJournalEntryPayloadID *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3];
    payloadID = v4->_payloadID;
    v4->_payloadID = (NSUUID *)v5;
  }
  return v4;
}

@end