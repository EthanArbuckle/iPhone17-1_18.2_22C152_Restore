@interface AEAConcreteNetworkPrimitives
- (id)machOUUIDsForBundleIdentifier:(id)a3;
- (id)machOUUIDsForExecutableURL:(id)a3;
- (id)restrictNetworkExcludingProcessesWithIdentifiers:(id)a3 machOUUIDs:(id)a4;
- (void)clearUUIDCache;
- (void)fetchNetworkContentFilterBundleIdentifiersWithCompletion:(id)a3;
@end

@implementation AEAConcreteNetworkPrimitives

- (void)clearUUIDCache
{
}

- (void)fetchNetworkContentFilterBundleIdentifiersWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000029C8;
  v4[3] = &unk_10009DE78;
  id v5 = a3;
  id v3 = v5;
  +[NEFilterManager loadAllFromPreferencesWithCompletionHandler:v4];
}

- (id)machOUUIDsForExecutableURL:(id)a3
{
  id v3 = [a3 path];
  id v4 = +[NEProcessInfo copyUUIDsForExecutable:v3];

  return v4;
}

- (id)machOUUIDsForBundleIdentifier:(id)a3
{
  id v3 = +[NEProcessInfo copyUUIDsForBundleID:a3 uid:0];

  return v3;
}

- (id)restrictNetworkExcludingProcessesWithIdentifiers:(id)a3 machOUUIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v168 = objc_opt_new();
  long long v205 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v205 objects:v231 count:16];
  if (v7)
  {
    id v8 = v7;
    id v165 = v6;
    uint64_t v9 = *(void *)v206;
    uint64_t v10 = 10;
    do
    {
      v11 = 0;
      uint64_t v12 = v10;
      do
      {
        if (*(void *)v206 != v9) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v205 + 1) + 8 * (void)v11);
        id v14 = objc_alloc((Class)NEPolicy);
        v15 = +[NEPolicyResult skipWithOrder:0];
        v16 = +[NEPolicyCondition allInterfaces];
        v230[0] = v16;
        v17 = +[NEPolicyCondition effectivePID:](NEPolicyCondition, "effectivePID:", [v13 intValue]);
        v230[1] = v17;
        v18 = +[NSArray arrayWithObjects:v230 count:2];
        id v19 = [v14 initWithOrder:(char *)v11 + v12 result:v15 conditions:v18];

        [v168 addPolicy:v19];
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v205 objects:v231 count:16];
      uint64_t v10 = (v12 + v11);
    }
    while (v8);
    uint64_t v20 = (v12 + v11);
    id v6 = v165;
  }
  else
  {
    uint64_t v20 = 10;
  }

  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  id v166 = v6;
  id v21 = [v166 countByEnumeratingWithState:&v201 objects:v229 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v202;
    do
    {
      v24 = 0;
      uint64_t v25 = v20;
      do
      {
        if (*(void *)v202 != v23) {
          objc_enumerationMutation(v166);
        }
        uint64_t v26 = *(void *)(*((void *)&v201 + 1) + 8 * (void)v24);
        id v27 = objc_alloc((Class)NEPolicy);
        v28 = +[NEPolicyResult skipWithOrder:0];
        v29 = +[NEPolicyCondition allInterfaces];
        v228[0] = v29;
        v30 = +[NEPolicyCondition effectiveApplication:v26];
        v228[1] = v30;
        v31 = +[NSArray arrayWithObjects:v228 count:2];
        id v32 = [v27 initWithOrder:(char *)v24 + v25 result:v28 conditions:v31];

        [v168 addPolicy:v32];
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v166 countByEnumeratingWithState:&v201 objects:v229 count:16];
      LODWORD(v20) = v25 + v24;
    }
    while (v22);
    uint64_t v20 = (v25 + v24);
  }

  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id v164 = +[NEProcessInfo copyUUIDsForBundleID:@"com.apple.mDNSResponder" uid:0];
  id v33 = [v164 countByEnumeratingWithState:&v197 objects:v227 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v198;
    do
    {
      v36 = 0;
      uint64_t v37 = v20;
      do
      {
        if (*(void *)v198 != v35) {
          objc_enumerationMutation(v164);
        }
        uint64_t v38 = *(void *)(*((void *)&v197 + 1) + 8 * (void)v36);
        id v39 = objc_alloc((Class)NEPolicy);
        v40 = +[NEPolicyResult skipWithOrder:0];
        v41 = +[NEPolicyCondition allInterfaces];
        v226[0] = v41;
        v42 = +[NEPolicyCondition effectiveApplication:v38];
        v226[1] = v42;
        v43 = +[NSArray arrayWithObjects:v226 count:2];
        id v44 = [v39 initWithOrder:(char *)v36 + v37 result:v40 conditions:v43];

        [v168 addPolicy:v44];
        v36 = (char *)v36 + 1;
      }
      while (v34 != v36);
      id v34 = [v164 countByEnumeratingWithState:&v197 objects:v227 count:16];
      LODWORD(v20) = v37 + v36;
    }
    while (v34);
    uint64_t v20 = (v37 + v36);
  }

  uint64_t v45 = +[NWAddressEndpoint endpointWithHostname:@"0.0.0.0" port:@"53"];
  v155 = +[NWAddressEndpoint endpointWithHostname:@"::" port:@"53"];
  id v46 = objc_alloc((Class)NEPolicy);
  unsigned int v162 = v20 + 1;
  v47 = +[NEPolicyResult skipWithOrder:0];
  v48 = +[NEPolicyCondition allInterfaces];
  v225[0] = v48;
  v154 = (void *)v45;
  v49 = +[NEPolicyCondition remoteAddress:v45 prefix:0];
  v225[1] = v49;
  v50 = +[NEPolicyCondition ipProtocol:17];
  v225[2] = v50;
  v51 = +[NSArray arrayWithObjects:v225 count:3];
  id v52 = [v46 initWithOrder:v20 result:v47 conditions:v51];

  id v53 = objc_alloc((Class)NEPolicy);
  uint64_t v54 = (v20 + 2);
  v55 = +[NEPolicyResult skipWithOrder:0];
  v56 = +[NEPolicyCondition allInterfaces];
  v224[0] = v56;
  v57 = +[NEPolicyCondition remoteAddress:v155 prefix:0];
  v224[1] = v57;
  v58 = +[NEPolicyCondition ipProtocol:17];
  v224[2] = v58;
  v59 = +[NSArray arrayWithObjects:v224 count:3];
  id v60 = [v53 initWithOrder:v162 result:v55 conditions:v59];

  v153 = v52;
  [v168 addPolicy:v52];
  v152 = v60;
  [v168 addPolicy:v60];
  long long v193 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  id v163 = +[NEProcessInfo copyUUIDsForBundleID:@"com.apple.configd" uid:0];
  id v61 = [v163 countByEnumeratingWithState:&v193 objects:v223 count:16];
  if (v61)
  {
    id v62 = v61;
    uint64_t v63 = *(void *)v194;
    do
    {
      v64 = 0;
      uint64_t v65 = v54;
      do
      {
        if (*(void *)v194 != v63) {
          objc_enumerationMutation(v163);
        }
        uint64_t v66 = *(void *)(*((void *)&v193 + 1) + 8 * (void)v64);
        id v67 = objc_alloc((Class)NEPolicy);
        v68 = +[NEPolicyResult skipWithOrder:0];
        v69 = +[NEPolicyCondition allInterfaces];
        v222[0] = v69;
        v70 = +[NEPolicyCondition effectiveApplication:v66];
        v222[1] = v70;
        v71 = +[NSArray arrayWithObjects:v222 count:2];
        id v72 = [v67 initWithOrder:(char *)v64 + v65 result:v68 conditions:v71];

        [v168 addPolicy:v72];
        v64 = (char *)v64 + 1;
      }
      while (v62 != v64);
      id v62 = [v163 countByEnumeratingWithState:&v193 objects:v223 count:16];
      LODWORD(v54) = v65 + v64;
    }
    while (v62);
    uint64_t v54 = (v65 + v64);
  }

  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  id v161 = +[NEProcessInfo copyUUIDsForExecutable:@"/usr/libexec/mdmd"];
  id v73 = [v161 countByEnumeratingWithState:&v189 objects:v221 count:16];
  if (v73)
  {
    id v74 = v73;
    uint64_t v75 = *(void *)v190;
    do
    {
      v76 = 0;
      uint64_t v77 = v54;
      do
      {
        if (*(void *)v190 != v75) {
          objc_enumerationMutation(v161);
        }
        uint64_t v78 = *(void *)(*((void *)&v189 + 1) + 8 * (void)v76);
        id v79 = objc_alloc((Class)NEPolicy);
        v80 = +[NEPolicyResult skipWithOrder:0];
        v81 = +[NEPolicyCondition allInterfaces];
        v220[0] = v81;
        v82 = +[NEPolicyCondition effectiveApplication:v78];
        v220[1] = v82;
        v83 = +[NSArray arrayWithObjects:v220 count:2];
        id v84 = [v79 initWithOrder:(char *)v76 + v77 result:v80 conditions:v83];

        [v168 addPolicy:v84];
        v76 = (char *)v76 + 1;
      }
      while (v74 != v76);
      id v74 = [v161 countByEnumeratingWithState:&v189 objects:v221 count:16];
      LODWORD(v54) = v77 + v76;
    }
    while (v74);
    uint64_t v54 = (v77 + v76);
  }

  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  id v160 = +[NEProcessInfo copyUUIDsForExecutable:@"/usr/libexec/mdmuserd"];
  id v85 = [v160 countByEnumeratingWithState:&v185 objects:v219 count:16];
  if (v85)
  {
    id v86 = v85;
    uint64_t v87 = *(void *)v186;
    do
    {
      v88 = 0;
      uint64_t v89 = v54;
      do
      {
        if (*(void *)v186 != v87) {
          objc_enumerationMutation(v160);
        }
        uint64_t v90 = *(void *)(*((void *)&v185 + 1) + 8 * (void)v88);
        id v91 = objc_alloc((Class)NEPolicy);
        v92 = +[NEPolicyResult skipWithOrder:0];
        v93 = +[NEPolicyCondition allInterfaces];
        v218[0] = v93;
        v94 = +[NEPolicyCondition effectiveApplication:v90];
        v218[1] = v94;
        v95 = +[NSArray arrayWithObjects:v218 count:2];
        id v96 = [v91 initWithOrder:(char *)v88 + v89 result:v92 conditions:v95];

        [v168 addPolicy:v96];
        v88 = (char *)v88 + 1;
      }
      while (v86 != v88);
      id v86 = [v160 countByEnumeratingWithState:&v185 objects:v219 count:16];
      LODWORD(v54) = v89 + v88;
    }
    while (v86);
    uint64_t v54 = (v89 + v88);
  }

  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id v159 = +[NEProcessInfo copyUUIDsForBundleID:@"com.apple.apsd" uid:0];
  id v97 = [v159 countByEnumeratingWithState:&v181 objects:v217 count:16];
  if (v97)
  {
    id v98 = v97;
    uint64_t v99 = *(void *)v182;
    do
    {
      v100 = 0;
      uint64_t v101 = v54;
      do
      {
        if (*(void *)v182 != v99) {
          objc_enumerationMutation(v159);
        }
        uint64_t v102 = *(void *)(*((void *)&v181 + 1) + 8 * (void)v100);
        id v103 = objc_alloc((Class)NEPolicy);
        v104 = +[NEPolicyResult skipWithOrder:0];
        v105 = +[NEPolicyCondition allInterfaces];
        v216[0] = v105;
        v106 = +[NEPolicyCondition effectiveApplication:v102];
        v216[1] = v106;
        v107 = +[NSArray arrayWithObjects:v216 count:2];
        id v108 = [v103 initWithOrder:(char *)v100 + v101 result:v104 conditions:v107];

        [v168 addPolicy:v108];
        v100 = (char *)v100 + 1;
      }
      while (v98 != v100);
      id v98 = [v159 countByEnumeratingWithState:&v181 objects:v217 count:16];
      LODWORD(v54) = v101 + v100;
    }
    while (v98);
    uint64_t v54 = (v101 + v100);
  }

  long long v177 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  id v158 = +[NEProcessInfo copyUUIDsForBundleID:@"com.apple.WebKit.Networking" uid:0];
  id v109 = [v158 countByEnumeratingWithState:&v177 objects:v215 count:16];
  if (v109)
  {
    id v110 = v109;
    uint64_t v111 = *(void *)v178;
    do
    {
      v112 = 0;
      uint64_t v113 = v54;
      do
      {
        if (*(void *)v178 != v111) {
          objc_enumerationMutation(v158);
        }
        uint64_t v114 = *(void *)(*((void *)&v177 + 1) + 8 * (void)v112);
        id v115 = objc_alloc((Class)NEPolicy);
        v116 = +[NEPolicyResult skipWithOrder:0];
        v117 = +[NEPolicyCondition allInterfaces];
        v214[0] = v117;
        v118 = +[NEPolicyCondition effectiveApplication:v114];
        v214[1] = v118;
        v119 = +[NSArray arrayWithObjects:v214 count:2];
        id v120 = [v115 initWithOrder:(char *)v112 + v113 result:v116 conditions:v119];

        [v168 addPolicy:v120];
        v112 = (char *)v112 + 1;
      }
      while (v110 != v112);
      id v110 = [v158 countByEnumeratingWithState:&v177 objects:v215 count:16];
      LODWORD(v54) = v113 + v112;
    }
    while (v110);
    uint64_t v54 = (v113 + v112);
  }

  long long v173 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  id v157 = +[NEProcessInfo copyUUIDsForExecutable:@"/System/Library/PrivateFrameworks/WebContentAnalysis.framework/Versions/A/Resources/webfilterDNSd"];
  id v121 = [v157 countByEnumeratingWithState:&v173 objects:v213 count:16];
  if (v121)
  {
    id v122 = v121;
    uint64_t v123 = *(void *)v174;
    do
    {
      v124 = 0;
      uint64_t v125 = v54;
      do
      {
        if (*(void *)v174 != v123) {
          objc_enumerationMutation(v157);
        }
        uint64_t v126 = *(void *)(*((void *)&v173 + 1) + 8 * (void)v124);
        id v127 = objc_alloc((Class)NEPolicy);
        v128 = +[NEPolicyResult skipWithOrder:0];
        v129 = +[NEPolicyCondition allInterfaces];
        v212[0] = v129;
        v130 = +[NEPolicyCondition effectiveApplication:v126];
        v212[1] = v130;
        v131 = +[NSArray arrayWithObjects:v212 count:2];
        id v132 = [v127 initWithOrder:(char *)v124 + v125 result:v128 conditions:v131];

        [v168 addPolicy:v132];
        v124 = (char *)v124 + 1;
      }
      while (v122 != v124);
      id v122 = [v157 countByEnumeratingWithState:&v173 objects:v213 count:16];
      LODWORD(v54) = v125 + v124;
    }
    while (v122);
    uint64_t v54 = (v125 + v124);
  }

  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id v156 = +[NEProcessInfo copyUUIDsForExecutable:@"/System/Library/PrivateFrameworks/WebContentAnalysis.framework/Versions/A/Resources/webfilterproxyd"];
  id v133 = [v156 countByEnumeratingWithState:&v169 objects:v211 count:16];
  if (v133)
  {
    id v134 = v133;
    uint64_t v135 = *(void *)v170;
    do
    {
      v136 = 0;
      uint64_t v137 = v54;
      do
      {
        if (*(void *)v170 != v135) {
          objc_enumerationMutation(v156);
        }
        uint64_t v138 = *(void *)(*((void *)&v169 + 1) + 8 * (void)v136);
        id v139 = objc_alloc((Class)NEPolicy);
        v140 = +[NEPolicyResult skipWithOrder:0];
        v141 = +[NEPolicyCondition allInterfaces];
        v210[0] = v141;
        v142 = +[NEPolicyCondition effectiveApplication:v138];
        v210[1] = v142;
        v143 = +[NSArray arrayWithObjects:v210 count:2];
        id v144 = [v139 initWithOrder:(char *)v136 + v137 result:v140 conditions:v143];

        [v168 addPolicy:v144];
        v136 = (char *)v136 + 1;
      }
      while (v134 != v136);
      id v134 = [v156 countByEnumeratingWithState:&v169 objects:v211 count:16];
      LODWORD(v54) = v137 + v136;
    }
    while (v134);
    uint64_t v54 = (v137 + v136);
  }

  id v145 = objc_alloc((Class)NEPolicy);
  v146 = +[NEPolicyResult drop];
  v147 = +[NEPolicyCondition allInterfaces];
  v209 = v147;
  v148 = +[NSArray arrayWithObjects:&v209 count:1];
  id v149 = [v145 initWithOrder:v54 result:v146 conditions:v148];
  [v168 addPolicy:v149];

  if ([v168 apply]) {
    v150 = sub_1000040E4((id *)[AEAConcreteRestrictedNetworkToken alloc], v168);
  }
  else {
    v150 = 0;
  }

  return v150;
}

@end