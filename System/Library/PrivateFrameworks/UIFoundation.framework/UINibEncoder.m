@interface UINibEncoder
+ (BOOL)archiveRootObject:(id)a3 toFile:(id)a4;
+ (id)archivedDataWithRootObject:(id)a3;
- (BOOL)allowsKeyedCoding;
- (BOOL)isUnorderedCollectionSortingEnabled;
- (BOOL)object:(id)a3 encodesAsMemberAndWithCoderOfClass:(Class)a4;
- (BOOL)object:(id)a3 encodesWithCoderFromClass:(Class)a4;
- (BOOL)previouslyCodedObject:(id)a3;
- (BOOL)shouldUniqueObjectByValue:(id)a3;
- (Class)encodedClassForObject:(id)a3;
- (id)assignObjectIDForObject:(id)a3;
- (id)delegate;
- (id)encodedClassNameForClass:(Class)a3;
- (id)encodedClassNameForObject:(id)a3;
- (id)initForWritingWithMutableData:(id)a3;
- (id)nextGenericKey;
- (id)objectIDForObject:(id)a3;
- (id)replacementObjectForObject:(id)a3 forKey:(id)a4;
- (int64_t)versionForClassName:(id)a3;
- (unsigned)systemVersion;
- (void)appendValue:(id)a3;
- (void)dealloc;
- (void)encodeArrayOfDoubles:(double *)a3 count:(int64_t)a4 forKey:(id)a5;
- (void)encodeArrayOfFloats:(float *)a3 count:(int64_t)a4 forKey:(id)a5;
- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBycopyObject:(id)a3;
- (void)encodeByrefObject:(id)a3;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)encodeCGAffineTransform:(CGAffineTransform *)a3 forKey:(id)a4;
- (void)encodeCGPoint:(CGPoint)a3 forKey:(id)a4;
- (void)encodeCGRect:(CGRect)a3 forKey:(id)a4;
- (void)encodeCGSize:(CGSize)a3 forKey:(id)a4;
- (void)encodeConditionalObject:(id)a3;
- (void)encodeConditionalObject:(id)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeRootObject:(id)a3;
- (void)encodeUIEdgeInsets:(UIEdgeInsets)a3 forKey:(id)a4;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
- (void)encodeValuesOfObjCTypes:(const char *)a3;
- (void)finishEncoding;
- (void)serializeArray:(id)a3;
- (void)serializeDictionary:(id)a3;
- (void)serializeObject:(id)a3;
- (void)serializeSet:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUnorderedCollectionSortingEnabled:(BOOL)a3;
@end

@implementation UINibEncoder

- (id)initForWritingWithMutableData:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UINibEncoder;
  v4 = [(UINibEncoder *)&v12 init];
  if (v4)
  {
    v4->data = (NSMutableData *)a3;
    memset(&keyCallBacks, 0, sizeof(keyCallBacks));
    UIRetainedIdentityKeyDictionaryCallbacks((uint64_t)&keyCallBacks);
    memset(&valueCallBacks, 0, sizeof(valueCallBacks));
    UIRetainedIdentityValueDictionaryCallbacks((uint64_t)&valueCallBacks);
    v4->objectsToObjectIDs = CFDictionaryCreateMutable(0, 0, &keyCallBacks, MEMORY[0x1E4F1D540]);
    v4->objectIDsToObjects = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], &valueCallBacks);
    v4->replacements = CFDictionaryCreateMutable(0, 0, &keyCallBacks, &valueCallBacks);
    v4->values = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    memset(&callBacks, 0, sizeof(callBacks));
    UIRetainedIdentitySetCallbacks((uint64_t)&callBacks);
    v4->encodedObjects = CFSetCreateMutable(0, 0, &callBacks);
    memset(&v8, 0, sizeof(v8));
    UIRetainedIdentityArrayCallbacks((uint64_t)&v8);
    v4->encodedOrderedObjects = CFArrayCreateMutable(0, 0, &v8);
    memset(&v7, 0, sizeof(v7));
    UIRetainedValueUniquingSetCallbacks((uint64_t)&v7);
    v4->objectsUniquedByValue = CFSetCreateMutable(0, 0, &v7);
    v4->objectsReplacedWithNil = CFSetCreateMutable(0, 0, &callBacks);
    v4->_unorderedCollectionSortingEnabled = 1;
    id v5 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    CFSetAddValue(v4->encodedObjects, v5);
    CFArrayAppendValue(v4->encodedOrderedObjects, v5);
    v4->recursiveState.currentObjectID = UINibArchiveIndexFromNumber([(UINibEncoder *)v4 assignObjectIDForObject:v5]);
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->objectsToObjectIDs);
  CFRelease(self->objectIDsToObjects);
  CFRelease(self->values);
  CFRelease(self->replacements);
  CFRelease(self->encodedObjects);
  CFRelease(self->encodedOrderedObjects);
  CFRelease(self->objectsReplacedWithNil);

  CFRelease(self->objectsUniquedByValue);
  v3.receiver = self;
  v3.super_class = (Class)UINibEncoder;
  [(UINibEncoder *)&v3 dealloc];
}

- (id)objectIDForObject:(id)a3
{
  return (id)CFDictionaryGetValue(self->objectsToObjectIDs, a3);
}

- (id)assignObjectIDForObject:(id)a3
{
  id v5 = (const void *)[NSNumber numberWithLongLong:self->nextObjectID];
  CFDictionarySetValue(self->objectsToObjectIDs, a3, v5);
  CFDictionarySetValue(self->objectIDsToObjects, v5, a3);
  ++self->nextObjectID;
  return (id)v5;
}

- (BOOL)previouslyCodedObject:(id)a3
{
  return [(UINibEncoder *)self objectIDForObject:a3] != 0;
}

- (void)appendValue:(id)a3
{
}

- (Class)encodedClassForObject:(id)a3
{
  Class result = (Class)[a3 classForKeyedArchiver];
  if (!result)
  {
    return (Class)objc_opt_class();
  }
  return result;
}

- (id)encodedClassNameForClass:(Class)a3
{
  return NSStringFromClass(a3);
}

- (id)encodedClassNameForObject:(id)a3
{
  v4 = [(UINibEncoder *)self encodedClassForObject:a3];

  return [(UINibEncoder *)self encodedClassNameForClass:v4];
}

- (BOOL)object:(id)a3 encodesWithCoderFromClass:(Class)a4
{
  uint64_t v5 = [(id)objc_opt_class() instanceMethodForSelector:sel_encodeWithCoder_];
  return v5 == [(objc_class *)a4 instanceMethodForSelector:sel_encodeWithCoder_];
}

- (BOOL)object:(id)a3 encodesAsMemberAndWithCoderOfClass:(Class)a4
{
  if ((Class)[a3 classForKeyedArchiver] != a4) {
    return 0;
  }

  return [(UINibEncoder *)self object:a3 encodesWithCoderFromClass:a4];
}

- (BOOL)shouldUniqueObjectByValue:(id)a3
{
  if ([(UINibEncoder *)self object:a3 encodesAsMemberAndWithCoderOfClass:objc_opt_class()])
  {
    return 1;
  }
  uint64_t v6 = objc_opt_class();

  return [(UINibEncoder *)self object:a3 encodesAsMemberAndWithCoderOfClass:v6];
}

- (id)replacementObjectForObject:(id)a3 forKey:(id)a4
{
  if (!CFSetContainsValue(self->objectsReplacedWithNil, a3) && !CFDictionaryContainsKey(self->replacements, a3))
  {
    if ([(UINibEncoder *)self objectIDForObject:a3]) {
      return a3;
    }
    if ([(UINibEncoder *)self shouldUniqueObjectByValue:a3])
    {
      Value = CFSetGetValue(self->objectsUniquedByValue, a3);
      if (Value) {
        goto LABEL_12;
      }
      CFSetAddValue(self->objectsUniquedByValue, a3);
    }
    Value = (const void *)[a3 replacementObjectForCoder:self];
    if (!Value)
    {
LABEL_19:
      CFSetAddValue(self->objectsReplacedWithNil, a3);
      return 0;
    }
LABEL_12:
    if (!self->delegate
      || ((char v10 = objc_opt_respondsToSelector(),
           objectIDsToObjects = self->objectIDsToObjects,
           objc_super v12 = (const void *)UINumberWithNibArchiveIndex(self->recursiveState.currentObjectID),
           v13 = CFDictionaryGetValue(objectIDsToObjects, v12),
           id delegate = self->delegate,
           (v10 & 1) == 0)
        ? (uint64_t v15 = objc_msgSend(delegate, "nibCoder:willEncodeObject:", self, Value, v13))
        : (uint64_t v15 = [delegate nibCoder:self willEncodeObject:Value forObject:v13 forKey:a4]),
          (Value = (const void *)v15) != 0))
    {
      CFDictionarySetValue(self->replacements, a3, Value);
      if (![(UINibEncoder *)self objectIDForObject:Value]) {
        [(UINibEncoder *)self assignObjectIDForObject:Value];
      }
      return (id)Value;
    }
    goto LABEL_19;
  }
  replacements = self->replacements;

  return (id)CFDictionaryGetValue(replacements, a3);
}

- (void)serializeArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(UINibEncoder *)self encodeBool:1 forKey:@"NSInlinedValue"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [(UINibEncoder *)self encodeObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++) forKey:@"UINibEncoderEmptyKey"];
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)serializeDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 allKeys];
  if ([(UINibEncoder *)self isUnorderedCollectionSortingEnabled]
    && UIAreObjectsSortableForEncoding(v5))
  {
    uint64_t v5 = (void *)[v5 sortedArrayUsingSelector:sel_compare_];
  }
  [(UINibEncoder *)self encodeBool:1 forKey:@"NSInlinedValue"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [(UINibEncoder *)self encodeObject:v10 forKey:@"UINibEncoderEmptyKey"];
        -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", [a3 objectForKey:v10], @"UINibEncoderEmptyKey");
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)serializeSet:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[a3 allObjects];
  if ([(UINibEncoder *)self isUnorderedCollectionSortingEnabled]
    && UIAreObjectsSortableForEncoding(v4))
  {
    v4 = (void *)[v4 sortedArrayUsingSelector:sel_compare_];
  }
  [(UINibEncoder *)self encodeBool:1 forKey:@"NSInlinedValue"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(UINibEncoder *)self encodeObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++) forKey:@"UINibEncoderEmptyKey"];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)serializeObject:(id)a3
{
  if ([(UINibEncoder *)self object:a3 encodesWithCoderFromClass:objc_opt_class()])
  {
    [(UINibEncoder *)self serializeArray:a3];
  }
  else if ([(UINibEncoder *)self object:a3 encodesWithCoderFromClass:objc_opt_class()])
  {
    [(UINibEncoder *)self serializeDictionary:a3];
  }
  else if ([(UINibEncoder *)self object:a3 encodesWithCoderFromClass:objc_opt_class()])
  {
    [(UINibEncoder *)self serializeSet:a3];
  }
  else
  {
    [a3 encodeWithCoder:self];
  }
}

+ (id)archivedDataWithRootObject:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA58] data];
  id v6 = (id)[objc_alloc((Class)a1) initForWritingWithMutableData:v5];
  [v6 encodeObject:a3 forKey:@"object"];
  [v6 finishEncoding];
  return v5;
}

+ (BOOL)archiveRootObject:(id)a3 toFile:(id)a4
{
  uint64_t v5 = (void *)[a1 archivedDataWithRootObject:a3];

  return [v5 writeToFile:a4 atomically:1];
}

- (void)finishEncoding
{
}

- (unsigned)systemVersion
{
  return 2000;
}

- (int64_t)versionForClassName:(id)a3
{
  Class v3 = NSClassFromString((NSString *)a3);
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [(objc_class *)v3 version];
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  if (a3
    && (id v7 = [(UINibEncoder *)self replacementObjectForObject:a3 forKey:a4]) != 0)
  {
    uint64_t v8 = v7;
    id v9 = [(UINibEncoder *)self objectIDForObject:v7];
    if (!v9) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UINibEncoder.m", 357, @"This should have been assigned in replacementObjectForObject:forKey:");
    }
    if (!CFSetContainsValue(self->encodedObjects, v8))
    {
      CFSetAddValue(self->encodedObjects, v8);
      CFArrayAppendValue(self->encodedOrderedObjects, v8);
      [(UINibEncoder *)self appendValue:+[UINibCoderValue nibValueForObjectReference:UINibArchiveIndexFromNumber(v9) key:a4 scope:self->recursiveState.currentObjectID]];
      $A9CBA455BC7A2AE8D47C2198228CD350 recursiveState = self->recursiveState;
      self->$A9CBA455BC7A2AE8D47C2198228CD350 recursiveState = 0;
      self->recursiveState.currentObjectID = UINibArchiveIndexFromNumber(v9);
      [(UINibEncoder *)self serializeObject:v8];
      self->$A9CBA455BC7A2AE8D47C2198228CD350 recursiveState = recursiveState;
      return;
    }
    id v10 = +[UINibCoderValue nibValueForObjectReference:UINibArchiveIndexFromNumber(v9) key:a4 scope:self->recursiveState.currentObjectID];
  }
  else
  {
    id v10 = +[UINibCoderValue nibValueRepresentingNilReferenceForKey:a4 scope:self->recursiveState.currentObjectID];
  }

  [(UINibEncoder *)self appendValue:v10];
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  if (!a3) {
    goto LABEL_9;
  }
  if (-[UINibEncoder shouldUniqueObjectByValue:](self, "shouldUniqueObjectByValue:"))
  {
    uint64_t v8 = NSString;
    id v9 = (objc_class *)objc_opt_class();
    if (![v8 stringWithFormat:@"This coder does not support conditional encoding of %@.", NSStringFromClass(v9)])objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UINibEncoder.m", 379, @"Invalid parameter not satisfying: %@", @"message"); {
  }
    }
  id v10 = [(UINibEncoder *)self replacementObjectForObject:a3 forKey:a4];
  if (v10)
  {
    id v11 = v10;
    id v12 = [(UINibEncoder *)self objectIDForObject:v10];
    if (!v12) {
      id v12 = [(UINibEncoder *)self assignObjectIDForObject:v11];
    }
    id v13 = +[UINibCoderValue nibValueForObjectReference:UINibArchiveIndexFromNumber(v12) key:a4 scope:self->recursiveState.currentObjectID];
  }
  else
  {
LABEL_9:
    id v13 = +[UINibCoderValue nibValueRepresentingNilReferenceForKey:a4 scope:self->recursiveState.currentObjectID];
  }

  [(UINibEncoder *)self appendValue:v13];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  id v5 = +[UINibCoderValue nibValueForBoolean:a3 key:a4 scope:self->recursiveState.currentObjectID];

  [(UINibEncoder *)self appendValue:v5];
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  id v5 = +[UINibCoderValue nibValueForInteger:a3 key:a4 scope:self->recursiveState.currentObjectID];

  [(UINibEncoder *)self appendValue:v5];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  id v5 = +[UINibCoderValue nibValueForInteger:a3 key:a4 scope:self->recursiveState.currentObjectID];

  [(UINibEncoder *)self appendValue:v5];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v5 = +[UINibCoderValue nibValueForInteger:a3 key:a4 scope:self->recursiveState.currentObjectID];

  [(UINibEncoder *)self appendValue:v5];
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  id v5 = +[UINibCoderValue nibValueForInteger:a3 key:a4 scope:self->recursiveState.currentObjectID];

  [(UINibEncoder *)self appendValue:v5];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v5 = +[UINibCoderValue nibValueForFloat:key:scope:](UINibCoderValue, "nibValueForFloat:key:scope:", a4, self->recursiveState.currentObjectID);

  [(UINibEncoder *)self appendValue:v5];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v5 = +[UINibCoderValue nibValueForDouble:a4 key:self->recursiveState.currentObjectID scope:a3];

  [(UINibEncoder *)self appendValue:v5];
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  id v6 = +[UINibCoderValue nibValueForBytes:a3 length:a4 key:a5 scope:self->recursiveState.currentObjectID];

  [(UINibEncoder *)self appendValue:v6];
}

- (void)encodeArrayOfDoubles:(double *)a3 count:(int64_t)a4 forKey:(id)a5
{
  id v9 = (void *)[MEMORY[0x1E4F1CA58] data];
  char v12 = 7;
  [v9 appendBytes:&v12 length:1];
  if (a4 >= 1)
  {
    do
    {
      uint64_t v10 = *(void *)a3++;
      uint64_t v11 = v10;
      [v9 appendBytes:&v11 length:8];
      --a4;
    }
    while (a4);
  }
  -[UINibEncoder encodeBytes:length:forKey:](self, "encodeBytes:length:forKey:", [v9 bytes], objc_msgSend(v9, "length"), a5);
}

- (void)encodeArrayOfFloats:(float *)a3 count:(int64_t)a4 forKey:(id)a5
{
  id v9 = (void *)[MEMORY[0x1E4F1CA58] data];
  char v12 = 6;
  [v9 appendBytes:&v12 length:1];
  if (a4 >= 1)
  {
    do
    {
      int v10 = *(_DWORD *)a3++;
      int v11 = v10;
      [v9 appendBytes:&v11 length:4];
      --a4;
    }
    while (a4);
  }
  -[UINibEncoder encodeBytes:length:forKey:](self, "encodeBytes:length:forKey:", [v9 bytes], objc_msgSend(v9, "length"), a5);
}

- (void)encodeCGPoint:(CGPoint)a3 forKey:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CGPoint v4 = a3;
  [(UINibEncoder *)self encodeArrayOfCGFloats:&v4 count:2 forKey:a4];
}

- (void)encodeCGSize:(CGSize)a3 forKey:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CGSize v4 = a3;
  [(UINibEncoder *)self encodeArrayOfCGFloats:&v4 count:2 forKey:a4];
}

- (void)encodeCGRect:(CGRect)a3 forKey:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CGRect v4 = a3;
  [(UINibEncoder *)self encodeArrayOfCGFloats:&v4 count:4 forKey:a4];
}

- (void)encodeCGAffineTransform:(CGAffineTransform *)a3 forKey:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(UINibEncoder *)self encodeArrayOfCGFloats:v5 count:6 forKey:a4];
}

- (void)encodeUIEdgeInsets:(UIEdgeInsets)a3 forKey:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  UIEdgeInsets v4 = a3;
  [(UINibEncoder *)self encodeArrayOfCGFloats:&v4 count:4 forKey:a4];
}

- (id)nextGenericKey
{
  v2 = NSString;
  uint64_t nextAnonymousKey = self->recursiveState.nextAnonymousKey;
  self->recursiveState.uint64_t nextAnonymousKey = nextAnonymousKey + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", @"$%ld", nextAnonymousKey);
}

- (void)encodeObject:(id)a3
{
  id v5 = [(UINibEncoder *)self nextGenericKey];

  [(UINibEncoder *)self encodeObject:a3 forKey:v5];
}

- (void)encodeRootObject:(id)a3
{
  id v5 = [(UINibEncoder *)self nextGenericKey];

  [(UINibEncoder *)self encodeObject:a3 forKey:v5];
}

- (void)encodeBycopyObject:(id)a3
{
  id v5 = [(UINibEncoder *)self nextGenericKey];

  [(UINibEncoder *)self encodeObject:a3 forKey:v5];
}

- (void)encodeByrefObject:(id)a3
{
  id v5 = [(UINibEncoder *)self nextGenericKey];

  [(UINibEncoder *)self encodeObject:a3 forKey:v5];
}

- (void)encodeConditionalObject:(id)a3
{
  id v5 = [(UINibEncoder *)self nextGenericKey];

  [(UINibEncoder *)self encodeConditionalObject:a3 forKey:v5];
}

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);

  [v5 handleFailureInMethod:a2 object:self file:@"UINibEncoder.m" lineNumber:512 description:&stru_1EDD49F70];
}

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  id v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);

  [v7 handleFailureInMethod:a2 object:self file:@"UINibEncoder.m" lineNumber:516 description:&stru_1EDD49F70];
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  id v7 = [(UINibEncoder *)self nextGenericKey];

  [(UINibEncoder *)self encodeBytes:a3 length:a4 forKey:v7];
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  if (strlen(a3) != 1) {
    -[UINibEncoder encodeValueOfObjCType:at:]();
  }
  unsigned int v7 = *(unsigned __int8 *)a3;
  if (v7 <= 0x63)
  {
    if (*(unsigned __int8 *)a3 > 0x3Fu)
    {
      if (v7 != 64)
      {
        if (v7 != 66) {
          goto LABEL_37;
        }
        uint64_t v11 = *(unsigned __int8 *)a4;
        id v12 = [(UINibEncoder *)self nextGenericKey];
        [(UINibEncoder *)self encodeBool:v11 forKey:v12];
        return;
      }
      SEL v9 = *(SEL *)a4;
    }
    else
    {
      if (v7 == 42)
      {
        uint64_t v14 = *(const char **)a4;
        size_t v15 = strlen(v14) + 1;
        id v16 = [(UINibEncoder *)self nextGenericKey];
        [(UINibEncoder *)self encodeBytes:v14 length:v15 forKey:v16];
        return;
      }
      if (v7 != 58) {
        goto LABEL_37;
      }
      SEL v9 = (SEL)NSStringFromSelector(*(SEL *)a4);
    }
    id v18 = [(UINibEncoder *)self nextGenericKey];
    [(UINibEncoder *)self encodeObject:v9 forKey:v18];
    return;
  }
  if (*(unsigned __int8 *)a3 > 0x68u)
  {
    switch(v7)
    {
      case 'i':
        SEL v8 = (SEL)*(int *)a4;
        goto LABEL_22;
      case 'q':
        SEL v8 = *(SEL *)a4;
        goto LABEL_22;
      case 's':
        SEL v8 = (SEL)*(__int16 *)a4;
LABEL_22:
        id v13 = [(UINibEncoder *)self nextGenericKey];
        [(UINibEncoder *)self encodeInteger:v8 forKey:v13];
        return;
    }
LABEL_37:
    -[UINibEncoder encodeValueOfObjCType:at:]();
  }
  if (v7 == 100)
  {
    double v10 = *(double *)a4;
  }
  else
  {
    if (v7 != 102) {
      goto LABEL_37;
    }
    double v10 = *(float *)a4;
  }
  id v17 = [(UINibEncoder *)self nextGenericKey];

  [(UINibEncoder *)self encodeDouble:v17 forKey:v10];
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->id delegate = a3;
}

- (BOOL)isUnorderedCollectionSortingEnabled
{
  return self->_unorderedCollectionSortingEnabled;
}

- (void)setUnorderedCollectionSortingEnabled:(BOOL)a3
{
  self->_unorderedCollectionSortingEnabled = a3;
}

- (void)encodeValueOfObjCType:at:.cold.1()
{
}

- (void)encodeValueOfObjCType:at:.cold.2()
{
}

@end