@interface NSString(SFTabBarUtilities)
- (id)truncatedTitleWithFont:()SFTabBarUtilities desiredWidth:truncatedSize:tabBarItemTitles:;
- (uint64_t)truncatedTitleWithFont:()SFTabBarUtilities desiredWidth:tabBarItemTitles:;
@end

@implementation NSString(SFTabBarUtilities)

- (id)truncatedTitleWithFont:()SFTabBarUtilities desiredWidth:truncatedSize:tabBarItemTitles:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  objc_msgSend(a1, "_legacy_sizeWithFont:", v10);
  if (a5)
  {
    double v14 = *MEMORY[0x1E4F1DB30];
    *(double *)a5 = v12;
    *(void *)(a5 + 8) = v13;
    uint64_t v15 = a5 + 8;
  }
  else
  {
    uint64_t v15 = 8;
    double v14 = v12;
  }
  if (v12 <= a2) {
    goto LABEL_37;
  }
  id v40 = v10;
  id v16 = a1;
  id v39 = v11;
  id v17 = v11;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v18)
  {

    id v10 = v40;
LABEL_37:
    id v26 = a1;
    goto LABEL_38;
  }
  uint64_t v19 = v18;
  v38 = a1;
  unint64_t v20 = 0;
  uint64_t v21 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v42 != v21) {
        objc_enumerationMutation(v17);
      }
      uint64_t v23 = *(void *)(*((void *)&v41 + 1) + 8 * i);
      if (([v16 isEqualToString:v23] & 1) == 0)
      {
        unint64_t v24 = 0;
        if (v16 && v23)
        {
          v25 = [v16 commonPrefixWithString:v23 options:1];
          unint64_t v24 = [v25 length];
        }
        if (v24 > v20) {
          unint64_t v20 = v24;
        }
      }
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v19);

  id v11 = v39;
  id v10 = v40;
  a1 = v38;
  if (!v20) {
    goto LABEL_37;
  }
  id v26 = (id)[v16 mutableCopy];
  unint64_t v27 = 0;
  while (1)
  {
    double v28 = v14;
    if (a5) {
      double v28 = *(double *)a5;
    }
    if (v28 <= a2 || v20 <= v27) {
      break;
    }
    uint64_t v30 = deleteOneWord(v26, v20 - v27, 0);
    if (!v30) {
      break;
    }
    v27 += v30;
    objc_msgSend(v26, "_legacy_sizeWithFont:", v40);
    if (a5)
    {
      *(double *)a5 = v31;
      *(void *)uint64_t v15 = v32;
    }
    else
    {
      double v14 = v31;
    }
  }
  if (!truncatedTitleWithFont_desiredWidth_truncatedSize_tabBarItemTitles__nonAlphanumericCharacters)
  {
    v33 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
    uint64_t v34 = [v33 invertedSet];
    v35 = (void *)truncatedTitleWithFont_desiredWidth_truncatedSize_tabBarItemTitles__nonAlphanumericCharacters;
    truncatedTitleWithFont_desiredWidth_truncatedSize_tabBarItemTitles__nonAlphanumericCharacters = v34;
  }
  if (v27)
  {
    do
      uint64_t v36 = [v26 length];
    while (deleteOneWord(v26, v36, (void *)truncatedTitleWithFont_desiredWidth_truncatedSize_tabBarItemTitles__nonAlphanumericCharacters));
  }
LABEL_38:

  return v26;
}

- (uint64_t)truncatedTitleWithFont:()SFTabBarUtilities desiredWidth:tabBarItemTitles:
{
  return objc_msgSend(a1, "truncatedTitleWithFont:desiredWidth:truncatedSize:tabBarItemTitles:", a3, 0, a4);
}

@end