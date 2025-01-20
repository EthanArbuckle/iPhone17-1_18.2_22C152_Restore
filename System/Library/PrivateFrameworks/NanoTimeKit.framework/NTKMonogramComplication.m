@interface NTKMonogramComplication
- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3;
- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (id)ntk_sectionIdentifier;
@end

@implementation NTKMonogramComplication

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v5 = a4;
  v6 = [a3 monogram];
  v7 = [v5 monogram];

  if (v6 == v7) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = [v6 isEqualToString:v7] ^ 1;
  }

  return v8;
}

- (id)ntk_sectionIdentifier
{
  return @"com.apple.nanotimekit.personalization";
}

@end