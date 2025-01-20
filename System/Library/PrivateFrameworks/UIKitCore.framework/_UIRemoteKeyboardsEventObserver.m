@interface _UIRemoteKeyboardsEventObserver
- (BOOL)_hasTextAlternativesForTouch:(id)a3;
- (BOOL)_isTrackingPencilTouch;
- (BOOL)_shouldTrackTouch:(id)a3;
- (BOOL)hasTextInputResponder;
- (BOOL)keyboardIsVisible;
- (_UIRemoteKeyboardsEventObserver)init;
- (_UIRemoteKeyboardsEventObserverDelegate)delegate;
- (int64_t)_preferredEventSourceForTouch:(id)a3 tracking:(id)a4 shouldUpdateOut:(BOOL *)a5;
- (void)_cancelTrackingForTouch:(id)a3;
- (void)_endTrackingForTouch:(id)a3;
- (void)_gestureRecognizer:(id)a3 didTransitionToState:(int64_t)a4;
- (void)_invalidateTrackingForTouch:(id)a3;
- (void)_markTrackingForTouch:(id)a3 withGesture:(id)a4;
- (void)_startTrackingForTouch:(id)a3;
- (void)_trackTouch:(id)a3;
- (void)_updateTrackingForTouch:(id)a3;
- (void)dealloc;
- (void)peekApplicationEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasTextInputResponder:(BOOL)a3;
- (void)setKeyboardIsVisible:(BOOL)a3;
- (void)textInputResponderDidChange:(id)a3;
@end

@implementation _UIRemoteKeyboardsEventObserver

- (void)setDelegate:(id)a3
{
}

- (_UIRemoteKeyboardsEventObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIRemoteKeyboardsEventObserver;
  v2 = [(_UIRemoteKeyboardsEventObserver *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_textInputResponderDidChange_ name:@"UITextInputResponderDidChangeNotification" object:0];
  }
  return v2;
}

- (void)_gestureRecognizer:(id)a3 didTransitionToState:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    if ([v6 _isGestureType:8])
    {
      long long v24 = 0uLL;
      long long v25 = 0uLL;
      long long v22 = 0uLL;
      long long v23 = 0uLL;
      v8 = [v7 _allActiveTouches];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (![v13 type]) {
              [(_UIRemoteKeyboardsEventObserver *)self _invalidateTrackingForTouch:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v10);
      }
    }
    else
    {
      long long v20 = 0uLL;
      long long v21 = 0uLL;
      *((void *)&v18 + 1) = 0;
      long long v19 = 0uLL;
      v8 = objc_msgSend(v7, "_allActiveTouches", 0);
      uint64_t v14 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v8);
            }
            [(_UIRemoteKeyboardsEventObserver *)self _markTrackingForTouch:*(void *)(*((void *)&v18 + 1) + 8 * j) withGesture:v7];
          }
          uint64_t v15 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v15);
      }
    }
  }
}

- (void)setKeyboardIsVisible:(BOOL)a3
{
  self->_keyboardIsVisible = a3;
}

- (void)peekApplicationEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  if (![v4 type])
  {
    objc_super v5 = -[UITabBarControllerSidebar _actualFooterContentConfiguration](v4);
    char v6 = [v5 containsObject:self];

    if ((v6 & 1) == 0) {
      -[UIEvent _addEventObserver:]((uint64_t)v4, self);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = objc_msgSend(v4, "allTouches", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [(_UIRemoteKeyboardsEventObserver *)self _trackTouch:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)_trackTouch:(id)a3
{
  id v11 = a3;
  switch([v11 phase])
  {
    case 0:
      if ([(_UIRemoteKeyboardsEventObserver *)self _shouldTrackTouch:v11]) {
        [(_UIRemoteKeyboardsEventObserver *)self _startTrackingForTouch:v11];
      }
      break;
    case 1:
      [(_UIRemoteKeyboardsEventObserver *)self _updateTrackingForTouch:v11];
      break;
    case 3:
      [(_UIRemoteKeyboardsEventObserver *)self _endTrackingForTouch:v11];
      break;
    case 4:
      [(_UIRemoteKeyboardsEventObserver *)self _cancelTrackingForTouch:v11];
      break;
    default:
      break;
  }
  if ([v11 type] == 2 && (!objc_msgSend(v11, "phase") || objc_msgSend(v11, "phase") == 1))
  {
    v4 = [v11 window];
    if ([v4 _isTextEffectsWindow])
    {
      objc_super v5 = [v11 view];
      char v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v7 = [v6 inputViews];
      uint64_t v8 = [v7 inputAccessoryView];
      int v9 = [v5 isDescendantOfView:v8];

      if (!v9) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v10 = +[UIKeyboardImpl activeInstance];
    [v10 updateIdleDetection:3];
  }
LABEL_15:
}

- (BOOL)_shouldTrackTouch:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 view];
  char v6 = [v5 _responderWindow];

  if ([v6 _appearsInLoupe])
  {
    if ([v6 _isHostedInAnotherProcess]) {
      int v7 = [v6 _isTextEffectsWindow] ^ 1;
    }
    else {
      LOBYTE(v7) = [v6 _canAffectStatusBarAppearance];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  if ([v4 type] == 2) {
    LOBYTE(v8) = 1;
  }
  else {
    int v8 = ![(_UIRemoteKeyboardsEventObserver *)self _isTrackingPencilTouch];
  }
  char v9 = v7 & v8;

  return v9;
}

- (BOOL)_isTrackingPencilTouch
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  touchTracker = self->_touchTracker;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57___UIRemoteKeyboardsEventObserver__isTrackingPencilTouch__block_invoke;
  v5[3] = &unk_1E52EBA58;
  v5[4] = &v6;
  [(NSMutableDictionary *)touchTracker enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_endTrackingForTouch:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "_touchIdentifier"));
  uint64_t v6 = [(NSMutableDictionary *)self->_touchTracker objectForKey:v5];
  int v7 = v6;
  if (v6 && [v6 valid])
  {
    char v19 = 0;
    int64_t v8 = [(_UIRemoteKeyboardsEventObserver *)self _preferredEventSourceForTouch:v4 tracking:v7 shouldUpdateOut:&v19];
    if (v8 == 3 && v19 != 0)
    {
      long long v12 = [(_UIRemoteKeyboardsEventObserver *)self delegate];
      long long v13 = v12;
      uint64_t v14 = 3;
LABEL_16:
      [v12 updateEventSource:v14 options:7];

      goto LABEL_17;
    }
    if (v8) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v19 == 0;
    }
    if (!v10)
    {
      if ([v7 beganGestureClass]) {
        goto LABEL_26;
      }
      uint64_t v15 = [v4 view];
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        do
        {
          uint64_t v17 = v16;
          uint64_t v18 = v16[12];
          uint64_t v16 = [v16 superview];
        }
        while ((v18 & 0x10) == 0 && v16);

        if ((v18 & 0x10) != 0)
        {
LABEL_26:
          [v7 largestObservedRadius];
          if (v11 <= 75.0
            && ![(_UIRemoteKeyboardsEventObserver *)self _hasTextAlternativesForTouch:v4])
          {
            long long v12 = [(_UIRemoteKeyboardsEventObserver *)self delegate];
            long long v13 = v12;
            uint64_t v14 = 0;
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_17:
  [(NSMutableDictionary *)self->_touchTracker removeObjectForKey:v5];
}

- (void)_startTrackingForTouch:(id)a3
{
  id v4 = a3;
  if (!self->_touchTracker)
  {
    objc_super v5 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    touchTracker = self->_touchTracker;
    self->_touchTracker = v5;
  }
  int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "_touchIdentifier"));
  int64_t v8 = [(NSMutableDictionary *)self->_touchTracker objectForKey:v7];
  if (!v8)
  {
    int64_t v8 = objc_alloc_init(_UIRKEOTouchTracking);
    -[_UIRKEOTouchTracking setType:](v8, "setType:", [v4 type]);
    [(NSMutableDictionary *)self->_touchTracker setObject:v8 forKey:v7];
  }
  [(_UIRKEOTouchTracking *)v8 setValid:1];
  [v4 majorRadius];
  -[_UIRKEOTouchTracking setLargestObservedRadius:](v8, "setLargestObservedRadius:");
  if (![(_UIRemoteKeyboardsEventObserver *)self keyboardIsVisible]
    && ![(_UIRemoteKeyboardsEventObserver *)self hasTextInputResponder])
  {
    char v12 = 0;
    int64_t v9 = [(_UIRemoteKeyboardsEventObserver *)self _preferredEventSourceForTouch:v4 tracking:v8 shouldUpdateOut:&v12];
    if (v12)
    {
      int64_t v10 = v9;
      double v11 = [(_UIRemoteKeyboardsEventObserver *)self delegate];
      [v11 updateEventSource:v10 options:7];
    }
  }
}

- (int64_t)_preferredEventSourceForTouch:(id)a3 tracking:(id)a4 shouldUpdateOut:(BOOL *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [v8 view];
  if (objc_opt_respondsToSelector())
  {
    int64_t v11 = [v10 _interactionTextInputSource];
    char v12 = 1;
    goto LABEL_9;
  }
  if ((objc_msgSend((id)objc_msgSend(v9, "beganGestureClass"), "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || [(_UIRemoteKeyboardsEventObserver *)self hasTextInputResponder]
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    char v12 = 0;
LABEL_8:
    int64_t v11 = 0;
    goto LABEL_9;
  }
  char v12 = v10 != 0;
  if ([v8 type] == 2 && v10)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = [v10 gestureRecognizers];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v21 = v9;
      uint64_t v17 = *(void *)v23;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          char v19 = [*(id *)(*((void *)&v22 + 1) + 8 * v18) delegate];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            char v12 = 0;
            goto LABEL_28;
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      char v12 = 1;
LABEL_28:
      id v9 = v21;
    }
    else
    {
      char v12 = 1;
    }

    int64_t v11 = 3;
  }
  else
  {
    if ([v8 phase]) {
      goto LABEL_8;
    }
    char v12 = [(id)UIApp _isSpringBoard];
    if ([v8 type] == 2) {
      int64_t v11 = 3;
    }
    else {
      int64_t v11 = 0;
    }
  }
LABEL_9:
  if (a5) {
    *a5 = v12;
  }

  return v11;
}

- (BOOL)hasTextInputResponder
{
  return self->_hasTextInputResponder;
}

- (BOOL)keyboardIsVisible
{
  return self->_keyboardIsVisible;
}

- (_UIRemoteKeyboardsEventObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIRemoteKeyboardsEventObserverDelegate *)WeakRetained;
}

- (void)_markTrackingForTouch:(id)a3 withGesture:(id)a4
{
  uint64_t v6 = NSNumber;
  id v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [(NSMutableDictionary *)self->_touchTracker objectForKey:v10];
  uint64_t v9 = objc_opt_class();

  [v8 setBeganGestureClass:v9];
}

- (void)_updateTrackingForTouch:(id)a3
{
  id v10 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "_touchIdentifier"));
  objc_super v5 = [(NSMutableDictionary *)self->_touchTracker objectForKey:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 valid])
    {
      [v10 majorRadius];
      double v8 = v7;
      [v6 largestObservedRadius];
      if (v8 > v9)
      {
        [v10 majorRadius];
        objc_msgSend(v6, "setLargestObservedRadius:");
      }
    }
  }
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UITextInputResponderDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIRemoteKeyboardsEventObserver;
  [(_UIRemoteKeyboardsEventObserver *)&v4 dealloc];
}

- (void)textInputResponderDidChange:(id)a3
{
  id v5 = [a3 userInfo];
  objc_super v4 = [v5 objectForKey:@"UITextInputResponderCapabilitiesChangedInputResponderKey"];
  [(_UIRemoteKeyboardsEventObserver *)self setHasTextInputResponder:v4 != 0];
}

- (BOOL)_hasTextAlternativesForTouch:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = [v3 view];
  [v3 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v9 = objc_msgSend(v3, "view", 0);
  id v10 = [v9 interactions];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v14, "_hasTextAlternativesAtLocation:", v6, v8) & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v11;
}

- (void)_cancelTrackingForTouch:(id)a3
{
  objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_touchTracker removeObjectForKey:v4];
}

- (void)_invalidateTrackingForTouch:(id)a3
{
  objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(NSMutableDictionary *)self->_touchTracker objectForKey:v5];
  [v4 setValid:0];
}

- (void)setHasTextInputResponder:(BOOL)a3
{
  self->_hasTextInputResponder = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchTracker, 0);
}

@end