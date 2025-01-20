@interface NPTOLibraryChanges
- (NSArray)deletedAssetCollections;
- (NSArray)deletedAssets;
- (NSArray)insertedAssetCollections;
- (NSArray)insertedAssets;
- (NSArray)updatedAssetCollections;
- (NSArray)updatedAssets;
- (NSMapTable)addedAssetCollectionAssets;
- (NSMapTable)removedAssetCollectionAssets;
- (id)_initWithMasterLibrary:(id)a3 clientLibrary:(id)a4 excludedAssets:(id)a5;
@end

@implementation NPTOLibraryChanges

- (id)_initWithMasterLibrary:(id)a3 clientLibrary:(id)a4 excludedAssets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v185 = a5;
  v227.receiver = self;
  v227.super_class = (Class)NPTOLibraryChanges;
  v11 = [(NPTOLibraryChanges *)&v227 init];
  v12 = v11;
  if (v11)
  {
    id v183 = v10;
    id v184 = v9;
    p_masterLibrary = (id *)&v11->_masterLibrary;
    objc_storeStrong((id *)&v11->_masterLibrary, a3);
    p_clientLibrary = (id *)&v12->_clientLibrary;
    objc_storeStrong((id *)&v12->_clientLibrary, a4);
    p_excludedAssets = (id *)&v12->_excludedAssets;
    objc_storeStrong((id *)&v12->_excludedAssets, a5);
    v13 = +[NSMutableDictionary dictionary];
    v14 = [(NPTOLibrary *)v12->_masterLibrary assets];
    v225[0] = _NSConcreteStackBlock;
    v225[1] = 3221225472;
    v225[2] = sub_100069D94;
    v225[3] = &unk_100093840;
    id v15 = v13;
    id v226 = v15;
    [v14 enumerateObjectsUsingBlock:v225];

    v17 = sub_10005CE44();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v15 allValues];
      id v19 = [v18 count];
      v20 = [v15 allValues];
      v21 = [v15 allValues];
      id v22 = [v21 count];

      if ((unint64_t)v22 >= 0x3E8) {
        uint64_t v23 = 1000;
      }
      else {
        uint64_t v23 = (uint64_t)v22;
      }
      v24 = [v20 subarrayWithRange:0, v23];
      v25 = [v24 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Master assets";
      __int16 v230 = 2048;
      id v231 = v19;
      __int16 v232 = 2112;
      v233 = v25;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);
    }
    v26 = +[NSMutableDictionary dictionary];
    v27 = [*p_clientLibrary assets];
    v223[0] = _NSConcreteStackBlock;
    v223[1] = 3221225472;
    v223[2] = sub_100069E10;
    v223[3] = &unk_100093840;
    id v28 = v26;
    id v224 = v28;
    [v27 enumerateObjectsUsingBlock:v223];

    v30 = sub_10005CE44();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [v28 allValues];
      id v32 = [v31 count];
      v33 = [v28 allValues];
      v34 = [v28 allValues];
      id v35 = [v34 count];

      if ((unint64_t)v35 >= 0x3E8) {
        uint64_t v36 = 1000;
      }
      else {
        uint64_t v36 = (uint64_t)v35;
      }
      v37 = [v33 subarrayWithRange:0, v36];
      v38 = [v37 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Client assets";
      __int16 v230 = 2048;
      id v231 = v32;
      __int16 v232 = 2112;
      v233 = v38;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);
    }
    v39 = +[NSMutableArray array];
    v40 = [*p_clientLibrary assets];
    v220[0] = _NSConcreteStackBlock;
    v220[1] = 3221225472;
    v220[2] = sub_100069E8C;
    v220[3] = &unk_100093868;
    id v177 = v15;
    id v221 = v177;
    id v41 = v39;
    id v222 = v41;
    [v40 enumerateObjectsUsingBlock:v220];

    v43 = sub_10005CE44();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = [v41 count];
      id v45 = [v41 count];
      if ((unint64_t)v45 >= 0x3E8) {
        uint64_t v46 = 1000;
      }
      else {
        uint64_t v46 = (uint64_t)v45;
      }
      v47 = [v41 subarrayWithRange:0, v46];
      v48 = [v47 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Deleted assets";
      __int16 v230 = 2048;
      id v231 = v44;
      __int16 v232 = 2112;
      v233 = v48;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);
    }
    v181 = v41;
    v49 = (NSArray *)[v41 copy];
    deletedAssets = v12->_deletedAssets;
    v12->_deletedAssets = v49;

    v51 = +[NSMutableArray array];
    v52 = [(NPTOLibrary *)v12->_masterLibrary assets];
    v216[0] = _NSConcreteStackBlock;
    v216[1] = 3221225472;
    v216[2] = sub_100069F20;
    v216[3] = &unk_100093890;
    id v53 = v28;
    id v217 = v53;
    v182 = v12;
    v54 = v12;
    v218 = v54;
    id v55 = v51;
    id v219 = v55;
    [v52 enumerateObjectsUsingBlock:v216];

    v57 = sub_10005CE44();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      id v58 = [v55 count];
      id v59 = [v55 count];
      if ((unint64_t)v59 >= 0x3E8) {
        uint64_t v60 = 1000;
      }
      else {
        uint64_t v60 = (uint64_t)v59;
      }
      v61 = [v55 subarrayWithRange:0, v60];
      v62 = [v61 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Updated assets";
      __int16 v230 = 2048;
      id v231 = v58;
      __int16 v232 = 2112;
      v233 = v62;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);
    }
    v63 = (NSArray *)[v55 copy];
    updatedAssets = v54->_updatedAssets;
    v54->_updatedAssets = v63;

    v65 = +[NSMutableArray array];
    v66 = [*p_masterLibrary assets];
    v212[0] = _NSConcreteStackBlock;
    v212[1] = 3221225472;
    v212[2] = sub_10006A010;
    v212[3] = &unk_100093890;
    id v174 = v53;
    id v213 = v174;
    v67 = v54;
    v214 = v67;
    id v68 = v65;
    id v215 = v68;
    [v66 enumerateObjectsUsingBlock:v212];

    v70 = sub_10005CE44();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      id v71 = [v68 count];
      id v72 = [v68 count];
      if ((unint64_t)v72 >= 0x3E8) {
        uint64_t v73 = 1000;
      }
      else {
        uint64_t v73 = (uint64_t)v72;
      }
      v74 = [v68 subarrayWithRange:0, v73];
      v75 = [v74 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Inserted assets";
      __int16 v230 = 2048;
      id v231 = v71;
      __int16 v232 = 2112;
      v233 = v75;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);
    }
    v180 = v55;

    v179 = v68;
    v76 = (NSArray *)[v68 copy];
    insertedAssets = v67->_insertedAssets;
    v67->_insertedAssets = v76;

    v79 = sub_10005CE44();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      v80 = [*p_excludedAssets allObjects];
      id v81 = [v80 count];
      v82 = [*p_excludedAssets allObjects];
      v83 = [*p_excludedAssets allObjects];
      id v84 = [v83 count];

      if ((unint64_t)v84 >= 0x3E8) {
        uint64_t v85 = 1000;
      }
      else {
        uint64_t v85 = (uint64_t)v84;
      }
      v86 = [v82 subarrayWithRange:0, v85];
      v87 = [v86 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Excluded assets";
      __int16 v230 = 2048;
      id v231 = v81;
      __int16 v232 = 2112;
      v233 = v87;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);
    }
    v88 = +[NSMutableDictionary dictionary];
    v89 = [*p_masterLibrary assetCollections];
    v210[0] = _NSConcreteStackBlock;
    v210[1] = 3221225472;
    v210[2] = sub_10006A0B8;
    v210[3] = &unk_1000938B8;
    id v90 = v88;
    id v211 = v90;
    [v89 enumerateObjectsUsingBlock:v210];

    v92 = sub_10005CE44();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      v93 = [v90 allValues];
      id v94 = [v93 count];
      v95 = [v90 allValues];
      v96 = [v90 allValues];
      id v97 = [v96 count];

      if ((unint64_t)v97 >= 0x3E8) {
        uint64_t v98 = 1000;
      }
      else {
        uint64_t v98 = (uint64_t)v97;
      }
      v99 = [v95 subarrayWithRange:0, v98];
      v100 = [v99 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Master asset collections";
      __int16 v230 = 2048;
      id v231 = v94;
      __int16 v232 = 2112;
      v233 = v100;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);
    }
    v101 = +[NSMutableDictionary dictionary];
    v102 = [*p_clientLibrary assetCollections];
    v208[0] = _NSConcreteStackBlock;
    v208[1] = 3221225472;
    v208[2] = sub_10006A134;
    v208[3] = &unk_1000938B8;
    id v103 = v101;
    id v209 = v103;
    [v102 enumerateObjectsUsingBlock:v208];

    v105 = sub_10005CE44();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      v106 = [v103 allValues];
      id v107 = [v106 count];
      v108 = [v103 allValues];
      v109 = [v103 allValues];
      id v110 = [v109 count];

      if ((unint64_t)v110 >= 0x3E8) {
        uint64_t v111 = 1000;
      }
      else {
        uint64_t v111 = (uint64_t)v110;
      }
      v112 = [v108 subarrayWithRange:0, v111];
      v113 = [v112 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Client asset collections";
      __int16 v230 = 2048;
      id v231 = v107;
      __int16 v232 = 2112;
      v233 = v113;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);
    }
    v114 = +[NSMutableArray array];
    v115 = [*p_clientLibrary assetCollections];
    v205[0] = _NSConcreteStackBlock;
    v205[1] = 3221225472;
    v205[2] = sub_10006A1B0;
    v205[3] = &unk_1000938E0;
    id v187 = v90;
    id v206 = v187;
    id v116 = v114;
    id v207 = v116;
    [v115 enumerateObjectsUsingBlock:v205];

    v118 = sub_10005CE44();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      id v119 = [v116 count];
      id v120 = [v116 count];
      if ((unint64_t)v120 >= 0x3E8) {
        uint64_t v121 = 1000;
      }
      else {
        uint64_t v121 = (uint64_t)v120;
      }
      v122 = [v116 subarrayWithRange:0, v121];
      v123 = [v122 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Deleted asset collections";
      __int16 v230 = 2048;
      id v231 = v119;
      __int16 v232 = 2112;
      v233 = v123;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);
    }
    v173 = v116;
    v124 = (NSArray *)[v116 copy];
    deletedAssetCollections = v67->_deletedAssetCollections;
    v67->_deletedAssetCollections = v124;

    v126 = +[NSMapTable strongToStrongObjectsMapTable];
    v127 = +[NSMapTable strongToStrongObjectsMapTable];
    v128 = +[NSMutableArray array];
    v129 = [*p_masterLibrary assetCollections];
    v197[0] = _NSConcreteStackBlock;
    v197[1] = 3221225472;
    v197[2] = sub_10006A244;
    v197[3] = &unk_100093908;
    id v130 = v103;
    id v198 = v130;
    v131 = v67;
    v199 = v131;
    id v132 = v174;
    id v200 = v132;
    id v133 = v177;
    id v201 = v133;
    id v134 = v128;
    id v202 = v134;
    v178 = v126;
    v203 = v178;
    id v135 = v127;
    id v204 = v135;
    [v129 enumerateObjectsUsingBlock:v197];

    v137 = sub_10005CE44();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      id v138 = [v134 count];
      id v139 = [v134 count];
      if ((unint64_t)v139 >= 0x3E8) {
        uint64_t v140 = 1000;
      }
      else {
        uint64_t v140 = (uint64_t)v139;
      }
      [v134 subarrayWithRange:0, v140];
      id v175 = v135;
      id v141 = v130;
      id v142 = v133;
      id v143 = v132;
      v145 = id v144 = v134;
      v146 = [v145 valueForKeyPath:@"uuidData.npto_uuid"];
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Updated asset collections";
      __int16 v230 = 2048;
      id v231 = v138;
      __int16 v232 = 2112;
      v233 = v146;
      _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);

      id v134 = v144;
      id v132 = v143;
      id v133 = v142;
      id v130 = v141;
      id v135 = v175;
    }
    v147 = (NSArray *)[v134 copy];
    updatedAssetCollections = v131->_updatedAssetCollections;
    v131->_updatedAssetCollections = v147;

    v149 = +[NSMutableArray array];
    v150 = [*p_masterLibrary assetCollections];
    v190[0] = _NSConcreteStackBlock;
    v190[1] = 3221225472;
    v190[2] = sub_10006A660;
    v190[3] = &unk_100093930;
    id v189 = v130;
    id v191 = v189;
    id v151 = v149;
    id v192 = v151;
    v152 = v131;
    v193 = v152;
    id v153 = v132;
    id v194 = v153;
    id v154 = v133;
    id v195 = v154;
    v155 = (NSMapTable *)v135;
    v196 = v155;
    [v150 enumerateObjectsUsingBlock:v190];

    v157 = sub_10005CE44();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
    {
      id v158 = [v151 count];
      id v159 = [v151 count];
      if ((unint64_t)v159 >= 0x3E8) {
        uint64_t v160 = 1000;
      }
      else {
        uint64_t v160 = (uint64_t)v159;
      }
      v161 = [v151 subarrayWithRange:0, v160];
      [v161 valueForKeyPath:@"uuidData.npto_uuid"];
      id v176 = v153;
      id v162 = v154;
      v164 = id v163 = v134;
      *(_DWORD *)buf = 138412802;
      CFStringRef v229 = @"Inserted asset collections";
      __int16 v230 = 2048;
      id v231 = v158;
      __int16 v232 = 2112;
      v233 = v164;
      _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_DEFAULT, "%@ (%lu):\n%@", buf, 0x20u);

      id v134 = v163;
      id v154 = v162;
      id v153 = v176;
    }

    v165 = (NSArray *)[v151 copy];
    insertedAssetCollections = v152->_insertedAssetCollections;
    v152->_insertedAssetCollections = v165;

    removedAssetCollectionAssets = v152->_removedAssetCollectionAssets;
    v152->_removedAssetCollectionAssets = v178;
    v168 = v178;

    addedAssetCollectionAssets = v152->_addedAssetCollectionAssets;
    v152->_addedAssetCollectionAssets = v155;
    v170 = v155;

    id v10 = v183;
    id v9 = v184;
    v12 = v182;
  }

  return v12;
}

- (NSArray)deletedAssets
{
  return self->_deletedAssets;
}

- (NSArray)updatedAssets
{
  return self->_updatedAssets;
}

- (NSArray)insertedAssets
{
  return self->_insertedAssets;
}

- (NSArray)deletedAssetCollections
{
  return self->_deletedAssetCollections;
}

- (NSArray)updatedAssetCollections
{
  return self->_updatedAssetCollections;
}

- (NSArray)insertedAssetCollections
{
  return self->_insertedAssetCollections;
}

- (NSMapTable)removedAssetCollectionAssets
{
  return self->_removedAssetCollectionAssets;
}

- (NSMapTable)addedAssetCollectionAssets
{
  return self->_addedAssetCollectionAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedAssetCollectionAssets, 0);
  objc_storeStrong((id *)&self->_removedAssetCollectionAssets, 0);
  objc_storeStrong((id *)&self->_insertedAssetCollections, 0);
  objc_storeStrong((id *)&self->_updatedAssetCollections, 0);
  objc_storeStrong((id *)&self->_deletedAssetCollections, 0);
  objc_storeStrong((id *)&self->_insertedAssets, 0);
  objc_storeStrong((id *)&self->_updatedAssets, 0);
  objc_storeStrong((id *)&self->_deletedAssets, 0);
  objc_storeStrong((id *)&self->_excludedAssets, 0);
  objc_storeStrong((id *)&self->_clientLibrary, 0);

  objc_storeStrong((id *)&self->_masterLibrary, 0);
}

@end