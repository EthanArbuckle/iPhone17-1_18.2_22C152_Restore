@interface WBSHistoryTag
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)title;
- (WBSHistoryTag)init;
- (WBSHistoryTag)initWithTitle:(id)a3 identifier:(id)a4 databaseID:(int64_t)a5 modificationTimestamp:(double)a6 level:(int64_t)a7;
- (double)modificationTimestamp;
- (int64_t)databaseID;
- (int64_t)level;
- (unint64_t)hash;
@end

@implementation WBSHistoryTag

- (WBSHistoryTag)init
{
  return 0;
}

- (WBSHistoryTag)initWithTitle:(id)a3 identifier:(id)a4 databaseID:(int64_t)a5 modificationTimestamp:(double)a6 level:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSHistoryTag;
  v14 = [(WBSHistoryTag *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    title = v14->_title;
    v14->_title = (NSString *)v15;

    uint64_t v17 = [v13 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    v14->_databaseID = a5;
    v14->_modificationTimestamp = a6;
    v14->_level = a7;
    v19 = v14;
  }

  return v14;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSHistoryTag *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WBSHistoryTag *)v4 identifier];
      char v6 = [v5 isEqualToString:self->_identifier];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)modificationTimestamp
{
  return self->_modificationTimestamp;
}

- (int64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end