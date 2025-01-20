@interface FBSDisplayConfiguration(PBFAdditions)
+ (id)pbf_displayConfigurationForDisplayContext:()PBFAdditions;
@end

@implementation FBSDisplayConfiguration(PBFAdditions)

+ (id)pbf_displayConfigurationForDisplayContext:()PBFAdditions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F62970], "pui_sharedDisplayMonitor");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v5 = objc_msgSend(v4, "connectedIdentities", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = [v4 configurationForIdentity:*(void *)(*((void *)&v24 + 1) + 8 * v9)];
      [v10 bounds];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      objc_msgSend(v3, "pbf_referenceBounds");
      v32.origin.x = v19;
      v32.origin.y = v20;
      v32.size.width = v21;
      v32.size.height = v22;
      v31.origin.x = v12;
      v31.origin.y = v14;
      v31.size.width = v16;
      v31.size.height = v18;
      if (CGRectEqualToRect(v31, v32))
      {
        [v10 pointScale];
        objc_msgSend(v3, "pbf_scale");
        if (BSFloatEqualToFloat()) {
          break;
        }
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v10 = 0;
  }

  return v10;
}

@end