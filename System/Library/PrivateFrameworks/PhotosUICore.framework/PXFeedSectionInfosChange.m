@interface PXFeedSectionInfosChange
- (BOOL)shouldReload;
- (NSIndexSet)deletedIndexes;
- (NSIndexSet)insertedIndexes;
- (NSIndexSet)updatedIndexes;
- (NSSet)sectionInfosWithCommentChanges;
- (NSSet)updatedAssets;
- (void)setDeletedIndexes:(id)a3;
- (void)setInsertedIndexes:(id)a3;
- (void)setSectionInfosWithCommentChanges:(id)a3;
- (void)setShouldReload:(BOOL)a3;
- (void)setUpdatedAssets:(id)a3;
- (void)setUpdatedIndexes:(id)a3;
@end

@implementation PXFeedSectionInfosChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAssets, 0);
  objc_storeStrong((id *)&self->_sectionInfosWithCommentChanges, 0);
  objc_storeStrong((id *)&self->_updatedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
}

- (void)setUpdatedAssets:(id)a3
{
}

- (NSSet)updatedAssets
{
  return self->_updatedAssets;
}

- (void)setSectionInfosWithCommentChanges:(id)a3
{
}

- (NSSet)sectionInfosWithCommentChanges
{
  return self->_sectionInfosWithCommentChanges;
}

- (void)setUpdatedIndexes:(id)a3
{
}

- (NSIndexSet)updatedIndexes
{
  return self->_updatedIndexes;
}

- (void)setInsertedIndexes:(id)a3
{
}

- (NSIndexSet)insertedIndexes
{
  return self->_insertedIndexes;
}

- (void)setDeletedIndexes:(id)a3
{
}

- (NSIndexSet)deletedIndexes
{
  return self->_deletedIndexes;
}

- (void)setShouldReload:(BOOL)a3
{
  self->_shouldReload = a3;
}

- (BOOL)shouldReload
{
  return self->_shouldReload;
}

@end