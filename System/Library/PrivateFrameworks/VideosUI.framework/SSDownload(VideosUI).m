@interface SSDownload(VideosUI)
- (BOOL)vui_isEqualToDownload:()VideosUI;
@end

@implementation SSDownload(VideosUI)

- (BOOL)vui_isEqualToDownload:()VideosUI
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (a1 == v4)
    {
      BOOL v17 = 1;
    }
    else
    {
      uint64_t v7 = *MEMORY[0x1E4FA8630];
      v19[0] = *MEMORY[0x1E4FA85F8];
      uint64_t v6 = v19[0];
      v19[1] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      v9 = objc_msgSend(a1, "vui_valuesForProperties:", v8);
      v10 = [v9 objectForKey:v6];
      v11 = [v9 objectForKey:v7];
      v12 = objc_msgSend(v5, "vui_valuesForProperties:", v8);
      v13 = [v12 objectForKey:v6];
      v14 = [v12 objectForKey:v7];
      if (v10) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      BOOL v17 = 1;
      if (v15 || ([v10 isEqualToString:v13] & 1) == 0)
      {
        BOOL v16 = !v11 || v14 == 0;
        if (v16 || ([v11 isEqualToNumber:v14] & 1) == 0) {
          BOOL v17 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

@end