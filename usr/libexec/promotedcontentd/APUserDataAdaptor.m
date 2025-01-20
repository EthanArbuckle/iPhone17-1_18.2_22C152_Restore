@interface APUserDataAdaptor
+ (id)identifier;
- (BOOL)_validateParameters:(id *)a3;
- (id)ageGenderData;
- (void)_run:(id)a3;
@end

@implementation APUserDataAdaptor

+ (id)identifier
{
  return @"com.apple.ap.user";
}

- (void)_run:(id)a3
{
  id v4 = a3;
  v5 = +[APIDAccountProvider privateUserAccount];
  v6 = [(APDataAdaptor *)self parameters];
  v7 = [v6 objectForKeyedSubscript:@"storefront"];

  if (v7)
  {
    v8 = [(APDataAdaptor *)self parameters];
    v9 = [v8 objectForKeyedSubscript:@"storefront"];
    v10 = +[APIDAccountProvider userAccount];
    v11 = [v10 storefront];
    unsigned int v12 = [v9 isEqualToString:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  v13 = [(APDataAdaptor *)self parameters];
  v14 = [v13 objectForKeyedSubscript:@"iTunesLoggedIn"];

  if (v14)
  {
    if (![v5 isiTunesLoggedIn]) {
      goto LABEL_18;
    }
  }
  v15 = [(APDataAdaptor *)self parameters];
  v16 = [v15 objectForKeyedSubscript:@"iCloudLoggedIn"];

  if (v16)
  {
    if (![v5 isiCloudLoggedIn]) {
      goto LABEL_18;
    }
  }
  v17 = [(APDataAdaptor *)self parameters];
  v18 = [v17 objectForKeyedSubscript:@"isChild"];

  if (v18)
  {
    if (![v5 isChild]) {
      goto LABEL_18;
    }
  }
  v19 = [(APDataAdaptor *)self parameters];
  v20 = [v19 objectForKeyedSubscript:@"isAdolescent"];

  if (v20)
  {
    if (![v5 isAdolescent]) {
      goto LABEL_18;
    }
  }
  v21 = [(APDataAdaptor *)self parameters];
  v22 = [v21 objectForKeyedSubscript:@"isAdult"];

  if (v22 && ![v5 isAdult])
  {
LABEL_18:
    BOOL v39 = 0;
  }
  else
  {
    v64 = v5;
    v23 = [(APDataAdaptor *)self parameters];
    v24 = [v23 objectForKeyedSubscript:@"minAge"];

    if (v24)
    {
      v25 = [(APDataAdaptor *)self parameters];
      v26 = [v25 objectForKeyedSubscript:@"minAge"];
      signed int v27 = [v26 intValue];
      v28 = [(APUserDataAdaptor *)self ageGenderData];
      v29 = [v28 objectForKeyedSubscript:@"age"];
      signed int v30 = [v29 intValue];

      if (v27 > v30) {
        goto LABEL_17;
      }
    }
    v31 = [(APDataAdaptor *)self parameters];
    v32 = [v31 objectForKeyedSubscript:@"maxAge"];

    if (!v32) {
      goto LABEL_20;
    }
    v33 = [(APDataAdaptor *)self parameters];
    v34 = [v33 objectForKeyedSubscript:@"maxAge"];
    signed int v35 = [v34 intValue];
    v36 = [(APUserDataAdaptor *)self ageGenderData];
    v37 = [v36 objectForKeyedSubscript:@"age"];
    signed int v38 = [v37 intValue];

    if (v35 < v38)
    {
LABEL_17:
      BOOL v39 = 0;
      v5 = v64;
    }
    else
    {
LABEL_20:
      v41 = [(APDataAdaptor *)self parameters];
      v42 = [v41 objectForKeyedSubscript:@"ageBand"];

      v5 = v64;
      if (v42)
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v43 = [(APDataAdaptor *)self parameters];
        v44 = [v43 objectForKeyedSubscript:@"ageBand"];

        id obj = v44;
        id v45 = [v44 countByEnumeratingWithState:&v65 objects:v69 count:16];
        if (v45)
        {
          id v46 = v45;
          uint64_t v63 = *(void *)v66;
LABEL_23:
          uint64_t v47 = 0;
          while (1)
          {
            if (*(void *)v66 != v63) {
              objc_enumerationMutation(obj);
            }
            v48 = [(id)qword_100288898 objectForKeyedSubscript:*(void *)(*((void *)&v65 + 1) + 8 * v47)];
            unsigned int v49 = [v48 intValue];
            v50 = [(APUserDataAdaptor *)self ageGenderData];
            v51 = [v50 objectForKeyedSubscript:@"ageGroup"];
            unsigned int v52 = [v51 intValue];

            v5 = v64;
            if (v49 == v52) {
              break;
            }
            if (v46 == (id)++v47)
            {
              id v46 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
              if (v46) {
                goto LABEL_23;
              }
              BOOL v39 = 0;
              v53 = obj;
              goto LABEL_33;
            }
          }
        }
      }
      v54 = [(APDataAdaptor *)self parameters];
      v55 = [v54 objectForKeyedSubscript:@"gender"];

      if (v55)
      {
        v53 = [(APUserDataAdaptor *)self ageGenderData];
        v56 = [v53 objectForKeyedSubscript:@"gender"];
        unsigned int v57 = [v56 intValue];
        v58 = (void *)qword_1002888A0;
        v59 = [(APDataAdaptor *)self parameters];
        v60 = [v59 objectForKeyedSubscript:@"gender"];
        v61 = [v58 objectForKeyedSubscript:v60];
        BOOL v39 = v57 == [v61 intValue];

LABEL_33:
      }
      else
      {
        BOOL v39 = 1;
      }
    }
  }
  v40 = +[NSNumber numberWithBool:v39];
  (*((void (**)(id, void *, void, void))v4 + 2))(v4, v40, 0, 0);
}

- (BOOL)_validateParameters:(id *)a3
{
  v57.receiver = self;
  v57.super_class = (Class)APUserDataAdaptor;
  if (!-[APDataAdaptor _validateParameters:](&v57, "_validateParameters:")) {
    return 0;
  }
  v5 = [(APDataAdaptor *)self parameters];
  v6 = [v5 objectForKeyedSubscript:@"storefront"];
  if (![(APDataAdaptor *)self _checkClassType:v6 name:@"storefront" expectedClass:objc_opt_class() error:a3])goto LABEL_52; {
  v7 = [(APDataAdaptor *)self parameters];
  }
  v8 = [v7 objectForKeyedSubscript:@"iTunesLoggedIn"];
  if ([(APDataAdaptor *)self _checkClassType:v8 name:@"iTunesLoggedIn" expectedClass:objc_opt_class() error:a3])
  {
    v9 = [(APDataAdaptor *)self parameters];
    v10 = [v9 objectForKeyedSubscript:@"iCloudLoggedIn"];
    if ([(APDataAdaptor *)self _checkClassType:v10 name:@"iCloudLoggedIn" expectedClass:objc_opt_class() error:a3])
    {
      v50 = v9;
      unsigned int v52 = [(APDataAdaptor *)self parameters];
      v51 = [v52 objectForKeyedSubscript:@"isChild"];
      if ([(APDataAdaptor *)self _checkClassType:v51 name:@"isChild" expectedClass:objc_opt_class() error:a3])
      {
        unsigned int v49 = [(APDataAdaptor *)self parameters];
        v48 = [v49 objectForKeyedSubscript:@"isAdolescent"];
        if ([(APDataAdaptor *)self _checkClassType:v48 name:@"isAdolescent" expectedClass:objc_opt_class() error:a3])
        {
          uint64_t v47 = [(APDataAdaptor *)self parameters];
          id v46 = [v47 objectForKeyedSubscript:@"isAdult"];
          if ([(APDataAdaptor *)self _checkClassType:v46 name:@"isAdult" expectedClass:objc_opt_class() error:a3])
          {
            id v45 = [(APDataAdaptor *)self parameters];
            v44 = [v45 objectForKeyedSubscript:@"minAge"];
            if ([(APDataAdaptor *)self _checkClassType:v44 name:@"minAge" expectedClass:objc_opt_class() error:a3])
            {
              v11 = [(APDataAdaptor *)self parameters];
              unsigned int v12 = [v11 objectForKeyedSubscript:@"maxAge"];
              unsigned int v13 = [(APDataAdaptor *)self _checkClassType:v12 name:@"maxAge" expectedClass:objc_opt_class() error:a3];
            }
            else
            {
              unsigned int v13 = 0;
            }
            v9 = v50;
          }
          else
          {
            unsigned int v13 = 0;
          }
        }
        else
        {
          unsigned int v13 = 0;
        }
      }
      else
      {
        unsigned int v13 = 0;
      }
    }
    else
    {
      unsigned int v13 = 0;
    }
  }
  else
  {
    unsigned int v13 = 0;
  }

  if (v13)
  {
    v14 = [(APDataAdaptor *)self parameters];
    v15 = [v14 objectForKeyedSubscript:@"ageBand"];

    if (v15)
    {
      if (qword_1002888A8 != -1) {
        dispatch_once(&qword_1002888A8, &stru_100233D70);
      }
      v16 = [(APDataAdaptor *)self parameters];
      v17 = [v16 objectForKeyedSubscript:@"ageBand"];
      unsigned int v18 = [(APDataAdaptor *)self _checkClassType:v17 name:@"ageBand" expectedClass:objc_opt_class() error:a3];

      if (!v18) {
        return 0;
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v19 = [(APDataAdaptor *)self parameters];
      v20 = [v19 objectForKeyedSubscript:@"ageBand"];

      id v21 = [v20 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v54;
        while (2)
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v54 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = [(id)qword_100288898 objectForKeyedSubscript:*(void *)(*((void *)&v53 + 1) + 8 * i)];

            if (!v25)
            {
              if (a3)
              {
                v26 = [(APDataAdaptor *)self parameters];
                signed int v27 = [v26 objectForKeyedSubscript:@"ageBand"];
                v28 = [(id)qword_100288898 allKeys];
                v29 = +[NSString stringWithFormat:@"Invalid ageBand argument '%@'. Must be one of %@", v27, v28];

                NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
                v61 = v29;
                signed int v30 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
                *a3 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5201 userInfo:v30];
              }
              unsigned int v13 = 0;
              goto LABEL_40;
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v53 objects:v62 count:16];
          if (v22) {
            continue;
          }
          break;
        }
        unsigned int v13 = 1;
      }
      else
      {
        unsigned int v13 = 1;
      }
LABEL_40:
    }
  }
  if (!v13) {
    return 0;
  }
  v31 = [(APDataAdaptor *)self parameters];
  v32 = [v31 objectForKeyedSubscript:@"gender"];

  if (!v32) {
    return 1;
  }
  if (qword_1002888B0 != -1) {
    dispatch_once(&qword_1002888B0, &stru_100233D90);
  }
  v33 = [(APDataAdaptor *)self parameters];
  v34 = [v33 objectForKeyedSubscript:@"gender"];
  if ([(APDataAdaptor *)self _checkClassType:v34 name:@"gender" expectedClass:objc_opt_class() error:a3])
  {
    signed int v35 = (void *)qword_1002888A0;
    v36 = [(APDataAdaptor *)self parameters];
    v37 = [v36 objectForKeyedSubscript:@"gender"];
    signed int v38 = [v35 objectForKeyedSubscript:v37];
    BOOL v39 = v38 != 0;
  }
  else
  {
    BOOL v39 = 0;
  }

  if (a3 && !v39)
  {
    v40 = [(APDataAdaptor *)self parameters];
    v41 = [v40 objectForKeyedSubscript:@"gender"];
    v42 = [(id)qword_1002888A0 allKeys];
    v5 = +[NSString stringWithFormat:@"Invalid gender argument '%@'. Must be one of %@", v41, v42];

    NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
    v59 = v5;
    v6 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    *a3 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5201 userInfo:v6];
LABEL_52:

    return 0;
  }
  return v39;
}

- (id)ageGenderData
{
  if (qword_1002888C0 != -1) {
    dispatch_once(&qword_1002888C0, &stru_100233DB0);
  }
  v2 = (void *)qword_1002888B8;

  return v2;
}

@end