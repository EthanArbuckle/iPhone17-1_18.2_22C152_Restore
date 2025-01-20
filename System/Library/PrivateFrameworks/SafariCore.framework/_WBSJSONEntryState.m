@interface _WBSJSONEntryState
- (BOOL)containsKey:(id)a3;
- (_WBSJSONEntryState)initWithKind:(int64_t)a3;
- (int64_t)kind;
- (unint64_t)numberOfEntries;
- (void)addEntry;
- (void)addKey:(id)a3;
@end

@implementation _WBSJSONEntryState

- (_WBSJSONEntryState)initWithKind:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_WBSJSONEntryState;
  v4 = [(_WBSJSONEntryState *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_kind = a3;
    if (!a3)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
      encodedKeys = v5->_encodedKeys;
      v5->_encodedKeys = (NSMutableSet *)v6;
    }
    v8 = v5;
  }

  return v5;
}

- (BOOL)containsKey:(id)a3
{
  return [(NSMutableSet *)self->_encodedKeys containsObject:a3];
}

- (void)addKey:(id)a3
{
}

- (void)addEntry
{
}

- (int64_t)kind
{
  return self->_kind;
}

- (unint64_t)numberOfEntries
{
  return self->_numberOfEntries;
}

- (void).cxx_destruct
{
}

@end