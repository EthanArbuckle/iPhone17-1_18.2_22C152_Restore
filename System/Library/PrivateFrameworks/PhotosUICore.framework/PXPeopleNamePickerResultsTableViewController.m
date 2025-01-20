@interface PXPeopleNamePickerResultsTableViewController
- (BOOL)hasResults;
- (NSMutableArray)items;
- (PHFace)face;
- (PHPerson)person;
- (PXPeopleNamePickerResultsTableViewController)initWithCoder:(id)a3;
- (PXPeopleNamePickerResultsTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXPeopleNamePickerResultsTableViewController)initWithStyle:(int64_t)a3;
- (PXPeopleNamePickerResultsTableViewController)initWithStyle:(int64_t)a3 person:(id)a4 face:(id)a5;
- (id)contactAtIndexPath:(id)a3;
- (id)personAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setItems:(id)a3;
- (void)updateItemsForSearchString:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleNamePickerResultsTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)setItems:(id)a3
{
}

- (NSMutableArray)items
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1040, 1);
}

- (PHFace)face
{
  return (PHFace *)objc_getProperty(self, a2, 1032, 1);
}

- (PHPerson)person
{
  return (PHPerson *)objc_getProperty(self, a2, 1024, 1);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PXPeopleNamePickerResultsTableViewController *)self items];
  v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "row"));

  v11 = [v10 contact];
  uint64_t v12 = [v10 person];
  v13 = (void *)v12;
  if (v11)
  {
    v14 = [v7 dequeueReusableCellWithIdentifier:@"PXPeopleNamePickerContactCellReuseID" forIndexPath:v8];
    v15 = [v14 subtitleLabel];
    v16 = [v10 subtitle];
    [v15 setAttributedText:v16];

    v17 = [v14 contactAvatarView];
    [v17 setContact:v11];
  }
  else
  {
    if (!v12)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"PXPeopleNamePickerResultsTableViewController.m" lineNumber:137 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v14 = [v7 dequeueReusableCellWithIdentifier:@"PXPeopleNamePickerPersonCellReuseID" forIndexPath:v8];
    [v14 setPerson:v13];
  }
  v18 = [v14 titleLabel];
  v19 = [v10 title];
  [v18 setAttributedText:v19];

  v20 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v14 setBackgroundColor:v20];

  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PXPeopleNamePickerResultsTableViewController *)self items];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)personAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXPeopleNamePickerResultsTableViewController *)self items];
  uint64_t v6 = [v4 row];

  id v7 = [v5 objectAtIndex:v6];

  id v8 = [v7 person];

  return v8;
}

- (id)contactAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXPeopleNamePickerResultsTableViewController *)self items];
  uint64_t v6 = [v4 row];

  id v7 = [v5 objectAtIndex:v6];

  id v8 = [v7 contact];

  return v8;
}

- (BOOL)hasResults
{
  v2 = [(PXPeopleNamePickerResultsTableViewController *)self items];
  uint64_t v3 = [v2 count];

  return v3 > 0;
}

- (void)updateItemsForSearchString:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXPeopleNamePickerResultsTableViewController *)self person];
  uint64_t v6 = [(PXPeopleNamePickerResultsTableViewController *)self face];
  id v7 = +[PXPeopleNamingUtilities itemsForSearchString:v4 person:v5 face:v6];

  id v9 = (id)[v7 mutableCopy];
  [(PXPeopleNamePickerResultsTableViewController *)self setItems:v9];
  id v8 = [(PXPeopleNamePickerResultsTableViewController *)self tableView];
  [v8 reloadData];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PXPeopleNamePickerResultsTableViewController;
  [(PXPeopleNamePickerResultsTableViewController *)&v6 viewDidLoad];
  uint64_t v3 = [(PXPeopleNamePickerResultsTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXPeopleNamePickerPersonCellReuseID"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXPeopleNamePickerContactCellReuseID"];
  [v3 setRowHeight:64.0];
  id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  int64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setTableFooterView:v5];
}

- (PXPeopleNamePickerResultsTableViewController)initWithStyle:(int64_t)a3
{
  int64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleNamePickerResultsTableViewController.m", 68, @"%s is not available as initializer", "-[PXPeopleNamePickerResultsTableViewController initWithStyle:]");

  abort();
}

- (PXPeopleNamePickerResultsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleNamePickerResultsTableViewController.m", 64, @"%s is not available as initializer", "-[PXPeopleNamePickerResultsTableViewController initWithNibName:bundle:]");

  abort();
}

- (PXPeopleNamePickerResultsTableViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleNamePickerResultsTableViewController.m", 60, @"%s is not available as initializer", "-[PXPeopleNamePickerResultsTableViewController initWithCoder:]");

  abort();
}

- (PXPeopleNamePickerResultsTableViewController)initWithStyle:(int64_t)a3 person:(id)a4 face:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleNamePickerResultsTableViewController;
  v11 = [(PXPeopleNamePickerResultsTableViewController *)&v15 initWithStyle:a3];
  if (v11)
  {
    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v11->_items;
    v11->_items = v12;

    objc_storeStrong((id *)&v11->_person, a4);
    objc_storeStrong((id *)&v11->_face, a5);
  }

  return v11;
}

@end