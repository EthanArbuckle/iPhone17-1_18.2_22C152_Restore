@interface SBIconDragResult
- (BOOL)performedDrop;
- (NSString)description;
- (NSUUID)dragIdentifier;
- (int64_t)dragRejectionReason;
- (unint64_t)numberOfDraggedItems;
- (void)appendDescriptionToStream:(id)a3;
- (void)setDragIdentifier:(id)a3;
- (void)setDragRejectionReason:(int64_t)a3;
- (void)setNumberOfDraggedItems:(unint64_t)a3;
- (void)setPerformedDrop:(BOOL)a3;
@end

@implementation SBIconDragResult

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  [(SBIconDragResult *)self appendDescriptionToStream:v3];
  v4 = [v3 description];

  return (NSString *)v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__SBIconDragResult_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E6AACA90;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

void __46__SBIconDragResult_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) dragIdentifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"dragIdentifier"];

  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "numberOfDraggedItems"), @"numberOfDraggedItems");
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "performedDrop"), @"performedDrop");
  id v7 = *(void **)(a1 + 32);
  SBHStringForDragRejectionReason([*(id *)(a1 + 40) dragRejectionReason]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 appendString:v8 withName:@"dragRejectionReason"];
}

- (NSUUID)dragIdentifier
{
  return self->_dragIdentifier;
}

- (void)setDragIdentifier:(id)a3
{
}

- (unint64_t)numberOfDraggedItems
{
  return self->_numberOfDraggedItems;
}

- (void)setNumberOfDraggedItems:(unint64_t)a3
{
  self->_numberOfDraggedItems = a3;
}

- (BOOL)performedDrop
{
  return self->_performedDrop;
}

- (void)setPerformedDrop:(BOOL)a3
{
  self->_performedDrop = a3;
}

- (int64_t)dragRejectionReason
{
  return self->_dragRejectionReason;
}

- (void)setDragRejectionReason:(int64_t)a3
{
  self->_dragRejectionReason = a3;
}

- (void).cxx_destruct
{
}

@end