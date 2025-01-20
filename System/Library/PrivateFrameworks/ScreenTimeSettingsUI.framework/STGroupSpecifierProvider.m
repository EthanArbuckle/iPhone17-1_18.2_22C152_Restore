@interface STGroupSpecifierProvider
+ (BOOL)automaticallyNotifiesObserversOfIsHidden;
- (BOOL)invalid;
- (BOOL)isHidden;
- (NSArray)specifiers;
- (NSMutableArray)mutableSpecifiers;
- (NSMutableArray)privateSpecifiers;
- (PSSpecifier)groupSpecifier;
- (STGroupSpecifierProvider)init;
- (STGroupSpecifierProviderDelegate)delegate;
- (id)specifiersAtIndexes:(id)a3;
- (void)_tableCellHeightDidChange:(id)a3;
- (void)beginUpdates;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3;
- (void)endUpdates;
- (void)insertSpecifiers:(id)a3 atIndexes:(id)a4;
- (void)invalidate;
- (void)lazyLoadBundle:(id)a3;
- (void)popToViewControllerAnimated:(BOOL)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)reloadSectionHeaderFootersWithAnimation:(int64_t)a3;
- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4;
- (void)removeSpecifiersAtIndexes:(id)a3;
- (void)replaceObjectInSpecifiersAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceSpecifiersAtIndexes:(id)a3 withSpecifiers:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setPrivateSpecifiers:(id)a3;
- (void)showConfirmationViewForSpecifier:(id)a3;
- (void)showController:(id)a3 animated:(BOOL)a4;
- (void)showPINSheet:(id)a3 completion:(id)a4;
- (void)showStoreDemoAlert;
@end

@implementation STGroupSpecifierProvider

- (void)dealloc
{
  if (!self->_invalid)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"STGroupSpecifierProvider.m", 26, @"%@ must be invalidated before deallocing", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)STGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v5 dealloc];
}

- (STGroupSpecifierProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)STGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x263F5FC40];
    objc_super v5 = [(STGroupSpecifierProvider *)v2 description];
    uint64_t v6 = [v4 groupSpecifierWithID:v5];
    groupSpecifier = v3->_groupSpecifier;
    v3->_groupSpecifier = (PSSpecifier *)v6;

    uint64_t v8 = objc_opt_new();
    privateSpecifiers = v3->_privateSpecifiers;
    v3->_privateSpecifiers = (NSMutableArray *)v8;

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v3 selector:sel__tableCellHeightDidChange_ name:0x26D941B88 object:0];
  }
  return v3;
}

+ (BOOL)automaticallyNotifiesObserversOfIsHidden
{
  return 0;
}

- (void)setIsHidden:(BOOL)a3
{
  if (self->_isHidden != a3)
  {
    [(STGroupSpecifierProvider *)self willChangeValueForKey:@"isHidden"];
    self->_isHidden = a3;
    [(STGroupSpecifierProvider *)self didChangeValueForKey:@"isHidden"];
  }
}

- (void)invalidate
{
  self->_invalid = 1;
}

- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v6 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 specifierProvider:self reloadSpecifier:v7 animated:v4];
  }
}

- (void)reloadSectionHeaderFootersWithAnimation:(int64_t)a3
{
  if (![(STGroupSpecifierProvider *)self isHidden])
  {
    id v5 = [(STGroupSpecifierProvider *)self delegate];
    [v5 specifierProvider:self reloadSectionHeaderFootersWithAnimation:a3];
  }
}

- (void)showController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v6 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 specifierProvider:self showController:v7 animated:v4];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v6 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 specifierProvider:self presentViewController:v7 animated:v4];
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 specifierProvider:self dismissViewControllerAnimated:v3];
  }
}

- (void)showConfirmationViewForSpecifier:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 specifierProvider:self showConfirmationViewForSpecifier:v5];
  }
}

- (void)popToViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 specifierProvider:self popToViewControllerAnimated:v3];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = a5;
  v9 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 specifierProvider:self presentViewController:v10 animated:v6 completion:v8];
  }
}

- (void)beginUpdates
{
  id v3 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 specifierProviderBeginUpdates:self];
  }
}

- (void)endUpdates
{
  id v3 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 specifierProviderEndUpdates:self];
  }
}

- (void)lazyLoadBundle:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(STGroupSpecifierProvider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 specifierProvider:self lazyLoadBundle:v5];
  }
}

- (void)showPINSheet:(id)a3 completion:(id)a4
{
  id v8 = a3;
  if (a4)
  {
    BOOL v6 = _Block_copy(a4);
    [v8 setObject:v6 forKeyedSubscript:0x26D93FF08];
  }
  id v7 = [(STGroupSpecifierProvider *)self delegate];
  [v7 specifierProvider:self showPINSheet:v8];
}

- (void)showStoreDemoAlert
{
  id v3 = [MEMORY[0x263F82418] alertControllerForFeatureNotAvailable];
  [(STGroupSpecifierProvider *)self presentViewController:v3 animated:1];
}

- (NSMutableArray)mutableSpecifiers
{
  return (NSMutableArray *)[(STGroupSpecifierProvider *)self mutableArrayValueForKey:@"specifiers"];
}

- (NSArray)specifiers
{
  v2 = [(STGroupSpecifierProvider *)self privateSpecifiers];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)specifiersAtIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(STGroupSpecifierProvider *)self privateSpecifiers];
  BOOL v6 = [v5 objectsAtIndexes:v4];

  return v6;
}

- (void)insertSpecifiers:(id)a3 atIndexes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STGroupSpecifierProvider *)self privateSpecifiers];
  [v8 insertObjects:v7 atIndexes:v6];
}

- (void)removeSpecifiersAtIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(STGroupSpecifierProvider *)self privateSpecifiers];
  [v5 removeObjectsAtIndexes:v4];
}

- (void)replaceObjectInSpecifiersAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  id v7 = [(STGroupSpecifierProvider *)self privateSpecifiers];
  [v7 setObject:v6 atIndexedSubscript:a3];
}

- (void)replaceSpecifiersAtIndexes:(id)a3 withSpecifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STGroupSpecifierProvider *)self privateSpecifiers];
  [v8 replaceObjectsAtIndexes:v7 withObjects:v6];
}

- (void)_tableCellHeightDidChange:(id)a3
{
  id v7 = [a3 object];
  id v4 = [v7 specifier];
  if (v4)
  {
    id v5 = [(STGroupSpecifierProvider *)self specifiers];
    int v6 = [v5 containsObject:v4];

    if (v6) {
      [(STGroupSpecifierProvider *)self reloadSpecifier:v4 animated:0];
    }
  }
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (STGroupSpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STGroupSpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (NSMutableArray)privateSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrivateSpecifiers:(id)a3
{
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateSpecifiers, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end