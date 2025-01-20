@interface RCPActiveScreens
@end

@implementation RCPActiveScreens

void ___RCPActiveScreens_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(RCPEventScreen);
  objc_msgSend(MEMORY[0x1E4F39B60], "mainDisplay", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    BKSDisplayServicesGetMainScreenInfo();
    float v10 = v13;
    float v7 = 0.0;
    float v9 = 0.0;
  }
  else
  {
    [v3 bounds];
    float v7 = v6;
    float v9 = v8;
    BKSDisplayServicesGetExternalDisplayScale();
    float v13 = v10;
  }
  float v14 = v9 / v10;
  float v15 = v7 / v10;
  v11 = [v3 uniqueId];
  [(RCPEventScreen *)v4 setDisplayUUID:v11];

  -[RCPEventScreen setDisplayID:](v4, "setDisplayID:", [v3 displayId]);
  -[RCPEventScreen setPointSize:](v4, "setPointSize:", v15, v14);
  [(RCPEventScreen *)v4 setScale:v13];
  if (v15 != 0.0)
  {
    *(float *)&double v12 = v14;
    if (v14 != 0.0) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:", v4, v12);
    }
  }
}

@end