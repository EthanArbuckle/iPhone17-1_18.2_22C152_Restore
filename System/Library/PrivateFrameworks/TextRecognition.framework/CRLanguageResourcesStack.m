@interface CRLanguageResourcesStack
- (BOOL)hasSubscriber:(id)a3;
- (CRLanguageResourcesStack)initWithLocaleIdentifier:(id)a3 resourceType:(int64_t)a4;
- (NSMutableArray)availableResources;
- (NSMutableSet)activeSubscribers;
- (NSMutableSet)subscribers;
- (NSString)localeIdentifier;
- (OS_dispatch_semaphore)resourceCountSemaphore;
- (id)popResourceForSubscriber:(id)a3;
- (int64_t)resourceType;
- (int64_t)subscriberCount;
- (int64_t)totalResources;
- (void)addSubscriber:(id)a3;
- (void)deactivateSubscriber:(id)a3;
- (void)pushResource:(id)a3;
- (void)removeSubscriber:(id)a3;
- (void)setActiveSubscribers:(id)a3;
- (void)setAvailableResources:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setResourceCountSemaphore:(id)a3;
- (void)setResourceType:(int64_t)a3;
- (void)setSubscribers:(id)a3;
- (void)setTotalResources:(int64_t)a3;
@end

@implementation CRLanguageResourcesStack

- (CRLanguageResourcesStack)initWithLocaleIdentifier:(id)a3 resourceType:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLanguageResourcesStack;
  v7 = [(CRLanguageResourcesStack *)&v14 init];
  v8 = v7;
  if (v7)
  {
    [(CRLanguageResourcesStack *)v7 setLocaleIdentifier:v6];
    v9 = objc_opt_new();
    [(CRLanguageResourcesStack *)v8 setAvailableResources:v9];

    [(CRLanguageResourcesStack *)v8 setTotalResources:0];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    [(CRLanguageResourcesStack *)v8 setResourceCountSemaphore:v10];

    v11 = objc_opt_new();
    [(CRLanguageResourcesStack *)v8 setSubscribers:v11];

    [(CRLanguageResourcesStack *)v8 setResourceType:a4];
    v12 = objc_opt_new();
    [(CRLanguageResourcesStack *)v8 setActiveSubscribers:v12];
  }
  return v8;
}

- (id)popResourceForSubscriber:(id)a3
{
  id v4 = a3;
  v5 = [(CRLanguageResourcesStack *)self activeSubscribers];
  objc_sync_enter(v5);
  id v6 = [(CRLanguageResourcesStack *)self activeSubscribers];
  v7 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v4];
  [v6 addObject:v7];

  objc_sync_exit(v5);
  v8 = [(CRLanguageResourcesStack *)self availableResources];
  objc_sync_enter(v8);
  v9 = [(CRLanguageResourcesStack *)self availableResources];
  if ([v9 count])
  {
  }
  else
  {
    uint64_t v10 = [(CRLanguageResourcesStack *)self totalResources];

    if (v10 <= 3)
    {
      v11 = [CRLanguageResources alloc];
      v12 = [(CRLanguageResourcesStack *)self localeIdentifier];
      v13 = [(CRLanguageResources *)v11 initWithLanguageIdentifier:v12 type:[(CRLanguageResourcesStack *)self resourceType]];

      [(CRLanguageResourcesStack *)self setTotalResources:[(CRLanguageResourcesStack *)self totalResources] + 1];
      goto LABEL_6;
    }
  }
  v13 = 0;
LABEL_6:
  objc_sync_exit(v8);

  if (!v13)
  {
    objc_super v14 = [(CRLanguageResourcesStack *)self resourceCountSemaphore];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

    v15 = [(CRLanguageResourcesStack *)self availableResources];
    objc_sync_enter(v15);
    v16 = [(CRLanguageResourcesStack *)self availableResources];
    v13 = [v16 lastObject];

    v17 = [(CRLanguageResourcesStack *)self availableResources];
    [v17 removeLastObject];

    objc_sync_exit(v15);
  }
  v18 = v13;

  return v18;
}

- (void)pushResource:(id)a3
{
  id v7 = a3;
  id v4 = [(CRLanguageResourcesStack *)self availableResources];
  objc_sync_enter(v4);
  v5 = [(CRLanguageResourcesStack *)self availableResources];
  [v5 addObject:v7];

  id v6 = [(CRLanguageResourcesStack *)self resourceCountSemaphore];
  dispatch_semaphore_signal(v6);

  objc_sync_exit(v4);
}

- (void)addSubscriber:(id)a3
{
  id v10 = a3;
  id v4 = [(CRLanguageResourcesStack *)self subscribers];
  objc_sync_enter(v4);
  v5 = [(CRLanguageResourcesStack *)self subscribers];
  id v6 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v10];
  [v5 addObject:v6];

  objc_sync_exit(v4);
  id v7 = [(CRLanguageResourcesStack *)self activeSubscribers];
  objc_sync_enter(v7);
  v8 = [(CRLanguageResourcesStack *)self activeSubscribers];
  v9 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v10];
  [v8 addObject:v9];

  objc_sync_exit(v7);
}

- (void)removeSubscriber:(id)a3
{
  id v10 = a3;
  id v4 = [(CRLanguageResourcesStack *)self subscribers];
  objc_sync_enter(v4);
  v5 = [(CRLanguageResourcesStack *)self subscribers];
  id v6 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v10];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
  id v7 = [(CRLanguageResourcesStack *)self activeSubscribers];
  objc_sync_enter(v7);
  v8 = [(CRLanguageResourcesStack *)self activeSubscribers];
  v9 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v10];
  [v8 removeObject:v9];

  objc_sync_exit(v7);
}

- (void)deactivateSubscriber:(id)a3
{
  id v15 = a3;
  id v4 = [(CRLanguageResourcesStack *)self activeSubscribers];
  objc_sync_enter(v4);
  v5 = [(CRLanguageResourcesStack *)self activeSubscribers];
  id v6 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v15];
  [v5 removeObject:v6];

  id v7 = [(CRLanguageResourcesStack *)self activeSubscribers];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    v9 = [(CRLanguageResourcesStack *)self availableResources];
    objc_sync_enter(v9);
    id v10 = [(CRLanguageResourcesStack *)self availableResources];
    unint64_t v11 = [v10 count];

    if (v11 >= 2)
    {
      v12 = [(CRLanguageResourcesStack *)self availableResources];
      v13 = [(CRLanguageResourcesStack *)self availableResources];
      objc_msgSend(v12, "removeObjectsInRange:", 1, objc_msgSend(v13, "count") - 1);

      [(CRLanguageResourcesStack *)self setTotalResources:1];
      dispatch_semaphore_t v14 = dispatch_semaphore_create(1);
      [(CRLanguageResourcesStack *)self setResourceCountSemaphore:v14];
    }
    objc_sync_exit(v9);
  }
  objc_sync_exit(v4);
}

- (BOOL)hasSubscriber:(id)a3
{
  id v4 = a3;
  v5 = [(CRLanguageResourcesStack *)self subscribers];
  objc_sync_enter(v5);
  id v6 = [(CRLanguageResourcesStack *)self subscribers];
  id v7 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v4];
  char v8 = [v6 containsObject:v7];

  objc_sync_exit(v5);
  return v8;
}

- (int64_t)subscriberCount
{
  v2 = [(CRLanguageResourcesStack *)self subscribers];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)totalResources
{
  return self->_totalResources;
}

- (void)setTotalResources:(int64_t)a3
{
  self->_totalResources = a3;
}

- (NSMutableArray)availableResources
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAvailableResources:(id)a3
{
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (OS_dispatch_semaphore)resourceCountSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResourceCountSemaphore:(id)a3
{
}

- (NSMutableSet)subscribers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubscribers:(id)a3
{
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(int64_t)a3
{
  self->_resourceType = a3;
}

- (NSMutableSet)activeSubscribers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setActiveSubscribers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSubscribers, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_resourceCountSemaphore, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_availableResources, 0);
}

@end