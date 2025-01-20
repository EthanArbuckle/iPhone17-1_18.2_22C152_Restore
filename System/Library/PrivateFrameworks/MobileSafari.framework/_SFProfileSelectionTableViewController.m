@interface _SFProfileSelectionTableViewController
- (NSArray)profiles;
- (WBProfile)selectedProfile;
- (_SFProfileSelectionTableViewController)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setProfiles:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation _SFProfileSelectionTableViewController

- (_SFProfileSelectionTableViewController)init
{
  return [(_SFProfileSelectionTableViewController *)self initWithStyle:2];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_SFProfileSelectionTableViewController;
  [(_SFProfileSelectionTableViewController *)&v4 viewDidLoad];
  v3 = [(_SFProfileSelectionTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"CellIdentifier"];
}

- (void)setProfiles:(id)a3
{
  objc_super v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_profiles != v4)
  {
    v10 = v4;
    v6 = (NSArray *)[(NSArray *)v4 copy];
    profiles = self->_profiles;
    self->_profiles = v6;

    self->_selectedRow = 0;
    int v8 = [(_SFProfileSelectionTableViewController *)self isViewLoaded];
    v5 = v10;
    if (v8)
    {
      v9 = [(_SFProfileSelectionTableViewController *)self tableView];
      [v9 reloadData];

      v5 = v10;
    }
  }
}

- (WBProfile)selectedProfile
{
  return (WBProfile *)[(NSArray *)self->_profiles objectAtIndexedSubscript:self->_selectedRow];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_profiles count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"CellIdentifier"];
  int v8 = -[NSArray objectAtIndexedSubscript:](self->_profiles, "objectAtIndexedSubscript:", [v6 row]);
  v9 = [v8 title];
  v10 = [v7 textLabel];
  [v10 setText:v9];

  v11 = [v8 symbolImage];
  v12 = [v7 imageView];
  [v12 setImage:v11];

  uint64_t v13 = [v6 row];
  if (v13 == self->_selectedRow) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 0;
  }
  [v7 setAccessoryType:v14];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  int v8 = [MEMORY[0x1E4F28D58] indexPathForRow:self->_selectedRow inSection:0];
  v9 = [v7 cellForRowAtIndexPath:v8];
  [v9 setAccessoryType:0];

  v10 = [v7 cellForRowAtIndexPath:v6];

  [v10 setAccessoryType:3];
  int64_t v11 = [v6 row];

  self->_selectedRow = v11;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void).cxx_destruct
{
}

@end