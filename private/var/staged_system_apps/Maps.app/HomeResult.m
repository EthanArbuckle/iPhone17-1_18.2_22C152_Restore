@interface HomeResult
- (BOOL)isCuratedCollectionSectionValid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpiredAtDate:(id)a3;
- (GEOExploreGuides)exploreGuides;
- (HomeResult)initWithResponseResult:(id)a3 responseDate:(id)a4;
- (NSArray)curatedCollections;
- (NSDate)expirationDate;
- (NSDate)responseDate;
- (NSString)curatedCollectionSectionName;
- (Result)responseResult;
- (id)_successValue;
- (unint64_t)hash;
@end

@implementation HomeResult

- (BOOL)isEqual:(id)a3
{
  v4 = (HomeResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(HomeResult *)v6 responseResult];
    v8 = v7;
    if (v7 == self->_responseResult || -[Result isEqual:](v7, "isEqual:"))
    {
      v9 = [(HomeResult *)v6 responseDate];
      v10 = v9;
      if (v9 == self->_responseDate) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = -[NSDate isEqual:](v9, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (HomeResult)initWithResponseResult:(id)a3 responseDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HomeResult;
  v9 = [(HomeResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseResult, a3);
    objc_storeStrong((id *)&v10->_responseDate, a4);
  }

  return v10;
}

- (BOOL)isCuratedCollectionSectionValid
{
  v3 = [(HomeResult *)self curatedCollections];
  if ([v3 count])
  {
    v4 = [(HomeResult *)self curatedCollectionSectionName];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)curatedCollectionSectionName
{
  v2 = [(HomeResult *)self _successValue];
  v3 = [v2 sections];
  v4 = sub_1000990A8(v3, &stru_1013197F8);

  BOOL v5 = [v4 name];

  return (NSString *)v5;
}

- (GEOExploreGuides)exploreGuides
{
  v2 = [(HomeResult *)self _successValue];
  v3 = [v2 sections];
  v4 = sub_1000990A8(v3, &stru_101319878);

  BOOL v5 = [v4 collectionSuggestionResult];
  v6 = [v5 exploreGuides];

  return (GEOExploreGuides *)v6;
}

- (NSArray)curatedCollections
{
  v2 = [(HomeResult *)self _successValue];
  v3 = [v2 sections];
  v4 = sub_1000990A8(v3, &stru_101319818);

  BOOL v5 = [v4 collectionSuggestionResult];
  v6 = [v5 collections];
  id v7 = sub_100099700(v6, &stru_101319858);

  return (NSArray *)v7;
}

- (id)_successValue
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1001043B0;
  v10 = sub_100104A48;
  id v11 = 0;
  responseResult = self->_responseResult;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100099540;
  v5[3] = &unk_101319798;
  v5[4] = &v6;
  [responseResult withValue:v5 orError:&stru_1013197B8];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSDate)expirationDate
{
  [self->_responseResult isSuccess];
  GEOConfigGetDouble();
  if (v3 <= 0.0)
  {
    v4 = 0;
  }
  else
  {
    v4 = -[NSDate dateByAddingTimeInterval:](self->_responseDate, "dateByAddingTimeInterval:");
  }

  return (NSDate *)v4;
}

- (Result)responseResult
{
  return self->_responseResult;
}

- (unint64_t)hash
{
  unint64_t v3 = [self->_responseResult hash];
  return (unint64_t)[(NSDate *)self->_responseDate hash] ^ v3;
}

- (BOOL)isExpiredAtDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HomeResult *)self expirationDate];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  return v7 < 0.0;
}

- (NSDate)responseDate
{
  return self->_responseDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDate, 0);

  objc_storeStrong((id *)&self->_responseResult, 0);
}

@end