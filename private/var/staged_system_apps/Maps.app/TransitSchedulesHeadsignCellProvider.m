@interface TransitSchedulesHeadsignCellProvider
- (id)_identifierForDepartureSequence:(id)a3;
- (id)collectionView:(id)a3 headsignCellWithIdentifier:(id)a4 indexPath:(id)a5 dataProvider:(id)a6;
- (id)identifiersForDepartureSequences:(id)a3;
- (void)collectionView:(id)a3 selectedHeadsignForDepartureSequence:(id)a4 atIndexPath:(id)a5;
- (void)registerCellsForCollectionView:(id)a3;
@end

@implementation TransitSchedulesHeadsignCellProvider

- (id)identifiersForDepartureSequences:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[TransitSchedulesHeadsignCellProvider _identifierForDepartureSequence:](self, "_identifierForDepartureSequence:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (id)_identifierForDepartureSequence:(id)a3
{
  id v3 = a3;
  id v4 = [v3 headsign];
  if ([v4 length])
  {
    v5 = [v3 headsign];
  }
  else
  {
    v5 = &stru_101324E70;
  }

  return v5;
}

- (void)registerCellsForCollectionView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = +[TransitSchedulesHeadsignCollectionViewCell cellIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];
}

- (void)collectionView:(id)a3 selectedHeadsignForDepartureSequence:(id)a4 atIndexPath:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = [v7 section];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v6 indexPathsForSelectedItems];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v14 section] == v8) {
          [v6 deselectItemAtIndexPath:v14 animated:0];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [v6 selectItemAtIndexPath:v7 animated:0 scrollPosition:16];
}

- (id)collectionView:(id)a3 headsignCellWithIdentifier:(id)a4 indexPath:(id)a5 dataProvider:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a3;
  id v11 = +[TransitSchedulesHeadsignCollectionViewCell cellIdentifier];
  uint64_t v12 = [v10 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v9];

  id v13 = [v9 row];
  long long v14 = [v8 departureSequences];
  id v15 = [v14 count];

  if (v13 < v15)
  {
    long long v16 = [v8 departureSequences];
    long long v17 = [v16 objectAtIndexedSubscript:v13];

    long long v18 = [v17 headsign];
    [v12 setHeadsign:v18];
  }

  return v12;
}

@end