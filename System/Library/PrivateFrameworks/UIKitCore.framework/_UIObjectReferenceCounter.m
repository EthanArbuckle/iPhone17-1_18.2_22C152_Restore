@interface _UIObjectReferenceCounter
- (id)allObjects;
- (void)decrementReferenceForObject:(id)a3 invalidationHandler:(id)a4;
- (void)incrementReferenceForObject:(id)a3;
@end

@implementation _UIObjectReferenceCounter

- (void)decrementReferenceForObject:(id)a3 invalidationHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(void))a4;
  NSUInteger v9 = [(NSCountedSet *)self->_objectReferences countForObject:v7];
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UIApplication_BackgroundTasks.m", 52, @"Object passed to %s is not in reference map: object %@", "-[_UIObjectReferenceCounter decrementReferenceForObject:invalidationHandler:]", v7 object file lineNumber description];
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A08);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v15 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[_UIObjectReferenceCounter decrementReferenceForObject:invalidationHandler:]";
      __int16 v20 = 2112;
      NSUInteger v21 = (NSUInteger)v7;
      __int16 v22 = 2048;
      NSUInteger v23 = v9;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "%s: reference map for object %@: existing count is %ld", buf, 0x20u);
    }
  }
  [(NSCountedSet *)self->_objectReferences removeObject:v7];
  NSUInteger v11 = v9 - 1;
  if (v11)
  {
    unint64_t v13 = __UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A18);
    if (*(unsigned char *)v13)
    {
      v17 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[_UIObjectReferenceCounter decrementReferenceForObject:invalidationHandler:]";
        __int16 v20 = 2048;
        NSUInteger v21 = v11;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "%s: Updating reference map with count %ld", buf, 0x16u);
      }
    }
  }
  else
  {
    unint64_t v12 = __UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A10);
    if (*(unsigned char *)v12)
    {
      v16 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[_UIObjectReferenceCounter decrementReferenceForObject:invalidationHandler:]";
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "%s: Object is no longer being referenced, removing object from reference map and invalidating it", buf, 0xCu);
      }
    }
    if (v8) {
      v8[2](v8);
    }
  }
}

- (void)incrementReferenceForObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objectReferences = self->_objectReferences;
  if (!objectReferences)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    id v7 = self->_objectReferences;
    self->_objectReferences = v6;

    objectReferences = self->_objectReferences;
  }
  uint64_t v8 = [(NSCountedSet *)objectReferences countForObject:v4];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB2609F8);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    NSUInteger v11 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315650;
      v14 = "-[_UIObjectReferenceCounter incrementReferenceForObject:]";
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "%s: reference map for object %@: existing entry is %ld", (uint8_t *)&v13, 0x20u);
    }
  }
  unint64_t v10 = __UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A00);
  if (*(unsigned char *)v10)
  {
    unint64_t v12 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315650;
      v14 = "-[_UIObjectReferenceCounter incrementReferenceForObject:]";
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2048;
      uint64_t v18 = v8 + 1;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%s: Updating reference map for object %@ with count %ld", (uint8_t *)&v13, 0x20u);
    }
  }
  [(NSCountedSet *)self->_objectReferences addObject:v4];
}

- (id)allObjects
{
  return (id)[(NSCountedSet *)self->_objectReferences allObjects];
}

- (void).cxx_destruct
{
}

@end