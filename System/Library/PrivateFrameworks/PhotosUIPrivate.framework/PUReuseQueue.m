@interface PUReuseQueue
- (BOOL)isReuseEnabled;
- (NSMutableDictionary)_objectCreationBlocksByReuseIdentifier;
- (NSMutableDictionary)_reusableObjectsByReuseIdentifier;
- (PUReuseQueue)init;
- (id)dequeueObjectWithReuseIdentifier:(id)a3 isReused:(BOOL *)a4;
- (void)enqueueObjectForReuse:(id)a3 withReuseIdentifier:(id)a4;
- (void)registerObjectCreationBlock:(id)a3 withReuseIdentifier:(id)a4;
- (void)setReuseEnabled:(BOOL)a3;
@end

@implementation PUReuseQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reusableObjectsByReuseIdentifier, 0);
  objc_storeStrong((id *)&self->__objectCreationBlocksByReuseIdentifier, 0);
}

- (void)setReuseEnabled:(BOOL)a3
{
  self->_reuseEnabled = a3;
}

- (BOOL)isReuseEnabled
{
  return self->_reuseEnabled;
}

- (NSMutableDictionary)_reusableObjectsByReuseIdentifier
{
  return self->__reusableObjectsByReuseIdentifier;
}

- (NSMutableDictionary)_objectCreationBlocksByReuseIdentifier
{
  return self->__objectCreationBlocksByReuseIdentifier;
}

- (void)enqueueObjectForReuse:(id)a3 withReuseIdentifier:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUReuseQueue.m", 60, @"Invalid parameter not satisfying: %@", @"object != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PUReuseQueue.m", 61, @"Invalid parameter not satisfying: %@", @"reuseIdentifier != nil" object file lineNumber description];

LABEL_3:
  v8 = [(PUReuseQueue *)self _reusableObjectsByReuseIdentifier];
  v9 = [v8 objectForKeyedSubscript:v7];
  if (!v9)
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    [v8 setObject:v9 forKeyedSubscript:v7];
  }
  [v9 addObject:v12];
}

- (id)dequeueObjectWithReuseIdentifier:(id)a3 isReused:(BOOL *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUReuseQueue.m", 37, @"Invalid parameter not satisfying: %@", @"reuseIdentifier != nil" object file lineNumber description];
  }
  v8 = [(PUReuseQueue *)self _reusableObjectsByReuseIdentifier];
  v9 = [v8 objectForKeyedSubscript:v7];
  if (![v9 count] || !-[PUReuseQueue isReuseEnabled](self, "isReuseEnabled"))
  {
    id v12 = [(PUReuseQueue *)self _objectCreationBlocksByReuseIdentifier];
    v13 = [v12 objectForKeyedSubscript:v7];

    if (v13)
    {
      v10 = v13[2](v13);
    }
    else
    {
      v10 = 0;
    }

    BOOL v11 = 0;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v10 = [v9 firstObject];
  [v9 removeObjectAtIndex:0];
  BOOL v11 = 1;
  if (a4) {
LABEL_11:
  }
    *a4 = v11;
LABEL_12:

  return v10;
}

- (void)registerObjectCreationBlock:(id)a3 withReuseIdentifier:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUReuseQueue.m", 30, @"Invalid parameter not satisfying: %@", @"objectCreationBlock != NULL" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PUReuseQueue.m", 31, @"Invalid parameter not satisfying: %@", @"reuseIdentifier != nil" object file lineNumber description];

LABEL_3:
  v8 = (void *)[v12 copy];
  v9 = [(PUReuseQueue *)self _objectCreationBlocksByReuseIdentifier];
  [v9 setObject:v8 forKeyedSubscript:v7];
}

- (PUReuseQueue)init
{
  v9.receiver = self;
  v9.super_class = (Class)PUReuseQueue;
  v2 = [(PUReuseQueue *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_reuseEnabled = 1;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    objectCreationBlocksByReuseIdentifier = v3->__objectCreationBlocksByReuseIdentifier;
    v3->__objectCreationBlocksByReuseIdentifier = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    reusableObjectsByReuseIdentifier = v3->__reusableObjectsByReuseIdentifier;
    v3->__reusableObjectsByReuseIdentifier = (NSMutableDictionary *)v6;
  }
  return v3;
}

@end