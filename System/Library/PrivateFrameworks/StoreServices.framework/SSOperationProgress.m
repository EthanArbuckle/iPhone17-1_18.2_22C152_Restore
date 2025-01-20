@interface SSOperationProgress
- (BOOL)canPause;
- (NSString)description;
- (SSOperationProgress)init;
- (SSOperationProgress)initWithXPCEncoding:(id)a3;
- (double)changeRate;
- (double)estimatedTimeRemaining;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)currentValue;
- (int64_t)maxValue;
- (int64_t)normalizedCurrentValue;
- (int64_t)normalizedMaxValue;
- (int64_t)operationType;
- (int64_t)units;
- (void)_updateStatisticsFromSnapshots;
- (void)dealloc;
- (void)resetSnapshots;
- (void)setCanPause:(BOOL)a3;
- (void)setChangeRate:(double)a3;
- (void)setCurrentValue:(int64_t)a3;
- (void)setEstimatedTimeRemaining:(double)a3;
- (void)setMaxValue:(int64_t)a3;
- (void)setNormalizedCurrentValue:(int64_t)a3;
- (void)setNormalizedMaxValue:(int64_t)a3;
- (void)setOperationType:(int64_t)a3;
- (void)setUnits:(int64_t)a3;
- (void)snapshot;
@end

@implementation SSOperationProgress

- (SSOperationProgress)init
{
  v4.receiver = self;
  v4.super_class = (Class)SSOperationProgress;
  v2 = [(SSOperationProgress *)&v4 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSOperationProgress", 0);
    v2->_estimatedTimeRemaining = -1.0;
    v2->_changeRate = -1.0;
    v2->_normalizedCurrentValue = -1;
    v2->_normalizedMaxValue = -1;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)SSOperationProgress;
  [(SSOperationProgress *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SSOperationProgress_copyWithZone___block_invoke;
  v7[3] = &unk_1E5BA7448;
  v7[4] = v4;
  v7[5] = self;
  dispatch_sync(dispatchQueue, v7);
  return v4;
}

double __36__SSOperationProgress_copyWithZone___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(*(void *)(a1 + 40) + 8);
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(*(void *)(a1 + 40) + 16);
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(*(void *)(a1 + 40) + 24);
  double result = *(double *)(*(void *)(a1 + 40) + 40);
  *(double *)(*(void *)(a1 + 32) + 40) = result;
  *(void *)(*(void *)(a1 + 32) + 48) = *(void *)(*(void *)(a1 + 40) + 48);
  *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(*(void *)(a1 + 40) + 56);
  *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(*(void *)(a1 + 40) + 64);
  *(void *)(*(void *)(a1 + 32) + 72) = *(void *)(*(void *)(a1 + 40) + 72);
  *(void *)(*(void *)(a1 + 32) + 96) = *(void *)(*(void *)(a1 + 40) + 96);
  return result;
}

- (BOOL)canPause
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SSOperationProgress_canPause__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__SSOperationProgress_canPause__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (double)changeRate
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SSOperationProgress_changeRate__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __33__SSOperationProgress_changeRate__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 16);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)currentValue
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SSOperationProgress_currentValue__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__SSOperationProgress_currentValue__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (double)estimatedTimeRemaining
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  unint64_t v9 = 0xBFF0000000000000;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SSOperationProgress_estimatedTimeRemaining__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __45__SSOperationProgress_estimatedTimeRemaining__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 40);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)maxValue
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SSOperationProgress_maxValue__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__SSOperationProgress_maxValue__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (int64_t)normalizedCurrentValue
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SSOperationProgress_normalizedCurrentValue__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__SSOperationProgress_normalizedCurrentValue__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 56);
  if (v2 < 0) {
    uint64_t v2 = *(void *)(v1 + 24);
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int64_t)normalizedMaxValue
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SSOperationProgress_normalizedMaxValue__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__SSOperationProgress_normalizedMaxValue__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 64);
  if (v2 < 0) {
    uint64_t v2 = *(void *)(v1 + 48);
  }
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int64_t)operationType
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSOperationProgress_operationType__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__SSOperationProgress_operationType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)resetSnapshots
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SSOperationProgress_resetSnapshots__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __37__SSOperationProgress_resetSnapshots__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 88);
  return [v2 removeAllObjects];
}

- (void)setCanPause:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__SSOperationProgress_setCanPause___block_invoke;
  v4[3] = &unk_1E5BA8488;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __35__SSOperationProgress_setCanPause___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setChangeRate:(double)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SSOperationProgress_setChangeRate___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

double __37__SSOperationProgress_setChangeRate___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

- (void)setCurrentValue:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSOperationProgress_setCurrentValue___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __39__SSOperationProgress_setCurrentValue___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) = *(void *)(result + 40);
  return result;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SSOperationProgress_setEstimatedTimeRemaining___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

double __49__SSOperationProgress_setEstimatedTimeRemaining___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

- (void)setMaxValue:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__SSOperationProgress_setMaxValue___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __35__SSOperationProgress_setMaxValue___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  return result;
}

- (void)setNormalizedCurrentValue:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SSOperationProgress_setNormalizedCurrentValue___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __49__SSOperationProgress_setNormalizedCurrentValue___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = *(void *)(result + 40);
  return result;
}

- (void)setNormalizedMaxValue:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__SSOperationProgress_setNormalizedMaxValue___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __45__SSOperationProgress_setNormalizedMaxValue___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64) = *(void *)(result + 40);
  return result;
}

- (void)setOperationType:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SSOperationProgress_setOperationType___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __40__SSOperationProgress_setOperationType___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72) = *(void *)(result + 40);
  return result;
}

- (void)setUnits:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__SSOperationProgress_setUnits___block_invoke;
  v4[3] = &unk_1E5BA84B0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __32__SSOperationProgress_setUnits___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 96) = *(void *)(result + 40);
  return result;
}

- (void)snapshot
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SSOperationProgress_snapshot__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __31__SSOperationProgress_snapshot__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 80) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(*(void *)(a1 + 32) + 88) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  }
  if ((unint64_t)[v2 count] >= 0x78)
  {
    [*(id *)(*(void *)(a1 + 32) + 80) removeObjectAtIndex:0];
    [*(id *)(*(void *)(a1 + 32) + 88) removeObjectAtIndex:0];
  }
  int64_t v3 = (void *)[objc_alloc(NSNumber) initWithDouble:CFAbsoluteTimeGetCurrent()];
  objc_super v4 = (void *)[objc_alloc(NSNumber) initWithLongLong:*(void *)(*(void *)(a1 + 32) + 24)];
  [*(id *)(*(void *)(a1 + 32) + 80) addObject:v3];
  [*(id *)(*(void *)(a1 + 32) + 88) addObject:v4];

  BOOL v5 = *(void **)(a1 + 32);
  return [v5 _updateStatisticsFromSnapshots];
}

- (int64_t)units
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__SSOperationProgress_units__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__SSOperationProgress_units__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 96);
  return result;
}

- (NSString)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSOperationProgress_description__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SSOperationProgress_description__block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SSOperationProgress;
  uint64_t result = [v2 initWithFormat:@"%@: %lld / %lld @ %.3f (%.2f seconds)", objc_msgSendSuper2(&v4, sel_description), *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 48), *(void *)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(a1 + 32) + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "0", self->_canPause);
  xpc_dictionary_set_double(v3, "1", self->_changeRate);
  xpc_dictionary_set_int64(v3, "2", self->_currentValue);
  xpc_dictionary_set_double(v3, "3", self->_estimatedTimeRemaining);
  xpc_dictionary_set_int64(v3, "4", self->_maxValue);
  xpc_dictionary_set_int64(v3, "5", self->_normalizedCurrentValue);
  xpc_dictionary_set_int64(v3, "6", self->_normalizedMaxValue);
  xpc_dictionary_set_int64(v3, "7", self->_operationType);
  xpc_dictionary_set_int64(v3, "8", self->_units);
  return v3;
}

- (SSOperationProgress)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSOperationProgress;
    BOOL v5 = [(SSOperationProgress *)&v7 init];
    if (v5)
    {
      v5->_canPause = xpc_dictionary_get_BOOL(a3, "0");
      v5->_changeRate = xpc_dictionary_get_double(a3, "1");
      v5->_currentValue = xpc_dictionary_get_int64(a3, "2");
      v5->_estimatedTimeRemaining = xpc_dictionary_get_double(a3, "3");
      v5->_maxValue = xpc_dictionary_get_int64(a3, "4");
      v5->_normalizedCurrentValue = xpc_dictionary_get_int64(a3, "5");
      v5->_normalizedMaxValue = xpc_dictionary_get_int64(a3, "6");
      v5->_operationType = xpc_dictionary_get_int64(a3, "7");
      v5->_units = xpc_dictionary_get_int64(a3, "8");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)_updateStatisticsFromSnapshots
{
  unint64_t v3 = [(NSMutableArray *)self->_snapshotTimes count];
  double v4 = -1.0;
  if (v3 < 6)
  {
    double v13 = -1.0;
  }
  else
  {
    unint64_t v5 = v3;
    double v6 = 0.0;
    for (uint64_t i = 1; i != v5; ++i)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotTimes, "objectAtIndex:", i), "doubleValue");
      double v9 = v8;
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotTimes, "objectAtIndex:", i - 1), "doubleValue");
      double v11 = v9 - v10;
      uint64_t v12 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotValues, "objectAtIndex:", i), "longLongValue");
      double v6 = v6
         + (double)(v12
                  - objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotValues, "objectAtIndex:", i - 1), "longLongValue"))/ v11;
    }
    double v13 = v6 / (double)v5;
    if (v13 > 0.00000011920929)
    {
      int64_t v14 = self->_maxValue - self->_currentValue;
      if ((v14 & 0x8000000000000000) == 0) {
        double v4 = (double)v14 / v13;
      }
    }
  }
  self->_changeRate = v13;
  self->_estimatedTimeRemaining = v4;
}

@end