@interface SBIconModelMemoryStore(SBIconModelITunesRepresentation)
- (id)initWithITunesRepresentation:()SBIconModelITunesRepresentation;
@end

@implementation SBIconModelMemoryStore(SBIconModelITunesRepresentation)

- (id)initWithITunesRepresentation:()SBIconModelITunesRepresentation
{
  v2 = +[SBIconStateArchiver rootArchiveFromITunesRepresentation:](SBIconStateArchiver, "rootArchiveFromITunesRepresentation:");
  v3 = +[SBIconStateArchiver modernizeRootArchive:v2];

  if (v3)
  {
    a1 = (id)[a1 initWithCurrentState:v3 desiredState:0];
    id v4 = a1;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end