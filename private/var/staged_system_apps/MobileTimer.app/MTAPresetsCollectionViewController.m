@interface MTAPresetsCollectionViewController
+ (id)presetFlowLayout;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MTAPresetsCollectionViewController)initWithItems:(id)a3 presetsDelegate:(id)a4;
- (NSArray)items;
- (TimerPresetsDelegate)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setItems:(id)a3;
- (void)viewDidLoad;
@end

@implementation MTAPresetsCollectionViewController

- (MTAPresetsCollectionViewController)initWithItems:(id)a3 presetsDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() presetFlowLayout];
  v11.receiver = self;
  v11.super_class = (Class)MTAPresetsCollectionViewController;
  v9 = [(MTAPresetsCollectionViewController *)&v11 initWithCollectionViewLayout:v8];

  if (v9)
  {
    [(MTAPresetsCollectionViewController *)v9 setItems:v6];
    [(MTAPresetsCollectionViewController *)v9 setDelegate:v7];
  }

  return v9;
}

+ (id)presetFlowLayout
{
  id v2 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v2 setScrollDirection:1];
  [v2 setMinimumInteritemSpacing:16.0];
  [v2 setMinimumLineSpacing:16.0];

  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MTAPresetsCollectionViewController;
  [(MTAPresetsCollectionViewController *)&v5 viewDidLoad];
  v3 = [(MTAPresetsCollectionViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PresetCell"];

  v4 = [(MTAPresetsCollectionViewController *)self collectionView];
  [v4 setShowsHorizontalScrollIndicator:0];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(MTAPresetsCollectionViewController *)self items];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"PresetCell" forIndexPath:v6];
  v8 = [(MTAPresetsCollectionViewController *)self items];
  id v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];
  [v7 setPresetItem:v10];

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5 = 80.0;
  double v6 = 80.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v4 = [a3 cellForItemAtIndexPath:a4];
  [v4 setHighlighted:1];
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v4 = [a3 cellForItemAtIndexPath:a4];
  [v4 setHighlighted:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v9 = [(MTAPresetsCollectionViewController *)self delegate];
  double v6 = [(MTAPresetsCollectionViewController *)self items];
  id v7 = [v5 row];

  v8 = [v6 objectAtIndexedSubscript:v7];
  [v8 duration];
  [v9 didSelectPresetWithDuration:];
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (TimerPresetsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TimerPresetsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_items, 0);
}

@end