@interface PPMeCardCache
- (BOOL)deleteMeCardCache;
- (BOOL)writeMeCardCache:(id)a3;
- (id)_cachedDateComponentsFromDateComponents:(void *)a1;
- (id)_dateComponentsFromCachedDateComponents:(void *)a1;
- (id)loadMeCardCache;
@end

@implementation PPMeCardCache

- (void).cxx_destruct
{
}

- (BOOL)deleteMeCardCache
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:self->_path];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    path = self->_path;
    id v13 = 0;
    char v7 = [v5 removeItemAtPath:path error:&v13];
    v8 = v13;

    if (v7)
    {
      BOOL v9 = 1;
    }
    else
    {
      v10 = pp_contacts_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_path;
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        __int16 v16 = 2112;
        v17 = v8;
        _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "failed to delete me card cache at: %@ error: %@", buf, 0x16u);
      }

      BOOL v9 = 0;
    }
  }
  else
  {
    v8 = pp_contacts_log_handle();
    BOOL v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, "went to delete Me card cache but file was missing", buf, 2u);
    }
  }

  return v9;
}

- (BOOL)writeMeCardCache:(id)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v94 = [MEMORY[0x1E4F28B00] currentHandler];
    [v94 handleFailureInMethod:a2, self, @"PPMeCardCache.m", 225, @"Invalid parameter not satisfying: %@", @"meCardCache" object file lineNumber description];
  }
  v96 = self;
  context = (void *)MEMORY[0x1CB79D060]();
  v6 = objc_opt_new();
  char v7 = objc_opt_new();
  [v7 timeIntervalSinceReferenceDate];
  [v6 setCreatedAt:(uint64_t)v8];

  BOOL v9 = [v5 identifier];
  [v6 setIdentifier:v9];

  v10 = [v5 givenName];
  [v6 setGivenName:v10];

  v11 = [v5 middleName];
  [v6 setMiddleName:v11];

  v12 = [v5 familyName];
  [v6 setFamilyName:v12];

  id v13 = [v5 nickname];
  [v6 setNickname:v13];

  v14 = [v5 organizationName];
  [v6 setOrganizationName:v14];

  v15 = [v5 namePrefix];
  [v6 setNamePrefix:v15];

  __int16 v16 = [v5 nameSuffix];
  v97 = v6;
  [v6 setNameSuffix:v16];

  v17 = objc_opt_new();
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  v98 = v5;
  uint64_t v18 = [v5 phoneNumbers];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v115 objects:v126 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v116;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v116 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1CB79D060]();
        v25 = objc_opt_new();
        v26 = [v23 label];
        [v25 setLabel:v26];

        v27 = [v23 value];
        [v25 setValue:v27];

        [v17 addObject:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v115 objects:v126 count:16];
    }
    while (v20);
  }

  [v97 setPhoneNumbers:v17];
  v28 = objc_opt_new();
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v29 = [v5 emailAddresses];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v111 objects:v125 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v112;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v112 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v111 + 1) + 8 * j);
        v35 = (void *)MEMORY[0x1CB79D060]();
        v36 = objc_opt_new();
        v37 = [v34 label];
        [v36 setLabel:v37];

        v38 = [v34 value];
        [v36 setValue:v38];

        [v28 addObject:v36];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v111 objects:v125 count:16];
    }
    while (v31);
  }

  [v97 setEmailAddresses:v28];
  v101 = objc_opt_new();
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  obuint64_t j = [v5 postalAddresses];
  uint64_t v39 = [obj countByEnumeratingWithState:&v107 objects:v124 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v100 = *(void *)v108;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v108 != v100) {
          objc_enumerationMutation(obj);
        }
        v42 = *(void **)(*((void *)&v107 + 1) + 8 * k);
        v43 = (void *)MEMORY[0x1CB79D060]();
        v44 = objc_opt_new();
        v45 = [v42 label];
        [v44 setLabel:v45];

        v46 = [v42 value];
        v47 = [v46 thoroughfare];
        if ([v47 length])
        {
          v48 = [v42 value];
          v49 = [v48 subThoroughfare];
          uint64_t v50 = [v49 length];

          if (v50)
          {
            id v51 = [NSString alloc];
            v52 = [v42 value];
            v53 = [v52 thoroughfare];
            v54 = [v42 value];
            v55 = [v54 subThoroughfare];
            v56 = (void *)[v51 initWithFormat:@"%@\n%@", v53, v55, context];
            [v44 setStreet:v56];

            goto LABEL_27;
          }
        }
        else
        {
        }
        v52 = [v42 value];
        v53 = [v52 thoroughfare];
        [v44 setStreet:v53];
LABEL_27:

        v57 = [v42 value];
        v58 = [v57 subLocality];
        [v44 setSubLocality:v58];

        v59 = [v42 value];
        v60 = [v59 locality];
        [v44 setCity:v60];

        v61 = [v42 value];
        v62 = [v61 subAdministrativeArea];
        [v44 setSubAdministrativeArea:v62];

        v63 = [v42 value];
        v64 = [v63 administrativeArea];
        [v44 setState:v64];

        v65 = [v42 value];
        v66 = [v65 postalCode];
        [v44 setPostalCode:v66];

        v67 = [v42 value];
        v68 = [v67 country];
        [v44 setCountry:v68];

        [v101 addObject:v44];
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v107 objects:v124 count:16];
    }
    while (v40);
  }

  [v97 setPostalAddresses:v101];
  v69 = objc_opt_new();
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v70 = [v98 socialProfiles];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v103 objects:v123 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v104;
    do
    {
      for (uint64_t m = 0; m != v72; ++m)
      {
        if (*(void *)v104 != v73) {
          objc_enumerationMutation(v70);
        }
        v75 = *(void **)(*((void *)&v103 + 1) + 8 * m);
        v76 = (void *)MEMORY[0x1CB79D060]();
        v77 = objc_opt_new();
        v78 = [v75 label];
        [v77 setLabel:v78];

        v79 = [v75 value];
        [v77 setUsername:v79];

        v80 = [v75 label];
        [v77 setService:v80];

        [v69 addObject:v77];
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v103 objects:v123 count:16];
    }
    while (v72);
  }

  [v97 setSocialProfiles:v69];
  v81 = [v98 birthday];

  if (v81)
  {
    v82 = [v98 birthday];
    v83 = -[PPMeCardCache _cachedDateComponentsFromDateComponents:](v96, v82);
    [v97 setBirthday:v83];
  }
  v84 = [v98 nonGregorianBirthday];

  if (v84)
  {
    v85 = [v98 nonGregorianBirthday];
    v86 = -[PPMeCardCache _cachedDateComponentsFromDateComponents:](v96, v85);
    [v97 setNonGregorianBirthday:v86];
  }
  v87 = [v97 data];
  path = v96->_path;
  id v102 = 0;
  char v89 = [v87 writeToFile:path options:1073741825 error:&v102];
  id v90 = v102;

  if ((v89 & 1) == 0)
  {
    v91 = pp_contacts_log_handle();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      v93 = v96->_path;
      *(_DWORD *)buf = 138412546;
      v120 = v93;
      __int16 v121 = 2112;
      id v122 = v90;
      _os_log_error_impl(&dword_1CA9A8000, v91, OS_LOG_TYPE_ERROR, "failed to write me card cache at: %@ error: %@", buf, 0x16u);
    }
  }

  return v89;
}

- (id)_cachedDateComponentsFromDateComponents:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    a1 = objc_opt_new();
    if ([v3 day] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(a1, "setDay:", objc_msgSend(v3, "day"));
    }
    if ([v3 month] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(a1, "setMonth:", objc_msgSend(v3, "month"));
    }
    if ([v3 year] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(a1, "setYear:", objc_msgSend(v3, "year"));
    }
    char v4 = [v3 calendar];
    id v5 = [v4 calendarIdentifier];
    [a1 setCalendarIdentifier:v5];

    v6 = [v3 timeZone];
    char v7 = [v6 name];
    [a1 setTimeZoneName:v7];
  }
  return a1;
}

- (id)loadMeCardCache
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1CB79D060](self, a2);
  char v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:self->_path];

  v6 = pp_contacts_log_handle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      uint64_t v144 = (uint64_t)path;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "PPPB: loading Me card cache from: %@", buf, 0xCu);
    }

    id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v10 = self->_path;
    id v138 = 0;
    v11 = (void *)[v9 initWithContentsOfFile:v10 options:1 error:&v138];
    v6 = v138;
    if (!v11)
    {
      p_super = pp_contacts_log_handle();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = self->_path;
        *(_DWORD *)buf = 138412546;
        uint64_t v144 = (uint64_t)v21;
        __int16 v145 = 2112;
        v146 = v6;
        _os_log_impl(&dword_1CA9A8000, p_super, OS_LOG_TYPE_DEFAULT, "PPPB: failed to read %@: error: %@", buf, 0x16u);
      }
      uint64_t v20 = 0;
      goto LABEL_82;
    }
    v12 = [[PPPBContact alloc] initWithData:v11];
    p_super = &v12->super.super;
    if (v12)
    {
      if ([(PPPBContact *)v12 hasCreatedAt])
      {
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-1209600.0];
        double v15 = (double)[p_super createdAt];
        [v14 timeIntervalSinceReferenceDate];
        if (v16 > v15)
        {
          v17 = pp_contacts_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = [p_super createdAt];
            *(_DWORD *)buf = 134217984;
            uint64_t v144 = v18;
            _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_INFO, "PPPB: aging out me card cache due to age: %lld", buf, 0xCu);
          }

          [(PPMeCardCache *)self deleteMeCardCache];
        }
      }
      else
      {
        [(PPMeCardCache *)self deleteMeCardCache];
      }
      if ([p_super hasIdentifier])
      {
        uint64_t v24 = [p_super identifier];
        if (v24)
        {
          v25 = (void *)v24;
          v26 = [p_super identifier];
          uint64_t v27 = [v26 length];

          if (v27)
          {
            id v102 = self;
            long long v103 = v11;
            long long v104 = v6;
            long long v105 = v3;
            long long v106 = p_super;
            long long v107 = objc_opt_new();
            long long v134 = 0u;
            long long v135 = 0u;
            long long v136 = 0u;
            long long v137 = 0u;
            v28 = [p_super phoneNumbers];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v134 objects:v142 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v135;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v135 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(void **)(*((void *)&v134 + 1) + 8 * i);
                  v34 = (void *)MEMORY[0x1CB79D060]();
                  v35 = [v33 value];
                  uint64_t v36 = [v35 length];

                  if (v36)
                  {
                    v37 = (void *)MEMORY[0x1E4F89E40];
                    v38 = [v33 label];
                    uint64_t v39 = [v33 value];
                    uint64_t v40 = [v37 labeledValueWithLabel:v38 value:v39];

                    if (v40) {
                      [v107 addObject:v40];
                    }
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v134 objects:v142 count:16];
              }
              while (v30);
            }

            long long v108 = objc_opt_new();
            long long v130 = 0u;
            long long v131 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            v41 = [v106 emailAddresses];
            uint64_t v42 = [v41 countByEnumeratingWithState:&v130 objects:v141 count:16];
            if (v42)
            {
              uint64_t v43 = v42;
              uint64_t v44 = *(void *)v131;
              do
              {
                for (uint64_t j = 0; j != v43; ++j)
                {
                  if (*(void *)v131 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  v46 = *(void **)(*((void *)&v130 + 1) + 8 * j);
                  v47 = (void *)MEMORY[0x1CB79D060]();
                  v48 = [v46 value];
                  uint64_t v49 = [v48 length];

                  if (v49)
                  {
                    uint64_t v50 = (void *)MEMORY[0x1E4F89E40];
                    id v51 = [v46 label];
                    v52 = [v46 value];
                    v53 = [v50 labeledValueWithLabel:v51 value:v52];

                    if (v53) {
                      [v108 addObject:v53];
                    }
                  }
                }
                uint64_t v43 = [v41 countByEnumeratingWithState:&v130 objects:v141 count:16];
              }
              while (v43);
            }

            long long v111 = objc_opt_new();
            long long v126 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            obuint64_t j = [v106 postalAddresses];
            uint64_t v114 = [obj countByEnumeratingWithState:&v126 objects:v140 count:16];
            if (v114)
            {
              uint64_t v112 = *(void *)v127;
              do
              {
                for (uint64_t k = 0; k != v114; ++k)
                {
                  if (*(void *)v127 != v112) {
                    objc_enumerationMutation(obj);
                  }
                  v55 = *(void **)(*((void *)&v126 + 1) + 8 * k);
                  uint64_t v56 = MEMORY[0x1CB79D060]();
                  v57 = [v55 street];
                  v58 = [v57 componentsSeparatedByString:@"\n"];

                  if ([v58 count] == 2)
                  {
                    v120 = [v58 objectAtIndexedSubscript:0];
                    long long v118 = [v58 objectAtIndexedSubscript:1];
                  }
                  else
                  {
                    [v55 street];
                    v120 = long long v118 = 0;
                  }
                  context = (void *)v56;
                  if ([v55 hasCountry])
                  {
                    uint64_t v59 = [v55 country];
LABEL_58:
                    v60 = (void *)v59;
                    goto LABEL_60;
                  }
                  if ([v55 hasIsoCountryCode])
                  {
                    uint64_t v59 = [v55 isoCountryCode];
                    goto LABEL_58;
                  }
                  v60 = 0;
LABEL_60:
                  id v61 = objc_alloc(MEMORY[0x1E4F89EC8]);
                  v62 = [v55 city];
                  v63 = [v55 subLocality];
                  v64 = [v55 state];
                  v65 = [v55 subAdministrativeArea];
                  v66 = [v55 postalCode];
                  v67 = (void *)[v61 initWithThoroughfare:v120 subThoroughfare:v118 locality:v62 subLocality:v63 administrativeArea:v64 subAdministrativeArea:v65 postalCode:v66 country:v60];

                  v68 = (void *)MEMORY[0x1E4F89E40];
                  v69 = [v55 label];
                  v70 = [v68 labeledValueWithLabel:v69 value:v67];

                  if (v70) {
                    [v111 addObject:v70];
                  }
                }
                uint64_t v114 = [obj countByEnumeratingWithState:&v126 objects:v140 count:16];
              }
              while (v114);
            }

            uint64_t v71 = objc_opt_new();
            long long v122 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            long long v125 = 0u;
            uint64_t v72 = [v106 socialProfiles];
            uint64_t v73 = [v72 countByEnumeratingWithState:&v122 objects:v139 count:16];
            if (v73)
            {
              uint64_t v74 = v73;
              uint64_t v75 = *(void *)v123;
              do
              {
                for (uint64_t m = 0; m != v74; ++m)
                {
                  if (*(void *)v123 != v75) {
                    objc_enumerationMutation(v72);
                  }
                  v77 = *(void **)(*((void *)&v122 + 1) + 8 * m);
                  v78 = (void *)MEMORY[0x1CB79D060]();
                  v79 = [v77 username];
                  uint64_t v80 = [v79 length];

                  if (v80)
                  {
                    v81 = (void *)MEMORY[0x1E4F89E40];
                    v82 = [v77 label];
                    v83 = [v77 username];
                    v84 = [v81 labeledValueWithLabel:v82 value:v83];

                    if (v84) {
                      [v71 addObject:v84];
                    }
                  }
                }
                uint64_t v74 = [v72 countByEnumeratingWithState:&v122 objects:v139 count:16];
              }
              while (v74);
            }

            id contexta = objc_alloc(MEMORY[0x1E4F89DD0]);
            v85 = [v106 identifier];
            v86 = [v106 namePrefix];
            v87 = [v106 givenName];
            v88 = [v106 middleName];
            char v89 = [v106 familyName];
            id v90 = [v106 nameSuffix];
            v91 = [v106 nickname];
            __int16 v121 = [v106 organizationName];
            int v115 = [v106 hasBirthday];
            if (v115)
            {
              [v106 birthday];
              v101 = v92 = v102;
              v119 = -[PPMeCardCache _dateComponentsFromCachedDateComponents:](v102, v101);
            }
            else
            {
              v119 = 0;
              v92 = v102;
            }
            if ([v106 hasNonGregorianBirthday])
            {
              [v106 nonGregorianBirthday];
              long long v113 = v90;
              v94 = id obja = v89;
              -[PPMeCardCache _dateComponentsFromCachedDateComponents:](v92, v94);
              v95 = v91;
              v96 = v88;
              v97 = v87;
              v98 = v86;
              uint64_t v100 = v99 = v85;
              v22 = v107;
              uint64_t v20 = objc_msgSend(contexta, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v99, 1, v98, v97, v96, obja, v113, v95, 0, v121, 0, v119, v100, v107, v108,
                              v71,
                              v111);

              v85 = v99;
              v86 = v98;
              v87 = v97;
              v88 = v96;
              v91 = v95;

              char v89 = obja;
              id v90 = v113;
            }
            else
            {
              v22 = v107;
              uint64_t v20 = objc_msgSend(contexta, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v85, 1, v86, v87, v88, v89, v90, v91, 0, v121, 0, v119, 0, v107, v108,
                              v71,
                              v111);
            }
            if (v115)
            {
            }
            v6 = v104;
            id v3 = v105;
            v11 = v103;
            p_super = v106;
            goto LABEL_81;
          }
        }
      }
      [(PPMeCardCache *)self deleteMeCardCache];
      v22 = pp_contacts_log_handle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "PPPB: malformed me card cache (missing identifier)";
        goto LABEL_79;
      }
    }
    else
    {
      [(PPMeCardCache *)self deleteMeCardCache];
      v22 = pp_contacts_log_handle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "PPPB: malformed me card cache (PPPBContact initialization failed)";
LABEL_79:
        _os_log_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
      }
    }
    uint64_t v20 = 0;
LABEL_81:

LABEL_82:
    goto LABEL_83;
  }
  if (v7)
  {
    uint64_t v19 = self->_path;
    *(_DWORD *)buf = 138412290;
    uint64_t v144 = (uint64_t)v19;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "PPPB: No Me card cache at: %@", buf, 0xCu);
  }
  uint64_t v20 = 0;
LABEL_83:

  return v20;
}

- (id)_dateComponentsFromCachedDateComponents:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    a1 = objc_opt_new();
    if ([v3 hasDay]) {
      objc_msgSend(a1, "setDay:", (int)objc_msgSend(v3, "day"));
    }
    if ([v3 hasMonth]) {
      objc_msgSend(a1, "setMonth:", (int)objc_msgSend(v3, "month"));
    }
    if ([v3 hasYear]) {
      objc_msgSend(a1, "setYear:", (int)objc_msgSend(v3, "year"));
    }
    if ([v3 hasCalendarIdentifier])
    {
      char v4 = (void *)MEMORY[0x1E4F1C9A8];
      char v5 = [v3 calendarIdentifier];
      v6 = [v4 calendarWithIdentifier:v5];
      [a1 setCalendar:v6];
    }
    if ([v3 hasTimeZoneName])
    {
      BOOL v7 = (void *)MEMORY[0x1E4F1CAF0];
      double v8 = [v3 timeZoneName];
      id v9 = [v7 timeZoneWithName:v8];
      [a1 setTimeZone:v9];
    }
  }

  return a1;
}

@end