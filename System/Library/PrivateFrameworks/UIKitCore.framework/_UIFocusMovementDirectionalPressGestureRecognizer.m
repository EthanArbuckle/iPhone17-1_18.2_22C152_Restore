@interface _UIFocusMovementDirectionalPressGestureRecognizer
- (id)_filterPressesByPressSource:(id)a3;
- (unint64_t)focusHeadingForPresses:(id)a3;
- (unint64_t)pressSource;
- (void)configureDefaults;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)setPressSource:(unint64_t)a3;
@end

@implementation _UIFocusMovementDirectionalPressGestureRecognizer

- (void)configureDefaults
{
  [(UIGestureRecognizer *)self setAllowedPressTypes:&unk_1ED3F1330];
  [(_UIFocusMovementPressGestureRecognizer *)self setShouldRepeat:1];
}

- (unint64_t)focusHeadingForPresses:(id)a3
{
  v3 = [a3 lastObject];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 type];
    unint64_t v6 = 1;
    switch(v5)
    {
      case 0:
        break;
      case 1:
        unint64_t v6 = 2;
        break;
      case 2:
        unint64_t v6 = 4;
        break;
      case 3:
        unint64_t v6 = 8;
        break;
      default:
        uint64_t v7 = 2;
        if (v5 != 31) {
          uint64_t v7 = 0;
        }
        if (v5 != 30) {
          unint64_t v6 = v7;
        }
        break;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_filterPressesByPressSource:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_UIFocusMovementDirectionalPressGestureRecognizer *)self pressSource];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "_source", (void)v16) != v5)
        {
          if (!v9) {
            v9 = (void *)[v6 mutableCopy];
          }
          [v9 removeObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (v9) {
    v13 = v9;
  }
  else {
    v13 = v6;
  }
  id v14 = v13;

  return v14;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[v6 mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v14 _isAnalogStickPress])
        {
          [(UIGestureRecognizer *)self ignorePress:v14 forEvent:v7];
          [v8 removeObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  if ([v8 count] && (*(unsigned char *)&self->_flags & 1) == 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      while (2)
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          if ([v20 _source])
          {
            -[_UIFocusMovementDirectionalPressGestureRecognizer setPressSource:](self, "setPressSource:", [v20 _source]);
            goto LABEL_22;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_22:

    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v21 = [(_UIFocusMovementDirectionalPressGestureRecognizer *)self _filterPressesByPressSource:v8];
  v22.receiver = self;
  v22.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  [(_UIFocusMovementPressGestureRecognizer *)&v22 pressesBegan:v21 withEvent:v7];
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = [(_UIFocusMovementDirectionalPressGestureRecognizer *)self _filterPressesByPressSource:a3];
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  [(_UIFocusMovementPressGestureRecognizer *)&v8 pressesChanged:v7 withEvent:v6];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = [(_UIFocusMovementDirectionalPressGestureRecognizer *)self _filterPressesByPressSource:a3];
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  [(_UIFocusMovementPressGestureRecognizer *)&v8 pressesEnded:v7 withEvent:v6];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = [(_UIFocusMovementDirectionalPressGestureRecognizer *)self _filterPressesByPressSource:a3];
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  [(_UIFocusMovementPressGestureRecognizer *)&v8 pressesCancelled:v7 withEvent:v6];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusMovementDirectionalPressGestureRecognizer;
  [(_UIFocusMovementPressGestureRecognizer *)&v3 reset];
  [(_UIFocusMovementDirectionalPressGestureRecognizer *)self setPressSource:0];
  *(unsigned char *)&self->_flags &= ~1u;
}

- (unint64_t)pressSource
{
  return self->_pressSource;
}

- (void)setPressSource:(unint64_t)a3
{
  self->_pressSource = a3;
}

@end