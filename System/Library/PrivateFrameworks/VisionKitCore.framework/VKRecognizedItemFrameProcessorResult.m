@interface VKRecognizedItemFrameProcessorResult
- (NSArray)addedItems;
- (NSArray)allItems;
- (NSArray)removedItems;
- (NSArray)updatedItems;
- (VKRecognizedItemFrameProcessorResult)init;
- (void)setAddedItems:(id)a3;
- (void)setAllItems:(id)a3;
- (void)setRemovedItems:(id)a3;
- (void)setUpdatedItems:(id)a3;
@end

@implementation VKRecognizedItemFrameProcessorResult

- (VKRecognizedItemFrameProcessorResult)init
{
  v10.receiver = self;
  v10.super_class = (Class)VKRecognizedItemFrameProcessorResult;
  v2 = [(VKRecognizedItemFrameProcessorResult *)&v10 init];
  v3 = v2;
  if (v2)
  {
    allItems = v2->_allItems;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_allItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    addedItems = v3->_addedItems;
    v3->_addedItems = v5;

    updatedItems = v3->_updatedItems;
    v3->_updatedItems = v5;

    removedItems = v3->_removedItems;
    v3->_removedItems = v5;
  }
  return v3;
}

- (NSArray)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
}

- (NSArray)addedItems
{
  return self->_addedItems;
}

- (void)setAddedItems:(id)a3
{
}

- (NSArray)updatedItems
{
  return self->_updatedItems;
}

- (void)setUpdatedItems:(id)a3
{
}

- (NSArray)removedItems
{
  return self->_removedItems;
}

- (void)setRemovedItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_updatedItems, 0);
  objc_storeStrong((id *)&self->_addedItems, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end