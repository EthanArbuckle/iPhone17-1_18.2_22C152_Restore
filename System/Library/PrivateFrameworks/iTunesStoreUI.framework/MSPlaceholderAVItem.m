@interface MSPlaceholderAVItem
- (MSPlaceholderAVItem)initWithAVItemType:(int64_t)a3;
- (int64_t)type;
@end

@implementation MSPlaceholderAVItem

- (MSPlaceholderAVItem)initWithAVItemType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSPlaceholderAVItem;
  result = [(MSPlaceholderAVItem *)&v5 init];
  if (result) {
    result->_itemType = a3;
  }
  return result;
}

- (int64_t)type
{
  return self->_itemType;
}

@end