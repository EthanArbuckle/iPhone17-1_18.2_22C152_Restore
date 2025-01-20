@interface NavigationCameraSnapshotPickerViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NavigationCameraSnapshotPickerDelegate)delegate;
- (NavigationCameraSnapshotPickerViewController)initWithDelegate:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_detailTextForSnapshot:(id)a3;
- (id)cameraSnapshots;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureCell:(id)a3 withCameraSnapshot:(id)a4;
- (void)_registerTableViewCells;
- (void)cameraSnapshotsManager:(id)a3 didInsertAtIndex:(unint64_t)a4 toTraceFile:(id)a5;
- (void)cameraSnapshotsManager:(id)a3 didRemoveAtIndex:(unint64_t)a4 fromTraceFile:(id)a5;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation NavigationCameraSnapshotPickerViewController

- (NavigationCameraSnapshotPickerViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NavigationCameraSnapshotPickerViewController;
  v5 = [(NavigationCameraSnapshotPickerViewController *)&v10 initWithStyle:0];
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v8 = +[NavigationCameraSnapshotManager sharedInstance];
    [v8 setSnapshotsObserver:v6];

    v7 = v6;
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NavigationCameraSnapshotPickerViewController;
  [(NavigationCameraSnapshotPickerViewController *)&v4 viewDidLoad];
  [(NavigationCameraSnapshotPickerViewController *)self _registerTableViewCells];
  v3 = [(NavigationCameraSnapshotPickerViewController *)self tableView];
  [v3 setRowHeight:64.0];
}

- (id)cameraSnapshots
{
  v3 = +[NavigationCameraSnapshotManager sharedInstance];
  objc_super v4 = [(NavigationCameraSnapshotPickerViewController *)self delegate];
  v5 = [v4 tracePath];
  v6 = [v3 cameraSnapshotsOfTraceFile:v5];

  return v6;
}

- (void)_registerTableViewCells
{
  id v2 = [(NavigationCameraSnapshotPickerViewController *)self tableView];
  [v2 registerClass:objc_opt_class() forCellReuseIdentifier:@"CameraCellID"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(NavigationCameraSnapshotPickerViewController *)self cameraSnapshots];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"CameraCellID" forIndexPath:v6];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"CameraCellID"];
  }
  if (((unint64_t)[v6 row] & 0x8000000000000000) != 0)
  {
    v11 = 0;
  }
  else
  {
    id v8 = [v6 row];
    v9 = [(NavigationCameraSnapshotPickerViewController *)self cameraSnapshots];
    if (v8 >= [v9 count])
    {
      v11 = 0;
    }
    else
    {
      objc_super v10 = [(NavigationCameraSnapshotPickerViewController *)self cameraSnapshots];
      v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    }
  }
  [(NavigationCameraSnapshotPickerViewController *)self _configureCell:v7 withCameraSnapshot:v11];

  return v7;
}

- (void)_configureCell:(id)a3 withCameraSnapshot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 textLabel];
  [v8 setLineBreakMode:4];

  v9 = [v7 detailTextLabel];
  [v9 setLineBreakMode:4];

  objc_super v10 = [v7 textLabel];
  [v10 setNumberOfLines:0];

  v11 = [v7 detailTextLabel];
  [v11 setNumberOfLines:0];

  v12 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody addingSymbolicTraits:0];
  v13 = [v12 fontWithSize:13.0];
  v14 = [v7 textLabel];
  [v14 setFont:v13];

  v15 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleFootnote addingSymbolicTraits:0];
  v16 = [v15 fontWithSize:10.0];
  v17 = [v7 detailTextLabel];
  [v17 setFont:v16];

  v18 = +[UIColor systemGrayColor];
  v19 = [v7 detailTextLabel];
  [v19 setTextColor:v18];

  [v6 tracePlaybackTimeFraction];
  v21 = +[NSString stringWithFormat:@"%.1f%% Complete", v20 * 100.0];
  v22 = [v7 textLabel];
  [v22 setText:v21];

  id v24 = [(NavigationCameraSnapshotPickerViewController *)self _detailTextForSnapshot:v6];

  v23 = [v7 detailTextLabel];

  [v23 setText:v24];
}

- (id)_detailTextForSnapshot:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 puckLocation];

  if (!v4)
  {
    v14 = [v3 camera];
    [v14 centerCoordinate];
    uint64_t v26 = v25;
    v17 = [v3 camera];
    [v17 centerCoordinate];
    v28 = +[NSString stringWithFormat:@"Center %.4f°N, %.4f°W", v26, v27];
    v13 = @"Puck N/A";
    goto LABEL_16;
  }
  id v5 = [v3 puckLocation];
  [v5 coordinate];
  uint64_t v7 = v6;
  id v8 = [v3 puckLocation];
  [v8 coordinate];
  uint64_t v10 = v9;
  v11 = [v3 puckLocation];
  [v11 course];
  v13 = +[NSString stringWithFormat:@"Puck %.4f°N, %.4f°W · %.0f°", v7, v10, v12];

  v14 = [v3 puckLocation];
  [v14 coordinate];
  double v16 = v15;
  v17 = [v3 camera];
  [v17 centerCoordinate];
  double v19 = v18;
  if (v16 == v18)
  {
    double v20 = [v3 puckLocation];
    [v20 coordinate];
    double v22 = v21;
    v23 = [v3 camera];
    [v23 centerCoordinate];
    if (v22 == v24)
    {
      v28 = @"Center on puck";
LABEL_15:

      goto LABEL_16;
    }
    v57 = v23;
    v58 = v20;
    v59 = v13;
  }
  else
  {
    v59 = v13;
  }
  v29 = [v3 camera];
  [v29 centerCoordinate];
  uint64_t v31 = v30;
  v32 = [v3 camera];
  [v32 centerCoordinate];
  uint64_t v34 = v33;
  [v3 puckToCenterX];
  CFStringRef v35 = @"+";
  if (v36 <= 0.0) {
    CFStringRef v37 = &stru_101324E70;
  }
  else {
    CFStringRef v37 = @"+";
  }
  [v3 puckToCenterX];
  uint64_t v39 = v38;
  [v3 puckToCenterY];
  if (v40 <= 0.0) {
    CFStringRef v35 = &stru_101324E70;
  }
  [v3 puckToCenterY];
  v28 = +[NSString stringWithFormat:@"Center %.4f°N, %.4f°W · %@%.0fm, %@%.0fm", v31, v34, v37, v39, v35, v41];

  double v20 = v58;
  v13 = v59;
  v23 = v57;
  if (v16 == v19) {
    goto LABEL_15;
  }
LABEL_16:

  v42 = [v3 camera];
  [v42 pitch];
  double v44 = cos(v43 * 0.0174532925);

  if (v44 == 0.0)
  {
    double v47 = 0.0;
  }
  else
  {
    v45 = [v3 camera];
    [v45 altitude];
    double v47 = v46 / v44;
  }
  v48 = [v3 camera];
  [v48 heading];
  uint64_t v50 = v49;
  v51 = [v3 camera];
  [v51 pitch];
  v53 = +[NSString stringWithFormat:@"Camera %.0fm away · %.0f° yaw · %.0f° pitch", *(void *)&v47, v50, v52];

  v60[0] = v13;
  v60[1] = v28;
  v60[2] = v53;
  v54 = +[NSArray arrayWithObjects:v60 count:3];
  v55 = [v54 componentsJoinedByString:@"\n"];

  return v55;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 64.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a4;
  if (((unint64_t)[v15 row] & 0x8000000000000000) == 0)
  {
    id v5 = [v15 row];
    uint64_t v6 = [(NavigationCameraSnapshotPickerViewController *)self cameraSnapshots];
    id v7 = [v6 count];

    if (v5 < v7)
    {
      id v8 = [(NavigationCameraSnapshotPickerViewController *)self cameraSnapshots];
      uint64_t v9 = [v8 objectAtIndexedSubscript:[v15 row]];

      uint64_t v10 = [(NavigationCameraSnapshotPickerViewController *)self delegate];
      if (v10)
      {
        v11 = (void *)v10;
        uint64_t v12 = [(NavigationCameraSnapshotPickerViewController *)self delegate];
        char v13 = objc_opt_respondsToSelector();

        if (v13)
        {
          v14 = [(NavigationCameraSnapshotPickerViewController *)self delegate];
          [v14 cameraSnapshotPicker:self didSelectCameraSnapshot:v9];
        }
      }
    }
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a5;
  if (((unint64_t)[v14 row] & 0x8000000000000000) == 0)
  {
    id v7 = [v14 row];
    id v8 = [(NavigationCameraSnapshotPickerViewController *)self cameraSnapshots];
    id v9 = [v8 count];

    if (a4 == 1 && v7 < v9)
    {
      uint64_t v10 = +[NavigationCameraSnapshotManager sharedInstance];
      id v11 = [v14 row];
      uint64_t v12 = [(NavigationCameraSnapshotPickerViewController *)self delegate];
      char v13 = [v12 tracePath];
      [v10 removeCameraSnapshotAtIndex:v11 fromTraceFile:v13];
    }
  }
}

- (void)cameraSnapshotsManager:(id)a3 didInsertAtIndex:(unint64_t)a4 toTraceFile:(id)a5
{
  id v7 = a5;
  id v8 = [(NavigationCameraSnapshotPickerViewController *)self delegate];
  id v9 = [v8 tracePath];
  unsigned int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    id v11 = +[NSIndexPath indexPathForRow:a4 inSection:0];
    uint64_t v12 = [(NavigationCameraSnapshotPickerViewController *)self tableView];
    double v18 = v11;
    char v13 = +[NSArray arrayWithObjects:&v18 count:1];
    [v12 insertRowsAtIndexPaths:v13 withRowAnimation:100];

    id v14 = [(NavigationCameraSnapshotPickerViewController *)self tableView];
    id v15 = [v14 indexPathsForVisibleRows];
    unsigned __int8 v16 = [v15 containsObject:v11];

    if ((v16 & 1) == 0)
    {
      v17 = [(NavigationCameraSnapshotPickerViewController *)self tableView];
      [v17 scrollToRowAtIndexPath:v11 atScrollPosition:1 animated:1];
    }
  }
}

- (void)cameraSnapshotsManager:(id)a3 didRemoveAtIndex:(unint64_t)a4 fromTraceFile:(id)a5
{
  id v7 = a5;
  id v8 = [(NavigationCameraSnapshotPickerViewController *)self delegate];
  id v9 = [v8 tracePath];
  unsigned int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    id v11 = +[NSIndexPath indexPathForRow:a4 inSection:0];
    uint64_t v12 = [(NavigationCameraSnapshotPickerViewController *)self tableView];
    id v14 = v11;
    char v13 = +[NSArray arrayWithObjects:&v14 count:1];
    [v12 deleteRowsAtIndexPaths:v13 withRowAnimation:100];
  }
}

- (NavigationCameraSnapshotPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavigationCameraSnapshotPickerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end