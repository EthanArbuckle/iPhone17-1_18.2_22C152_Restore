@interface PGGraphSpecification
- (Class)edgeClassWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (Class)nodeClassWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (PGGraphSpecification)init;
- (id)edgeClassByDomain;
- (id)edgeClassByDomainAndLabel;
- (id)nodeClassByDomain;
- (id)nodeClassByDomainAndLabel;
- (void)enumerateEdgeClassesUsingBlock:(id)a3;
- (void)enumerateNodeClassesUsingBlock:(id)a3;
@end

@implementation PGGraphSpecification

- (void)enumerateEdgeClassesUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PGGraphSpecification *)self edgeClassByDomainAndLabel];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke;
  v11[3] = &unk_1E68E5D20;
  id v6 = v4;
  id v12 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  v7 = [(PGGraphSpecification *)self edgeClassByDomain];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke_3;
  v9[3] = &unk_1E68E5D48;
  id v10 = v6;
  id v8 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke_2;
  v8[3] = &unk_1E68E5CF8;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned __int16 v5 = [a2 unsignedIntegerValue];
  id v6 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v4 + 16);
  return v6(v4, 0, v5, a3);
}

void __55__PGGraphSpecification_enumerateEdgeClassesUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int16 v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  (*(void (**)(uint64_t, id, void, uint64_t))(v4 + 16))(v4, v6, (unsigned __int16)[v5 unsignedIntegerValue], a3);
}

- (Class)edgeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (!v6) {
    goto LABEL_3;
  }
  id v7 = [(PGGraphSpecification *)self edgeClassByDomainAndLabel];
  id v8 = [NSNumber numberWithUnsignedShort:v4];
  id v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = (objc_class *)[v9 objectForKeyedSubscript:v6];

  if (!v10)
  {
LABEL_3:
    v11 = [(PGGraphSpecification *)self edgeClassByDomain];
    id v12 = [NSNumber numberWithUnsignedShort:v4];
    id v10 = (objc_class *)[v11 objectForKeyedSubscript:v12];

    if (!v10) {
      id v10 = [(MAGraphSpecification *)self defaultEdgeClass];
    }
  }
  v13 = v10;

  return v13;
}

- (id)edgeClassByDomain
{
  if (edgeClassByDomain_onceToken != -1) {
    dispatch_once(&edgeClassByDomain_onceToken, &__block_literal_global_361);
  }
  v2 = (void *)edgeClassByDomain_edgeClassByDomain;
  return v2;
}

void __41__PGGraphSpecification_edgeClassByDomain__block_invoke()
{
  v0 = (void *)edgeClassByDomain_edgeClassByDomain;
  edgeClassByDomain_edgeClassByDomain = MEMORY[0x1E4F1CC08];
}

- (id)edgeClassByDomainAndLabel
{
  if (edgeClassByDomainAndLabel_onceToken != -1) {
    dispatch_once(&edgeClassByDomainAndLabel_onceToken, &__block_literal_global_293);
  }
  v2 = (void *)edgeClassByDomainAndLabel_edgeClassByDomainAndLabel;
  return v2;
}

void __49__PGGraphSpecification_edgeClassByDomainAndLabel__block_invoke()
{
  v139[34] = *MEMORY[0x1E4F143B8];
  v69 = [NSNumber numberWithUnsignedShort:501];
  v138[0] = v69;
  v136 = @"POI";
  uint64_t v137 = objc_opt_class();
  v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
  v139[0] = v68;
  v67 = [NSNumber numberWithUnsignedShort:502];
  v138[1] = v67;
  v134 = @"ROI";
  uint64_t v135 = objc_opt_class();
  v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
  v139[1] = v66;
  v65 = [NSNumber numberWithUnsignedShort:700];
  v138[2] = v65;
  v132[0] = @"MEANING";
  v133[0] = objc_opt_class();
  v132[1] = @"SUBMEANING_OF";
  v133[1] = objc_opt_class();
  v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:v132 count:2];
  v139[2] = v64;
  v63 = [NSNumber numberWithUnsignedShort:702];
  v138[3] = v63;
  v130 = @"MEANING";
  uint64_t v131 = objc_opt_class();
  v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
  v139[3] = v62;
  v61 = [NSNumber numberWithUnsignedShort:701];
  v138[4] = v61;
  v128 = @"PERSON_ACTIVITY_MEANING";
  uint64_t v129 = objc_opt_class();
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
  v139[4] = v60;
  v59 = [NSNumber numberWithUnsignedShort:101];
  v138[5] = v59;
  v126 = @"NEXT";
  uint64_t v127 = objc_opt_class();
  v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
  v139[5] = v58;
  v57 = [NSNumber numberWithUnsignedShort:102];
  v138[6] = v57;
  v124[0] = @"CONTAINS";
  v125[0] = objc_opt_class();
  v124[1] = @"GROUP_CONTAINS";
  v125[1] = objc_opt_class();
  v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:2];
  v139[6] = v56;
  v55 = [NSNumber numberWithUnsignedShort:103];
  v138[7] = v55;
  v122 = @"HAS_TYPE";
  uint64_t v123 = objc_opt_class();
  v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
  v139[7] = v54;
  v53 = [NSNumber numberWithUnsignedShort:300];
  v138[8] = v53;
  v120[0] = @"PRESENT";
  v121[0] = objc_opt_class();
  v120[1] = @"CPRESENT";
  v121[1] = objc_opt_class();
  v120[2] = @"PARTNER";
  v121[2] = objc_opt_class();
  v120[3] = @"FATHER";
  v121[3] = objc_opt_class();
  v120[4] = @"MOTHER";
  v121[4] = objc_opt_class();
  v120[5] = @"BROTHER";
  v121[5] = objc_opt_class();
  v120[6] = @"SISTER";
  v121[6] = objc_opt_class();
  v120[7] = @"DAUGHTER";
  v121[7] = objc_opt_class();
  v120[8] = @"SON";
  v121[8] = objc_opt_class();
  v120[9] = @"PARENT";
  v121[9] = objc_opt_class();
  v120[10] = @"FAMILY";
  v121[10] = objc_opt_class();
  v120[11] = @"FAMILY_SOCIALGROUP";
  v121[11] = objc_opt_class();
  v120[12] = @"CHILD";
  v121[12] = objc_opt_class();
  v120[13] = @"FRIEND";
  v121[13] = objc_opt_class();
  v120[14] = @"COWORKER";
  v121[14] = objc_opt_class();
  v120[15] = @"COWORKER_SOCIALGROUP";
  v121[15] = objc_opt_class();
  v120[16] = @"ACQUAINTANCE";
  v121[16] = objc_opt_class();
  v120[17] = @"VIP";
  v121[17] = objc_opt_class();
  v120[18] = @"AUTHOR";
  v121[18] = objc_opt_class();
  v120[19] = @"IN_PROXIMITY";
  v121[19] = objc_opt_class();
  v120[20] = @"IS_AROUND";
  v121[20] = objc_opt_class();
  v120[21] = @"INFERRED_TO";
  v121[21] = objc_opt_class();
  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:22];
  v139[8] = v52;
  v51 = [NSNumber numberWithUnsignedShort:306];
  v138[9] = v51;
  v118[0] = @"PARTNER";
  v119[0] = objc_opt_class();
  v118[1] = @"FATHER";
  v119[1] = objc_opt_class();
  v118[2] = @"MOTHER";
  v119[2] = objc_opt_class();
  v118[3] = @"BROTHER";
  v119[3] = objc_opt_class();
  v118[4] = @"SISTER";
  v119[4] = objc_opt_class();
  v118[5] = @"DAUGHTER";
  v119[5] = objc_opt_class();
  v118[6] = @"SON";
  v119[6] = objc_opt_class();
  v118[7] = @"PARENT";
  v119[7] = objc_opt_class();
  v118[8] = @"FAMILY";
  v119[8] = objc_opt_class();
  v118[9] = @"FAMILY_SOCIALGROUP";
  v119[9] = objc_opt_class();
  v118[10] = @"CHILD";
  v119[10] = objc_opt_class();
  v118[11] = @"FRIEND";
  v119[11] = objc_opt_class();
  v118[12] = @"COWORKER";
  v119[12] = objc_opt_class();
  v118[13] = @"COWORKER_SOCIALGROUP";
  v119[13] = objc_opt_class();
  v118[14] = @"ACQUAINTANCE";
  v119[14] = objc_opt_class();
  v118[15] = @"VIP";
  v119[15] = objc_opt_class();
  v118[16] = @"HOUSEHOLD_MEMBER";
  v119[16] = objc_opt_class();
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:17];
  v139[9] = v50;
  v49 = [NSNumber numberWithUnsignedShort:301];
  v138[10] = v49;
  v116[0] = @"BIRTHDAY";
  v117[0] = objc_opt_class();
  v116[1] = @"ANNIVERSARY";
  v117[1] = objc_opt_class();
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:2];
  v139[10] = v48;
  v47 = [NSNumber numberWithUnsignedShort:302];
  v138[11] = v47;
  v114[0] = @"SOCIALGROUP";
  v115[0] = objc_opt_class();
  v114[1] = @"BELONGSTO";
  v115[1] = objc_opt_class();
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:2];
  v139[11] = v46;
  v45 = [NSNumber numberWithUnsignedShort:304];
  v138[12] = v45;
  v112[0] = @"PET_IS_PRESENT";
  v113[0] = objc_opt_class();
  v112[1] = @"IS_OWNER_OF";
  v113[1] = objc_opt_class();
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:2];
  v139[12] = v44;
  v43 = [NSNumber numberWithUnsignedShort:305];
  v138[13] = v43;
  v110 = @"RELATIONSHIP_TAG";
  uint64_t v111 = objc_opt_class();
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
  v139[13] = v42;
  v41 = [NSNumber numberWithUnsignedShort:600];
  v138[14] = v41;
  v108 = @"SCENE";
  uint64_t v109 = objc_opt_class();
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
  v139[14] = v40;
  v39 = [NSNumber numberWithUnsignedShort:602];
  v138[15] = v39;
  v106 = @"VISUAL_LOOKUP_SCENE";
  uint64_t v107 = objc_opt_class();
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
  v139[15] = v38;
  v37 = [NSNumber numberWithUnsignedShort:603];
  v138[16] = v37;
  v104 = @"SCENE";
  uint64_t v105 = objc_opt_class();
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
  v139[16] = v36;
  v35 = [NSNumber numberWithUnsignedShort:200];
  v138[17] = v35;
  v102[0] = @"ADDRESS";
  v103[0] = objc_opt_class();
  v102[1] = @"REMOTE_ADDRESS";
  v103[1] = objc_opt_class();
  v102[2] = @"NUMBER";
  v103[2] = objc_opt_class();
  v102[3] = @"STREET";
  v103[3] = objc_opt_class();
  v102[4] = @"DISTRICT";
  v103[4] = objc_opt_class();
  v102[5] = @"CITY";
  v103[5] = objc_opt_class();
  v102[6] = @"COUNTY";
  v103[6] = objc_opt_class();
  v102[7] = @"STATE";
  v103[7] = objc_opt_class();
  v102[8] = @"COUNTRY";
  v103[8] = objc_opt_class();
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:9];
  v139[17] = v34;
  v33 = [NSNumber numberWithUnsignedShort:201];
  v138[18] = v33;
  v100 = @"AREA";
  uint64_t v101 = objc_opt_class();
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
  v139[18] = v32;
  v31 = [NSNumber numberWithUnsignedShort:202];
  v138[19] = v31;
  v98[0] = @"IS_OWNED_BY";
  v99[0] = objc_opt_class();
  v98[1] = @"IS_HOME_WORK";
  v99[1] = objc_opt_class();
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:2];
  v139[19] = v30;
  v29 = [NSNumber numberWithUnsignedShort:203];
  v138[20] = v29;
  v96 = @"MOBILITY";
  uint64_t v97 = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
  v139[20] = v28;
  v27 = [NSNumber numberWithUnsignedShort:204];
  v138[21] = v27;
  v94[0] = @"AT";
  v95[0] = objc_opt_class();
  v94[1] = @"IN";
  v95[1] = objc_opt_class();
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
  v139[21] = v26;
  v25 = [NSNumber numberWithUnsignedShort:205];
  v138[22] = v25;
  v92 = @"POPULAR_LANGUAGE";
  uint64_t v93 = objc_opt_class();
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
  v139[22] = v24;
  v23 = [NSNumber numberWithUnsignedShort:503];
  v138[23] = v23;
  v90 = @"BUSINESS";
  uint64_t v91 = objc_opt_class();
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
  v139[23] = v22;
  v21 = [NSNumber numberWithUnsignedShort:303];
  v138[24] = v21;
  v88 = @"PEOPLE_CONTACT_SUGGESTION";
  uint64_t v89 = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
  v139[24] = v20;
  v19 = [NSNumber numberWithUnsignedShort:400];
  v138[25] = v19;
  v86[0] = @"DAY";
  v87[0] = objc_opt_class();
  v86[1] = @"MONTH";
  v87[1] = objc_opt_class();
  v86[2] = @"MONTH_DAY";
  v87[2] = objc_opt_class();
  v86[3] = @"YEAR";
  v87[3] = objc_opt_class();
  v86[4] = @"WEEKMONTH";
  v87[4] = objc_opt_class();
  v86[5] = @"WEEKYEAR";
  v87[5] = objc_opt_class();
  v86[6] = @"SEASON";
  v87[6] = objc_opt_class();
  v86[7] = @"DATE";
  v87[7] = objc_opt_class();
  v86[8] = @"PARTOFWEEK";
  v87[8] = objc_opt_class();
  v86[9] = @"DAYOFWEEK";
  v87[9] = objc_opt_class();
  v86[10] = @"PARTOFDAY";
  v87[10] = objc_opt_class();
  v86[11] = @"BDAY_MONTH_DAY";
  v87[11] = objc_opt_class();
  v86[12] = @"ANNIVERSARY_MONTH_DAY";
  v87[12] = objc_opt_class();
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:13];
  v139[25] = v18;
  v17 = [NSNumber numberWithUnsignedShort:401];
  v138[26] = v17;
  v84[0] = @"HOLIDAY";
  v85[0] = objc_opt_class();
  v84[1] = @"CELEBRATING";
  v85[1] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
  v139[26] = v16;
  v15 = [NSNumber numberWithUnsignedShort:900];
  v138[27] = v15;
  v82[0] = @"PUBLIC_EVENT";
  v83[0] = objc_opt_class();
  v82[1] = @"PERFORMER";
  v83[1] = objc_opt_class();
  v82[2] = @"PUBLIC_EVENT_BUSINESS";
  v83[2] = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:3];
  v139[27] = v14;
  v13 = [NSNumber numberWithUnsignedShort:901];
  v138[28] = v13;
  v80 = @"CATEGORY";
  uint64_t v81 = objc_opt_class();
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
  v139[28] = v12;
  v11 = [NSNumber numberWithUnsignedShort:902];
  v138[29] = v11;
  v78 = @"LOCALIZED_SUBCATEGORY";
  uint64_t v79 = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
  v139[29] = v0;
  v1 = [NSNumber numberWithUnsignedShort:504];
  v138[30] = v1;
  v76 = @"BUSINESSCATEGORY";
  uint64_t v77 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  v139[30] = v2;
  v3 = [NSNumber numberWithUnsignedShort:1000];
  v138[31] = v3;
  v74 = @"MUSIC_SESSION";
  uint64_t v75 = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  v139[31] = v4;
  unsigned __int16 v5 = [NSNumber numberWithUnsignedShort:1100];
  v138[32] = v5;
  v72[0] = @"CONTAINS_ASSETS_FROM";
  v72[1] = @"MEMORY_FEATURES";
  v73[0] = objc_opt_class();
  v73[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
  v139[32] = v6;
  id v7 = [NSNumber numberWithUnsignedShort:1200];
  v138[33] = v7;
  v70 = @"MOMENT_FEATURES";
  uint64_t v71 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
  v139[33] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:34];
  id v10 = (void *)edgeClassByDomainAndLabel_edgeClassByDomainAndLabel;
  edgeClassByDomainAndLabel_edgeClassByDomainAndLabel = v9;
}

- (void)enumerateNodeClassesUsingBlock:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = [(PGGraphSpecification *)self nodeClassByDomainAndLabel];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke;
  v11[3] = &unk_1E68E5D20;
  id v6 = v4;
  id v12 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  id v7 = [(PGGraphSpecification *)self nodeClassByDomain];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke_3;
  v9[3] = &unk_1E68E5D48;
  id v10 = v6;
  id v8 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke_2;
  v8[3] = &unk_1E68E5CF8;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned __int16 v5 = [a2 unsignedIntegerValue];
  id v6 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v4 + 16);
  return v6(v4, 0, v5, a3);
}

void __55__PGGraphSpecification_enumerateNodeClassesUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int16 v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  (*(void (**)(uint64_t, id, void, uint64_t))(v4 + 16))(v4, v6, (unsigned __int16)[v5 unsignedIntegerValue], a3);
}

- (Class)nodeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (!v6) {
    goto LABEL_3;
  }
  id v7 = [(PGGraphSpecification *)self nodeClassByDomainAndLabel];
  id v8 = [NSNumber numberWithUnsignedShort:v4];
  id v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = (objc_class *)[v9 objectForKeyedSubscript:v6];

  if (!v10)
  {
LABEL_3:
    v11 = [(PGGraphSpecification *)self nodeClassByDomain];
    id v12 = [NSNumber numberWithUnsignedShort:v4];
    id v10 = (objc_class *)[v11 objectForKeyedSubscript:v12];

    if (!v10) {
      id v10 = [(MAGraphSpecification *)self defaultNodeClass];
    }
  }
  v13 = v10;

  return v13;
}

- (id)nodeClassByDomain
{
  if (nodeClassByDomain_onceToken != -1) {
    dispatch_once(&nodeClassByDomain_onceToken, &__block_literal_global_269);
  }
  v2 = (void *)nodeClassByDomain_nodeClassByDomain;
  return v2;
}

void __41__PGGraphSpecification_nodeClassByDomain__block_invoke()
{
  v22[19] = *MEMORY[0x1E4F143B8];
  v20 = [NSNumber numberWithUnsignedShort:103];
  v21[0] = v20;
  v22[0] = objc_opt_class();
  v19 = [NSNumber numberWithUnsignedShort:203];
  v21[1] = v19;
  v22[1] = objc_opt_class();
  v18 = [NSNumber numberWithUnsignedShort:700];
  v21[2] = v18;
  v22[2] = objc_opt_class();
  v17 = [NSNumber numberWithUnsignedShort:701];
  v21[3] = v17;
  v22[3] = objc_opt_class();
  v16 = [NSNumber numberWithUnsignedShort:305];
  v21[4] = v16;
  v22[4] = objc_opt_class();
  v15 = [NSNumber numberWithUnsignedShort:600];
  v21[5] = v15;
  v22[5] = objc_opt_class();
  v14 = [NSNumber numberWithUnsignedShort:602];
  v21[6] = v14;
  v22[6] = objc_opt_class();
  v13 = [NSNumber numberWithUnsignedShort:601];
  v21[7] = v13;
  v22[7] = objc_opt_class();
  id v12 = [NSNumber numberWithUnsignedShort:603];
  v21[8] = v12;
  v22[8] = objc_opt_class();
  v0 = [NSNumber numberWithUnsignedShort:200];
  v21[9] = v0;
  v22[9] = objc_opt_class();
  v1 = [NSNumber numberWithUnsignedShort:901];
  v21[10] = v1;
  v22[10] = objc_opt_class();
  v2 = [NSNumber numberWithUnsignedShort:902];
  v21[11] = v2;
  v22[11] = objc_opt_class();
  v3 = [NSNumber numberWithUnsignedShort:504];
  v21[12] = v3;
  v22[12] = objc_opt_class();
  uint64_t v4 = [NSNumber numberWithUnsignedShort:501];
  v21[13] = v4;
  v22[13] = objc_opt_class();
  unsigned __int16 v5 = [NSNumber numberWithUnsignedShort:502];
  v21[14] = v5;
  v22[14] = objc_opt_class();
  id v6 = [NSNumber numberWithUnsignedShort:202];
  v21[15] = v6;
  v22[15] = objc_opt_class();
  id v7 = [NSNumber numberWithUnsignedShort:1001];
  v21[16] = v7;
  v22[16] = objc_opt_class();
  id v8 = [NSNumber numberWithUnsignedShort:1100];
  v21[17] = v8;
  v22[17] = objc_opt_class();
  id v9 = [NSNumber numberWithUnsignedShort:1201];
  v21[18] = v9;
  v22[18] = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:19];
  v11 = (void *)nodeClassByDomain_nodeClassByDomain;
  nodeClassByDomain_nodeClassByDomain = v10;
}

- (id)nodeClassByDomainAndLabel
{
  if (nodeClassByDomainAndLabel_onceToken != -1) {
    dispatch_once(&nodeClassByDomainAndLabel_onceToken, &__block_literal_global_11414);
  }
  v2 = (void *)nodeClassByDomainAndLabel_nodeClassByDomainAndLabel;
  return v2;
}

void __49__PGGraphSpecification_nodeClassByDomainAndLabel__block_invoke()
{
  v71[17] = *MEMORY[0x1E4F143B8];
  v35 = [NSNumber numberWithUnsignedShort:21];
  v70[0] = v35;
  v68 = @"Info";
  uint64_t v69 = objc_opt_class();
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  v71[0] = v34;
  v33 = [NSNumber numberWithUnsignedShort:100];
  v70[1] = v33;
  v66 = @"Moment";
  uint64_t v67 = objc_opt_class();
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
  v71[1] = v32;
  v31 = [NSNumber numberWithUnsignedShort:102];
  v70[2] = v31;
  v64[0] = @"Highlight";
  v65[0] = objc_opt_class();
  v64[1] = @"HighlightGroup";
  v65[1] = objc_opt_class();
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v71[2] = v30;
  v29 = [NSNumber numberWithUnsignedShort:400];
  v70[3] = v29;
  v62[0] = @"Date";
  v63[0] = objc_opt_class();
  v62[1] = @"DayOfWeek";
  v63[1] = objc_opt_class();
  v62[2] = @"Day";
  v63[2] = objc_opt_class();
  v62[3] = @"Month";
  v63[3] = objc_opt_class();
  v62[4] = @"MonthDay";
  v63[4] = objc_opt_class();
  v62[5] = @"Year";
  v63[5] = objc_opt_class();
  v62[6] = @"WeekMonth";
  v63[6] = objc_opt_class();
  v62[7] = @"WeekYear";
  v63[7] = objc_opt_class();
  v62[8] = @"PartOfDay";
  v63[8] = objc_opt_class();
  v62[9] = @"Season";
  v63[9] = objc_opt_class();
  v62[10] = @"Weekend";
  v63[10] = objc_opt_class();
  v62[11] = @"Weekday";
  v63[11] = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:12];
  v71[3] = v28;
  v27 = [NSNumber numberWithUnsignedShort:401];
  v70[4] = v27;
  v60 = @"Holiday";
  uint64_t v61 = objc_opt_class();
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v71[4] = v26;
  v25 = [NSNumber numberWithUnsignedShort:402];
  v70[5] = v25;
  v58 = @"OverTheYears";
  uint64_t v59 = objc_opt_class();
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  v71[5] = v24;
  v23 = [NSNumber numberWithUnsignedShort:200];
  v70[6] = v23;
  v56[0] = @"Address";
  v57[0] = objc_opt_class();
  v56[1] = @"Number";
  v57[1] = objc_opt_class();
  v56[2] = @"Street";
  v57[2] = objc_opt_class();
  v56[3] = @"District";
  v57[3] = objc_opt_class();
  v56[4] = @"City";
  v57[4] = objc_opt_class();
  v56[5] = @"County";
  v57[5] = objc_opt_class();
  v56[6] = @"State";
  v57[6] = objc_opt_class();
  v56[7] = @"Country";
  v57[7] = objc_opt_class();
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:8];
  v71[6] = v22;
  v21 = [NSNumber numberWithUnsignedShort:201];
  v70[7] = v21;
  v54 = @"Area";
  uint64_t v55 = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v71[7] = v20;
  v19 = [NSNumber numberWithUnsignedShort:204];
  v70[8] = v19;
  v52 = @"FrequentLocation";
  uint64_t v53 = objc_opt_class();
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  v71[8] = v18;
  v17 = [NSNumber numberWithUnsignedShort:205];
  v70[9] = v17;
  v50 = @"Language";
  uint64_t v51 = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  v71[9] = v16;
  v15 = [NSNumber numberWithUnsignedShort:503];
  v70[10] = v15;
  v48 = @"Business";
  uint64_t v49 = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v71[10] = v14;
  v13 = [NSNumber numberWithUnsignedShort:300];
  v70[11] = v13;
  v46[0] = @"People";
  v46[1] = @"Me";
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  v71[11] = v12;
  v11 = [NSNumber numberWithUnsignedShort:303];
  v70[12] = v11;
  v44 = @"Contact";
  uint64_t v45 = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v71[12] = v0;
  v1 = [NSNumber numberWithUnsignedShort:302];
  v70[13] = v1;
  v42 = @"SocialGroup";
  uint64_t v43 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v71[13] = v2;
  v3 = [NSNumber numberWithUnsignedShort:900];
  v70[14] = v3;
  v40[0] = @"PublicEvent";
  v40[1] = @"Performer";
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  v71[14] = v4;
  unsigned __int16 v5 = [NSNumber numberWithUnsignedShort:304];
  v70[15] = v5;
  v38 = @"Pet";
  uint64_t v39 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v71[15] = v6;
  id v7 = [NSNumber numberWithUnsignedShort:1000];
  v70[16] = v7;
  v36[0] = @"MusicSession";
  v37[0] = objc_opt_class();
  v36[1] = @"MusicAlbum";
  v37[1] = objc_opt_class();
  v36[2] = @"MusicTrack";
  v37[2] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
  v71[16] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:17];
  uint64_t v10 = (void *)nodeClassByDomainAndLabel_nodeClassByDomainAndLabel;
  nodeClassByDomainAndLabel_nodeClassByDomainAndLabel = v9;
}

- (PGGraphSpecification)init
{
  v4.receiver = self;
  v4.super_class = (Class)PGGraphSpecification;
  v2 = [(MAGraphSpecification *)&v4 init];
  if (v2)
  {
    [(MAGraphSpecification *)v2 setDefaultNodeClass:objc_opt_class()];
    [(MAGraphSpecification *)v2 setDefaultEdgeClass:objc_opt_class()];
  }
  return v2;
}

@end