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
  return (NSString *)sub_10036AD70(self, (uint64_t)a2, (void (*)(void))sub_10036A734);
}

@end