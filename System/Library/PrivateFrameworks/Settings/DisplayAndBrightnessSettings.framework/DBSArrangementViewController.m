@interface DBSArrangementViewController
- (BOOL)wasMirrored;
- (CGSize)externalDisplaySize;
- (CGSize)nativeDisplaySize;
- (CGSize)preferredContentSize;
- (DBSArrangementLayoutViewController)layoutController;
- (DBSArrangementViewController)init;
- (DBSArrangementViewControllerDelegate)delegate;
- (SBSConnectedDisplayInfo)externalDisplayInfo;
- (SBSExternalDisplayService)displayService;
- (UISwitch)mirroredSwitch;
- (UIView)containerView;
- (id)externalDisplayName;
- (id)nativeDisplayImageWithWidth:(double)a3;
- (id)nativeDisplayName;
- (unint64_t)currentDisplayLocation;
- (void)cancelPressed;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)displayLayoutMonitorDidUpdateLayout:(id)a3;
- (void)loadView;
- (void)mirroredToggled:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentDisplayLocation:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayService:(id)a3;
- (void)setExternalDisplayInfo:(id)a3;
- (void)setLayoutController:(id)a3;
- (void)setMirroredSwitch:(id)a3;
- (void)setPressed;
- (void)setWasMirrored:(BOOL)a3;
- (void)updateComponentsWithConnectedDispalyInfo:(id)a3;
- (void)updateSetButtonEnablement;
@end

@implementation DBSArrangementViewController

- (DBSArrangementViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)DBSArrangementViewController;
  v2 = [(DBSArrangementViewController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_displayLayoutMonitorDidUpdateLayout_ name:DBSExternalDisplayManagerDisplayLayoutMonitorDidChange object:0];
  }
  return v2;
}

- (CGSize)nativeDisplaySize
{
  v2 = +[DBSExternalDisplayManager defaultManager];
  [v2 nativeDisplaySize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)nativeDisplayName
{
  return DBS_LocalizedStringForConnectedDisplays(@"IPAD_DISPLAY_NAME");
}

- (id)nativeDisplayImageWithWidth:(double)a3
{
  double v4 = +[DBSExternalDisplayManager defaultManager];
  double v5 = [v4 mainDisplayImageWithWidth:a3];

  return v5;
}

- (id)externalDisplayName
{
  v2 = +[DBSExternalDisplayManager defaultManager];
  double v3 = [v2 externalDisplayName];

  return v3;
}

- (CGSize)externalDisplaySize
{
  v2 = +[DBSExternalDisplayManager defaultManager];
  [v2 externalDisplaySize];
  double v4 = v3;
  double v6 = v5;

  BOOL v7 = v6 == 0.0;
  if (v4 == 0.0) {
    BOOL v7 = 1;
  }
  double v8 = 4000.0;
  if (!v7) {
    double v8 = v4;
  }
  double v9 = 2400.0;
  if (!v7) {
    double v9 = v6;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setExternalDisplayInfo:(id)a3
{
  double v6 = (SBSConnectedDisplayInfo *)a3;
  if (self->_externalDisplayInfo != v6)
  {
    objc_storeStrong((id *)&self->_externalDisplayInfo, a3);
    [(DBSArrangementViewController *)self updateComponentsWithConnectedDispalyInfo:v6];
    double v5 = [(DBSArrangementViewController *)self view];
    [v5 setNeedsLayout];
  }
}

- (void)setDisplayService:(id)a3
{
  if (self->_displayService != a3)
  {
    objc_storeStrong((id *)&self->_displayService, a3);
    double v5 = [(DBSArrangementViewController *)self view];
    [v5 setNeedsLayout];
  }
  MEMORY[0x270F9A758]();
}

- (SBSExternalDisplayService)displayService
{
  return self->_displayService;
}

- (SBSConnectedDisplayInfo)externalDisplayInfo
{
  return self->_externalDisplayInfo;
}

- (void)updateComponentsWithConnectedDispalyInfo:(id)a3
{
  id v4 = a3;
  id v10 = [v4 arrangement];
  uint64_t v5 = [v4 isMirrored];

  [(DBSArrangementViewController *)self setWasMirrored:v5];
  unsigned int v6 = [v10 edge];
  if (v6 <= 3) {
    [(DBSArrangementViewController *)self setCurrentDisplayLocation:qword_235DA5C40[v6]];
  }
  BOOL v7 = [(DBSArrangementViewController *)self layoutController];
  objc_msgSend(v7, "updateCurrentDisplayLocation:", -[DBSArrangementViewController currentDisplayLocation](self, "currentDisplayLocation"));

  BOOL v8 = [(DBSArrangementViewController *)self wasMirrored];
  double v9 = [(DBSArrangementViewController *)self mirroredSwitch];
  [v9 setOn:v8];
}

- (void)loadView
{
  v70[2] = *MEMORY[0x263EF8340];
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  [(DBSArrangementViewController *)self setView:v3];

  id v4 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  uint64_t v5 = [(DBSArrangementViewController *)self view];
  [v5 setBackgroundColor:v4];

  v69 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelPressed];
  id v6 = objc_alloc(MEMORY[0x263F824A8]);
  BOOL v7 = DBS_LocalizedStringForConnectedDisplays(@"SET_DISPLAY_ARRANGEMENT");
  BOOL v8 = (void *)[v6 initWithTitle:v7 style:2 target:self action:sel_setPressed];

  v68 = v8;
  [v8 setEnabled:0];
  double v9 = [(DBSArrangementViewController *)self navigationItem];
  [v9 setLeftBarButtonItem:v69];

  id v10 = [(DBSArrangementViewController *)self navigationItem];
  v11 = DBS_LocalizedStringForConnectedDisplays(@"DISPLAY_ARRANGEMENT");
  [v10 setTitle:v11];

  v12 = [(DBSArrangementViewController *)self navigationItem];
  [v12 setRightBarButtonItem:v8];

  v13 = [DBSArrangementLayoutViewController alloc];
  [(DBSArrangementViewController *)self nativeDisplaySize];
  double v15 = v14;
  double v17 = v16;
  v18 = [(DBSArrangementViewController *)self nativeDisplayName];
  [(DBSArrangementViewController *)self externalDisplaySize];
  double v20 = v19;
  double v22 = v21;
  v23 = [(DBSArrangementViewController *)self externalDisplayName];
  v24 = -[DBSArrangementLayoutViewController initWithNativeDisplaySize:nativeDisplayName:externalDisplaySize:externalDisplayName:currentNativeDisplayLocation:](v13, "initWithNativeDisplaySize:nativeDisplayName:externalDisplaySize:externalDisplayName:currentNativeDisplayLocation:", v18, v23, [(DBSArrangementViewController *)self currentDisplayLocation], v15, v17, v20, v22);
  [(DBSArrangementViewController *)self setLayoutController:v24];

  v25 = [(DBSArrangementViewController *)self layoutController];
  [v25 setDelegate:self];

  v26 = [(DBSArrangementViewController *)self layoutController];
  v27 = [v26 view];

  v28 = [(DBSArrangementViewController *)self view];
  [v28 bounds];
  objc_msgSend(v27, "setFrame:");

  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  v29 = objc_opt_new();
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v29 addSubview:v27];
  [v29 setClipsToBounds:1];
  v30 = [v29 layer];
  [v30 setCornerRadius:7.0];

  [(DBSArrangementViewController *)self setContainerView:v29];
  v31 = [(DBSArrangementViewController *)self view];
  [v31 addSubview:v29];

  v32 = objc_opt_new();
  v33 = DBS_LocalizedStringForConnectedDisplays(@"MIRROR_DISPLAYS");
  [v32 setText:v33];

  v34 = (void *)MEMORY[0x263F81708];
  [MEMORY[0x263F81708] labelFontSize];
  v35 = objc_msgSend(v34, "systemFontOfSize:");
  [v32 setFont:v35];

  v36 = objc_opt_new();
  [v36 addTarget:self action:sel_mirroredToggled_ forControlEvents:4096];
  [(DBSArrangementViewController *)self setMirroredSwitch:v36];
  BOOL v37 = [(DBSArrangementViewController *)self wasMirrored];
  v38 = [(DBSArrangementViewController *)self mirroredSwitch];
  [v38 setOn:v37];

  id v39 = objc_alloc(MEMORY[0x263F82BF8]);
  v70[0] = v32;
  v70[1] = v36;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
  v41 = (void *)[v39 initWithArrangedSubviews:v40];

  [v41 setAlignment:3];
  [v41 setAxis:0];
  [v41 setTranslatesAutoresizingMaskIntoConstraints:0];
  v42 = [MEMORY[0x263F825C8] tableCellGroupedBackgroundColor];
  [v41 setBackgroundColor:v42];

  objc_msgSend(v41, "setLayoutMargins:", 2.0, 20.0, 2.0, 20.0);
  [v41 setLayoutMarginsRelativeArrangement:1];
  [v29 addSubview:v41];
  v43 = objc_opt_new();
  v44 = DBS_LocalizedStringForConnectedDisplays(@"ARRANGE_DISPLAYS_FOOTER");
  [v43 setText:v44];

  v45 = (void *)MEMORY[0x263F81708];
  [MEMORY[0x263F81708] smallSystemFontSize];
  v46 = objc_msgSend(v45, "systemFontOfSize:");
  [v43 setFont:v46];

  v47 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v43 setTextColor:v47];

  [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v43 setTextAlignment:1];
  v48 = [(DBSArrangementViewController *)self view];
  [v48 addSubview:v43];

  v49 = (void *)MEMORY[0x263F08938];
  v50 = _NSDictionaryOfVariableBindings(&cfstr_Containerview.isa, v29, 0);
  v51 = [v49 constraintsWithVisualFormat:@"H:|-20-[containerView]-20-|" options:0 metrics:0 views:v50];
  [v49 activateConstraints:v51];

  v52 = (void *)MEMORY[0x263F08938];
  v53 = _NSDictionaryOfVariableBindings(&cfstr_ContainerviewI.isa, v29, v43, 0);
  v54 = [v52 constraintsWithVisualFormat:@"V:|-52-[containerView][instructions(38)]-6-|" options:0 metrics:0 views:v53];
  [v52 activateConstraints:v54];

  v55 = (void *)MEMORY[0x263F08938];
  v56 = _NSDictionaryOfVariableBindings(&cfstr_Layoutcontroll.isa, v27, 0);
  v57 = [v55 constraintsWithVisualFormat:@"H:|[layoutControllerView]|" options:0 metrics:0 views:v56];
  [v55 activateConstraints:v57];

  v58 = (void *)MEMORY[0x263F08938];
  v59 = _NSDictionaryOfVariableBindings(&cfstr_Mirrorcontrols.isa, v41, 0);
  v60 = [v58 constraintsWithVisualFormat:@"H:|[mirrorControls]|" options:0 metrics:0 views:v59];
  [v58 activateConstraints:v60];

  v61 = (void *)MEMORY[0x263F08938];
  v62 = _NSDictionaryOfVariableBindings(&cfstr_Instructions.isa, v43, 0);
  v63 = [v61 constraintsWithVisualFormat:@"H:|[instructions]|" options:0 metrics:0 views:v62];
  [v61 activateConstraints:v63];

  v64 = (void *)MEMORY[0x263F08938];
  v65 = _NSDictionaryOfVariableBindings(&cfstr_Layoutcontroll_0.isa, v27, v41, 0);
  v66 = [v64 constraintsWithVisualFormat:@"V:|[layoutControllerView]-2-[mirrorControls(44)]|" options:0 metrics:0 views:v65];
  [v64 activateConstraints:v66];

  v67 = [(DBSArrangementViewController *)self externalDisplayInfo];
  [(DBSArrangementViewController *)self updateComponentsWithConnectedDispalyInfo:v67];
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:DBSExternalDisplayManagerDisplayLayoutMonitorDidChange object:0];

  v4.receiver = self;
  v4.super_class = (Class)DBSArrangementViewController;
  [(DBSArrangementViewController *)&v4 dealloc];
}

- (void)displayLayoutMonitorDidUpdateLayout:(id)a3
{
  id v18 = a3;
  objc_super v4 = [v18 object];

  uint64_t v5 = v18;
  if (v4)
  {
    id v6 = [v18 object];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        double v9 = v8;
      }
      else {
        double v9 = 0;
      }
    }
    else
    {
      double v9 = 0;
    }
    id v10 = v9;

    v11 = [(DBSArrangementViewController *)self layoutController];
    uint64_t v12 = [v10 interfaceOrientation];
    [v10 bounds];
    double v14 = v13;
    double v16 = v15;

    objc_msgSend(v11, "updateOrientationTo:withNativeDisplaySize:", v12, v14, v16);
    double v17 = [(DBSArrangementViewController *)self view];
    [v17 setNeedsLayout];

    uint64_t v5 = v18;
  }
}

- (CGSize)preferredContentSize
{
  double v2 = 600.0;
  double v3 = 450.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)DBSArrangementViewController;
  [(DBSArrangementViewController *)&v6 dismissViewControllerAnimated:a3 completion:a4];
  uint64_t v5 = [(DBSArrangementViewController *)self delegate];
  [v5 arrangementViewControllerDidDismiss:self];
}

- (void)cancelPressed
{
  int v3 = [(DBSArrangementViewController *)self wasMirrored];
  objc_super v4 = [(DBSArrangementViewController *)self mirroredSwitch];
  int v5 = [v4 isOn];

  if (v3 != v5)
  {
    objc_super v6 = [(DBSArrangementViewController *)self displayService];
    BOOL v7 = [(DBSArrangementViewController *)self wasMirrored];
    id v8 = [(DBSArrangementViewController *)self externalDisplayInfo];
    double v9 = [v8 identifier];
    [v6 setMirroringEnabled:v7 forDisplay:v9];
  }
  [(DBSArrangementViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)updateSetButtonEnablement
{
  id v7 = [(DBSArrangementViewController *)self navigationItem];
  int v3 = [v7 rightBarButtonItem];
  objc_super v4 = [(DBSArrangementViewController *)self mirroredSwitch];
  int v5 = [v4 isOn];
  if (v5 == [(DBSArrangementViewController *)self wasMirrored])
  {
    objc_super v6 = [(DBSArrangementViewController *)self layoutController];
    objc_msgSend(v3, "setEnabled:", objc_msgSend(v6, "nativeDisplayLocation") != -[DBSArrangementViewController currentDisplayLocation](self, "currentDisplayLocation"));
  }
  else
  {
    [v3 setEnabled:1];
  }
}

- (void)setPressed
{
  int v3 = [(DBSArrangementViewController *)self layoutController];
  uint64_t v4 = [v3 nativeDisplayLocation];

  if ((unint64_t)(v4 - 1) >= 3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = v4 - 1;
  }
  id v6 = objc_alloc(MEMORY[0x263F793E0]);
  id v7 = [(DBSArrangementViewController *)self externalDisplayInfo];
  id v8 = [v7 identifier];
  double v9 = [(DBSArrangementViewController *)self externalDisplayInfo];
  id v10 = [v9 arrangement];
  [v10 offset];
  id v14 = (id)objc_msgSend(v6, "initWithDisplayIdentifier:edge:offset:", v8, v5);

  v11 = [(DBSArrangementViewController *)self displayService];
  uint64_t v12 = [(DBSArrangementViewController *)self externalDisplayInfo];
  double v13 = [v12 identifier];
  [v11 setDisplayArrangement:v14 forDisplay:v13];

  [(DBSArrangementViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)mirroredToggled:(id)a3
{
  uint64_t v4 = [(DBSArrangementViewController *)self displayService];
  uint64_t v5 = [(DBSArrangementViewController *)self mirroredSwitch];
  uint64_t v6 = [v5 isOn];
  id v7 = [(DBSArrangementViewController *)self externalDisplayInfo];
  id v8 = [v7 identifier];
  [v4 setMirroringEnabled:v6 forDisplay:v8];

  [(DBSArrangementViewController *)self updateSetButtonEnablement];
}

- (DBSArrangementViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBSArrangementViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (DBSArrangementLayoutViewController)layoutController
{
  return self->_layoutController;
}

- (void)setLayoutController:(id)a3
{
}

- (UISwitch)mirroredSwitch
{
  return self->_mirroredSwitch;
}

- (void)setMirroredSwitch:(id)a3
{
}

- (unint64_t)currentDisplayLocation
{
  return self->_currentDisplayLocation;
}

- (void)setCurrentDisplayLocation:(unint64_t)a3
{
  self->_currentDisplayLocation = a3;
}

- (BOOL)wasMirrored
{
  return self->_wasMirrored;
}

- (void)setWasMirrored:(BOOL)a3
{
  self->_wasMirrored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroredSwitch, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayService, 0);
  objc_storeStrong((id *)&self->_externalDisplayInfo, 0);
}

@end