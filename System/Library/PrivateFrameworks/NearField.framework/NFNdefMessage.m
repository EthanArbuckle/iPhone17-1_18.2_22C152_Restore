@interface NFNdefMessage
+ (BOOL)supportsSecureCoding;
- (NFNdefMessage)init;
- (NFNdefMessage)initWithBytes:(const void *)a3 length:(unsigned int)a4;
- (NFNdefMessage)initWithCoder:(id)a3;
- (NFNdefMessage)initWithData:(id)a3;
- (NFNdefMessage)initWithNDEFMessage:(id)a3;
- (NSArray)records;
- (NSString)description;
- (id)asData;
- (id)decode;
- (void)addRecord:(id)a3;
- (void)addRecordArray:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFNdefMessage

- (NFNdefMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFNdefMessage;
  v2 = [(NFNdefMessage *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    records = v2->_records;
    v2->_records = v3;
  }
  return v2;
}

- (NFNdefMessage)initWithBytes:(const void *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)NFNdefMessage;
  objc_super v6 = [(NFNdefMessage *)&v11 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    records = v6->_records;
    v6->_records = v7;

    v9 = +[NFNdefRecord recordsFromBytes:a3 length:v4];
    if (v9) {
      [(NSMutableArray *)v6->_records addObjectsFromArray:v9];
    }
  }
  return v6;
}

- (NFNdefMessage)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return [(NFNdefMessage *)self initWithBytes:v5 length:v6];
}

- (NFNdefMessage)initWithNDEFMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFNdefMessage;
  uint64_t v5 = [(NFNdefMessage *)&v20 init];
  if (v5)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    records = v5->_records;
    v5->_records = v6;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v4, "records", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = v5->_records;
          v14 = [[NFNdefRecord alloc] initWithNDEFRecord:*(void *)(*((void *)&v16 + 1) + 8 * v12)];
          [(NSMutableArray *)v13 addObject:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (NSArray)records
{
  return (NSArray *)self->_records;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)NFNdefMessage;
  id v4 = [(NFNdefMessage *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ { records %@ }", v4, self->_records];

  return (NSString *)v5;
}

- (id)decode
{
  return (id)[MEMORY[0x1E4FBA860] decodeFromNDEFMessage:self];
}

- (id)asData
{
  return (id)[MEMORY[0x1E4FBA860] dataFromNDEFMessage:self];
}

- (void)addRecord:(id)a3
{
}

- (void)addRecordArray:(id)a3
{
}

- (NFNdefMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFNdefMessage;
  uint64_t v5 = [(NFNdefMessage *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"records"];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v6];
    records = v5->_records;
    v5->_records = (NSMutableArray *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end