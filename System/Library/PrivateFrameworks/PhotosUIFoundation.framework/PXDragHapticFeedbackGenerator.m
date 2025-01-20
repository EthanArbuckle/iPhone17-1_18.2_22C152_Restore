@interface PXDragHapticFeedbackGenerator
- (BOOL)reorderFeedbackEnabled;
- (_UIDragSnappingFeedbackGenerator)reorderFeedbackGenerator;
- (void)draggedObjectLanded;
- (void)draggedObjectLifted;
- (void)performFeedback;
- (void)setReorderFeedbackEnabled:(BOOL)a3;
@end

@implementation PXDragHapticFeedbackGenerator

- (void).cxx_destruct
{
}

- (BOOL)reorderFeedbackEnabled
{
  return self->_reorderFeedbackEnabled;
}

- (void)draggedObjectLanded
{
  if ([(PXDragHapticFeedbackGenerator *)self reorderFeedbackEnabled])
  {
    id v3 = [(PXDragHapticFeedbackGenerator *)self reorderFeedbackGenerator];
    [v3 draggedObjectLanded];
  }
}

- (void)draggedObjectLifted
{
  if ([(PXDragHapticFeedbackGenerator *)self reorderFeedbackEnabled])
  {
    id v3 = [(PXDragHapticFeedbackGenerator *)self reorderFeedbackGenerator];
    [v3 draggedObjectLifted];
  }
}

- (void)performFeedback
{
  id v3 = [(PXDragHapticFeedbackGenerator *)self reorderFeedbackGenerator];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__PXDragHapticFeedbackGenerator_performFeedback__block_invoke;
  v4[3] = &unk_26545BC00;
  v4[4] = self;
  [v3 performFeedbackWithDelay:v4 insideBlock:0.05];
}

void __48__PXDragHapticFeedbackGenerator_performFeedback__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) reorderFeedbackGenerator];
  [v1 objectSnapped];
}

- (void)setReorderFeedbackEnabled:(BOOL)a3
{
  if (self->_reorderFeedbackEnabled != a3)
  {
    BOOL v3 = a3;
    self->_reorderFeedbackEnabled = a3;
    v4 = [(PXDragHapticFeedbackGenerator *)self reorderFeedbackGenerator];
    id v5 = v4;
    if (v3) {
      [v4 userInteractionStarted];
    }
    else {
      [v4 userInteractionEnded];
    }
  }
}

- (_UIDragSnappingFeedbackGenerator)reorderFeedbackGenerator
{
  reorderFeedbackGenerator = self->_reorderFeedbackGenerator;
  if (!reorderFeedbackGenerator)
  {
    v4 = (_UIDragSnappingFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F82F40]);
    id v5 = self->_reorderFeedbackGenerator;
    self->_reorderFeedbackGenerator = v4;

    reorderFeedbackGenerator = self->_reorderFeedbackGenerator;
  }

  return reorderFeedbackGenerator;
}

@end