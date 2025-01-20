@interface AddItemViewControllerConfiguration
- (AddItemState)addItemState;
- (AddItemViewControllerConfiguration)initWithAddItemState:(id)a3;
- (NSString)suggestionKey;
- (unint64_t)creationMethod;
- (void)setCreationMethod:(unint64_t)a3;
- (void)setSuggestionKey:(id)a3;
@end

@implementation AddItemViewControllerConfiguration

- (AddItemViewControllerConfiguration)initWithAddItemState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AddItemViewControllerConfiguration;
  v6 = [(AddItemViewControllerConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_addItemState, a3);
  }

  return v7;
}

- (AddItemState)addItemState
{
  return self->_addItemState;
}

- (unint64_t)creationMethod
{
  return self->_creationMethod;
}

- (void)setCreationMethod:(unint64_t)a3
{
  self->_creationMethod = a3;
}

- (NSString)suggestionKey
{
  return self->_suggestionKey;
}

- (void)setSuggestionKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionKey, 0);

  objc_storeStrong((id *)&self->_addItemState, 0);
}

@end