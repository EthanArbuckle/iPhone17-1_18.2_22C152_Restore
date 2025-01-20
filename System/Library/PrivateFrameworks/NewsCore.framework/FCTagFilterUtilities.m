@interface FCTagFilterUtilities
+ (BOOL)filterTag:(id)a3 options:(int64_t)a4;
+ (BOOL)filterTag:(id)a3 options:(int64_t)a4 context:(id)a5;
+ (id)filterTags:(id)a3 options:(int64_t)a4 context:(id)a5;
@end

@implementation FCTagFilterUtilities

+ (BOOL)filterTag:(id)a3 options:(int64_t)a4 context:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = +[FCAppleAccount sharedAccount];
  v10 = [v9 contentStoreFrontID];

  if ((a4 & 4) != 0 && !v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "(filterOptions & FCTagFilterBlockedStorefronts) == 0 || contentStoreFrontID != nil");
    *(_DWORD *)buf = 136315906;
    v29 = "+[FCTagFilterUtilities filterTag:options:context:]";
    __int16 v30 = 2080;
    v31 = "FCTagFilterUtilities.m";
    __int16 v32 = 1024;
    int v33 = 28;
    __int16 v34 = 2114;
    v35 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if ((a4 & 2) == 0)
    {
LABEL_5:
      int v11 = 0;
      if ((a4 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
  }
  else if ((a4 & 2) == 0)
  {
    goto LABEL_5;
  }
  int v11 = [v7 isDeprecated];
  if ((a4 & 8) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  v13 = +[FCRestrictions sharedInstance];
  int v14 = [v13 isExplicitContentAllowed];

  if (((v11 | v14) & 1) == 0) {
    int v11 = [v7 isExplicitContent];
  }
LABEL_11:
  if ((a4 & 4) == 0) {
    goto LABEL_24;
  }
  v15 = [v7 blockedStorefrontIDs];
  if ([v15 count])
  {
  }
  else
  {
    v16 = [v7 allowedStorefrontIDs];
    uint64_t v17 = [v16 count];

    if (!v17) {
      goto LABEL_24;
    }
  }
  if (v11)
  {
    LOBYTE(v18) = 1;
    goto LABEL_30;
  }
  v19 = [v7 blockedStorefrontIDs];
  if ([v19 containsObject:v10])
  {
    int v11 = 1;
  }
  else
  {
    v20 = [v7 allowedStorefrontIDs];
    if ([v20 count])
    {
      v21 = [v7 allowedStorefrontIDs];
      int v11 = [v21 containsObject:v10] ^ 1;
    }
    else
    {
      int v11 = 0;
    }
  }
LABEL_24:
  int v22 = ((unint64_t)a4 >> 4) & 1 | v11;
  if ((a4 & 0x10) != 0 && (v11 & 1) == 0)
  {
    v23 = +[FCRestrictions sharedInstance];
    int v22 = objc_msgSend(v23, "isNewsVersionAllowed:", objc_msgSend(v7, "minimumNewsVersion")) ^ 1;
  }
  int v18 = ((unint64_t)a4 >> 5) & 1 | v22;
  if ((a4 & 0x20) != 0 && (v22 & 1) == 0)
  {
    v24 = [v8 subscriptionList];
    v25 = [v24 mutedTagIDs];
    v26 = [v7 identifier];
    LOBYTE(v18) = [v25 containsObject:v26];
  }
LABEL_30:

  return v18;
}

+ (BOOL)filterTag:(id)a3 options:(int64_t)a4
{
  return [a1 filterTag:a3 options:a4 context:0];
}

+ (id)filterTags:(id)a3 options:(int64_t)a4 context:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__FCTagFilterUtilities_filterTags_options_context___block_invoke;
  v12[3] = &unk_1E5B59280;
  id v14 = a1;
  int64_t v15 = a4;
  id v13 = v8;
  id v9 = v8;
  v10 = objc_msgSend(a3, "fc_arrayOfObjectsFailingTest:", v12);

  return v10;
}

uint64_t __51__FCTagFilterUtilities_filterTags_options_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) filterTag:a2 options:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
}

@end