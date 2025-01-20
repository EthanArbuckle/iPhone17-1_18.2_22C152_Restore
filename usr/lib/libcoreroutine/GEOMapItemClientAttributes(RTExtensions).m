@interface GEOMapItemClientAttributes(RTExtensions)
- (id)initWithLOIType:()RTExtensions event:;
@end

@implementation GEOMapItemClientAttributes(RTExtensions)

- (id)initWithLOIType:()RTExtensions event:
{
  id v6 = a4;
  v11.receiver = a1;
  v11.super_class = (Class)&off_1F34D3940;
  id v7 = [super init];
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F646D8]) initWithLOIType:a3 event:v6];
    [v7 setRoutineAttributes:v8];

    id v9 = v7;
  }

  return v7;
}

@end