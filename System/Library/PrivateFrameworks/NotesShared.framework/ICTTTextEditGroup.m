@interface ICTTTextEditGroup
- (BOOL)isEqual:(id)a3;
- (ICTTTextEditGroup)initWithEdits:(id)a3 latestTimestamp:(id)a4 userID:(id)a5 range:(_NSRange)a6;
- (NSArray)edits;
- (NSDate)latestTimestamp;
- (NSString)userID;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation ICTTTextEditGroup

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (ICTTTextEditGroup)initWithEdits:(id)a3 latestTimestamp:(id)a4 userID:(id)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ICTTTextEditGroup;
  v15 = [(ICTTTextEditGroup *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_edits, a3);
    objc_storeStrong((id *)&v16->_latestTimestamp, a4);
    objc_storeStrong((id *)&v16->_userID, a5);
    v16->_range.NSUInteger location = location;
    v16->_range.NSUInteger length = length;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_latestTimestamp, 0);
  objc_storeStrong((id *)&self->_edits, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICTTTextEditGroup *)self edits];
  v7 = [(ICTTTextEditGroup *)self latestTimestamp];
  v8 = [(ICTTTextEditGroup *)self userID];
  v13.NSUInteger location = [(ICTTTextEditGroup *)self range];
  v9 = NSStringFromRange(v13);
  v10 = [v3 stringWithFormat:@"<%@: %p, edits: %@, latestTimestamp: %@, userID: %@, range: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = ICDynamicCast();

    v6 = [v5 edits];
    v7 = [(ICTTTextEditGroup *)self edits];
    if (![v6 isEqual:v7])
    {
      BOOL v28 = 0;
LABEL_37:

      return v28;
    }
    v8 = [(ICTTTextEditGroup *)self latestTimestamp];
    v9 = [v5 latestTimestamp];
    v10 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v8) {
      v11 = 0;
    }
    else {
      v11 = v8;
    }
    uint64_t v12 = v11;
    if (v10 == v9) {
      NSRange v13 = 0;
    }
    else {
      NSRange v13 = v9;
    }
    unint64_t v14 = v13;
    if (v12 | v14)
    {
      v15 = (void *)v14;
      if (v12) {
        BOOL v16 = v14 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (v16) {
        goto LABEL_34;
      }
      int v17 = [(id)v12 isEqual:v14];

      if (!v17)
      {
        BOOL v28 = 0;
        goto LABEL_36;
      }
    }
    uint64_t v12 = [(ICTTTextEditGroup *)self userID];
    v15 = [v5 userID];
    if (v10 == (void *)v12) {
      objc_super v18 = 0;
    }
    else {
      objc_super v18 = (void *)v12;
    }
    unint64_t v19 = v18;
    if (v10 == v15) {
      v20 = 0;
    }
    else {
      v20 = v15;
    }
    unint64_t v21 = v20;
    if (!(v19 | v21)) {
      goto LABEL_25;
    }
    v22 = (void *)v21;
    if (v19 && v21)
    {
      int v30 = [(id)v19 isEqual:v21];

      if (v30)
      {
LABEL_25:
        uint64_t v23 = [v5 range];
        uint64_t v25 = v24;
        BOOL v28 = v23 == [(ICTTTextEditGroup *)self range] && v25 == v26;
        goto LABEL_35;
      }
    }
    else
    {
    }
LABEL_34:
    BOOL v28 = 0;
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  return 1;
}

- (unint64_t)hash
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICTTTextEditGroup *)self edits];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = [v6 hash];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v7 = ICHashWithObject(*(void **)(*((void *)&v23 + 1) + 8 * i)) - v7 + 32 * v7;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    NSRange v13 = [(ICTTTextEditGroup *)self latestTimestamp];
    char v14 = [v13 hash];
    v15 = [(ICTTTextEditGroup *)self userID];
    [v15 hash];
    [(ICTTTextEditGroup *)self range];
    [(ICTTTextEditGroup *)self range];
    self->_hash = ICHashWithHashKeys(v7, v16, v17, v18, v19, v20, v21, v22, v14);

    return self->_hash;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ICTTTextEditGroup allocWithZone:a3];
  id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
  v6 = [(ICTTTextEditGroup *)self edits];
  uint64_t v7 = (void *)[v5 initWithArray:v6 copyItems:1];
  id v8 = [(ICTTTextEditGroup *)self latestTimestamp];
  uint64_t v9 = [(ICTTTextEditGroup *)self userID];
  uint64_t v10 = [(ICTTTextEditGroup *)self range];
  uint64_t v12 = -[ICTTTextEditGroup initWithEdits:latestTimestamp:userID:range:](v4, "initWithEdits:latestTimestamp:userID:range:", v7, v8, v9, v10, v11);

  return v12;
}

- (NSArray)edits
{
  return self->_edits;
}

- (NSDate)latestTimestamp
{
  return self->_latestTimestamp;
}

- (NSString)userID
{
  return self->_userID;
}

@end