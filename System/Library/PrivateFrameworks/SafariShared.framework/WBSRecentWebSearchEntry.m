@interface WBSRecentWebSearchEntry
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)searchString;
- (WBSRecentWebSearchEntry)init;
- (WBSRecentWebSearchEntry)initWithDictionaryRepresentation:(id)a3;
- (WBSRecentWebSearchEntry)initWithSearchString:(id)a3;
- (WBSRecentWebSearchEntry)initWithSearchString:(id)a3 date:(id)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation WBSRecentWebSearchEntry

- (WBSRecentWebSearchEntry)initWithSearchString:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSRecentWebSearchEntry;
  v8 = [(WBSRecentWebSearchEntry *)&v15 init];
  if (v8 && [v6 length])
  {
    uint64_t v9 = [v6 copy];
    searchString = v8->_searchString;
    v8->_searchString = (NSString *)v9;

    if (v7)
    {
      v11 = (NSDate *)v7;
    }
    else
    {
      v11 = [MEMORY[0x1E4F1C9C8] date];
    }
    date = v8->_date;
    v8->_date = v11;

    v12 = v8;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WBSRecentWebSearchEntry)initWithSearchString:(id)a3
{
  return [(WBSRecentWebSearchEntry *)self initWithSearchString:a3 date:0];
}

- (WBSRecentWebSearchEntry)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_stringForKey:", @"SearchString");
  id v6 = objc_msgSend(v4, "safari_dateForKey:", @"Date");
  id v7 = [(WBSRecentWebSearchEntry *)self initWithSearchString:v5 date:v6];

  return v7;
}

- (WBSRecentWebSearchEntry)init
{
  return [(WBSRecentWebSearchEntry *)self initWithSearchString:0 date:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSRecentWebSearchEntry *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = [MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled];
      searchString = self->_searchString;
      if (v5)
      {
        id v7 = [(WBSRecentWebSearchEntry *)v4 searchString];
        char v8 = [(NSString *)searchString safari_isCaseInsensitiveEqualToString:v7];
      }
      else
      {
        id v7 = [(WBSRecentWebSearchEntry *)v4 searchString];
        char v8 = [(NSString *)searchString isEqualToString:v7];
      }
      BOOL v9 = v8;
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
  return [(NSString *)self->_searchString hash];
}

- (id)dictionaryRepresentation
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"SearchString";
  v5[1] = @"Date";
  date = self->_date;
  v6[0] = self->_searchString;
  v6[1] = date;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; searchString = \"%@\"; date = %@>",
    v5,
    self,
    self->_searchString,
  id v6 = self->_date);

  return v6;
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end