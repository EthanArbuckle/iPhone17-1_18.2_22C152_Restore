@interface SearchUIScreenTimeCollectionCell
- (SearchUIScreenTimeView)screenTimeView;
- (void)setScreenTimeView:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIScreenTimeCollectionCell

- (void)updateWithRowModel:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUIScreenTimeCollectionCell;
  id v4 = a3;
  [(SearchUICollectionViewCell *)&v10 updateWithRowModel:v4];
  v5 = [(SearchUIScreenTimeCollectionCell *)self screenTimeView];

  if (!v5)
  {
    v6 = objc_opt_new();
    [(SearchUIScreenTimeCollectionCell *)self setScreenTimeView:v6];

    v7 = [(SearchUIScreenTimeCollectionCell *)self contentView];
    v8 = [(SearchUIScreenTimeCollectionCell *)self screenTimeView];
    [v7 addSubview:v8];
  }
  v9 = [(SearchUIScreenTimeCollectionCell *)self screenTimeView];
  [v9 updateWithRowModel:v4];
}

- (SearchUIScreenTimeView)screenTimeView
{
  return (SearchUIScreenTimeView *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setScreenTimeView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end