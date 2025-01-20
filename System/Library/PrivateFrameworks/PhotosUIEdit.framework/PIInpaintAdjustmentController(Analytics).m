@interface PIInpaintAdjustmentController(Analytics)
- (id)analyticsPayload;
@end

@implementation PIInpaintAdjustmentController(Analytics)

- (id)analyticsPayload
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v3 setMinimumFractionDigits:1];
  [v3 setMaximumFractionDigits:2];
  uint64_t v4 = [a1 adjustment];
  if (v4 && (v5 = (void *)v4, int v6 = [a1 enabled], v5, v6))
  {
    v7 = [a1 objectForKeyedSubscript:@"operations"];
    v8 = v7;
    if (v7)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        id v36 = v3;
        uint64_t v38 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v40 != v14) {
              objc_enumerationMutation(v8);
            }
            v16 = (void *)[objc_alloc(MEMORY[0x263F5D5E8]) initWithDictionary:*(void *)(*((void *)&v39 + 1) + 8 * i)];
            uint64_t v17 = [v16 mode];
            if (v17 == 4)
            {
              int v37 = [v16 isTargetPoints];
              uint64_t v18 = v10;
              uint64_t v19 = v14;
              uint64_t v20 = v11;
              uint64_t v21 = v13;
              uint64_t v22 = v12;
              v23 = v8;
              int v24 = [v16 isTapSelect];
              int v25 = [v16 isFilledBrushStroke];
              uint64_t v26 = v38;
              uint64_t v27 = v38 + (v25 ^ 1u);
              BOOL v28 = v24 == 0;
              v8 = v23;
              uint64_t v12 = v22;
              uint64_t v13 = v21;
              uint64_t v11 = v20;
              uint64_t v14 = v19;
              uint64_t v10 = v18;
              if (v28)
              {
                uint64_t v29 = v13;
              }
              else
              {
                uint64_t v27 = v38;
                uint64_t v29 = v13 + 1;
              }
              if (!v37) {
                uint64_t v26 = v27;
              }
              uint64_t v38 = v26;
              if (v37) {
                ++v12;
              }
              else {
                uint64_t v13 = v29;
              }
            }
            else if (v17 == 2)
            {
              ++v11;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v10);
        if (v38 >= 1)
        {
          v30 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v38);
          [v2 setObject:v30 forKeyedSubscript:@"inpaint_group_removal_count"];
        }
        if (v13 >= 1)
        {
          v31 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v13);
          [v2 setObject:v31 forKeyedSubscript:@"inpaint_tap_removal_count"];
        }
        id v3 = v36;
        if (v12 >= 1)
        {
          v32 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v12);
          [v2 setObject:v32 forKeyedSubscript:@"inpaint_target_point_removal_count"];
        }
        if (v11 >= 1)
        {
          v33 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v11);
          [v2 setObject:v33 forKeyedSubscript:@"inpaint_brush_removal_count"];
        }
      }
    }
    id v34 = v2;
  }
  else
  {
    id v34 = (id)MEMORY[0x263EFFA78];
  }

  return v34;
}

@end