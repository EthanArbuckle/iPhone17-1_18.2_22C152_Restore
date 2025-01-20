@interface RCPlaybackSettingCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (RCPlaybackSettingCellActionsDelegate)cellActionsDelegate;
- (void)setCellActionsDelegate:(id)a3;
@end

@implementation RCPlaybackSettingCell

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v14.receiver = self;
  v14.super_class = (Class)RCPlaybackSettingCell;
  -[RCPlaybackSettingCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v9 playbackSettingsCollectionViewCellMinHeight];
  double v11 = v10;

  if (v8 >= v11) {
    double v12 = v8;
  }
  else {
    double v12 = v11;
  }
  double v13 = v6;
  result.height = v12;
  result.width = v13;
  return result;
}

- (RCPlaybackSettingCellActionsDelegate)cellActionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellActionsDelegate);

  return (RCPlaybackSettingCellActionsDelegate *)WeakRetained;
}

- (void)setCellActionsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end