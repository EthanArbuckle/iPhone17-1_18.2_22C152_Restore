@interface UIPressesEvent
- (BOOL)_sendEventToGestureRecognizer:(id)a3;
- (NSSet)pressesForGestureRecognizer:(UIGestureRecognizer *)gesture;
- (NSString)description;
- (UIPress)_lastPreparedPress;
- (id)_allPresses;
- (id)_allWindows;
- (id)_cloneEvent;
- (id)_directionalPressWithStrongestForce;
- (id)_gestureRecognizersForWindow:(id)a3;
- (id)_init;
- (id)_pressesForGestureRecognizer:(id)a3 withPhase:(int64_t)a4;
- (id)_pressesForPhase:(int64_t)a3;
- (id)_pressesForResponder:(id)a3 withPhase:(int64_t)a4;
- (id)_pressesForWindow:(id)a3;
- (id)_respondersForWindow:(id)a3;
- (id)_terminalRegistrantsForPressType:(int64_t)a3;
- (int64_t)_modifierFlags;
- (int64_t)subtype;
- (int64_t)type;
- (void)_addGesturesForPress:(id)a3;
- (void)_addPress:(id)a3 forDelayedDelivery:(BOOL)a4;
- (void)_cancelComponents:(id)a3;
- (void)_registerForTerminalEvent:(id)a3;
- (void)_removeComponents:(id)a3;
- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4;
- (void)_removePress:(id)a3;
- (void)_unregisterForTerminalEvent:(id)a3;
- (void)set_lastPreparedPress:(id)a3;
@end

@implementation UIPressesEvent

- (id)_allPresses
{
  v2 = (void *)[(NSMutableSet *)self->_allPresses copy];
  return v2;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)UIPressesEvent;
  v2 = [(UIEvent *)&v6 _init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4 = (void *)v2[15];
    v2[15] = v3;
  }
  return v2;
}

- (int64_t)type
{
  return 3;
}

- (int64_t)subtype
{
  return 0;
}

- (id)_cloneEvent
{
  v7.receiver = self;
  v7.super_class = (Class)UIPressesEvent;
  id v3 = [(UIEvent *)&v7 _cloneEvent];
  uint64_t v4 = [(NSMutableSet *)self->_allPresses mutableCopy];
  v5 = (void *)v3[15];
  v3[15] = v4;

  return v3;
}

- (NSSet)pressesForGestureRecognizer:(UIGestureRecognizer *)gesture
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = gesture;
  v5 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v6 = [(UIPressesEvent *)self _allPresses];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 gestureRecognizers];
        int v13 = [v12 containsObject:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  return (NSSet *)v14;
}

- (id)_allWindows
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_allPresses;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "window", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int64_t)_modifierFlags
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->super._hasValidModifiers)
  {
    v13.receiver = self;
    v13.super_class = (Class)UIPressesEvent;
    return [(UIEvent *)&v13 _modifierFlags];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = self->_allPresses;
    uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      int64_t v2 = 0;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          v2 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "modifierFlags", (void)v9);
        }
        uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v5);
    }
    else
    {
      int64_t v2 = 0;
    }
  }
  return v2;
}

- (id)_pressesForWindow:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_allPresses;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "window", (void)v14);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_respondersForWindow:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = -[UIPressesEvent _pressesForWindow:](self, "_pressesForWindow:", v4, 0);
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
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) responder];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_pressesForPhase:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_allPresses;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "phase", (void)v12) == a3 && (objc_msgSend(v10, "isDelayed") & 1) == 0)
        {
          if (!v7)
          {
            uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
          }
          [v7 addObject:v10];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_pressesForResponder:(id)a3 withPhase:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = -[UIPressesEvent _pressesForPhase:](self, "_pressesForPhase:", a4, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    long long v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [v13 responder];

        if (v14 == v6)
        {
          if (!v10)
          {
            long long v10 = [MEMORY[0x1E4F1CA80] set];
          }
          [v10 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)_pressesForGestureRecognizer:(id)a3 withPhase:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = -[UIPressesEvent pressesForGestureRecognizer:](self, "pressesForGestureRecognizer:", v6, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    long long v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 phase] == a4)
        {
          if (!v10)
          {
            long long v10 = [MEMORY[0x1E4F1CA80] set];
          }
          [v10 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = -[UIPressesEvent _pressesForWindow:](self, "_pressesForWindow:", v4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) gestureRecognizers];
        if (v11)
        {
          if (!v8)
          {
            uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
          }
          [v8 addObjectsFromArray:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 _eventComponentType] != 1)
        {
          long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIPressesEvent.m", 211, @"Wrong component type for event: %@; component: %@",
            self,
            v13);
        }
        [v13 _removeGestureRecognizer:v7];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_addPress:(id)a3 forDelayedDelivery:(BOOL)a4
{
  id v6 = a3;
  [(NSMutableSet *)self->_allPresses addObject:v6];
  if (![v6 phase] && !a4) {
    [(UIPressesEvent *)self _addGesturesForPress:v6];
  }
}

- (void)_addGesturesForPress:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 responder];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = 0;
    do
    {
      if (objc_opt_respondsToSelector())
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = [v6 gestureRecognizers];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
              if ([v13 isEnabled]
                && [v13 state] <= 2
                && -[UIGestureRecognizer _shouldReceivePress:forPressesEvent:]((uint64_t)v13, (uint64_t)v4, (uint64_t)self))
              {
                if (!v7)
                {
                  id v7 = [MEMORY[0x1E4F1CA48] array];
                }
                [v7 addObject:v13];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v10);
        }

        if (_IsKindOfUIView((uint64_t)v6))
        {
          id v14 = v6;
          [v4 type];
          int v15 = [v14 deliversPressesForGesturesToSuperview];

          if (!v15) {
            break;
          }
        }
      }
      id v14 = [v6 nextResponder];

      id v6 = v14;
    }
    while (v14);
  }
  else
  {
    id v14 = 0;
    id v7 = 0;
  }
  long long v16 = (void *)[v7 copy];
  [v4 setGestureRecognizers:v16];
}

- (void)_removePress:(id)a3
{
  id v4 = a3;
  [v4 setResponder:0];
  [v4 setWindow:0];
  [(NSMutableSet *)self->_allPresses removeObject:v4];
}

- (id)_directionalPressWithStrongestForce
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v2 = [(UIPressesEvent *)self allPresses];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 _isDirectionalPress])
        {
          [v8 force];
          double v10 = v9;
          [v5 force];
          if (v10 > v11)
          {
            id v12 = v8;

            uint64_t v5 = v12;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(UIPressesEvent *)self allPresses];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ : %p presses: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)_registerForTerminalEvent:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIPressesEvent.m", 286, @"Invalid parameter not satisfying: %@", @"registrant" object file lineNumber description];

    id v5 = 0;
  }
  terminalEventRegistrants = self->_terminalEventRegistrants;
  if (!terminalEventRegistrants)
  {
    id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v8 = self->_terminalEventRegistrants;
    self->_terminalEventRegistrants = v7;

    id v5 = v10;
    terminalEventRegistrants = self->_terminalEventRegistrants;
  }
  [(NSHashTable *)terminalEventRegistrants addObject:v5];
}

- (void)_unregisterForTerminalEvent:(id)a3
{
}

- (id)_terminalRegistrantsForPressType:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_terminalEventRegistrants;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v11 = [v10 allowedPressTypes];
        id v12 = [NSNumber numberWithInteger:a3];
        int v13 = [v11 containsObject:v12];

        if (v13) {
          [v15 addObject:v10];
        }
      }
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v15;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 state] > 2)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v5 = [(UIPressesEvent *)self _pressesForGestureRecognizer:v4 withPhase:0];
    uint64_t v6 = [v5 count];
    BOOL v7 = v6 != 0;
    if (v6) {
      [v4 _componentsBegan:v5 withEvent:self];
    }
    uint64_t v8 = [(UIPressesEvent *)self _pressesForGestureRecognizer:v4 withPhase:1];

    if ([v8 count])
    {
      [v4 _componentsChanged:v8 withEvent:self];
      BOOL v7 = 1;
    }
    double v9 = [(UIPressesEvent *)self _pressesForGestureRecognizer:v4 withPhase:3];

    if ([v9 count])
    {
      [v4 _componentsEnded:v9 withEvent:self];
      BOOL v7 = 1;
    }
    id v10 = [(UIPressesEvent *)self _pressesForGestureRecognizer:v4 withPhase:4];

    if ([v10 count])
    {
      [v4 _componentsCancelled:v10 withEvent:self];
      BOOL v7 = 1;
    }
  }
  return v7;
}

- (void)_removeComponents:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 _eventComponentType] != 1)
        {
          double v11 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIPressesEvent.m", 345, @"Unexpected event component type: %ld", objc_msgSend(v10, "_eventComponentType"));
        }
        [(UIPressesEvent *)self _removePress:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_cancelComponents:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __36__UIPressesEvent__cancelComponents___block_invoke;
  v50[3] = &unk_1E5304230;
  v50[4] = self;
  v50[5] = a2;
  v32 = [v5 objectsPassingTest:v50];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v13 = [v12 phase];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __36__UIPressesEvent__cancelComponents___block_invoke_2;
        aBlock[3] = &unk_1E52D9CD0;
        aBlock[4] = v12;
        aBlock[5] = v13;
        long long v14 = _Block_copy(aBlock);
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v9);
  }

  [(id)UIApp _cancelViewProcessingOfTouchesOrPresses:v7 withEvent:self sendingCancelToViewsOfTouchesOrPresses:v32];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * j) + 16))();
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v17);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = v7;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v37 + 1) + 8 * k);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        v26 = [v25 gestureRecognizers];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v51 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v34;
          do
          {
            for (uint64_t m = 0; m != v28; ++m)
            {
              if (*(void *)v34 != v29) {
                objc_enumerationMutation(v26);
              }
              -[UIGestureRecognizer _pressWasCancelled:](*(void *)(*((void *)&v33 + 1) + 8 * m), v25);
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v51 count:16];
          }
          while (v28);
        }

        v31 = [(id)UIApp _gestureDelayedEventComponentDispatcher];
        -[UIGestureDelayedEventComponentDispatcher removePress:]((uint64_t)v31, v25);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v52 count:16];
    }
    while (v22);
  }
}

BOOL __36__UIPressesEvent__cancelComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _eventComponentType] != 1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"UIPressesEvent.m", 353, @"Unexpected event component type: %ld", objc_msgSend(v3, "_eventComponentType"));
  }
  id v4 = [(id)UIApp _gestureDelayedEventComponentDispatcher];
  BOOL v5 = !-[UIGestureDelayedEventComponentDispatcher pressesBeganWasDelayedForPress:]((uint64_t)v4, v3)
    && [v3 phase] != 0;

  return v5;
}

uint64_t __36__UIPressesEvent__cancelComponents___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPhase:*(void *)(a1 + 40)];
}

- (UIPress)_lastPreparedPress
{
  return self->_lastPreparedPress;
}

- (void)set_lastPreparedPress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPreparedPress, 0);
  objc_storeStrong((id *)&self->_terminalEventRegistrants, 0);
  objc_storeStrong((id *)&self->_allPresses, 0);
}

@end