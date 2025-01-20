@interface PKPassEntitlementsComposerPredefinedSelectionEntry
- (NSArray)entries;
- (NSCopying)identifier;
- (PKPassEntitlementsComposerPredefinedSelectionEntry)init;
- (PKPredefinedSharedEntitlementSelection)predefinedSelection;
- (void)setEntries:(id)a3;
- (void)setPredefinedSelection:(id)a3;
@end

@implementation PKPassEntitlementsComposerPredefinedSelectionEntry

- (PKPassEntitlementsComposerPredefinedSelectionEntry)init
{
  return 0;
}

- (NSCopying)identifier
{
  return (NSCopying *)[(PKPredefinedSharedEntitlementSelection *)self->_predefinedSelection identifier];
}

- (PKPredefinedSharedEntitlementSelection)predefinedSelection
{
  return self->_predefinedSelection;
}

- (void)setPredefinedSelection:(id)a3
{
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_predefinedSelection, 0);
  objc_destroyWeak((id *)&self->_parentEntitlementComposer);
}

@end