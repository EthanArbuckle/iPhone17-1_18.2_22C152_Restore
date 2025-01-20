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
  return (NSString *)sub_7CFD48(self, (uint64_t)a2, (void (*)(void))sub_7CF70C);
}

@end