@interface APExpressionReferenceLibrary
- (APExpressionReferenceLibrary)initWithStorage:(id)a3;
- (APExpressionStorageProtocol)storage;
- (APUnfairRecursiveLock)lock;
- (NSMutableDictionary)referenceCache;
- (NSMutableDictionary)unsavedReferences;
- (id)_createNodeFromDictionary:(id)a3 identifier:(id)a4 error:(id *)a5;
- (id)_validateAndAddReference:(id)a3 reference:(id)a4;
- (id)addReference:(id)a3;
- (id)addReferences:(id)a3;
- (id)referenceFromIdentifier:(id)a3 error:(id *)a4;
- (unint64_t)referenceCount;
- (unint64_t)updateCount;
- (void)_persistNewReferences;
- (void)beginUpdate;
- (void)dealloc;
- (void)endUpdate;
- (void)removeReferences:(id)a3;
- (void)setLock:(id)a3;
- (void)setReferenceCache:(id)a3;
- (void)setStorage:(id)a3;
- (void)setUnsavedReferences:(id)a3;
- (void)setUpdateCount:(unint64_t)a3;
@end

@implementation APExpressionReferenceLibrary

- (APExpressionReferenceLibrary)initWithStorage:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APExpressionReferenceLibrary;
  v6 = [(APExpressionReferenceLibrary *)&v17 init];
  if (!v6) {
    goto LABEL_5;
  }
  v7 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
  lock = v6->_lock;
  v6->_lock = v7;

  uint64_t v9 = +[NSMutableDictionary dictionary];
  referenceCache = v6->_referenceCache;
  v6->_referenceCache = (NSMutableDictionary *)v9;

  uint64_t v11 = +[NSMutableDictionary dictionary];
  unsavedReferences = v6->_unsavedReferences;
  v6->_unsavedReferences = (NSMutableDictionary *)v11;

  if (objc_opt_respondsToSelector() & 1) == 0 || ([v5 initialize])
  {
    objc_storeStrong((id *)&v6->_storage, a3);
LABEL_5:
    v13 = v6;
    goto LABEL_6;
  }
  v15 = APLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to initialize expression library data store. Aborting.", v16, 2u);
  }

  if (objc_opt_respondsToSelector()) {
    [v5 finalize];
  }
  v13 = 0;
LABEL_6:

  return v13;
}

- (void)_persistNewReferences
{
  v3 = [(APExpressionReferenceLibrary *)self lock];
  [v3 lock];

  unint64_t v4 = [(APExpressionReferenceLibrary *)self updateCount];
  if (v4)
  {
    v3 = [(APExpressionReferenceLibrary *)self unsavedReferences];
    if ((unint64_t)[v3 count] < 0x65) {
      goto LABEL_11;
    }
  }
  id v5 = [(APExpressionReferenceLibrary *)self storage];
  if (v5)
  {
    v6 = [(APExpressionReferenceLibrary *)self storage];
    v7 = [(APExpressionReferenceLibrary *)self unsavedReferences];
    unsigned int v8 = [v6 persist:v7];

    if (v4)
    {

      if ((v8 & 1) == 0) {
        goto LABEL_12;
      }
    }
    else if (!v8)
    {
      goto LABEL_12;
    }
    v3 = [(APExpressionReferenceLibrary *)self unsavedReferences];
    [v3 removeAllObjects];
LABEL_11:

    goto LABEL_12;
  }

  if (v4) {
    goto LABEL_11;
  }
LABEL_12:
  id v9 = [(APExpressionReferenceLibrary *)self lock];
  [v9 unlock];
}

- (id)_createNodeFromDictionary:(id)a3 identifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 objectForKey:@"expression"];

  if (v9)
  {
    v10 = [APTargetingExpressionNode alloc];
    uint64_t v11 = [v7 objectForKeyedSubscript:@"expression"];
    v12 = [v7 objectForKeyedSubscript:@"subexpressions"];
    v13 = [v7 objectForKeyedSubscript:@"data"];
    v14 = [(APTargetingExpressionNode *)v10 initWithParent:0 identifier:v8 expressionOrReference:v11 subExpressions:v12 data:v13 error:a5];
  }
  else
  {
    v15 = [v7 objectForKey:@"adaptor"];

    if (v15)
    {
      v14 = [[APDataSourceNode alloc] initWithParent:0 identifier:v8 dataSource:v7 error:a5];
    }
    else
    {
      v16 = APLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138543362;
        id v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Value does not represent a targeting expression or data adaptor: %{public}@", (uint8_t *)&v18, 0xCu);
      }

      v14 = 0;
    }
  }

  return v14;
}

- (void)dealloc
{
  [(APExpressionReferenceLibrary *)self _persistNewReferences];
  [(APUnfairRecursiveLock *)self->_lock lock];
  uint64_t v3 = [(APExpressionReferenceLibrary *)self storage];
  if (v3)
  {
    unint64_t v4 = (void *)v3;
    id v5 = [(APExpressionReferenceLibrary *)self storage];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(APExpressionReferenceLibrary *)self storage];
      [v7 finalize];
    }
  }
  storage = self->_storage;
  self->_storage = 0;

  [(APUnfairRecursiveLock *)self->_lock unlock];
  v9.receiver = self;
  v9.super_class = (Class)APExpressionReferenceLibrary;
  [(APExpressionReferenceLibrary *)&v9 dealloc];
}

- (void)beginUpdate
{
  uint64_t v3 = [(APExpressionReferenceLibrary *)self lock];
  [v3 lock];

  [(APExpressionReferenceLibrary *)self setUpdateCount:(char *)[(APExpressionReferenceLibrary *)self updateCount] + 1];
  id v4 = [(APExpressionReferenceLibrary *)self lock];
  [v4 unlock];
}

- (void)endUpdate
{
  uint64_t v3 = [(APExpressionReferenceLibrary *)self lock];
  [v3 lock];

  if ([(APExpressionReferenceLibrary *)self updateCount]) {
    [(APExpressionReferenceLibrary *)self setUpdateCount:(char *)[(APExpressionReferenceLibrary *)self updateCount] - 1];
  }
  [(APExpressionReferenceLibrary *)self _persistNewReferences];
  id v4 = [(APExpressionReferenceLibrary *)self lock];
  [v4 unlock];
}

- (id)referenceFromIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(APExpressionReferenceLibrary *)self lock];
  [v7 lock];

  id v8 = [(APExpressionReferenceLibrary *)self referenceCache];
  objc_super v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    v10 = [(APExpressionReferenceLibrary *)self unsavedReferences];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];

    if (v11
      || ([(APExpressionReferenceLibrary *)self storage],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v12 find:v6],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11))
    {
      uint64_t v13 = [(APExpressionReferenceLibrary *)self _createNodeFromDictionary:v11 identifier:v6 error:a4];
      if (v13)
      {
        objc_super v9 = (void *)v13;
        v14 = [(APExpressionReferenceLibrary *)self referenceCache];
        [v14 setObject:v9 forKey:v6];
      }
      else
      {
        if (a4) {
          CFStringRef v15 = (const __CFString *)*a4;
        }
        else {
          CFStringRef v15 = @"(unavailable)";
        }
        v16 = +[NSString stringWithFormat:@"Error creating node %@: %@", v6, v15];
        objc_super v17 = APLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v31 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        objc_super v9 = 0;
      }
    }
    else
    {
      objc_super v9 = 0;
    }
  }
  int v18 = [(APExpressionReferenceLibrary *)self lock];
  [v18 unlock];

  if (a4 && !v9)
  {
    id v19 = +[NSString stringWithFormat:@"Reference '%@' not registered.", v6];
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    v29 = v19;
    v20 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1128 userInfo:v20];
  }
  if ([v9 conformsToProtocol:&OBJC_PROTOCOL___APExpressionEvaluationProtocol])
  {
    id v21 = v9;
  }
  else
  {
    v22 = +[NSString stringWithFormat:@"Reference %@ does not conform to APExpressionEvaluationProtocol", v6];
    v23 = APLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    if (a4)
    {
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      v27 = v22;
      v24 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1121 userInfo:v24];
    }
    id v21 = 0;
  }

  return v21;
}

- (id)_validateAndAddReference:(id)a3 reference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(APExpressionReferenceLibrary *)self lock];
  [v8 lock];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [(APExpressionReferenceLibrary *)self unsavedReferences];
    [v9 setObject:v7 forKey:v6];

    v10 = [(APExpressionReferenceLibrary *)self lock];
    [v10 unlock];

    uint64_t v11 = 0;
  }
  else
  {
    v12 = [(APExpressionReferenceLibrary *)self lock];
    [v12 unlock];

    uint64_t v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    CFStringRef v15 = +[NSString stringWithFormat:@"Object must be dictionary type (%@)", v14];

    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    id v19 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v11 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1112 userInfo:v16];
  }

  return v11;
}

- (id)addReference:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [v5 dataUsingEncoding:4];
    id v27 = 0;
    id v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:4 error:&v27];
    id v8 = v27;
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v7;
        v14 = [v13 allKeys];
        CFStringRef v15 = [v14 firstObject];

        objc_opt_class();
        NSErrorUserInfoKey v26 = v13;
        if (objc_opt_isKindOfClass())
        {
          v16 = [v13 allValues];
          objc_super v17 = [v16 firstObject];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = [(APExpressionReferenceLibrary *)self _validateAndAddReference:v15 reference:v17];
          }
          else
          {
            v23 = +[NSString stringWithFormat:@"Reference '%@' must be dictionary type.", v15, v26];
            NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
            v29 = v23;
            v24 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
            id v10 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1112 userInfo:v24];
          }
        }
        else
        {
          objc_super v17 = +[NSString stringWithFormat:@"Identifier '%@' must be string type.", v15, v13];
          NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
          v31 = v17;
          v22 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          id v10 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1112 userInfo:v22];
        }
      }
      else
      {
        NSErrorUserInfoKey v18 = (objc_class *)objc_opt_class();
        id v19 = NSStringFromClass(v18);
        v20 = +[NSString stringWithFormat:@"Reference is an invalid JSON object type '%@'", v19];

        NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
        v33 = v20;
        id v21 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        id v10 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1112 userInfo:v21];
      }
    }
  }
  else
  {
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    CFStringRef v35 = @"Reference is nil or empty.";
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v12 = +[NSError errorWithDomain:@"com.apple.ap.targetingexpressions" code:-1122 userInfo:v11];

    id v9 = v12;
    id v10 = v9;
  }

  return v10;
}

- (id)addReferences:(id)a3
{
  id v4 = a3;
  id v5 = [(APExpressionReferenceLibrary *)self lock];
  [v5 lock];

  id v6 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[APExpressionReferenceLibrary addReference:](self, "addReference:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [(APExpressionReferenceLibrary *)self lock];
  [v13 unlock];

  return v6;
}

- (void)removeReferences:(id)a3
{
  id v4 = a3;
  id v5 = [(APExpressionReferenceLibrary *)self lock];
  [v5 lock];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v10);
        v12 = [(APExpressionReferenceLibrary *)self referenceCache];
        [v12 removeObjectForKey:v11];

        id v13 = [(APExpressionReferenceLibrary *)self unsavedReferences];
        [v13 removeObjectForKey:v11];

        v14 = [(APExpressionReferenceLibrary *)self storage];

        if (v14)
        {
          long long v15 = [(APExpressionReferenceLibrary *)self storage];
          [v15 remove:v11];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v16 = [(APExpressionReferenceLibrary *)self lock];
  [v16 unlock];
}

- (unint64_t)referenceCount
{
  uint64_t v3 = [(APExpressionReferenceLibrary *)self lock];
  [v3 lock];

  id v4 = [(APExpressionReferenceLibrary *)self storage];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(APExpressionReferenceLibrary *)self storage];
    id v6 = (char *)[v5 recordCount];
  }
  else
  {
    id v6 = 0;
  }

  id v7 = [(APExpressionReferenceLibrary *)self unsavedReferences];
  id v8 = &v6[(void)[v7 count]];

  uint64_t v9 = [(APExpressionReferenceLibrary *)self lock];
  [v9 unlock];

  return (unint64_t)v8;
}

- (NSMutableDictionary)referenceCache
{
  return self->_referenceCache;
}

- (void)setReferenceCache:(id)a3
{
}

- (NSMutableDictionary)unsavedReferences
{
  return self->_unsavedReferences;
}

- (void)setUnsavedReferences:(id)a3
{
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (APExpressionStorageProtocol)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_unsavedReferences, 0);

  objc_storeStrong((id *)&self->_referenceCache, 0);
}

@end