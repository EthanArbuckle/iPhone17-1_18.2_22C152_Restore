@interface SEMIndexSiteMonitor
+ (id)sharedInstance;
- (SEMIndexSiteMonitor)initWithQueue:(id)a3 uvSession:(id)a4;
- (void)_enumerateObserversAsPersonaIdentifier:(id)a3 usingBlock:(id)a4;
- (void)_registerObserver:(id)a3 exists:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SEMIndexSiteMonitor

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7FAACC;
  block[3] = &unk_2654DE1F8;
  block[4] = a1;
  if (qword_26B354A28 != -1) {
    dispatch_once(&qword_26B354A28, block);
  }
  v2 = (void *)qword_26B354A30;
  return v2;
}

- (SEMIndexSiteMonitor)initWithQueue:(id)a3 uvSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SEMIndexSiteMonitor;
  v9 = [(SEMIndexSiteMonitor *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_uvSession, a4);
    objc_msgSend__beginMonitoring(v10, v11, v12, v13);
  }

  return v10;
}

- (void)_enumerateObserversAsPersonaIdentifier:(id)a3 usingBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = self->_observers;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
    if (v10)
    {
      uint64_t v14 = v10;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v8);
          }
          v17 = objc_msgSend_observer(*(void **)(*((void *)&v22 + 1) + 8 * v16), v11, v12, v13);
          if (v17)
          {
            v19[0] = MEMORY[0x263EF8330];
            v19[1] = 3221225472;
            v19[2] = sub_25C7FADD8;
            v19[3] = &unk_2654DE630;
            id v21 = v7;
            id v20 = v17;
            objc_msgSend_runAsPersonaIdentifier_block_(SEMPersonaUtilities, v18, (uint64_t)v6, (uint64_t)v19);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v22, (uint64_t)v26, 16);
      }
      while (v14);
    }
  }
}

- (void)_registerObserver:(id)a3 exists:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7FAE94;
  block[3] = &unk_2654DE658;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_uvSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end