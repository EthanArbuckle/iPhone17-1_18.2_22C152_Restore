@interface TSKChangeNotifier
- (BOOL)p_pendingAddOrRemoveOfObserver:(id)a3 forChangeSource:(id)a4;
- (TSKChangeNotifier)init;
- (id)p_findCountedObserverForObserver:(id)a3 inArray:(id)a4;
- (void)addObserver:(id)a3 forChangeSource:(id)a4;
- (void)addObserver:(id)a3 forChangeSourceOfClass:(Class)a4;
- (void)asyncProcessChanges:(id)a3;
- (void)dealloc;
- (void)p_addObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5;
- (void)p_queueObserverListChange:(id)a3;
- (void)p_removeObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5;
- (void)p_updateObserverList;
- (void)removeObserver:(id)a3 forChangeSource:(id)a4;
- (void)removeObserver:(id)a3 forChangeSourceOfClass:(Class)a4;
- (void)syncProcessChanges:(id)a3;
@end

@implementation TSKChangeNotifier

- (TSKChangeNotifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSKChangeNotifier;
  v2 = [(TSKChangeNotifier *)&v6 init];
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    v2->mChangeSourceObservers = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
    v2->mChangeSourceOfClassObservers = CFDictionaryCreateMutable(v3, 0, 0, v4);
    v2->mQueuedObserverListChanges = CFArrayCreateMutable(v3, 0, MEMORY[0x263EFFF70]);
  }
  return v2;
}

- (void)dealloc
{
  mChangeSourceObservers = self->mChangeSourceObservers;
  if (mChangeSourceObservers) {
    CFRelease(mChangeSourceObservers);
  }
  mChangeSourceOfClassObservers = self->mChangeSourceOfClassObservers;
  if (mChangeSourceOfClassObservers) {
    CFRelease(mChangeSourceOfClassObservers);
  }
  mQueuedObserverListChanges = self->mQueuedObserverListChanges;
  if (mQueuedObserverListChanges) {
    CFRelease(mQueuedObserverListChanges);
  }
  v6.receiver = self;
  v6.super_class = (Class)TSKChangeNotifier;
  [(TSKChangeNotifier *)&v6 dealloc];
}

- (id)p_findCountedObserverForObserver:(id)a3 inArray:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ((id)[v10 observer] == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)p_pendingAddOrRemoveOfObserver:(id)a3 forChangeSource:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  mQueuedObserverListChanges = self->mQueuedObserverListChanges;
  uint64_t v8 = [(__CFArray *)mQueuedObserverListChanges countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(mQueuedObserverListChanges);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (*(id *)(v11 + 16) == a3 && *(id *)(v11 + 24) == a4)
        {
          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [(__CFArray *)mQueuedObserverListChanges countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:
  objc_sync_exit(self);
  return v12;
}

- (void)p_queueObserverListChange:(id)a3
{
  objc_sync_enter(self);
  CFIndex Count = CFArrayGetCount(self->mQueuedObserverListChanges);
  if (Count < 1)
  {
LABEL_7:
    CFArrayAppendValue(self->mQueuedObserverListChanges, a3);
  }
  else
  {
    CFIndex v6 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->mQueuedObserverListChanges, v6);
      if (ValueAtIndex[2] == *((void *)a3 + 2)
        && ValueAtIndex[3] == *((void *)a3 + 3)
        && *((_DWORD *)ValueAtIndex + 2) != *((_DWORD *)a3 + 2))
      {
        break;
      }
      if (Count == ++v6) {
        goto LABEL_7;
      }
    }
    CFArrayRemoveValueAtIndex(self->mQueuedObserverListChanges, v6);
  }

  objc_sync_exit(self);
}

- (void)p_addObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5
{
  BOOL v5 = a5;
  objc_sync_enter(self);
  if (self->mProcessingChanges)
  {
    [(TSKChangeNotifier *)self p_queueObserverListChange:+[TSKQueuedObserverSet queuedObserverSetWithChangeType:0 observer:a3 changeSource:a4 isClass:v5]];
  }
  else
  {
    uint64_t v9 = 8;
    if (v5) {
      uint64_t v9 = 16;
    }
    CFDictionaryRef v10 = *(Class *)((char *)&self->super.isa + v9);
    id Value = (id)CFDictionaryGetValue(v10, a4);
    if (!Value)
    {
      id Value = objc_alloc_init(MEMORY[0x263EFF980]);
      CFDictionarySetValue(v10, a4, Value);
    }
    id v12 = [(TSKChangeNotifier *)self p_findCountedObserverForObserver:a3 inArray:Value];
    if (v12)
    {
      [v12 incrementCount];
    }
    else
    {
      long long v13 = [[TSKCountedObserver alloc] initWithObserver:a3];
      [Value addObject:v13];
    }
  }

  objc_sync_exit(self);
}

- (void)addObserver:(id)a3 forChangeSource:(id)a4
{
}

- (void)p_removeObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5
{
  BOOL v5 = a5;
  objc_sync_enter(self);
  if (self->mProcessingChanges)
  {
    [(TSKChangeNotifier *)self p_queueObserverListChange:+[TSKQueuedObserverSet queuedObserverSetWithChangeType:1 observer:a3 changeSource:a4 isClass:v5]];
  }
  else
  {
    uint64_t v9 = 8;
    if (v5) {
      uint64_t v9 = 16;
    }
    CFDictionaryRef v10 = *(Class *)((char *)&self->super.isa + v9);
    id Value = (void *)CFDictionaryGetValue(v10, a4);
    if (Value)
    {
      id v12 = [(TSKChangeNotifier *)self p_findCountedObserverForObserver:a3 inArray:Value];
      id v13 = v12;
      if (v12 && ![v12 decrementCount]) {
        [Value removeObject:v13];
      }
      if (![Value count]) {
        CFDictionaryRemoveValue(v10, a4);
      }
    }
  }

  objc_sync_exit(self);
}

- (void)removeObserver:(id)a3 forChangeSource:(id)a4
{
}

- (void)addObserver:(id)a3 forChangeSourceOfClass:(Class)a4
{
}

- (void)removeObserver:(id)a3 forChangeSourceOfClass:(Class)a4
{
}

- (void)p_updateObserverList
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  if (!self->mProcessingChanges)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    mQueuedObserverListChanges = self->mQueuedObserverListChanges;
    uint64_t v4 = [(__CFArray *)mQueuedObserverListChanges countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(mQueuedObserverListChanges);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v8 = *(void *)(v7 + 16);
          uint64_t v9 = *(void *)(v7 + 24);
          BOOL v10 = *(unsigned __int8 *)(v7 + 32) != 0;
          if (*(_DWORD *)(v7 + 8)) {
            [(TSKChangeNotifier *)self p_removeObserver:v8 forChangeSource:v9 isClass:v10];
          }
          else {
            [(TSKChangeNotifier *)self p_addObserver:v8 forChangeSource:v9 isClass:v10];
          }
        }
        uint64_t v4 = [(__CFArray *)mQueuedObserverListChanges countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
    CFArrayRemoveAllValues(self->mQueuedObserverListChanges);
  }
  objc_sync_exit(self);
}

- (void)syncProcessChanges:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = (id)objc_msgSend((id)objc_msgSend(a3, "changesArray"), "copy");
  objc_sync_enter(self);
  ++self->mProcessingChanges;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v5)
  {
    uint64_t v24 = *(void *)v42;
    do
    {
      uint64_t v6 = 0;
      uint64_t v22 = v5;
      do
      {
        if (*(void *)v42 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v6;
        uint64_t v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
        uint64_t v8 = (const void *)[v7 changeSource];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id Value = (void *)CFDictionaryGetValue(self->mChangeSourceObservers, v8);
        uint64_t v10 = [Value countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v38 != v11) {
                objc_enumerationMutation(Value);
              }
              long long v13 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) observer];
              if (![(TSKChangeNotifier *)self p_pendingAddOrRemoveOfObserver:v13 forChangeSource:v8]&& (objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v13, "syncProcessChanges:forChangeSource:", objc_msgSend(v7, "changes"), v8);
              }
            }
            uint64_t v10 = [Value countByEnumeratingWithState:&v37 objects:v47 count:16];
          }
          while (v10);
        }
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        mChangeSourceOfClassObservers = self->mChangeSourceOfClassObservers;
        uint64_t v14 = [(__CFDictionary *)mChangeSourceOfClassObservers countByEnumeratingWithState:&v33 objects:v46 count:16];
        if (v14)
        {
          uint64_t v27 = *(void *)v34;
          do
          {
            uint64_t v15 = 0;
            uint64_t v28 = v14;
            do
            {
              if (*(void *)v34 != v27) {
                objc_enumerationMutation(mChangeSourceOfClassObservers);
              }
              uint64_t v16 = *(const void **)(*((void *)&v33 + 1) + 8 * v15);
              if (objc_opt_isKindOfClass())
              {
                long long v31 = 0u;
                long long v32 = 0u;
                long long v29 = 0u;
                long long v30 = 0u;
                long long v17 = (void *)CFDictionaryGetValue(self->mChangeSourceOfClassObservers, v16);
                uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v45 count:16];
                if (v18)
                {
                  uint64_t v19 = *(void *)v30;
                  do
                  {
                    for (uint64_t j = 0; j != v18; ++j)
                    {
                      if (*(void *)v30 != v19) {
                        objc_enumerationMutation(v17);
                      }
                      v21 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * j) observer];
                      if (![(TSKChangeNotifier *)self p_pendingAddOrRemoveOfObserver:v21 forChangeSource:v8]&& (objc_opt_respondsToSelector() & 1) != 0)
                      {
                        objc_msgSend(v21, "syncProcessChanges:forChangeSource:", objc_msgSend(v7, "changes"), v8);
                      }
                    }
                    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v45 count:16];
                  }
                  while (v18);
                }
              }
              ++v15;
            }
            while (v15 != v28);
            uint64_t v14 = [(__CFDictionary *)mChangeSourceOfClassObservers countByEnumeratingWithState:&v33 objects:v46 count:16];
          }
          while (v14);
        }
        uint64_t v6 = v25 + 1;
      }
      while (v25 + 1 != v22);
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v5);
  }
  --self->mProcessingChanges;
  [(TSKChangeNotifier *)self p_updateObserverList];
  objc_sync_exit(self);
}

- (void)asyncProcessChanges:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 changesArray];
  objc_sync_enter(self);
  ++self->mProcessingChanges;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v5)
  {
    uint64_t v24 = *(void *)v42;
    do
    {
      uint64_t v6 = 0;
      uint64_t v22 = v5;
      do
      {
        if (*(void *)v42 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v6;
        uint64_t v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
        uint64_t v8 = (const void *)[v7 changeSource];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id Value = (void *)CFDictionaryGetValue(self->mChangeSourceObservers, v8);
        uint64_t v10 = [Value countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v38 != v11) {
                objc_enumerationMutation(Value);
              }
              long long v13 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) observer];
              if (![(TSKChangeNotifier *)self p_pendingAddOrRemoveOfObserver:v13 forChangeSource:v8]&& (objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v13, "asyncProcessChanges:forChangeSource:", objc_msgSend(v7, "changes"), v8);
              }
            }
            uint64_t v10 = [Value countByEnumeratingWithState:&v37 objects:v47 count:16];
          }
          while (v10);
        }
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        mChangeSourceOfClassObservers = self->mChangeSourceOfClassObservers;
        uint64_t v14 = [(__CFDictionary *)mChangeSourceOfClassObservers countByEnumeratingWithState:&v33 objects:v46 count:16];
        if (v14)
        {
          uint64_t v27 = *(void *)v34;
          do
          {
            uint64_t v15 = 0;
            uint64_t v28 = v14;
            do
            {
              if (*(void *)v34 != v27) {
                objc_enumerationMutation(mChangeSourceOfClassObservers);
              }
              uint64_t v16 = *(const void **)(*((void *)&v33 + 1) + 8 * v15);
              if (objc_opt_isKindOfClass())
              {
                long long v31 = 0u;
                long long v32 = 0u;
                long long v29 = 0u;
                long long v30 = 0u;
                long long v17 = (void *)CFDictionaryGetValue(self->mChangeSourceOfClassObservers, v16);
                uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v45 count:16];
                if (v18)
                {
                  uint64_t v19 = *(void *)v30;
                  do
                  {
                    for (uint64_t j = 0; j != v18; ++j)
                    {
                      if (*(void *)v30 != v19) {
                        objc_enumerationMutation(v17);
                      }
                      v21 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * j) observer];
                      if (![(TSKChangeNotifier *)self p_pendingAddOrRemoveOfObserver:v21 forChangeSource:v8]&& (objc_opt_respondsToSelector() & 1) != 0)
                      {
                        objc_msgSend(v21, "asyncProcessChanges:forChangeSource:", objc_msgSend(v7, "changes"), v8);
                      }
                    }
                    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v45 count:16];
                  }
                  while (v18);
                }
              }
              ++v15;
            }
            while (v15 != v28);
            uint64_t v14 = [(__CFDictionary *)mChangeSourceOfClassObservers countByEnumeratingWithState:&v33 objects:v46 count:16];
          }
          while (v14);
        }
        uint64_t v6 = v25 + 1;
      }
      while (v25 + 1 != v22);
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v5);
  }
  --self->mProcessingChanges;
  [(TSKChangeNotifier *)self p_updateObserverList];
  objc_sync_exit(self);
}

@end