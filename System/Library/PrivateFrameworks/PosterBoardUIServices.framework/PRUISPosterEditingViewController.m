@interface PRUISPosterEditingViewController
+ (PREditingSceneViewControllerTopButtonLayout)_topButtonLayout;
+ (id)posterEditingViewControllerForProvider:(id)a3 role:(id)a4 context:(id)a5 boundingShape:(int64_t)a6 error:(id *)a7;
+ (id)posterEditingViewControllerForProvider:(id)a3 role:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)_acquireInstanceForExtension:(id)a3;
- (BOOL)_prepareEditingForNewPoster;
- (BOOL)_prepareEditingForPath:(id)a3;
- (BOOL)hasPreparedForEditing;
- (BOOL)prefersDisplayingSnapshotBeforePresentation;
- (BOOL)prefersStatusBarHidden;
- (BOOL)showsContentWhenReady;
- (NSArray)notificationObservers;
- (NSString)extensionIdentifier;
- (PFPosterExtensionInstance)extensionInstance;
- (PFPosterExtensionProvider)extensionDataSource;
- (PFPosterPath)path;
- (PREditingSceneViewController)editingSceneViewController;
- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3;
- (PRMutablePosterConfiguration)temporaryConfiguration;
- (PRSPosterConfiguration)configuration;
- (PRUISPosterEditingContext)context;
- (PRUISPosterEditingViewController)initWithExistingConfiguration:(id)a3 context:(id)a4;
- (PRUISPosterEditingViewController)initWithExistingConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5;
- (PRUISPosterEditingViewController)initWithExtensionIdentifier:(id)a3 configuration:(id)a4 context:(id)a5;
- (PRUISPosterEditingViewController)initWithExtensionIdentifier:(id)a3 configuration:(id)a4 context:(id)a5 boundingShape:(int64_t)a6;
- (PRUISPosterEditingViewControllerDelegate)delegate;
- (PRUISPosterSnapshotCache)snapshotCache;
- (UIImage)snapshot;
- (UIImageView)snapshotImageView;
- (id)_addObserverForNotificationName:(id)a3 forwardingNotificationName:(id)a4;
- (id)_contentOnlyPosterLevelSet;
- (id)contentOnlySnapshot;
- (id)internalContext;
- (id)phonePreviewSnapshot;
- (id)snapshotWithOptions:(unint64_t)a3;
- (int64_t)boundingShape;
- (unint64_t)acceptButtonType;
- (void)_commonInit;
- (void)_prepareEditingForNewPoster;
- (void)_prepareForEditing;
- (void)_registerForStateNotifications;
- (void)_updateEditingSceneViewControllerShowsContentWhenReady;
- (void)dealloc;
- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3;
- (void)posterExtensionProvider:(id)a3 foundExtensions:(id)a4;
- (void)presentationDidFinishAnimated:(BOOL)a3;
- (void)setAcceptButtonType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingSceneViewController:(id)a3;
- (void)setExtensionDataSource:(id)a3;
- (void)setExtensionInstance:(id)a3;
- (void)setHasPreparedForEditing:(BOOL)a3;
- (void)setNotificationObservers:(id)a3;
- (void)setPrefersDisplayingSnapshotBeforePresentation:(BOOL)a3;
- (void)setShowsContentWhenReady:(BOOL)a3;
- (void)setSnapshot:(id)a3;
- (void)setSnapshotImageView:(id)a3;
- (void)setTemporaryConfiguration:(id)a3;
- (void)updateEditingControllerWithContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PRUISPosterEditingViewController

+ (PREditingSceneViewControllerTopButtonLayout)_topButtonLayout
{
  if (_topButtonLayout_onceToken != -1) {
    dispatch_once(&_topButtonLayout_onceToken, &__block_literal_global_2);
  }
  CGSize v4 = (CGSize)unk_26B325C18;
  retstr->var0.origin = (CGPoint)_topButtonLayout_layout;
  retstr->var0.size = v4;
  CGSize v5 = (CGSize)unk_26B325C38;
  retstr->var1.origin = (CGPoint)xmmword_26B325C28;
  retstr->var1.size = v5;
  return result;
}

double __52__PRUISPosterEditingViewController__topButtonLayout__block_invoke()
{
  SBSTopButtonFramesForPosters();
  double result = 0.0;
  _topButtonLayout_layout = 0u;
  unk_26B325C18 = 0u;
  xmmword_26B325C28 = 0u;
  unk_26B325C38 = 0u;
  return result;
}

+ (id)posterEditingViewControllerForProvider:(id)a3 role:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(id)objc_opt_class() posterEditingViewControllerForProvider:v11 role:v10 context:v9 boundingShape:-1 error:a6];

  return v12;
}

+ (id)posterEditingViewControllerForProvider:(id)a3 role:(id)a4 context:(id)a5 boundingShape:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (PFPosterRoleIsValid())
  {
    v15 = [MEMORY[0x263F5F340] mutableConfigurationWithRole:v13];
    v16 = [v15 _path];
    int v17 = [v16 ensureContentsURLIsReachableAndReturnError:a7];

    if (v17) {
      v18 = (void *)[objc_alloc((Class)a1) initWithExtensionIdentifier:v12 configuration:v15 context:v14 boundingShape:a6];
    }
    else {
      v18 = 0;
    }

    return v18;
  }
  else
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid(role)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PRUISPosterEditingViewController posterEditingViewControllerForProvider:role:context:boundingShape:error:]();
    }
    [v20 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PRUISPosterEditingViewController)initWithExtensionIdentifier:(id)a3 configuration:(id)a4 context:(id)a5
{
  return [(PRUISPosterEditingViewController *)self initWithExtensionIdentifier:a3 configuration:a4 context:a5 boundingShape:-1];
}

- (PRUISPosterEditingViewController)initWithExtensionIdentifier:(id)a3 configuration:(id)a4 context:(id)a5 boundingShape:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v10;
  NSClassFromString(&cfstr_Prsmutablepost.isa);
  if (!v12)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:]();
    }
LABEL_35:
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A047310);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSMutablePosterConfigurationClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A047374);
  }

  id v13 = v9;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v13)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0473D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A04743CLL);
  }

  id v14 = v11;
  if (!v14)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0474A0);
  }
  v15 = v14;
  if (([v14 conformsToProtocol:&unk_27080EC70] & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PRUISPosterEditingContext)]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A047504);
  }

  v16 = [v12 role];
  char IsValid = PFPosterRoleIsValid();

  if ((IsValid & 1) == 0)
  {
    v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid([configuration role])"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.5();
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A047568);
  }
  uint64_t v18 = PUIPosterBoundingShapeFromInt();
  if ((PUIPosterBoundingShapeIsValid() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PUIPosterBoundingShapeIsValid(puiBoundingShape)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExtensionIdentifier:configuration:context:boundingShape:].cold.4();
    }
    goto LABEL_35;
  }
  v34.receiver = self;
  v34.super_class = (Class)PRUISPosterEditingViewController;
  v19 = [(PRUISPosterEditingViewController *)&v34 initWithNibName:0 bundle:0];
  if (v19)
  {
    uint64_t v20 = [v13 copy];
    extensionIdentifier = v19->_extensionIdentifier;
    v19->_extensionIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_configuration, a4);
    uint64_t v22 = [v12 role];
    role = v19->_role;
    v19->_role = (NSString *)v22;

    uint64_t v24 = [v12 _path];
    path = v19->_path;
    v19->_path = (PFPosterPath *)v24;

    objc_storeStrong((id *)&v19->_context, a5);
    v19->_boundingShape = v18;
    [(PRUISPosterEditingViewController *)v19 _commonInit];
  }

  return v19;
}

- (PRUISPosterEditingViewController)initWithExistingConfiguration:(id)a3 context:(id)a4
{
  return [(PRUISPosterEditingViewController *)self initWithExistingConfiguration:a3 context:a4 boundingShape:-1];
}

- (PRUISPosterEditingViewController)initWithExistingConfiguration:(id)a3 context:(id)a4 boundingShape:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 _path];
  id v11 = [v10 serverIdentity];
  id v12 = v8;
  NSClassFromString(&cfstr_Prsposterconfi.isa);
  if (!v12)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:]();
    }
LABEL_27:
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A04781CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A047880);
  }

  id v13 = v9;
  if (!v13)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0478E4);
  }
  id v14 = v13;
  if (([v13 conformsToProtocol:&unk_27080EC70] & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PRUISPosterEditingContext)]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A047948);
  }

  if (([v10 isServerPosterPath] & 1) == 0)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[path isServerPosterPath]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:].cold.4();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0479ACLL);
  }
  uint64_t v15 = PUIPosterBoundingShapeFromInt();
  if ((PUIPosterBoundingShapeIsValid() & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PUIPosterBoundingShapeIsValid(puiBoundingShape)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController initWithExistingConfiguration:context:boundingShape:]();
    }
    goto LABEL_27;
  }
  v30.receiver = self;
  v30.super_class = (Class)PRUISPosterEditingViewController;
  v16 = [(PRUISPosterEditingViewController *)&v30 initWithNibName:0 bundle:0];
  int v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_context, a4);
    objc_storeStrong((id *)&v17->_configuration, a3);
    objc_storeStrong((id *)&v17->_path, v10);
    uint64_t v18 = [v11 provider];
    extensionIdentifier = v17->_extensionIdentifier;
    v17->_extensionIdentifier = (NSString *)v18;

    uint64_t v20 = [v11 role];
    role = v17->_role;
    v17->_role = (NSString *)v20;

    uint64_t v22 = +[PRUISPosterSnapshotFilesystemCache incomingCallSnapshotCache];
    snapshotCache = v17->_snapshotCache;
    v17->_snapshotCache = (PRUISPosterSnapshotCache *)v22;

    v17->_boundingShape = v15;
    [(PRUISPosterEditingViewController *)v17 _commonInit];
  }

  return v17;
}

- (void)_commonInit
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"DECAF000-0000-0000-0000-000000000003"];
  v3 = (PFPosterExtensionProvider *)[objc_alloc(MEMORY[0x263F5F430]) initWithDefaultInstanceIdentifier:v5];
  extensionDataSource = self->_extensionDataSource;
  self->_extensionDataSource = v3;

  [(PFPosterExtensionProvider *)self->_extensionDataSource setObserverQueue:MEMORY[0x263EF83A0]];
  [(PFPosterExtensionProvider *)self->_extensionDataSource addObserver:self];
  [(PFPosterExtensionProvider *)self->_extensionDataSource start];
  self->_prefersDisplayingSnapshotBeforePresentation = 1;
  self->_boundingShape = -1;
  [(PRUISPosterEditingViewController *)self _registerForStateNotifications];
}

- (void)_registerForStateNotifications
{
  v9[4] = *MEMORY[0x263EF8340];
  v3 = [(PRUISPosterEditingViewController *)self _addObserverForNotificationName:*MEMORY[0x263F1D050] forwardingNotificationName:*MEMORY[0x263F07FC8]];
  CGSize v4 = [(PRUISPosterEditingViewController *)self _addObserverForNotificationName:*MEMORY[0x263F1D0D0] forwardingNotificationName:*MEMORY[0x263F07FD0]];
  id v5 = [(PRUISPosterEditingViewController *)self _addObserverForNotificationName:*MEMORY[0x263F1D0D8] forwardingNotificationName:*MEMORY[0x263F07FD8]];
  v6 = [(PRUISPosterEditingViewController *)self _addObserverForNotificationName:*MEMORY[0x263F1D038] forwardingNotificationName:*MEMORY[0x263F07FC0]];
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];
  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = v7;
}

- (id)_addObserverForNotificationName:(id)a3 forwardingNotificationName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95__PRUISPosterEditingViewController__addObserverForNotificationName_forwardingNotificationName___block_invoke;
  v12[3] = &unk_26546B390;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = [v8 addObserverForName:v6 object:0 queue:0 usingBlock:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

void __95__PRUISPosterEditingViewController__addObserverForNotificationName_forwardingNotificationName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:0];

  v3 = [WeakRetained editingSceneViewController];
  if (objc_opt_respondsToSelector()) {
    [v3 forwardAppearanceNotificationName:*(void *)(a1 + 32)];
  }
}

- (void)_prepareForEditing
{
  if (!self->_hasPreparedForEditing)
  {
    if ([(PFPosterPath *)self->_path isServerPosterPath]) {
      BOOL v3 = [(PRUISPosterEditingViewController *)self _prepareEditingForPath:self->_path];
    }
    else {
      BOOL v3 = [(PRUISPosterEditingViewController *)self _prepareEditingForNewPoster];
    }
    self->_hasPreparedForEditing = v3;
  }
}

- (void)dealloc
{
  BOOL v3 = [(PFPosterExtensionProvider *)self->_extensionDataSource instanceProvider];
  extensionInstance = self->_extensionInstance;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 relinquishExtensionInstance:extensionInstance reason:v6];

  [(PFPosterExtensionInstance *)self->_extensionInstance invalidate];
  id v7 = self->_extensionInstance;
  self->_extensionInstance = 0;

  [(PFPosterExtensionProvider *)self->_extensionDataSource cancel];
  extensionDataSource = self->_extensionDataSource;
  self->_extensionDataSource = 0;

  [(PREditingSceneViewController *)self->_editingSceneViewController setShowsContentWhenReady:0];
  [(PREditingSceneViewController *)self->_editingSceneViewController setForcesSceneForeground:0];
  [(PREditingSceneViewController *)self->_editingSceneViewController removeObserver:self];
  v9.receiver = self;
  v9.super_class = (Class)PRUISPosterEditingViewController;
  [(PRUISPosterEditingViewController *)&v9 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PRUISPosterEditingViewController;
  [(PRUISPosterEditingViewController *)&v3 viewDidLoad];
  [(PRUISPosterEditingViewController *)self _prepareForEditing];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PRUISPosterEditingViewController;
  -[PRUISPosterEditingViewController viewDidAppear:](&v6, sel_viewDidAppear_);
  if (self->_prefersDisplayingSnapshotBeforePresentation)
  {
    id v5 = [(UIImageView *)self->_snapshotImageView superview];

    if (v5) {
      [(PRUISPosterEditingViewController *)self presentationDidFinishAnimated:v3];
    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (id)internalContext
{
  if ([(PRUISPosterEditingContext *)self->_context conformsToProtocol:&unk_27080ED00])context = self->_context; {
  else
  }
    context = 0;

  return context;
}

- (void)setAcceptButtonType:(unint64_t)a3
{
  if (self->_acceptButtonType != a3)
  {
    self->_acceptButtonType = a3;
    editingSceneViewController = self->_editingSceneViewController;
    if (a3 != 2) {
      a3 = a3 == 1;
    }
    [(PREditingSceneViewController *)editingSceneViewController setAcceptButtonType:a3];
  }
}

- (void)setShowsContentWhenReady:(BOOL)a3
{
  if (self->_showsContentWhenReady != a3)
  {
    if (a3) {
      [(PRUISPosterEditingViewController *)self _prepareForEditing];
    }
    self->_showsContentWhenReady = a3;
    [(PRUISPosterEditingViewController *)self _updateEditingSceneViewControllerShowsContentWhenReady];
  }
}

- (void)_updateEditingSceneViewControllerShowsContentWhenReady
{
  editingSceneViewController = self->_editingSceneViewController;
  if (editingSceneViewController)
  {
    int v4 = [(PREditingSceneViewController *)editingSceneViewController showsContentWhenReady];
    int showsContentWhenReady = self->_showsContentWhenReady;
    if (showsContentWhenReady != v4)
    {
      [(PREditingSceneViewController *)self->_editingSceneViewController setShowsContentWhenReady:showsContentWhenReady != 0];
      objc_super v6 = self->_editingSceneViewController;
      BOOL v7 = self->_showsContentWhenReady;
      [(PREditingSceneViewController *)v6 setForcesSceneForeground:v7];
    }
  }
}

- (id)snapshotWithOptions:(unint64_t)a3
{
  return 0;
}

- (void)presentationDidFinishAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self->_snapshotImageView;
  objc_super v6 = v5;
  if (v3)
  {
    BOOL v7 = (void *)MEMORY[0x263F1CB60];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__PRUISPosterEditingViewController_presentationDidFinishAnimated___block_invoke;
    v12[3] = &unk_26546B3B8;
    id v13 = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__PRUISPosterEditingViewController_presentationDidFinishAnimated___block_invoke_2;
    v10[3] = &unk_26546B3E0;
    id v11 = v13;
    [v7 animateWithDuration:v12 animations:v10 completion:0.2];
    snapshotImageView = self->_snapshotImageView;
    self->_snapshotImageView = 0;

    objc_super v9 = v13;
  }
  else
  {
    [(UIImageView *)self->_snapshotImageView removeFromSuperview];
    objc_super v9 = self->_snapshotImageView;
    self->_snapshotImageView = 0;
  }

  [(PREditingSceneViewController *)self->_editingSceneViewController setForcesSceneForeground:0];
}

uint64_t __66__PRUISPosterEditingViewController_presentationDidFinishAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __66__PRUISPosterEditingViewController_presentationDidFinishAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (BOOL)_prepareEditingForNewPoster
{
  v58[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(PRUISPosterEditingViewController *)self extensionInstance];
  if (v3)
  {
LABEL_2:
    uint64_t v4 = [MEMORY[0x263F08C38] UUID];
    id v5 = [MEMORY[0x263F08C38] UUID];
    uint64_t v6 = [v5 UUIDString];

    BOOL v7 = [MEMORY[0x263F5F4B8] mutableConfigurationWithRole:self->_role];
    v52 = (void *)v6;
    uint64_t v8 = [MEMORY[0x263F5F440] configurationIdentityWithProvider:self->_extensionIdentifier identifier:v6 role:self->_role posterUUID:v4 version:0 supplement:0];
    objc_super v9 = (void *)MEMORY[0x263F5F448];
    uint64_t v10 = [v7 _path];
    id v11 = [(id)v10 contentsURL];
    v51 = (void *)v8;
    id v12 = [v9 pathWithContainerURL:v11 identity:v8];

    id v56 = 0;
    LOBYTE(v10) = [v12 ensureContentsURLIsReachableAndReturnError:&v56];
    id v13 = v56;
    if (v10)
    {

      path = self->_path;
      id v55 = 0;
      char v15 = [v12 copyContentsOfPath:path error:&v55];
      id v16 = v55;
      if ((v15 & 1) == 0)
      {
        int v17 = PRUISLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[PRUISPosterEditingViewController _prepareEditingForNewPoster].cold.4();
        }
      }
      v49 = (void *)v4;

      uint64_t v18 = [MEMORY[0x263F5F4E8] defaultHomeScreenConfigurationForProvider:self->_extensionIdentifier role:self->_role];
      id v19 = objc_alloc(MEMORY[0x263F5F4D0]);
      v48 = (void *)v18;
      uint64_t v20 = (void *)[v19 initWithDisplayNameLocalizationKey:&stru_2707EEF08 ambientSupportedDataLayout:0 preferredTimeFontConfigurations:MEMORY[0x263EFFA68] preferredTitleColors:MEMORY[0x263EFFA68] luminance:v18 preferredHomeScreenConfiguration:0.5];
      v21 = [MEMORY[0x263F5F500] loadConfiguredPropertiesForPath:v12 error:0];
      id v54 = 0;
      LOBYTE(v18) = [MEMORY[0x263F5F500] storeConfigurableOptionsForPath:v12 configurableOptions:v20 error:&v54];
      id v50 = v54;
      if (v18)
      {
        temporaryConfiguration = self->_temporaryConfiguration;
        self->_temporaryConfiguration = (PRMutablePosterConfiguration *)v7;
        id v47 = v7;

        uint64_t v57 = *MEMORY[0x263F5F588];
        v23 = [NSNumber numberWithInteger:self->_boundingShape];
        v58[0] = v23;
        BOOL v53 = 1;
        uint64_t v24 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];

        v25 = (void *)[objc_alloc(MEMORY[0x263F5F4A0]) initWithProvider:v3 contents:v12 configurableOptions:v20 configuredProperties:v21 additionalInfo:v24];
        [v25 setDelegate:self];
        [v25 addObserver:self];
        unint64_t acceptButtonType = self->_acceptButtonType;
        if (acceptButtonType == 2) {
          uint64_t v27 = 2;
        }
        else {
          uint64_t v27 = acceptButtonType == 1;
        }
        [v25 setAcceptButtonType:v27];
        [(PRUISPosterEditingViewController *)self addChildViewController:v25];
        v28 = [(PRUISPosterEditingViewController *)self view];
        v29 = [v25 view];
        [v28 addSubview:v29];

        objc_super v30 = [v25 view];
        v31 = [(PRUISPosterEditingViewController *)self view];
        [v31 bounds];
        objc_msgSend(v30, "setFrame:");

        [v25 didMoveToParentViewController:self];
        editingSceneViewController = self->_editingSceneViewController;
        self->_editingSceneViewController = (PREditingSceneViewController *)v25;
        id v33 = v25;

        [(PRUISPosterEditingViewController *)self updateEditingControllerWithContext:self->_editingSceneViewController];
        goto LABEL_20;
      }
      v45 = PRUISLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        -[PRUISPosterEditingViewController _prepareEditingForNewPoster]();
      }

      v46 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"didLaydownConfigurableOptions"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[PRUISPosterEditingViewController _prepareEditingForNewPoster]();
      }
      [v46 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
    }
    else
    {
      v43 = PRUISLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[PRUISPosterEditingViewController _prepareEditingForNewPoster]();
      }

      v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"contentsURLIsReachable"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[PRUISPosterEditingViewController _prepareEditingForNewPoster].cold.5();
      }
      [v44 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
    }
    JUMPOUT(0x25A0488B0);
  }
  objc_super v34 = [(PFPosterExtensionProvider *)self->_extensionDataSource extensionForIdentifier];
  v35 = [v34 objectForKey:self->_extensionIdentifier];

  if (v35
    && [(PRUISPosterEditingViewController *)self _acquireInstanceForExtension:v35])
  {
    BOOL v3 = [(PRUISPosterEditingViewController *)self extensionInstance];

    if (v3) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  BOOL v3 = PRUISLogEditing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(PRUISPosterEditingViewController *)(uint64_t)&self->_extensionIdentifier _prepareEditingForNewPoster];
  }
  BOOL v53 = 0;
LABEL_20:

  return v53;
}

- (void)updateEditingControllerWithContext:(id)a3
{
  id v4 = a3;
  [(PRUISPosterEditingViewController *)self _updateEditingSceneViewControllerShowsContentWhenReady];
  id v5 = [(PRUISPosterEditingViewController *)self internalContext];
  [v5 applyContextToEditingSceneViewController:v4];
}

- (BOOL)_prepareEditingForPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PRUISPosterEditingViewController *)self extensionInstance];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F5F4A0]) initWithProvider:v5 contents:v4];
    [v6 setDelegate:self];
    [v6 addObserver:self];
    unint64_t acceptButtonType = self->_acceptButtonType;
    if (acceptButtonType == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = acceptButtonType == 1;
    }
    [v6 setAcceptButtonType:v8];
    [(PRUISPosterEditingViewController *)self addChildViewController:v6];
    objc_super v9 = [(PRUISPosterEditingViewController *)self view];
    uint64_t v10 = [v6 view];
    [v9 addSubview:v10];

    id v11 = [v6 view];
    id v12 = [(PRUISPosterEditingViewController *)self view];
    [v12 bounds];
    objc_msgSend(v11, "setFrame:");

    [v6 didMoveToParentViewController:self];
    objc_storeStrong((id *)&self->_editingSceneViewController, v6);
    [(PRUISPosterEditingViewController *)self updateEditingControllerWithContext:self->_editingSceneViewController];
    if (([(PREditingSceneViewController *)self->_editingSceneViewController showsContentWhenReady] & 1) == 0&& self->_prefersDisplayingSnapshotBeforePresentation)
    {
      if ([(NSString *)self->_role isEqualToString:*MEMORY[0x263F5F570]])
      {
        id v13 = [(PRUISPosterEditingViewController *)self contentOnlySnapshot];
        if (v13
          || ([(PRUISPosterEditingViewController *)self phonePreviewSnapshot],
              (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          snapshotImageView = self->_snapshotImageView;
          if (!snapshotImageView)
          {
            id v15 = objc_alloc(MEMORY[0x263F1C6D0]);
            id v16 = [(PRUISPosterEditingViewController *)self view];
            [v16 bounds];
            int v17 = (UIImageView *)objc_msgSend(v15, "initWithFrame:");

            [(UIImageView *)v17 setAutoresizingMask:18];
            uint64_t v18 = self->_snapshotImageView;
            self->_snapshotImageView = v17;

            snapshotImageView = self->_snapshotImageView;
          }
          [(UIImageView *)snapshotImageView setImage:v13];
          id v19 = [(PRUISPosterEditingViewController *)self view];
          [v19 addSubview:self->_snapshotImageView];
        }
      }
    }
  }
  else
  {
    uint64_t v6 = PRUISLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController _prepareEditingForPath:]((uint64_t)self, v6, v20, v21, v22, v23, v24, v25);
    }
  }

  return v5 != 0;
}

- (id)_contentOnlyPosterLevelSet
{
  v2 = [PRUISPosterLevelSet alloc];
  BOOL v3 = -[PRUISPosterLevelSet initWithNumberOfLevels:](v2, "initWithNumberOfLevels:", 4, *MEMORY[0x263F5F550], *MEMORY[0x263F5F558], *MEMORY[0x263F5F560], *MEMORY[0x263F5F540]);

  return v3;
}

- (id)contentOnlySnapshot
{
  if (![(NSString *)self->_role isEqualToString:*MEMORY[0x263F5F570]]) {
    goto LABEL_7;
  }
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 ? self->_context : 0;
  id v4 = v3;
  id v5 = [PRUISIncomingCallSnapshotDefinition alloc];
  uint64_t v6 = [(PRUISIncomingCallSnapshotDefinition *)v5 initWithBaseIdentifier:PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly context:v4 attachmentUniqueIdentifiers:0];
  BOOL v7 = +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:self->_configuration definition:v6 interfaceOrientation:1];

  if (v7)
  {
    snapshotCache = self->_snapshotCache;
    uint64_t v13 = 0;
    objc_super v9 = [(PRUISPosterSnapshotCache *)snapshotCache latestSnapshotBundleForRequest:v7 error:&v13];
    uint64_t v10 = [(PRUISPosterEditingViewController *)self _contentOnlyPosterLevelSet];
    id v11 = [v9 snapshotForLevelSet:v10];
  }
  else
  {
LABEL_7:
    id v11 = 0;
  }

  return v11;
}

- (id)phonePreviewSnapshot
{
  v36[2] = *MEMORY[0x263EF8340];
  if (![(NSString *)self->_role isEqualToString:*MEMORY[0x263F5F570]]) {
    goto LABEL_7;
  }
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 ? self->_context : 0;
  id v4 = v3;
  id v5 = [PRUISIncomingCallPosterContext alloc];
  uint64_t v6 = [(PRUISPosterEditingContext *)v4 nameVariations];
  [(PRUISPosterEditingContext *)v4 horizontalTitleBoundingRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(PRUISPosterEditingContext *)v4 verticalTitleBoundingRect];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [(PRUISPosterEditingContext *)v4 imageAssetID];
  uint64_t v24 = -[PRUISIncomingCallPosterContext initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:](v5, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", v6, 1, v23, [(PRUISPosterEditingContext *)v4 isPersonalPoster], v8, v10, v12, v14, v16, v18, v20, v22);

  uint64_t v25 = [PRUISIncomingCallSnapshotDefinition alloc];
  v26 = PRPosterSnapshotDefinitionIdentifierIncomingCallComposite;
  v36[0] = @"TPUI_MobileLabelAndBottomBarAndInfoLabel";
  v36[1] = PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  v28 = [(PRUISIncomingCallSnapshotDefinition *)v25 initWithBaseIdentifier:v26 context:v24 attachmentUniqueIdentifiers:v27];

  v29 = +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:self->_configuration definition:v28 interfaceOrientation:1];

  if (v29)
  {
    snapshotCache = self->_snapshotCache;
    uint64_t v35 = 0;
    v31 = [(PRUISPosterSnapshotCache *)snapshotCache latestSnapshotBundleForRequest:v29 error:&v35];
    v32 = [(PRUISPosterEditingViewController *)self _contentOnlyPosterLevelSet];
    id v33 = [v31 snapshotForLevelSet:v32];
  }
  else
  {
LABEL_7:
    id v33 = 0;
  }

  return v33;
}

- (void)posterExtensionProvider:(id)a3 foundExtensions:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      double v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      double v11 = objc_msgSend(v10, "posterExtensionBundleIdentifier", (void)v18);
      char v12 = [v11 isEqualToString:self->_extensionIdentifier];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_13;
    }
    double v14 = PRUISLogEditing();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = objc_opt_class();
      extensionIdentifier = self->_extensionIdentifier;
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v15;
      __int16 v24 = 2048;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      uint64_t v27 = extensionIdentifier;
      id v17 = v15;
      _os_log_impl(&dword_25A03F000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@:%p)Found extension with id: %{public}@", buf, 0x20u);
    }
  }
  else
  {
LABEL_9:

LABEL_13:
    double v14 = PRUISLogEditing();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterEditingViewController posterExtensionProvider:foundExtensions:]((uint64_t)self, v14);
    }
    id v13 = 0;
  }

  if ([(PRUISPosterEditingViewController *)self _acquireInstanceForExtension:v13]) {
    [(PRUISPosterEditingViewController *)self _prepareForEditing];
  }
}

- (BOOL)_acquireInstanceForExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(PFPosterExtensionInstance *)self->_extensionInstance extension];
  char v6 = [v5 isEqual:v4];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = [(PFPosterExtensionProvider *)self->_extensionDataSource instanceProvider];
    uint64_t v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    extensionInstance = self->_extensionInstance;
    if (extensionInstance)
    {
      [v8 relinquishExtensionInstance:extensionInstance reason:v10];
      char v12 = self->_extensionInstance;
      self->_extensionInstance = 0;
    }
    id v13 = [v8 acquireInstanceForExtension:v4 reason:v10 error:0];
    double v14 = self->_extensionInstance;
    self->_extensionInstance = v13;

    BOOL v7 = self->_extensionInstance != 0;
  }

  return v7;
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  id result = (PREditingSceneViewControllerTopButtonLayout *)objc_opt_class();
  if (result)
  {
    return (PREditingSceneViewControllerTopButtonLayout *)[(PREditingSceneViewControllerTopButtonLayout *)result _topButtonLayout];
  }
  else
  {
    retstr->var1.origin = 0u;
    retstr->var1.size = 0u;
    retstr->var0.origin = 0u;
    retstr->var0.size = 0u;
  }
  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  double v11 = (void (**)(id, id))a7;
  if (a4 == 1)
  {
    char v12 = (objc_class *)MEMORY[0x263F5F358];
    id v13 = a6;
    id v14 = a5;
    id v15 = [v12 alloc];
    double v16 = [v14 _path];

    id v17 = (void *)[v15 initWithPath:v16 extensionIdentifier:self->_extensionIdentifier];
    id v21 = 0;
    long long v18 = +[PRUISPosterConfigurationFinalizer finalizedConfigurationForAttributes:v17 withConfiguredProperties:v13 error:&v21];

    id v19 = v21;
  }
  else
  {
    id v19 = 0;
    long long v18 = 0;
  }
  v11[2](v11, v19);
  long long v20 = [(PRUISPosterEditingViewController *)self delegate];
  [v20 editingViewController:self didFinishWithConfiguration:v18];
}

- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3
{
  id v4 = [(PRUISPosterEditingViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 editingViewControllerDidFinishShowingContent:self];
  }
}

- (BOOL)showsContentWhenReady
{
  return self->_showsContentWhenReady;
}

- (PRUISPosterEditingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PRUISPosterEditingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PRSPosterConfiguration)configuration
{
  return self->_configuration;
}

- (PRUISPosterEditingContext)context
{
  return self->_context;
}

- (unint64_t)acceptButtonType
{
  return self->_acceptButtonType;
}

- (int64_t)boundingShape
{
  return self->_boundingShape;
}

- (BOOL)prefersDisplayingSnapshotBeforePresentation
{
  return self->_prefersDisplayingSnapshotBeforePresentation;
}

- (void)setPrefersDisplayingSnapshotBeforePresentation:(BOOL)a3
{
  self->_prefersDisplayingSnapshotBeforePresentation = a3;
}

- (BOOL)hasPreparedForEditing
{
  return self->_hasPreparedForEditing;
}

- (void)setHasPreparedForEditing:(BOOL)a3
{
  self->_hasPreparedForEditing = a3;
}

- (PRUISPosterSnapshotCache)snapshotCache
{
  return self->_snapshotCache;
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (UIImageView)snapshotImageView
{
  return self->_snapshotImageView;
}

- (void)setSnapshotImageView:(id)a3
{
}

- (PFPosterPath)path
{
  return self->_path;
}

- (PREditingSceneViewController)editingSceneViewController
{
  return self->_editingSceneViewController;
}

- (void)setEditingSceneViewController:(id)a3
{
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (PFPosterExtensionProvider)extensionDataSource
{
  return self->_extensionDataSource;
}

- (void)setExtensionDataSource:(id)a3
{
}

- (PRMutablePosterConfiguration)temporaryConfiguration
{
  return self->_temporaryConfiguration;
}

- (void)setTemporaryConfiguration:(id)a3
{
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
}

- (NSArray)notificationObservers
{
  return self->_notificationObservers;
}

- (void)setNotificationObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_temporaryConfiguration, 0);
  objc_storeStrong((id *)&self->_extensionDataSource, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_editingSceneViewController, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_snapshotImageView, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_role, 0);
}

+ (void)posterEditingViewControllerForProvider:role:context:boundingShape:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExtensionIdentifier:configuration:context:boundingShape:.cold.5()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExistingConfiguration:context:boundingShape:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExistingConfiguration:context:boundingShape:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExistingConfiguration:context:boundingShape:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithExistingConfiguration:context:boundingShape:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_prepareEditingForNewPoster
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_prepareEditingForPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)posterExtensionProvider:(uint64_t)a1 foundExtensions:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_7();
  __int16 v8 = 2048;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = v4;
  id v6 = v5;
  _os_log_error_impl(&dword_25A03F000, a2, OS_LOG_TYPE_ERROR, "(%{public}@:%p)Could not find extension with id: %{public}@", v7, 0x20u);
}

@end