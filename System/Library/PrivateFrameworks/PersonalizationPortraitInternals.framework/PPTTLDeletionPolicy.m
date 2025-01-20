@interface PPTTLDeletionPolicy
+ (id)defaultPolicy;
- (BOOL)applyPolicyWithError:(id *)a3 shouldContinueBlock:(id)a4;
- (PPTTLDeletionPolicy)initWithRules:(id)a3 namedEntityStore:(id)a4 topicStore:(id)a5 locationStore:(id)a6;
- (id)description;
@end

@implementation PPTTLDeletionPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<PPTTLDeletionPolicy rules.count: %tu>", -[NSArray count](self->_rules, "count"));
  return v2;
}

- (BOOL)applyPolicyWithError:(id *)a3 shouldContinueBlock:(id)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  v6 = (unsigned int (**)(void))a4;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v7 = [(NSArray *)self->_rules _pas_shuffledArrayUsingRng:0];
  uint64_t v84 = [v7 countByEnumeratingWithState:&v94 objects:v98 count:16];
  if (!v84)
  {

    id v9 = 0;
    BOOL v10 = 1;
    goto LABEL_89;
  }
  id obj = v7;
  id v9 = 0;
  BOOL v10 = 1;
  uint64_t v85 = *(void *)v95;
  *(void *)&long long v8 = 138412546;
  long long v81 = v8;
  v86 = v6;
  v82 = a3;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v95 != v85) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v94 + 1) + 8 * v11);
      context = (void *)MEMORY[0x1CB79D060]();
      if (!v6[2](v6))
      {
        id v27 = v9;
LABEL_85:
        id v9 = v27;
        v79 = v82;
        goto LABEL_86;
      }
      v13 = pp_default_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v100 = v12;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: Performing Named Entity cleanup for rule: %@", buf, 0xCu);
      }

      v14 = [v12 bundleIdentifier];
      if (v14)
      {

LABEL_12:
        v16 = objc_msgSend(v12, "bundleIdentifier", v81);
        v17 = [v12 groupIdentifier];
        v18 = [v12 maxAgeSeconds];
        [v18 doubleValue];
        double v20 = v19;
        id v92 = v9;
        id v21 = v16;
        id v22 = v17;
        if (self)
        {
          v23 = objc_opt_new();
          v24 = [v23 dateByAddingTimeInterval:-v20];

          BOOL v25 = [(PPLocalNamedEntityStore *)self->_namedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:v21 groupId:v22 olderThan:v24 deletedCount:0 error:&v92];
          if (!v25)
          {
            v26 = pp_default_log_handle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v100 = v21;
              __int16 v101 = 2112;
              id v102 = v22;
              __int16 v103 = 2112;
              id v104 = v92;
              _os_log_error_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out named entity extractions from %@ with groupId %@: %@", buf, 0x20u);
            }

            v6 = v86;
          }
        }
        else
        {
          BOOL v25 = 0;
        }

        id v27 = v92;
        if (!v25) {
          goto LABEL_80;
        }
        goto LABEL_19;
      }
      v15 = [v12 groupIdentifier];

      if (v15) {
        goto LABEL_12;
      }
      v56 = [v12 maxAgeSeconds];
      [v56 doubleValue];
      id v93 = v9;
      if (self)
      {
        double v58 = v57;
        v59 = objc_opt_new();
        v60 = [v59 dateByAddingTimeInterval:-v58];

        BOOL v61 = [(PPLocalNamedEntityStore *)self->_namedEntityStore deleteAllNamedEntitiesOlderThanDate:v60 deletedCount:0 error:&v93];
        if (!v61)
        {
          v62 = pp_default_log_handle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v81;
            id v100 = v60;
            __int16 v101 = 2112;
            id v102 = v93;
            _os_log_error_impl(&dword_1CA9A8000, v62, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out named entity extractions older than %@: %@", buf, 0x16u);
          }
        }
        v63 = v93;
      }
      else
      {
        BOOL v61 = 0;
        v63 = v9;
      }
      id v27 = v63;

      if (!v61)
      {
LABEL_80:
        BOOL v10 = 0;
        goto LABEL_85;
      }
LABEL_19:
      if (!v6[2](v6))
      {
        BOOL v10 = 1;
        goto LABEL_85;
      }
      v28 = pp_default_log_handle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v100 = v12;
        _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: Performing Topic cleanup for rule: %@", buf, 0xCu);
      }

      v29 = [v12 bundleIdentifier];
      if (v29)
      {

LABEL_25:
        v31 = objc_msgSend(v12, "bundleIdentifier", v81);
        v32 = [v12 groupIdentifier];
        v33 = [v12 maxAgeSeconds];
        [v33 doubleValue];
        double v35 = v34;
        id v90 = v27;
        id v36 = v31;
        if (self)
        {
          id v37 = v32;
          v38 = objc_opt_new();
          v39 = [v38 dateByAddingTimeInterval:-v35];

          BOOL v40 = [(PPLocalTopicStore *)self->_topicStore deleteAllTopicsFromSourcesWithBundleId:v36 groupId:v37 olderThan:v39 deletedCount:0 error:&v90];
          if (!v40)
          {
            v41 = pp_default_log_handle();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v81;
              id v100 = v36;
              __int16 v101 = 2112;
              id v102 = v90;
              _os_log_error_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out topic extractions from %@: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          BOOL v40 = 0;
        }

        id v42 = v90;
        v6 = v86;
        if (!v40) {
          goto LABEL_82;
        }
        goto LABEL_32;
      }
      v30 = [v12 groupIdentifier];

      if (v30) {
        goto LABEL_25;
      }
      v64 = [v12 maxAgeSeconds];
      [v64 doubleValue];
      id v91 = v27;
      if (self)
      {
        double v66 = v65;
        v67 = objc_opt_new();
        v68 = [v67 dateByAddingTimeInterval:-v66];

        BOOL v69 = [(PPLocalTopicStore *)self->_topicStore deleteAllTopicsOlderThanDate:v68 deletedCount:0 error:&v91];
        if (!v69)
        {
          v70 = pp_default_log_handle();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v81;
            id v100 = v68;
            __int16 v101 = 2112;
            id v102 = v91;
            _os_log_error_impl(&dword_1CA9A8000, v70, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out topic extractions older than %@: %@", buf, 0x16u);
          }
        }
        v71 = v91;
      }
      else
      {
        BOOL v69 = 0;
        v71 = v27;
      }
      id v42 = v71;

      if (!v69)
      {
LABEL_82:
        BOOL v10 = 0;
LABEL_84:
        id v27 = v42;
        goto LABEL_85;
      }
LABEL_32:
      if (!v6[2](v6))
      {
        BOOL v10 = 1;
        goto LABEL_84;
      }
      v43 = pp_default_log_handle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v100 = v12;
        _os_log_impl(&dword_1CA9A8000, v43, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: Performing Location cleanup for rule: %@", buf, 0xCu);
      }

      v44 = [v12 bundleIdentifier];
      if (v44)
      {

LABEL_38:
        v46 = objc_msgSend(v12, "bundleIdentifier", v81);
        v47 = [v12 groupIdentifier];
        v48 = [v12 maxAgeSeconds];
        [v48 doubleValue];
        double v50 = v49;
        id v88 = v42;
        id v51 = v46;
        id v52 = v47;
        if (self)
        {
          v53 = objc_opt_new();
          v54 = [v53 dateByAddingTimeInterval:-v50];

          BOOL v10 = [(PPLocalLocationStore *)self->_locationStore deleteAllLocationsFromSourcesWithBundleId:v51 groupId:v52 olderThan:v54 deletedCount:0 error:&v88];
          if (!v10)
          {
            v55 = pp_default_log_handle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v100 = v51;
              __int16 v101 = 2112;
              id v102 = v52;
              __int16 v103 = 2112;
              id v104 = v88;
              _os_log_error_impl(&dword_1CA9A8000, v55, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out location extractions from %@ with groupId %@: %@", buf, 0x20u);
            }
          }
        }
        else
        {
          BOOL v10 = 0;
        }

        id v9 = v88;
        id v42 = v52;
        goto LABEL_45;
      }
      v45 = [v12 groupIdentifier];

      if (v45) {
        goto LABEL_38;
      }
      id v51 = [v12 maxAgeSeconds];
      [v51 doubleValue];
      id v89 = v42;
      if (self)
      {
        double v73 = v72;
        v74 = objc_opt_new();
        v75 = [v74 dateByAddingTimeInterval:-v73];

        BOOL v10 = [(PPLocalLocationStore *)self->_locationStore deleteAllLocationsOlderThanDate:v75 deletedCount:0 error:&v89];
        if (!v10)
        {
          v76 = pp_default_log_handle();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v81;
            id v100 = v75;
            __int16 v101 = 2112;
            id v102 = v89;
            _os_log_error_impl(&dword_1CA9A8000, v76, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out location extractions older than %@: %@", buf, 0x16u);
          }
        }
        v77 = v89;
      }
      else
      {
        BOOL v10 = 0;
        v77 = v42;
      }
      id v9 = v77;
LABEL_45:

      ++v11;
    }
    while (v84 != v11);
    uint64_t v78 = [obj countByEnumeratingWithState:&v94 objects:v98 count:16];
    v79 = v82;
    uint64_t v84 = v78;
  }
  while (v78);
LABEL_86:

  if (v79 && !v10)
  {
    id v9 = v9;
    BOOL v10 = 0;
    id *v79 = v9;
  }
LABEL_89:

  return v10;
}

- (PPTTLDeletionPolicy)initWithRules:(id)a3 namedEntityStore:(id)a4 topicStore:(id)a5 locationStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PPTTLDeletionPolicy;
  v15 = [(PPTTLDeletionPolicy *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rules, a3);
    objc_storeStrong((id *)&v16->_namedEntityStore, a4);
    objc_storeStrong((id *)&v16->_topicStore, a5);
    objc_storeStrong((id *)&v16->_locationStore, a6);
  }

  return v16;
}

+ (id)defaultPolicy
{
  v32[11] = *MEMORY[0x1E4F143B8];
  v31 = [[PPTTLDeletionPolicyRule alloc] initWithBundleIdentifier:0 groupIdentifier:0 maxAgeSeconds:&unk_1F256B210];
  v32[0] = v31;
  v2 = [PPTTLDeletionPolicyRule alloc];
  v30 = [(PPTTLDeletionPolicyRule *)v2 initWithBundleIdentifier:*MEMORY[0x1E4F8A0F8] groupIdentifier:*MEMORY[0x1E4F8A178] maxAgeSeconds:&unk_1F256B220];
  v32[1] = v30;
  v3 = [PPTTLDeletionPolicyRule alloc];
  uint64_t v4 = *MEMORY[0x1E4F8A0D0];
  uint64_t v5 = *MEMORY[0x1E4F8A170];
  v6 = [(PPTTLDeletionPolicyRule *)v3 initWithBundleIdentifier:*MEMORY[0x1E4F8A0D0] groupIdentifier:*MEMORY[0x1E4F8A170] maxAgeSeconds:&unk_1F256B230];
  v32[2] = v6;
  v7 = [PPTTLDeletionPolicyRule alloc];
  long long v8 = [(PPTTLDeletionPolicyRule *)v7 initWithBundleIdentifier:*MEMORY[0x1E4F8A048] groupIdentifier:v5 maxAgeSeconds:&unk_1F256B230];
  v32[3] = v8;
  id v9 = [PPTTLDeletionPolicyRule alloc];
  BOOL v10 = [(PPTTLDeletionPolicyRule *)v9 initWithBundleIdentifier:v4 groupIdentifier:*MEMORY[0x1E4F8A168] maxAgeSeconds:&unk_1F256B220];
  v32[4] = v10;
  id v11 = [PPTTLDeletionPolicyRule alloc];
  id v12 = [(PPTTLDeletionPolicyRule *)v11 initWithBundleIdentifier:*MEMORY[0x1E4F8A0C8] groupIdentifier:0 maxAgeSeconds:&unk_1F256B220];
  v32[5] = v12;
  id v13 = [PPTTLDeletionPolicyRule alloc];
  id v14 = [(PPTTLDeletionPolicyRule *)v13 initWithBundleIdentifier:*MEMORY[0x1E4F8A0D8] groupIdentifier:0 maxAgeSeconds:&unk_1F256B220];
  v32[6] = v14;
  v15 = [PPTTLDeletionPolicyRule alloc];
  v16 = [(PPTTLDeletionPolicyRule *)v15 initWithBundleIdentifier:@"PortraitBundleIdWildCardMatchingAll" groupIdentifier:*MEMORY[0x1E4F8A150] maxAgeSeconds:&unk_1F256B220];
  v32[7] = v16;
  v17 = [PPTTLDeletionPolicyRule alloc];
  objc_super v18 = [(PPTTLDeletionPolicyRule *)v17 initWithBundleIdentifier:@"PortraitBundleIdWildCardMatchingAll" groupIdentifier:*MEMORY[0x1E4F8A158] maxAgeSeconds:&unk_1F256B220];
  v32[8] = v18;
  double v19 = [PPTTLDeletionPolicyRule alloc];
  double v20 = [(PPTTLDeletionPolicyRule *)v19 initWithBundleIdentifier:*MEMORY[0x1E4F8A068] groupIdentifier:*MEMORY[0x1E4F8A138] maxAgeSeconds:&unk_1F256B220];
  v32[9] = v20;
  id v21 = [PPTTLDeletionPolicyRule alloc];
  id v22 = [(PPTTLDeletionPolicyRule *)v21 initWithBundleIdentifier:*MEMORY[0x1E4F8A0A0] groupIdentifier:0 maxAgeSeconds:&unk_1F256B220];
  v32[10] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:11];

  v24 = +[PPLocalNamedEntityStore defaultStore];
  BOOL v25 = +[PPLocalTopicStore defaultStore];
  uint64_t v26 = +[PPLocalLocationStore defaultStore];
  id v27 = (void *)v26;
  v28 = 0;
  if (v24 && v25 && v26) {
    v28 = [[PPTTLDeletionPolicy alloc] initWithRules:v23 namedEntityStore:v24 topicStore:v25 locationStore:v26];
  }

  return v28;
}

@end