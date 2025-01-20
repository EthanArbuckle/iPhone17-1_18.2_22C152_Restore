@interface WBSUserDefinedContentBlocker
- (BOOL)excludeGlobalContentBlockers;
- (NSArray)actions;
- (NSString)host;
- (int64_t)databaseID;
- (int64_t)type;
- (void)setActions:(id)a3;
- (void)setDatabaseID:(int64_t)a3;
- (void)setExcludeGlobalContentBlockers:(BOOL)a3;
- (void)setHost:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation WBSUserDefinedContentBlocker

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (BOOL)excludeGlobalContentBlockers
{
  return self->_excludeGlobalContentBlockers;
}

- (void)setExcludeGlobalContentBlockers:(BOOL)a3
{
  self->_excludeGlobalContentBlockers = a3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end