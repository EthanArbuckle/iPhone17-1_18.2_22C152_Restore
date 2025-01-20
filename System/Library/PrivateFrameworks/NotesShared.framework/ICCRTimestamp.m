@interface ICCRTimestamp
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTimestamp:(id)a3;
- (ICCRTimestamp)initWithICCRCoder:(id)a3;
- (ICCRTimestamp)initWithProtobufTimestamp:(const void *)a3 decoder:(id)a4;
- (ICCRTimestamp)initWithReplica:(id)a3 andCounter:(int64_t)a4;
- (NSString)description;
- (NSUUID)replica;
- (id)earlierTimestamp:(id)a3;
- (id)laterTimestamp:(id)a3;
- (id)nextTimestamp;
- (id)nextTimestampForReplica:(id)a3;
- (id)shortDescription;
- (int64_t)compare:(id)a3;
- (int64_t)counter;
- (unint64_t)hash;
- (void)encodeIntoProtobufTimestamp:(void *)a3 coder:(id)a4;
- (void)encodeWithICCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)setCounter:(int64_t)a3;
- (void)setReplica:(id)a3;
@end

@implementation ICCRTimestamp

- (ICCRTimestamp)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 7)
  {
    self = [(ICCRTimestamp *)self initWithProtobufTimestamp:*(void *)(v5 + 40) decoder:v4];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 7)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 7;
    operator new();
  }
  [(ICCRTimestamp *)self encodeIntoProtobufTimestamp:*(void *)(v4 + 40) coder:v6];
}

- (ICCRTimestamp)initWithProtobufTimestamp:(const void *)a3 decoder:(id)a4
{
  id v6 = a4;
  v7 = [(ICCRTimestamp *)self init];
  if (v7)
  {
    int v8 = *((_DWORD *)a3 + 8);
    if (v8)
    {
      uint64_t v9 = [v6 decodeUUIDFromUUIDIndex:*((void *)a3 + 5)];
      replica = v7->_replica;
      v7->_replica = (NSUUID *)v9;

      int v8 = *((_DWORD *)a3 + 8);
    }
    if ((v8 & 2) != 0) {
      v7->_counter = *((void *)a3 + 6);
    }
  }

  return v7;
}

- (void)encodeIntoProtobufTimestamp:(void *)a3 coder:(id)a4
{
  id v10 = a4;
  id v6 = [(ICCRTimestamp *)self replica];

  if (v6)
  {
    v7 = [(ICCRTimestamp *)self replica];
    uint64_t v8 = [v10 encodeUUIDIndexFromUUID:v7];
    *((_DWORD *)a3 + 8) |= 1u;
    *((void *)a3 + 5) = v8;
  }
  int64_t v9 = [(ICCRTimestamp *)self counter];
  *((_DWORD *)a3 + 8) |= 2u;
  *((void *)a3 + 6) = v9;
}

- (ICCRTimestamp)initWithReplica:(id)a3 andCounter:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCRTimestamp;
  uint64_t v8 = [(ICCRTimestamp *)&v11 init];
  int64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replica, a3);
    v9->_counter = a4;
  }

  return v9;
}

- (void)mergeWith:(id)a3
{
  id v5 = a3;
  if ([v5 compare:self] == 1)
  {
    uint64_t v4 = [v5 replica];
    [(ICCRTimestamp *)self setReplica:v4];

    -[ICCRTimestamp setCounter:](self, "setCounter:", [v5 counter]);
  }
}

- (id)nextTimestampForReplica:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCRTimestamp *)self replica];
  uint64_t v6 = objc_msgSend(v5, "CR_compare:", v4);

  id v7 = [ICCRTimestamp alloc];
  if (v6 == -1) {
    int64_t v8 = [(ICCRTimestamp *)self counter];
  }
  else {
    int64_t v8 = [(ICCRTimestamp *)self counter] + 1;
  }
  int64_t v9 = [(ICCRTimestamp *)v7 initWithReplica:v4 andCounter:v8];

  return v9;
}

- (id)nextTimestamp
{
  v3 = [ICCRTimestamp alloc];
  id v4 = [(ICCRTimestamp *)self replica];
  id v5 = [(ICCRTimestamp *)v3 initWithReplica:v4 andCounter:[(ICCRTimestamp *)self counter] + 1];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ICCRTimestamp *)self isEqualToTimestamp:v4];

  return v5;
}

- (BOOL)isEqualToTimestamp:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICCRTimestamp *)self counter];
  if (v5 == [v4 counter])
  {
    uint64_t v6 = [(ICCRTimestamp *)self replica];
    id v7 = [v4 replica];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(ICCRTimestamp *)self replica];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(ICCRTimestamp *)self counter] ^ v4;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICCRTimestamp *)self counter];
  if (v5 == [v4 counter])
  {
    uint64_t v6 = [(ICCRTimestamp *)self replica];
    id v7 = [v4 replica];
    int64_t v8 = objc_msgSend(v6, "CR_compare:", v7);
  }
  else
  {
    uint64_t v9 = [(ICCRTimestamp *)self counter];
    if (v9 > [v4 counter]) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = -1;
    }
  }

  return v8;
}

- (id)earlierTimestamp:(id)a3
{
  id v4 = (ICCRTimestamp *)a3;
  if ([(ICCRTimestamp *)self compare:v4] == 1) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = self;
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)laterTimestamp:(id)a3
{
  id v4 = (ICCRTimestamp *)a3;
  if ([(ICCRTimestamp *)self compare:v4] == -1) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = self;
  }
  uint64_t v6 = v5;

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  int64_t v6 = [(ICCRTimestamp *)self counter];
  id v7 = [(ICCRTimestamp *)self replica];
  int64_t v8 = [v3 stringWithFormat:@"<%@ %p %ld:%@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (id)shortDescription
{
  v3 = NSString;
  int64_t v4 = [(ICCRTimestamp *)self counter];
  int64_t v5 = [(ICCRTimestamp *)self replica];
  int64_t v6 = objc_msgSend(v5, "CR_shortDescription");
  id v7 = [v3 stringWithFormat:@"%ld:%@", v4, v6];

  return v7;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (void)setReplica:(id)a3
{
}

- (int64_t)counter
{
  return self->_counter;
}

- (void)setCounter:(int64_t)a3
{
  self->_counter = a3;
}

- (void).cxx_destruct
{
}

@end