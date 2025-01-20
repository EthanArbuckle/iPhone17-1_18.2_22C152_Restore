@interface CRLWPFontVerificationCache
- (CRLWPFontVerificationCache)init;
- (id)filterFontNames:(id)a3 withStatus:(int64_t)a4;
- (id)filterFontNames:(id)a3 withStatusInSet:(id)a4;
- (id)filterFontNames:(id)a3 withoutStatus:(int64_t)a4;
- (id)fontNamesWithStatus:(int64_t)a3;
- (id)fontNamesWithStatusInSet:(id)a3;
- (int64_t)statusForFontName:(id)a3;
- (void)reset;
- (void)resetFontNames:(id)a3 withStatus:(int64_t)a4;
- (void)resetFontNames:(id)a3 withStatusInSet:(id)a4;
- (void)setStatus:(int64_t)a3 forFontName:(id)a4;
- (void)setStatus:(int64_t)a3 forFontNames:(id)a4;
@end

@implementation CRLWPFontVerificationCache

- (CRLWPFontVerificationCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLWPFontVerificationCache;
  v2 = [(CRLWPFontVerificationCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    verifiedFonts = v2->_verifiedFonts;
    v2->_verifiedFonts = v3;
  }
  return v2;
}

- (int64_t)statusForFontName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_verifiedFonts objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3) {
    id v5 = [v3 integerValue];
  }
  else {
    id v5 = 0;
  }

  return (int64_t)v5;
}

- (void)setStatus:(int64_t)a3 forFontName:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v8 = +[NSNumber numberWithInteger:a3];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_verifiedFonts, "setObject:forKeyedSubscript:");
  }
  else
  {
    verifiedFonts = self->_verifiedFonts;
    id v8 = a4;
    -[NSMutableDictionary removeObjectForKey:](verifiedFonts, "removeObjectForKey:");
  }
}

- (void)setStatus:(int64_t)a3 forFontNames:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = +[NSNumber numberWithInteger:a3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_verifiedFonts, "setObject:forKeyedSubscript:", v7, *(void *)(*((void *)&v13 + 1) + 8 * (void)v12), (void)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_verifiedFonts removeObjectsForKeys:v6];
  }
}

- (void)resetFontNames:(id)a3 withStatus:(int64_t)a4
{
  if (a4)
  {
    id v7 = [(CRLWPFontVerificationCache *)self fontNamesWithStatus:a4];
    verifiedFonts = self->_verifiedFonts;
    id v6 = [v7 allObjects];
    [(NSMutableDictionary *)verifiedFonts removeObjectsForKeys:v6];
  }
}

- (void)resetFontNames:(id)a3 withStatusInSet:(id)a4
{
  id v7 = [(CRLWPFontVerificationCache *)self fontNamesWithStatusInSet:a4];
  verifiedFonts = self->_verifiedFonts;
  id v6 = [v7 allObjects];
  [(NSMutableDictionary *)verifiedFonts removeObjectsForKeys:v6];
}

- (void)reset
{
}

- (id)fontNamesWithStatus:(int64_t)a3
{
  if (a3)
  {
    verifiedFonts = self->_verifiedFonts;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1004AD790;
    v6[3] = &unk_1014FEAA0;
    v6[4] = a3;
    v4 = [(NSMutableDictionary *)verifiedFonts keysOfEntriesPassingTest:v6];
  }
  else
  {
    v4 = +[NSSet set];
  }

  return v4;
}

- (id)fontNamesWithStatusInSet:(id)a3
{
  id v4 = a3;
  verifiedFonts = self->_verifiedFonts;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004AD878;
  v9[3] = &unk_1014FEAC8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSMutableDictionary *)verifiedFonts keysOfEntriesPassingTest:v9];

  return v7;
}

- (id)filterFontNames:(id)a3 withStatus:(int64_t)a4
{
  id v6 = [a3 mutableCopy];
  if (a4)
  {
    id v7 = [(CRLWPFontVerificationCache *)self fontNamesWithStatus:a4];
    [v6 intersectSet:v7];
  }
  else
  {
    id v7 = [(NSMutableDictionary *)self->_verifiedFonts allKeys];
    id v8 = +[NSSet setWithArray:v7];
    [v6 minusSet:v8];
  }
  id v9 = [v6 copy];

  return v9;
}

- (id)filterFontNames:(id)a3 withStatusInSet:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004AD9F8;
  v8[3] = &unk_1014FEAF0;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  id v6 = [a3 objectsPassingTest:v8];

  return v6;
}

- (id)filterFontNames:(id)a3 withoutStatus:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", &off_10155DEB0, &off_10155DEC8, &off_10155DEE0, &off_10155DEF8, 0);
  id v8 = +[NSNumber numberWithInteger:a4];
  [v7 removeObject:v8];

  id v9 = [(CRLWPFontVerificationCache *)self filterFontNames:v6 withStatusInSet:v7];

  return v9;
}

- (void).cxx_destruct
{
}

@end