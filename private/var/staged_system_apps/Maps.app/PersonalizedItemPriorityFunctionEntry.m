@interface PersonalizedItemPriorityFunctionEntry
+ (id)defaultEntryWithPriority:(int64_t)a3;
+ (id)entryWithPriority:(int64_t)a3 matchBlock:(id)a4;
+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4;
+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4 matchBlock:(id)a5;
+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5;
+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5 matchBlock:(id)a6;
- (BOOL)matches:(id)a3;
- (BOOL)matchesAnySourceSubtype;
- (BOOL)matchesAnySourceType;
- (PersonalizedItemPriorityFunctionEntry)initWithPriority:(int64_t)a3 matchesAnySourceType:(BOOL)a4 sourceType:(int64_t)a5 matchesAnySourceSubtype:(BOOL)a6 sourceSubtype:(int64_t)a7 matchBlock:(id)a8;
- (id)matchBlock;
- (int64_t)priority;
- (int64_t)sourceSubtype;
- (int64_t)sourceType;
@end

@implementation PersonalizedItemPriorityFunctionEntry

+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5
{
  id v5 = [objc_alloc((Class)a1) initWithPriority:a3 matchesAnySourceType:0 sourceType:a4 matchesAnySourceSubtype:0 sourceSubtype:a5 matchBlock:0];

  return v5;
}

+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4
{
  id v4 = [objc_alloc((Class)a1) initWithPriority:a3 matchesAnySourceType:0 sourceType:a4 matchesAnySourceSubtype:1 sourceSubtype:0 matchBlock:0];

  return v4;
}

- (PersonalizedItemPriorityFunctionEntry)initWithPriority:(int64_t)a3 matchesAnySourceType:(BOOL)a4 sourceType:(int64_t)a5 matchesAnySourceSubtype:(BOOL)a6 sourceSubtype:(int64_t)a7 matchBlock:(id)a8
{
  id v14 = a8;
  v20.receiver = self;
  v20.super_class = (Class)PersonalizedItemPriorityFunctionEntry;
  v15 = [(PersonalizedItemPriorityFunctionEntry *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_priority = a3;
    v15->_matchesAnySourceType = a4;
    v15->_matchesAnySourceSubtype = a6;
    v15->_sourceType = a5;
    v15->_sourceSubtype = a7;
    id v17 = objc_retainBlock(v14);
    id matchBlock = v16->_matchBlock;
    v16->_id matchBlock = v17;
  }
  return v16;
}

+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4 matchBlock:(id)a5
{
  id v8 = a5;
  id v9 = [objc_alloc((Class)a1) initWithPriority:a3 matchesAnySourceType:0 sourceType:a4 matchesAnySourceSubtype:1 sourceSubtype:0 matchBlock:v8];

  return v9;
}

+ (id)defaultEntryWithPriority:(int64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithPriority:a3 matchesAnySourceType:1 sourceType:0 matchesAnySourceSubtype:1 sourceSubtype:0 matchBlock:0];

  return v3;
}

+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5 matchBlock:(id)a6
{
  id v10 = a6;
  id v11 = [objc_alloc((Class)a1) initWithPriority:a3 matchesAnySourceType:0 sourceType:a4 matchesAnySourceSubtype:0 sourceSubtype:a5 matchBlock:v10];

  return v11;
}

+ (id)entryWithPriority:(int64_t)a3 matchBlock:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithPriority:a3 matchesAnySourceType:1 sourceType:0 matchesAnySourceSubtype:1 sourceSubtype:0 matchBlock:v6];

  return v7;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  if (([(PersonalizedItemPriorityFunctionEntry *)self matchesAnySourceType]
     || (id v5 = [v4 sourceType],
         v5 == (id)[(PersonalizedItemPriorityFunctionEntry *)self sourceType]))
    && ([(PersonalizedItemPriorityFunctionEntry *)self matchesAnySourceSubtype]
     || (id v6 = [v4 sourceSubtype],
         v6 == (id)[(PersonalizedItemPriorityFunctionEntry *)self sourceSubtype])))
  {
    uint64_t v7 = [(PersonalizedItemPriorityFunctionEntry *)self matchBlock];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [(PersonalizedItemPriorityFunctionEntry *)self matchBlock];
      char v10 = ((uint64_t (**)(void, id))v9)[2](v9, v4);
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)priority
{
  return self->_priority;
}

- (id)matchBlock
{
  return self->_matchBlock;
}

- (BOOL)matchesAnySourceType
{
  return self->_matchesAnySourceType;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (BOOL)matchesAnySourceSubtype
{
  return self->_matchesAnySourceSubtype;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

- (void).cxx_destruct
{
}

@end