@interface MOBundleContentExtractor
+ (id)insignificantPlaceTypes;
- (MOBundleContentExtractor)initWithConfigurationManager:(id)a3 promptManager:(id)a4;
- (MOContextConfigurationManager)configurationManager;
- (MOPromptManager)promptManager;
- (NSArray)curatedPhotoTraitsList;
- (NSArray)insignificantPlaceTypes;
- (NSSet)metaDataAllowListForSongTitleArtistInclusionActivityType;
- (NSSet)metaDataAllowListForSongTitleArtistInclusionBundleType;
- (NSSet)metaDataAllowListForSongTitleArtistInclusionPhotoTrait;
- (NSSet)metaDataAllowListForSongTitleArtistInclusionPlaceType;
- (OS_dispatch_queue)bundleFetchQueue;
- (OS_dispatch_queue)queue;
- (id)_extractContentFromBundle:(id)a3;
- (id)_extractContentFromOutingBundle:(id)a3;
- (id)_extractDictionaryFromBundle:(id)a3;
- (id)_extractPersonNamesFromPersons:(id)a3;
- (id)_extractPersonsFromBundle:(id)a3;
- (id)_filterOutVisitRelatedBundlesFrom:(id)a3;
- (id)_sortedBundleBasedOnGoodnessScore:(id)a3;
- (unint64_t)_extractActivityTypeFromBundle:(id)a3;
- (unint64_t)_extractBundleTypeFromBundle:(id)a3;
- (unint64_t)_extractPatternTypeFromBundle:(id)a3;
- (unint64_t)_extractPeopleClassificationFromPersons:(id)a3;
- (unint64_t)_extractPhotoTraitFromBundle:(id)a3;
- (unint64_t)_extractPlaceTypeFromBundle:(id)a3;
- (unint64_t)_extractTimeFromBundle:(id)a3;
- (unint64_t)_findFirstMatchingCuratedPhotoTraitSetForBundle:(id)a3;
- (unint64_t)_findMatchingMetaDataWithPeopleClassification:(unint64_t)a3;
- (void)_addContentRatingForSongTitleAndArtistSuggestions:(id)a3;
- (void)_extractContentsFromBundleStartDate:(id)a3 endDate:(id)a4 daysPerFetch:(unint64_t)a5 significantLocationEnabled:(BOOL)a6 partialResults:(id)a7 withHandler:(id)a8;
- (void)_extractDominantMusicFromBundle:(id)a3 forBundleContent:(id)a4;
- (void)_extractPlaceOrCityNameFromBundle:(id)a3 forBundleContent:(id)a4;
- (void)_extractTimeReferenceFromBundle:(id)a3 forBundleContent:(id)a4;
- (void)_fetchEventBundlesWithStartDate:(id)a3 EndDate:(id)a4 SignificantLocationEnabled:(BOOL)a5 Handler:(id)a6;
- (void)_filterExtractedBundles:(id)a3 withHandler:(id)a4;
- (void)_sortedBundleContextFromUpdatedGoodnessScore:(id)a3;
- (void)_updateContextGoodnessScoreFromBundle:(id)a3 forBundleContent:(id)a4;
- (void)extractContentsFromBundlesWithHandler:(id)a3;
- (void)setConfigurationManager:(id)a3;
@end

@implementation MOBundleContentExtractor

- (MOBundleContentExtractor)initWithConfigurationManager:(id)a3 promptManager:(id)a4
{
  id v111 = a3;
  id v110 = a4;
  v112.receiver = self;
  v112.super_class = (Class)MOBundleContentExtractor;
  v7 = [(MOBundleContentExtractor *)&v112 init];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("MOBundleContentExtractor", v8);
    v10 = v7;
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v277 = &off_1000B6390;
    v278 = &off_1000B7898;
    v109 = +[NSDictionary dictionaryWithObjects:&v278 forKeys:&v277 count:1];
    v279[0] = v109;
    v275 = &off_1000B63A8;
    v276 = &off_1000B78B0;
    v108 = +[NSDictionary dictionaryWithObjects:&v276 forKeys:&v275 count:1];
    v279[1] = v108;
    v273 = &off_1000B63C0;
    v274 = &off_1000B78C8;
    v107 = +[NSDictionary dictionaryWithObjects:&v274 forKeys:&v273 count:1];
    v279[2] = v107;
    v271 = &off_1000B63D8;
    v272 = &off_1000B78E0;
    v106 = +[NSDictionary dictionaryWithObjects:&v272 forKeys:&v271 count:1];
    v279[3] = v106;
    v269 = &off_1000B63F0;
    v270 = &off_1000B78F8;
    v105 = +[NSDictionary dictionaryWithObjects:&v270 forKeys:&v269 count:1];
    v279[4] = v105;
    v267 = &off_1000B6408;
    v268 = &off_1000B7910;
    v104 = +[NSDictionary dictionaryWithObjects:&v268 forKeys:&v267 count:1];
    v279[5] = v104;
    v265 = &off_1000B6420;
    v266 = &off_1000B7928;
    v103 = +[NSDictionary dictionaryWithObjects:&v266 forKeys:&v265 count:1];
    v279[6] = v103;
    v263 = &off_1000B6438;
    v264 = &off_1000B7940;
    v102 = +[NSDictionary dictionaryWithObjects:&v264 forKeys:&v263 count:1];
    v279[7] = v102;
    v261 = &off_1000B6450;
    v262 = &off_1000B7958;
    v101 = +[NSDictionary dictionaryWithObjects:&v262 forKeys:&v261 count:1];
    v279[8] = v101;
    v259 = &off_1000B6468;
    v260 = &off_1000B7970;
    v100 = +[NSDictionary dictionaryWithObjects:&v260 forKeys:&v259 count:1];
    v279[9] = v100;
    v257 = &off_1000B6480;
    v258 = &off_1000B7988;
    v99 = +[NSDictionary dictionaryWithObjects:&v258 forKeys:&v257 count:1];
    v279[10] = v99;
    v255 = &off_1000B6498;
    v256 = &off_1000B79A0;
    v98 = +[NSDictionary dictionaryWithObjects:&v256 forKeys:&v255 count:1];
    v279[11] = v98;
    v253 = &off_1000B64B0;
    v254 = &off_1000B79B8;
    v97 = +[NSDictionary dictionaryWithObjects:&v254 forKeys:&v253 count:1];
    v279[12] = v97;
    v251 = &off_1000B64C8;
    v252 = &off_1000B79D0;
    v96 = +[NSDictionary dictionaryWithObjects:&v252 forKeys:&v251 count:1];
    v279[13] = v96;
    v249 = &off_1000B64E0;
    v250 = &off_1000B79E8;
    v95 = +[NSDictionary dictionaryWithObjects:&v250 forKeys:&v249 count:1];
    v279[14] = v95;
    v247 = &off_1000B64F8;
    v248 = &off_1000B7A00;
    v94 = +[NSDictionary dictionaryWithObjects:&v248 forKeys:&v247 count:1];
    v279[15] = v94;
    v245 = &off_1000B6510;
    v246 = &off_1000B7A18;
    v93 = +[NSDictionary dictionaryWithObjects:&v246 forKeys:&v245 count:1];
    v279[16] = v93;
    v243 = &off_1000B6528;
    v244 = &off_1000B7A30;
    v92 = +[NSDictionary dictionaryWithObjects:&v244 forKeys:&v243 count:1];
    v279[17] = v92;
    v241 = &off_1000B6540;
    v242 = &off_1000B7A48;
    v91 = +[NSDictionary dictionaryWithObjects:&v242 forKeys:&v241 count:1];
    v279[18] = v91;
    v239 = &off_1000B6558;
    v240 = &off_1000B7A60;
    v90 = +[NSDictionary dictionaryWithObjects:&v240 forKeys:&v239 count:1];
    v279[19] = v90;
    v237 = &off_1000B6570;
    v238 = &off_1000B7A78;
    v89 = +[NSDictionary dictionaryWithObjects:&v238 forKeys:&v237 count:1];
    v279[20] = v89;
    v235 = &off_1000B6588;
    v236 = &off_1000B7A90;
    v88 = +[NSDictionary dictionaryWithObjects:&v236 forKeys:&v235 count:1];
    v279[21] = v88;
    v233 = &off_1000B65A0;
    v234 = &off_1000B7AA8;
    v87 = +[NSDictionary dictionaryWithObjects:&v234 forKeys:&v233 count:1];
    v279[22] = v87;
    v231 = &off_1000B65B8;
    v232 = &off_1000B7AC0;
    v86 = +[NSDictionary dictionaryWithObjects:&v232 forKeys:&v231 count:1];
    v279[23] = v86;
    v229 = &off_1000B65D0;
    v230 = &off_1000B7AD8;
    v85 = +[NSDictionary dictionaryWithObjects:&v230 forKeys:&v229 count:1];
    v279[24] = v85;
    v227 = &off_1000B65E8;
    v228 = &off_1000B7AF0;
    v84 = +[NSDictionary dictionaryWithObjects:&v228 forKeys:&v227 count:1];
    v279[25] = v84;
    v225 = &off_1000B6600;
    v226 = &off_1000B7B08;
    v83 = +[NSDictionary dictionaryWithObjects:&v226 forKeys:&v225 count:1];
    v279[26] = v83;
    v223 = &off_1000B6618;
    v224 = &off_1000B7B20;
    v82 = +[NSDictionary dictionaryWithObjects:&v224 forKeys:&v223 count:1];
    v279[27] = v82;
    v221 = &off_1000B6630;
    v222 = &off_1000B7B38;
    v81 = +[NSDictionary dictionaryWithObjects:&v222 forKeys:&v221 count:1];
    v279[28] = v81;
    v219 = &off_1000B6648;
    v220 = &off_1000B7B50;
    v80 = +[NSDictionary dictionaryWithObjects:&v220 forKeys:&v219 count:1];
    v279[29] = v80;
    v217 = &off_1000B6660;
    v218 = &off_1000B7B68;
    v79 = +[NSDictionary dictionaryWithObjects:&v218 forKeys:&v217 count:1];
    v279[30] = v79;
    v215 = &off_1000B6678;
    v216 = &off_1000B7B80;
    v78 = +[NSDictionary dictionaryWithObjects:&v216 forKeys:&v215 count:1];
    v279[31] = v78;
    v213 = &off_1000B6690;
    v214 = &off_1000B7B98;
    v77 = +[NSDictionary dictionaryWithObjects:&v214 forKeys:&v213 count:1];
    v279[32] = v77;
    v211 = &off_1000B66A8;
    v212 = &off_1000B7BB0;
    v76 = +[NSDictionary dictionaryWithObjects:&v212 forKeys:&v211 count:1];
    v279[33] = v76;
    v209 = &off_1000B66C0;
    v210 = &off_1000B7BC8;
    v75 = +[NSDictionary dictionaryWithObjects:&v210 forKeys:&v209 count:1];
    v279[34] = v75;
    v207 = &off_1000B66D8;
    v208 = &off_1000B7BE0;
    v74 = +[NSDictionary dictionaryWithObjects:&v208 forKeys:&v207 count:1];
    v279[35] = v74;
    v205 = &off_1000B66F0;
    v206 = &off_1000B7BF8;
    v73 = +[NSDictionary dictionaryWithObjects:&v206 forKeys:&v205 count:1];
    v279[36] = v73;
    v203 = &off_1000B6708;
    v204 = &off_1000B7C10;
    v72 = +[NSDictionary dictionaryWithObjects:&v204 forKeys:&v203 count:1];
    v279[37] = v72;
    v201 = &off_1000B6720;
    v202 = &off_1000B7C28;
    v71 = +[NSDictionary dictionaryWithObjects:&v202 forKeys:&v201 count:1];
    v279[38] = v71;
    v199 = &off_1000B6738;
    v200 = &off_1000B7C40;
    v70 = +[NSDictionary dictionaryWithObjects:&v200 forKeys:&v199 count:1];
    v279[39] = v70;
    v197 = &off_1000B6750;
    v198 = &off_1000B7C58;
    v69 = +[NSDictionary dictionaryWithObjects:&v198 forKeys:&v197 count:1];
    v279[40] = v69;
    v195 = &off_1000B6768;
    v196 = &off_1000B7C70;
    v68 = +[NSDictionary dictionaryWithObjects:&v196 forKeys:&v195 count:1];
    v279[41] = v68;
    v193 = &off_1000B6780;
    v194 = &off_1000B7C88;
    v67 = +[NSDictionary dictionaryWithObjects:&v194 forKeys:&v193 count:1];
    v279[42] = v67;
    v191 = &off_1000B6798;
    v192 = &off_1000B7CA0;
    v66 = +[NSDictionary dictionaryWithObjects:&v192 forKeys:&v191 count:1];
    v279[43] = v66;
    v189 = &off_1000B67B0;
    v190 = &off_1000B7CB8;
    v65 = +[NSDictionary dictionaryWithObjects:&v190 forKeys:&v189 count:1];
    v279[44] = v65;
    v187 = &off_1000B67C8;
    v188 = &off_1000B7CD0;
    v64 = +[NSDictionary dictionaryWithObjects:&v188 forKeys:&v187 count:1];
    v279[45] = v64;
    v185 = &off_1000B67E0;
    v186 = &off_1000B7CE8;
    v63 = +[NSDictionary dictionaryWithObjects:&v186 forKeys:&v185 count:1];
    v279[46] = v63;
    v183 = &off_1000B67F8;
    v184 = &off_1000B7D00;
    v62 = +[NSDictionary dictionaryWithObjects:&v184 forKeys:&v183 count:1];
    v279[47] = v62;
    v181 = &off_1000B6810;
    v182 = &off_1000B7D18;
    v61 = +[NSDictionary dictionaryWithObjects:&v182 forKeys:&v181 count:1];
    v279[48] = v61;
    v179 = &off_1000B6828;
    v180 = &off_1000B7D30;
    v60 = +[NSDictionary dictionaryWithObjects:&v180 forKeys:&v179 count:1];
    v279[49] = v60;
    v177 = &off_1000B6840;
    v178 = &off_1000B7D48;
    v59 = +[NSDictionary dictionaryWithObjects:&v178 forKeys:&v177 count:1];
    v279[50] = v59;
    v175 = &off_1000B6858;
    v176 = &off_1000B7D60;
    v58 = +[NSDictionary dictionaryWithObjects:&v176 forKeys:&v175 count:1];
    v279[51] = v58;
    v173 = &off_1000B6870;
    v174 = &off_1000B7D78;
    v57 = +[NSDictionary dictionaryWithObjects:&v174 forKeys:&v173 count:1];
    v279[52] = v57;
    v171 = &off_1000B6888;
    v172 = &off_1000B7D90;
    v55 = +[NSDictionary dictionaryWithObjects:&v172 forKeys:&v171 count:1];
    v279[53] = v55;
    v169 = &off_1000B68A0;
    v170 = &off_1000B7DA8;
    v54 = +[NSDictionary dictionaryWithObjects:&v170 forKeys:&v169 count:1];
    v279[54] = v54;
    v167 = &off_1000B68B8;
    v168 = &off_1000B7DC0;
    v53 = +[NSDictionary dictionaryWithObjects:&v168 forKeys:&v167 count:1];
    v279[55] = v53;
    v165 = &off_1000B68D0;
    v166 = &off_1000B7DD8;
    v52 = +[NSDictionary dictionaryWithObjects:&v166 forKeys:&v165 count:1];
    v279[56] = v52;
    v163 = &off_1000B68E8;
    v164 = &off_1000B7DF0;
    v50 = +[NSDictionary dictionaryWithObjects:&v164 forKeys:&v163 count:1];
    v279[57] = v50;
    v161 = &off_1000B6900;
    v162 = &off_1000B7E08;
    v49 = +[NSDictionary dictionaryWithObjects:&v162 forKeys:&v161 count:1];
    v279[58] = v49;
    v159 = &off_1000B6918;
    v160 = &off_1000B7E20;
    v48 = +[NSDictionary dictionaryWithObjects:&v160 forKeys:&v159 count:1];
    v279[59] = v48;
    v157 = &off_1000B6930;
    v158 = &off_1000B7E38;
    v47 = +[NSDictionary dictionaryWithObjects:&v158 forKeys:&v157 count:1];
    v279[60] = v47;
    v155 = &off_1000B6948;
    v156 = &off_1000B7E50;
    v46 = +[NSDictionary dictionaryWithObjects:&v156 forKeys:&v155 count:1];
    v279[61] = v46;
    v153 = &off_1000B6960;
    v154 = &off_1000B7E68;
    v45 = +[NSDictionary dictionaryWithObjects:&v154 forKeys:&v153 count:1];
    v279[62] = v45;
    v151 = &off_1000B6978;
    v152 = &off_1000B7E80;
    v44 = +[NSDictionary dictionaryWithObjects:&v152 forKeys:&v151 count:1];
    v279[63] = v44;
    v149 = &off_1000B6990;
    v150 = &off_1000B7E98;
    v43 = +[NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];
    v279[64] = v43;
    v147 = &off_1000B69A8;
    v148 = &off_1000B7EB0;
    v42 = +[NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
    v279[65] = v42;
    v145 = &off_1000B69C0;
    v146 = &off_1000B7EC8;
    v41 = +[NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
    v279[66] = v41;
    v143 = &off_1000B69D8;
    v144 = &off_1000B7EE0;
    v40 = +[NSDictionary dictionaryWithObjects:&v144 forKeys:&v143 count:1];
    v279[67] = v40;
    v141 = &off_1000B69F0;
    v142 = &off_1000B7EF8;
    v39 = +[NSDictionary dictionaryWithObjects:&v142 forKeys:&v141 count:1];
    v279[68] = v39;
    v139 = &off_1000B6A08;
    v140 = &off_1000B7F10;
    v38 = +[NSDictionary dictionaryWithObjects:&v140 forKeys:&v139 count:1];
    v279[69] = v38;
    v137 = &off_1000B6A20;
    v138 = &off_1000B7F28;
    v37 = +[NSDictionary dictionaryWithObjects:&v138 forKeys:&v137 count:1];
    v279[70] = v37;
    v135 = &off_1000B6A38;
    v136 = &off_1000B7F40;
    v36 = +[NSDictionary dictionaryWithObjects:&v136 forKeys:&v135 count:1];
    v279[71] = v36;
    v133 = &off_1000B6A50;
    v134 = &off_1000B7F58;
    v35 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
    v279[72] = v35;
    v131 = &off_1000B6A68;
    v132 = &off_1000B7F70;
    v34 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
    v279[73] = v34;
    v129 = &off_1000B6A80;
    v130 = &off_1000B7F88;
    v12 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
    v279[74] = v12;
    v127 = &off_1000B6A98;
    v128 = &off_1000B7FA0;
    v13 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
    v279[75] = v13;
    v125 = &off_1000B6AB0;
    v126 = &off_1000B7FB8;
    v14 = +[NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];
    v279[76] = v14;
    v123 = &off_1000B6AC8;
    v124 = &off_1000B7FD0;
    +[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
    v15 = id v56 = a3;
    v279[77] = v15;
    v121 = &off_1000B6AE0;
    v122 = &off_1000B7FE8;
    v16 = +[NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1];
    v279[78] = v16;
    v119 = &off_1000B6AF8;
    v120 = &off_1000B8000;
    v17 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
    v279[79] = v17;
    v117 = &off_1000B6B10;
    v118 = &off_1000B8018;
    v18 = +[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
    v279[80] = v18;
    v115 = &off_1000B6B28;
    v116 = &off_1000B8030;
    +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    v19 = id obj = a4;
    v279[81] = v19;
    v113 = &off_1000B6B40;
    v114 = &off_1000B8048;
    v20 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
    v279[82] = v20;
    uint64_t v21 = +[NSArray arrayWithObjects:v279 count:83];
    curatedPhotoTraitsList = v10->_curatedPhotoTraitsList;
    v10->_curatedPhotoTraitsList = (NSArray *)v21;

    uint64_t v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B6390, &off_1000B63C0, &off_1000B6A68, &off_1000B6A80, &off_1000B6A50, &off_1000B63D8, &off_1000B6408, &off_1000B6438, &off_1000B64C8, &off_1000B6480, 0);
    metaDataAllowListForSongTitleArtistInclusionActivityType = v10->_metaDataAllowListForSongTitleArtistInclusionActivityType;
    v10->_metaDataAllowListForSongTitleArtistInclusionActivityType = (NSSet *)v23;

    uint64_t v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B6A50, &off_1000B6438, &off_1000B6498, &off_1000B63A8, &off_1000B63F0, &off_1000B64F8, &off_1000B6768, &off_1000B6558, &off_1000B6750, &off_1000B67C8, &off_1000B67E0, &off_1000B6810, &off_1000B6828, 0);
    metaDataAllowListForSongTitleArtistInclusionPlaceType = v10->_metaDataAllowListForSongTitleArtistInclusionPlaceType;
    v10->_metaDataAllowListForSongTitleArtistInclusionPlaceType = (NSSet *)v25;

    uint64_t v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B6A50, 0);
    metaDataAllowListForSongTitleArtistInclusionBundleType = v10->_metaDataAllowListForSongTitleArtistInclusionBundleType;
    v10->_metaDataAllowListForSongTitleArtistInclusionBundleType = (NSSet *)v27;

    +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1000B6468, &off_1000B66A8, &off_1000B6768, &off_1000B6540, &off_1000B6558, &off_1000B6708, &off_1000B6720, &off_1000B6738, &off_1000B6750, &off_1000B67C8, &off_1000B67E0, &off_1000B67F8, &off_1000B6810, &off_1000B6828, &off_1000B6570, &off_1000B6840, &off_1000B6870,
      &off_1000B6888,
      &off_1000B68A0,
      &off_1000B6900,
      &off_1000B6918,
      &off_1000B6930,
      &off_1000B6948,
      &off_1000B6960,
      &off_1000B6978,
      &off_1000B6990,
      &off_1000B69A8,
      &off_1000B69C0,
      &off_1000B69D8,
      &off_1000B69F0,
      &off_1000B6A08,
      &off_1000B6A20,
      &off_1000B6A38,
      &off_1000B65E8,
      &off_1000B6600,
      &off_1000B6618,
      &off_1000B6630,
      &off_1000B6648,
      &off_1000B6660,
      &off_1000B65A0,
      &off_1000B66C0,
      &off_1000B6678,
      &off_1000B6690,
      &off_1000B6588,
      &off_1000B6B28,
      &off_1000B65B8,
      &off_1000B65D0,
      &off_1000B6858,
      &off_1000B6AC8,
      &off_1000B6798,
      &off_1000B6780,
      &off_1000B67B0,
      &off_1000B68D0,
      &off_1000B68E8,
    uint64_t v29 = 0);
    metaDataAllowListForSongTitleArtistInclusionPhotoTrait = v10->_metaDataAllowListForSongTitleArtistInclusionPhotoTrait;
    v10->_metaDataAllowListForSongTitleArtistInclusionPhotoTrait = (NSSet *)v29;

    objc_storeStrong((id *)&v10->_promptManager, obj);
    uint64_t v31 = +[MOBundleContentExtractor insignificantPlaceTypes];
    insignificantPlaceTypes = v10->_insignificantPlaceTypes;
    v10->_insignificantPlaceTypes = (NSArray *)v31;

    v7 = v10;
    objc_storeStrong((id *)&v10->_configurationManager, v56);
  }

  return v7;
}

- (void)extractContentsFromBundlesWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __66__MOBundleContentExtractor_extractContentsFromBundlesWithHandler___block_invoke;
  v7[3] = &unk_1000A4A60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__MOBundleContentExtractor_extractContentsFromBundlesWithHandler___block_invoke(uint64_t a1)
{
  v2 = +[MOSettingsManager sharedInstance];
  id v3 = [v2 getStateForSetting:11];

  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = &__kCFBooleanFalse;
    if (v3) {
      v5 = &__kCFBooleanTrue;
    }
    int v15 = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "system significant location enabled, %@", (uint8_t *)&v15, 0xCu);
  }

  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v6))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCCreateBundleContent", "", (uint8_t *)&v15, 2u);
  }

  v7 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCCreateBundleContent" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v7 startSession];
  id v8 = +[NSDate now];
  dispatch_queue_t v9 = [*(id *)(a1 + 32) configurationManager];
  int v10 = [v9 getIntegerSettingForKey:@"NumberOfWeeksForFetchBundle" withFallback:4];

  v11 = [v8 dateByAddingTimeInterval:(double)v10 * -604800.0];
  v12 = *(void **)(a1 + 32);
  v13 = objc_opt_new();
  [v12 _extractContentsFromBundleStartDate:v11 endDate:v8 daysPerFetch:3 significantLocationEnabled:v3 partialResults:v13 withHandler:*(void *)(a1 + 40)];

  v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v14))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCCreateBundleContent", "", (uint8_t *)&v15, 2u);
  }

  [(MOPerformanceMeasurement *)v7 endSession];
}

- (void)_extractContentsFromBundleStartDate:(id)a3 endDate:(id)a4 daysPerFetch:(unint64_t)a5 significantLocationEnabled:(BOOL)a6 partialResults:(id)a7 withHandler:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  if ([v15 isOnOrBefore:v14])
  {
    [(MOBundleContentExtractor *)self _filterExtractedBundles:v16 withHandler:v17];
  }
  else
  {
    v18 = [v15 dateByAddingTimeInterval:(double)a5 * -86400.0];
    if ([v18 isBeforeDate:v14])
    {
      id v19 = v14;

      v18 = v19;
    }
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __139__MOBundleContentExtractor__extractContentsFromBundleStartDate_endDate_daysPerFetch_significantLocationEnabled_partialResults_withHandler___block_invoke;
    v21[3] = &unk_1000A4AB0;
    objc_copyWeak(v26, &location);
    id v25 = v17;
    id v22 = v16;
    id v23 = v14;
    id v20 = v18;
    id v24 = v20;
    v26[1] = (id)a5;
    BOOL v27 = v10;
    [(MOBundleContentExtractor *)self _fetchEventBundlesWithStartDate:v20 EndDate:v15 SignificantLocationEnabled:v10 Handler:v21];

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
}

void __139__MOBundleContentExtractor__extractContentsFromBundleStartDate_endDate_daysPerFetch_significantLocationEnabled_partialResults_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v6)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __139__MOBundleContentExtractor__extractContentsFromBundleStartDate_endDate_daysPerFetch_significantLocationEnabled_partialResults_withHandler___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 56);
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    CFStringRef v34 = @"Bundle fetching failed";
    BOOL v10 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v11 = +[NSError errorWithDomain:@"MOContextErrorDomain" code:2570 userInfo:v10];
    v12 = +[NSError errorUsingError:v11 withUnderyingError:v6];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v12);
  }
  else
  {
    if ([v5 count])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v13 = v5;
      id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v29;
        do
        {
          id v17 = 0;
          do
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(a1 + 32) addObject:*(void *)(*((void *)&v28 + 1) + 8 * (void)v17)];
            id v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v15);
      }
    }
    v18 = WeakRetained[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __139__MOBundleContentExtractor__extractContentsFromBundleStartDate_endDate_daysPerFetch_significantLocationEnabled_partialResults_withHandler___block_invoke_1370;
    block[3] = &unk_1000A4A88;
    objc_copyWeak(v26, (id *)(a1 + 64));
    id v22 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    id v20 = *(void **)(a1 + 72);
    id v23 = v19;
    v26[1] = v20;
    char v27 = *(unsigned char *)(a1 + 80);
    id v24 = *(id *)(a1 + 32);
    id v25 = *(id *)(a1 + 56);
    dispatch_async(v18, block);

    objc_destroyWeak(v26);
  }
}

void __139__MOBundleContentExtractor__extractContentsFromBundleStartDate_endDate_daysPerFetch_significantLocationEnabled_partialResults_withHandler___block_invoke_1370(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _extractContentsFromBundleStartDate:*(void *)(a1 + 32) endDate:*(void *)(a1 + 40) daysPerFetch:*(void *)(a1 + 72) significantLocationEnabled:*(unsigned __int8 *)(a1 + 80) partialResults:*(void *)(a1 + 48) withHandler:*(void *)(a1 + 56)];
}

- (void)_filterExtractedBundles:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      v82 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "total count of fetched bundles %lu", buf, 0xCu);
    }
    v51 = v7;

    id v52 = v6;
    v11 = [(MOBundleContentExtractor *)self _sortedBundleBasedOnGoodnessScore:v6];
    v12 = objc_opt_new();
    v58 = objc_opt_new();
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id obj = v11;
    id v56 = [obj countByEnumeratingWithState:&v76 objects:v91 count:16];
    if (v56)
    {
      uint64_t v55 = *(void *)v77;
      v54 = self;
      do
      {
        for (i = 0; i != v56; i = (char *)i + 1)
        {
          if (*(void *)v77 != v55) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if ((objc_msgSend(v14, "interfaceType", v51) == (id)13
             || [v14 summarizationGranularity] == (id)2)
            && [v14 interfaceType] != (id)13)
          {
            id v25 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = [v14 bundleIdentifier];
              char v27 = v25;
              id v28 = [v14 interfaceType];
              id v29 = [v14 bundleSubType];
              id v30 = [v14 summarizationGranularity];
              *(_DWORD *)buf = 138413058;
              v82 = v26;
              __int16 v83 = 2048;
              id v84 = v28;
              id v25 = v27;
              __int16 v85 = 2048;
              id v86 = v29;
              __int16 v87 = 2048;
              id v88 = v30;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "#bundlecuration, filtered bundle. reason: coarse granularity summary.bundleID %@, interfaceType %lu, subType %lu, summarizationGranularity %lu", buf, 0x2Au);
            }
          }
          else
          {
            v57 = i;
            id v15 = [(MOBundleContentExtractor *)self _extractContentFromBundle:v14];
            v60 = v15;
            if ([v12 count] && v15)
            {
              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              id v16 = v12;
              id v17 = [v16 countByEnumeratingWithState:&v72 objects:v90 count:16];
              if (v17)
              {
                id v18 = v17;
                uint64_t v59 = *(void *)v73;
                while (2)
                {
                  for (j = 0; j != v18; j = (char *)j + 1)
                  {
                    if (*(void *)v73 != v59) {
                      objc_enumerationMutation(v16);
                    }
                    id v20 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
                    id v21 = [v15 compareMetadataWith:v20];
                    id v22 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412802;
                      v82 = v60;
                      __int16 v83 = 2112;
                      id v84 = v20;
                      __int16 v85 = 2048;
                      id v86 = v21;
                      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "#bundlededuping, comparing content, %@, current bundleContent, %@, result, %lu", buf, 0x20u);
                    }

                    if (v21 == (id)3)
                    {
                      [v58 addObject:v20];
                      id v15 = v60;
                    }
                    else
                    {
                      BOOL v23 = v21 == (id)4 || v21 == (id)1;
                      id v15 = v60;
                      if (v23)
                      {
                        long long v31 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
                        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412802;
                          v82 = v60;
                          __int16 v83 = 2112;
                          id v84 = v20;
                          __int16 v85 = 1024;
                          LODWORD(v86) = 0;
                          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "#bundlededuping, duped bundle, %@, against, %@, bundleSelected, %d", buf, 0x1Cu);
                        }

                        goto LABEL_42;
                      }
                    }
                  }
                  id v18 = [v16 countByEnumeratingWithState:&v72 objects:v90 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              if (([v16 containsObject:v15] & 1) == 0)
              {
                [v16 addObject:v15];
                id v24 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v82 = v15;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "#bundlecuration, bundle selected and content is queued to generate prompts: %@", buf, 0xCu);
                }
              }
            }
            else if (v15)
            {
              [v12 addObject:v15];
            }
LABEL_42:
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            id v33 = v58;
            id v34 = [v33 countByEnumeratingWithState:&v68 objects:v89 count:16];
            if (v34)
            {
              id v35 = v34;
              uint64_t v36 = *(void *)v69;
              do
              {
                for (k = 0; k != v35; k = (char *)k + 1)
                {
                  if (*(void *)v69 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  v38 = *(NSObject **)(*((void *)&v68 + 1) + 8 * (void)k);
                  if ([v12 containsObject:v38])
                  {
                    v39 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v82 = v38;
                      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "#bundlecuration, prune bundle containing only subset of other content metadata %@", buf, 0xCu);
                    }

                    [v12 removeObject:v38];
                  }
                }
                id v35 = [v33 countByEnumeratingWithState:&v68 objects:v89 count:16];
              }
              while (v35);
            }

            self = v54;
            [(MOBundleContentExtractor *)v54 _sortedBundleContextFromUpdatedGoodnessScore:v12];
            i = v57;
            id v25 = v60;
          }
        }
        id v56 = [obj countByEnumeratingWithState:&v76 objects:v91 count:16];
      }
      while (v56);
    }

    [(MOBundleContentExtractor *)self _addContentRatingForSongTitleAndArtistSuggestions:v12];
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = [v12 count];
      *(_DWORD *)buf = 134217984;
      v82 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "extracted bundle content count, %lu", buf, 0xCu);
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v42 = v12;
    id v43 = [v42 countByEnumeratingWithState:&v64 objects:v80 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v65;
      do
      {
        for (m = 0; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v65 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(NSObject **)(*((void *)&v64 + 1) + 8 * (void)m);
          v48 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v82 = v47;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "bundle content after extraction, de-duping and sorting: %@", buf, 0xCu);
          }
        }
        id v44 = [v42 countByEnumeratingWithState:&v64 objects:v80 count:16];
      }
      while (v44);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __64__MOBundleContentExtractor__filterExtractedBundles_withHandler___block_invoke;
    block[3] = &unk_1000A4AD8;
    id v7 = v51;
    id v62 = v42;
    id v63 = v51;
    id v50 = v42;
    dispatch_async(queue, block);

    id v6 = v52;
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "no bundle context is extracted due to 0 bundle fetched", buf, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

uint64_t __64__MOBundleContentExtractor__filterExtractedBundles_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_fetchEventBundlesWithStartDate:(id)a3 EndDate:(id)a4 SignificantLocationEnabled:(BOOL)a5 Handler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, void *))a6;
  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "_fetchEventBundlesWithHandler, startDate, %@, endDate, %@", buf, 0x16u);
  }

  id v14 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v10 endDate:v11];
  id v15 = [objc_alloc((Class)MOEventBundleFetchOptions) initWithDateInterval:v14 ascending:1 limit:0 includeDeletedBundles:0 skipRanking:0];
  [v15 setSkipLocalization:1];
  [v15 setPersonalizedSensingFilter:1];
  [v15 setPersonalizedSensingVisitsAllowed:v7];
  if (!self->_promptManager)
  {
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[MOBundleContentExtractor _fetchEventBundlesWithStartDate:EndDate:SignificantLocationEnabled:Handler:](v16);
    }

    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"promptManager failed to be initiated";
    id v17 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v18 = +[NSError errorWithDomain:@"MOContextErrorDomain" code:258 userInfo:v17];
    v12[2](v12, 0, v18);
  }
  id v19 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "XPCFetchBundles", "", buf, 2u);
  }

  id v20 = [[MOPerformanceMeasurement alloc] initWithName:@"XPCFetchBundles" measureRecentPeak:0];
  [(MOPerformanceMeasurement *)v20 startSession];
  promptManager = self->_promptManager;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __103__MOBundleContentExtractor__fetchEventBundlesWithStartDate_EndDate_SignificantLocationEnabled_Handler___block_invoke;
  v25[3] = &unk_1000A4B00;
  BOOL v23 = v12;
  BOOL v27 = v7;
  v25[4] = self;
  id v26 = v23;
  [(MOPromptManager *)promptManager fetchEventBundlesWithOptions:v15 handler:v25];

  id v24 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 1uLL, "XPCFetchBundles", "", buf, 2u);
  }

  [(MOPerformanceMeasurement *)v20 endSession];
}

void __103__MOBundleContentExtractor__fetchEventBundlesWithStartDate_EndDate_SignificantLocationEnabled_Handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __103__MOBundleContentExtractor__fetchEventBundlesWithStartDate_EndDate_SignificantLocationEnabled_Handler___block_invoke_cold_1();
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      id v13 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_fetchEventBundlesWithHandler, fetched eventBundle count, %lu", (uint8_t *)&v12, 0xCu);
    }

    if (!*(unsigned char *)(a1 + 48) && [v5 count])
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = [*(id *)(a1 + 32) _filterOutVisitRelatedBundlesFrom:v5];
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);

      goto LABEL_10;
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
LABEL_10:
}

- (id)_filterOutVisitRelatedBundlesFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v11 = [v9 events];
        id v12 = [v11 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              if ([*(id *)(*((void *)&v23 + 1) + 8 * (void)j) category] == (id)1) {
                [v4 addObject:v9];
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v23 objects:v33 count:16];
          }
          while (v13);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v6);
  }

  id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v4 count];
    *(_DWORD *)buf = 134217984;
    id v32 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "fetched visit related eventBundle count, %lu", buf, 0xCu);
  }

  id v18 = [obj arrayByExcludingObjectsInArray:v4];
  id v19 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [v18 count];
    *(_DWORD *)buf = 134217984;
    id v32 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "fetched visit unrelated eventBundle count, %lu", buf, 0xCu);
  }

  return v18;
}

- (id)_extractContentFromBundle:(id)a3
{
  id v4 = a3;
  id v5 = [MOBundleContent alloc];
  id v6 = +[NSUUID UUID];
  uint64_t v7 = [(MOBundleContent *)v5 initWithBundleContentIdentifier:v6];

  id v8 = [(MOBundleContentExtractor *)self _extractDictionaryFromBundle:v4];
  [(MOBundleContent *)v7 setLlmInputDictionary:v8];

  uint64_t v9 = [v4 bundleIdentifier];
  [(MOBundleContent *)v7 setAssociatedBundleID:v9];

  uint64_t v10 = [v4 suggestionID];
  [(MOBundleContent *)v7 setAssociatedSuggestionID:v10];

  id v11 = [v4 rankingDictionary];
  id v12 = [v11 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v12 floatValue];
  [(MOBundleContent *)v7 setBundleGoodnessScore:v13];

  [(MOBundleContent *)v7 setPatternType:[(MOBundleContentExtractor *)self _extractPatternTypeFromBundle:v4]];
  [(MOBundleContent *)v7 setActivityType:[(MOBundleContentExtractor *)self _extractActivityTypeFromBundle:v4]];
  [(MOBundleContent *)v7 setPlaceType:[(MOBundleContentExtractor *)self _extractPlaceTypeFromBundle:v4]];
  [(MOBundleContent *)v7 setTime:[(MOBundleContentExtractor *)self _extractTimeFromBundle:v4]];
  [(MOBundleContent *)v7 setBundleType:[(MOBundleContentExtractor *)self _extractBundleTypeFromBundle:v4]];
  uint64_t v14 = [(MOBundleContentExtractor *)self _extractPersonsFromBundle:v4];
  [(MOBundleContent *)v7 setPeopleClassification:[(MOBundleContentExtractor *)self _extractPeopleClassificationFromPersons:v14]];
  id v15 = [(MOBundleContentExtractor *)self _extractPersonNamesFromPersons:v14];
  [(MOBundleContent *)v7 setPersonNames:v15];

  id v16 = [(MOBundleContent *)v7 personNames];
  BOOL v17 = [v16 count] != 0;

  [(MOBundleContent *)v7 setHasPersonName:v17];
  [(MOBundleContentExtractor *)self _extractPlaceOrCityNameFromBundle:v4 forBundleContent:v7];
  [(MOBundleContentExtractor *)self _extractTimeReferenceFromBundle:v4 forBundleContent:v7];
  [(MOBundleContent *)v7 setPhotoTrait:[(MOBundleContentExtractor *)self _extractPhotoTraitFromBundle:v4]];
  [(MOBundleContentExtractor *)self _updateContextGoodnessScoreFromBundle:v4 forBundleContent:v7];
  if ([v4 interfaceType] != (id)4 && objc_msgSend(v4, "interfaceType") != (id)15)
  {
    id v18 = [v4 labels];
    id v19 = [v18 firstObject];
    [(MOBundleContent *)v7 setSuggestionLabel:v19];
  }
  [(MOBundleContentExtractor *)self _extractDominantMusicFromBundle:v4 forBundleContent:v7];

  return v7;
}

- (unint64_t)_extractPatternTypeFromBundle:(id)a3
{
  return [a3 bundleSubType] == (id)901;
}

- (void)_updateContextGoodnessScoreFromBundle:(id)a3 forBundleContent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOBundleContentExtractor _updateContextGoodnessScoreFromBundle:forBundleContent:](v6, v7);
  }

  uint64_t v9 = [v6 rankingDictionary];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v10 floatValue];
  [v7 setContextGoodnessScore:v11];

  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[MOBundleContentExtractor _updateContextGoodnessScoreFromBundle:forBundleContent:](v7);
  }

  if ([v7 photoTrait])
  {
    [v7 contextGoodnessScore];
    [v7 setContextGoodnessScore:v13 + 0.150000006];
  }
  if ([v7 placeType])
  {
    insignificantPlaceTypes = self->_insignificantPlaceTypes;
    id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 placeType]);
    LOBYTE(insignificantPlaceTypes) = [(NSArray *)insignificantPlaceTypes containsObject:v15];

    if ((insignificantPlaceTypes & 1) == 0)
    {
      [v7 contextGoodnessScore];
      [v7 setContextGoodnessScore:v16 + 0.0500000007];
    }
  }
  BOOL v17 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[MOBundleContentExtractor _updateContextGoodnessScoreFromBundle:forBundleContent:](v7, v17);
  }
}

- (unint64_t)_extractActivityTypeFromBundle:(id)a3
{
  id v3 = [a3 action];
  id v4 = v3;
  if (v3 && [v3 actionType] == (id)4)
  {
    id v5 = [v4 actionName];
    if (([v5 isEqualToString:@"walk"] & 1) != 0
      || (_HKWorkoutActivityNameForActivityType(),
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v7 = [v5 isEqualToString:v6],
          v6,
          (v7 & 1) != 0))
    {
      unint64_t v8 = 1;
    }
    else
    {
      uint64_t v9 = _HKWorkoutActivityNameForActivityType();
      if ([v5 isEqualToString:v9])
      {
      }
      else
      {
        uint64_t v10 = _HKWorkoutActivityNameForActivityType();
        unsigned __int8 v11 = [v5 isEqualToString:v10];

        if ((v11 & 1) == 0)
        {
          if (([v5 isEqualToString:@"cycle"] & 1) != 0
            || (_HKWorkoutActivityNameForActivityType(),
                id v12 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v13 = [v5 isEqualToString:v12],
                v12,
                (v13 & 1) != 0))
          {
            unint64_t v8 = 3;
          }
          else if (([v5 isEqualToString:@"run"] & 1) != 0 {
                 || (_HKWorkoutActivityNameForActivityType(),
          }
                     uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                     unsigned __int8 v15 = [v5 isEqualToString:v14],
                     v14,
                     (v15 & 1) != 0))
          {
            unint64_t v8 = 4;
          }
          else
          {
            BOOL v17 = _HKWorkoutActivityNameForActivityType();
            unsigned __int8 v18 = [v5 isEqualToString:v17];

            if (v18)
            {
              unint64_t v8 = 5;
            }
            else
            {
              id v19 = _HKWorkoutActivityNameForActivityType();
              unsigned __int8 v20 = [v5 isEqualToString:v19];

              if (v20)
              {
                unint64_t v8 = 6;
              }
              else
              {
                id v21 = _HKWorkoutActivityNameForActivityType();
                unsigned __int8 v22 = [v5 isEqualToString:v21];

                if (v22)
                {
                  unint64_t v8 = 7;
                }
                else
                {
                  long long v23 = _HKWorkoutActivityNameForActivityType();
                  unsigned __int8 v24 = [v5 isEqualToString:v23];

                  if (v24)
                  {
                    unint64_t v8 = 8;
                  }
                  else
                  {
                    long long v25 = _HKWorkoutActivityNameForActivityType();
                    unsigned int v26 = [v5 isEqualToString:v25];

                    if (v26) {
                      unint64_t v8 = 9;
                    }
                    else {
                      unint64_t v8 = 10;
                    }
                  }
                }
              }
            }
          }
          goto LABEL_17;
        }
      }
      unint64_t v8 = 2;
    }
LABEL_17:

    goto LABEL_18;
  }
  unint64_t v8 = 0;
LABEL_18:

  return v8;
}

- (unint64_t)_extractTimeFromBundle:(id)a3
{
  id v3 = [a3 metaData];
  id v4 = [v3 objectForKey:@"timeOfDay"];

  if (v4)
  {
    if ([v4 isEqualToString:@"morning"])
    {
      unint64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"afternoon"])
    {
      unint64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"evening"])
    {
      unint64_t v5 = 3;
    }
    else if ([v4 isEqualToString:@"night"])
    {
      unint64_t v5 = 4;
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)_extractPlaceTypeFromBundle:(id)a3
{
  id v3 = [a3 place];
  id v4 = v3;
  if (v3)
  {
    if ([v3 placeUserType] == (id)1)
    {
      unint64_t v5 = 16;
    }
    else if ([v4 placeUserType] == (id)2)
    {
      unint64_t v5 = 17;
    }
    else
    {
      id v6 = [v4 poiCategory];
      unsigned __int8 v7 = [v6 isEqualToString:GEOPOICategoryRestaurant];

      if (v7)
      {
        unint64_t v5 = 1;
      }
      else
      {
        unint64_t v8 = [v4 poiCategory];
        unsigned __int8 v9 = [v8 isEqualToString:GEOPOICategoryStore];

        if (v9)
        {
          unint64_t v5 = 2;
        }
        else
        {
          uint64_t v10 = [v4 poiCategory];
          unsigned __int8 v11 = [v10 isEqualToString:GEOPOICategoryHotel];

          if (v11)
          {
            unint64_t v5 = 3;
          }
          else
          {
            id v12 = [v4 poiCategory];
            unsigned __int8 v13 = [v12 isEqualToString:GEOPOICategoryAirport];

            if (v13)
            {
              unint64_t v5 = 4;
            }
            else
            {
              uint64_t v14 = [v4 poiCategory];
              unsigned __int8 v15 = [v14 isEqualToString:GEOPOICategoryPark];

              if (v15)
              {
                unint64_t v5 = 5;
              }
              else
              {
                double v16 = [v4 poiCategory];
                unsigned __int8 v17 = [v16 isEqualToString:GEOPOICategoryCafe];

                if (v17)
                {
                  unint64_t v5 = 6;
                }
                else
                {
                  unsigned __int8 v18 = [v4 poiCategory];
                  unsigned __int8 v19 = [v18 isEqualToString:GEOPOICategoryFoodMarket];

                  if (v19)
                  {
                    unint64_t v5 = 7;
                  }
                  else
                  {
                    unsigned __int8 v20 = [v4 poiCategory];
                    unsigned __int8 v21 = [v20 isEqualToString:GEOPOICategoryFitnessCenter];

                    if (v21)
                    {
                      unint64_t v5 = 8;
                    }
                    else
                    {
                      unsigned __int8 v22 = [v4 poiCategory];
                      unsigned __int8 v23 = [v22 isEqualToString:GEOPOICategoryUniversity];

                      if (v23)
                      {
                        unint64_t v5 = 9;
                      }
                      else
                      {
                        unsigned __int8 v24 = [v4 poiCategory];
                        unsigned __int8 v25 = [v24 isEqualToString:GEOPOICategorySchool];

                        if (v25)
                        {
                          unint64_t v5 = 10;
                        }
                        else
                        {
                          unsigned int v26 = [v4 poiCategory];
                          unsigned __int8 v27 = [v26 isEqualToString:GEOPOICategoryAmusementPark];

                          if (v27)
                          {
                            unint64_t v5 = 11;
                          }
                          else
                          {
                            long long v28 = [v4 poiCategory];
                            unsigned __int8 v29 = [v28 isEqualToString:GEOPOICategoryMovieTheater];

                            if (v29)
                            {
                              unint64_t v5 = 12;
                            }
                            else
                            {
                              long long v30 = [v4 poiCategory];
                              unsigned __int8 v31 = [v30 isEqualToString:GEOPOICategoryTheater];

                              if (v31)
                              {
                                unint64_t v5 = 13;
                              }
                              else
                              {
                                id v32 = [v4 poiCategory];
                                unsigned __int8 v33 = [v32 isEqualToString:GEOPOICategoryMuseum];

                                if (v33)
                                {
                                  unint64_t v5 = 14;
                                }
                                else
                                {
                                  id v34 = [v4 poiCategory];
                                  unsigned __int8 v35 = [v34 isEqualToString:GEOPOICategoryBeach];

                                  if (v35)
                                  {
                                    unint64_t v5 = 15;
                                  }
                                  else
                                  {
                                    uint64_t v36 = [v4 poiCategory];
                                    unsigned __int8 v37 = [v36 isEqualToString:GEOPOICategoryAquarium];

                                    if (v37)
                                    {
                                      unint64_t v5 = 18;
                                    }
                                    else
                                    {
                                      v38 = [v4 poiCategory];
                                      unsigned __int8 v39 = [v38 isEqualToString:GEOPOICategoryBakery];

                                      if (v39)
                                      {
                                        unint64_t v5 = 19;
                                      }
                                      else
                                      {
                                        v40 = [v4 poiCategory];
                                        unsigned __int8 v41 = [v40 isEqualToString:GEOPOICategoryBrewery];

                                        if (v41)
                                        {
                                          unint64_t v5 = 20;
                                        }
                                        else
                                        {
                                          id v42 = [v4 poiCategory];
                                          unsigned __int8 v43 = [v42 isEqualToString:GEOPOICategoryCampground];

                                          if (v43)
                                          {
                                            unint64_t v5 = 21;
                                          }
                                          else
                                          {
                                            id v44 = [v4 poiCategory];
                                            unsigned __int8 v45 = [v44 isEqualToString:GEOPOICategoryFireStation];

                                            if (v45)
                                            {
                                              unint64_t v5 = 22;
                                            }
                                            else
                                            {
                                              v46 = [v4 poiCategory];
                                              unsigned __int8 v47 = [v46 isEqualToString:GEOPOICategoryLibrary];

                                              if (v47)
                                              {
                                                unint64_t v5 = 23;
                                              }
                                              else
                                              {
                                                v48 = [v4 poiCategory];
                                                unsigned __int8 v49 = [v48 isEqualToString:GEOPOICategoryMarina];

                                                if (v49)
                                                {
                                                  unint64_t v5 = 24;
                                                }
                                                else
                                                {
                                                  id v50 = [v4 poiCategory];
                                                  unsigned __int8 v51 = [v50 isEqualToString:GEOPOICategoryNationalPark];

                                                  if (v51)
                                                  {
                                                    unint64_t v5 = 25;
                                                  }
                                                  else
                                                  {
                                                    id v52 = [v4 poiCategory];
                                                    unsigned __int8 v53 = [v52 isEqualToString:GEOPOICategoryNightlife];

                                                    if (v53)
                                                    {
                                                      unint64_t v5 = 26;
                                                    }
                                                    else
                                                    {
                                                      v54 = [v4 poiCategory];
                                                      unsigned __int8 v55 = [v54 isEqualToString:GEOPOICategoryPlayground];

                                                      if (v55)
                                                      {
                                                        unint64_t v5 = 27;
                                                      }
                                                      else
                                                      {
                                                        id v56 = [v4 poiCategory];
                                                        unsigned __int8 v57 = [v56 isEqualToString:GEOPOICategoryStadium];

                                                        if (v57)
                                                        {
                                                          unint64_t v5 = 28;
                                                        }
                                                        else
                                                        {
                                                          v58 = [v4 poiCategory];
                                                          unsigned __int8 v59 = [v58 isEqualToString:GEOPOICategoryWinery];

                                                          if (v59)
                                                          {
                                                            unint64_t v5 = 29;
                                                          }
                                                          else
                                                          {
                                                            v60 = [v4 poiCategory];
                                                            unsigned __int8 v61 = [v60 isEqualToString:GEOPOICategoryZoo];

                                                            if (v61)
                                                            {
                                                              unint64_t v5 = 30;
                                                            }
                                                            else
                                                            {
                                                              id v62 = [v4 poiCategory];
                                                              unsigned __int8 v63 = [v62 isEqualToString:GEOPOICategoryGolf];

                                                              if (v63)
                                                              {
                                                                unint64_t v5 = 31;
                                                              }
                                                              else
                                                              {
                                                                long long v64 = [v4 poiCategory];
                                                                unsigned __int8 v65 = [v64 isEqualToString:GEOPOICategoryMiniGolf];

                                                                if (v65)
                                                                {
                                                                  unint64_t v5 = 32;
                                                                }
                                                                else
                                                                {
                                                                  long long v66 = [v4 poiCategory];
                                                                  unsigned __int8 v67 = [v66 isEqualToString:GEOPOICategoryBowling];

                                                                  if (v67)
                                                                  {
                                                                    unint64_t v5 = 33;
                                                                  }
                                                                  else
                                                                  {
                                                                    long long v68 = [v4 poiCategory];
                                                                    unsigned __int8 v69 = [v68 isEqualToString:GEOPOICategoryPlanetarium];

                                                                    if (v69)
                                                                    {
                                                                      unint64_t v5 = 34;
                                                                    }
                                                                    else
                                                                    {
                                                                      long long v70 = [v4 poiCategory];
                                                                      unsigned __int8 v71 = [v70 isEqualToString:GEOPOICategoryBaseball];

                                                                      if (v71)
                                                                      {
                                                                        unint64_t v5 = 35;
                                                                      }
                                                                      else
                                                                      {
                                                                        long long v72 = [v4 poiCategory];
                                                                        unsigned __int8 v73 = [v72 isEqualToString:GEOPOICategoryBasketball];

                                                                        if (v73)
                                                                        {
                                                                          unint64_t v5 = 36;
                                                                        }
                                                                        else
                                                                        {
                                                                          long long v74 = [v4 poiCategory];
                                                                          unsigned int v75 = [v74 isEqualToString:GEOPOICategoryNationalMonument];

                                                                          if (v75) {
                                                                            unint64_t v5 = 37;
                                                                          }
                                                                          else {
                                                                            unint64_t v5 = 0;
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)_extractBundleTypeFromBundle:(id)a3
{
  id v3 = [a3 bundleSubType];
  unint64_t result = 1;
  switch((unint64_t)v3)
  {
    case 'e':
    case 'j':
      return result;
    case 'f':
      goto LABEL_5;
    case 'g':
      unint64_t result = 4;
      break;
    case 'h':
      unint64_t result = 3;
      break;
    case 'i':
      unint64_t result = 2;
      break;
    default:
      if (v3 != (id)901 && v3 != (id)905)
      {
LABEL_5:
        unint64_t v5 = (unint64_t)v3 - 501;
        BOOL v6 = v3 == (id)301;
        unint64_t v7 = 6;
        if (!v6) {
          unint64_t v7 = 0;
        }
        if (v5 >= 3) {
          unint64_t result = v7;
        }
        else {
          unint64_t result = 5;
        }
      }
      break;
  }
  return result;
}

- (unint64_t)_extractPeopleClassificationFromPersons:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    unint64_t v5 = [v4 firstObject];
    unint64_t v6 = +[MOClusteringUtility getTheBestPersonRelationtshipTagFor:v5];
    if (v6 < 2) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = [(MOBundleContentExtractor *)self _findMatchingMetaDataWithPeopleClassification:v6];
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)_findMatchingMetaDataWithPeopleClassification:(unint64_t)a3
{
  unint64_t v3 = 3;
  if (a3 - 15 >= 3) {
    unint64_t v3 = 0;
  }
  int64x2_t v4 = (int64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(a3), (int8x16_t)xmmword_10009B140);
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(vdupq_lane_s64(v4.i64[0], 0), (int64x2_t)xmmword_10009B150), (int32x4_t)vceqq_s64(vdupq_laneq_s64(v4, 1), (int64x2_t)xmmword_10009B160)))) & 1 | (a3 == 20))unint64_t v3 = 1; {
  if (a3 == 21)
  }
    unint64_t v3 = 2;
  if (a3 == 22) {
    unint64_t v3 = 4;
  }
  if (a3 - 27 >= 3) {
    return v3;
  }
  else {
    return 5;
  }
}

- (id)_extractPersonsFromBundle:(id)a3
{
  id v3 = a3;
  int64x2_t v4 = objc_opt_new();
  unint64_t v5 = [v3 persons];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = [v3 persons];
    unint64_t v8 = [v7 sortedArrayUsingSelector:"comparePersons:"];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint32_t v12 = 0;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v9);
          }
          unsigned __int8 v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isMePerson", (void)v22) & 1) == 0)
          {
            if (([v15 mePersonIdentified] & 1) != 0
              || ([v15 localIdentifier],
                  double v16 = objc_claimAutoreleasedReturnValue(),
                  v16,
                  !v16))
            {
              [v4 addObject:v15];
              ++v12;
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
    else
    {
      uint32_t v12 = 0;
    }
  }
  else
  {
    uint32_t v12 = 0;
  }
  unsigned __int8 v17 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[MOBundleContentExtractor _extractPersonsFromBundle:](v4, v3);
  }

  if (v12 < 2)
  {
    unsigned __int8 v19 = v4;
  }
  else
  {
    unsigned __int8 v18 = [v4 objectAtIndex:arc4random_uniform(v12)];
    unsigned __int8 v19 = +[NSMutableArray arrayWithObject:v18];

    unsigned __int8 v20 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[MOBundleContentExtractor _extractPersonsFromBundle:](v19);
    }
  }
  return v19;
}

- (id)_extractPersonNamesFromPersons:(id)a3
{
  id v3 = a3;
  int64x2_t v4 = objc_opt_new();
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "name", (void)v15);
          id v12 = [v11 length];

          if (v12)
          {
            uint64_t v13 = [v10 name];
            [v4 addObject:v13];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (void)_extractPlaceOrCityNameFromBundle:(id)a3 forBundleContent:(id)a4
{
  id v26 = a3;
  id v5 = a4;
  id v6 = +[NSSet setWithArray:&off_1000B8060];
  [v5 setHasPlaceName:0];
  [v5 setHasCityName:0];
  if ([v26 interfaceType] != (id)2
    && [v26 interfaceType] != (id)12
    && [v26 interfaceType] != (id)15)
  {
    if ([v26 interfaceType] != (id)13) {
      goto LABEL_20;
    }
    long long v22 = [v26 place];
    long long v23 = [v22 placeName];

    if (!v23) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  id v7 = [v26 place];
  uint64_t v8 = [v7 placeName];
  if (!v8)
  {
LABEL_9:

    goto LABEL_10;
  }
  id v9 = (void *)v8;
  id v10 = [v26 place];
  id v11 = [v10 poiCategory];
  if (![v6 containsObject:v11])
  {
LABEL_8:

    goto LABEL_9;
  }
  id v12 = [v26 place];
  if ([v12 placeType] == (id)4)
  {

    goto LABEL_8;
  }
  unsigned __int8 v20 = [v26 place];
  id v21 = [v20 placeType];

  if (v21 != (id)5)
  {
LABEL_19:
    long long v24 = [v26 place];
    long long v25 = [v24 placeName];
    [v5 setPlaceName:v25];

    [v5 setHasPlaceName:1];
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v13 = [v26 place];
  uint64_t v14 = [v13 enclosingArea];

  if (v14)
  {
    long long v15 = [v26 place];
    if ([v15 placeType] == (id)101)
    {
    }
    else
    {
      long long v16 = [v26 place];
      id v17 = [v16 placeType];

      if (v17 != (id)102)
      {
        long long v18 = [v26 place];
        unsigned __int8 v19 = [v18 enclosingArea];
        [v5 setCityName:v19];

        [v5 setHasCityName:1];
      }
    }
  }
LABEL_20:
}

- (void)_extractTimeReferenceFromBundle:(id)a3 forBundleContent:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  id v6 = +[NSSet setWithArray:&off_1000B8078];
  [v9 setHasTimeReference:0];
  id v7 = [v5 metaData];

  uint64_t v8 = [v7 objectForKey:@"time"];

  if (v8 && [v6 containsObject:v8])
  {
    [v9 setTimeReference:v8];
    [v9 setHasTimeReference:1];
  }
}

- (unint64_t)_extractPhotoTraitFromBundle:(id)a3
{
  id v4 = a3;
  if ([v4 interfaceType] == (id)13
    || ([v4 photoTraits],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        !v6))
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = [(MOBundleContentExtractor *)self _findFirstMatchingCuratedPhotoTraitSetForBundle:v4];
  }

  return v7;
}

- (unint64_t)_findFirstMatchingCuratedPhotoTraitSetForBundle:(id)a3
{
  id v31 = a3;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = self->_curatedPhotoTraitsList;
  id v30 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v30)
  {
    unint64_t v27 = 0;
    uint64_t v29 = *(void *)v53;
LABEL_3:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v53 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v32 = v4;
      id v5 = *(void **)(*((void *)&v52 + 1) + 8 * v4);
      id v34 = [v5 allKeys];
      uint64_t v6 = [v34 firstObject];
      v38 = [v5 objectForKey:v6];
      unint64_t v7 = objc_opt_new();
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v8 = [v31 photoTraits];
      id v9 = [v8 countByEnumeratingWithState:&v48 objects:v60 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v49;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v49 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [*(id *)(*((void *)&v48 + 1) + 8 * i) name];
            [v7 addObject:v13];
          }
          id v10 = [v8 countByEnumeratingWithState:&v48 objects:v60 count:16];
        }
        while (v10);
      }
      unsigned __int8 v33 = (void *)v6;

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v36 = v7;
      id v39 = [v36 countByEnumeratingWithState:&v44 objects:v59 count:16];
      int v14 = 0;
      if (v39)
      {
        uint64_t v37 = *(void *)v45;
        do
        {
          for (j = 0; j != v39; j = (char *)j + 1)
          {
            if (*(void *)v45 != v37) {
              objc_enumerationMutation(v36);
            }
            long long v16 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v17 = v38;
            id v18 = [v17 countByEnumeratingWithState:&v40 objects:v58 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v41;
              do
              {
                for (k = 0; k != v19; k = (char *)k + 1)
                {
                  if (*(void *)v41 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  if (![*(id *)(*((void *)&v40 + 1) + 8 * (void)k) caseInsensitiveCompare:v16])
                  {
                    long long v22 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      unsigned __int8 v57 = v16;
                      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Match found for trait, %@", buf, 0xCu);
                    }
                    ++v14;
                  }
                }
                id v19 = [v17 countByEnumeratingWithState:&v40 objects:v58 count:16];
              }
              while (v19);
            }
          }
          id v39 = [v36 countByEnumeratingWithState:&v44 objects:v59 count:16];
        }
        while (v39);
      }

      id v23 = [v38 count];
      if (v23 == (id)v14)
      {
        signed int v24 = [v33 intValue];
        long long v25 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          unsigned __int8 v57 = v33;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Setting trait meta data for %@", buf, 0xCu);
        }
        unint64_t v27 = v24;
      }
      if (v23 == (id)v14) {
        break;
      }
      uint64_t v4 = v32 + 1;
      if ((id)(v32 + 1) == v30)
      {
        id v30 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v30) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v27 = 0;
  }

  return v27;
}

- (id)_extractDictionaryFromBundle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 interfaceType];
  if (v5 > 0xD || ((1 << v5) & 0x3016) == 0)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = [(MOBundleContentExtractor *)self _extractContentFromOutingBundle:v4];
  }
  uint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOBundleContentExtractor _extractDictionaryFromBundle:]();
  }

  return v7;
}

- (id)_extractContentFromOutingBundle:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  unint64_t v5 = [v3 metaData];
  uint64_t v6 = [v5 objectForKey:@"date_string"];

  if (v6) {
    [v4 setObject:v6 forKey:@"date_string"];
  }
  unint64_t v7 = [v3 metaData];
  uint64_t v8 = [v7 objectForKey:@"date_reference_weekday_string"];

  if (v8) {
    [v4 setObject:v8 forKey:@"date_reference_weekday_string"];
  }
  id v9 = [v3 metaData];
  id v10 = [v9 objectForKey:@"timeOfDay"];

  if (v10) {
    [v4 setObject:v10 forKey:@"timeOfDay"];
  }
  uint64_t v11 = [v3 metaData];
  id v12 = [v11 objectForKey:@"action"];

  if (v12) {
    [v4 setObject:v12 forKey:@"action"];
  }
  uint64_t v13 = [v3 place];
  int v14 = [v13 placeName];

  if (v14) {
    [v4 setObject:v14 forKey:@"place name"];
  }
  long long v15 = [v3 place];
  long long v16 = [v15 poiCategory];

  if (v16) {
    [v4 setObject:v16 forKey:@"place category"];
  }
  id v17 = [v3 place];
  if ([v17 placeType] != (id)101)
  {
    [v3 place];
    id v30 = v16;
    id v18 = v14;
    id v19 = v4;
    uint64_t v20 = v12;
    id v21 = v10;
    long long v22 = v8;
    v24 = id v23 = v6;
    id v25 = [v24 placeType];

    uint64_t v6 = v23;
    uint64_t v8 = v22;
    id v10 = v21;
    id v12 = v20;
    id v4 = v19;
    int v14 = v18;
    long long v16 = v30;

    if (v25 == (id)102) {
      goto LABEL_18;
    }
    id v26 = [v3 place];
    id v17 = [v26 enclosingArea];

    if (v17) {
      [v4 setObject:v17 forKey:@"location"];
    }
  }

LABEL_18:
  unint64_t v27 = [v3 labels];
  long long v28 = [v27 firstObject];

  if (v28) {
    [v4 setObject:v28 forKey:@"label"];
  }

  return v4;
}

- (id)_sortedBundleBasedOnGoodnessScore:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global];
    }
    unint64_t v5 = v4;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

int64_t __62__MOBundleContentExtractor__sortedBundleBasedOnGoodnessScore___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  id v4 = a3;
  unint64_t v5 = [(MOEventBundle *)a2 rankingDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v6 floatValue];
  float v8 = v7;

  id v9 = [(MOEventBundle *)v4 rankingDictionary];

  id v10 = [v9 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v10 floatValue];
  float v12 = v11;

  if (v8 <= v12) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)_sortedBundleContextFromUpdatedGoodnessScore:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2) {
    id v3 = [v4 sortedArrayUsingComparator:&__block_literal_global_1490];
  }
}

int64_t __73__MOBundleContentExtractor__sortedBundleContextFromUpdatedGoodnessScore___block_invoke(id a1, MOBundleContent *a2, MOBundleContent *a3)
{
  id v4 = a3;
  [(MOBundleContent *)a2 contextGoodnessScore];
  float v6 = v5;
  [(MOBundleContent *)v4 contextGoodnessScore];
  double v8 = v7;

  float v9 = v8;
  if (v6 <= v9) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)_extractDominantMusicFromBundle:(id)a3 forBundleContent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(MOBundleContentExtractor *)self metaDataAllowListForSongTitleArtistInclusionActivityType];
  float v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 activityType]);
  if ([v8 containsObject:v9]) {
    goto LABEL_6;
  }
  id v10 = [(MOBundleContentExtractor *)self metaDataAllowListForSongTitleArtistInclusionPlaceType];
  float v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 placeType]);
  if ([v10 containsObject:v11])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  float v12 = [(MOBundleContentExtractor *)self metaDataAllowListForSongTitleArtistInclusionBundleType];
  uint64_t v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 bundleType]);
  if ([v12 containsObject:v13])
  {

    goto LABEL_5;
  }
  long long v28 = [(MOBundleContentExtractor *)self metaDataAllowListForSongTitleArtistInclusionPhotoTrait];
  uint64_t v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 photoTrait]);
  unsigned __int8 v30 = [v28 containsObject:v29];

  if ((v30 & 1) == 0)
  {
    id v26 = 0;
    id v25 = 0;
    signed int v24 = 0;
    goto LABEL_14;
  }
LABEL_7:
  int v14 = +[NSPredicate predicateWithFormat:@"type == %lu", 3];
  id v15 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"priorityScore" ascending:1];
  long long v16 = [v6 resources];
  id v17 = [v16 filteredArrayUsingPredicate:v14];

  id v37 = v15;
  id v18 = +[NSArray arrayWithObjects:&v37 count:1];
  id v19 = [v17 sortedArrayUsingDescriptors:v18];

  if ([v19 count])
  {
    uint64_t v20 = [v19 firstObject];
    id v21 = [v20 data];
    long long v22 = +[MODictionaryEncoder decodeToDictionary:v21];

    id v23 = [v22 objectForKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
    LODWORD(v20) = [v23 isEqualToString:@"com.apple.Music"];

    if (v20)
    {
      signed int v24 = [v22 objectForKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerTitle"];
      id v25 = [v22 objectForKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerArtist"];
      id v26 = [v22 objectForKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerTrackID"];
    }
    else
    {
      id v26 = 0;
      id v25 = 0;
      signed int v24 = 0;
    }
  }
  else
  {
    id v26 = 0;
    id v25 = 0;
    signed int v24 = 0;
  }

LABEL_14:
  [v7 setMusicSuggestionSongTitle:v24];
  [v7 setMusicSuggestionArtistName:v25];
  [v7 setMusicSuggestionTrackID:v26];
  unint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = v24;
    __int16 v33 = 2112;
    id v34 = v25;
    __int16 v35 = 2112;
    id v36 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Extract music suggestion for bundle content, song title: %@, artist name: %@, trackID: %@", buf, 0x20u);
  }
}

- (void)_addContentRatingForSongTitleAndArtistSuggestions:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  double v5 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
  uint64_t v32 = v4;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      float v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v9);
        float v11 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          id v19 = [v10 musicSuggestionSongTitle];
          uint64_t v20 = [v10 musicSuggestionArtistName];
          id v21 = [v10 musicSuggestionTrackID];
          *(_DWORD *)buf = 138412802;
          id v44 = v19;
          __int16 v45 = 2112;
          long long v46 = v20;
          __int16 v47 = 2112;
          long long v48 = v21;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Music suggestion bundle content for content rating look up, song title: %@, artist name: %@, trackID: %@", buf, 0x20u);

          id v4 = v32;
        }

        float v12 = [v10 musicSuggestionTrackID];

        if (v12)
        {
          uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[MOBundleContentExtractor _addContentRatingForSongTitleAndArtistSuggestions:](v41, v10, &v42, v13);
          }

          int v14 = [v10 musicSuggestionTrackID];
          [v4 addObject:v14];

          id v15 = [v10 musicSuggestionTrackID];
          long long v16 = [v5 valueForKey:v15];

          if (v16)
          {
            id v17 = [v10 musicSuggestionTrackID];
            id v18 = [v5 objectForKeyedSubscript:v17];
            [v18 addObject:v10];
          }
          else
          {
            id v17 = objc_opt_new();
            [v17 addObject:v10];
            id v18 = [v10 musicSuggestionTrackID];
            [v5 setObject:v17 forKey:v18];
          }
        }
        float v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v7);
  }

  long long v22 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = [v4 count];
    *(_DWORD *)buf = 134217984;
    id v44 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Fetch content rating, track id set count: %lu", buf, 0xCu);
  }

  if ([v4 count])
  {
    signed int v24 = +[AMSBag bagForProfile:@"MomentsUIService" profileVersion:@"1"];
    id v25 = [objc_alloc((Class)AMSMediaTask) initWithType:203 clientIdentifier:@"com.apple.PersonalizedSensingService" clientVersion:@"1" bag:v24];
    id v26 = [v4 allObjects];
    [v25 setItemIdentifiers:v26];
    unint64_t v27 = [v25 perform];
    dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __78__MOBundleContentExtractor__addContentRatingForSongTitleAndArtistSuggestions___block_invoke;
    v34[3] = &unk_1000A4BA8;
    id v35 = v5;
    uint64_t v29 = v28;
    id v36 = v29;
    [v27 addFinishBlock:v34];
    dispatch_time_t v30 = dispatch_time(0, 120000000000);
    if (dispatch_semaphore_wait(v29, v30))
    {
      id v31 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[MOBundleContentExtractor _addContentRatingForSongTitleAndArtistSuggestions:](v31);
      }
    }
    id v4 = v32;
  }
}

void __78__MOBundleContentExtractor__addContentRatingForSongTitleAndArtistSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    double v5 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __78__MOBundleContentExtractor__addContentRatingForSongTitleAndArtistSuggestions___block_invoke_cold_1();
    }
  }
  else
  {
    double v5 = [a2 responseDataItems];
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fetching music content rating", buf, 2u);
    }

    if ([v5 count])
    {
      unint64_t v7 = 0;
      uint64_t v20 = v5;
      do
      {
        uint64_t v8 = [v5 objectAtIndexedSubscript:v7];
        id v26 = [v8 objectForKey:@"id"];
        float v9 = [v8 objectForKey:@"attributes"];
        if (v9)
        {
          signed int v24 = v8;
          id v10 = v9;
          float v11 = [v9 objectForKey:@"contentRating"];
          id v23 = v10;
          id v25 = [v10 objectForKey:@"artistName"];
          float v12 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            __int16 v33 = v25;
            __int16 v34 = 2112;
            id v35 = v26;
            __int16 v36 = 2112;
            long long v37 = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Fetch content rating, artist name, %@, song ID, %@, contentRating, %@", buf, 0x20u);
          }

          if (([v11 isEqualToString:@"explicit"] & 1) == 0)
          {
            long long v22 = v11;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v26];
            id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (v14)
            {
              id v15 = v14;
              uint64_t v16 = *(void *)v28;
              do
              {
                for (i = 0; i != v15; i = (char *)i + 1)
                {
                  if (*(void *)v28 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                  [v18 setMusicSuggestionContentRating:@"not explicit"];
                  id v19 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    __int16 v33 = v18;
                    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Fetch content rating, successfully updated content rating for bundle content: %@", buf, 0xCu);
                  }
                }
                id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
              }
              while (v15);
            }

            double v5 = v20;
            float v11 = v22;
          }

          float v9 = v23;
          uint64_t v8 = v24;
        }

        ++v7;
      }
      while ((unint64_t)[v5 count] > v7);
      id v4 = 0;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)insignificantPlaceTypes
{
  return &off_1000B8090;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)bundleFetchQueue
{
  return self->_bundleFetchQueue;
}

- (NSArray)curatedPhotoTraitsList
{
  return self->_curatedPhotoTraitsList;
}

- (NSSet)metaDataAllowListForSongTitleArtistInclusionActivityType
{
  return self->_metaDataAllowListForSongTitleArtistInclusionActivityType;
}

- (NSSet)metaDataAllowListForSongTitleArtistInclusionPlaceType
{
  return self->_metaDataAllowListForSongTitleArtistInclusionPlaceType;
}

- (NSSet)metaDataAllowListForSongTitleArtistInclusionBundleType
{
  return self->_metaDataAllowListForSongTitleArtistInclusionBundleType;
}

- (NSSet)metaDataAllowListForSongTitleArtistInclusionPhotoTrait
{
  return self->_metaDataAllowListForSongTitleArtistInclusionPhotoTrait;
}

- (MOPromptManager)promptManager
{
  return self->_promptManager;
}

- (MOContextConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (NSArray)insignificantPlaceTypes
{
  return self->_insignificantPlaceTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insignificantPlaceTypes, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_promptManager, 0);
  objc_storeStrong((id *)&self->_metaDataAllowListForSongTitleArtistInclusionPhotoTrait, 0);
  objc_storeStrong((id *)&self->_metaDataAllowListForSongTitleArtistInclusionBundleType, 0);
  objc_storeStrong((id *)&self->_metaDataAllowListForSongTitleArtistInclusionPlaceType, 0);
  objc_storeStrong((id *)&self->_metaDataAllowListForSongTitleArtistInclusionActivityType, 0);
  objc_storeStrong((id *)&self->_curatedPhotoTraitsList, 0);
  objc_storeStrong((id *)&self->_bundleFetchQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __139__MOBundleContentExtractor__extractContentsFromBundleStartDate_endDate_daysPerFetch_significantLocationEnabled_partialResults_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "no bundle context is extracted due to fetchError, %@", v2, v3, v4, v5, v6);
}

- (void)_fetchEventBundlesWithStartDate:(os_log_t)log EndDate:SignificantLocationEnabled:Handler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "promptManager failed to be initiated", v1, 2u);
}

void __103__MOBundleContentExtractor__fetchEventBundlesWithStartDate_EndDate_SignificantLocationEnabled_Handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetchEventBundlesWithOptions, fetchError, %@", v2, v3, v4, v5, v6);
}

- (void)_updateContextGoodnessScoreFromBundle:(void *)a1 forBundleContent:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  [a1 contextGoodnessScore];
  int v5 = 134218496;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  id v8 = [a1 photoTrait];
  __int16 v9 = 2048;
  id v10 = [a1 placeType];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, " contextGoodnessScore=%.3f, photoTrait=%lu, placeType=%lu", (uint8_t *)&v5, 0x20u);
}

- (void)_updateContextGoodnessScoreFromBundle:(void *)a1 forBundleContent:.cold.2(void *a1)
{
  [a1 contextGoodnessScore];
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v1, v2, " BundleGoodnessScore=%.3f", v3, v4, v5, v6, 0);
}

- (void)_updateContextGoodnessScoreFromBundle:(void *)a1 forBundleContent:(void *)a2 .cold.3(void *a1, void *a2)
{
  uint64_t v3 = [a1 description];
  uint64_t v4 = [a2 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4((void *)&_mh_execute_header, v5, v6, " Current bundle:%{private}@. Content:%{private}@ ", v7, v8, v9, v10, v11);
}

- (void)_extractPersonsFromBundle:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 valueForKey:@"name"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "Randomly selected person %{private}@ from persons", v4, v5, v6, v7, v8);
}

- (void)_extractPersonsFromBundle:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v3 = [a1 valueForKey:@"name"];
  uint64_t v4 = [a2 suggestionID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4((void *)&_mh_execute_header, v5, v6, "Extracted the following persons : %{private}@ , from the bundle suggestionID : %{private}@ ", v7, v8, v9, v10, v11);
}

- (void)_extractDictionaryFromBundle:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#bundlecuration, extracted bundle content, %@", v1, 0xCu);
}

- (void)_addContentRatingForSongTitleAndArtistSuggestions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fetch music content rating task timed out", v1, 2u);
}

- (void)_addContentRatingForSongTitleAndArtistSuggestions:(void *)a3 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 musicSuggestionTrackID];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Adding track ID to set, id: %@", a1, 0xCu);
}

void __78__MOBundleContentExtractor__addContentRatingForSongTitleAndArtistSuggestions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fail to fetch content rating for music tracks with error: %@", v2, v3, v4, v5, v6);
}

@end