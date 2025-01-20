@interface ICOutlineState
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICOutlineState:(id)a3;
- (BOOL)mergeWithState:(id)a3;
- (ICOutlineState)initWithCollapsedUUIDs:(id)a3;
- (ICOutlineState)initWithData:(id)a3;
- (ICTTMergeableWallClockValue)mergeableValue;
- (NSArray)collapsedUUIDStrings;
- (NSData)data;
- (NSSet)collapsedUUIDs;
- (unint64_t)hash;
- (void)setMergeableValue:(id)a3;
- (void)updateCollapsedUUIDs;
@end

@implementation ICOutlineState

- (NSSet)collapsedUUIDs
{
  return self->_collapsedUUIDs;
}

- (ICOutlineState)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICOutlineState;
  v5 = [(ICOutlineState *)&v9 init];
  if (v5)
  {
    v6 = [[ICTTMergeableWallClockValue alloc] initWithData:v4];
    mergeableValue = v5->_mergeableValue;
    v5->_mergeableValue = v6;

    [(ICOutlineState *)v5 updateCollapsedUUIDs];
  }

  return v5;
}

- (void)updateCollapsedUUIDs
{
  objc_opt_class();
  v3 = [(ICOutlineState *)self mergeableValue];
  id v4 = [v3 value];
  ICDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = objc_msgSend(v9, "ic_compactMap:", &__block_literal_global_37);
  v7 = [v5 setWithArray:v6];
  collapsedUUIDs = self->_collapsedUUIDs;
  self->_collapsedUUIDs = v7;
}

- (ICTTMergeableWallClockValue)mergeableValue
{
  return self->_mergeableValue;
}

- (ICOutlineState)initWithCollapsedUUIDs:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICOutlineState;
  v5 = [(ICOutlineState *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    collapsedUUIDs = v5->_collapsedUUIDs;
    v5->_collapsedUUIDs = (NSSet *)v6;

    v8 = [ICTTMergeableWallClockValue alloc];
    id v9 = [(ICOutlineState *)v5 collapsedUUIDStrings];
    v10 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v11 = [(ICTTMergeableWallClockValue *)v8 initWithValue:v9 timestamp:v10];
    mergeableValue = v5->_mergeableValue;
    v5->_mergeableValue = (ICTTMergeableWallClockValue *)v11;
  }
  return v5;
}

- (NSData)data
{
  v2 = [(ICOutlineState *)self mergeableValue];
  v3 = [v2 serialize];

  return (NSData *)v3;
}

- (BOOL)mergeWithState:(id)a3
{
  id v4 = a3;
  v5 = [(ICOutlineState *)self mergeableValue];

  if (v5)
  {
    uint64_t v6 = [(ICOutlineState *)self mergeableValue];
    v7 = [v4 mergeableValue];
    uint64_t v8 = [v6 merge:v7];

    [(ICOutlineState *)self updateCollapsedUUIDs];
    BOOL v9 = v8 == 2;
  }
  else
  {
    v10 = [v4 mergeableValue];
    [(ICOutlineState *)self setMergeableValue:v10];

    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICOutlineState *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICOutlineState *)self isEqualToICOutlineState:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = [(ICOutlineState *)self collapsedUUIDs];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 hash];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v5 += ICHashWithObject(*(void **)(*((void *)&v20 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  unint64_t v18 = ICHashWithHashKeys(v5, v11, v12, v13, v14, v15, v16, v17, 0);
  return v18;
}

id __38__ICOutlineState_updateCollapsedUUIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (NSArray)collapsedUUIDStrings
{
  id v2 = [(ICOutlineState *)self collapsedUUIDs];
  id v3 = objc_msgSend(v2, "ic_map:", &__block_literal_global_14);
  id v4 = [v3 allObjects];

  return (NSArray *)v4;
}

uint64_t __38__ICOutlineState_collapsedUUIDStrings__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (BOOL)isEqualToICOutlineState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICOutlineState *)self collapsedUUIDs];
  id v6 = [v4 collapsedUUIDs];

  LOBYTE(v4) = [v5 isEqualToSet:v6];
  return (char)v4;
}

- (void)setMergeableValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableValue, 0);
  objc_storeStrong((id *)&self->_collapsedUUIDs, 0);
}

@end