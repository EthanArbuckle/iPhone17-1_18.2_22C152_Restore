@interface CNContact
+ (void)load;
- (id)CNFSSerialize;
- (id)abs_identifier;
- (id)cappedString:(id)a3 length:(int64_t)a4;
@end

@implementation CNContact

- (id)cappedString:(id)a3 length:(int64_t)a4
{
  id v5 = a3;
  if ((unint64_t)[v5 length] <= a4)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v5 substringToIndex:a4];
  }
  v7 = v6;

  return v7;
}

- (id)CNFSSerialize
{
  id v3 = [objc_alloc((Class)NSMutableData) initWithCapacity:2048];
  LOWORD(v219[0]) = 1;
  [v3 appendBytes:v219 length:2];
  LOWORD(v219[0]) = 1;
  [v3 appendBytes:v219 length:2];
  v4 = [(CNContact *)self identifier];
  sub_100016680(1, v4, v3);

  id v5 = [(CNContact *)self namePrefix];
  sub_100016680(2, v5, v3);

  id v6 = [(CNContact *)self givenName];
  sub_100016680(3, v6, v3);

  v7 = [(CNContact *)self middleName];
  sub_100016680(4, v7, v3);

  v8 = [(CNContact *)self familyName];
  sub_100016680(5, v8, v3);

  v9 = [(CNContact *)self previousFamilyName];
  sub_100016680(6, v9, v3);

  v10 = [(CNContact *)self nameSuffix];
  sub_100016680(7, v10, v3);

  v11 = [(CNContact *)self nickname];
  sub_100016680(8, v11, v3);

  v12 = [(CNContact *)self organizationName];
  sub_100016680(9, v12, v3);

  v13 = [(CNContact *)self departmentName];
  sub_100016680(10, v13, v3);

  v14 = [(CNContact *)self jobTitle];
  sub_100016680(11, v14, v3);

  v15 = [(CNContact *)self note];
  v16 = [(CNContact *)self cappedString:v15 length:0x2000];
  sub_100016680(12, v16, v3);

  v17 = [(CNContact *)self birthday];
  if (v17)
  {
    LOWORD(v219[0]) = 15;
    id v18 = v3;
    id v19 = v17;
    [v18 appendBytes:v219 length:2];
    sub_10001682C(v19, v18);
  }
  id v20 = [(CNContact *)self nonGregorianBirthday];
  id v21 = v3;
  v22 = v21;
  if (v20)
  {
    LOWORD(v219[0]) = 26;
    [v21 appendBytes:v219 length:2];
    v219[0] = 12;
    id v23 = v20;
    id v24 = v22;
    [v24 appendBytes:v219 length:4];
    sub_10001682C(v23, v24);
    [v23 calendar];
    v26 = v25 = self;

    v27 = [v26 calendarIdentifier];
    char v28 = sub_100016A2C(v27);

    self = v25;
    LOBYTE(v206) = v28;
    [v24 appendBytes:&v206 length:1];
  }
  unsigned __int8 v29 = [(CNContact *)self contactType];
  LOWORD(v219[0]) = 17;
  id v30 = v22;
  [v30 appendBytes:v219 length:2];
  LOBYTE(v219[0]) = v29;
  [v30 appendBytes:v219 length:1];

  v31 = [(CNContact *)self phoneticOrganizationName];
  sub_100016680(18, v31, v30);

  v32 = [(CNContact *)self phoneticFamilyName];
  sub_100016680(19, v32, v30);

  v33 = [(CNContact *)self phoneticGivenName];
  sub_100016680(20, v33, v30);

  v34 = [(CNContact *)self phoneticMiddleName];
  sub_100016680(21, v34, v30);

  v35 = [(CNContact *)self pronunciationGivenName];
  sub_100016680(28, v35, v30);

  v36 = [(CNContact *)self pronunciationFamilyName];
  sub_100016680(27, v36, v30);

  v37 = [(CNContact *)self phonemeData];
  sub_100016680(29, v37, v30);

  v38 = [(CNContact *)self preferredApplePersonaIdentifier];
  sub_100016680(24, v38, v30);

  v39 = [(CNContact *)self preferredLikenessSource];
  sub_100016680(25, v39, v30);

  v40 = [(CNContact *)self preferredChannel];
  sub_100016680(30, v40, v30);

  v41 = [(CNContact *)self downtimeWhitelist];
  sub_100016680(31, v41, v30);

  v42 = [(CNContact *)self callAlert];

  if (v42)
  {
    LOWORD(v219[0]) = 22;
    [v30 appendBytes:v219 length:2];
    v43 = [(CNContact *)self callAlert];
    v44 = [v43 sound];
    sub_1000166FC(v44, v30);

    v45 = [(CNContact *)self callAlert];
    v46 = [v45 vibration];
    sub_1000166FC(v46, v30);

    v47 = [(CNContact *)self callAlert];
    LOBYTE(v219[0]) = [v47 ignoreMute];
    [v30 appendBytes:v219 length:1];
  }
  v48 = [(CNContact *)self textAlert];

  if (v48)
  {
    LOWORD(v219[0]) = 23;
    [v30 appendBytes:v219 length:2];
    v49 = [(CNContact *)self textAlert];
    v50 = [v49 sound];
    sub_1000166FC(v50, v30);

    v51 = [(CNContact *)self textAlert];
    v52 = [v51 vibration];
    sub_1000166FC(v52, v30);

    v53 = [(CNContact *)self textAlert];
    LOBYTE(v219[0]) = [v53 ignoreMute];
    [v30 appendBytes:v219 length:1];
  }
  long long v204 = 0u;
  long long v205 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  v54 = [(CNContact *)self phoneNumbers];
  id v55 = [v54 countByEnumeratingWithState:&v202 objects:v218 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v203;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v203 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v202 + 1) + 8 * i);
        LOWORD(v219[0]) = -32767;
        [v30 appendBytes:v219 length:2];
        v60 = [v59 label];
        sub_1000167B8(v60, v30);

        v61 = [v59 value];
        v62 = [v61 stringValue];
        sub_1000166FC(v62, v30);
      }
      id v56 = [v54 countByEnumeratingWithState:&v202 objects:v218 count:16];
    }
    while (v56);
  }

  long long v200 = 0u;
  long long v201 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  v63 = [v168 emailAddresses];
  id v64 = [v63 countByEnumeratingWithState:&v198 objects:v217 count:16];
  if (v64)
  {
    id v65 = v64;
    uint64_t v66 = *(void *)v199;
    do
    {
      for (j = 0; j != v65; j = (char *)j + 1)
      {
        if (*(void *)v199 != v66) {
          objc_enumerationMutation(v63);
        }
        v68 = *(void **)(*((void *)&v198 + 1) + 8 * (void)j);
        LOWORD(v219[0]) = -32766;
        [v30 appendBytes:v219 length:2];
        v69 = [v68 label];
        sub_1000167B8(v69, v30);

        v70 = [v68 value];
        sub_1000166FC(v70, v30);
      }
      id v65 = [v63 countByEnumeratingWithState:&v198 objects:v217 count:16];
    }
    while (v65);
  }

  long long v196 = 0u;
  long long v197 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  v71 = [v168 postalAddresses];
  id v72 = [v71 countByEnumeratingWithState:&v194 objects:v216 count:16];
  if (v72)
  {
    id v73 = v72;
    uint64_t v74 = *(void *)v195;
    do
    {
      for (k = 0; k != v73; k = (char *)k + 1)
      {
        if (*(void *)v195 != v74) {
          objc_enumerationMutation(v71);
        }
        v76 = *(void **)(*((void *)&v194 + 1) + 8 * (void)k);
        LOWORD(v219[0]) = -32765;
        [v30 appendBytes:v219 length:2];
        v77 = [v76 label];
        sub_1000167B8(v77, v30);

        id v78 = [v76 value];
        id v79 = v30;
        if (v78)
        {
          v80 = [v78 street];

          if (v80)
          {
            sub_1000167B8(CNPostalAddressStreetKey, v79);
            v81 = [v78 street];
            sub_1000166FC(v81, v79);
          }
          v82 = [v78 city];

          if (v82)
          {
            sub_1000167B8(CNPostalAddressCityKey, v79);
            v83 = [v78 city];
            sub_1000166FC(v83, v79);
          }
          v84 = [v78 state];

          if (v84)
          {
            sub_1000167B8(CNPostalAddressStateKey, v79);
            v85 = [v78 state];
            sub_1000166FC(v85, v79);
          }
          v86 = [v78 postalCode];

          if (v86)
          {
            sub_1000167B8(CNPostalAddressPostalCodeKey, v79);
            v87 = [v78 postalCode];
            sub_1000166FC(v87, v79);
          }
          v88 = [v78 country];

          if (v88)
          {
            sub_1000167B8(CNPostalAddressCountryKey, v79);
            v89 = [v78 country];
            sub_1000166FC(v89, v79);
          }
          v90 = [v78 ISOCountryCode];

          if (v90)
          {
            sub_1000167B8(CNPostalAddressISOCountryCodeKey, v79);
            v91 = [v78 ISOCountryCode];
            sub_1000166FC(v91, v79);
          }
          v92 = [v78 subLocality];

          if (v92)
          {
            sub_1000167B8(CNPostalAddressSubLocalityKey, v79);
            v93 = [v78 subLocality];
            sub_1000166FC(v93, v79);
          }
          v94 = [v78 subAdministrativeArea];

          if (v94)
          {
            sub_1000167B8(CNPostalAddressSubAdministrativeAreaKey, v79);
            v95 = [v78 subAdministrativeArea];
            sub_1000166FC(v95, v79);
          }
          LOBYTE(v219[0]) = -2;
          [v79 appendBytes:v219 length:1];
        }
      }
      id v73 = [v71 countByEnumeratingWithState:&v194 objects:v216 count:16];
    }
    while (v73);
  }

  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  v96 = [v168 urlAddresses];
  id v97 = [v96 countByEnumeratingWithState:&v190 objects:v215 count:16];
  if (v97)
  {
    id v98 = v97;
    uint64_t v99 = *(void *)v191;
    do
    {
      for (m = 0; m != v98; m = (char *)m + 1)
      {
        if (*(void *)v191 != v99) {
          objc_enumerationMutation(v96);
        }
        v101 = *(void **)(*((void *)&v190 + 1) + 8 * (void)m);
        LOWORD(v219[0]) = -32764;
        [v30 appendBytes:v219 length:2];
        v102 = [v101 label];
        sub_1000167B8(v102, v30);

        v103 = [v101 value];
        sub_1000166FC(v103, v30);
      }
      id v98 = [v96 countByEnumeratingWithState:&v190 objects:v215 count:16];
    }
    while (v98);
  }

  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  v104 = [v168 contactRelations];
  id v105 = [v104 countByEnumeratingWithState:&v186 objects:v214 count:16];
  if (v105)
  {
    id v106 = v105;
    uint64_t v107 = *(void *)v187;
    do
    {
      for (n = 0; n != v106; n = (char *)n + 1)
      {
        if (*(void *)v187 != v107) {
          objc_enumerationMutation(v104);
        }
        v109 = *(void **)(*((void *)&v186 + 1) + 8 * (void)n);
        LOWORD(v219[0]) = -32763;
        [v30 appendBytes:v219 length:2];
        v110 = [v109 label];
        sub_1000167B8(v110, v30);

        v111 = [v109 identifier];
        sub_1000166FC(v111, v30);

        v112 = [v109 value];
        v113 = [v112 name];
        sub_1000166FC(v113, v30);
      }
      id v106 = [v104 countByEnumeratingWithState:&v186 objects:v214 count:16];
    }
    while (v106);
  }

  long long v184 = 0u;
  long long v185 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  id obj = [v168 socialProfiles];
  id v114 = [obj countByEnumeratingWithState:&v182 objects:v213 count:16];
  if (v114)
  {
    id v115 = v114;
    uint64_t v116 = *(void *)v183;
    v171 = (void *)CNSocialProfileTeamIdentifierKey;
    v169 = (void *)CNSocialProfileDisplayNameKey;
    v170 = (void *)CNSocialProfileBundleIdentifiersKey;
    do
    {
      v117 = 0;
      id v172 = v115;
      do
      {
        if (*(void *)v183 != v116) {
          objc_enumerationMutation(obj);
        }
        v118 = *(void **)(*((void *)&v182 + 1) + 8 * (void)v117);
        LOWORD(v219[0]) = -32762;
        [v30 appendBytes:v219 length:2];
        v119 = [v118 label];
        sub_1000167B8(v119, v30);

        id v120 = [v118 value];
        id v121 = v30;
        if (v120)
        {
          v122 = [v120 urlString];

          if (v122)
          {
            sub_1000167B8(CNSocialProfileURLStringKey, v121);
            v123 = [v120 urlString];
            sub_1000166FC(v123, v121);
          }
          v124 = [v120 username];

          if (v124)
          {
            sub_1000167B8(CNSocialProfileUsernameKey, v121);
            v125 = [v120 username];
            sub_1000166FC(v125, v121);
          }
          v126 = [v120 userIdentifier];

          if (v126)
          {
            sub_1000167B8(CNSocialProfileUserIdentifierKey, v121);
            v127 = [v120 userIdentifier];
            sub_1000166FC(v127, v121);
          }
          v128 = [v120 service];

          if (v128)
          {
            sub_1000167B8(CNSocialProfileServiceKey, v121);
            v129 = [v120 service];
            sub_1000167B8(v129, v121);
          }
          v130 = [v120 teamIdentifier];

          if (v130)
          {
            sub_1000167B8(v171, v121);
            v131 = [v120 teamIdentifier];
            sub_1000166FC(v131, v121);
          }
          v132 = [v120 bundleIdentifiers];
          id v133 = [v132 count];

          if (v133)
          {
            uint64_t v134 = v116;
            sub_1000167B8(v170, v121);
            id v135 = [objc_alloc((Class)NSMutableData) initWithCapacity:4096];
            long long v206 = 0u;
            long long v207 = 0u;
            long long v208 = 0u;
            long long v209 = 0u;
            v136 = [v120 bundleIdentifiers];
            id v137 = [v136 countByEnumeratingWithState:&v206 objects:v219 count:16];
            if (v137)
            {
              id v138 = v137;
              uint64_t v139 = *(void *)v207;
              do
              {
                for (ii = 0; ii != v138; ii = (char *)ii + 1)
                {
                  if (*(void *)v207 != v139) {
                    objc_enumerationMutation(v136);
                  }
                  sub_1000166FC(*(void **)(*((void *)&v206 + 1) + 8 * (void)ii), v135);
                }
                id v138 = [v136 countByEnumeratingWithState:&v206 objects:v219 count:16];
              }
              while (v138);
            }

            id v141 = v135;
            if (v141)
            {
              id v142 = v121;
              unsigned int v210 = [v141 length];
              [v142 appendBytes:&v210 length:4];
              [v142 appendData:v141];
            }
            else
            {
              unsigned int v210 = -1;
              [v121 appendBytes:&v210 length:4];
            }
            uint64_t v116 = v134;
            id v115 = v172;
          }
          v143 = [v120 displayname];

          if (v143)
          {
            sub_1000167B8(v169, v121);
            v144 = [v120 displayname];
            sub_1000166FC(v144, v121);
          }
          LOBYTE(v210) = -2;
          [v121 appendBytes:&v210 length:1];
        }

        v117 = (char *)v117 + 1;
      }
      while (v117 != v115);
      id v115 = [obj countByEnumeratingWithState:&v182 objects:v213 count:16];
    }
    while (v115);
  }

  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  v145 = [v168 instantMessageAddresses];
  id v146 = [v145 countByEnumeratingWithState:&v178 objects:v212 count:16];
  if (v146)
  {
    id v147 = v146;
    uint64_t v148 = *(void *)v179;
    do
    {
      for (jj = 0; jj != v147; jj = (char *)jj + 1)
      {
        if (*(void *)v179 != v148) {
          objc_enumerationMutation(v145);
        }
        v150 = *(void **)(*((void *)&v178 + 1) + 8 * (void)jj);
        LOWORD(v219[0]) = -32761;
        [v30 appendBytes:v219 length:2];
        v151 = [v150 label];
        sub_1000167B8(v151, v30);

        id v152 = [v150 value];
        id v153 = v30;
        if (v152)
        {
          v154 = [v152 username];

          if (v154)
          {
            sub_1000167B8(CNInstantMessageAddressUsernameKey, v153);
            v155 = [v152 username];
            sub_1000166FC(v155, v153);
          }
          v156 = [v152 service];

          if (v156)
          {
            sub_1000167B8(CNInstantMessageAddressServiceKey, v153);
            v157 = [v152 service];
            sub_1000167B8(v157, v153);
          }
          LOBYTE(v219[0]) = -2;
          [v153 appendBytes:v219 length:1];
        }
      }
      id v147 = [v145 countByEnumeratingWithState:&v178 objects:v212 count:16];
    }
    while (v147);
  }

  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  v158 = [v168 dates];
  id v159 = [v158 countByEnumeratingWithState:&v174 objects:v211 count:16];
  if (v159)
  {
    id v160 = v159;
    uint64_t v161 = *(void *)v175;
    do
    {
      for (kk = 0; kk != v160; kk = (char *)kk + 1)
      {
        if (*(void *)v175 != v161) {
          objc_enumerationMutation(v158);
        }
        v163 = *(void **)(*((void *)&v174 + 1) + 8 * (void)kk);
        LOWORD(v219[0]) = -32760;
        [v30 appendBytes:v219 length:2];
        v164 = [v163 label];
        sub_1000167B8(v164, v30);

        v165 = [v163 value];
        sub_10001682C(v165, v30);
      }
      id v160 = [v158 countByEnumeratingWithState:&v174 objects:v211 count:16];
    }
    while (v160);
  }

  id v166 = v30;
  return v166;
}

+ (void)load
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DAA4;
  block[3] = &unk_100055820;
  block[4] = a1;
  if (qword_100069D20 != -1) {
    dispatch_once(&qword_100069D20, block);
  }
}

- (id)abs_identifier
{
  v4 = [(CNContact *)self abs_identifier];
  if (!v4)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CNContact+NilTrigger.m" lineNumber:29 description:@"CNContact.identifier gave us nil."];
  }

  return v4;
}

@end