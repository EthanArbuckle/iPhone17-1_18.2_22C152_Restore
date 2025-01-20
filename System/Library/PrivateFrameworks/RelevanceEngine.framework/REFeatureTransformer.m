@interface REFeatureTransformer
+ (BOOL)supportsInvalidation;
+ (BOOL)supportsPersistence;
+ (id)binaryTransformerWithThreshold:(id)a3;
+ (id)bucketTransformerWithBitWidth:(unint64_t)a3;
+ (id)bucketTransformerWithCount:(unint64_t)a3 minValue:(id)a4 maxValue:(id)a5;
+ (id)changedTransform;
+ (id)changedTransformWithImpulseDuration:(double)a3;
+ (id)customCategoricalTransformerWithName:(id)a3 block:(id)a4;
+ (id)customCategoricalTransformerWithName:(id)a3 featureCount:(unint64_t)a4 transformation:(id)a5;
+ (id)customTransformerWithName:(id)a3 outputType:(unint64_t)a4 block:(id)a5;
+ (id)customTransformerWithName:(id)a3 outputType:(unint64_t)a4 featureCount:(unint64_t)a5 transformation:(id)a6;
+ (id)featureTransformerClasses;
+ (id)functionName;
+ (id)hashTransform;
+ (id)logTransformerWithBase:(id)a3;
+ (id)maskAndShiftTransformWithStartIndex:(unint64_t)a3 endIndex:(unint64_t)a4;
+ (id)maskTransformWithWidth:(unint64_t)a3;
+ (id)recentTransformerWithCount:(unint64_t)a3;
+ (id)roundTransformer;
- (BOOL)readFromURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (NSString)name;
- (REFeatureTransformer)init;
- (id)_invalidationQueue;
- (id)invalidationDelegate;
- (void)_invalidate;
- (void)_invalidationQueue_scheduleInvalidation:(id)a3;
- (void)_performAndScheduleTimer;
- (void)configureWithInvocation:(id)a3;
- (void)invalidateWithContext:(id)a3;
- (void)setInvalidationDelegate:(id)a3;
- (void)setName:(id)a3;
@end

@implementation REFeatureTransformer

+ (id)bucketTransformerWithCount:(unint64_t)a3 minValue:(id)a4 maxValue:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v13 = RECreateIntegerFeatureValueTaggedPointer(a3);
  uint64_t v14 = RECreateFeatureValueTaggedPointer(v7);
  uint64_t v15 = RECreateFeatureValueTaggedPointer(v8);
  v9 = +[RETransformerInvocation invocationWithArguments:&v13 count:3];
  for (uint64_t i = 0; i != 24; i += 8)
    REReleaseFeatureValueTaggedPointer(*(CFTypeRef *)((char *)&v13 + i));
  v11 = objc_alloc_init(_REBucketFeatureTransformer);
  -[_REBucketFeatureTransformer configureWithInvocation:](v11, "configureWithInvocation:", v9, v13, v14);

  return v11;
}

+ (id)maskTransformWithWidth:(unint64_t)a3
{
  v3 = [[_REWidthFeatureTransformer alloc] initWithWidth:a3 shift:0];
  return v3;
}

+ (id)hashTransform
{
  v2 = objc_alloc_init(_REHashFeatureTransformer);
  return v2;
}

- (REFeatureTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)REFeatureTransformer;
  v2 = [(REFeatureTransformer *)&v6 init];
  if (v2 && [(id)objc_opt_class() supportsInvalidation])
  {
    v3 = [[REPriorityQueue alloc] initWithComparator:&__block_literal_global_572];
    scheduledUpdates = v2->_scheduledUpdates;
    v2->_scheduledUpdates = v3;
  }
  return v2;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

+ (BOOL)supportsInvalidation
{
  return 0;
}

+ (BOOL)supportsPersistence
{
  return 0;
}

- (void)setInvalidationDelegate:(id)a3
{
  id obj = a3;
  if ([(id)objc_opt_class() supportsInvalidation]) {
    objc_storeWeak((id *)&self->_invalidationDelegate, obj);
  }
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  return 1;
}

+ (id)functionName
{
  return 0;
}

+ (id)featureTransformerClasses
{
  if (featureTransformerClasses_onceToken != -1) {
    dispatch_once(&featureTransformerClasses_onceToken, &__block_literal_global_549);
  }
  v2 = (void *)featureTransformerClasses_Classes;
  return v2;
}

void __49__REFeatureTransformer_featureTransformerClasses__block_invoke()
{
  v2[7] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:7];
  v1 = (void *)featureTransformerClasses_Classes;
  featureTransformerClasses_Classes = v0;
}

+ (id)bucketTransformerWithBitWidth:(unint64_t)a3
{
  char v3 = a3;
  v5 = +[REFeatureValue featureValueWithDouble:0.0];
  objc_super v6 = +[REFeatureValue featureValueWithDouble:1.0];
  id v7 = [a1 bucketTransformerWithCount:1 << v3 minValue:v5 maxValue:v6];

  return v7;
}

+ (id)logTransformerWithBase:(id)a3
{
  id v3 = a3;
  v4 = [[_RELogFeatureTransformer alloc] initWithBase:v3];

  return v4;
}

+ (id)binaryTransformerWithThreshold:(id)a3
{
  v6[1] = *(CFTypeRef *)MEMORY[0x263EF8340];
  v6[0] = (CFTypeRef)RECreateFeatureValueTaggedPointer(a3);
  id v3 = +[RETransformerInvocation invocationWithArguments:v6 count:1];
  REReleaseFeatureValueTaggedPointer(v6[0]);
  v4 = objc_alloc_init(_REBinaryFeatureTransformer);
  [(_REBinaryFeatureTransformer *)v4 configureWithInvocation:v3];

  return v4;
}

+ (id)roundTransformer
{
  v2 = objc_alloc_init(_RERoundFeatureTransformer);
  return v2;
}

+ (id)changedTransform
{
  return (id)[a1 changedTransformWithImpulseDuration:900.0];
}

+ (id)changedTransformWithImpulseDuration:(double)a3
{
  v6[1] = *(CFTypeRef *)MEMORY[0x263EF8340];
  v6[0] = (CFTypeRef)RECreateDoubleFeatureValueTaggedPointer();
  id v3 = +[RETransformerInvocation invocationWithArguments:v6 count:1];
  REReleaseFeatureValueTaggedPointer(v6[0]);
  v4 = objc_alloc_init(_REChangeFeatureTransformer);
  [(_REChangeFeatureTransformer *)v4 configureWithInvocation:v3];

  return v4;
}

+ (id)maskAndShiftTransformWithStartIndex:(unint64_t)a3 endIndex:(unint64_t)a4
{
  unint64_t v5 = a4 - a3;
  if (a4 < a3) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF4A0], @"End index %lu must come after start index %lu", a4, a3);
  }
  objc_super v6 = [[_REWidthFeatureTransformer alloc] initWithWidth:v5 + 1 shift:a3];
  return v6;
}

+ (id)recentTransformerWithCount:(unint64_t)a3
{
  v6[1] = *(CFTypeRef *)MEMORY[0x263EF8340];
  v6[0] = (CFTypeRef)RECreateIntegerFeatureValueTaggedPointer(a3);
  id v3 = +[RETransformerInvocation invocationWithArguments:v6 count:1];
  REReleaseFeatureValueTaggedPointer(v6[0]);
  v4 = objc_alloc_init(_RERecentFeatureTransformer);
  [(_RERecentFeatureTransformer *)v4 configureWithInvocation:v3];

  return v4;
}

+ (id)customCategoricalTransformerWithName:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__REFeatureTransformer_customCategoricalTransformerWithName_block___block_invoke;
    v10[3] = &unk_2644BEEC0;
    id v11 = v6;
    id v8 = [a1 customTransformerWithName:a3 outputType:1 block:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

REFeatureValue *__67__REFeatureTransformer_customCategoricalTransformerWithName_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return +[REFeatureValue featureValueWithInt64:v1];
}

+ (id)customCategoricalTransformerWithName:(id)a3 featureCount:(unint64_t)a4 transformation:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __89__REFeatureTransformer_customCategoricalTransformerWithName_featureCount_transformation___block_invoke;
    v12[3] = &unk_2644BEEE8;
    id v13 = v8;
    v10 = [a1 customTransformerWithName:a3 outputType:1 featureCount:a4 transformation:v12];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

REFeatureValue *__89__REFeatureTransformer_customCategoricalTransformerWithName_featureCount_transformation___block_invoke(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return +[REFeatureValue featureValueWithInt64:v1];
}

+ (id)customTransformerWithName:(id)a3 outputType:(unint64_t)a4 block:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__REFeatureTransformer_customTransformerWithName_outputType_block___block_invoke;
    v12[3] = &unk_2644BEEE8;
    id v13 = v8;
    v10 = [a1 customTransformerWithName:a3 outputType:a4 featureCount:1 transformation:v12];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __67__REFeatureTransformer_customTransformerWithName_outputType_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

+ (id)customTransformerWithName:(id)a3 outputType:(unint64_t)a4 featureCount:(unint64_t)a5 transformation:(id)a6
{
  if (a6)
  {
    id v9 = a6;
    id v10 = a3;
    id v11 = [[_REBlockFeatureTransformer alloc] initWithFeatureCount:a5 outputFeatureType:a4 transformation:v9];

    [(REFeatureTransformer *)v11 setName:v10];
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

uint64_t __28__REFeatureTransformer_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)configureWithInvocation:(id)a3
{
  if ([a3 numberOfArguments])
  {
    id v9 = (void *)*MEMORY[0x263EFF4A0];
    RERaiseInternalException(v9, @"Expected no arguments with invoaction", v3, v4, v5, v6, v7, v8, v11);
  }
}

- (id)_invalidationQueue
{
  if (_invalidationQueue_onceToken != -1) {
    dispatch_once(&_invalidationQueue_onceToken, &__block_literal_global_577);
  }
  uint64_t v2 = (void *)_invalidationQueue_Queue;
  return v2;
}

void __42__REFeatureTransformer__invalidationQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.REFeatureTransformer.Invalidation", v2);
  uint64_t v1 = (void *)_invalidationQueue_Queue;
  _invalidationQueue_Queue = (uint64_t)v0;
}

- (id)invalidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invalidationDelegate);
  return WeakRetained;
}

- (void)invalidateWithContext:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() supportsInvalidation])
  {
    uint64_t v5 = [(REFeatureTransformer *)self _invalidationQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    CFTypeRef v6[2] = __46__REFeatureTransformer_invalidateWithContext___block_invoke;
    v6[3] = &unk_2644BC688;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_async(v5, v6);
  }
}

void __46__REFeatureTransformer_invalidateWithContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) invalidationDate];
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = (id)v2;
  if (v2) {
    objc_msgSend(v3, "_invalidationQueue_scheduleInvalidation:", v2);
  }
  else {
    [v3 _invalidate];
  }
}

- (void)_invalidationQueue_scheduleInvalidation:(id)a3
{
  id v4 = a3;
  if (!-[REPriorityQueue containsObject:](self->_scheduledUpdates, "containsObject:")) {
    [(REPriorityQueue *)self->_scheduledUpdates insertObject:v4];
  }
  [(REFeatureTransformer *)self _performAndScheduleTimer];
}

- (void)_performAndScheduleTimer
{
  uint64_t v3 = [(REFeatureTransformer *)self _invalidationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = [(REPriorityQueue *)self->_scheduledUpdates minimumObject];
  if (v5)
  {
    do
    {
      if ([v5 compare:v4] == 1) {
        break;
      }
      [(REFeatureTransformer *)self _invalidate];
      [(REPriorityQueue *)self->_scheduledUpdates removeMinimumObject];
      uint64_t v6 = [(REPriorityQueue *)self->_scheduledUpdates minimumObject];

      uint64_t v5 = (void *)v6;
    }
    while (v6);
  }
  if ([(REPriorityQueue *)self->_scheduledUpdates count])
  {
    id v7 = [(REPriorityQueue *)self->_scheduledUpdates minimumObject];
    objc_initWeak(&location, self);
    uint64_t v8 = [(REFeatureTransformer *)self _invalidationQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__REFeatureTransformer__performAndScheduleTimer__block_invoke;
    v12[3] = &unk_2644BC700;
    objc_copyWeak(&v13, &location);
    id v9 = +[REUpNextTimer timerWithFireDate:v7 queue:v8 block:v12];
    updateTimer = self->_updateTimer;
    self->_updateTimer = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    [(REUpNextTimer *)self->_updateTimer invalidate];
    uint64_t v11 = self->_updateTimer;
    self->_updateTimer = 0;
  }
}

void __48__REFeatureTransformer__performAndScheduleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performAndScheduleTimer];
}

- (void)_invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invalidationDelegate);
  [WeakRetained featureTransformerDidInvalidate:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_invalidationDelegate);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_scheduledUpdates, 0);
}

@end