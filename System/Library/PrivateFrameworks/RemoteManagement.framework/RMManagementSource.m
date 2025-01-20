@interface RMManagementSource
+ (id)fetchRequestWithAccountIdentifier:(id)a3;
+ (id)fetchRequestWithBootstrapURI:(id)a3;
+ (id)fetchRequestWithBootstrapURI:(id)a3 enrollmentType:(int64_t)a4;
+ (id)fetchRequestWithDeviceChannel;
+ (id)fetchRequestWithEnrollmentType:(int64_t)a3;
+ (id)fetchRequestWithEnrollmentTypes:(id)a3;
+ (id)fetchRequestWithIdentifier:(id)a3;
- (NSString)channelDescription;
- (id)reportDetails;
- (void)awakeFromInsert;
@end

@implementation RMManagementSource

- (void)awakeFromInsert
{
  v5.receiver = self;
  v5.super_class = (Class)RMManagementSource;
  [(RMManagementSource *)&v5 awakeFromInsert];
  v3 = objc_opt_new();
  v4 = [v3 UUIDString];
  [(RMManagementSource *)self setPrimitiveValue:v4 forKey:@"identifier"];
}

+ (id)fetchRequestWithBootstrapURI:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 fetchRequest];
  v6 = +[NSPredicate predicateWithFormat:@"(%K == %@)", @"bootstrapURI", v4];

  [v5 setPredicate:v6];

  return v5;
}

+ (id)fetchRequestWithBootstrapURI:(id)a3 enrollmentType:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 fetchRequest];
  v8 = +[NSPredicate predicateWithFormat:@"(%K == %@) && (%K == %d)", @"bootstrapURI", v6, @"enrollmentType", a4];

  [v7 setPredicate:v8];

  return v7;
}

+ (id)fetchRequestWithDeviceChannel
{
  v2 = [a1 fetchRequest];
  v3 = +[NSPredicate predicateWithFormat:@"(%K == %d) || (%K == %d)", @"enrollmentType", 1, @"enrollmentType", 3];
  [v2 setPredicate:v3];

  return v2;
}

+ (id)fetchRequestWithEnrollmentType:(int64_t)a3
{
  id v4 = [a1 fetchRequest];
  objc_super v5 = +[NSPredicate predicateWithFormat:@"%K == %d", @"enrollmentType", a3];
  [v4 setPredicate:v5];

  return v4;
}

+ (id)fetchRequestWithEnrollmentTypes:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 fetchRequest];
  id v6 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"enrollmentType", v4];

  [v5 setPredicate:v6];

  return v5;
}

+ (id)fetchRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 fetchRequest];
  id v6 = +[NSPredicate predicateWithFormat:@"(%K == %@)", @"identifier", v4];

  [v5 setPredicate:v6];

  return v5;
}

+ (id)fetchRequestWithAccountIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 fetchRequest];
  id v6 = +[NSPredicate predicateWithFormat:@"(%K == %@)", @"accountIdentifier", v4];

  [v5 setPredicate:v6];

  return v5;
}

- (id)reportDetails
{
  v3 = objc_opt_new();
  id v4 = [(RMManagementSource *)self accountIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"accountIdentifier"];

  objc_super v5 = [(RMManagementSource *)self authenticationCredential];
  id v6 = [v5 description];
  [v3 setObject:v6 forKeyedSubscript:@"authenticationCredential"];

  v7 = [(RMManagementSource *)self bootstrapURI];
  [v3 setObject:v7 forKeyedSubscript:@"bootstrapURI"];

  v8 = +[RMStoreHelper descriptorForStoreType:(int)[(RMManagementSource *)self enrollmentType]];
  [v3 setObject:v8 forKeyedSubscript:@"enrollmentType"];

  v9 = [(RMManagementSource *)self conduitConfig];
  v10 = [v9 reportDetails];
  [v3 setObject:v10 forKeyedSubscript:@"conduitConfig"];

  v11 = +[NSNumber numberWithBool:[(RMManagementSource *)self enrolled]];
  [v3 setObject:v11 forKeyedSubscript:@"enrolled"];

  v12 = [(RMManagementSource *)self identifier];
  [v3 setObject:v12 forKeyedSubscript:@"identifier"];

  v13 = [(RMManagementSource *)self name];
  [v3 setObject:v13 forKeyedSubscript:@"name"];

  v14 = [(RMManagementSource *)self personaIdentifier];
  [v3 setObject:v14 forKeyedSubscript:@"personaIdentifier"];

  v15 = [(RMManagementSource *)self predicateStatusKeys];
  [v3 setObject:v15 forKeyedSubscript:@"predicateStatusKeys"];

  v16 = [(RMManagementSource *)self storeDescription];
  [v3 setObject:v16 forKeyedSubscript:@"storeDescription"];

  v17 = [(RMManagementSource *)self command];
  v18 = [v17 reportDetails];
  [v3 setObject:v18 forKeyedSubscript:@"command"];

  v19 = [(RMManagementSource *)self activations];
  v20 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v19 count]);

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v21 = [(RMManagementSource *)self activations];
  id v22 = [v21 countByEnumeratingWithState:&v110 objects:v121 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v111;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v111 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v110 + 1) + 8 * i) reportDetails];
        [v20 addObject:v26];
      }
      id v23 = [v21 countByEnumeratingWithState:&v110 objects:v121 count:16];
    }
    while (v23);
  }

  [v3 setObject:v20 forKeyedSubscript:@"activations"];
  v27 = [(RMManagementSource *)self configurations];
  v28 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v27 count]);

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v29 = [(RMManagementSource *)self configurations];
  id v30 = [v29 countByEnumeratingWithState:&v106 objects:v120 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v107;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v107 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = [*(id *)(*((void *)&v106 + 1) + 8 * (void)j) reportDetails];
        [v28 addObject:v34];
      }
      id v31 = [v29 countByEnumeratingWithState:&v106 objects:v120 count:16];
    }
    while (v31);
  }
  v84 = v20;

  [v3 setObject:v28 forKeyedSubscript:@"configurations"];
  v35 = [(RMManagementSource *)self assets];
  v36 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v35 count]);

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v37 = [(RMManagementSource *)self assets];
  id v38 = [v37 countByEnumeratingWithState:&v102 objects:v119 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v103;
    do
    {
      for (k = 0; k != v39; k = (char *)k + 1)
      {
        if (*(void *)v103 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = [*(id *)(*((void *)&v102 + 1) + 8 * (void)k) reportDetails];
        [v36 addObject:v42];
      }
      id v39 = [v37 countByEnumeratingWithState:&v102 objects:v119 count:16];
    }
    while (v39);
  }
  v83 = v28;

  [v3 setObject:v36 forKeyedSubscript:@"assets"];
  v43 = [(RMManagementSource *)self management];
  v44 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v43 count]);

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v45 = [(RMManagementSource *)self management];
  id v46 = [v45 countByEnumeratingWithState:&v98 objects:v118 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v99;
    do
    {
      for (m = 0; m != v47; m = (char *)m + 1)
      {
        if (*(void *)v99 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = [*(id *)(*((void *)&v98 + 1) + 8 * (void)m) reportDetails];
        [v44 addObject:v50];
      }
      id v47 = [v45 countByEnumeratingWithState:&v98 objects:v118 count:16];
    }
    while (v47);
  }

  v85 = v3;
  [v3 setObject:v44 forKeyedSubscript:@"management"];
  v51 = [(RMManagementSource *)self statusSubscriptions];
  v52 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v51 count]);

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v53 = [(RMManagementSource *)self statusSubscriptions];
  id v54 = [v53 countByEnumeratingWithState:&v94 objects:v117 count:16];
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v95;
    do
    {
      for (n = 0; n != v55; n = (char *)n + 1)
      {
        if (*(void *)v95 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = [*(id *)(*((void *)&v94 + 1) + 8 * (void)n) reportDetails];
        [v52 addObject:v58];
      }
      id v55 = [v53 countByEnumeratingWithState:&v94 objects:v117 count:16];
    }
    while (v55);
  }
  v82 = v36;

  [v85 setObject:v52 forKeyedSubscript:@"statusSubscriptions"];
  v59 = [(RMManagementSource *)self subscribedStatusKeyPaths];
  v60 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v59 count]);

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v61 = [(RMManagementSource *)self subscribedStatusKeyPaths];
  id v62 = [v61 countByEnumeratingWithState:&v90 objects:v116 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v91;
    do
    {
      for (ii = 0; ii != v63; ii = (char *)ii + 1)
      {
        if (*(void *)v91 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = [*(id *)(*((void *)&v90 + 1) + 8 * (void)ii) reportDetails];
        [v60 addObject:v66];
      }
      id v63 = [v61 countByEnumeratingWithState:&v90 objects:v116 count:16];
    }
    while (v63);
  }

  v81 = +[NSSortDescriptor sortDescriptorWithKey:@"keyPath" ascending:1];
  v115 = v81;
  v67 = +[NSArray arrayWithObjects:&v115 count:1];
  v68 = [v60 sortedArrayUsingDescriptors:v67];
  [v85 setObject:v68 forKeyedSubscript:@"subscribedStatusKeyPaths"];

  v69 = [(RMManagementSource *)self metadata];
  v70 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v69 count]);

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v71 = [(RMManagementSource *)self metadata];
  id v72 = [v71 countByEnumeratingWithState:&v86 objects:v114 count:16];
  if (v72)
  {
    id v73 = v72;
    uint64_t v74 = *(void *)v87;
    do
    {
      for (jj = 0; jj != v73; jj = (char *)jj + 1)
      {
        if (*(void *)v87 != v74) {
          objc_enumerationMutation(v71);
        }
        v76 = *(void **)(*((void *)&v86 + 1) + 8 * (void)jj);
        v77 = [v76 value];
        v78 = [v76 key];
        [v70 setObject:v77 forKeyedSubscript:v78];
      }
      id v73 = [v71 countByEnumeratingWithState:&v86 objects:v114 count:16];
    }
    while (v73);
  }

  [v85 setObject:v70 forKeyedSubscript:@"metadata"];
  id v79 = [v85 copy];

  return v79;
}

- (NSString)channelDescription
{
  if ([(RMManagementSource *)self enrollmentType] == 1)
  {
    v3 = @"Device channel";
  }
  else if ([(RMManagementSource *)self enrollmentType] == 3)
  {
    v3 = @"Supervised Device channel";
  }
  else if ([(RMManagementSource *)self enrollmentType])
  {
    if ([(RMManagementSource *)self enrollmentType] == 2)
    {
      v3 = @"Local channel";
    }
    else
    {
      v3 = +[NSString stringWithFormat:@"Unknown channel type (%d)", (int)[(RMManagementSource *)self enrollmentType]];
    }
  }
  else
  {
    id v4 = [(RMManagementSource *)self accountIdentifier];
    v3 = +[NSString stringWithFormat:@"User channel for %@", v4];
  }

  return (NSString *)v3;
}

@end