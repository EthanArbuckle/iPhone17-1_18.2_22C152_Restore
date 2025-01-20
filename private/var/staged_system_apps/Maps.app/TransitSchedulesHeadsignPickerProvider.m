@interface TransitSchedulesHeadsignPickerProvider
- (TransitSchedulesHeadsignPickerCollectionViewCellDelegate)delegate;
- (id)collectionView:(id)a3 headsignCellWithIdentifier:(id)a4 indexPath:(id)a5 dataProvider:(id)a6;
- (id)identifiersForDepartureSequences:(id)a3;
- (void)collectionView:(id)a3 selectedHeadsignForDepartureSequence:(id)a4 atIndexPath:(id)a5;
- (void)registerCellsForCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TransitSchedulesHeadsignPickerProvider

- (void)registerCellsForCollectionView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = +[TransitSchedulesHeadsignPickerCollectionViewCell cellIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];
}

- (void)collectionView:(id)a3 selectedHeadsignForDepartureSequence:(id)a4 atIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = a3;
  v8 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, [a5 section]);
  v9 = [v7 cellForItemAtIndexPath:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setSelectedDepartureSequence:v10];
  }
}

- (id)collectionView:(id)a3 headsignCellWithIdentifier:(id)a4 indexPath:(id)a5 dataProvider:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = +[TransitSchedulesHeadsignPickerCollectionViewCell cellIdentifier];
  v13 = [v11 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v13 setDelegate:WeakRetained];

  v15 = [v9 departureSequences];
  v16 = [v9 selectedDepartureSequence];

  [v13 setDepartureSequences:v15 withSelectedDepartureSequence:v16];

  return v13;
}

- (id)identifiersForDepartureSequences:(id)a3
{
  if ([a3 count])
  {
    id v3 = +[TransitSchedulesHeadsignPickerCollectionViewCell cellIdentifier];
    v6 = v3;
    uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    uint64_t v4 = &__NSArray0__struct;
  }

  return v4;
}

- (TransitSchedulesHeadsignPickerCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitSchedulesHeadsignPickerCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end