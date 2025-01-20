@interface UIFontPickerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isContainedInRemoteSheet;
- (BOOL)_parentIsInPopoverPresentation;
- (BOOL)_presentingViewController;
- (BOOL)_shouldShowNavigationBarForCurrentParentVC;
- (NSArray)_selectedFontDescriptors;
- (NSString)debugDescription;
- (UIFontDescriptor)selectedFontDescriptor;
- (UIFontPickerViewController)init;
- (UIFontPickerViewController)initWithCoder:(id)a3;
- (UIFontPickerViewController)initWithConfiguration:(UIFontPickerViewControllerConfiguration *)configuration;
- (UIFontPickerViewControllerConfiguration)configuration;
- (id)_initWithConfiguration:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)delegate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_commonFontPickerViewControllerInit;
- (void)_pickerDidCancel;
- (void)_pickerDidSelectFont:(id)a3;
- (void)_setSelectedFontDescriptors:(id)a3;
- (void)_viewControllerPresentationDidInitiate;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setSelectedFontDescriptor:(UIFontDescriptor *)selectedFontDescriptor;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIFontPickerViewController

- (UIFontPickerViewController)initWithCoder:(id)a3
{
  v4 = [a3 decodeObjectForKey:@"UIFontPickerViewControllerConfiguration"];
  v5 = [(UIFontPickerViewController *)self initWithConfiguration:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIFontPickerViewController;
  id v4 = a3;
  [(UIViewController *)&v6 encodeWithCoder:v4];
  v5 = [(UIFontPickerViewController *)self configuration];
  [v4 encodeObject:v5 forKey:@"UIFontPickerViewControllerConfiguration"];
}

- (UIFontPickerViewController)initWithConfiguration:(UIFontPickerViewControllerConfiguration *)configuration
{
  id v4 = configuration;
  v9.receiver = self;
  v9.super_class = (Class)UIFontPickerViewController;
  v5 = [(UIViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [(UIFontPickerViewControllerConfiguration *)v4 copy];
    v7 = v5->_configuration;
    v5->_configuration = (UIFontPickerViewControllerConfiguration *)v6;

    [(UIFontPickerViewController *)v5 _commonFontPickerViewControllerInit];
  }

  return v5;
}

- (id)_initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIFontPickerViewController;
  v5 = [(UIViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (UIFontPickerViewControllerConfiguration *)v6;

    [(UIFontPickerViewController *)v5 _commonFontPickerViewControllerInit];
  }

  return v5;
}

- (void)_commonFontPickerViewControllerInit
{
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", 480.0, 640.0);
  [(UIViewController *)self setModalPresentationStyle:2];
  v3 = objc_alloc_init(_UIFontPickerSceneHostingImpl);
  hostingImpl = self->_hostingImpl;
  self->_hostingImpl = (_UIFontPickerViewHostingImpl *)v3;

  [(_UIFontPickerViewHostingImpl *)self->_hostingImpl setDelegateFontPickerViewController:self];
  v5 = self->_hostingImpl;
  [(_UIFontPickerViewHostingImpl *)v5 setupRemoteHosting];
}

- (UIFontPickerViewController)init
{
  v3 = objc_opt_new();
  id v4 = [(UIFontPickerViewController *)self initWithConfiguration:v3];

  return v4;
}

- (void)setSelectedFontDescriptor:(UIFontDescriptor *)selectedFontDescriptor
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = selectedFontDescriptor;
  v5 = [(UIFontPickerViewController *)self selectedFontDescriptor];

  if (v5 != v4)
  {
    [(UIFontPickerViewController *)self willChangeValueForKey:@"selectedFontDescriptor"];
    if (v4)
    {
      v7[0] = v4;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      [(UIFontPickerViewController *)self _setSelectedFontDescriptors:v6];
    }
    else
    {
      [(UIFontPickerViewController *)self _setSelectedFontDescriptors:0];
    }
    [(UIFontPickerViewController *)self didChangeValueForKey:@"selectedFontDescriptor"];
  }
}

- (UIFontDescriptor)selectedFontDescriptor
{
  selectedFontDescriptors = self->__selectedFontDescriptors;
  if (selectedFontDescriptors)
  {
    selectedFontDescriptors = (void *)[selectedFontDescriptors count];
    if (selectedFontDescriptors)
    {
      selectedFontDescriptors = [(NSArray *)self->__selectedFontDescriptors firstObject];
    }
  }
  return (UIFontDescriptor *)selectedFontDescriptors;
}

- (void)_setSelectedFontDescriptors:(id)a3
{
  v7 = (NSArray *)a3;
  if (self->__selectedFontDescriptors != v7)
  {
    [(UIFontPickerViewController *)self willChangeValueForKey:@"_selectedFontDescriptors"];
    hostingImpl = self->_hostingImpl;
    uint64_t v6 = [(UIFontPickerViewController *)self selectedFontDescriptor];
    [(_UIFontPickerViewHostingImpl *)hostingImpl setRemoteSelectedFontDescriptors:v7 scrollToVisible:v6 == 0];

    objc_storeStrong((id *)&self->__selectedFontDescriptors, a3);
    [(UIFontPickerViewController *)self didChangeValueForKey:@"_selectedFontDescriptors"];
  }
}

- (BOOL)_isContainedInRemoteSheet
{
  v3 = [(UIViewController *)self parentViewController];

  if (!v3) {
    return 0;
  }
  id v4 = [(UIViewController *)self parentViewController];
  char v5 = [v4 conformsToProtocol:&unk_1ED59B358];

  return v5;
}

- (BOOL)_parentIsInPopoverPresentation
{
  v3 = [(UIViewController *)self parentViewController];

  if (!v3) {
    return 0;
  }
  id v4 = [(UIViewController *)self parentViewController];
  char v5 = [v4 _isInPopoverPresentation];

  return v5;
}

- (BOOL)_shouldShowNavigationBarForCurrentParentVC
{
  BOOL v3 = [(UIFontPickerViewController *)self _isContainedInRemoteSheet];
  if (v3) {
    LOBYTE(v3) = ![(UIFontPickerViewController *)self _parentIsInPopoverPresentation];
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIFontPickerViewController;
  [(UIViewController *)&v8 viewWillAppear:a3];
  hostingImpl = self->_hostingImpl;
  if (self->_presentingViewController) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [(UIFontPickerViewController *)self _shouldShowNavigationBarForCurrentParentVC] ^ 1;
  }
  [(_UIFontPickerViewHostingImpl *)hostingImpl setHideNavigationBar:v5];
  uint64_t v6 = self->_hostingImpl;
  v7 = [(UIViewController *)self sheetPresentationController];
  -[_UIFontPickerViewHostingImpl setShowsGrabber:](v6, "setShowsGrabber:", [v7 prefersGrabberVisible]);
}

- (void)_viewControllerPresentationDidInitiate
{
  self->_presentingViewController = 1;
  v2.receiver = self;
  v2.super_class = (Class)UIFontPickerViewController;
  [(UIViewController *)&v2 _viewControllerPresentationDidInitiate];
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  self->_presentingViewController = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIFontPickerViewController;
  [(UIViewController *)&v4 dismissViewControllerWithTransition:*(void *)&a3 completion:a4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_pickerDidSelectFont:(id)a3
{
  id v13 = a3;
  objc_super v4 = [[_UIFontPickerFontInfo alloc] initWithFontDescriptor:v13];
  _UIFontPickerPersistToRecentsForSuite(v4, 0);
  uint64_t v5 = [(UIFontPickerViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (self->_presentingViewController && (v6 & 1) == 0) {
    [(UIViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  [(UIFontPickerViewController *)self setSelectedFontDescriptor:v13];
  id v7 = [(UIFontPickerViewController *)self selectedFontDescriptor];
  objc_super v8 = [v7 postscriptName];
  objc_super v9 = [v7 objectForKey:*(void *)off_1E52D6B68];

  v14 = v8;
  v15 = v9;
  id v10 = v9;
  id v11 = v8;
  AnalyticsSendEventLazy();

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained fontPickerViewControllerDidPickFont:self];
  }
}

- (void)_pickerDidCancel
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  BOOL presentingViewController = self->_presentingViewController;
  if (self->_presentingViewController && (v5 & 1) == 0)
  {
    [(UIViewController *)self dismissViewControllerAnimated:1 completion:0];
    BOOL presentingViewController = self->_presentingViewController;
  }
  if (!(presentingViewController | v5 & 1)
    && [(UIFontPickerViewController *)self _shouldShowNavigationBarForCurrentParentVC])
  {
    [(UIViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  if (v5)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 fontPickerViewControllerDidCancel:self];
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(UIFontPickerViewController *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  objc_super v2 = [(UIFontPickerViewController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  objc_super v4 = [(UIFontPickerViewControllerConfiguration *)self->_configuration succinctDescription];
  [v3 appendString:v4 withName:@"configuration"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(UIFontPickerViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(UIFontPickerViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  char v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__UIFontPickerViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E52D9F98;
  id v7 = v6;
  id v12 = v7;
  id v13 = self;
  id v8 = (id)[v7 modifyBody:v11];
  id v9 = v7;

  return v9;
}

void __68__UIFontPickerViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__UIFontPickerViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __68__UIFontPickerViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 984) withName:@"configuration"];
  id v8 = [*(id *)(a1 + 40) selectedFontDescriptor];
  if (v8)
  {
    BOOL v3 = *(void **)(a1 + 32);
    id v4 = [v8 postscriptName];
    [v3 appendString:v4 withName:@"selectedFont"];
  }
  uint64_t v5 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1000));
  id v7 = (id)[v5 appendObject:WeakRetained withName:@"delegate"];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)_presentingViewController
{
  return self->_presentingViewController;
}

- (NSArray)_selectedFontDescriptors
{
  return self->__selectedFontDescriptors;
}

- (UIFontPickerViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectedFontDescriptors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostingImpl, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end