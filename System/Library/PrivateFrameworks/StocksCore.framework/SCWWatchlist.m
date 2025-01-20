@interface SCWWatchlist
- (NSArray)symbols;
- (NSNumber)displayState;
- (NSNumber)sortOrderState;
- (NSNumber)sortState;
- (NSString)identifier;
- (NSString)name;
- (SCWWatchlist)initWithIdentifier:(id)a3 name:(id)a4 symbols:(id)a5 sortState:(id)a6 sortOrderState:(id)a7 displayState:(id)a8;
- (id)description;
@end

@implementation SCWWatchlist

- (SCWWatchlist)initWithIdentifier:(id)a3 name:(id)a4 symbols:(id)a5 sortState:(id)a6 sortOrderState:(id)a7 displayState:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SCWWatchlist;
  v18 = [(SCWWatchlist *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_symbols, a5);
    objc_storeStrong((id *)&v19->_sortState, a6);
    objc_storeStrong((id *)&v19->_sortOrderState, a7);
    objc_storeStrong((id *)&v19->_displayState, a8);
  }

  return v19;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SCWWatchlist *)self name];
  v5 = [(SCWWatchlist *)self symbols];
  v6 = [(SCWWatchlist *)self sortState];
  v7 = [(SCWWatchlist *)self sortOrderState];
  v8 = [(SCWWatchlist *)self displayState];
  v9 = [v3 stringWithFormat:@"<SCWWatchlist %p, name=%@ symbols=%@ sortState=%@ sortOrderState=%@ displayState=%@>", self, v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)symbols
{
  return self->_symbols;
}

- (NSNumber)sortState
{
  return self->_sortState;
}

- (NSNumber)sortOrderState
{
  return self->_sortOrderState;
}

- (NSNumber)displayState
{
  return self->_displayState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayState, 0);
  objc_storeStrong((id *)&self->_sortOrderState, 0);
  objc_storeStrong((id *)&self->_sortState, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end