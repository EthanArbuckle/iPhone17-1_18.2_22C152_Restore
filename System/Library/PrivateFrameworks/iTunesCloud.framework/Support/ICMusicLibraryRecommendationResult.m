@interface ICMusicLibraryRecommendationResult
- (ICMusicLibraryRecommendationResult)initWithAdamID:(id)a3 date:(id)a4 score:(id)a5;
- (NSDate)date;
- (NSNumber)adamID;
- (NSNumber)score;
@end

@implementation ICMusicLibraryRecommendationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_adamID, 0);
}

- (NSNumber)score
{
  return self->_score;
}

- (NSDate)date
{
  return self->_date;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (ICMusicLibraryRecommendationResult)initWithAdamID:(id)a3 date:(id)a4 score:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICMusicLibraryRecommendationResult;
  v12 = [(ICMusicLibraryRecommendationResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_adamID, a3);
    objc_storeStrong((id *)&v13->_date, a4);
    objc_storeStrong((id *)&v13->_score, a5);
  }

  return v13;
}

@end