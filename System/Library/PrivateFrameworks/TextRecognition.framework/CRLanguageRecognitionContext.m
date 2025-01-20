@interface CRLanguageRecognitionContext
- (id)initWithScript:(void *)a3 defaultLocale:;
- (void)_updateFeatureLocale:(uint64_t)a1;
- (void)processFeature:(void *)a3 recognizer:;
- (void)runRecognitionWithRecognizer:(int)a3 force:;
@end

@implementation CRLanguageRecognitionContext

- (id)initWithScript:(void *)a3 defaultLocale:
{
  id v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)CRLanguageRecognitionContext;
    v7 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[5] = a2;
      v8 = objc_opt_new();
      objc_setProperty_atomic(a1, v9, v8, 32);

      v10 = objc_opt_new();
      objc_setProperty_atomic(a1, v11, v10, 24);

      *((_DWORD *)a1 + 4) = 0;
      objc_storeStrong(a1 + 6, a3);
    }
  }

  return a1;
}

- (void)processFeature:(void *)a3 recognizer:
{
  self = a2;
  id v5 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v6 = *(id *)(a1 + 8);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));

    if (v6)
    {
      -[CRLanguageRecognitionContext _updateFeatureLocale:](a1, self);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      objc_msgSend(objc_getProperty((id)a1, v7, 24, 1), "addObject:", self);
      id Property = self;
      if (self) {
        id Property = objc_getProperty(self, v8, 80, 1);
      }
      id v10 = Property;
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      dispatch_semaphore_t v13 = v11;
      if (v10)
      {
        objc_setProperty_atomic(v10, v12, v11, 376);

        id v15 = objc_getProperty(v10, v14, 352, 1);
      }
      else
      {

        id v15 = 0;
      }
      id v16 = v15;
      v17 = [v16 candidates];
      v18 = [v17 firstObject];
      v19 = [v18 fullString];
      v20 = [v19 _crStringByPreparingForLanguageRecognition];

      if ([v20 length])
      {
        uint64_t v22 = objc_msgSend(objc_getProperty((id)a1, v21, 32, 1), "length");
        id v24 = objc_getProperty((id)a1, v23, 32, 1);
        if (v22) {
          [v24 appendFormat:@" %@", v20];
        }
        else {
          [v24 appendString:v20];
        }
      }
      if ((unint64_t)objc_msgSend(objc_getProperty((id)a1, v21, 32, 1), "length") >= 0x32) {
        -[CRLanguageRecognitionContext runRecognitionWithRecognizer:force:]((void *)a1, v5, 0);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    }
  }
}

- (void)_updateFeatureLocale:(uint64_t)a1
{
  if (self && (id v3 = objc_getProperty(self, (SEL)self, 80, 1)) != 0)
  {
    id v5 = v3;
    objc_setProperty_atomic(v3, v4, *(id *)(a1 + 8), 368);
  }
  else
  {
    id v5 = 0;
  }
}

- (void)runRecognitionWithRecognizer:(int)a3 force:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a1 && !a1[1])
  {
    if ((unint64_t)objc_msgSend(objc_getProperty(a1, v5, 32, 1), "length") >= 0x10)
    {
      uint64_t v8 = objc_msgSend(objc_getProperty(a1, v7, 32, 1), "_crPredictedLocaleUsingRecognizer:resetContext:", v6, 1);
      SEL v9 = (void *)a1[1];
      a1[1] = v8;
    }
    uint64_t v10 = a1[1];
    if (!v10 && a3)
    {
      id v11 = objc_getProperty(a1, v7, 48, 1);
      v12 = (void *)a1[1];
      a1[1] = v11;

      uint64_t v10 = a1[1];
    }
    if (v10)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v13 = objc_getProperty(a1, v7, 24, 1);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
            -[CRLanguageRecognitionContext _updateFeatureLocale:]((uint64_t)a1, v18);
            if (v18)
            {
              char v20 = 1;
              id Property = objc_getProperty(v18, v19, 80, 1);
              v18 = Property;
              if (Property)
              {
                id Property = objc_getProperty(Property, v22, 376, 1);
                char v20 = 0;
              }
            }
            else
            {
              id Property = 0;
              char v20 = 1;
            }
            id v23 = Property;

            if (v23)
            {
              if (v20) {
                id v25 = 0;
              }
              else {
                id v25 = objc_getProperty(v18, v24, 376, 1);
              }
              v26 = v25;
              dispatch_semaphore_signal(v26);
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v27 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
          uint64_t v15 = v27;
        }
        while (v27);
      }

      id v29 = objc_getProperty(a1, v28, 24, 1);
      objc_msgSend(v29, "removeAllObjects", (void)v30);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultLocale, 0);
  objc_storeStrong((id *)&self->_contextString, 0);
  objc_storeStrong((id *)&self->_featuresAccumulator, 0);
  objc_storeStrong((id *)&self->_recognizedLanguage, 0);
}

@end