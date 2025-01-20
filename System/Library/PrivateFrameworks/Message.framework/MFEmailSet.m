@interface MFEmailSet
+ (id)set;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (BOOL)isSubsetOfSet:(id)a3;
- (MFEmailSet)init;
- (MFEmailSet)initWithCapacity:(unint64_t)a3;
- (MFEmailSet)initWithSet:(id)a3;
- (id)_generateAllObjectsFromSelector:(SEL)a3;
- (id)allCommentedAddresses;
- (id)allObjects;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)serializedRepresentation;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_setupSetWithCapacity:(unint64_t)a3;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation MFEmailSet

+ (id)set
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MFEmailSet)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFEmailSet;
  id v2 = [(EAEmailAddressSet *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MFEmailSet *)v2 _setupSetWithCapacity:0];
  }
  return v3;
}

- (MFEmailSet)initWithCapacity:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFEmailSet;
  v4 = [(EAEmailAddressSet *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(MFEmailSet *)v4 _setupSetWithCapacity:a3];
  }
  return v5;
}

- (MFEmailSet)initWithSet:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = -[MFEmailSet initWithCapacity:](self, "initWithCapacity:", [a3 count]);
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v10 = [[_MFEmailSetEmail alloc] initWithAddress:v9];
            if (v10)
            {
              v11 = v10;
              CFSetAddValue(v4->_set, v10);
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

- (void)_setupSetWithCapacity:(unint64_t)a3
{
  self->_set = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &sMFEmailSetCallbacks);
}

- (void)dealloc
{
  set = self->_set;
  if (set) {
    CFRelease(set);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFEmailSet;
  [(MFEmailSet *)&v4 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init(MFEmailSet);
  CFSetApplyFunction(self->_set, (CFSetApplierFunction)_copyFunction, v4->_set);
  return v4;
}

- (id)serializedRepresentation
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F605B8]) initWithSet:self];
  v3 = (void *)[v2 serializedRepresentation];

  return v3;
}

- (unint64_t)count
{
  return CFSetGetCount(self->_set);
}

- (id)member:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[MFEmailSet member:]();
  }
  uint64_t v5 = [[_MFEmailSetEmail alloc] initWithAddress:a3];
  if (v5)
  {
    uint64_t v6 = v5;
    Value = (void *)CFSetGetValue(self->_set, v5);
  }
  else
  {
    Value = 0;
  }
  return (id)[Value address];
}

- (BOOL)intersectsSet:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 count])
  {
    uint64_t v5 = *((void *)a3 + 2);
    context[0] = 0xAAAAAAAAAAAAAA00;
    context[1] = v5;
    CFSetApplyFunction(self->_set, (CFSetApplierFunction)_intersectsFunction, context);
    return LOBYTE(context[0]) != 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 count])
    {
      uint64_t v7 = [[MFEmailSet alloc] initWithSet:a3];
      BOOL v8 = [(MFEmailSet *)self intersectsSet:v7];

      return v8;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)MFEmailSet;
      return [(EAEmailAddressSet *)&v9 intersectsSet:a3];
    }
  }
}

- (BOOL)isSubsetOfSet:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 count])
  {
    uint64_t v5 = *((void *)a3 + 2);
    context[0] = 0xAAAAAAAAAAAAAA01;
    context[1] = v5;
    CFSetApplyFunction(self->_set, (CFSetApplierFunction)_subsetFunction, context);
    return LOBYTE(context[0]) != 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 count])
    {
      uint64_t v7 = [[MFEmailSet alloc] initWithSet:a3];
      BOOL v8 = [(MFEmailSet *)self isSubsetOfSet:v7];

      return v8;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)MFEmailSet;
      return [(EAEmailAddressSet *)&v9 isSubsetOfSet:a3];
    }
  }
}

- (BOOL)isEqualToSet:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(MFEmailSet *)self count];
    if (v5 == [a3 count])
    {
      return [(MFEmailSet *)self isSubsetOfSet:a3];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 count])
    {
      uint64_t v7 = [[MFEmailSet alloc] initWithSet:a3];
      BOOL v8 = [(MFEmailSet *)self isEqualToSet:v7];

      return v8;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)MFEmailSet;
      return [(EAEmailAddressSet *)&v9 isEqualToSet:a3];
    }
  }
}

- (id)_generateAllObjectsFromSelector:(SEL)a3
{
  CFIndex Count = CFSetGetCount(self->_set);
  uint64_t v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFSetGetValues(self->_set, v6);
  uint64_t v7 = malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  BOOL v8 = v7;
  if (Count >= 1)
  {
    objc_super v9 = (void **)v6;
    v10 = v7;
    CFIndex v11 = Count;
    do
    {
      v12 = *v9++;
      *v10++ = [v12 a3];
      --v11;
    }
    while (v11);
  }
  long long v13 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:Count];
  free(v6);
  free(v8);
  return v13;
}

- (id)allCommentedAddresses
{
  return [(MFEmailSet *)self _generateAllObjectsFromSelector:sel_commentedAddress];
}

- (id)allObjects
{
  return [(MFEmailSet *)self _generateAllObjectsFromSelector:sel_address];
}

- (id)objectEnumerator
{
  id v2 = [[_MFEmailSetEnumerator alloc] initWithSet:self];
  return v2;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v6 = [(__CFSet *)self->_set countByEnumeratingWithState:a3 objects:a4 count:a5];
  if (v6)
  {
    uint64_t v7 = 0;
    do
    {
      a3->var1[v7] = (id)[a3->var1[v7] address];
      ++v7;
    }
    while (v6 != v7);
  }
  return v6;
}

- (void)addObject:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[MFEmailSet addObject:]();
  }
  unint64_t v5 = [[_MFEmailSetEmail alloc] initWithAddress:a3];
  if (v5)
  {
    uint64_t v7 = v5;
    CFSetAddValue(self->_set, v5);
  }
  else
  {
    unint64_t v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_INFO, "attempt to add illegal email address to email set, skipping '%@'", buf, 0xCu);
    }
  }
}

- (void)removeObject:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[MFEmailSet removeObject:]();
  }
  unint64_t v5 = [[_MFEmailSetEmail alloc] initWithAddress:a3];
  if (v5)
  {
    unint64_t v6 = v5;
    CFSetRemoveValue(self->_set, v5);
  }
}

- (void)removeAllObjects
{
}

- (void)unionSet:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFSetRef v5 = (const __CFSet *)*((void *)a3 + 2);
    set = self->_set;
    CFSetApplyFunction(v5, (CFSetApplierFunction)_unionFunction, set);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [[MFEmailSet alloc] initWithSet:a3];
      [(MFEmailSet *)self unionSet:v7];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)MFEmailSet;
      [(EAEmailAddressSet *)&v8 unionSet:a3];
    }
  }
}

- (void)minusSet:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFSetRef v5 = (const __CFSet *)*((void *)a3 + 2);
    set = self->_set;
    CFSetApplyFunction(v5, (CFSetApplierFunction)_minusFunction, set);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [[MFEmailSet alloc] initWithSet:a3];
      [(MFEmailSet *)self minusSet:v7];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)MFEmailSet;
      [(EAEmailAddressSet *)&v8 minusSet:a3];
    }
  }
}

- (void)intersectSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *((void *)a3 + 2);
      context[0] = v5;
      context[1] = v6;
      CFSetApplyFunction(self->_set, (CFSetApplierFunction)_intersectFunction, context);
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v5);
            }
            CFSetRemoveValue(self->_set, *(const void **)(*((void *)&v13 + 1) + 8 * i));
          }
          uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        }
        while (v8);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFIndex v11 = [[MFEmailSet alloc] initWithSet:a3];
        -[MFEmailSet intersectSet:](self, "intersectSet:");
      }
      else
      {
        v12.receiver = self;
        v12.super_class = (Class)MFEmailSet;
        [(EAEmailAddressSet *)&v12 intersectSet:a3];
      }
    }
  }
}

- (void)setSet:(id)a3
{
  if (a3 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFSetRemoveAllValues(self->_set);
      CFSetRef v5 = (const __CFSet *)*((void *)a3 + 2);
      set = self->_set;
      CFSetApplyFunction(v5, (CFSetApplierFunction)_unionFunction, set);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [[MFEmailSet alloc] initWithSet:a3];
        [(MFEmailSet *)self setSet:v7];
      }
      else
      {
        v8.receiver = self;
        v8.super_class = (Class)MFEmailSet;
        [(EAEmailAddressSet *)&v8 setSet:a3];
      }
    }
  }
}

- (void)member:.cold.1()
{
}

- (void)addObject:.cold.1()
{
}

- (void)removeObject:.cold.1()
{
}

@end