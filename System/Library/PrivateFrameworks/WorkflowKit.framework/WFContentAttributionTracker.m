@interface WFContentAttributionTracker
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)attributionSets;
- (OS_dispatch_queue)trackingAttributionSetQueue;
- (WFContentAttributionTracker)init;
- (WFContentAttributionTracker)initWithAttributionSets:(id)a3;
- (WFContentAttributionTracker)initWithCoder:(id)a3;
- (id)attributionSetForParameter:(id)a3;
- (id)trackedAttributionSet;
- (void)addAttributionSet:(id)a3 forParameter:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)replaceAttributionSet:(id)a3 forParameter:(id)a4;
@end

@implementation WFContentAttributionTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingAttributionSetQueue, 0);
  objc_storeStrong((id *)&self->_attributionSets, 0);
}

- (OS_dispatch_queue)trackingAttributionSetQueue
{
  return self->_trackingAttributionSetQueue;
}

- (NSMutableDictionary)attributionSets
{
  return self->_attributionSets;
}

- (WFContentAttributionTracker)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v10 = [v5 decodeObjectOfClasses:v9 forKey:@"attributionSets"];

  v11 = [(WFContentAttributionTracker *)self initWithAttributionSets:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentAttributionTracker *)self attributionSets];
  [v4 encodeObject:v5 forKey:@"attributionSets"];
}

- (id)trackedAttributionSet
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__48289;
  v13 = __Block_byref_object_dispose__48290;
  id v14 = [MEMORY[0x1E4F1CA80] set];
  v3 = [(WFContentAttributionTracker *)self trackingAttributionSetQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__WFContentAttributionTracker_trackedAttributionSet__block_invoke;
  v8[3] = &unk_1E6558960;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  id v4 = (void *)MEMORY[0x1E4F5A828];
  id v5 = [(id)v10[5] allObjects];
  uint64_t v6 = [v4 attributionSetByMergingAttributionSets:v5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __52__WFContentAttributionTracker_trackedAttributionSet__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__WFContentAttributionTracker_trackedAttributionSet__block_invoke_2;
  v3[3] = &unk_1E65549F0;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __52__WFContentAttributionTracker_trackedAttributionSet__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "unionSet:");
}

- (id)attributionSetForParameter:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__48289;
  v20 = __Block_byref_object_dispose__48290;
  id v21 = 0;
  id v5 = [(WFContentAttributionTracker *)self trackingAttributionSetQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__WFContentAttributionTracker_attributionSetForParameter___block_invoke;
  block[3] = &unk_1E6558270;
  v15 = &v16;
  block[4] = self;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync(v5, block);

  uint64_t v7 = (void *)MEMORY[0x1E4F5A828];
  uint64_t v8 = [(id)v17[5] allObjects];
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v11 = [v7 attributionSetByMergingAttributionSets:v10];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __58__WFContentAttributionTracker_attributionSetForParameter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = [*(id *)(a1 + 40) key];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)replaceAttributionSet:(id)a3 forParameter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFContentAttributionTracker.m", 52, @"Invalid parameter not satisfying: %@", @"contentAttributionSet" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFContentAttributionTracker.m", 53, @"Invalid parameter not satisfying: %@", @"parameter" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = [(WFContentAttributionTracker *)self trackingAttributionSetQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WFContentAttributionTracker_replaceAttributionSet_forParameter___block_invoke;
  block[3] = &unk_1E65556E0;
  block[4] = self;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  dispatch_sync(v10, block);
}

void __66__WFContentAttributionTracker_replaceAttributionSet_forParameter___block_invoke(void *a1)
{
  id v5 = [MEMORY[0x1E4F1CA80] setWithObject:a1[6]];
  v2 = (void *)a1[5];
  uint64_t v3 = *(void **)(a1[4] + 8);
  uint64_t v4 = [v2 key];
  [v3 setObject:v5 forKeyedSubscript:v4];
}

- (void)addAttributionSet:(id)a3 forParameter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFContentAttributionTracker.m", 39, @"Invalid parameter not satisfying: %@", @"contentAttributionSet" object file lineNumber description];
  }
  uint64_t v9 = [(WFContentAttributionTracker *)self trackingAttributionSetQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WFContentAttributionTracker_addAttributionSet_forParameter___block_invoke;
  block[3] = &unk_1E65556E0;
  block[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(v9, block);
}

void __62__WFContentAttributionTracker_addAttributionSet_forParameter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [*(id *)(a1 + 40) key];
  id v8 = [v2 objectForKeyedSubscript:v3];

  if (v8)
  {
    [v8 addObject:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] setWithObject:*(void *)(a1 + 48)];
    id v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 8);
    id v7 = [v5 key];
    [v6 setObject:v4 forKeyedSubscript:v7];
  }
}

- (WFContentAttributionTracker)initWithAttributionSets:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFContentAttributionTracker;
  id v6 = [(WFContentAttributionTracker *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributionSets, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.Shortcuts.ContentAttributionSetTrackingQueue", 0);
    trackingAttributionSetQueue = v7->_trackingAttributionSetQueue;
    v7->_trackingAttributionSetQueue = (OS_dispatch_queue *)v8;

    id v10 = v7;
  }

  return v7;
}

- (WFContentAttributionTracker)init
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(WFContentAttributionTracker *)self initWithAttributionSets:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end