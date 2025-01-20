@interface VKCompoundAnimation
- (BOOL)running;
- (BOOL)runsForever;
- (BOOL)timed;
- (NSMutableArray)animations;
- (VKCompoundAnimation)initWithAnimations:(id)a3;
- (double)duration;
- (id)groupStepHandler;
- (void)onTimerFired:(double)a3;
- (void)pause;
- (void)resume;
- (void)setDuration:(double)a3;
- (void)setGroupStepHandler:(id)a3;
- (void)setRunsForever:(BOOL)a3;
- (void)startWithRunner:(id)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation VKCompoundAnimation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong(&self->_groupStepHandler, 0);
}

- (void)setGroupStepHandler:(id)a3
{
}

- (id)groupStepHandler
{
  return self->_groupStepHandler;
}

- (NSMutableArray)animations
{
  return self->_animations;
}

- (void)onTimerFired:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VKCompoundAnimation;
  -[VKAnimation onTimerFired:](&v17, sel_onTimerFired_);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_animations;
  char v6 = 0;
  uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = *(void *)(v10 + 40);
        if (v11 == 1)
        {
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "onTimerFired:", a3, (void)v13);
          uint64_t v11 = *(void *)(v10 + 40);
        }
        v6 |= (unint64_t)(v11 - 1) < 2;
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  groupStepHandler = (void (**)(void))self->_groupStepHandler;
  if (groupStepHandler) {
    groupStepHandler[2]();
  }
  if ((v6 & 1) == 0 && ![(VKCompoundAnimation *)self runsForever]) {
    self->super._state = 3;
  }
}

- (void)stopAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VKCompoundAnimation;
  -[VKAnimation stopAnimation:](&v14, sel_stopAnimation_);
  id groupStepHandler = self->_groupStepHandler;
  self->_id groupStepHandler = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v6 = self->_animations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "stopAnimation:", v3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (VKCompoundAnimation)initWithAnimations:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKCompoundAnimation;
  v5 = [(VKCompoundAnimation *)&v16 init];
  if (v5)
  {
    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    animations = v5->_animations;
    v5->_animations = v6;

    long long v15 = (id *)&v17;
    id v8 = v4;
    if (v8)
    {
      uint64_t v9 = v8;
      do
      {
        long long v10 = [(VKCompoundAnimation *)v5 animations];
        [v10 addObject:v9];

        long long v11 = v15++;
        id v12 = *v11;

        uint64_t v9 = v12;
      }
      while (v12);
    }
    long long v13 = v5;
  }

  return v5;
}

- (void)resume
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VKCompoundAnimation;
  [(VKAnimation *)&v11 resume];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  BOOL v3 = self->_animations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "resume", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)pause
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VKCompoundAnimation;
  [(VKAnimation *)&v11 pause];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  BOOL v3 = self->_animations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "pause", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)startWithRunner:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VKCompoundAnimation;
  [(VKAnimation *)&v12 startWithRunner:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v4 = self->_animations;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        *(void *)(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 40) = 1;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)timed
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_animations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "timed", (void)v8) & 1) == 0)
        {
          BOOL v6 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (void)setDuration:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_animations;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setDuration:", a3, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (double)duration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_animations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    double v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "duration", (void)v9);
        double v5 = fmax(v7, v5);
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setRunsForever:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_animations;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setRunsForever:", v3, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)runsForever
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_animations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "runsForever", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)running
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_animations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "running", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

@end