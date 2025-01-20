@interface ICMusicLibraryRecommendationsRequest
- (ICMusicLibraryRecommendationsRequest)initWithStoreRequestContext:(id)a3 params:(id)a4;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICMusicLibraryRecommendationsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (void)execute
{
  v3 = +[ICURLBagProvider sharedBagProvider];
  storeRequestContext = self->_storeRequestContext;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AC6B4;
  v5[3] = &unk_1001BC8C0;
  v5[4] = self;
  [v3 getBagForRequestContext:storeRequestContext withCompletionHandler:v5];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning request for AMPMusicArtistNewContentResponse", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ACE14;
  v7[3] = &unk_1001BF2B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ICMusicLibraryRecommendationsRequest *)self performRequestWithCompletionHandler:v7];
}

- (ICMusicLibraryRecommendationsRequest)initWithStoreRequestContext:(id)a3 params:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICMusicLibraryRecommendationsRequest;
  v7 = [(ICMusicLibraryRecommendationsRequest *)&v10 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_storeRequestContext, a3);
  }

  return v8;
}

@end