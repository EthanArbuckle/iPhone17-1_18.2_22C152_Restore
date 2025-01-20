@interface NSAttributedString(MobileSafariFrameworkExtras)
+ (id)safari_richListOfLinksForTabs:()MobileSafariFrameworkExtras includingBulletForSingleLink:;
+ (uint64_t)safari_richListOfLinksForTabs:()MobileSafariFrameworkExtras;
@end

@implementation NSAttributedString(MobileSafariFrameworkExtras)

+ (uint64_t)safari_richListOfLinksForTabs:()MobileSafariFrameworkExtras
{
  return objc_msgSend(a1, "safari_richListOfLinksForTabs:includingBulletForSingleLink:", a3, 0);
}

+ (id)safari_richListOfLinksForTabs:()MobileSafariFrameworkExtras includingBulletForSingleLink:
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4FB60A0] linkCountForTabs:v5];
  if (v6)
  {
    unint64_t v7 = v6;
    id v31 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    uint64_t v38 = *MEMORY[0x1E4FB0738];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    id v9 = objc_alloc(MEMORY[0x1E4FB08A0]);
    v10 = (void *)[v9 initWithMarkerFormat:*MEMORY[0x1E4FB07E8] options:0];
    v37 = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    [v8 setTextLists:v11];

    v39[0] = v8;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v28 = v5;
    id obj = v5;
    uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      if (v7 > 1) {
        int v15 = 1;
      }
      else {
        int v15 = a4;
      }
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "url", v28);
          if (v18)
          {
            v19 = [v17 title];
            if ([v19 length])
            {
              id v20 = v19;
            }
            else
            {
              objc_msgSend(v18, "safari_userVisibleHostWithoutWWWSubdomain");
              id v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            v21 = v20;
            v22 = (void *)MEMORY[0x1E4F28B18];
            v23 = [v18 absoluteString];
            v24 = objc_msgSend(v22, "safari_attributedStringWithLinkText:linkUrl:extraTitle:", v21, v23, 0);
            v25 = (void *)[v24 mutableCopy];

            if (v15) {
              objc_msgSend(v25, "addAttributes:range:", v29, 0, objc_msgSend(v21, "length"));
            }
            [v31 appendAttributedString:v25];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v13);
    }

    v26 = (void *)[v31 copy];
    id v5 = v28;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end