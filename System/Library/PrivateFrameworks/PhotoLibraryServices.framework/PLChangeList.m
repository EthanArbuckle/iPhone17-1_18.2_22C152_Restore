@interface PLChangeList
- (NSMutableSet)deleted;
- (NSMutableSet)inserted;
- (NSMutableSet)updated;
- (void)cleanupState;
- (void)setDeleted:(id)a3;
- (void)setInserted:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation PLChangeList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
}

- (void)setDeleted:(id)a3
{
}

- (NSMutableSet)deleted
{
  return self->_deleted;
}

- (void)setUpdated:(id)a3
{
}

- (NSMutableSet)updated
{
  return self->_updated;
}

- (void)setInserted:(id)a3
{
}

- (NSMutableSet)inserted
{
  return self->_inserted;
}

- (void)cleanupState
{
  inserted = self->_inserted;
  self->_inserted = 0;

  updated = self->_updated;
  self->_updated = 0;

  deleted = self->_deleted;
  self->_deleted = 0;
}

@end