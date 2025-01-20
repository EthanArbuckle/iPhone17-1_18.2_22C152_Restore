@interface SCROBrailleDisplayManagedQueue
- (SCROBrailleDisplayManagedQueue)init;
- (id)_queueForState:(int)a3 createQueue:(BOOL)a4;
- (id)activeDisplays;
- (id)activePendingDisplays;
- (id)disconnectedDisplays;
- (id)displayForToken:(int)a3;
- (id)loadingDisplays;
- (id)primaryDisplay;
- (id)sleepingDisplays;
- (int)stateForDisplay:(id)a3;
- (unint64_t)activeQueueMaximumSize;
- (unint64_t)displayCountIncludingDisconnectedDisplays:(BOOL)a3;
- (void)_fillActiveBrailleDisplayQueue;
- (void)addDisplay:(id)a3 withState:(int)a4;
- (void)dealloc;
- (void)removeDisplay:(id)a3;
- (void)setActiveQueueMaximumSize:(unint64_t)a3;
- (void)setPrimaryDisplay:(id)a3;
- (void)setState:(int)a3 forDisplay:(id)a4;
@end

@implementation SCROBrailleDisplayManagedQueue

- (SCROBrailleDisplayManagedQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCROBrailleDisplayManagedQueue;
  v2 = [(SCROBrailleDisplayManagedQueue *)&v8 init];
  if (v2)
  {
    v2->_displayQueueDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
    v2->_queueStateDict = CFDictionaryCreateMutable(0, 0, 0, 0);
    v3 = (SCRCIndexMap *)objc_alloc_init(MEMORY[0x263F67018]);
    stateQueueMap = v2->_stateQueueMap;
    v2->_stateQueueMap = v3;

    v5 = (SCRCIndexMap *)objc_alloc_init(MEMORY[0x263F67018]);
    tokenDisplayMap = v2->_tokenDisplayMap;
    v2->_tokenDisplayMap = v5;

    v2->_maxActiveQueueSize = 1;
  }
  return v2;
}

- (void)dealloc
{
  displayQueueDict = self->_displayQueueDict;
  if (displayQueueDict) {
    CFRelease(displayQueueDict);
  }
  queueStateDict = self->_queueStateDict;
  if (queueStateDict) {
    CFRelease(queueStateDict);
  }
  v5.receiver = self;
  v5.super_class = (Class)SCROBrailleDisplayManagedQueue;
  [(SCROBrailleDisplayManagedQueue *)&v5 dealloc];
}

- (id)_queueForState:(int)a3 createQueue:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = a3;
  id v7 = [(SCRCIndexMap *)self->_stateQueueMap objectForIndex:a3];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(SCRCIndexMap *)self->_stateQueueMap setObject:v7 forIndex:v6];
    queueStateDict = self->_queueStateDict;
    if (queueStateDict) {
      CFDictionarySetValue(queueStateDict, v7, (const void *)v6);
    }
  }

  return v7;
}

- (void)addDisplay:(id)a3 withState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id key = a3;
  uint64_t v6 = [key token];
  if (key)
  {
    if (v4 <= 4)
    {
      uint64_t v7 = (int)v6;
      BOOL v8 = [(SCRCIndexMap *)self->_tokenDisplayMap objectForIndex:(int)v6];

      if (!v8)
      {
        v9 = [(SCROBrailleDisplayManagedQueue *)self _queueForState:v4 createQueue:1];
        if (v9)
        {
          [(SCRCIndexMap *)self->_tokenDisplayMap setObject:key forIndex:v7];
          if (v4 == 1)
          {
            if ([v9 count] >= self->_maxActiveQueueSize)
            {
              v11 = [(SCROBrailleDisplayManagedQueue *)self _queueForState:2 createQueue:1];

              [v11 addObject:key];
              v9 = v11;
            }
            else
            {
              [v9 addObject:key];
            }
            displayQueueDict = self->_displayQueueDict;
            if (displayQueueDict) {
              CFDictionarySetValue(displayQueueDict, key, v9);
            }
          }
          else
          {
            [v9 addObject:key];
            v10 = self->_displayQueueDict;
            if (v10) {
              CFDictionarySetValue(v10, key, v9);
            }
            if (v4 == 2) {
              [(SCROBrailleDisplayManagedQueue *)self _fillActiveBrailleDisplayQueue];
            }
          }
        }
      }
    }
  }

  MEMORY[0x270F9A758](v6);
}

- (void)removeDisplay:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id key = v4;
    uint64_t v5 = (int)[v4 token];
    uint64_t v6 = [(SCRCIndexMap *)self->_tokenDisplayMap objectForIndex:v5];
    if (v6 == key)
    {
      displayQueueDict = self->_displayQueueDict;
      if (displayQueueDict)
      {
        BOOL v8 = (id)CFDictionaryGetValue(displayQueueDict, key);
        p_queueStateDict = &self->_queueStateDict;
        queueStateDict = self->_queueStateDict;
        unsigned int Value = 5;
        if (queueStateDict && v8) {
          unsigned int Value = CFDictionaryGetValue(queueStateDict, v8);
        }
      }
      else
      {
        BOOL v8 = 0;
        p_queueStateDict = &self->_queueStateDict;
        unsigned int Value = 5;
      }
      [(SCRCIndexMap *)self->_tokenDisplayMap removeObjectForIndex:v5];
      [v8 removeObjectIdenticalTo:key];
      v12 = self->_displayQueueDict;
      if (v12) {
        CFDictionaryRemoveValue(v12, key);
      }
      if (![v8 count])
      {
        if (*p_queueStateDict) {
          CFDictionaryRemoveValue(*p_queueStateDict, v8);
        }
        [(SCRCIndexMap *)self->_stateQueueMap removeObjectForIndex:Value];
      }
      if (Value == 1) {
        [(SCROBrailleDisplayManagedQueue *)self _fillActiveBrailleDisplayQueue];
      }
    }
    id v4 = key;
  }
}

- (void)_fillActiveBrailleDisplayQueue
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(SCROBrailleDisplayManagedQueue *)self _queueForState:2 createQueue:0];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = [(SCROBrailleDisplayManagedQueue *)self _queueForState:1 createQueue:1];
    uint64_t v7 = v6;
    if (v6)
    {
      unint64_t v8 = [v6 count];
      unint64_t maxActiveQueueSize = self->_maxActiveQueueSize;
      BOOL v10 = maxActiveQueueSize > v8;
      unint64_t v11 = maxActiveQueueSize - v8;
      if (v10)
      {
        if (v11 >= v5) {
          unint64_t v12 = v5;
        }
        else {
          unint64_t v12 = v11;
        }
        objc_msgSend(v3, "subarrayWithRange:", 0, v12);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        [v7 addObjectsFromArray:v18];
        objc_msgSend(v3, "removeObjectsInRange:", 0, v12);
        if (![v3 count])
        {
          queueStateDict = self->_queueStateDict;
          if (queueStateDict) {
            CFDictionaryRemoveValue(queueStateDict, v3);
          }
          [(SCRCIndexMap *)self->_stateQueueMap removeObjectForIndex:2];
        }
        if (self->_displayQueueDict)
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v18 = v18;
          uint64_t v14 = [v18 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v20;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v20 != v16) {
                  objc_enumerationMutation(v18);
                }
                CFDictionarySetValue(self->_displayQueueDict, *(const void **)(*((void *)&v19 + 1) + 8 * v17++), v7);
              }
              while (v15 != v17);
              uint64_t v15 = [v18 countByEnumeratingWithState:&v19 objects:v23 count:16];
            }
            while (v15);
          }
        }
      }
      else
      {
        id v18 = 0;
      }
    }
  }
}

- (void)setState:(int)a3 forDisplay:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = _SCROD_LOG();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109378;
    v16[1] = v4;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_21C66E000, v7, OS_LOG_TYPE_DEFAULT, "Set state: %d for display %{public}@", (uint8_t *)v16, 0x12u);
  }

  if (v4 <= 4 && v6)
  {
    displayQueueDict = self->_displayQueueDict;
    if (displayQueueDict)
    {
      v9 = (id)CFDictionaryGetValue(displayQueueDict, v6);
      if (v9)
      {
        queueStateDict = self->_queueStateDict;
        unsigned int v11 = queueStateDict ? CFDictionaryGetValue(queueStateDict, v9) : 5;
        if (v11 != v4)
        {
          unint64_t v12 = [(SCROBrailleDisplayManagedQueue *)self _queueForState:v4 createQueue:1];
          if (v12)
          {
            v13 = v12;
            if (v4 == 1 && [v12 count] >= self->_maxActiveQueueSize)
            {
              uint64_t v14 = [(SCROBrailleDisplayManagedQueue *)self _queueForState:2 createQueue:1];

              [v14 addObject:v6];
              v13 = v14;
            }
            else
            {
              [v13 addObject:v6];
            }
            uint64_t v15 = self->_displayQueueDict;
            if (v15) {
              CFDictionarySetValue(v15, v6, v13);
            }
            [v9 removeObjectIdenticalTo:v6];
          }
        }
      }
    }
    else
    {
      v9 = 0;
    }
  }
}

- (int)stateForDisplay:(id)a3
{
  id v4 = a3;
  displayQueueDict = self->_displayQueueDict;
  if (!displayQueueDict)
  {
    id v6 = 0;
LABEL_6:
    int Value = 5;
    goto LABEL_7;
  }
  id v6 = (id)CFDictionaryGetValue(displayQueueDict, v4);
  if (!v6) {
    goto LABEL_6;
  }
  queueStateDict = self->_queueStateDict;
  if (!queueStateDict) {
    goto LABEL_6;
  }
  int Value = CFDictionaryGetValue(queueStateDict, v6);
LABEL_7:

  return Value;
}

- (id)displayForToken:(int)a3
{
  return (id)[(SCRCIndexMap *)self->_tokenDisplayMap objectForIndex:a3];
}

- (unint64_t)displayCountIncludingDisconnectedDisplays:(BOOL)a3
{
  displayQueueDict = self->_displayQueueDict;
  if (!displayQueueDict) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(displayQueueDict);
  if (!a3)
  {
    uint64_t v7 = [(SCROBrailleDisplayManagedQueue *)self disconnectedDisplays];
    Count -= [v7 count];
  }
  return Count;
}

- (id)primaryDisplay
{
  v2 = [(SCRCIndexMap *)self->_stateQueueMap objectForIndex:1];
  if ([v2 count])
  {
    v3 = [v2 objectAtIndex:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setPrimaryDisplay:(id)a3
{
  id v8 = a3;
  id v4 = [(SCROBrailleDisplayManagedQueue *)self _queueForState:1 createQueue:0];
  if ([v4 count])
  {
    uint64_t v5 = [v4 indexOfObjectIdenticalTo:v8];
    if (v5)
    {
      uint64_t v6 = v5;
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v7 = [v4 objectAtIndex:v5];
        [v4 insertObject:v7 atIndex:0];
        [v4 removeObjectAtIndex:v6 + 1];
      }
    }
  }
}

- (unint64_t)activeQueueMaximumSize
{
  return self->_maxActiveQueueSize;
}

- (void)setActiveQueueMaximumSize:(unint64_t)a3
{
  unint64_t maxActiveQueueSize = self->_maxActiveQueueSize;
  self->_unint64_t maxActiveQueueSize = a3;
  if (maxActiveQueueSize >= a3)
  {
    if (maxActiveQueueSize > a3)
    {
      id v12 = [(SCROBrailleDisplayManagedQueue *)self _queueForState:1 createQueue:0];
      unint64_t v5 = [v12 count];
      if (v5 > self->_maxActiveQueueSize)
      {
        unint64_t v6 = v5;
        uint64_t v7 = [(SCROBrailleDisplayManagedQueue *)self _queueForState:2 createQueue:1];
        id v8 = v7;
        unint64_t v9 = self->_maxActiveQueueSize;
        if (v9) {
          unint64_t v10 = v9 - 1;
        }
        else {
          unint64_t v10 = 0;
        }
        unint64_t v11 = v6 - v9;
        objc_msgSend(v7, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v12, v10, v11);
        objc_msgSend(v12, "removeObjectsInRange:", v10, v11);
      }
    }
  }
  else
  {
    [(SCROBrailleDisplayManagedQueue *)self _fillActiveBrailleDisplayQueue];
  }
}

- (id)activeDisplays
{
  return [(SCROBrailleDisplayManagedQueue *)self _queueForState:1 createQueue:0];
}

- (id)activePendingDisplays
{
  return [(SCROBrailleDisplayManagedQueue *)self _queueForState:2 createQueue:0];
}

- (id)sleepingDisplays
{
  return [(SCROBrailleDisplayManagedQueue *)self _queueForState:3 createQueue:0];
}

- (id)disconnectedDisplays
{
  return [(SCROBrailleDisplayManagedQueue *)self _queueForState:0 createQueue:0];
}

- (id)loadingDisplays
{
  return [(SCROBrailleDisplayManagedQueue *)self _queueForState:4 createQueue:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenDisplayMap, 0);

  objc_storeStrong((id *)&self->_stateQueueMap, 0);
}

@end