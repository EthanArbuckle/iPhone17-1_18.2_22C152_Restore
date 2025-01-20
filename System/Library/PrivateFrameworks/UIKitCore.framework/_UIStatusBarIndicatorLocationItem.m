@interface _UIStatusBarIndicatorLocationItem
+ (_UIStatusBarIdentifier)prominentDisplayIdentifier;
+ (id)groupWithPriority:(int64_t)a3;
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (_UIStatusBarImageView)prominentImageView;
- (_UIStatusBarIndicatorLocationItem)initWithIdentifier:(id)a3 statusBar:(id)a4;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (id)indicatorEntryKey;
- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4;
- (id)systemImageNameForUpdate:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (int64_t)previousType;
- (void)_create_prominentImageView;
- (void)setPreviousType:(int64_t)a3;
- (void)setProminentImageView:(id)a3;
@end

@implementation _UIStatusBarIndicatorLocationItem

+ (id)groupWithPriority:(int64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = [a1 defaultDisplayIdentifier];
  v6 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v5 priority:1];

  v7 = [a1 prominentDisplayIdentifier];
  v8 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v7 priority:2];
  v15[0] = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v10 = [v8 excludingPlacements:v9];

  v14[0] = v6;
  v14[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v12 = +[_UIStatusBarDisplayItemPlacementGroup groupWithPriority:a3 placements:v11];

  [v12 setRegularPlacement:v6];
  [v12 setProminentPlacement:v10];

  return v12;
}

+ (_UIStatusBarIdentifier)prominentDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"prominentDisplayIdentifier"];
}

- (_UIStatusBarIndicatorLocationItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarIndicatorLocationItem;
  result = [(_UIStatusBarItem *)&v5 initWithIdentifier:a3 statusBar:a4];
  if (result) {
    result->_previousType = -1;
  }
  return result;
}

- (id)indicatorEntryKey
{
  return @"locationEntry";
}

- (id)systemImageNameForUpdate:(id)a3
{
  v3 = [a3 data];
  v4 = [v3 locationEntry];
  uint64_t v5 = [v4 type];

  if (v5 == 1) {
    return @"location";
  }
  else {
    return @"location.fill";
  }
}

- (_UIStatusBarImageView)prominentImageView
{
  prominentImageView = self->_prominentImageView;
  if (!prominentImageView)
  {
    [(_UIStatusBarIndicatorLocationItem *)self _create_prominentImageView];
    prominentImageView = self->_prominentImageView;
  }
  return prominentImageView;
}

- (void)_create_prominentImageView
{
  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  prominentImageView = self->_prominentImageView;
  self->_prominentImageView = v4;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_UIStatusBarIndicatorLocationItem;
  id v4 = a3;
  uint64_t v5 = [(_UIStatusBarItem *)&v16 createDisplayItemForIdentifier:v4];
  objc_msgSend((id)objc_opt_class(), "prominentDisplayIdentifier", v16.receiver, v16.super_class);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = +[UIImage _systemImageNamed:@"location.circle.fill"];
    v8 = [v7 imageWithRenderingMode:1];

    [v8 alignmentRectInsets];
    v13 = objc_msgSend(v8, "imageWithAlignmentRectInsets:", v9 + 0.0, v10 + 1.75, v11 + 0.0, v12 + 1.0);

    v14 = [(_UIStatusBarIndicatorLocationItem *)self prominentImageView];
    [v14 setImage:v13];
  }
  return v5;
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() prominentDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(_UIStatusBarIndicatorLocationItem *)self prominentImageView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarIndicatorLocationItem;
    uint64_t v6 = [(_UIStatusBarIndicatorItem *)&v9 viewForIdentifier:v4];
  }
  v7 = (void *)v6;

  return v7;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  objc_super v9 = [(id)objc_opt_class() prominentDisplayIdentifier];

  if (v8 == v9)
  {
    double v11 = [v7 locationEntry];
    if ([v11 isEnabled])
    {
      double v12 = [v7 locationEntry];
      unsigned __int8 v10 = [v12 type] == 2;
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIStatusBarIndicatorLocationItem;
    unsigned __int8 v10 = [(_UIStatusBarItem *)&v14 canEnableDisplayItem:v6 fromData:v7];
  }

  return v10;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 identifier];
  objc_super v9 = [(id)objc_opt_class() defaultDisplayIdentifier];
  if (v8 != v9)
  {

LABEL_18:
    v18 = 0;
    goto LABEL_19;
  }
  int v10 = [v6 dataChanged];

  if (!v10) {
    goto LABEL_18;
  }
  double v11 = [v6 data];
  double v12 = [v11 locationEntry];
  int64_t v13 = [v12 type];

  int64_t previousType = self->_previousType;
  BOOL v15 = previousType == 2 && v13 == 0;
  if (v15
    || (!previousType ? (BOOL v16 = v13 == 2) : (BOOL v16 = 0),
        !v16 ? (char v17 = 0) : (char v17 = 1),
        v13 == previousType || previousType == -1 || (v17 & 1) != 0))
  {
    v20.receiver = self;
    v20.super_class = (Class)_UIStatusBarIndicatorLocationItem;
    v18 = [(_UIStatusBarIndicatorItem *)&v20 applyUpdate:v6 toDisplayItem:v7];
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63___UIStatusBarIndicatorLocationItem_applyUpdate_toDisplayItem___block_invoke;
    v21[3] = &unk_1E53053A0;
    id v22 = v6;
    v23 = self;
    v18 = +[_UIStatusBarAnimation animationWithBlock:v21];
  }
  self->_int64_t previousType = v13;
LABEL_19:

  return v18;
}

- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4
{
  id v4 = a4;
  id v5 = [(id)objc_opt_class() prominentDisplayIdentifier];

  if (v5 == v4)
  {
    id v6 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
    [v6 setSymbolScale:2];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)setProminentImageView:(id)a3
{
}

- (int64_t)previousType
{
  return self->_previousType;
}

- (void)setPreviousType:(int64_t)a3
{
  self->_int64_t previousType = a3;
}

- (void).cxx_destruct
{
}

@end