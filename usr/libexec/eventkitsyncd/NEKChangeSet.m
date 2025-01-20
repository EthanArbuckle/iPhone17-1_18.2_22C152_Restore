@interface NEKChangeSet
+ (id)changeSetForEvent;
+ (id)changeSetForReminder;
- (BOOL)hasChangesInNext24hrs;
- (BOOL)isDeferrable;
- (BOOL)isEmpty;
- (BOOL)truncated;
- (NSArray)deletes;
- (NSArray)inserts;
- (NSArray)updates;
- (NSDictionary)deletionMap;
- (NSDictionary)moveMap;
- (id)completion;
- (id)description;
- (int64_t)changeNumber;
- (void)setChangeNumber:(int64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setDeletes:(id)a3;
- (void)setDeletionMap:(id)a3;
- (void)setHasChangesInNext24hrs:(BOOL)a3;
- (void)setInserts:(id)a3;
- (void)setMoveMap:(id)a3;
- (void)setTruncated:(BOOL)a3;
- (void)setUpdates:(id)a3;
@end

@implementation NEKChangeSet

+ (id)changeSetForEvent
{
  v2 = objc_alloc_init(NEKEventChangeSet);

  return v2;
}

+ (id)changeSetForReminder
{
  v2 = objc_alloc_init(NEKReminderChangeSet);

  return v2;
}

- (BOOL)isEmpty
{
  v3 = [(NEKChangeSet *)self inserts];
  v4 = (char *)[v3 count];
  v5 = [(NEKChangeSet *)self updates];
  v6 = &v4[(void)[v5 count]];
  v7 = [(NEKChangeSet *)self deletes];
  LOBYTE(v6) = (char *)[v7 count] + (void)v6 == 0;

  return (char)v6;
}

- (BOOL)isDeferrable
{
  return 0;
}

- (id)description
{
  unsigned int v3 = [(NEKChangeSet *)self isEmpty];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (v3) {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; empty changeset>",
  }
      v5,
      self,
      v9,
      v10,
      v11);
  else {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; %d inserts; %d updates; %d deletes>",
  }
      v5,
      self,
      [(NSArray *)self->_inserts count],
      [(NSArray *)self->_updates count],
  v7 = [(NSArray *)self->_deletes count]);

  return v7;
}

- (NSArray)inserts
{
  return self->_inserts;
}

- (void)setInserts:(id)a3
{
}

- (NSArray)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
}

- (NSArray)deletes
{
  return self->_deletes;
}

- (void)setDeletes:(id)a3
{
}

- (NSDictionary)deletionMap
{
  return self->_deletionMap;
}

- (void)setDeletionMap:(id)a3
{
}

- (NSDictionary)moveMap
{
  return self->_moveMap;
}

- (void)setMoveMap:(id)a3
{
}

- (int64_t)changeNumber
{
  return self->_changeNumber;
}

- (void)setChangeNumber:(int64_t)a3
{
  self->_changeNumber = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)truncated
{
  return self->_truncated;
}

- (void)setTruncated:(BOOL)a3
{
  self->_truncated = a3;
}

- (BOOL)hasChangesInNext24hrs
{
  return self->_hasChangesInNext24hrs;
}

- (void)setHasChangesInNext24hrs:(BOOL)a3
{
  self->_hasChangesInNext24hrs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_moveMap, 0);
  objc_storeStrong((id *)&self->_deletionMap, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);

  objc_storeStrong((id *)&self->_inserts, 0);
}

@end