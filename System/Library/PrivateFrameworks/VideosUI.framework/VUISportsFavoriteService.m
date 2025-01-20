@interface VUISportsFavoriteService
+ (NSString)UserConsentDidChangeNotification;
+ (void)addFavoritesWithTeams:(NSArray *)a3 leagues:(NSArray *)a4 completionHandler:(id)a5;
+ (void)getFavoritesWithCompletionHandler:(id)a3;
+ (void)initializeSportsManager;
+ (void)modifyUserConsentWithModification:(_TtC8VideosUI26VUIUserConsentModification *)a3 completionHandler:(id)a4;
+ (void)removeFavoritesWithTeams:(NSArray *)a3 leagues:(NSArray *)a4 completionHandler:(id)a5;
+ (void)userConsentWithCompletionHandler:(id)a3;
- (_TtC8VideosUI24VUISportsFavoriteService)init;
@end

@implementation VUISportsFavoriteService

+ (void)initializeSportsManager
{
}

+ (NSString)UserConsentDidChangeNotification
{
  id v2 = static VUISportsFavoriteService.UserConsentDidChangeNotification.getter();
  return (NSString *)v2;
}

- (_TtC8VideosUI24VUISportsFavoriteService)init
{
}

+ (void)userConsentWithCompletionHandler:(id)a3
{
}

+ (void)modifyUserConsentWithModification:(_TtC8VideosUI26VUIUserConsentModification *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  sub_1E317843C((uint64_t)&unk_1EADEEA58, (uint64_t)v7);
}

+ (void)getFavoritesWithCompletionHandler:(id)a3
{
}

+ (void)addFavoritesWithTeams:(NSArray *)a3 leagues:(NSArray *)a4 completionHandler:(id)a5
{
}

+ (void)removeFavoritesWithTeams:(NSArray *)a3 leagues:(NSArray *)a4 completionHandler:(id)a5
{
}

@end