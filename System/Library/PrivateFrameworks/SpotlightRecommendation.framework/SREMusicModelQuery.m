@interface SREMusicModelQuery
- (NSString)genreID;
- (SREMusicModelQuery)initWithGenreID:(id)a3;
@end

@implementation SREMusicModelQuery

- (SREMusicModelQuery)initWithGenreID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SREMusicModelQuery;
  v6 = [(SREMusicModelQuery *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_genreID, a3);
  }

  return v7;
}

- (NSString)genreID
{
  return self->_genreID;
}

- (void).cxx_destruct
{
}

@end