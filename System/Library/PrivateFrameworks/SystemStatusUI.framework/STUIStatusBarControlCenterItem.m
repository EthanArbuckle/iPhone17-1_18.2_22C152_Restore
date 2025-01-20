@interface STUIStatusBarControlCenterItem
+ (STUIStatusBarIdentifier)grabberIdentifier;
- (Class)imageViewClass;
- (STUIStatusBarControlCenterGrabberView)grabberView;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_grabberView;
- (void)setGrabberView:(id)a3;
@end

@implementation STUIStatusBarControlCenterItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA9748];
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[STUIStatusBarControlCenterItem grabberIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(STUIStatusBarControlCenterItem *)self grabberView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarControlCenterItem;
    uint64_t v6 = [(STUIStatusBarIndicatorItem *)&v9 viewForIdentifier:v4];
  }
  v7 = (void *)v6;

  return v7;
}

+ (STUIStatusBarIdentifier)grabberIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"grabberIdentifier"];
}

- (Class)imageViewClass
{
  return (Class)objc_opt_class();
}

- (STUIStatusBarControlCenterGrabberView)grabberView
{
  grabberView = self->_grabberView;
  if (!grabberView)
  {
    [(STUIStatusBarControlCenterItem *)self _create_grabberView];
    grabberView = self->_grabberView;
  }
  return grabberView;
}

- (void)_create_grabberView
{
  v3 = [STUIStatusBarControlCenterGrabberView alloc];
  id v4 = -[STUIStatusBarControlCenterGrabberView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  grabberView = self->_grabberView;
  self->_grabberView = v4;
  MEMORY[0x1F41817F8](v4, grabberView);
}

- (void).cxx_destruct
{
}

- (id)systemImageNameForUpdate:(id)a3
{
  v3 = [a3 data];
  id v4 = [v3 controlCenterEntry];
  id v5 = [v4 imageName];

  return v5;
}

- (void)setGrabberView:(id)a3
{
}

@end