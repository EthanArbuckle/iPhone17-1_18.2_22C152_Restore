@interface AMSUIMessageRequest
+ (id)bk_fromJSONURL:(id)a3 localizedTexts:(id)a4 localizedActionTitles:(id)a5;
@end

@implementation AMSUIMessageRequest

+ (id)bk_fromJSONURL:(id)a3 localizedTexts:(id)a4 localizedActionTitles:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v62 = a5;
  v9 = off_100A3C000;
  objc_opt_class();
  v59 = v7;
  v10 = +[NSData dataWithContentsOfURL:v7];
  v11 = +[NSJSONSerialization JSONObjectWithData:v10 options:0 error:0];
  v12 = BUDynamicCast();

  v58 = v8;
  v13 = [v8 objectForKeyedSubscript:@"title"];
  v14 = v13;
  if (v13)
  {
    id v57 = v13;
  }
  else
  {
    objc_opt_class();
    v15 = [v12 objectForKeyedSubscript:@"title"];
    BUDynamicCast();
    id v57 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = [v8 objectForKeyedSubscript:@"message"];
  v17 = v16;
  if (v16)
  {
    id v56 = v16;
  }
  else
  {
    objc_opt_class();
    v18 = [v12 objectForKeyedSubscript:@"message"];
    BUDynamicCast();
    id v56 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  v19 = [v12 objectForKeyedSubscript:@"icon"];
  uint64_t v20 = BUDynamicCast();

  objc_opt_class();
  v21 = [v12 objectForKeyedSubscript:@"style"];
  v55 = BUDynamicCast();

  objc_opt_class();
  v22 = [v12 objectForKeyedSubscript:@"appearance"];
  uint64_t v23 = BUDynamicCast();

  v54 = (void *)v20;
  if (v20)
  {
    uint64_t v24 = +[NSURL URLWithString:v20 relativeToURL:v59];
  }
  else
  {
    uint64_t v24 = 0;
  }
  v53 = (void *)v23;
  id v25 = [objc_alloc((Class)AMSUIMessageRequest) initWithTitle:v57 message:v56 appearanceInfo:v23];
  v52 = (void *)v24;
  [v25 setIconURL:v24];
  id v61 = v25;
  [v25 setStyle:[v55 integerValue]];
  objc_opt_class();
  v26 = [v12 objectForKeyedSubscript:@"actions"];
  v27 = BUDynamicCast();

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v27;
  v64 = (char *)[obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v68;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(void *)v68 != v63) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        v29 = BUDynamicCast();
        if (v29)
        {
          objc_opt_class();
          v30 = [v29 objectForKeyedSubscript:@"identifier"];
          v31 = BUDynamicCast();

          v32 = [v62 objectForKeyedSubscript:v31];
          v33 = v32;
          if (v32)
          {
            id v34 = v32;
          }
          else
          {
            objc_opt_class();
            v35 = [v29 objectForKeyedSubscript:@"title"];
            BUDynamicCast();
            id v34 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_opt_class();
          v36 = [v29 objectForKeyedSubscript:@"icon"];
          uint64_t v37 = BUDynamicCast();

          v38 = (void *)v37;
          objc_opt_class();
          v39 = [v29 objectForKeyedSubscript:@"style"];
          v65 = BUDynamicCast();

          objc_opt_class();
          v40 = [v29 objectForKeyedSubscript:@"value"];
          v41 = BUDynamicCast();

          if (v38)
          {
            v66 = +[NSURL URLWithString:v38 relativeToURL:v59];
          }
          else
          {
            v66 = 0;
          }
          v42 = v65;
          if ([v65 isEqualToString:@"cancel"]) {
            uint64_t v43 = 2;
          }
          else {
            uint64_t v43 = [v65 isEqualToString:@"destructive"];
          }
          v44 = +[AMSDialogAction actionWithTitle:v34 style:v43];
          [v44 setIdentifier:v31];
          [v44 setIconURL:v66];
          if (v41)
          {
            v45 = v38;
            id v46 = v34;
            v47 = v31;
            v48 = v9;
            v49 = v12;
            id v50 = [objc_alloc((Class)NSURL) initWithString:v41];
            [v44 setDeepLink:v50];

            v12 = v49;
            v9 = v48;
            v31 = v47;
            id v34 = v46;
            v38 = v45;
            v42 = v65;
          }
          [v61 addButtonAction:v44];
        }
      }
      v64 = (char *)[obj countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v64);
  }

  return v61;
}

@end