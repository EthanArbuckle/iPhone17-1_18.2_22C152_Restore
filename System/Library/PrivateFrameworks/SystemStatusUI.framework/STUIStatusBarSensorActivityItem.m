@interface STUIStatusBarSensorActivityItem
- (STUIStatusBarSensorActivityView)sensorActivityIndicator;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (void)_create_sensorActivityIndicator;
- (void)setSensorActivityIndicator:(id)a3;
@end

@implementation STUIStatusBarSensorActivityItem

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA97D0]];
}

- (void).cxx_destruct
{
}

- (STUIStatusBarSensorActivityView)sensorActivityIndicator
{
  sensorActivityIndicator = self->_sensorActivityIndicator;
  if (!sensorActivityIndicator)
  {
    [(STUIStatusBarSensorActivityItem *)self _create_sensorActivityIndicator];
    sensorActivityIndicator = self->_sensorActivityIndicator;
  }
  return sensorActivityIndicator;
}

- (void)_create_sensorActivityIndicator
{
  v3 = [STUIStatusBarSensorActivityView alloc];
  v4 = -[STUIStatusBarSensorActivityView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  sensorActivityIndicator = self->_sensorActivityIndicator;
  self->_sensorActivityIndicator = v4;
  MEMORY[0x1F41817F8](v4, sensorActivityIndicator);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)STUIStatusBarSensorActivityItem;
  id v7 = a3;
  v8 = [(STUIStatusBarItem *)&v17 applyUpdate:v7 toDisplayItem:v6];
  int v9 = objc_msgSend(v7, "dataChanged", v17.receiver, v17.super_class);

  if (v9)
  {
    v10 = [(STUIStatusBarItem *)self statusBar];
    int v11 = [v10 _showSensorActivityIndicatorWithoutPortalView];

    v12 = [(STUIStatusBarSensorActivityItem *)self sensorActivityIndicator];
    v13 = [(STUIStatusBarItem *)self statusBar];
    v14 = [v13 _effectiveTargetScreen];
    if (v11)
    {
      [v12 configureSensorViewWithoutPortalIfNeededForTargetScreen:v14];
    }
    else
    {
      if ([v12 configurePortalViewIfNeededForTargetScreen:v14]) {
        uint64_t v15 = [v6 isEnabled];
      }
      else {
        uint64_t v15 = 0;
      }
      [v6 setEnabled:v15];
    }
  }
  return v8;
}

- (void)setSensorActivityIndicator:(id)a3
{
}

@end