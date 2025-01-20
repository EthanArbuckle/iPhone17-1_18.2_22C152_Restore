@interface PLNSStringJournalEntryPayloadID
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PLNSStringJournalEntryPayloadID)initWithString:(id)a3;
- (id)payloadIDString;
- (id)payloadUUIDData;
- (unint64_t)hash;
@end

@implementation PLNSStringJournalEntryPayloadID

- (void).cxx_destruct
{
}

- (id)payloadUUIDData
{
  return 0;
}

- (id)payloadIDString
{
  return self->_payloadID;
}

- (NSString)description
{
  return [(NSString *)self->_payloadID description];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLNSStringJournalEntryPayloadID *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      char v6 = [(NSString *)self->_payloadID isEqual:v4->_payloadID];
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_payloadID hash];
}

- (PLNSStringJournalEntryPayloadID)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLNSStringJournalEntryPayloadID;
  uint64_t v5 = [(PLNSStringJournalEntryPayloadID *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    payloadID = v5->_payloadID;
    v5->_payloadID = (NSString *)v6;
  }
  return v5;
}

@end