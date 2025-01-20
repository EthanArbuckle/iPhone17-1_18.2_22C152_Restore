@interface NTKMoonPhaseComplication
- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3;
- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
@end

@implementation NTKMoonPhaseComplication

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 1;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKMoonPhaseComplication;
  return [(NTKComplication *)&v5 snapshotContext:a3 isStaleRelativeToContext:a4];
}

@end