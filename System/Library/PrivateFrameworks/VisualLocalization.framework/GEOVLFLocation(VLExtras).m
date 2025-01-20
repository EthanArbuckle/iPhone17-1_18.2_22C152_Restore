@interface GEOVLFLocation(VLExtras)
- (void)initWithCLLocation:()VLExtras location:heading:;
@end

@implementation GEOVLFLocation(VLExtras)

- (void)initWithCLLocation:()VLExtras location:heading:
{
  id v8 = a4;
  v9 = (void *)[a1 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F417B8]);
    [v8 coordinate];
    double v12 = v11;
    [v8 coordinate];
    v13 = objc_msgSend(v10, "initWithLatitude:longitude:", v12);
    [v9 setLocation:v13];

    memset(v21, 0, sizeof(v21));
    uint64_t v14 = *((void *)a5 + 2);
    long long v18 = *a5;
    uint64_t v19 = v14;
    char v20 = 7;
    [v9 setEcefLocation:&v18];
    [v8 horizontalAccuracy];
    objc_msgSend(v9, "setHorizontalAccuracy:");
    [v8 verticalAccuracy];
    objc_msgSend(v9, "setVerticalAccuracy:");
    [v9 setHeading:a2];
    unsigned int v15 = [v8 type] - 1;
    if (v15 <= 0xA && ((0x5EFu >> v15) & 1) != 0) {
      [v9 setType:dword_21BB7A5D8[v15]];
    }
    objc_msgSend(v9, "setIsFused:", objc_msgSend(v8, "isCoordinateFused"));
    id v16 = v9;
  }

  return v9;
}

@end