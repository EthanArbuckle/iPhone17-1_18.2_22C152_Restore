@interface _UIFocusLinearMovementDebugGestureRecognizer
- (BOOL)isGroupMode;
- (_UIFocusLinearMovementDebugGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (_UIFocusLinearMovementDebugGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 allowsGroupMode:(BOOL)a5;
- (void)_update;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)setGroupMode:(BOOL)a3;
@end

@implementation _UIFocusLinearMovementDebugGestureRecognizer

- (_UIFocusLinearMovementDebugGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  return [(_UIFocusLinearMovementDebugGestureRecognizer *)self initWithTarget:a3 action:a4 allowsGroupMode:0];
}

- (_UIFocusLinearMovementDebugGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 allowsGroupMode:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusLinearMovementDebugGestureRecognizer;
  v6 = [(UIGestureRecognizer *)&v11 initWithTarget:a3 action:a4];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    presses = v6->_presses;
    v6->_presses = (NSMutableSet *)v7;

    if (v5)
    {
      v9 = [&unk_1ED3F1300 arrayByAddingObjectsFromArray:&unk_1ED3F1318];
    }
    else
    {
      v9 = &unk_1ED3F1300;
    }
    [(UIGestureRecognizer *)v6 setAllowedPressTypes:v9];
    [(UIGestureRecognizer *)v6 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(UIGestureRecognizer *)v6 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v6 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v6 setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)v6 _setAcceptsFailureRequiments:0];
    v6->_allowsGroupMode = v5;
  }
  return v6;
}

- (void)_update
{
  v2 = self;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v3 = 288;
  v4 = self->_presses;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v22 = v2;
    id obj = v4;
    uint64_t v21 = 288;
    LOBYTE(v7) = 0;
    char v8 = 0;
    LOBYTE(v4) = 0;
    uint64_t v24 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_super v11 = objc_msgSend(v10, "key", v21);
        int v12 = [v11 modifierFlags];

        v13 = [v10 key];
        int v14 = [v13 modifierFlags];

        v15 = [v10 key];
        v16 = [v15 charactersIgnoringModifiers];
        if ([v16 length])
        {
          char v8 = 1;
        }
        else
        {
          v17 = [v10 key];
          v8 |= ([v17 modifierFlags] & 0xFFFFFFFFFFF3FFFFLL) != 0;
        }
        LODWORD(v4) = v4 & 1 | ((v12 & 0x80000) != 0);
        uint64_t v7 = v7 & 1u | ((v14 & 0x40000) != 0);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);

    uint64_t v3 = v21;
    v2 = v22;
    if (v4)
    {
      if (v7)
      {
        if (!(!v22->_allowsGroupMode | v8 & 1)) {
          goto LABEL_20;
        }
      }
      else if ((v8 & 1) == 0)
      {
LABEL_20:
        [(_UIFocusLinearMovementDebugGestureRecognizer *)v22 setGroupMode:v7];
        BOOL v18 = [(UIGestureRecognizer *)v22 state] == UIGestureRecognizerStatePossible;
        uint64_t v19 = 1;
        goto LABEL_21;
      }
    }
  }
  else
  {
  }
  if ([(UIGestureRecognizer *)v2 state] == UIGestureRecognizerStatePossible)
  {
    uint64_t v20 = 5;
    goto LABEL_24;
  }
  BOOL v18 = [*(id *)((char *)&v2->super.super.isa + v3) count] == 0;
  uint64_t v19 = 3;
LABEL_21:
  if (v18) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v19 + 1;
  }
LABEL_24:
  [(UIGestureRecognizer *)v2 setState:v20];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSMutableSet *)self->_presses addObject:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(_UIFocusLinearMovementDebugGestureRecognizer *)self _update];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSMutableSet *)self->_presses removeObject:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(_UIFocusLinearMovementDebugGestureRecognizer *)self _update];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSMutableSet *)self->_presses removeObject:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(_UIFocusLinearMovementDebugGestureRecognizer *)self _update];
}

- (void)reset
{
}

- (BOOL)isGroupMode
{
  return self->_groupMode;
}

- (void)setGroupMode:(BOOL)a3
{
  self->_groupMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presses, 0);
  objc_storeStrong((id *)&self->_press, 0);
}

@end