@interface THGlossaryIndexSection
- (NSArray)entries;
- (NSString)sectionTitle;
- (THGlossaryIndexSection)initWithSectionTitle:(id)a3 andEntry:(id)a4;
- (id)entryAtIndex:(int64_t)a3;
- (int64_t)compare:(id)a3;
- (int64_t)entryCount;
- (int64_t)indexForEntry:(id)a3;
- (int64_t)sectionIndex;
- (void)addEntry:(id)a3;
- (void)dealloc;
- (void)setSectionIndex:(int64_t)a3;
@end

@implementation THGlossaryIndexSection

- (THGlossaryIndexSection)initWithSectionTitle:(id)a3 andEntry:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THGlossaryIndexSection;
  v6 = [(THGlossaryIndexSection *)&v8 init];
  if (v6)
  {
    v6->mSectionTitle = (NSString *)[a3 copy];
    v6->mEntries = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithObjects:a4, 0];
    v6->mEntriesNeedSorting = 0;
  }
  return v6;
}

- (void)dealloc
{
  self->mSectionTitle = 0;
  self->mEntries = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryIndexSection;
  [(THGlossaryIndexSection *)&v3 dealloc];
}

- (int64_t)compare:(id)a3
{
  mSectionTitle = self->mSectionTitle;
  id v4 = [a3 sectionTitle];

  return [(NSString *)mSectionTitle localizedCaseInsensitiveCompare:v4];
}

- (void)addEntry:(id)a3
{
  self->mEntriesNeedSorting = 1;
}

- (id)entryAtIndex:(int64_t)a3
{
  if (self->mEntriesNeedSorting)
  {
    [(NSMutableArray *)self->mEntries sortUsingFunction:sub_C0038 context:0];
    self->mEntriesNeedSorting = 0;
  }
  mEntries = self->mEntries;

  return [(NSMutableArray *)mEntries objectAtIndex:a3];
}

- (int64_t)indexForEntry:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mEntries = self->mEntries;
  v5 = (char *)[(NSMutableArray *)mEntries countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      v9 = 0;
      v10 = &v6[(void)v7];
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mEntries);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) == a3) {
          return (int64_t)&v9[(void)v7];
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = (char *)[(NSMutableArray *)mEntries countByEnumeratingWithState:&v12 objects:v16 count:16];
      v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)entryCount
{
  return (int64_t)[(NSMutableArray *)self->mEntries count];
}

- (NSArray)entries
{
  if (self->mEntriesNeedSorting)
  {
    [(NSMutableArray *)self->mEntries sortUsingFunction:sub_C0038 context:0];
    self->mEntriesNeedSorting = 0;
  }
  mEntries = self->mEntries;

  return +[NSArray arrayWithArray:mEntries];
}

- (NSString)sectionTitle
{
  return self->mSectionTitle;
}

- (int64_t)sectionIndex
{
  return self->mSectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->mSectionIndex = a3;
}

@end