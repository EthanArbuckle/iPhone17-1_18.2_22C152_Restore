@interface PKPayLaterDashboardMessagesRow
- (BOOL)isEqual:(id)a3;
- (Class)cellClass;
- (NSCopying)identifier;
- (PKPayLaterDashboardMessagesRow)initWithMessages:(id)a3 currentMessageIndex:(int64_t)a4 messagesViewDelegate:(id)a5;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
@end

@implementation PKPayLaterDashboardMessagesRow

- (PKPayLaterDashboardMessagesRow)initWithMessages:(id)a3 currentMessageIndex:(int64_t)a4 messagesViewDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterDashboardMessagesRow;
  v11 = [(PKPayLaterDashboardMessagesRow *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_messages, a3);
    v12->_currentMessageIndex = a4;
    objc_storeWeak((id *)&v12->_messagesViewDelegate, v10);
  }

  return v12;
}

- (NSCopying)identifier
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_messages;
  uint64_t v7 = [(NSOrderedSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "identifier", (void)v16);
        [v3 appendString:v11];
      }
      uint64_t v8 = [(NSOrderedSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = [NSNumber numberWithInteger:self->_currentMessageIndex];
  v13 = [v12 stringValue];
  [v3 appendString:v13];

  objc_super v14 = (void *)[v3 copy];

  return (NSCopying *)v14;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v7 = a3;
  [(PKPayLaterDashboardMessagesRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_alloc_init(PKDashboardMessagesView);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messagesViewDelegate);
    [(PKDashboardMessagesView *)v4 setDelegate:WeakRetained];

    [(PKDashboardMessagesView *)v4 updateWithMessages:self->_messages currentIndex:self->_currentMessageIndex];
    [v7 setHostedContentView:v4];
    v6 = [v7 backgroundConfiguration];
    objc_msgSend(v6, "setBackgroundInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    [v7 setBackgroundConfiguration:v6];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagesViewDelegate);
  [v3 safelyAddObject:WeakRetained];

  [v3 safelyAddObject:self->_messages];
  PKCombinedHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPayLaterDashboardMessagesRow *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messagesViewDelegate);
    id v8 = objc_loadWeakRetained(v6 + 3);
    BOOL v9 = PKEqualObjects() && PKEqualObjects() && self->_currentMessageIndex == (void)v6[2];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messagesViewDelegate);

  objc_storeStrong((id *)&self->_messages, 0);
}

@end