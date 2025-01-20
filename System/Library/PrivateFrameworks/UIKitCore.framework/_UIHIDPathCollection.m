@interface _UIHIDPathCollection
- (BOOL)hasPathWithId:(id)a3;
- (_UIHIDPathCollection)init;
- (__IOHIDEvent)_createCollectionEventForEvent:(__IOHIDEvent *)a3;
- (id)hidEventFromCurrentState;
- (id)pathWithId:(id)a3;
- (id)pathsInPhase:(int64_t)a3;
- (id)pathsTouching;
- (unint64_t)digitizerSenderID;
- (unint64_t)pathCount;
- (unsigned)_collectionMask;
- (unsigned)fallbackContextId;
- (void)addPath:(id)a3;
- (void)dealloc;
- (void)removePath:(id)a3;
- (void)setDigitizerSenderID:(unint64_t)a3;
- (void)setFallbackContextId:(unsigned int)a3;
- (void)updateEventTimestamp:(unint64_t)a3;
- (void)updateWithHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation _UIHIDPathCollection

- (_UIHIDPathCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIHIDPathCollection;
  v2 = [(_UIHIDPathCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pathsById = v2->_pathsById;
    v2->_pathsById = (NSMutableDictionary *)v3;

    v2->_digitizerSenderID = 0x8000000800A15171;
  }
  return v2;
}

- (void)dealloc
{
  hidEvent = self->_hidEvent;
  if (hidEvent)
  {
    CFRelease(hidEvent);
    self->_hidEvent = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIHIDPathCollection;
  [(_UIHIDPathCollection *)&v4 dealloc];
}

- (unint64_t)pathCount
{
  return [(NSMutableDictionary *)self->_pathsById count];
}

- (BOOL)hasPathWithId:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_pathsById objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)pathWithId:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_pathsById objectForKey:a3];
}

- (id)pathsInPhase:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v6 = [(NSMutableDictionary *)self->_pathsById objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 deliveryPhase] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)pathsTouching
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = [(NSMutableDictionary *)self->_pathsById objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isTouching]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)addPath:(id)a3
{
  pathsById = self->_pathsById;
  id v4 = a3;
  id v5 = [v4 pathId];
  [(NSMutableDictionary *)pathsById setObject:v4 forKey:v5];
}

- (void)removePath:(id)a3
{
  pathsById = self->_pathsById;
  id v4 = [a3 pathId];
  [(NSMutableDictionary *)pathsById removeObjectForKey:v4];
}

- (void)updateWithHIDEvent:(__IOHIDEvent *)a3
{
  hidEvent = self->_hidEvent;
  if (hidEvent != a3)
  {
    if (hidEvent) {
      CFRelease(hidEvent);
    }
    self->_hidEvent = a3;
    if (a3) {
      CFRetain(a3);
    }
    self->_machTimestamp = IOHIDEventGetTimeStamp();
  }
}

- (unsigned)_collectionMask
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(NSMutableDictionary *)self->_pathsById objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v3)
  {

    return 0;
  }
  uint64_t v4 = v3;
  char v5 = 0;
  char v6 = 0;
  char v7 = 0;
  char v8 = 0;
  uint64_t v9 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      char v11 = v8;
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v2);
      }
      uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) deliveryPhase];
      v8 |= v12 == 6 || v12 == 4;
      v7 |= v12 == 5;
      v5 |= v12 == 6;
      v6 |= (v12 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    }
    uint64_t v13 = v12;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v4);

  if ((v11 & 1) != 0 || (v13 | 2) == 6)
  {
    if (v7)
    {
      unsigned int result = 6;
      goto LABEL_16;
    }
    unsigned int result = 2;
LABEL_14:
    if (!(v8 & 1 | ((v5 & 1) == 0))) {
      result |= 0x20u;
    }
    goto LABEL_16;
  }
  if ((v7 & 1) == 0)
  {
    unsigned int result = 0;
    goto LABEL_14;
  }
  unsigned int result = 4;
LABEL_16:
  if (v6) {
    result |= 1u;
  }
  return result;
}

- (__IOHIDEvent)_createCollectionEventForEvent:(__IOHIDEvent *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(_UIHIDPathCollection *)self _collectionMask];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_pathsById objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    char v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v10 = [v9 deliveryPhase] == 4 || objc_msgSend(v9, "deliveryPhase") == 5;
        v6 |= v10;
        [v9 deliveryPhase];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
    unsigned int v11 = v6 & 1;
  }
  else
  {
    unsigned int v11 = 0;
  }

  DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
  objc_msgSend((id)UIApp, "_supportsIndirectInputEvents", v11);
  IOHIDEventSetIntegerValue();
  IOHIDEventGetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventGetType();
  IOHIDEventSetSenderID();
  return DigitizerEvent;
}

- (void)updateEventTimestamp:(unint64_t)a3
{
  self->_machTimestamp = a3;
}

- (id)hidEventFromCurrentState
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _UIEventHIDGetChildStylusEvent((uint64_t)self->_hidEvent);
  v46 = self;
  uint64_t v4 = BKSHIDEventGetBaseAttributes();
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  int v9 = [v6 contextID];
  BOOL v10 = v46;
  v46->_locus = 0;
  v47 = [(_UIHIDPathCollection *)v10 _createCollectionEventForEvent:v10->_hidEvent];
  uint64_t v11 = [(NSMutableDictionary *)v10->_pathsById count];
  MEMORY[0x1F4188790](v11);
  v45 = (char *)v38 - v12;
  long long v55 = 0u;
  long long v54 = 0u;
  long long v53 = 0u;
  long long v52 = 0u;
  uint64_t v13 = [(NSMutableDictionary *)v10->_pathsById objectEnumerator];
  uint64_t v49 = [v13 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v49)
  {
    v38[3] = v9;
    v39 = v38;
    id v40 = v8;
    id v41 = v6;
    int v14 = 0;
    uint64_t v48 = *(void *)v53;
    uint64_t v44 = *MEMORY[0x1E4F1CF80];
    v42 = v3;
    id v43 = v13;
LABEL_8:
    uint64_t v15 = 0;
    while (2)
    {
      if (*(void *)v53 != v48) {
        objc_enumerationMutation(v43);
      }
      long long v16 = *(void **)(*((void *)&v52 + 1) + 8 * v15);
      switch([v16 deliveryPhase])
      {
        case 0:
          goto LABEL_28;
        case 1:
          int v51 = v14;
          int v50 = 1;
          goto LABEL_17;
        case 2:
          int v51 = v14;
          int v50 = 1;
          if (!v3) {
            goto LABEL_18;
          }
          goto LABEL_26;
        case 3:
          int v51 = v14;
          int v50 = 0;
LABEL_17:
          if (!v3) {
            goto LABEL_18;
          }
          goto LABEL_26;
        case 4:
          int v51 = v14;
          int v50 = 1;
          goto LABEL_25;
        case 5:
          int v51 = v14;
          int v50 = 1;
          goto LABEL_25;
        case 6:
          int v51 = v14;
          int v50 = 1;
          if (!v3) {
            goto LABEL_18;
          }
          goto LABEL_26;
        case 7:
          int v51 = v14;
          int v50 = 1;
          if (!v3) {
            goto LABEL_18;
          }
          goto LABEL_26;
        default:
          int v51 = v14;
          int v50 = 1;
LABEL_25:
          if (v3)
          {
LABEL_26:
            IOHIDEventGetFloatValue();
            IOHIDEventGetFloatValue();
            IOHIDEventGetFloatValue();
            IOHIDEventGetFloatValue();
            IOHIDEventGetFloatValue();
            uint64_t v19 = [v16 pathId];
            [v19 intValue];
            [v16 identity];
            [v16 position];
            [v16 position];
            DigitizerStylusEventWithPolarOrientation = (const void *)IOHIDEventCreateDigitizerStylusEventWithPolarOrientation();

            IOHIDEventSetFloatValue();
          }
          else
          {
LABEL_18:
            long long v17 = [v16 pathId];
            [v17 intValue];
            [v16 identity];
            [v16 position];
            [v16 position];
            [v16 force];
            DigitizerStylusEventWithPolarOrientation = (const void *)IOHIDEventCreateDigitizerFingerEvent();

            [v16 majorRadius];
            IOHIDEventSetFloatValue();
            uint64_t v3 = v42;
            IOHIDEventGetIntegerValue();
            IOHIDEventSetIntegerValue();
          }
          [v16 generationCount];
          IOHIDEventSetIntegerValue();
          uint64_t v20 = [v16 pathId];
          int v21 = [v20 intValue];

          [v16 position];
          float v23 = v22;
          [v16 position];
          float v25 = v24;
          [v16 position];
          float v27 = v26;
          [v16 position];
          int v28 = v51;
          v29 = &v45[36 * v51];
          *(_DWORD *)v29 = v21;
          *((_DWORD *)v29 + 1) = v21;
          float v31 = v30;
          *((void *)v29 + 1) = 0;
          *((_DWORD *)v29 + 4) = 0;
          *((float *)v29 + 5) = v23;
          *((float *)v29 + 6) = v25;
          *((float *)v29 + 7) = v27;
          *((float *)v29 + 8) = v31;
          IOHIDEventAppendEvent();
          CFRelease(DigitizerStylusEventWithPolarOrientation);
          int v14 = v28 + 1;
LABEL_28:
          if (v49 != ++v15) {
            continue;
          }
          id v32 = v43;
          uint64_t v49 = [v43 countByEnumeratingWithState:&v52 objects:v56 count:16];
          if (v49) {
            goto LABEL_8;
          }

          id v6 = v41;
          id v8 = v40;
          if (!v14) {
            goto LABEL_38;
          }
          v33 = v46;
          int Type = IOHIDEventGetType();
          hidEvent = v33->_hidEvent;
          if (Type != 17) {
            hidEvent = (void *)_UIEventHIDGetChildPointerEvent((uint64_t)hidEvent);
          }
          if (hidEvent) {
            IOHIDEventAppendEvent();
          }
          if (v8) {
            [v8 initialTouchTimestamp];
          }
          else {
            CFAbsoluteTimeGetCurrent();
          }
          BKSHIDEventSetDigitizerInfoWithSubEventInfos();
          break;
      }
      break;
    }
  }
  else
  {

LABEL_38:
    CFRelease(v47);
    v47 = 0;
  }

  v36 = v47;
  return v36;
}

- (unint64_t)digitizerSenderID
{
  return self->_digitizerSenderID;
}

- (void)setDigitizerSenderID:(unint64_t)a3
{
  self->_digitizerSenderID = a3;
}

- (unsigned)fallbackContextId
{
  return self->_fallbackContextId;
}

- (void)setFallbackContextId:(unsigned int)a3
{
  self->_fallbackContextId = a3;
}

- (void).cxx_destruct
{
}

@end