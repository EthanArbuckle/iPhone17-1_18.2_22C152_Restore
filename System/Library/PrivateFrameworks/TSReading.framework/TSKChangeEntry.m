@interface TSKChangeEntry
- (NSMutableArray)changes;
- (TSKChangeEntry)initWithChangeSource:(id)a3 changes:(id)a4;
- (id)changeSource;
- (void)dealloc;
@end

@implementation TSKChangeEntry

- (TSKChangeEntry)initWithChangeSource:(id)a3 changes:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSKChangeEntry;
  v6 = [(TSKChangeEntry *)&v8 init];
  if (v6)
  {
    v6->mChangeSource = a3;
    v6->mChanges = (NSMutableArray *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKChangeEntry;
  [(TSKChangeEntry *)&v3 dealloc];
}

- (id)changeSource
{
  return self->mChangeSource;
}

- (NSMutableArray)changes
{
  return self->mChanges;
}

@end