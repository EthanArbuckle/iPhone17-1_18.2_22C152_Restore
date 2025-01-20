@interface GEOMapItemRoutineAttributes(RTExtensions)
- (void)initWithLOIType:()RTExtensions event:;
@end

@implementation GEOMapItemRoutineAttributes(RTExtensions)

- (void)initWithLOIType:()RTExtensions event:
{
  id v6 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&off_1F34D32B8;
  id v7 = [super init];
  v8 = v7;
  if (v7)
  {
    if (a3) {
      uint64_t v9 = 2 * (a3 == 1);
    }
    else {
      uint64_t v9 = 1;
    }
    [v7 setLoiType:v9];
    if (v6)
    {
      v10 = [v6 title];
      [v8 setEventName:v10];

      [v8 setIsEventAllDay:[v6 isAllDay]];
      v11 = [v6 startDate];
      [v11 timeIntervalSinceReferenceDate];
      [v8 setEventDate:];
    }
    id v12 = v8;
  }

  return v8;
}

@end