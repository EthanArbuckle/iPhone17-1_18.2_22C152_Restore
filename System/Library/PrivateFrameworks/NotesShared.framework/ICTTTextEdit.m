@interface ICTTTextEdit
- (BOOL)isEqual:(id)a3;
- (ICTTTextEdit)initWithAttributes:(id)a3 range:(_NSRange)a4;
- (ICTTTextEdit)initWithTimestamp:(id)a3 replicaID:(id)a4 range:(_NSRange)a5;
- (NSDate)timestamp;
- (NSUUID)replicaID;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithNote:(id)a3;
- (unint64_t)hash;
@end

@implementation ICTTTextEdit

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSUUID)replicaID
{
  return self->_replicaID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (ICTTTextEdit)initWithAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:ICTTAttributeNameReplicaID];
  if (v8)
  {
    v9 = [v7 objectForKeyedSubscript:ICTTAttributeNameTimestamp];
    v10 = v9;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E4F1C9C8];
      [v9 doubleValue];
      v12 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      v12 = 0;
    }
    self = -[ICTTTextEdit initWithTimestamp:replicaID:range:](self, "initWithTimestamp:replicaID:range:", v12, v8, location, length);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (ICTTTextEdit)initWithTimestamp:(id)a3 replicaID:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICTTTextEdit;
  v12 = [(ICTTTextEdit *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timestamp, a3);
    objc_storeStrong((id *)&v13->_replicaID, a4);
    v13->_range.NSUInteger location = location;
    v13->_range.NSUInteger length = length;
  }

  return v13;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICTTTextEdit *)self timestamp];
  id v7 = [(ICTTTextEdit *)self replicaID];
  v12.NSUInteger location = [(ICTTTextEdit *)self range];
  v8 = NSStringFromRange(v12);
  v9 = [v3 stringWithFormat:@"<%@: %p, timestamp: %@, replicaID: %@, range: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (id)descriptionWithNote:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1A3B0];
  v6 = [(ICTTTextEdit *)self replicaID];
  id v7 = [v4 userIDForReplicaID:v6];
  v8 = objc_msgSend(v5, "ic_participantNameOrFallbackForUserRecordName:note:", v7, v4);

  v9 = [(ICTTTextEdit *)self timestamp];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F28C10];
    id v11 = [(ICTTTextEdit *)self timestamp];
    NSRange v12 = [v10 localizedStringFromDate:v11 dateStyle:1 timeStyle:1];

    v13 = [(ICTTTextEdit *)self replicaID];
    LODWORD(v11) = [v4 trustsTimestampsFromReplicaID:v13];

    if (v11) {
      v14 = @"%@ edited at %@";
    }
    else {
      v14 = @"%@ edited at %@ (untrusted)";
    }
    objc_super v15 = objc_msgSend(NSString, "stringWithFormat:", v14, v8, v12);
  }
  else
  {
    objc_super v15 = [NSString stringWithFormat:@"%@ edited", v8];
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = ICDynamicCast();

    v6 = [(ICTTTextEdit *)self timestamp];
    id v7 = [v5 timestamp];
    v8 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v6) {
      v9 = 0;
    }
    else {
      v9 = v6;
    }
    uint64_t v10 = v9;
    if (v8 == v7) {
      id v11 = 0;
    }
    else {
      id v11 = v7;
    }
    unint64_t v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14) {
        goto LABEL_22;
      }
      int v15 = [(id)v10 isEqual:v12];

      if (!v15)
      {
        BOOL v21 = 0;
        goto LABEL_24;
      }
    }
    uint64_t v10 = [v5 replicaID];
    v13 = [(ICTTTextEdit *)self replicaID];
    if ([(id)v10 isEqual:v13])
    {
      uint64_t v16 = [v5 range];
      uint64_t v18 = v17;
      BOOL v21 = v16 == [(ICTTTextEdit *)self range] && v18 == v19;
      goto LABEL_23;
    }
LABEL_22:
    BOOL v21 = 0;
LABEL_23:

LABEL_24:
    return v21;
  }
  return 1;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICTTTextEdit *)self timestamp];
    uint64_t v5 = [v4 hash];
    if (!v5)
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      uint64_t v5 = [v6 hash];
    }
    id v7 = [(ICTTTextEdit *)self replicaID];
    char v8 = [v7 hash];
    [(ICTTTextEdit *)self range];
    [(ICTTTextEdit *)self range];
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v8);

    return self->_hash;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ICTTTextEdit allocWithZone:a3];
  uint64_t v5 = [(ICTTTextEdit *)self timestamp];
  v6 = [(ICTTTextEdit *)self replicaID];
  uint64_t v7 = [(ICTTTextEdit *)self range];
  uint64_t v9 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v4, "initWithTimestamp:replicaID:range:", v5, v6, v7, v8);

  return v9;
}

@end