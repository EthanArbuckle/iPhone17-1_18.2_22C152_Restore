@interface WLKFavorite
- (NSString)ID;
- (NSString)leagueID;
- (NSString)name;
- (WLKFavorite)init;
- (WLKFavorite)initWithDictionary:(id)a3;
- (WLKFavorite)initWithID:(id)a3 name:(id)a4 leagueID:(id)a5;
- (id)description;
@end

@implementation WLKFavorite

- (WLKFavorite)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)WLKFavorite;
    v5 = [(WLKFavorite *)&v17 init];
    if (v5)
    {
      v6 = objc_msgSend(v4, "wlk_stringForKey:", @"id");
      uint64_t v7 = [v6 copy];
      ID = v5->_ID;
      v5->_ID = (NSString *)v7;

      v9 = objc_msgSend(v4, "wlk_stringForKey:", @"name");
      uint64_t v10 = [v9 copy];
      name = v5->_name;
      v5->_name = (NSString *)v10;

      v12 = objc_msgSend(v4, "wlk_stringForKey:", @"leagueId");
      uint64_t v13 = [v12 copy];
      leagueID = v5->_leagueID;
      v5->_leagueID = (NSString *)v13;
    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (WLKFavorite)init
{
  return [(WLKFavorite *)self initWithDictionary:0];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p name:%@ ID:%@ leagueID:%@>", v5, self, self->_name, self->_ID, self->_leagueID];

  return v6;
}

- (WLKFavorite)initWithID:(id)a3 name:(id)a4 leagueID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WLKFavorite;
  v11 = [(WLKFavorite *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    ID = v11->_ID;
    v11->_ID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    leagueID = v11->_leagueID;
    v11->_leagueID = (NSString *)v16;
  }
  return v11;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)leagueID
{
  return self->_leagueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leagueID, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

@end