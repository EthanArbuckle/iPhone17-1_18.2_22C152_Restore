@interface _UIStatusBarSensorActivityItem
- (_UIStatusBarSensorActivityView)sensorActivityIndicator;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (void)_create_sensorActivityIndicator;
- (void)setSensorActivityIndicator:(id)a3;
@end

@implementation _UIStatusBarSensorActivityItem

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"sensorActivityEntry"];
}

- (_UIStatusBarSensorActivityView)sensorActivityIndicator
{
  sensorActivityIndicator = self->_sensorActivityIndicator;
  if (!sensorActivityIndicator)
  {
    [(_UIStatusBarSensorActivityItem *)self _create_sensorActivityIndicator];
    sensorActivityIndicator = self->_sensorActivityIndicator;
  }
  return sensorActivityIndicator;
}

- (void)_create_sensorActivityIndicator
{
  v3 = [_UIStatusBarSensorActivityView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  sensorActivityIndicator = self->_sensorActivityIndicator;
  self->_sensorActivityIndicator = v4;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)_UIStatusBarSensorActivityItem;
  id v6 = a3;
  v7 = [(_UIStatusBarItem *)&v18 applyUpdate:v6 toDisplayItem:a4];
  int v8 = objc_msgSend(v6, "dataChanged", v18.receiver, v18.super_class);

  if (v8)
  {
    v9 = [(_UIStatusBarItem *)self statusBar];
    v10 = [v9 visualProvider];
    if (objc_opt_respondsToSelector())
    {
      v11 = [(_UIStatusBarItem *)self statusBar];
      v12 = [v11 visualProvider];
      int v13 = [v12 showSensorActivityIndicatorWithoutPortalView];

      if (v13)
      {
        v14 = [(_UIStatusBarSensorActivityItem *)self sensorActivityIndicator];
        v15 = [(_UIStatusBarItem *)self statusBar];
        v16 = [v15 _effectiveTargetScreen];
        [v14 configureSensorViewWithoutPortalIfNeededForTargetScreen:v16];
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
    }
    v14 = [(_UIStatusBarSensorActivityItem *)self sensorActivityIndicator];
    v15 = [(_UIStatusBarItem *)self statusBar];
    v16 = [v15 _effectiveTargetScreen];
    [v14 configurePortalViewIfNeededForTargetScreen:v16];
    goto LABEL_7;
  }
LABEL_8:
  return v7;
}

- (void)setSensorActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end