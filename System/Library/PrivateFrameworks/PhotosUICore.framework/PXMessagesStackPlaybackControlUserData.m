@interface PXMessagesStackPlaybackControlUserData
- (PXMessagesStackPlaybackControlUserData)initWithItemIndex:(int64_t)a3 viewModel:(id)a4;
- (PXMessagesStackPlaybackControlViewModel)viewModel;
- (int64_t)itemIndex;
@end

@implementation PXMessagesStackPlaybackControlUserData

- (void).cxx_destruct
{
}

- (PXMessagesStackPlaybackControlViewModel)viewModel
{
  return self->_viewModel;
}

- (int64_t)itemIndex
{
  return self->_itemIndex;
}

- (PXMessagesStackPlaybackControlUserData)initWithItemIndex:(int64_t)a3 viewModel:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXMessagesStackPlaybackControlUserData;
  v8 = [(PXMessagesStackPlaybackControlUserData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_itemIndex = a3;
    objc_storeStrong((id *)&v8->_viewModel, a4);
  }

  return v9;
}

@end