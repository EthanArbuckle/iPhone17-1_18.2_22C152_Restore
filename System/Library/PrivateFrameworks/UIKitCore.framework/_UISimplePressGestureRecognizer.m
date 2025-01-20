@interface _UISimplePressGestureRecognizer
- (NSArray)triggers;
- (NSValue)activeTrigger;
- (UIDelayedAction)delayedAction;
- (_UISimplePressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_begin;
- (void)_cancelOrFail;
- (void)_endOrFail;
- (void)dealloc;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)setDelayedAction:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _UISimplePressGestureRecognizer

- (void)setTriggers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_triggers, a3);
  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        if (v12)
        {
          [v12 _UIPressTriggerValue];
          uint64_t v13 = v16;
        }
        else
        {
          uint64_t v13 = 0;
        }
        v14 = [NSNumber numberWithInteger:v13];
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v15.receiver = self;
  v15.super_class = (Class)_UISimplePressGestureRecognizer;
  [(UIGestureRecognizer *)&v15 setAllowedPressTypes:v6];
}

- (_UISimplePressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UISimplePressGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  id v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)_UISimplePressGestureRecognizer;
    [(UIGestureRecognizer *)&v7 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
  }
  return v5;
}

- (void)dealloc
{
  [(UIDelayedAction *)self->_delayedAction cancel];
  delayedAction = self->_delayedAction;
  self->_delayedAction = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UISimplePressGestureRecognizer;
  [(UIGestureRecognizer *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_activeTrigger, 0);
  objc_storeStrong((id *)&self->_delayedAction, 0);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_activeTrigger)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v6);
          }
          [(UIGestureRecognizer *)self ignorePress:*(void *)(*((void *)&v28 + 1) + 8 * i) forEvent:v7];
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }
  }
  else if ((unint64_t)[v6 count] < 2)
  {
    v12 = [v6 anyObject];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(_UISimplePressGestureRecognizer *)self triggers];
    uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        uint64_t v16 = 0;
        uint64_t v22 = v14;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(obj);
          }
          long long v17 = *(void **)(*((void *)&v24 + 1) + 8 * v16);
          if (v17) {
            [v17 _UIPressTriggerValue];
          }
          if (![v12 type])
          {
            long long v18 = [v12 key];
            uint64_t v19 = [v18 modifierFlags];

            uint64_t v14 = v22;
            if (!v19)
            {
              objc_storeStrong((id *)&self->_activeTrigger, v17);
              if (fabs(0.0) >= 2.22044605e-16)
              {
                long long v20 = [[UIDelayedAction alloc] initWithTarget:self action:sel__begin userInfo:0 delay:0.0];
                delayedAction = self->_delayedAction;
                self->_delayedAction = v20;
              }
              else
              {
                [(_UISimplePressGestureRecognizer *)self _begin];
              }

              goto LABEL_28;
            }
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    [(_UISimplePressGestureRecognizer *)self _endOrFail];
LABEL_28:
  }
  else
  {
    [(_UISimplePressGestureRecognizer *)self _endOrFail];
  }
}

- (void)reset
{
  [(UIDelayedAction *)self->_delayedAction cancel];
  delayedAction = self->_delayedAction;
  self->_delayedAction = 0;

  activeTrigger = self->_activeTrigger;
  self->_activeTrigger = 0;
}

- (void)_begin
{
}

- (void)_endOrFail
{
  if ([(UIGestureRecognizer *)self state] <= UIGestureRecognizerStateChanged)
  {
    if ([(UIGestureRecognizer *)self state]) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 5;
    }
    [(UIGestureRecognizer *)self setState:v3];
  }
  activeTrigger = self->_activeTrigger;
  self->_activeTrigger = 0;
}

- (void)_cancelOrFail
{
  if ([(UIGestureRecognizer *)self state] <= UIGestureRecognizerStateChanged)
  {
    if ([(UIGestureRecognizer *)self state]) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = 5;
    }
    [(UIGestureRecognizer *)self setState:v3];
  }
  activeTrigger = self->_activeTrigger;
  self->_activeTrigger = 0;
}

- (UIDelayedAction)delayedAction
{
  return self->_delayedAction;
}

- (void)setDelayedAction:(id)a3
{
}

- (NSValue)activeTrigger
{
  return self->_activeTrigger;
}

- (NSArray)triggers
{
  return self->_triggers;
}

@end