@interface ICMusicLibraryRecommendationsResponse
- (AMPMusicArtistNewContentResponse)responseModel;
- (ICMusicLibraryRecommendationsResponse)initWithNewArtistContentResponseModel:(id)a3 andMLModel:(id)a4;
- (MLModel)mlModel;
@end

@implementation ICMusicLibraryRecommendationsResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlModel, 0);

  objc_storeStrong((id *)&self->_responseModel, 0);
}

- (MLModel)mlModel
{
  return self->_mlModel;
}

- (AMPMusicArtistNewContentResponse)responseModel
{
  return self->_responseModel;
}

- (ICMusicLibraryRecommendationsResponse)initWithNewArtistContentResponseModel:(id)a3 andMLModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICMusicLibraryRecommendationsResponse;
  v9 = [(ICMusicLibraryRecommendationsResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseModel, a3);
    objc_storeStrong((id *)&v10->_mlModel, a4);
  }

  return v10;
}

@end