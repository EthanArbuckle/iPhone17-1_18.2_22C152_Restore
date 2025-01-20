@interface MRMigrationBehaviorResult
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (NSString)destinationUID;
- (NSString)reason;
- (NSString)sourceUID;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)action;
- (unint64_t)hash;
- (void)setAction:(int64_t)a3;
- (void)setDestinationUID:(id)a3;
- (void)setError:(id)a3;
- (void)setReason:(id)a3;
- (void)setSourceUID:(id)a3;
@end

@implementation MRMigrationBehaviorResult

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(MRMigrationBehaviorResult *)v2 sourceUID];
  [v3 setObject:v4 forKeyedSubscript:@"sourceUID"];

  v5 = [(MRMigrationBehaviorResult *)v2 destinationUID];
  [v3 setObject:v5 forKeyedSubscript:@"destinationUID"];

  unint64_t v6 = [(MRMigrationBehaviorResult *)v2 action] - 1;
  if (v6 > 2) {
    v7 = @"None";
  }
  else {
    v7 = off_1E57D9D20[v6];
  }
  [v3 setObject:v7 forKeyedSubscript:@"action"];
  v8 = [(MRMigrationBehaviorResult *)v2 reason];
  [v3 setObject:v8 forKeyedSubscript:@"reason"];

  v9 = [(MRMigrationBehaviorResult *)v2 error];
  [v3 setObject:v9 forKeyedSubscript:@"error"];

  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MRMigrationBehaviorResult *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      sourceUID = self->_sourceUID;
      v7 = [(MRMigrationBehaviorResult *)v5 sourceUID];
      if (sourceUID == v7) {
        int v8 = 0;
      }
      else {
        int v8 = [(NSString *)sourceUID isEqual:v7] ^ 1;
      }

      destinationUID = self->_destinationUID;
      v11 = [(MRMigrationBehaviorResult *)v5 destinationUID];
      if (destinationUID == v11) {
        int v12 = 0;
      }
      else {
        int v12 = [(NSString *)destinationUID isEqual:v11] ^ 1;
      }

      reason = self->_reason;
      v14 = [(MRMigrationBehaviorResult *)v5 reason];
      if (reason == v14) {
        int v15 = 0;
      }
      else {
        int v15 = [(NSString *)reason isEqual:v14] ^ 1;
      }

      int64_t action = self->_action;
      uint64_t v17 = [(MRMigrationBehaviorResult *)v5 action];
      error = self->_error;
      v19 = [(MRMigrationBehaviorResult *)v5 error];
      if (error == v19) {
        char v20 = 1;
      }
      else {
        char v20 = [(NSError *)error isEqual:v19];
      }

      if ((v8 | v12 | v15))
      {
        BOOL v9 = 0;
      }
      else if (action == v17)
      {
        BOOL v9 = v20;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceUID hash];
  NSUInteger v4 = [(NSString *)self->_destinationUID hash] ^ v3;
  return v4 ^ [(NSString *)self->_reason hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRMigrationBehaviorResult *)self dictionaryRepresentation];
  unint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (NSString)sourceUID
{
  return self->_sourceUID;
}

- (void)setSourceUID:(id)a3
{
}

- (NSString)destinationUID
{
  return self->_destinationUID;
}

- (void)setDestinationUID:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_int64_t action = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_destinationUID, 0);

  objc_storeStrong((id *)&self->_sourceUID, 0);
}

@end