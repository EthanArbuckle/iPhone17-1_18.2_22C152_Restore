@interface PKCollectionViewItemsDiff
- (NSArray)changedIndexPaths;
- (NSArray)deletedIndexPaths;
- (NSArray)insertedIndexPaths;
- (NSArray)movedFromIndexPaths;
- (NSArray)movedToIndexPaths;
- (NSIndexSet)deletedSections;
- (NSIndexSet)insertedSections;
- (void)setChangedIndexPaths:(id)a3;
- (void)setDeletedIndexPaths:(id)a3;
- (void)setDeletedSections:(id)a3;
- (void)setInsertedIndexPaths:(id)a3;
- (void)setInsertedSections:(id)a3;
- (void)setMovedFromIndexPaths:(id)a3;
- (void)setMovedToIndexPaths:(id)a3;
@end

@implementation PKCollectionViewItemsDiff

- (NSIndexSet)insertedSections
{
  return self->_insertedSections;
}

- (void)setInsertedSections:(id)a3
{
}

- (NSIndexSet)deletedSections
{
  return self->_deletedSections;
}

- (void)setDeletedSections:(id)a3
{
}

- (NSArray)changedIndexPaths
{
  return self->_changedIndexPaths;
}

- (void)setChangedIndexPaths:(id)a3
{
}

- (NSArray)movedFromIndexPaths
{
  return self->_movedFromIndexPaths;
}

- (void)setMovedFromIndexPaths:(id)a3
{
}

- (NSArray)movedToIndexPaths
{
  return self->_movedToIndexPaths;
}

- (void)setMovedToIndexPaths:(id)a3
{
}

- (NSArray)deletedIndexPaths
{
  return self->_deletedIndexPaths;
}

- (void)setDeletedIndexPaths:(id)a3
{
}

- (NSArray)insertedIndexPaths
{
  return self->_insertedIndexPaths;
}

- (void)setInsertedIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedIndexPaths, 0);
  objc_storeStrong((id *)&self->_movedToIndexPaths, 0);
  objc_storeStrong((id *)&self->_movedFromIndexPaths, 0);
  objc_storeStrong((id *)&self->_changedIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);

  objc_storeStrong((id *)&self->_insertedSections, 0);
}

@end