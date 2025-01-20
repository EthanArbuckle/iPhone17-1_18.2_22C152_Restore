@interface PCWeakPointerValue
+ (id)arrayFromWeakPointerValueArray:(id)a3;
+ (id)setFromWeakPointerValueSet:(id)a3;
+ (id)valueWithNonretainedObject:(id)a3;
+ (id)valueWithPointer:(void *)a3;
+ (id)weakPointerValueArrayFromArray:(id)a3;
+ (id)weakPointerValueSetFromSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PCWeakPointerValue)initWithNonretainedObject:(id)a3;
- (PCWeakPointerValue)initWithPointer:(void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nonretainedObjectValue;
- (unint64_t)hash;
- (void)dealloc;
- (void)pointerValue;
@end

@implementation PCWeakPointerValue

- (PCWeakPointerValue)initWithNonretainedObject:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PCWeakPointerValue;
  v4 = [(PCWeakPointerValue *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_pointerValue = a3;
    objc_storeWeak(&v4->_zeroingWeakValue, a3);
    v5->_hasZeroingWeakReference = 1;
  }
  return v5;
}

- (PCWeakPointerValue)initWithPointer:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PCWeakPointerValue;
  result = [(PCWeakPointerValue *)&v5 init];
  if (result)
  {
    result->_pointerValue = a3;
    result->_zeroingWeakValue = 0;
  }
  return result;
}

- (void)dealloc
{
  if (self->_hasZeroingWeakReference) {
    objc_storeWeak(&self->_zeroingWeakValue, 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)PCWeakPointerValue;
  [(PCWeakPointerValue *)&v3 dealloc];
}

+ (id)valueWithNonretainedObject:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNonretainedObject:a3];

  return v3;
}

+ (id)valueWithPointer:(void *)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPointer:a3];

  return v3;
}

- (id)nonretainedObjectValue
{
  return objc_loadWeak(&self->_zeroingWeakValue);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class();
  return v5 == objc_opt_class() && self->_pointerValue == (id)*((void *)a3 + 1);
}

- (unint64_t)hash
{
  return (unint64_t)self->_pointerValue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PCWeakPointerValue allocWithZone:a3] initWithNonretainedObject:[(PCWeakPointerValue *)self nonretainedObjectValue]];
  *((void *)result + 1) = self->_pointerValue;
  return result;
}

+ (id)weakPointerValueArrayFromArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v4, "addObject:", +[PCWeakPointerValue valueWithNonretainedObject:](PCWeakPointerValue, "valueWithNonretainedObject:", *(void *)(*((void *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

+ (id)arrayFromWeakPointerValueArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) nonretainedObjectValue];
        if (v9) {
          [v4 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

+ (id)weakPointerValueSetFromSet:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v4, "addObject:", +[PCWeakPointerValue valueWithNonretainedObject:](PCWeakPointerValue, "valueWithNonretainedObject:", *(void *)(*((void *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

+ (id)setFromWeakPointerValueSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) nonretainedObjectValue];
        if (v9) {
          [v4 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)pointerValue
{
  return self->_pointerValue;
}

@end