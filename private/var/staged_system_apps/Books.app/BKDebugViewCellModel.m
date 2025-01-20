@interface BKDebugViewCellModel
+ (id)modelWithAccessoryType:(int64_t)a3;
+ (id)modelWithAccessoryView:(id)a3;
+ (id)modelWithDetailLineBreakMode:(int64_t)a3 detailTextBlock:(id)a4;
- (UIView)accessoryView;
- (id)detailTextBlock;
- (id)userInteractionEnabledBlock;
- (int64_t)accessoryType;
- (int64_t)detailLineBreakMode;
- (void)setAccessoryType:(int64_t)a3;
- (void)setAccessoryView:(id)a3;
- (void)setDetailLineBreakMode:(int64_t)a3;
- (void)setDetailTextBlock:(id)a3;
- (void)setUserInteractionEnabledBlock:(id)a3;
@end

@implementation BKDebugViewCellModel

+ (id)modelWithAccessoryView:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(BKDebugViewCellModel);
  [(BKDebugViewCellModel *)v4 setAccessoryView:v3];

  return v4;
}

+ (id)modelWithAccessoryType:(int64_t)a3
{
  v4 = objc_alloc_init(BKDebugViewCellModel);
  [(BKDebugViewCellModel *)v4 setAccessoryType:a3];

  return v4;
}

+ (id)modelWithDetailLineBreakMode:(int64_t)a3 detailTextBlock:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(BKDebugViewCellModel);
  [(BKDebugViewCellModel *)v6 setDetailLineBreakMode:a3];
  [(BKDebugViewCellModel *)v6 setDetailTextBlock:v5];

  return v6;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(int64_t)a3
{
  self->_accessoryType = a3;
}

- (id)detailTextBlock
{
  return self->_detailTextBlock;
}

- (void)setDetailTextBlock:(id)a3
{
}

- (int64_t)detailLineBreakMode
{
  return self->_detailLineBreakMode;
}

- (void)setDetailLineBreakMode:(int64_t)a3
{
  self->_detailLineBreakMode = a3;
}

- (id)userInteractionEnabledBlock
{
  return self->_userInteractionEnabledBlock;
}

- (void)setUserInteractionEnabledBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInteractionEnabledBlock, 0);
  objc_storeStrong(&self->_detailTextBlock, 0);

  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end