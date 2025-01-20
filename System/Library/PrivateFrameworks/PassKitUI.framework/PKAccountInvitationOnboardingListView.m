@interface PKAccountInvitationOnboardingListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKAccountInvitationOnboardingListView)initWithConfigurations:(id)a3;
- (void)layoutSubviews;
@end

@implementation PKAccountInvitationOnboardingListView

- (PKAccountInvitationOnboardingListView)initWithConfigurations:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountInvitationOnboardingListView;
  v5 = [(PKAccountInvitationOnboardingListView *)&v21 init];
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          id v13 = objc_alloc(MEMORY[0x1E4FB1950]);
          v14 = objc_msgSend(v13, "initWithConfiguration:", v12, (void)v17);
          [(PKAccountInvitationOnboardingListView *)v5 addSubview:v14];
          [(NSArray *)v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    listContentViews = v5->_listContentViews;
    v5->_listContentViews = v6;
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = self->_listContentViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "sizeThatFits:", width + -16.0, height, (void)v17);
        double v10 = v10 + v13;
        v14 = [(NSArray *)self->_listContentViews firstObject];

        if (v12 != v14) {
          double v10 = v10 + 10.0;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  double v15 = width;
  double v16 = v10;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PKAccountInvitationOnboardingListView;
  [(PKAccountInvitationOnboardingListView *)&v17 layoutSubviews];
  [(PKAccountInvitationOnboardingListView *)self bounds];
  CGRect remainder = v20;
  memset(&slice, 0, sizeof(slice));
  CGRectDivide(v20, &slice, &remainder, 16.0, CGRectMinXEdge);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_listContentViews;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "sizeThatFits:", remainder.size.width, remainder.size.height, (void)v11);
        CGRectDivide(remainder, &slice, &remainder, v9, CGRectMinYEdge);
        objc_msgSend(v8, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
        double v10 = [(NSArray *)self->_listContentViews lastObject];

        if (v8 != v10) {
          CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
}

@end