@interface FCMockFetchedValueDescriptor
- (BOOL)isValue:(id)a3 equalToValue:(id)a4;
- (FCMockFetchedValueDescriptor)init;
- (FCMockFetchedValueDescriptor)initWithInputManagers:(id)a3;
- (NFCopying)fastCachedValue;
- (NFCopying)fetchValue;
- (NSArray)myInputManagers;
- (NSError)fetchError;
- (id)valueEqualityTest;
- (id)willFetchBlock;
- (int64_t)lastFetchQualityOfService;
- (unint64_t)lastFetchCachePolicy;
- (unint64_t)willFetchCount;
- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)markDirty;
- (void)setFastCachedValue:(id)a3;
- (void)setFetchError:(id)a3;
- (void)setFetchValue:(id)a3;
- (void)setLastFetchCachePolicy:(unint64_t)a3;
- (void)setLastFetchQualityOfService:(int64_t)a3;
- (void)setValueEqualityTest:(id)a3;
- (void)setWillFetchBlock:(id)a3;
- (void)setWillFetchCount:(unint64_t)a3;
@end

@implementation FCMockFetchedValueDescriptor

- (FCMockFetchedValueDescriptor)init
{
  return [(FCMockFetchedValueDescriptor *)self initWithInputManagers:MEMORY[0x1E4F1CBF0]];
}

- (FCMockFetchedValueDescriptor)initWithInputManagers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "inputManagers");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCMockFetchedValueDescriptor initWithInputManagers:]";
    __int16 v13 = 2080;
    v14 = "FCMockFetchedValueDescriptor.m";
    __int16 v15 = 1024;
    int v16 = 30;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCMockFetchedValueDescriptor;
  v5 = [(FCFetchedValueDescriptor *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    myInputManagers = v5->_myInputManagers;
    v5->_myInputManagers = (NSArray *)v6;
  }
  return v5;
}

- (void)markDirty
{
  id v3 = [(FCFetchedValueDescriptor *)self observer];
  [v3 fetchedValueDescriptorValueIsDirty:self];
}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  v8 = (void (**)(id, id, void *))a5;
  v9 = [(FCMockFetchedValueDescriptor *)self willFetchBlock];

  if (v9)
  {
    objc_super v10 = [(FCMockFetchedValueDescriptor *)self willFetchBlock];
    v10[2]();
  }
  [(FCMockFetchedValueDescriptor *)self setWillFetchCount:[(FCMockFetchedValueDescriptor *)self willFetchCount] + 1];
  id v12 = [(FCMockFetchedValueDescriptor *)self fetchValue];
  v11 = [(FCMockFetchedValueDescriptor *)self fetchError];
  [(FCMockFetchedValueDescriptor *)self setLastFetchCachePolicy:a3];
  [(FCMockFetchedValueDescriptor *)self setLastFetchQualityOfService:a4];
  v8[2](v8, v12, v11);
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(FCMockFetchedValueDescriptor *)self valueEqualityTest];
  char v9 = ((uint64_t (**)(void, id, id))v8)[2](v8, v7, v6);

  return v9;
}

- (id)willFetchBlock
{
  return self->_willFetchBlock;
}

- (void)setWillFetchBlock:(id)a3
{
}

- (NFCopying)fetchValue
{
  return self->_fetchValue;
}

- (void)setFetchValue:(id)a3
{
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
}

- (NFCopying)fastCachedValue
{
  return self->_fastCachedValue;
}

- (void)setFastCachedValue:(id)a3
{
}

- (id)valueEqualityTest
{
  return self->_valueEqualityTest;
}

- (void)setValueEqualityTest:(id)a3
{
}

- (unint64_t)willFetchCount
{
  return self->_willFetchCount;
}

- (void)setWillFetchCount:(unint64_t)a3
{
  self->_willFetchCount = a3;
}

- (int64_t)lastFetchQualityOfService
{
  return self->_lastFetchQualityOfService;
}

- (void)setLastFetchQualityOfService:(int64_t)a3
{
  self->_lastFetchQualityOfService = a3;
}

- (unint64_t)lastFetchCachePolicy
{
  return self->_lastFetchCachePolicy;
}

- (void)setLastFetchCachePolicy:(unint64_t)a3
{
  self->_lastFetchCachePolicy = a3;
}

- (NSArray)myInputManagers
{
  return self->_myInputManagers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myInputManagers, 0);
  objc_storeStrong(&self->_valueEqualityTest, 0);
  objc_storeStrong((id *)&self->_fastCachedValue, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchValue, 0);
  objc_storeStrong(&self->_willFetchBlock, 0);
}

@end