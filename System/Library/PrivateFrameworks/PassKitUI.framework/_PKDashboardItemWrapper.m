@interface _PKDashboardItemWrapper
- (NSCopying)identifier;
- (PKDashboardItem)wrappedItem;
- (_PKDashboardItemWrapper)initWithDashboardItem:(id)a3;
- (void)setWrappedItem:(id)a3;
@end

@implementation _PKDashboardItemWrapper

- (_PKDashboardItemWrapper)initWithDashboardItem:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_PKDashboardItemWrapper;
  v6 = [(_PKDashboardItemWrapper *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wrappedItem, a3);
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSCopying *)v9;
  }
  return v7;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (PKDashboardItem)wrappedItem
{
  return self->_wrappedItem;
}

- (void)setWrappedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedItem, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end