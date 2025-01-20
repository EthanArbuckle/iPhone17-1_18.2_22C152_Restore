@interface PXMessagesStackAdditionalItemsViewUserData
- ($DE30A600513D762F9B6AB73D2AED4B95)additionalItemsCount;
- (PXMessagesStackAdditionalItemsViewUserData)init;
- (PXMessagesStackAdditionalItemsViewUserData)initWithAdditionalItemsCount:(id)a3;
@end

@implementation PXMessagesStackAdditionalItemsViewUserData

- ($DE30A600513D762F9B6AB73D2AED4B95)additionalItemsCount
{
  int64_t type = self->_additionalItemsCount.type;
  unint64_t count = self->_additionalItemsCount.count;
  result.var1 = type;
  result.var0 = count;
  return result;
}

- (PXMessagesStackAdditionalItemsViewUserData)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMessagesStackAdditionalItemsView.m", 114, @"%s is not available as initializer", "-[PXMessagesStackAdditionalItemsViewUserData init]");

  abort();
}

- (PXMessagesStackAdditionalItemsViewUserData)initWithAdditionalItemsCount:(id)a3
{
  int64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)PXMessagesStackAdditionalItemsViewUserData;
  $DE30A600513D762F9B6AB73D2AED4B95 result = [(PXMessagesStackAdditionalItemsViewUserData *)&v6 init];
  if (result)
  {
    result->_additionalItemsCount.unint64_t count = var0;
    result->_additionalItemsCount.int64_t type = var1;
  }
  return result;
}

@end