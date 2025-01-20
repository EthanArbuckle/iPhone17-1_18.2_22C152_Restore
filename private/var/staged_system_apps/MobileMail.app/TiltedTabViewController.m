@interface TiltedTabViewController
- (BOOL)tiltedTabView:(id)a3 canCloseItemAtIndex:(unint64_t)a4;
- (CATransform3D)tiltedTabView:(SEL)a3 expanded:(id)a4 layerTransformForItemAtIndex:(BOOL)a5;
- (CGRect)tiltedTabView:(id)a3 frameForItemAtIndex:(unint64_t)a4;
- (DockContainerPersistence)persistence;
- (EMDaemonInterface)daemonInterface;
- (MFTiltedTabView)tiltedTabView;
- (NSMutableArray)dockedStates;
- (NSMutableDictionary)placeholderFactories;
- (TiltedTabViewController)initWithInitialDockedStates:(id)a3 persistence:(id)a4 primaryViewController:(id)a5 daemonInterface:(id)a6;
- (TiltedTabViewControllerDelegate)delegate;
- (UIEdgeInsets)tiltedTabView:(id)a3 expanded:(BOOL)a4 edgeInsetsForItemAtIndex:(unint64_t)a5;
- (UIViewController)primaryViewController;
- (double)tiltedTabView:(id)a3 alphaValueForItemAtIndex:(unint64_t)a4;
- (double)tiltedTabView:(id)a3 headerHeightForItemAtIndex:(unint64_t)a4;
- (id)placeholderFactoryForState:(id)a3;
- (id)tiltedTabView:(id)a3 contentViewForItemAtIndex:(unint64_t)a4;
- (id)tiltedTabView:(id)a3 headerViewForItemAtIndex:(unint64_t)a4;
- (id)tiltedTabView:(id)a3 maskCutoutViewForItemAtIndex:(unint64_t)a4;
- (id)tiltedTabView:(id)a3 snapshotViewForItemAtIndex:(unint64_t)a4;
- (int64_t)numberOfItemsInTiltedTabView:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)dismiss;
- (void)dockContainerPersistence:(id)a3 observer:(id)a4 updatedDockedStates:(id)a5;
- (void)presentAnimated:(BOOL)a3;
- (void)setDaemonInterface:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDockedStates:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setPlaceholderFactories:(id)a3;
- (void)setPrimaryViewController:(id)a3;
- (void)setTiltedTabView:(id)a3;
- (void)tiltedTabView:(id)a3 closeItemAtIndex:(unint64_t)a4;
- (void)tiltedTabView:(id)a3 didSelectItemAtIndex:(unint64_t)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TiltedTabViewController

- (TiltedTabViewController)initWithInitialDockedStates:(id)a3 persistence:(id)a4 primaryViewController:(id)a5 daemonInterface:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TiltedTabViewController;
  v14 = [(TiltedTabViewController *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_primaryViewController, a5);
    objc_storeStrong((id *)&v15->_persistence, a4);
    v16 = [v10 reverseObjectEnumerator];
    v17 = [v16 allObjects];
    v18 = (NSMutableArray *)[v17 mutableCopy];
    dockedStates = v15->_dockedStates;
    v15->_dockedStates = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    placeholderFactories = v15->_placeholderFactories;
    v15->_placeholderFactories = v20;

    objc_storeStrong((id *)&v15->_daemonInterface, a6);
  }

  return v15;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)TiltedTabViewController;
  [(TiltedTabViewController *)&v9 viewDidLoad];
  v3 = +[UIColor blackColor];
  v4 = [(TiltedTabViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [MFTiltedTabView alloc];
  v6 = [(TiltedTabViewController *)self view];
  [v6 bounds];
  v7 = -[MFTiltedTabView initWithFrame:](v5, "initWithFrame:");

  [(MFTiltedTabView *)v7 setReorderingEnabled:0];
  [(MFTiltedTabView *)v7 setDelegate:self];
  v8 = [(TiltedTabViewController *)self view];
  [v8 addSubview:v7];

  [(TiltedTabViewController *)self setTiltedTabView:v7];
}

- (void)viewWillLayoutSubviews
{
  v3 = [(TiltedTabViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(TiltedTabViewController *)self tiltedTabView];
  [v12 setFrame:v5, v7, v9, v11];

  v13.receiver = self;
  v13.super_class = (Class)TiltedTabViewController;
  [(TiltedTabViewController *)&v13 viewWillLayoutSubviews];
}

- (void)presentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TiltedTabViewController *)self tiltedTabView];
  [v4 setPresented:1 animated:v3];
}

- (void)dismiss
{
  id v3 = [(TiltedTabViewController *)self tiltedTabView];
  [v3 setPresented:0 animated:0];

  id v4 = [(TiltedTabViewController *)self tiltedTabView];
  [v4 layoutIfNeeded];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)TiltedTabViewController;
  -[TiltedTabViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10021E494;
  v9[3] = &unk_100606048;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10021E4F8;
  v8[3] = &unk_100606048;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (int64_t)numberOfItemsInTiltedTabView:(id)a3
{
  id v3 = [(TiltedTabViewController *)self dockedStates];
  id v4 = (char *)[v3 count] + 1;

  return (int64_t)v4;
}

- (double)tiltedTabView:(id)a3 alphaValueForItemAtIndex:(unint64_t)a4
{
  return 1.0;
}

- (BOOL)tiltedTabView:(id)a3 canCloseItemAtIndex:(unint64_t)a4
{
  return a4 != 0;
}

- (void)tiltedTabView:(id)a3 closeItemAtIndex:(unint64_t)a4
{
  double v6 = [(TiltedTabViewController *)self dockedStates];
  id v15 = [v6 objectAtIndex:a4 - 1];

  id v7 = [(TiltedTabViewController *)self dockedStates];
  [v7 removeObject:v15];

  double v8 = [(TiltedTabViewController *)self persistence];
  double v9 = [v15 dockIdentifier];
  [v8 removeDockedStateWithIdentifier:v9 sender:self];

  objc_super v10 = +[MSAutosave autosave];
  double v11 = [v15 dockIdentifier];
  [v10 removeAutosavedMessageWithIdentifier:v11];

  id v12 = [(TiltedTabViewController *)self dockedStates];
  id v13 = [v12 count];

  if (!v13)
  {
    v14 = [(TiltedTabViewController *)self delegate];
    [v14 tiltedTabViewControllerDidCancel:self];
  }
}

- (void)tiltedTabView:(id)a3 didSelectItemAtIndex:(unint64_t)a4
{
  id v11 = a3;
  double v6 = [(TiltedTabViewController *)self delegate];
  id v7 = v6;
  if (a4)
  {
    double v8 = [(TiltedTabViewController *)self dockedStates];
    double v9 = [v8 objectAtIndex:a4 - 1];

    objc_super v10 = [v11 tabItemAtIndex:a4];
    [v7 tiltedTabViewController:self didSelectView:v10 representingState:v9];
  }
  else
  {
    [v6 tiltedTabViewControllerDidCancel:self];
  }
}

- (UIEdgeInsets)tiltedTabView:(id)a3 expanded:(BOOL)a4 edgeInsetsForItemAtIndex:(unint64_t)a5
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CATransform3D)tiltedTabView:(SEL)a3 expanded:(id)a4 layerTransformForItemAtIndex:(BOOL)a5
{
  long long v6 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&retstr->m33 = v6;
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&retstr->m43 = v7;
  long long v8 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&retstr->m13 = v8;
  long long v9 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&retstr->m23 = v9;
  return self;
}

- (CGRect)tiltedTabView:(id)a3 frameForItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  long long v7 = v6;
  if (!a4)
  {
    long long v8 = [(TiltedTabViewController *)self primaryViewController];
    v17 = [v8 view];
    [v17 frame];
LABEL_6:
    double v10 = v18;
    double v12 = v19;
    double v14 = v20;
    double v16 = v21;

    goto LABEL_7;
  }
  if (([v6 isPresented] & 1) == 0)
  {
    v22 = [(TiltedTabViewController *)self dockedStates];
    long long v8 = [v22 objectAtIndex:a4 - 1];

    v17 = [(TiltedTabViewController *)self delegate];
    [v17 tiltedTabViewController:self dockedFrameForViewRepresentingState:v8];
    goto LABEL_6;
  }
  long long v8 = [(TiltedTabViewController *)self view];
  +[SheetMetrics frameForPresentedSheetIn:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
LABEL_7:

  double v23 = v10;
  double v24 = v12;
  double v25 = v14;
  double v26 = v16;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)tiltedTabView:(id)a3 headerHeightForItemAtIndex:(unint64_t)a4
{
  double result = 40.0;
  if (!a4) {
    return 0.0;
  }
  return result;
}

- (id)tiltedTabView:(id)a3 headerViewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)tiltedTabView:(id)a3 maskCutoutViewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)tiltedTabView:(id)a3 snapshotViewForItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    long long v7 = [(TiltedTabViewController *)self view];
    +[SheetMetrics frameForPresentedSheetIn:v7];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v16 = [(TiltedTabViewController *)self dockedStates];
    v17 = [v16 objectAtIndex:a4 - 1];

    double v18 = [(TiltedTabViewController *)self placeholderFactoryForState:v17];
    double v19 = [v17 storedUserActivity];
    double v20 = [(TiltedTabViewController *)self view];
    [v20 layoutMargins];
    double v25 = [v18 placeholderViewForUserActivity:v19 frame:v9 parentMargins:v11, v13, v15, v21, v22, v23, v24];
  }
  else
  {
    v17 = [(TiltedTabViewController *)self primaryViewController];
    double v18 = [v17 view];
    double v25 = [v18 snapshotViewAfterScreenUpdates:0];
  }

  [v25 setClipsToBounds:1];
  +[SheetMetrics cornerRadius];
  [v25 _setContinuousCornerRadius:];
  double v26 = +[UIColor systemBackgroundColor];
  [v25 setBackgroundColor:v26];

  return v25;
}

- (id)tiltedTabView:(id)a3 contentViewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (id)placeholderFactoryForState:(id)a3
{
  id v4 = a3;
  double v5 = NSStringFromClass((Class)[v4 storedViewControllerClass]);
  id v6 = [(TiltedTabViewController *)self placeholderFactories];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    id v8 = objc_alloc((Class)objc_msgSend(objc_msgSend(v4, "storedViewControllerClass"), "placeholderFactoryClass"));
    double v9 = [(TiltedTabViewController *)self daemonInterface];
    id v7 = [v8 initWithDaemonInterface:v9];

    double v10 = [(TiltedTabViewController *)self placeholderFactories];
    [v10 setObject:v7 forKeyedSubscript:v5];
  }

  return v7;
}

- (void)dockContainerPersistence:(id)a3 observer:(id)a4 updatedDockedStates:(id)a5
{
  id v10 = a5;
  id v6 = [(TiltedTabViewController *)self dockedStates];
  unsigned int v7 = [v6 isEqualToArray:v10];

  id v8 = [(TiltedTabViewController *)self dockedStates];
  [v8 setArray:v10];

  if ([v10 count])
  {
    if (!v7) {
      goto LABEL_6;
    }
    double v9 = [(TiltedTabViewController *)self tiltedTabView];
    [v9 layoutItemsAnimated:1];
  }
  else
  {
    double v9 = [(TiltedTabViewController *)self delegate];
    [v9 tiltedTabViewControllerDidCancel:self];
  }

LABEL_6:
}

- (TiltedTabViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TiltedTabViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DockContainerPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (NSMutableArray)dockedStates
{
  return self->_dockedStates;
}

- (void)setDockedStates:(id)a3
{
}

- (UIViewController)primaryViewController
{
  return self->_primaryViewController;
}

- (void)setPrimaryViewController:(id)a3
{
}

- (MFTiltedTabView)tiltedTabView
{
  return self->_tiltedTabView;
}

- (void)setTiltedTabView:(id)a3
{
}

- (NSMutableDictionary)placeholderFactories
{
  return self->_placeholderFactories;
}

- (void)setPlaceholderFactories:(id)a3
{
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_placeholderFactories, 0);
  objc_storeStrong((id *)&self->_tiltedTabView, 0);
  objc_storeStrong((id *)&self->_primaryViewController, 0);
  objc_storeStrong((id *)&self->_dockedStates, 0);
  objc_storeStrong((id *)&self->_persistence, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end