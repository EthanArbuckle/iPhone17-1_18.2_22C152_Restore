@interface APMediaServicesRanker
+ (id)findValidObjectsInContentDataItems:(id)a3;
+ (id)sortByRank:(id)a3;
+ (void)_sortByRank:(id)a3 completionHandler:(id)a4;
+ (void)rankRepresentations:(id)a3 completionHandler:(id)a4;
@end

@implementation APMediaServicesRanker

+ (id)sortByRank:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_100238C58];
}

+ (id)findValidObjectsInContentDataItems:(id)a3
{
  id v3 = a3;
  v4 = +[NSPredicate predicateWithBlock:&stru_100238C98];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

+ (void)_sortByRank:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, id, void))a4;
  id v7 = [a1 sortByRank:a3];
  v6[2](v6, v7, 0);
}

+ (void)rankRepresentations:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a1 findValidObjectsInContentDataItems:a3];
  [a1 _sortByRank:v7 completionHandler:v6];
}

@end