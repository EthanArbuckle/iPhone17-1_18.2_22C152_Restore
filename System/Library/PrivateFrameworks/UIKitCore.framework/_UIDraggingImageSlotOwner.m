@interface _UIDraggingImageSlotOwner
- (_UIDragManager)dragManager;
- (_UIDraggingImageSlotOwner)initWithDragManager:(id)a3;
- (unsigned)uploadImage:(CGImage *)a3;
- (void)addUsedSlotID:(unsigned int)a3;
- (void)dealloc;
@end

@implementation _UIDraggingImageSlotOwner

- (_UIDraggingImageSlotOwner)initWithDragManager:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"dragManager must be non-nil"];
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIDraggingImageSlotOwner;
  v5 = [(_UIDraggingImageSlotOwner *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dragManager, v4);
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragManager);
  usedSlotIDs = self->_usedSlotIDs;
  if (usedSlotIDs)
  {
    v5 = usedSlotIDs;
    dispatch_time_t v6 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36___UIDraggingImageSlotOwner_dealloc__block_invoke;
    block[3] = &unk_1E52D9F98;
    id v10 = WeakRetained;
    v11 = v5;
    v7 = v5;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);

    usedSlotIDs = self->_usedSlotIDs;
  }
  self->_usedSlotIDs = 0;

  v8.receiver = self;
  v8.super_class = (Class)_UIDraggingImageSlotOwner;
  [(_UIDraggingImageSlotOwner *)&v8 dealloc];
}

- (void)addUsedSlotID:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    usedSlotIDs = self->_usedSlotIDs;
    if (!usedSlotIDs)
    {
      dispatch_time_t v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_usedSlotIDs;
      self->_usedSlotIDs = v6;

      usedSlotIDs = self->_usedSlotIDs;
    }
    id v8 = [NSNumber numberWithUnsignedInt:v3];
    [(NSMutableArray *)usedSlotIDs addObject:v8];
  }
}

- (unsigned)uploadImage:(CGImage *)a3
{
  v5 = [(_UIDraggingImageSlotOwner *)self dragManager];
  uint64_t v6 = [v5 uploadImage:a3];

  [(_UIDraggingImageSlotOwner *)self addUsedSlotID:v6];
  return v6;
}

- (_UIDragManager)dragManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragManager);
  return (_UIDragManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dragManager);
  objc_storeStrong((id *)&self->_usedSlotIDs, 0);
}

@end