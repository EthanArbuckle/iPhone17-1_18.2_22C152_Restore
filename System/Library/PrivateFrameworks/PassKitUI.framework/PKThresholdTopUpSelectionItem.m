@interface PKThresholdTopUpSelectionItem
- (NSCopying)identifier;
- (PKThresholdTopUpSelectionItem)initWithIdentifier:(id)a3;
@end

@implementation PKThresholdTopUpSelectionItem

- (PKThresholdTopUpSelectionItem)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKThresholdTopUpSelectionItem;
  v6 = [(PKThresholdTopUpSelectionItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_identifier;
}

- (void).cxx_destruct
{
}

@end