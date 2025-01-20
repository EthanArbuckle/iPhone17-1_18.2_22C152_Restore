@interface RETaggedFeatureValueArray
- (BOOL)isEqual:(id)a3;
- (RETaggedFeatureValueArray)init;
- (RETaggedFeatureValueArray)initWithCapacity:(unint64_t)a3;
- (RETaggedFeatureValueArray)initWithFeatureValues:(id)a3;
- (RETaggedFeatureValueArray)initWithValues:(unint64_t *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_locked_count;
- (unint64_t)_locked_featureValueAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)featureValueAtIndex:(unint64_t)a3;
- (unint64_t)firstFeatureValue;
- (unint64_t)hash;
- (unint64_t)lastFeatureValue;
- (void)addFeatureValue:(unint64_t)a3;
- (void)dealloc;
- (void)enumerateFeatureValuesUsingBlock:(id)a3;
- (void)insertFeatureValue:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)removeAllFeatureValues;
- (void)removeFeatureValueAtIndex:(unint64_t)a3;
- (void)replaceFeatureValueAtIndex:(unint64_t)a3 withValue:(unint64_t)a4;
@end

@implementation RETaggedFeatureValueArray

- (RETaggedFeatureValueArray)init
{
  return [(RETaggedFeatureValueArray *)self initWithCapacity:0];
}

- (RETaggedFeatureValueArray)initWithCapacity:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RETaggedFeatureValueArray;
  v4 = [(RETaggedFeatureValueArray *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_array = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, &kTaggedFeatureValueCallbacks);
  }
  return v5;
}

- (RETaggedFeatureValueArray)initWithFeatureValues:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = -[RETaggedFeatureValueArray initWithCapacity:](self, "initWithCapacity:", [v4 count]);
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (const void *)RECreateFeatureValueTaggedPointer(*(void **)(*((void *)&v13 + 1) + 8 * v10));
          -[RETaggedFeatureValueArray addFeatureValue:](v5, "addFeatureValue:", v11, (void)v13);
          REReleaseFeatureValueTaggedPointer(v11);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (RETaggedFeatureValueArray)initWithValues:(unint64_t *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v6 = [(RETaggedFeatureValueArray *)self initWithCapacity:a4];
  if (v6 && v4)
  {
    do
    {
      uint64_t v7 = *a3++;
      [(RETaggedFeatureValueArray *)v6 addFeatureValue:v7];
      --v4;
    }
    while (v4);
  }
  return v6;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFRelease(self->_array);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)RETaggedFeatureValueArray;
  [(RETaggedFeatureValueArray *)&v4 dealloc];
}

- (unint64_t)hash
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFHashCode v4 = CFHash(self->_array);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CFHashCode v4 = (RETaggedFeatureValueArray *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      p_lock = &self->_lock;
      id v6 = v4;
      os_unfair_lock_lock(&self->_lock);
      array = self->_array;
      uint64_t v8 = v6->_array;

      BOOL v9 = CFEqual(array, v8) != 0;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(RETaggedFeatureValueArray *)self _locked_count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)featureValueAtIndex:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v6 = [(RETaggedFeatureValueArray *)self _locked_featureValueAtIndex:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)addFeatureValue:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArrayAppendValue(self->_array, (const void *)a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)insertFeatureValue:(unint64_t)a3 atIndex:(unint64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArrayInsertValueAtIndex(self->_array, a4, (const void *)a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeFeatureValueAtIndex:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArrayRemoveValueAtIndex(self->_array, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllFeatureValues
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArrayRemoveAllValues(self->_array);
  os_unfair_lock_unlock(p_lock);
}

- (void)replaceFeatureValueAtIndex:(unint64_t)a3 withValue:(unint64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArraySetValueAtIndex(self->_array, a3, (const void *)a4);
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)firstFeatureValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(RETaggedFeatureValueArray *)self _locked_count]) {
    unint64_t v4 = [(RETaggedFeatureValueArray *)self _locked_featureValueAtIndex:0];
  }
  else {
    unint64_t v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)lastFeatureValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(RETaggedFeatureValueArray *)self _locked_count];
  if (v4) {
    unint64_t v5 = [(RETaggedFeatureValueArray *)self _locked_featureValueAtIndex:v4 - 1];
  }
  else {
    unint64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)enumerateFeatureValuesUsingBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6[1] = 0;
  v6[0] = (id)MEMORY[0x223C31700](v4);
  array = self->_array;
  v7.length = [(RETaggedFeatureValueArray *)self _locked_count];
  v7.location = 0;
  CFArrayApplyFunction(array, v7, (CFArrayApplierFunction)kTaggedFeatureCFApplier, v6);
  os_unfair_lock_unlock(&self->_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__RETaggedFeatureValueArray_copyWithZone___block_invoke;
  v7[3] = &unk_2644BE7E0;
  id v5 = v4;
  id v8 = v5;
  [(RETaggedFeatureValueArray *)self enumerateFeatureValuesUsingBlock:v7];

  return v5;
}

uint64_t __42__RETaggedFeatureValueArray_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addFeatureValue:a2];
}

- (unint64_t)_locked_count
{
  return CFArrayGetCount(self->_array);
}

- (unint64_t)_locked_featureValueAtIndex:(unint64_t)a3
{
  return (unint64_t)CFArrayGetValueAtIndex(self->_array, a3);
}

@end