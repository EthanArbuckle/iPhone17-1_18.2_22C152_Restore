@interface WFRecordPropertyMapping
- (BOOL)isEqual:(id)a3;
- (SEL)getterSelector;
- (SEL)setterSelector;
- (WFRecordProperty)destinationProperty;
- (WFRecordProperty)sourceProperty;
- (WFRecordPropertyMapping)initWithSourceObject:(id)a3 property:(id)a4 destinationObject:(id)a5 property:(id)a6;
- (id)destinationObject;
- (id)getterMethodSignature;
- (id)setterMethodSignature;
- (id)sourceObject;
- (unint64_t)hash;
- (void)invokeGetterWithBuffer:(void *)a3 length:(unint64_t *)a4;
- (void)invokeSetterWithBuffer:(void *)a3 length:(unint64_t *)a4;
- (void)propagate;
- (void)propagate:(BOOL)a3;
- (void)propagateUsingKVC;
- (void)propagateUsingSetter;
- (void)setDestinationObject:(id)a3;
- (void)setDestinationProperty:(id)a3;
- (void)setSourceObject:(id)a3;
- (void)setSourceProperty:(id)a3;
@end

@implementation WFRecordPropertyMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationProperty, 0);
  objc_destroyWeak(&self->_destinationObject);
  objc_storeStrong((id *)&self->_sourceProperty, 0);
  objc_destroyWeak(&self->_sourceObject);
}

- (void)setDestinationProperty:(id)a3
{
}

- (WFRecordProperty)destinationProperty
{
  return self->_destinationProperty;
}

- (void)setDestinationObject:(id)a3
{
}

- (id)destinationObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_destinationObject);
  return WeakRetained;
}

- (void)setSourceProperty:(id)a3
{
}

- (WFRecordProperty)sourceProperty
{
  return self->_sourceProperty;
}

- (void)setSourceObject:(id)a3
{
}

- (id)sourceObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_sourceObject);
  return WeakRetained;
}

- (unint64_t)hash
{
  v3 = [(WFRecordPropertyMapping *)self sourceObject];
  uint64_t v4 = [v3 hash];
  v5 = [(WFRecordPropertyMapping *)self sourceProperty];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(WFRecordPropertyMapping *)self destinationObject];
  uint64_t v8 = [v7 hash];
  v9 = [(WFRecordPropertyMapping *)self destinationProperty];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    uint64_t v8 = [(WFRecordPropertyMapping *)self sourceObject];
    v9 = [v7 sourceObject];
    if ([v8 isEqual:v9])
    {
      unint64_t v10 = [(WFRecordPropertyMapping *)self sourceProperty];
      v11 = [v7 sourceProperty];
      if ([v10 isEqual:v11])
      {
        v12 = [(WFRecordPropertyMapping *)self destinationObject];
        v13 = [v7 destinationObject];
        if ([v12 isEqual:v13])
        {
          v16 = [(WFRecordPropertyMapping *)self destinationProperty];
          v14 = [v7 destinationProperty];
          char v6 = [v16 isEqual:v14];
        }
        else
        {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)setterMethodSignature
{
  v3 = [(WFRecordPropertyMapping *)self destinationObject];
  id v4 = objc_msgSend(v3, "methodSignatureForSelector:", -[WFRecordPropertyMapping setterSelector](self, "setterSelector"));

  return v4;
}

- (SEL)setterSelector
{
  v2 = [(WFRecordPropertyMapping *)self destinationProperty];
  v3 = [v2 setter];
  id v4 = NSSelectorFromString(v3);

  return v4;
}

- (id)getterMethodSignature
{
  v3 = [(WFRecordPropertyMapping *)self sourceObject];
  id v4 = objc_msgSend(v3, "methodSignatureForSelector:", -[WFRecordPropertyMapping getterSelector](self, "getterSelector"));

  return v4;
}

- (SEL)getterSelector
{
  v2 = [(WFRecordPropertyMapping *)self sourceProperty];
  v3 = [v2 getter];
  id v4 = NSSelectorFromString(v3);

  return v4;
}

- (void)invokeSetterWithBuffer:(void *)a3 length:(unint64_t *)a4
{
  char v6 = (void *)MEMORY[0x1E4F1CA18];
  id v7 = [(WFRecordPropertyMapping *)self setterMethodSignature];
  id v9 = [v6 invocationWithMethodSignature:v7];

  objc_msgSend(v9, "setSelector:", -[WFRecordPropertyMapping setterSelector](self, "setterSelector"));
  [v9 setArgument:*a3 atIndex:2];
  uint64_t v8 = [(WFRecordPropertyMapping *)self destinationObject];
  [v9 invokeWithTarget:v8];
}

- (void)invokeGetterWithBuffer:(void *)a3 length:(unint64_t *)a4
{
  char v6 = (void *)MEMORY[0x1E4F1CA18];
  id v7 = [(WFRecordPropertyMapping *)self getterMethodSignature];
  id v9 = [v6 invocationWithMethodSignature:v7];

  objc_msgSend(v9, "setSelector:", -[WFRecordPropertyMapping getterSelector](self, "getterSelector"));
  uint64_t v8 = [(WFRecordPropertyMapping *)self sourceObject];
  [v9 invokeWithTarget:v8];

  [v9 getReturnValue:*a3];
}

- (void)propagateUsingSetter
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = [(WFRecordPropertyMapping *)self getterMethodSignature];
  if ([v4 methodReturnType])
  {
    id v5 = [(WFRecordPropertyMapping *)self setterMethodSignature];
    uint64_t v6 = [v5 getArgumentTypeAtIndex:2];

    if (v6)
    {
      id v7 = [(WFRecordPropertyMapping *)self getterMethodSignature];
      uint64_t v8 = (const char *)[v7 methodReturnType];
      id v9 = [(WFRecordPropertyMapping *)self setterMethodSignature];
      LODWORD(v8) = strcmp(v8, (const char *)[v9 getArgumentTypeAtIndex:2]);

      if (v8)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        v33 = [(WFRecordPropertyMapping *)self sourceObject];
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = [(WFRecordPropertyMapping *)self sourceProperty];
        v27 = [v26 getter];
        v28 = [(WFRecordPropertyMapping *)self destinationObject];
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        v31 = [(WFRecordPropertyMapping *)self destinationProperty];
        v32 = [v31 setter];
        [v23 handleFailureInMethod:a2, self, @"WFRecordPropertyMapping.m", 82, @"Property type mismatch between %@ - %@ and %@ - %@.", v25, v27, v30, v32 object file lineNumber description];
      }
      unint64_t v10 = [(WFRecordPropertyMapping *)self getterMethodSignature];
      size_t v11 = [v10 methodReturnLength];

      size_t v34 = v11;
      *(void *)buf = malloc_type_malloc(v11, 0x60F72D31uLL);
      [(WFRecordPropertyMapping *)self invokeGetterWithBuffer:buf length:&v34];
      [(WFRecordPropertyMapping *)self invokeSetterWithBuffer:buf length:&v34];
      free(*(void **)buf);
      return;
    }
  }
  else
  {
  }
  v12 = getWFWFRecordPropertyLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    v13 = [(WFRecordPropertyMapping *)self sourceObject];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = [(WFRecordPropertyMapping *)self sourceProperty];
    v17 = [v16 getter];
    v18 = [(WFRecordPropertyMapping *)self destinationObject];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = [(WFRecordPropertyMapping *)self destinationProperty];
    v22 = [v21 setter];
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "-[WFRecordPropertyMapping propagateUsingSetter]";
    __int16 v36 = 2114;
    v37 = v15;
    __int16 v38 = 2114;
    v39 = v17;
    __int16 v40 = 2114;
    v41 = v20;
    __int16 v42 = 2114;
    v43 = v22;
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s PROPERTY NOT SET: %{public}@ - %{public}@ and %{public}@ - %{public}@. Invalid setter or getter", buf, 0x34u);
  }
}

- (void)propagateUsingKVC
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(WFRecordPropertyMapping *)self sourceObject];
  id v4 = [(WFRecordPropertyMapping *)self sourceProperty];
  id v5 = [v4 name];
  uint64_t v6 = [v3 valueForKey:v5];

  if (v6)
  {
    id v7 = [(WFRecordPropertyMapping *)self destinationObject];
    uint64_t v8 = [(WFRecordPropertyMapping *)self destinationProperty];
    id v9 = [v8 name];
    [v7 setValue:v6 forKey:v9];
  }
  else
  {
    id v7 = getWFWFRecordPropertyLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      unint64_t v10 = [(WFRecordPropertyMapping *)self sourceProperty];
      size_t v11 = [v10 name];
      v12 = [(WFRecordPropertyMapping *)self sourceObject];
      int v13 = 136315650;
      v14 = "-[WFRecordPropertyMapping propagateUsingKVC]";
      __int16 v15 = 2114;
      v16 = v11;
      __int16 v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s PROPERTY NOT SET: value nil for key: %{public}@ on %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)propagate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WFRecordPropertyMapping *)self destinationProperty];
  uint64_t v6 = [v5 setter];

  if (v6)
  {
    [(WFRecordPropertyMapping *)self propagateUsingSetter];
  }
  else if (v3)
  {
    [(WFRecordPropertyMapping *)self propagateUsingKVC];
  }
}

- (void)propagate
{
}

- (WFRecordPropertyMapping)initWithSourceObject:(id)a3 property:(id)a4 destinationObject:(id)a5 property:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFRecordPropertyMapping.m", 21, @"Invalid parameter not satisfying: %@", @"sourceObject" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_10:
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"WFRecordPropertyMapping.m", 23, @"Invalid parameter not satisfying: %@", @"destinationObject" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WFRecordPropertyMapping.m", 22, @"Invalid parameter not satisfying: %@", @"sourceProperty" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_4:
  if (v14) {
    goto LABEL_5;
  }
LABEL_11:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFRecordPropertyMapping.m", 24, @"Invalid parameter not satisfying: %@", @"destinationProperty" object file lineNumber description];

LABEL_5:
  v23.receiver = self;
  v23.super_class = (Class)WFRecordPropertyMapping;
  __int16 v15 = [(WFRecordPropertyMapping *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak(&v15->_sourceObject, v11);
    objc_storeStrong((id *)&v16->_sourceProperty, a4);
    objc_storeWeak(&v16->_destinationObject, v13);
    objc_storeStrong((id *)&v16->_destinationProperty, a6);
    __int16 v17 = v16;
  }

  return v16;
}

@end