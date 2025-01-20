@interface NFNdefMessageInternal
+ (BOOL)supportsSecureCoding;
+ (id)dataFromNDEFMessage:(id)a3;
+ (id)decodeFromNDEFMessage:(id)a3;
- (NFNdefMessageInternal)init;
- (NFNdefMessageInternal)initWithBytes:(const void *)a3 length:(unsigned int)a4;
- (NFNdefMessageInternal)initWithCoder:(id)a3;
- (NFNdefMessageInternal)initWithData:(id)a3;
- (NFNdefMessageInternal)initWithNDEFMessage:(id)a3;
- (NSArray)records;
- (NSString)description;
- (id)asData;
- (id)decode;
- (void)addRecord:(id)a3;
- (void)addRecordArray:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFNdefMessageInternal

- (NFNdefMessageInternal)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFNdefMessageInternal;
  v2 = [(NFNdefMessageInternal *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    records = v2->_records;
    v2->_records = (NSMutableArray *)v3;
  }
  return v2;
}

- (NFNdefMessageInternal)initWithBytes:(const void *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)NFNdefMessageInternal;
  objc_super v6 = [(NFNdefMessageInternal *)&v11 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    records = v6->_records;
    v6->_records = (NSMutableArray *)v7;

    v9 = +[NFNdefRecordInternal recordsFromBytes:a3 length:v4];
    if (v9) {
      [(NSMutableArray *)v6->_records addObjectsFromArray:v9];
    }
  }
  return v6;
}

- (NFNdefMessageInternal)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return [(NFNdefMessageInternal *)self initWithBytes:v5 length:v6];
}

- (NFNdefMessageInternal)initWithNDEFMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFNdefMessageInternal;
  uint64_t v5 = [(NFNdefMessageInternal *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    records = v5->_records;
    v5->_records = (NSMutableArray *)v6;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = [v4 records];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[NFNdefRecordInternal alloc] initWithNDEFRecord:*(void *)(*((void *)&v17 + 1) + 8 * v12)];
          if (!v13)
          {

            v15 = 0;
            goto LABEL_13;
          }
          v14 = v13;
          [(NSMutableArray *)v5->_records addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  v15 = v5;
LABEL_13:

  return v15;
}

- (NSArray)records
{
  return (NSArray *)self->_records;
}

+ (id)dataFromNDEFMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 records];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [v3 records];
      uint64_t v9 = [v8 objectAtIndex:v7];

      [v9 setMessageBegin:v7 == 0];
      uint64_t v10 = [v3 records];
      [v9 setMessageEnd:v7 == [v10 count] - 1];

      uint64_t v11 = [v9 asData];
      [v4 appendData:v11];

      ++v7;
      uint64_t v12 = [v3 records];
      unint64_t v13 = [v12 count];
    }
    while (v7 < v13);
  }

  return v4;
}

+ (id)decodeFromNDEFMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 records];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = 0;
    int v8 = 0;
    do
    {
      uint64_t v9 = [v3 records];
      uint64_t v10 = [v9 objectAtIndex:v7];

      if ([v10 chunked])
      {
        uint64_t v11 = objc_opt_new();
        [v11 setHeader:[v10 header]];
        [v11 setChunked:0];
        [v11 setMessageEnd:1];
        [v11 setTypeNameFormat:[v10 typeNameFormat]];
        uint64_t v12 = [v10 type];
        [v11 setType:v12];

        unint64_t v13 = [v10 identifier];
        [v11 setIdentifier:v13];

        id v14 = objc_alloc(MEMORY[0x1E4F1CA58]);
        v15 = [v10 payload];
        v16 = (void *)[v14 initWithData:v15];

        uint64_t v17 = v8 + 1;
        while (1)
        {
          unint64_t v18 = v17;
          long long v19 = [v3 records];
          unint64_t v20 = [v19 count];

          if (v20 <= v18) {
            break;
          }
          objc_super v21 = [v3 records];
          v22 = [v21 objectAtIndex:v18];

          uint64_t v23 = [v22 payload];
          [v16 appendData:v23];

          char v24 = [v22 chunked];
          uint64_t v17 = v18 + 1;
          uint64_t v10 = v22;
          if ((v24 & 1) == 0) {
            goto LABEL_12;
          }
        }
        v22 = v10;
LABEL_12:
        [v11 setPayload:v16];
        v25 = [v11 decode];
        if ([v25 length]) {
          [v4 appendFormat:@"%@\n", v25];
        }

        int v8 = v18;
      }
      else
      {
        uint64_t v11 = [v10 decode];
        if ([v11 length]) {
          [v4 appendFormat:@"%@\n", v11];
        }
        v22 = v10;
      }

      uint64_t v7 = ++v8;
      v26 = [v3 records];
      unint64_t v27 = [v26 count];
    }
    while (v27 > v8);
  }

  return v4;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)NFNdefMessageInternal;
  id v4 = [(NFNdefMessageInternal *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ { records %@ }", v4, self->_records];

  return (NSString *)v5;
}

- (id)decode
{
  return +[NFNdefMessageInternal decodeFromNDEFMessage:self];
}

- (id)asData
{
  return +[NFNdefMessageInternal dataFromNDEFMessage:self];
}

- (void)addRecord:(id)a3
{
}

- (void)addRecordArray:(id)a3
{
}

- (NFNdefMessageInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFNdefMessageInternal;
  uint64_t v5 = [(NFNdefMessageInternal *)&v10 init];
  if (v5)
  {
    uint64_t v6 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"records"];
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