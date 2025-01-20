@interface _UIDragManager
+ (void)initializeDraggingSystem;
- (BOOL)hasPendingSessionRequests;
- (CAContext)dragImageContext;
- (NSArray)dragSessionDestinations;
- (NSArray)dragSessionSources;
- (UIScreen)screen;
- (_UIDragManager)initWithScreen:(id)a3;
- (id)beginDragWithSessionConfiguration:(id)a3;
- (id)dragDestinationWithEvent:(id)a3;
- (id)sessionSourceWithIdentifier:(unsigned int)a3;
- (unsigned)uploadImage:(CGImage *)a3;
- (void)_willAddDeactivationReason:(id)a3;
- (void)deleteSlots:(id)a3;
- (void)performAfterCompletingPendingSessionRequests:(id)a3;
- (void)performPendingSessionCompletionBlocksIfPossible;
- (void)sessionDestinationDidEnd:(id)a3;
- (void)sessionSourceDidEnd:(id)a3;
- (void)setDragSessionDestinations:(id)a3;
- (void)setDragSessionSources:(id)a3;
@end

@implementation _UIDragManager

+ (void)initializeDraggingSystem
{
  if (qword_1EB261C50 != -1) {
    dispatch_once(&qword_1EB261C50, &__block_literal_global_364);
  }
  v2 = (void *)_MergedGlobals_1146;
  [v2 warmUp];
}

- (_UIDragManager)initWithScreen:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"screen must be non-nil"];
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIDragManager;
  v5 = [(_UIDragManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_screen, v4);
    dragSessionSources = v6->_dragSessionSources;
    v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v6->_dragSessionSources = (NSArray *)MEMORY[0x1E4F1CBF0];

    dragSessionDestinations = v6->_dragSessionDestinations;
    v6->_dragSessionDestinations = v8;

    uint64_t v10 = objc_opt_new();
    pendingSessionRequestsCompletionBlocks = v6->_pendingSessionRequestsCompletionBlocks;
    v6->_pendingSessionRequestsCompletionBlocks = (NSMutableArray *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v6 selector:sel__willAddDeactivationReason_ name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
  }
  return v6;
}

- (void)_willAddDeactivationReason:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = (void *)[(NSArray *)self->_dragSessionSources copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 shouldCancelOnAppDeactivation]) {
          [v8 cancelDrag];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (CAContext)dragImageContext
{
  dragImageContext = self->_dragImageContext;
  if (!dragImageContext)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [v4 setObject:@"DragAndDropContext" forKey:*MEMORY[0x1E4F39E60]];
    [v4 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F39E80]];
    uint64_t v5 = [MEMORY[0x1E4F39B58] remoteContextWithOptions:v4];
    uint64_t v6 = self->_dragImageContext;
    self->_dragImageContext = v5;

    dragImageContext = self->_dragImageContext;
  }
  return dragImageContext;
}

- (unsigned)uploadImage:(CGImage *)a3
{
  uint64_t v4 = [(_UIDragManager *)self dragImageContext];
  if (v4)
  {
    [MEMORY[0x1E4F39CF8] begin];
    uint64_t v5 = [v4 createSlot];
    [v4 setObject:a3 forSlot:v5];
    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    LODWORD(v5) = 0;
  }

  return v5;
}

- (void)deleteSlots:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_UIDragManager *)self dragImageContext];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "deleteSlot:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "unsignedIntegerValue", (void)v11));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)beginDragWithSessionConfiguration:(id)a3
{
  id v5 = a3;
  id v6 = [[_UIInternalDraggingSessionSource alloc] initWithDragManager:self configuration:v5];

  if (v6)
  {
    uint64_t v7 = [(_UIDragManager *)self dragSessionSources];
    uint64_t v8 = (void *)[v7 mutableCopy];

    [v8 addObject:v6];
    [(_UIDragManager *)self setDragSessionSources:v8];
    ++self->_pendingSessionRequests;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52___UIDragManager_beginDragWithSessionConfiguration___block_invoke;
    v10[3] = &unk_1E52E0000;
    v10[4] = self;
    v10[5] = a2;
    [(_UIInternalDraggingSessionSource *)v6 beginDrag:v10];
  }
  return v6;
}

- (BOOL)hasPendingSessionRequests
{
  return self->_pendingSessionRequests > 0;
}

- (void)performAfterCompletingPendingSessionRequests:(id)a3
{
  aBlock = (void (**)(void))a3;
  if ([(_UIDragManager *)self hasPendingSessionRequests])
  {
    pendingSessionRequestsCompletionBlocks = self->_pendingSessionRequestsCompletionBlocks;
    id v5 = (void (**)(void))_Block_copy(aBlock);

    [(NSMutableArray *)pendingSessionRequestsCompletionBlocks addObject:v5];
    aBlock = v5;
  }
  else
  {
    aBlock[2]();
  }
}

- (void)performPendingSessionCompletionBlocksIfPossible
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_pendingSessionRequestsCompletionBlocks count]
    && ![(_UIDragManager *)self hasPendingSessionRequests])
  {
    v3 = (void *)[(NSMutableArray *)self->_pendingSessionRequestsCompletionBlocks copy];
    [(NSMutableArray *)self->_pendingSessionRequestsCompletionBlocks removeAllObjects];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)sessionSourceDidEnd:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"sessionSource must be non-nil"];
  }
  id v4 = [(_UIDragManager *)self dragSessionSources];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectIdenticalTo:v6];
  [(_UIDragManager *)self setDragSessionSources:v5];
}

- (id)sessionSourceWithIdentifier:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(_UIDragManager *)self dragSessionSources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 sessionIdentifier] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)dragDestinationWithEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"dragEvent must be non-nil"];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(_UIDragManager *)self dragSessionDestinations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 canBeDrivenByDragEvent:v4])
        {
          [v10 addDragEvent:v4];
          long long v11 = v10;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v11 = [[_UIInternalDraggingSessionDestination alloc] initWithDragManager:self dragEvent:v4];
  if (v11)
  {
    long long v12 = [(_UIDragManager *)self dragSessionDestinations];
    uint64_t v5 = (void *)[v12 mutableCopy];

    [v5 addObject:v11];
    [(_UIDragManager *)self setDragSessionDestinations:v5];
    [(_UIInternalDraggingSessionDestination *)v11 connect];
LABEL_14:
  }
  return v11;
}

- (void)sessionDestinationDidEnd:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"sessionDestination must be non-nil"];
  }
  if (_UIApplicationIsExtension()) {
    +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"dropOnExtension"];
  }
  id v4 = [(_UIDragManager *)self dragSessionDestinations];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectIdenticalTo:v6];
  [(_UIDragManager *)self setDragSessionDestinations:v5];
}

- (NSArray)dragSessionSources
{
  return self->_dragSessionSources;
}

- (void)setDragSessionSources:(id)a3
{
}

- (NSArray)dragSessionDestinations
{
  return self->_dragSessionDestinations;
}

- (void)setDragSessionDestinations:(id)a3
{
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);
  return (UIScreen *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_dragSessionDestinations, 0);
  objc_storeStrong((id *)&self->_dragSessionSources, 0);
  objc_storeStrong((id *)&self->_pendingSessionRequestsCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_dragImageContext, 0);
}

@end