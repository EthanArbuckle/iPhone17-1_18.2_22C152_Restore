@interface NMSMusicRecommendationsResponse
- (NMSMusicRecommendationsResponse)initWithCachedData:(id)a3 recommendations:(id)a4;
- (NSData)cachedData;
- (NSOrderedSet)recommendations;
@end

@implementation NMSMusicRecommendationsResponse

- (NMSMusicRecommendationsResponse)initWithCachedData:(id)a3 recommendations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NMSMusicRecommendationsResponse;
  v9 = [(NMSMusicRecommendationsResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cachedData, a3);
    objc_storeStrong((id *)&v10->_recommendations, a4);
  }

  return v10;
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (NSOrderedSet)recommendations
{
  return self->_recommendations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendations, 0);

  objc_storeStrong((id *)&self->_cachedData, 0);
}

@end