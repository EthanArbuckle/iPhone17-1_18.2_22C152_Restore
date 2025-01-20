@interface PHProject(PhotosUICore)
- (__CFString)px_navigationURLHost;
- (id)px_rootCollectionList;
@end

@implementation PHProject(PhotosUICore)

- (__CFString)px_navigationURLHost
{
  return @"project";
}

- (id)px_rootCollectionList
{
  v1 = [a1 photoLibrary];
  v2 = objc_msgSend(v1, "px_virtualCollections");
  v3 = [v2 rootProjectCollectionList];

  return v3;
}

@end