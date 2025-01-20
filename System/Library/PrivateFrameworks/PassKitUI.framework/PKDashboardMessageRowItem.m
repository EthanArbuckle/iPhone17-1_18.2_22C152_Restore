@interface PKDashboardMessageRowItem
- (BOOL)isEqual:(id)a3;
- (NSCopying)identifier;
- (NSOrderedSet)messages;
- (PKDashboardMessageRowItem)initWithMessages:(id)a3 currentMessageIndex:(int64_t)a4 messagesViewDelegate:(id)a5;
- (PKDashboardMessagesViewDelegate)messagesViewDelegate;
- (int64_t)currentMessageIndex;
- (unint64_t)hash;
- (void)setCurrentMessageIndex:(int64_t)a3;
- (void)setMessages:(id)a3;
@end

@implementation PKDashboardMessageRowItem

- (PKDashboardMessageRowItem)initWithMessages:(id)a3 currentMessageIndex:(int64_t)a4 messagesViewDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardMessageRowItem;
  v11 = [(PKDashboardMessageRowItem *)&v14 init];
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
  return (NSCopying *)@"dashboardMessageRowItem";
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
  v4 = (PKDashboardMessageRowItem *)a3;
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

- (NSOrderedSet)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (int64_t)currentMessageIndex
{
  return self->_currentMessageIndex;
}

- (void)setCurrentMessageIndex:(int64_t)a3
{
  self->_currentMessageIndex = a3;
}

- (PKDashboardMessagesViewDelegate)messagesViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagesViewDelegate);

  return (PKDashboardMessagesViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messagesViewDelegate);

  objc_storeStrong((id *)&self->_messages, 0);
}

@end