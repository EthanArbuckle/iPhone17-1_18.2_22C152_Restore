@interface CACCorrectionsCollectionViewController
- (BOOL)_canShowWhileLocked;
- (CACCorrectionsCollectionViewController)init;
- (CACCorrectionsCollectionViewControllerDelegate)delegate;
- (NSArray)alternatives;
- (NSArray)emojis;
- (NSString)text;
- (id)_itemsInSection:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_didTapCancel:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setAlternatives:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmojis:(id)a3;
- (void)setText:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CACCorrectionsCollectionViewController

- (CACCorrectionsCollectionViewController)init
{
  v3 = objc_opt_new();
  objc_msgSend(v3, "setEstimatedItemSize:", 40.0, 40.0);
  v4 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [v4 scaledValueForValue:8.0];
  objc_msgSend(v3, "setSectionInset:", v5, v5, v5, v5);
  v6 = [(CACCorrectionsCollectionViewController *)self initWithCollectionViewLayout:v3];

  return v6;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)CACCorrectionsCollectionViewController;
  [(CACCorrectionsCollectionViewController *)&v9 viewDidLoad];
  v3 = +[CACLocaleUtilities localizedUIStringForKey:@"Corrections.Title"];
  [(CACCorrectionsCollectionViewController *)self setTitle:v3];

  v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__didTapCancel_];
  double v5 = [(CACCorrectionsCollectionViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  v6 = [MEMORY[0x263F825C8] whiteColor];
  v7 = [(CACCorrectionsCollectionViewController *)self collectionView];
  [v7 setBackgroundColor:v6];

  v8 = [(CACCorrectionsCollectionViewController *)self collectionView];
  [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Cell"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACCorrectionsCollectionViewController;
  [(CACCorrectionsCollectionViewController *)&v5 viewWillAppear:a3];
  v4 = [(CACCorrectionsCollectionViewController *)self collectionView];
  [v4 reloadData];
}

- (void)_didTapCancel:(id)a3
{
  id v4 = [(CACCorrectionsCollectionViewController *)self delegate];
  [v4 dismissCorrectionsCollectionViewController:self];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (id)_itemsInSection:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(CACCorrectionsCollectionViewController *)self emojis];
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(CACCorrectionsCollectionViewController *)self alternatives];
  }
  return v3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(CACCorrectionsCollectionViewController *)self _itemsInSection:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:v6];
  v8 = -[CACCorrectionsCollectionViewController _itemsInSection:](self, "_itemsInSection:", [v6 section]);
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];
  v11 = [v7 textLabel];
  [v11 setText:v10];

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v9 = [(CACCorrectionsCollectionViewController *)self delegate];
  id v6 = -[CACCorrectionsCollectionViewController _itemsInSection:](self, "_itemsInSection:", [v5 section]);
  uint64_t v7 = [v5 row];

  v8 = [v6 objectAtIndexedSubscript:v7];
  [v9 correctionsCollectionViewController:self didSelectItemWithText:v8];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCorrectionsCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACCorrectionsCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
}

- (NSArray)emojis
{
  return self->_emojis;
}

- (void)setEmojis:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojis, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end