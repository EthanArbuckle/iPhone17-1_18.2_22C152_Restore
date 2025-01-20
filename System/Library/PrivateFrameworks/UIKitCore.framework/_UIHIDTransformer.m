@interface _UIHIDTransformer
- (CGSize)canvasSize;
- (_UIHIDTransformer)initWithRunLoop:(__CFRunLoop *)a3;
- (id)_inputEventsForHIDEvent:(__IOHIDEvent *)a3 contextId:(unsigned int)a4;
- (id)drainOutputHIDEvents;
- (id)handleHIDEvent:(__IOHIDEvent *)a3;
- (unsigned)contextId;
- (void)addOutputHIDEvent:(id)a3;
- (void)pathCollection;
- (void)scaleEventTracker;
- (void)setCanvasSize:(CGSize)a3;
- (void)setContextId:(unsigned int)a3;
@end

@implementation _UIHIDTransformer

- (id)_inputEventsForHIDEvent:(__IOHIDEvent *)a3 contextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v5 = _UIEventHIDShouldTransformEvent();
  int Type = IOHIDEventGetType();
  v7 = +[UIWindow _windowWithContextId:v4];
  v8 = [v7 screen];
  uint64_t v9 = [v8 _userInterfaceIdiom];

  kdebug_trace();
  if (qword_1EB262670 != -1) {
    dispatch_once(&qword_1EB262670, &__block_literal_global_465);
  }
  if (_MergedGlobals_1206)
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("HIDTransformer", &qword_1EB262668) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110144;
      int v35 = v5;
      __int16 v36 = 1024;
      int v37 = Type;
      __int16 v38 = 1024;
      int v39 = v4;
      __int16 v40 = 2048;
      v41 = v7;
      __int16 v42 = 2048;
      uint64_t v43 = v9;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Should consider event transformation: %d; backing type: %i; contextId: 0x%X; window: %p; idiom: %li",
        buf,
        0x28u);
    }
  }
  if (!v5)
  {
    id v15 = &unk_1ED3F0E68;
    goto LABEL_61;
  }
  int v11 = [(id)UIApp _supportsIndirectInputEvents];
  if (v11)
  {
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v12 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1
      || (int v32 = _UIInternalPreference_ShouldIncludeTranslationHIDEvent,
          _UIInternalPreferencesRevisionVar == _UIInternalPreference_ShouldIncludeTranslationHIDEvent))
    {
      BOOL v13 = 1;
    }
    else
    {
      do
      {
        BOOL v13 = v12 >= v32;
        if (v12 < v32) {
          break;
        }
        _UIInternalPreferenceSync(v12, &_UIInternalPreference_ShouldIncludeTranslationHIDEvent, @"ShouldIncludeTranslationHIDEvent", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v32 = _UIInternalPreference_ShouldIncludeTranslationHIDEvent;
      }
      while (v12 != _UIInternalPreference_ShouldIncludeTranslationHIDEvent);
    }
    if (byte_1EB256E3C) {
      int v14 = 1;
    }
    else {
      int v14 = v13;
    }
  }
  else
  {
    int v14 = 0;
  }
  if (IOHIDEventGetType() == 17)
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children && (CFArrayRef v17 = Children, Count = CFArrayGetCount(Children), Count >= 1))
    {
      CFIndex v19 = Count;
      CFIndex v20 = 0;
      id v21 = 0;
      do
      {
        CFArrayGetValueAtIndex(v17, v20);
        int v22 = IOHIDEventGetType() - 4;
        if (v11)
        {
          switch(v22)
          {
            case 0:
              if (!v21) {
                id v21 = (id)objc_opt_new();
              }
              if (v14) {
                goto LABEL_34;
              }
              goto LABEL_42;
            case 1:
            case 3:
              if (!v21) {
                id v21 = (id)objc_opt_new();
              }
LABEL_34:
              if ([v21 containsObject:&unk_1ED3F6588]) {
                goto LABEL_42;
              }
              v23 = v21;
              v24 = &unk_1ED3F6588;
              break;
            case 2:
              goto LABEL_28;
            default:
              goto LABEL_42;
          }
        }
        else
        {
          switch(v22)
          {
            case 0:
              if (!v21) {
                id v21 = (id)objc_opt_new();
              }
              if (v14) {
                goto LABEL_39;
              }
              goto LABEL_42;
            case 1:
            case 3:
              if (!v21) {
                id v21 = (id)objc_opt_new();
              }
LABEL_39:
              if ([v21 containsObject:&unk_1ED3F65A0]) {
                goto LABEL_42;
              }
              v23 = v21;
              v24 = &unk_1ED3F65A0;
              break;
            case 2:
LABEL_28:
              if (!v21) {
                id v21 = (id)objc_opt_new();
              }
              v23 = v21;
              v24 = &unk_1ED3F6570;
              break;
            default:
              goto LABEL_42;
          }
        }
        [v23 addObject:v24];
LABEL_42:
        ++v20;
      }
      while (v19 != v20);
      if (v21)
      {
        if (![v21 isEqualToArray:&unk_1ED3F0E80]) {
          goto LABEL_58;
        }
        char v25 = 0;
LABEL_49:
        if (IOHIDEventGetIntegerValue())
        {
          uint64_t v27 = 3;
        }
        else
        {
          v28 = BKSHIDEventGetPointerAttributes();
          if ([v28 pointerState] == 3) {
            uint64_t v27 = 2;
          }
          else {
            uint64_t v27 = 1;
          }
        }
        uint64_t v29 = [NSNumber numberWithUnsignedInteger:v27];
        v30 = (void *)v29;
        if (v25)
        {
          uint64_t v33 = v29;
          v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];

LABEL_59:
          goto LABEL_60;
        }
        [v21 addObject:v29];

LABEL_58:
        id v21 = v21;
        v26 = v21;
        goto LABEL_59;
      }
    }
    else
    {
      id v21 = 0;
    }
    char v25 = 1;
    goto LABEL_49;
  }
  v26 = &unk_1ED3F0E68;
LABEL_60:
  id v15 = v26;
LABEL_61:

  return v15;
}

- (id)handleHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  int v5 = BKSHIDEventGetBaseAttributes();
  uint64_t v6 = [v5 contextID];

  self->_hidEvent = a3;
  hidContextByContextId = self->_hidContextByContextId;
  v8 = [NSNumber numberWithUnsignedInt:v6];
  uint64_t v9 = [(NSMutableDictionary *)hidContextByContextId objectForKeyedSubscript:v8];
  hidContext = self->_hidContext;
  self->_hidContext = v9;

  if (!self->_hidContext)
  {
    int v11 = (_UIHIDContext *)objc_opt_new();
    int v12 = self->_hidContext;
    self->_hidContext = v11;

    BOOL v13 = self->_hidContextByContextId;
    int v14 = [NSNumber numberWithUnsignedInt:v6];
    [(NSMutableDictionary *)v13 setObject:v11 forKeyedSubscript:v14];

    self->_hidContext->state = 1;
  }
  self->_hidContext->remoteTimestamp = BKSHIDEventGetRemoteTimestamp();
  id v15 = [(_UIHIDTransformer *)self _inputEventsForHIDEvent:a3 contextId:v6];
  if ([v15 count] == 1)
  {
    v16 = [v15 objectAtIndexedSubscript:0];
    uint64_t v17 = [v16 unsignedIntegerValue];

    if (!v17)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDTransformer", &qword_1EB262658);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v44 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v55 = a3;
          _os_log_impl(&dword_1853B0000, v44, OS_LOG_TYPE_ERROR, "No input event specified for HIDEvent:\n%@", buf, 0xCu);
        }
      }
    }
  }
  id v19 = v15;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:buf count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(v19);
        }
        v22 |= 1 << [*(id *)(*((void *)&v49 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:buf count:16];
    }
    while (v21);
  }
  else
  {
    LODWORD(v22) = 0;
  }

  kdebug_trace();
  if (qword_1EB262670 != -1) {
    dispatch_once(&qword_1EB262670, &__block_literal_global_465);
  }
  if (_MergedGlobals_1206)
  {
    char v25 = objc_opt_new();
    for (uint64_t j = 0; j != 9; ++j)
    {
      if ((v22 & (1 << j)) != 0)
      {
        if ([v25 length]) {
          uint64_t v27 = @", ";
        }
        else {
          uint64_t v27 = &stru_1ED0E84C0;
        }
        objc_msgSend(v25, "appendFormat:", @"%s%s", -[__CFString UTF8String](v27, "UTF8String"), -[__CFString UTF8String](objc_retainAutorelease(_UIHIDInputEventString[j]), "UTF8String"));
      }
    }
    id v28 = v25;
    uint64_t v29 = [v28 UTF8String];
    v30 = *(NSObject **)(__UILogGetCategoryCachedImpl("HIDTransformer", &qword_1EB262660) + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_hidContext;
      id v32 = _UIStateString[v31->state];
      uint64_t v33 = v30;
      uint64_t v34 = [v32 UTF8String];
      *(_DWORD *)buf = 134218498;
      v55 = (__IOHIDEvent *)v31;
      __int16 v56 = 2080;
      uint64_t v57 = v34;
      __int16 v58 = 2080;
      uint64_t v59 = v29;
      _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_DEFAULT, "State machine: hidContext: %p; state: %s; events for event: %s",
        buf,
        0x20u);
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v35 = v19;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v46;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = [*(id *)(*((void *)&v45 + 1) + 8 * v39) unsignedIntegerValue];
        if (qword_1EB262680 != -1) {
          dispatch_once(&qword_1EB262680, &__block_literal_global_161_0);
        }
        handleEvent(&xmmword_1EB262690, self->_hidContext->state, v40, (uint64_t)self, (uint64_t *)&self->_hidContext->state);
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [v35 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v37);
  }

  self->_hidEvent = 0;
  v41 = self->_hidContext;
  self->_hidContext = 0;

  __int16 v42 = [(_UIHIDTransformer *)self drainOutputHIDEvents];

  return v42;
}

- (id)drainOutputHIDEvents
{
  v3 = (void *)[(NSMutableArray *)self->_hidEvents copy];
  [(NSMutableArray *)self->_hidEvents removeAllObjects];
  return v3;
}

- (void)addOutputHIDEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if (self->_hidContext->remoteTimestamp) {
      BKSHIDEventSetRemoteTimestamp();
    }
    [(NSMutableArray *)self->_hidEvents addObject:v5];
    id v4 = v5;
  }
}

- (_UIHIDTransformer)initWithRunLoop:(__CFRunLoop *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_UIHIDTransformer;
  id v4 = [(_UIHIDTransformer *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    hidEvents = v4->_hidEvents;
    v4->_hidEvents = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    hidContextByContextId = v4->_hidContextByContextId;
    v4->_hidContextByContextId = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v10 = _UIWindowDidDetachContextNotification;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37___UIHIDTransformer_initWithRunLoop___block_invoke;
    v13[3] = &unk_1E53044B8;
    id v15 = a3;
    int v14 = v4;
    id v11 = (id)[v9 addObserverForName:v10 object:0 queue:0 usingBlock:v13];
  }
  return v4;
}

- (void)pathCollection
{
  if (a1)
  {
    v2 = a1;
    uint64_t v3 = a1[1];
    if (!v3)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_pathCollection object:v2 file:@"_UIHIDTransformer.m" lineNumber:425 description:@"Attempting to access a path collection when no hidEvent is being processed"];

      uint64_t v3 = v2[1];
    }
    id v4 = *(void **)(v3 + 8);
    if (!v4)
    {
      id v4 = objc_opt_new();
      uint64_t v5 = v2[1];
      uint64_t v6 = *(void **)(v5 + 8);
      *(void *)(v5 + 8) = v4;
    }
    a1 = v4;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)scaleEventTracker
{
  if (a1)
  {
    v2 = a1;
    uint64_t v3 = a1[1];
    if (!v3)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_scaleEventTracker object:v2 file:@"_UIHIDTransformer.m" lineNumber:431 description:@"Attempting to access a scaleEventTracker when no hidEvent is being processed"];

      uint64_t v3 = v2[1];
    }
    id v4 = *(void **)(v3 + 16);
    if (!v4)
    {
      id v4 = objc_opt_new();
      uint64_t v5 = v2[1];
      uint64_t v6 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v4;
    }
    a1 = v4;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidContextByContextId, 0);
  objc_storeStrong((id *)&self->_hidEvents, 0);
  objc_storeStrong((id *)&self->_hidContext, 0);
}

@end