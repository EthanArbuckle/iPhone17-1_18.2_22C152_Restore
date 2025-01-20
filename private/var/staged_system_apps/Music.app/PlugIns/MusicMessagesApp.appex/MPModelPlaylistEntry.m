@interface MPModelPlaylistEntry
- (MPModelObject)innermostModelObject;
- (NSString)shortDescription;
@end

@implementation MPModelPlaylistEntry

- (MPModelObject)innermostModelObject
{
  v2 = self;
  id v3 = MPModelPlaylistEntry.innermostModelObject.getter();

  return (MPModelObject *)v3;
}

- (NSString)shortDescription
{
  return (NSString *)sub_1002BA39C(self, (uint64_t)a2, (void (*)(void))sub_1002B9D60);
}

@end