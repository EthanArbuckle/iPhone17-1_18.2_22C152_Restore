@interface SignpostAnimationAccumulatedState
- (NSMutableArray)allClientDrawableIntervals;
- (NSMutableArray)allCommitIntervals;
- (NSMutableArray)allContributedFrameLifetimes;
- (NSMutableArray)allFrameLatencies;
- (NSMutableArray)allFrameLifetimes;
- (NSMutableArray)allHIDLatencies;
- (NSMutableArray)allRenders;
- (NSMutableArray)allSystemwideClientDrawableIntervals;
- (NSMutableArray)allSystemwideCommitIntervals;
- (NSMutableArray)allTransactionLifetimes;
- (NSMutableArray)compositorIntervals;
- (NSMutableArray)longClientDrawableIntervals;
- (NSMutableArray)longCommitIntervals;
- (NSMutableArray)longContributedFrameLifetimes;
- (NSMutableArray)longFrameLatencies;
- (NSMutableArray)longFrameLifetimes;
- (NSMutableArray)longHIDLatencies;
- (NSMutableArray)longRenders;
- (NSMutableArray)longSystemwideClientDrawableIntervals;
- (NSMutableArray)longSystemwideCommitIntervals;
- (NSMutableArray)longTransactionLifetimes;
- (SignpostAnimationAccumulatedState)initWithAnimationBeginEvent:(id)a3 shouldTrackComposites:(BOOL)a4;
- (SignpostEvent)animationBeginEvent;
- (void)_handleClientDrawableInterval:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5;
- (void)_handleCommitInterval:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5;
- (void)_handleFrameLatency:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5;
- (void)_handleFrameLifetime:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5;
- (void)_handleHIDLatency:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5;
- (void)_handleRenderServerRender:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5;
- (void)_handleTransactionLifetimeInterval:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5;
- (void)addCompositorInterval:(id)a3;
@end

@implementation SignpostAnimationAccumulatedState

- (SignpostAnimationAccumulatedState)initWithAnimationBeginEvent:(id)a3 shouldTrackComposites:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SignpostAnimationAccumulatedState;
  v8 = [(SignpostAnimationAccumulatedState *)&v52 init];
  if (v8)
  {
    if (v4)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      compositorIntervals = v8->_compositorIntervals;
      v8->_compositorIntervals = (NSMutableArray *)v9;
    }
    objc_storeStrong((id *)&v8->_animationBeginEvent, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    longCommitIntervals = v8->_longCommitIntervals;
    v8->_longCommitIntervals = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    allCommitIntervals = v8->_allCommitIntervals;
    v8->_allCommitIntervals = (NSMutableArray *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    longSystemwideCommitIntervals = v8->_longSystemwideCommitIntervals;
    v8->_longSystemwideCommitIntervals = (NSMutableArray *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    allSystemwideCommitIntervals = v8->_allSystemwideCommitIntervals;
    v8->_allSystemwideCommitIntervals = (NSMutableArray *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    longClientDrawableIntervals = v8->_longClientDrawableIntervals;
    v8->_longClientDrawableIntervals = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    allClientDrawableIntervals = v8->_allClientDrawableIntervals;
    v8->_allClientDrawableIntervals = (NSMutableArray *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    longSystemwideClientDrawableIntervals = v8->_longSystemwideClientDrawableIntervals;
    v8->_longSystemwideClientDrawableIntervals = (NSMutableArray *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    allSystemwideClientDrawableIntervals = v8->_allSystemwideClientDrawableIntervals;
    v8->_allSystemwideClientDrawableIntervals = (NSMutableArray *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
    allTransactionLifetimes = v8->_allTransactionLifetimes;
    v8->_allTransactionLifetimes = (NSMutableArray *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
    longTransactionLifetimes = v8->_longTransactionLifetimes;
    v8->_longTransactionLifetimes = (NSMutableArray *)v29;

    uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
    longFrameLatencies = v8->_longFrameLatencies;
    v8->_longFrameLatencies = (NSMutableArray *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
    allFrameLatencies = v8->_allFrameLatencies;
    v8->_allFrameLatencies = (NSMutableArray *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
    longHIDLatencies = v8->_longHIDLatencies;
    v8->_longHIDLatencies = (NSMutableArray *)v35;

    uint64_t v37 = [MEMORY[0x1E4F1CA48] array];
    allHIDLatencies = v8->_allHIDLatencies;
    v8->_allHIDLatencies = (NSMutableArray *)v37;

    uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
    longRenders = v8->_longRenders;
    v8->_longRenders = (NSMutableArray *)v39;

    uint64_t v41 = [MEMORY[0x1E4F1CA48] array];
    allRenders = v8->_allRenders;
    v8->_allRenders = (NSMutableArray *)v41;

    uint64_t v43 = [MEMORY[0x1E4F1CA48] array];
    longFrameLifetimes = v8->_longFrameLifetimes;
    v8->_longFrameLifetimes = (NSMutableArray *)v43;

    uint64_t v45 = [MEMORY[0x1E4F1CA48] array];
    allFrameLifetimes = v8->_allFrameLifetimes;
    v8->_allFrameLifetimes = (NSMutableArray *)v45;

    uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
    longContributedFrameLifetimes = v8->_longContributedFrameLifetimes;
    v8->_longContributedFrameLifetimes = (NSMutableArray *)v47;

    uint64_t v49 = [MEMORY[0x1E4F1CA48] array];
    allContributedFrameLifetimes = v8->_allContributedFrameLifetimes;
    v8->_allContributedFrameLifetimes = (NSMutableArray *)v49;
  }
  return v8;
}

- (NSMutableArray)longSystemwideCommitIntervals
{
  return self->_longSystemwideCommitIntervals;
}

- (NSMutableArray)allHIDLatencies
{
  return self->_allHIDLatencies;
}

- (NSMutableArray)longHIDLatencies
{
  return self->_longHIDLatencies;
}

- (NSMutableArray)longFrameLatencies
{
  return self->_longFrameLatencies;
}

- (NSMutableArray)longCommitIntervals
{
  return self->_longCommitIntervals;
}

- (NSMutableArray)longTransactionLifetimes
{
  return self->_longTransactionLifetimes;
}

- (NSMutableArray)longSystemwideClientDrawableIntervals
{
  return self->_longSystemwideClientDrawableIntervals;
}

- (NSMutableArray)longClientDrawableIntervals
{
  return self->_longClientDrawableIntervals;
}

- (NSMutableArray)allTransactionLifetimes
{
  return self->_allTransactionLifetimes;
}

- (NSMutableArray)allSystemwideClientDrawableIntervals
{
  return self->_allSystemwideClientDrawableIntervals;
}

- (NSMutableArray)allClientDrawableIntervals
{
  return self->_allClientDrawableIntervals;
}

- (void)_handleRenderServerRender:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  if (!a5)
  {
    if (!v6)
    {
      uint64_t v9 = [(SignpostAnimationAccumulatedState *)self allRenders];
      goto LABEL_7;
    }
LABEL_5:
    uint64_t v9 = [(SignpostAnimationAccumulatedState *)self longRenders];
LABEL_7:
    v10 = v9;
    [v9 addObject:v11];

    goto LABEL_8;
  }
  v8 = [(SignpostAnimationAccumulatedState *)self allRenders];
  [v8 addObject:v11];

  if (v6) {
    goto LABEL_5;
  }
LABEL_8:
}

- (NSMutableArray)allRenders
{
  return self->_allRenders;
}

- (void)_handleFrameLifetime:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  if (!a5)
  {
    if (!v6)
    {
      uint64_t v9 = [(SignpostAnimationAccumulatedState *)self allFrameLifetimes];
      goto LABEL_7;
    }
LABEL_5:
    uint64_t v9 = [(SignpostAnimationAccumulatedState *)self longFrameLifetimes];
LABEL_7:
    v10 = v9;
    [v9 addObject:v11];

    goto LABEL_8;
  }
  v8 = [(SignpostAnimationAccumulatedState *)self allFrameLifetimes];
  [v8 addObject:v11];

  if (v6) {
    goto LABEL_5;
  }
LABEL_8:
}

- (NSMutableArray)allFrameLifetimes
{
  return self->_allFrameLifetimes;
}

- (void)_handleFrameLatency:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  if (!a5)
  {
    if (!v6)
    {
      uint64_t v9 = [(SignpostAnimationAccumulatedState *)self allFrameLatencies];
      goto LABEL_7;
    }
LABEL_5:
    uint64_t v9 = [(SignpostAnimationAccumulatedState *)self longFrameLatencies];
LABEL_7:
    v10 = v9;
    [v9 addObject:v11];

    goto LABEL_8;
  }
  v8 = [(SignpostAnimationAccumulatedState *)self allFrameLatencies];
  [v8 addObject:v11];

  if (v6) {
    goto LABEL_5;
  }
LABEL_8:
}

- (NSMutableArray)allFrameLatencies
{
  return self->_allFrameLatencies;
}

- (void)_handleCommitInterval:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  BOOL v6 = a4;
  id v18 = a3;
  int v8 = [v18 pid];
  uint64_t v9 = [(SignpostAnimationAccumulatedState *)self animationBeginEvent];
  int v10 = [v9 processID];

  if (v8 == v10)
  {
    if (a5)
    {
      id v11 = [(SignpostAnimationAccumulatedState *)self allCommitIntervals];
      [v11 addObject:v18];

      if (v6)
      {
        v12 = [(SignpostAnimationAccumulatedState *)self longCommitIntervals];
        [v12 addObject:v18];

        goto LABEL_6;
      }
    }
    else
    {
      if (v6)
      {
        v14 = [(SignpostAnimationAccumulatedState *)self longCommitIntervals];
        [v14 addObject:v18];

        goto LABEL_11;
      }
      v16 = [(SignpostAnimationAccumulatedState *)self allCommitIntervals];
      [v16 addObject:v18];
    }
LABEL_13:
    uint64_t v15 = [(SignpostAnimationAccumulatedState *)self allSystemwideCommitIntervals];
    goto LABEL_14;
  }
  if (!a5)
  {
    if (v6) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
LABEL_6:
  uint64_t v13 = [(SignpostAnimationAccumulatedState *)self allSystemwideCommitIntervals];
  [v13 addObject:v18];

  if (v6)
  {
LABEL_11:
    uint64_t v15 = [(SignpostAnimationAccumulatedState *)self longSystemwideCommitIntervals];
LABEL_14:
    uint64_t v17 = v15;
    [v15 addObject:v18];
  }
}

- (NSMutableArray)allSystemwideCommitIntervals
{
  return self->_allSystemwideCommitIntervals;
}

- (SignpostEvent)animationBeginEvent
{
  return self->_animationBeginEvent;
}

- (NSMutableArray)allCommitIntervals
{
  return self->_allCommitIntervals;
}

- (NSMutableArray)longFrameLifetimes
{
  return self->_longFrameLifetimes;
}

- (NSMutableArray)longRenders
{
  return self->_longRenders;
}

- (void)_handleHIDLatency:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  if (!a5)
  {
    if (!v6)
    {
      uint64_t v9 = [(SignpostAnimationAccumulatedState *)self allHIDLatencies];
      goto LABEL_7;
    }
LABEL_5:
    uint64_t v9 = [(SignpostAnimationAccumulatedState *)self longHIDLatencies];
LABEL_7:
    int v10 = v9;
    [v9 addObject:v11];

    goto LABEL_8;
  }
  int v8 = [(SignpostAnimationAccumulatedState *)self allHIDLatencies];
  [v8 addObject:v11];

  if (v6) {
    goto LABEL_5;
  }
LABEL_8:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allContributedFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_allFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_longContributedFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_longFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_allSystemwideClientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_longSystemwideClientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_allClientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_longClientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_allRenders, 0);
  objc_storeStrong((id *)&self->_longRenders, 0);
  objc_storeStrong((id *)&self->_allHIDLatencies, 0);
  objc_storeStrong((id *)&self->_longHIDLatencies, 0);
  objc_storeStrong((id *)&self->_allFrameLatencies, 0);
  objc_storeStrong((id *)&self->_longFrameLatencies, 0);
  objc_storeStrong((id *)&self->_allTransactionLifetimes, 0);
  objc_storeStrong((id *)&self->_longTransactionLifetimes, 0);
  objc_storeStrong((id *)&self->_allSystemwideCommitIntervals, 0);
  objc_storeStrong((id *)&self->_longSystemwideCommitIntervals, 0);
  objc_storeStrong((id *)&self->_allCommitIntervals, 0);
  objc_storeStrong((id *)&self->_longCommitIntervals, 0);
  objc_storeStrong((id *)&self->_compositorIntervals, 0);

  objc_storeStrong((id *)&self->_animationBeginEvent, 0);
}

- (void)_handleClientDrawableInterval:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  BOOL v6 = a4;
  id v18 = a3;
  int v8 = [v18 pid];
  uint64_t v9 = [(SignpostAnimationAccumulatedState *)self animationBeginEvent];
  int v10 = [v9 processID];

  if (v8 == v10)
  {
    if (a5)
    {
      id v11 = [(SignpostAnimationAccumulatedState *)self allClientDrawableIntervals];
      [v11 addObject:v18];

      if (v6)
      {
        v12 = [(SignpostAnimationAccumulatedState *)self longClientDrawableIntervals];
        [v12 addObject:v18];

        goto LABEL_6;
      }
    }
    else
    {
      if (v6)
      {
        v14 = [(SignpostAnimationAccumulatedState *)self longClientDrawableIntervals];
        [v14 addObject:v18];

        goto LABEL_11;
      }
      v16 = [(SignpostAnimationAccumulatedState *)self allClientDrawableIntervals];
      [v16 addObject:v18];
    }
LABEL_13:
    uint64_t v15 = [(SignpostAnimationAccumulatedState *)self allSystemwideClientDrawableIntervals];
    goto LABEL_14;
  }
  if (!a5)
  {
    if (v6) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
LABEL_6:
  uint64_t v13 = [(SignpostAnimationAccumulatedState *)self allSystemwideClientDrawableIntervals];
  [v13 addObject:v18];

  if (v6)
  {
LABEL_11:
    uint64_t v15 = [(SignpostAnimationAccumulatedState *)self longSystemwideClientDrawableIntervals];
LABEL_14:
    uint64_t v17 = v15;
    [v15 addObject:v18];
  }
}

- (void)_handleTransactionLifetimeInterval:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  BOOL v6 = a4;
  id v14 = a3;
  int v8 = [v14 pid];
  uint64_t v9 = [(SignpostAnimationAccumulatedState *)self animationBeginEvent];
  int v10 = [v9 processID];

  if (v8 == v10)
  {
    if (a5)
    {
      id v11 = [(SignpostAnimationAccumulatedState *)self allTransactionLifetimes];
      [v11 addObject:v14];

      if (!v6) {
        goto LABEL_9;
      }
    }
    else if (!v6)
    {
      v12 = [(SignpostAnimationAccumulatedState *)self allTransactionLifetimes];
      goto LABEL_8;
    }
    v12 = [(SignpostAnimationAccumulatedState *)self longTransactionLifetimes];
LABEL_8:
    uint64_t v13 = v12;
    [v12 addObject:v14];
  }
LABEL_9:
}

- (void)addCompositorInterval:(id)a3
{
  id v4 = a3;
  id v5 = [(SignpostAnimationAccumulatedState *)self compositorIntervals];
  [v5 addObject:v4];
}

- (NSMutableArray)compositorIntervals
{
  return self->_compositorIntervals;
}

- (NSMutableArray)longContributedFrameLifetimes
{
  return self->_longContributedFrameLifetimes;
}

- (NSMutableArray)allContributedFrameLifetimes
{
  return self->_allContributedFrameLifetimes;
}

@end