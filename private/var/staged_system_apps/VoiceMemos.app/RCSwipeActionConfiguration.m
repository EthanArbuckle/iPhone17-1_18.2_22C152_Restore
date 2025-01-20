@interface RCSwipeActionConfiguration
- (BOOL)shouldExecuteCompletionBeforeAction;
- (NSString)actionImageAxLabel;
- (NSString)actionTitle;
- (NSString)uuidForAction;
- (RCSwipeActionConfiguration)initWithControlsAction:(int64_t)a3 recordingUUID:(id)a4 actionTitle:(id)a5;
- (UIColor)actionBackgroundColor;
- (UIImage)actionImage;
- (id)customCompletionBlock;
- (id)sourceItem;
- (int64_t)actionStyle;
- (int64_t)controlsAction;
- (void)setActionBackgroundColor:(id)a3;
- (void)setActionImage:(id)a3;
- (void)setActionImageAxLabel:(id)a3;
- (void)setActionStyle:(int64_t)a3;
- (void)setActionTitle:(id)a3;
- (void)setControlsAction:(int64_t)a3;
- (void)setCustomCompletionBlock:(id)a3;
- (void)setShouldExecuteCompletionBeforeAction:(BOOL)a3;
- (void)setSourceItem:(id)a3;
- (void)setUuidForAction:(id)a3;
@end

@implementation RCSwipeActionConfiguration

- (RCSwipeActionConfiguration)initWithControlsAction:(int64_t)a3 recordingUUID:(id)a4 actionTitle:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RCSwipeActionConfiguration;
  v11 = [(RCSwipeActionConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_controlsAction = a3;
    objc_storeStrong((id *)&v11->_uuidForAction, a4);
    objc_storeStrong((id *)&v12->_actionTitle, a5);
  }

  return v12;
}

- (int64_t)controlsAction
{
  return self->_controlsAction;
}

- (void)setControlsAction:(int64_t)a3
{
  self->_controlsAction = a3;
}

- (NSString)uuidForAction
{
  return self->_uuidForAction;
}

- (void)setUuidForAction:(id)a3
{
}

- (id)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (BOOL)shouldExecuteCompletionBeforeAction
{
  return self->_shouldExecuteCompletionBeforeAction;
}

- (void)setShouldExecuteCompletionBeforeAction:(BOOL)a3
{
  self->_shouldExecuteCompletionBeforeAction = a3;
}

- (id)customCompletionBlock
{
  return self->_customCompletionBlock;
}

- (void)setCustomCompletionBlock:(id)a3
{
}

- (int64_t)actionStyle
{
  return self->_actionStyle;
}

- (void)setActionStyle:(int64_t)a3
{
  self->_actionStyle = a3;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (UIImage)actionImage
{
  return self->_actionImage;
}

- (void)setActionImage:(id)a3
{
}

- (NSString)actionImageAxLabel
{
  return self->_actionImageAxLabel;
}

- (void)setActionImageAxLabel:(id)a3
{
}

- (UIColor)actionBackgroundColor
{
  return self->_actionBackgroundColor;
}

- (void)setActionBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_actionImageAxLabel, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong(&self->_customCompletionBlock, 0);
  objc_storeStrong(&self->_sourceItem, 0);

  objc_storeStrong((id *)&self->_uuidForAction, 0);
}

@end