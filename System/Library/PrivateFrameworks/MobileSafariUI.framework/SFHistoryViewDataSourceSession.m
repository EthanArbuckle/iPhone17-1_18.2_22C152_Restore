@interface SFHistoryViewDataSourceSession
- (BOOL)isEqual:(id)a3;
- (NSDate)lastVisitedDate;
- (NSOrderedSet)historyItems;
- (NSString)identifier;
- (NSString)title;
- (SFHistoryViewDataSourceSession)initWithIdentifier:(id)a3 title:(id)a4 lastVisitedDate:(id)a5 historyItems:(id)a6;
- (id)filteredSessionWithItems:(id)a3;
- (unint64_t)hash;
@end

@implementation SFHistoryViewDataSourceSession

- (SFHistoryViewDataSourceSession)initWithIdentifier:(id)a3 title:(id)a4 lastVisitedDate:(id)a5 historyItems:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SFHistoryViewDataSourceSession;
  v15 = [(SFHistoryViewDataSourceSession *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_title, a4);
    objc_storeStrong((id *)&v16->_lastVisitedDate, a5);
    objc_storeStrong((id *)&v16->_historyItems, a6);
    v17 = v16;
  }

  return v16;
}

- (id)filteredSessionWithItems:(id)a3
{
  id v4 = a3;
  v5 = [SFHistoryViewDataSourceSession alloc];
  identifier = self->_identifier;
  title = self->_title;
  lastVisitedDate = self->_lastVisitedDate;
  v9 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v4];

  v10 = [(SFHistoryViewDataSourceSession *)v5 initWithIdentifier:identifier title:title lastVisitedDate:lastVisitedDate historyItems:v9];
  return v10;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4[1] isEqualToString:self->_identifier];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)lastVisitedDate
{
  return self->_lastVisitedDate;
}

- (NSOrderedSet)historyItems
{
  return self->_historyItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyItems, 0);
  objc_storeStrong((id *)&self->_lastVisitedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end