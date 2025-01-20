@interface FRPersonalizationAutoFavorites
+ (BOOL)supportsSecureCoding;
- (FRPersonalizationAutoFavorites)initWithCoder:(id)a3;
- (NSDictionary)autoFavoriteTagIDsToScores;
- (NSSet)appUsageAutoFavoriteCandidates;
- (NSSet)autoFavoriteTagIDs;
- (NSSet)defaultCandidates;
- (NSSet)existingInternalSignalAutoFavoriteCandidates;
- (NSSet)groupableCandidates;
- (NSSet)groupableFavoriteTagIDs;
- (NSSet)internalSignalAutoFavoriteCandidates;
- (NSSet)locationAutoFavoriteCandidates;
- (NSSet)portraitAutoFavoriteCandidates;
- (NSSet)safariAutoFavoriteCandidates;
- (id)activeAppUsageAutoFavorites;
- (id)activeInternalUsageAutoFavorites;
- (id)activeLocationAutoFavorites;
- (id)activePortraitAutoFavorites;
- (id)activeSafariAutoFavorites;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppUsageAutoFavoriteCandidates:(id)a3;
- (void)setAutoFavoriteTagIDsToScores:(id)a3;
- (void)setDefaultCandidates:(id)a3;
- (void)setExistingInternalSignalAutoFavoriteCandidates:(id)a3;
- (void)setGroupableCandidates:(id)a3;
- (void)setGroupableFavoriteTagIDs:(id)a3;
- (void)setInternalSignalAutoFavoriteCandidates:(id)a3;
- (void)setLocationAutoFavoriteCandidates:(id)a3;
- (void)setPortraitAutoFavoriteCandidates:(id)a3;
- (void)setSafariAutoFavoriteCandidates:(id)a3;
@end

@implementation FRPersonalizationAutoFavorites

- (FRPersonalizationAutoFavorites)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FRPersonalizationAutoFavorites;
  v5 = [(FRPersonalizationAutoFavorites *)&v22 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v8 forKey:@"autoFavoriteTagIDsToScores"];
    [(FRPersonalizationAutoFavorites *)v5 setAutoFavoriteTagIDsToScores:v11];

    v12 = [v4 decodeObjectOfClasses:v10 forKey:@"groupableFavoriteTagIDs"];
    [(FRPersonalizationAutoFavorites *)v5 setGroupableFavoriteTagIDs:v12];

    v13 = [v4 decodeObjectOfClasses:v10 forKey:@"defaultCandidates"];
    [(FRPersonalizationAutoFavorites *)v5 setDefaultCandidates:v13];

    v14 = [v4 decodeObjectOfClasses:v10 forKey:@"internalSignalAutoFavoriteCandidates"];
    [(FRPersonalizationAutoFavorites *)v5 setInternalSignalAutoFavoriteCandidates:v14];

    v15 = [v4 decodeObjectOfClasses:v10 forKey:@"existingInternalSignalAutoFavoriteCandidates"];
    [(FRPersonalizationAutoFavorites *)v5 setExistingInternalSignalAutoFavoriteCandidates:v15];

    v16 = [v4 decodeObjectOfClasses:v10 forKey:@"groupableCandidates"];
    [(FRPersonalizationAutoFavorites *)v5 setGroupableCandidates:v16];

    v17 = [v4 decodeObjectOfClasses:v10 forKey:@"portraitAutoFavoriteCandidates"];
    [(FRPersonalizationAutoFavorites *)v5 setPortraitAutoFavoriteCandidates:v17];

    v18 = [v4 decodeObjectOfClasses:v10 forKey:@"appUsageAutoFavoriteCandidates"];
    [(FRPersonalizationAutoFavorites *)v5 setAppUsageAutoFavoriteCandidates:v18];

    v19 = [v4 decodeObjectOfClasses:v10 forKey:@"safariAutoFavoriteCandidates"];
    [(FRPersonalizationAutoFavorites *)v5 setSafariAutoFavoriteCandidates:v19];

    v20 = [v4 decodeObjectOfClasses:v10 forKey:@"locationAutoFavoriteCandidates"];
    [(FRPersonalizationAutoFavorites *)v5 setLocationAutoFavoriteCandidates:v20];
  }
  return v5;
}

- (void)setSafariAutoFavoriteCandidates:(id)a3
{
}

- (void)setPortraitAutoFavoriteCandidates:(id)a3
{
}

- (void)setLocationAutoFavoriteCandidates:(id)a3
{
}

- (void)setInternalSignalAutoFavoriteCandidates:(id)a3
{
}

- (void)setGroupableFavoriteTagIDs:(id)a3
{
}

- (void)setGroupableCandidates:(id)a3
{
}

- (void)setExistingInternalSignalAutoFavoriteCandidates:(id)a3
{
}

- (void)setDefaultCandidates:(id)a3
{
}

- (void)setAutoFavoriteTagIDsToScores:(id)a3
{
}

- (void)setAppUsageAutoFavoriteCandidates:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(FRPersonalizationAutoFavorites *)self autoFavoriteTagIDsToScores];
  [v4 setAutoFavoriteTagIDsToScores:v5];

  uint64_t v6 = [(FRPersonalizationAutoFavorites *)self groupableFavoriteTagIDs];
  [v4 setGroupableFavoriteTagIDs:v6];

  uint64_t v7 = [(FRPersonalizationAutoFavorites *)self defaultCandidates];
  [v4 setDefaultCandidates:v7];

  v8 = [(FRPersonalizationAutoFavorites *)self internalSignalAutoFavoriteCandidates];
  [v4 setInternalSignalAutoFavoriteCandidates:v8];

  uint64_t v9 = [(FRPersonalizationAutoFavorites *)self existingInternalSignalAutoFavoriteCandidates];
  [v4 setExistingInternalSignalAutoFavoriteCandidates:v9];

  v10 = [(FRPersonalizationAutoFavorites *)self groupableCandidates];
  [v4 setGroupableCandidates:v10];

  v11 = [(FRPersonalizationAutoFavorites *)self portraitAutoFavoriteCandidates];
  [v4 setPortraitAutoFavoriteCandidates:v11];

  v12 = [(FRPersonalizationAutoFavorites *)self appUsageAutoFavoriteCandidates];
  [v4 setAppUsageAutoFavoriteCandidates:v12];

  v13 = [(FRPersonalizationAutoFavorites *)self safariAutoFavoriteCandidates];
  [v4 setSafariAutoFavoriteCandidates:v13];

  v14 = [(FRPersonalizationAutoFavorites *)self locationAutoFavoriteCandidates];
  [v4 setLocationAutoFavoriteCandidates:v14];

  return v4;
}

- (NSSet)autoFavoriteTagIDs
{
  v2 = [(FRPersonalizationAutoFavorites *)self autoFavoriteTagIDsToScores];
  v3 = [v2 allKeys];
  id v4 = +[NSSet setWithArray:v3];

  return (NSSet *)v4;
}

- (id)activeAppUsageAutoFavorites
{
  v3 = [(FRPersonalizationAutoFavorites *)self appUsageAutoFavoriteCandidates];
  id v4 = v3;
  if (!v3) {
    id v4 = objc_opt_new();
  }
  v5 = [(FRPersonalizationAutoFavorites *)self autoFavoriteTagIDs];
  uint64_t v6 = [v4 fc_setByIntersectingSet:v5];

  if (!v3) {

  }
  return v6;
}

- (id)activeSafariAutoFavorites
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100033ED0;
  v4[3] = &unk_1000C7548;
  v4[4] = self;
  v2 = +[NSSet fc_set:v4];

  return v2;
}

- (id)activePortraitAutoFavorites
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003400C;
  v4[3] = &unk_1000C7548;
  v4[4] = self;
  v2 = +[NSSet fc_set:v4];

  return v2;
}

- (id)activeLocationAutoFavorites
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034168;
  v4[3] = &unk_1000C7548;
  v4[4] = self;
  v2 = +[NSSet fc_set:v4];

  return v2;
}

- (id)activeInternalUsageAutoFavorites
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000342E4;
  v4[3] = &unk_1000C7548;
  v4[4] = self;
  v2 = +[NSSet fc_set:v4];

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FRPersonalizationAutoFavorites *)self autoFavoriteTagIDsToScores];
  [v4 encodeObject:v5 forKey:@"autoFavoriteTagIDsToScores"];

  uint64_t v6 = [(FRPersonalizationAutoFavorites *)self groupableFavoriteTagIDs];
  [v4 encodeObject:v6 forKey:@"groupableFavoriteTagIDs"];

  uint64_t v7 = [(FRPersonalizationAutoFavorites *)self defaultCandidates];
  [v4 encodeObject:v7 forKey:@"defaultCandidates"];

  v8 = [(FRPersonalizationAutoFavorites *)self internalSignalAutoFavoriteCandidates];
  [v4 encodeObject:v8 forKey:@"internalSignalAutoFavoriteCandidates"];

  uint64_t v9 = [(FRPersonalizationAutoFavorites *)self existingInternalSignalAutoFavoriteCandidates];
  [v4 encodeObject:v9 forKey:@"existingInternalSignalAutoFavoriteCandidates"];

  v10 = [(FRPersonalizationAutoFavorites *)self groupableCandidates];
  [v4 encodeObject:v10 forKey:@"groupableCandidates"];

  v11 = [(FRPersonalizationAutoFavorites *)self portraitAutoFavoriteCandidates];
  [v4 encodeObject:v11 forKey:@"portraitAutoFavoriteCandidates"];

  v12 = [(FRPersonalizationAutoFavorites *)self appUsageAutoFavoriteCandidates];
  [v4 encodeObject:v12 forKey:@"appUsageAutoFavoriteCandidates"];

  v13 = [(FRPersonalizationAutoFavorites *)self safariAutoFavoriteCandidates];
  [v4 encodeObject:v13 forKey:@"safariAutoFavoriteCandidates"];

  id v14 = [(FRPersonalizationAutoFavorites *)self locationAutoFavoriteCandidates];
  [v4 encodeObject:v14 forKey:@"locationAutoFavoriteCandidates"];
}

- (NSDictionary)autoFavoriteTagIDsToScores
{
  return self->_autoFavoriteTagIDsToScores;
}

- (NSSet)groupableFavoriteTagIDs
{
  return self->_groupableFavoriteTagIDs;
}

- (NSSet)defaultCandidates
{
  return self->_defaultCandidates;
}

- (NSSet)internalSignalAutoFavoriteCandidates
{
  return self->_internalSignalAutoFavoriteCandidates;
}

- (NSSet)existingInternalSignalAutoFavoriteCandidates
{
  return self->_existingInternalSignalAutoFavoriteCandidates;
}

- (NSSet)groupableCandidates
{
  return self->_groupableCandidates;
}

- (NSSet)portraitAutoFavoriteCandidates
{
  return self->_portraitAutoFavoriteCandidates;
}

- (NSSet)appUsageAutoFavoriteCandidates
{
  return self->_appUsageAutoFavoriteCandidates;
}

- (NSSet)safariAutoFavoriteCandidates
{
  return self->_safariAutoFavoriteCandidates;
}

- (NSSet)locationAutoFavoriteCandidates
{
  return self->_locationAutoFavoriteCandidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_safariAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_appUsageAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_portraitAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_groupableCandidates, 0);
  objc_storeStrong((id *)&self->_existingInternalSignalAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_internalSignalAutoFavoriteCandidates, 0);
  objc_storeStrong((id *)&self->_defaultCandidates, 0);
  objc_storeStrong((id *)&self->_groupableFavoriteTagIDs, 0);

  objc_storeStrong((id *)&self->_autoFavoriteTagIDsToScores, 0);
}

@end