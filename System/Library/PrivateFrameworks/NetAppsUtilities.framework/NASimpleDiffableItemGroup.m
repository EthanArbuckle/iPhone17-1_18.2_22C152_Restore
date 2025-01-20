@interface NASimpleDiffableItemGroup
- (NSArray)diffableItems;
- (NSString)groupIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDiffableItems:(id)a3;
- (void)setGroupIdentifier:(id)a3;
@end

@implementation NASimpleDiffableItemGroup

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NASimpleDiffableItemGroup *)self diffableItems];
  [v4 setDiffableItems:v5];

  v6 = [(NASimpleDiffableItemGroup *)self groupIdentifier];
  [v4 setGroupIdentifier:v6];

  return v4;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSArray)diffableItems
{
  return self->_diffableItems;
}

- (void)setDiffableItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableItems, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end