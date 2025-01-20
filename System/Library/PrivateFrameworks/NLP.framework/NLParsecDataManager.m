@interface NLParsecDataManager
+ (BOOL)supportsDomain:(id)a3;
+ (unsigned)maxNumberOfPOIsAllowed;
+ (void)enumerateEntriesForSerializedData:(id)a3 withBlock:(id)a4;
+ (void)notifyStoredSerializedDataChanged;
- (NSData)serializableData;
- (id)getEntries;
- (void)addEntry:(id)a3 domain:(id)a4 metaData:(id)a5;
- (void)dealloc;
- (void)insertEntry:(id)a3;
- (void)serializableData;
@end

@implementation NLParsecDataManager

+ (BOOL)supportsDomain:(id)a3
{
  return [a3 isEqualToString:@"activities"];
}

- (void)dealloc
{
  m_entries = self->m_entries;
  if (m_entries) {

  }
  v4.receiver = self;
  v4.super_class = (Class)NLParsecDataManager;
  [(NLParsecDataManager *)&v4 dealloc];
}

- (void)addEntry:(id)a3 domain:(id)a4 metaData:(id)a5
{
  if (!self->m_entries) {
    self->m_entries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v12 = objc_alloc_init(NLPOIEntryImpl);
  [(NLPOIEntryImpl *)v12 setName:a3];
  [(NLPOIEntryImpl *)v12 setDomain:a4];
  -[NLPOIEntryImpl setCategory:](v12, "setCategory:", [a5 valueForKey:@"c"]);
  objc_msgSend((id)objc_msgSend(a5, "valueForKey:", @"p"), "floatValue");
  -[NLPOIEntryImpl setScore:](v12, "setScore:");
  if ((unint64_t)[(NSMutableArray *)self->m_entries count] >= 0x64)
  {
    objc_msgSend((id)-[NSMutableArray lastObject](self->m_entries, "lastObject"), "score");
    float v10 = v9;
    [(NLPOIEntryImpl *)v12 score];
    if (v10 >= v11) {
      goto LABEL_7;
    }
    [(NSMutableArray *)self->m_entries removeLastObject];
  }
  [(NLParsecDataManager *)self insertEntry:v12];
LABEL_7:
}

- (void)insertEntry:(id)a3
{
  uint64_t v5 = [(NSMutableArray *)self->m_entries count];
  m_entries = self->m_entries;
  if (v5)
  {
    uint64_t v7 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->m_entries, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, [(NSMutableArray *)m_entries count], 1024, &__block_literal_global_3);
    v8 = self->m_entries;
    [(NSMutableArray *)v8 insertObject:a3 atIndex:v7];
  }
  else
  {
    [(NSMutableArray *)m_entries addObject:a3];
  }
}

uint64_t __35__NLParsecDataManager_insertEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_super v4 = NSNumber;
  [a3 score];
  uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
  v6 = NSNumber;
  [a2 score];
  uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");

  return [v5 compare:v7];
}

- (NSData)serializableData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->m_entries) {
    return 0;
  }
  v3 = (void *)[MEMORY[0x1E4F1CAA8] outputStreamToMemory];
  [v3 open];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F940A8]) initWithOutputStream:v3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  m_entries = self->m_entries;
  uint64_t v6 = [(NSMutableArray *)m_entries countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(m_entries);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (([v4 writeMessage:v10] & 1) == 0)
        {
          ParsecLogHandle = getParsecLogHandle();
          if (os_log_type_enabled(ParsecLogHandle, OS_LOG_TYPE_ERROR)) {
            [(NLParsecDataManager *)v10 serializableData];
          }
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSMutableArray *)m_entries countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    float v11 = (NSData *)[v3 propertyForKey:*MEMORY[0x1E4F1C4C0]];
  }
  else
  {
LABEL_13:
    float v11 = 0;
  }
  [v3 close];

  return v11;
}

+ (void)enumerateEntriesForSerializedData:(id)a3 withBlock:(id)a4
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA10] inputStreamWithData:a3];
  [v5 open];
  id v11 = (id)[objc_alloc(MEMORY[0x1E4F940A0]) initWithStream:v5];
  uint64_t v6 = [v11 setClassOfNextMessage:objc_opt_class()];
  uint64_t v7 = (void *)MEMORY[0x1A625B590](v6);
  uint64_t v8 = [v11 nextMessage];
  if (v8)
  {
    float v9 = (void *)v8;
    do
    {
      uint64_t v10 = [[NLPOIEntry alloc] initWithProtoBuf:v9];

      (*((void (**)(id, NLPOIEntry *))a4 + 2))(a4, v10);
      uint64_t v7 = (void *)MEMORY[0x1A625B590]();
      float v9 = (void *)[v11 nextMessage];
    }
    while (v9);
  }
  [v5 close];
}

+ (void)notifyStoredSerializedDataChanged
{
  v2 = (void *)[MEMORY[0x1E4F28C40] defaultCenter];

  [v2 postNotificationName:@"NLParsecDataChangedNotification" object:0];
}

- (id)getEntries
{
  return self->m_entries;
}

+ (unsigned)maxNumberOfPOIsAllowed
{
  return 100;
}

- (void)serializableData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A431F000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize hints data: %@", (uint8_t *)&v2, 0xCu);
}

@end