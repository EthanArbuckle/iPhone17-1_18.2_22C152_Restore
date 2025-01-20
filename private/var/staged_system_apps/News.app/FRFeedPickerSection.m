@interface FRFeedPickerSection
+ (id)feedPickerSectionWithTags:(id)a3 sorter:(id)a4 popularTagIDs:(id)a5 transformBlock:(id)a6;
- (BOOL)containsTag:(id)a3;
- (FRFeedPickerDataSourceSubscriptionSorter)sorter;
- (NSArray)alphabeticalTags;
- (NSArray)mostFrequentlyVisitedTags;
- (NSArray)recentlyOpenedTags;
- (NSArray)tags;
- (NSMutableSet)mutableTags;
- (NSOrderedSet)popularTagIDs;
- (id)_tagsForSortOrder:(unint64_t)a3;
- (id)feedDescriptorsForSort:(unint64_t)a3;
- (id)transformBlock;
- (int64_t)indexOfTag:(id)a3 withSortOrder:(unint64_t)a4;
- (int64_t)numberOfTags;
- (void)_buildSortedArrays;
- (void)addTag:(id)a3;
- (void)addTags:(id)a3;
- (void)removeTag:(id)a3;
- (void)setAlphabeticalTags:(id)a3;
- (void)setMostFrequentlyVisitedTags:(id)a3;
- (void)setMutableTags:(id)a3;
- (void)setPopularTagIDs:(id)a3;
- (void)setRecentlyOpenedTags:(id)a3;
- (void)setSorter:(id)a3;
- (void)setTransformBlock:(id)a3;
@end

@implementation FRFeedPickerSection

+ (id)feedPickerSectionWithTags:(id)a3 sorter:(id)a4 popularTagIDs:(id)a5 transformBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_alloc_init(FRFeedPickerSection);
  if (v9) {
    +[NSMutableSet setWithArray:v9];
  }
  else {
  v14 = +[NSMutableSet set];
  }
  [(FRFeedPickerSection *)v13 setMutableTags:v14];

  [(FRFeedPickerSection *)v13 setSorter:v12];
  [(FRFeedPickerSection *)v13 setPopularTagIDs:v11];

  [(FRFeedPickerSection *)v13 setTransformBlock:v10];
  [(FRFeedPickerSection *)v13 _buildSortedArrays];

  return v13;
}

- (NSArray)tags
{
  v2 = [(FRFeedPickerSection *)self mutableTags];
  id v3 = [v2 copy];
  v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (void)addTag:(id)a3
{
  id v4 = a3;
  v5 = [(FRFeedPickerSection *)self mutableTags];
  [v5 addObject:v4];

  [(FRFeedPickerSection *)self _buildSortedArrays];
}

- (void)addTags:(id)a3
{
  id v4 = a3;
  v5 = [(FRFeedPickerSection *)self mutableTags];
  [v5 addObjectsFromArray:v4];

  [(FRFeedPickerSection *)self _buildSortedArrays];
}

- (void)removeTag:(id)a3
{
  id v4 = a3;
  v5 = [(FRFeedPickerSection *)self mutableTags];
  [v5 removeObject:v4];

  [(FRFeedPickerSection *)self _buildSortedArrays];
}

- (int64_t)indexOfTag:(id)a3 withSortOrder:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(FRFeedPickerSection *)self _tagsForSortOrder:a4];
  id v8 = [v7 indexOfObject:v6];

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074B14();
  }

  return (int64_t)v8;
}

- (BOOL)containsTag:(id)a3
{
  id v4 = a3;
  v5 = [(FRFeedPickerSection *)self tags];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (int64_t)numberOfTags
{
  id v3 = [(FRFeedPickerSection *)self alphabeticalTags];
  id v4 = [v3 count];

  v5 = [(FRFeedPickerSection *)self recentlyOpenedTags];
  id v6 = [v5 count];

  if (v4 != v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074CAC();
  }
  v7 = [(FRFeedPickerSection *)self mostFrequentlyVisitedTags];
  id v8 = [v7 count];

  if (v4 != v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100074BE0();
  }
  return (int64_t)v4;
}

- (id)feedDescriptorsForSort:(unint64_t)a3
{
  id v4 = [(FRFeedPickerSection *)self _tagsForSortOrder:a3];
  v5 = [(FRFeedPickerSection *)self transformBlock];
  id v6 = [v4 fc_arrayByTransformingWithBlock:v5];

  return v6;
}

- (id)_tagsForSortOrder:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(FRFeedPickerSection *)self mostFrequentlyVisitedTags];
  }
  else if (a3 == 1)
  {
    id v3 = [(FRFeedPickerSection *)self recentlyOpenedTags];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(FRFeedPickerSection *)self alphabeticalTags];
  }

  return v3;
}

- (void)_buildSortedArrays
{
  id v3 = [(FRFeedPickerSection *)self sorter];
  id v4 = [(FRFeedPickerSection *)self tags];
  v5 = [v3 sortSubscriptionsAlphabetically:v4];
  [(FRFeedPickerSection *)self setAlphabeticalTags:v5];

  id v6 = [(FRFeedPickerSection *)self sorter];
  v7 = [(FRFeedPickerSection *)self tags];
  id v8 = [(FRFeedPickerSection *)self popularTagIDs];
  id v9 = [v6 sortSubscriptionsByRecency:v7 sortedPopularTagIDs:v8];
  [(FRFeedPickerSection *)self setRecentlyOpenedTags:v9];

  id v13 = [(FRFeedPickerSection *)self tags];
  id v10 = [(FRFeedPickerSection *)self popularTagIDs];
  id v11 = [(FRFeedPickerSection *)self sorter];
  id v12 = tagsSortedByMostFrequentlyVisited(v13, v10, v11);
  [(FRFeedPickerSection *)self setMostFrequentlyVisitedTags:v12];
}

- (NSMutableSet)mutableTags
{
  return self->_mutableTags;
}

- (void)setMutableTags:(id)a3
{
}

- (FRFeedPickerDataSourceSubscriptionSorter)sorter
{
  return self->_sorter;
}

- (void)setSorter:(id)a3
{
}

- (NSOrderedSet)popularTagIDs
{
  return self->_popularTagIDs;
}

- (void)setPopularTagIDs:(id)a3
{
}

- (id)transformBlock
{
  return self->_transformBlock;
}

- (void)setTransformBlock:(id)a3
{
}

- (NSArray)mostFrequentlyVisitedTags
{
  return self->_mostFrequentlyVisitedTags;
}

- (void)setMostFrequentlyVisitedTags:(id)a3
{
}

- (NSArray)recentlyOpenedTags
{
  return self->_recentlyOpenedTags;
}

- (void)setRecentlyOpenedTags:(id)a3
{
}

- (NSArray)alphabeticalTags
{
  return self->_alphabeticalTags;
}

- (void)setAlphabeticalTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphabeticalTags, 0);
  objc_storeStrong((id *)&self->_recentlyOpenedTags, 0);
  objc_storeStrong((id *)&self->_mostFrequentlyVisitedTags, 0);
  objc_storeStrong(&self->_transformBlock, 0);
  objc_storeStrong((id *)&self->_popularTagIDs, 0);
  objc_storeStrong((id *)&self->_sorter, 0);

  objc_storeStrong((id *)&self->_mutableTags, 0);
}

@end