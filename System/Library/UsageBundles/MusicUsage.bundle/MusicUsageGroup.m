@interface MusicUsageGroup
- (BOOL)isIncludedInLocalGroup;
- (BOOL)showsItemArtwork;
- (MusicUsageGroup)init;
- (NSArray)usageItems;
- (NSString)categoryIdentifier;
- (NSString)groupName;
- (NSString)groupSpecifierIdentifier;
- (unint64_t)groupSize;
- (unint64_t)numberOfUsageItems;
- (void)addUsageItem:(id)a3;
- (void)removeUsageItem:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupSize:(unint64_t)a3;
- (void)setGroupSpecifierIdentifier:(id)a3;
- (void)setIncludedInLocalGroup:(BOOL)a3;
- (void)setShowsItemArtwork:(BOOL)a3;
- (void)updateGroupSize;
@end

@implementation MusicUsageGroup

- (MusicUsageGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicUsageGroup;
  v2 = [(MusicUsageGroup *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    mutableUsageItems = v2->_mutableUsageItems;
    v2->_mutableUsageItems = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)updateGroupSize
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(MusicUsageGroup *)self usageItems];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 childUsageGroup];

        if (v10)
        {
          v11 = [v9 childUsageGroup];
          v12 = (char *)[v11 groupSize];
        }
        else
        {
          v11 = [v9 itemCollection];
          v12 = MusicUsageFileSizeForMediaItemCollection(v11);
        }
        v13 = v12;

        v6 += (uint64_t)v13;
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  [(MusicUsageGroup *)self setGroupSize:v6];
}

- (void)addUsageItem:(id)a3
{
  id v4 = a3;
  [v4 setUsageGroup:self];
  [(NSMutableArray *)self->_mutableUsageItems addObject:v4];
}

- (void)removeUsageItem:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_mutableUsageItems, "containsObject:"))
  {
    [v4 setUsageGroup:0];
    [(NSMutableArray *)self->_mutableUsageItems removeObject:v4];
  }
}

- (unint64_t)numberOfUsageItems
{
  return (unint64_t)[(NSMutableArray *)self->_mutableUsageItems count];
}

- (NSArray)usageItems
{
  id v2 = [(NSMutableArray *)self->_mutableUsageItems copy];

  return (NSArray *)v2;
}

- (NSString)groupSpecifierIdentifier
{
  return self->_groupSpecifierIdentifier;
}

- (void)setGroupSpecifierIdentifier:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (unint64_t)groupSize
{
  return self->_groupSize;
}

- (void)setGroupSize:(unint64_t)a3
{
  self->_groupSize = a3;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (BOOL)isIncludedInLocalGroup
{
  return self->_includedInLocalGroup;
}

- (void)setIncludedInLocalGroup:(BOOL)a3
{
  self->_includedInLocalGroup = a3;
}

- (BOOL)showsItemArtwork
{
  return self->_showsItemArtwork;
}

- (void)setShowsItemArtwork:(BOOL)a3
{
  self->_showsItemArtwork = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_groupSpecifierIdentifier, 0);

  objc_storeStrong((id *)&self->_mutableUsageItems, 0);
}

@end