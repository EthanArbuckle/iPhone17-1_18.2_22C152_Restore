@interface IMTextIndex
+ (BOOL)supportsSecureCoding;
+ (id)textIndexWithName:(id)a3;
+ (void)_lowMemoryWarning:(id)a3;
+ (void)addTextIndex:(id)a3 withName:(id)a4;
+ (void)initialize;
+ (void)removeTextIndexWithName:(id)a3;
- (BOOL)containsTextUnitWithIdentifier:(id)a3;
- (BOOL)isEmpty;
- (IMTextIndex)initWithCaseRule:(int)a3;
- (IMTextIndex)initWithCoder:(id)a3;
- (id)_candidateIdentifiersForStringQueries:(id)a3;
- (id)_indexingDispatchGroup;
- (id)allIdentifiers;
- (id)candidateIdentifiersForStringQuery:(id)a3;
- (int)caseRule;
- (unint64_t)textUnitCount;
- (void)_indexDispatchGroupDispatchToQueue:(id)a3 block:(id)a4;
- (void)_waitAndCleanupDispatchGroup;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)indexTextUnit:(id)a3 withIdentifier:(id)a4;
- (void)indexTextUnit:(id)a3 withIdentifier:(id)a4 indexSynchronously:(BOOL)a5;
@end

@implementation IMTextIndex

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:a1 selector:"_lowMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
}

+ (void)_lowMemoryWarning:(id)a3
{
  id v5 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  [(id)qword_349280 removeAllObjects];
  objc_sync_exit(v4);
}

+ (id)textIndexWithName:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  v6 = [(id)qword_349280 objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

+ (void)addTextIndex:(id)a3 withName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && v6)
  {
    id v7 = a1;
    objc_sync_enter(v7);
    v8 = (void *)qword_349280;
    if (!qword_349280)
    {
      id v9 = objc_alloc_init((Class)NSMutableDictionary);
      v10 = (void *)qword_349280;
      qword_349280 = (uint64_t)v9;

      v8 = (void *)qword_349280;
    }
    [v8 setObject:v11 forKey:v6];
    objc_sync_exit(v7);
  }
  else
  {
    NSLog(@"Warning : Missing parameters in %s (%@, %@)", "+[IMTextIndex addTextIndex:withName:]", v11, v6);
  }
}

+ (void)removeTextIndexWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = a1;
    objc_sync_enter(v5);
    [(id)qword_349280 removeObjectForKey:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (IMTextIndex)initWithCaseRule:(int)a3
{
  v13.receiver = self;
  v13.super_class = (Class)IMTextIndex;
  id v4 = [(IMTextIndex *)&v13 init];
  id v5 = v4;
  if (v4)
  {
    v4->_caseRule = a3;
    long long v11 = xmmword_2A25A8;
    uint64_t v12 = 4;
    id v6 = [[IMLibraryFragmentFilter alloc] initWithFilterSpecification:&v11];
    library = v5->_library;
    v5->_library = v6;

    v8 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    indexingDispatchGroupLock = v5->_indexingDispatchGroupLock;
    v5->_indexingDispatchGroupLock = v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v5 encodeInt:v4->_caseRule forKey:@"caseRule"];
  [v5 encodeObject:v4->_library forKey:@"library"];
  objc_sync_exit(v4);
}

- (IMTextIndex)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMTextIndex;
  id v5 = [(IMTextIndex *)&v11 init];
  if (v5)
  {
    v5->_caseRule = [v4 decodeIntForKey:@"caseRule"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"library"];
    library = v5->_library;
    v5->_library = (IMLibraryFragmentFilter *)v6;

    v8 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    indexingDispatchGroupLock = v5->_indexingDispatchGroupLock;
    v5->_indexingDispatchGroupLock = v8;
  }
  return v5;
}

- (void)_waitAndCleanupDispatchGroup
{
  [(NSRecursiveLock *)self->_indexingDispatchGroupLock lock];
  indexingDispatchGroup = self->_indexingDispatchGroup;
  if (indexingDispatchGroup)
  {
    dispatch_group_wait(indexingDispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
    id v4 = self->_indexingDispatchGroup;
    self->_indexingDispatchGroup = 0;
  }
  indexingDispatchGroupLock = self->_indexingDispatchGroupLock;

  [(NSRecursiveLock *)indexingDispatchGroupLock unlock];
}

- (id)_indexingDispatchGroup
{
  [(NSRecursiveLock *)self->_indexingDispatchGroupLock lock];
  indexingDispatchGroup = self->_indexingDispatchGroup;
  if (!indexingDispatchGroup)
  {
    id v4 = (OS_dispatch_group *)dispatch_group_create();
    id v5 = self->_indexingDispatchGroup;
    self->_indexingDispatchGroup = v4;

    indexingDispatchGroup = self->_indexingDispatchGroup;
  }
  uint64_t v6 = indexingDispatchGroup;
  [(NSRecursiveLock *)self->_indexingDispatchGroupLock unlock];

  return v6;
}

- (void)_indexDispatchGroupDispatchToQueue:(id)a3 block:(id)a4
{
  queue = a3;
  id v6 = a4;
  [(NSRecursiveLock *)self->_indexingDispatchGroupLock lock];
  id v7 = [(IMTextIndex *)self _indexingDispatchGroup];
  dispatch_group_async(v7, queue, v6);

  [(NSRecursiveLock *)self->_indexingDispatchGroupLock unlock];
}

- (void)indexTextUnit:(id)a3 withIdentifier:(id)a4 indexSynchronously:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  if (v5)
  {
    id v11 = v8;
    uint64_t v12 = [v11 stringByConvertingNewlineCharacterSetToSpace];

    if (v10->_caseRule == 1)
    {
      uint64_t v13 = [v12 lowercaseString];

      uint64_t v12 = (void *)v13;
    }
    [(IMLibraryFragmentFilter *)v10->_library addDocument:v12 withIdentifier:v9];
  }
  else
  {
    uint64_t v12 = dispatch_get_global_queue(0, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_121D98;
    v14[3] = &unk_2C48E0;
    v14[4] = v10;
    id v15 = v8;
    id v16 = v9;
    [(IMTextIndex *)v10 _indexDispatchGroupDispatchToQueue:v12 block:v14];
  }
  objc_sync_exit(v10);
}

- (void)indexTextUnit:(id)a3 withIdentifier:(id)a4
{
}

- (BOOL)containsTextUnitWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = [(IMLibraryFragmentFilter *)v5->_library containsDocumentWithIdentifier:v4];
  objc_sync_exit(v5);

  return v6;
}

- (unint64_t)textUnitCount
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(IMLibraryFragmentFilter *)v2->_library documentCount];
  objc_sync_exit(v2);

  return v3;
}

- (id)allIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(IMLibraryFragmentFilter *)v2->_library allIdentifiers];
  objc_sync_exit(v2);

  return v3;
}

- (id)_candidateIdentifiersForStringQueries:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = -[IMLibraryFragmentFilter candidateIdentifiersForQuery:](v5->_library, "candidateIdentifiersForQuery:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v6 unionSet:v11];
      }
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);

  return v6;
}

- (id)candidateIdentifiersForStringQuery:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  int caseRule = v5->_caseRule;
  if (caseRule)
  {
    if (caseRule == 1)
    {
      id v7 = [v4 lowercaseString];
      id v8 = +[NSArray arrayWithObject:v7];
      uint64_t v9 = [(IMTextIndex *)v5 _candidateIdentifiersForStringQueries:v8];
    }
    else
    {
      id v7 = [v4 lowercaseString];
      id v8 = [v4 uppercaseString];
      v10 = [v4 capitalizedString];
      id v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, v10, v4, 0);
      uint64_t v9 = [(IMTextIndex *)v5 _candidateIdentifiersForStringQueries:v11];
    }
  }
  else
  {
    id v7 = +[NSArray arrayWithObject:v4];
    uint64_t v9 = [(IMTextIndex *)v5 _candidateIdentifiersForStringQueries:v7];
  }

  objc_sync_exit(v5);

  return v9;
}

- (BOOL)isEmpty
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(IMLibraryFragmentFilter *)v2->_library allIdentifiers];
  BOOL v4 = [v3 count] == 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)dealloc
{
  [(IMTextIndex *)self _waitAndCleanupDispatchGroup];
  indexingDispatchGroupLock = self->_indexingDispatchGroupLock;
  self->_indexingDispatchGroupLock = 0;

  library = self->_library;
  self->_library = 0;

  v5.receiver = self;
  v5.super_class = (Class)IMTextIndex;
  [(IMTextIndex *)&v5 dealloc];
}

- (int)caseRule
{
  return self->_caseRule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingDispatchGroupLock, 0);
  objc_storeStrong((id *)&self->_indexingDispatchGroup, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

@end