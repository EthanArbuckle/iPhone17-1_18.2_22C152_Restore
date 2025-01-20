@interface TMLMarkdownParser
+ (id)parse:(id)a3 tags:(id *)a4 withRules:(id)a5;
+ (id)postProcessString:(id)a3;
+ (id)preProcessString:(id)a3;
+ (id)regexFromRules:(id)a3;
+ (id)stringOfTagType:(id)a3 andCount:(unint64_t)a4;
+ (id)unescapeString:(id)a3;
- (BOOL)isListTagOpen:(id)a3;
- (TMLMarkdownParser)init;
- (id)parse:(id)a3 tags:(id *)a4;
- (id)replacestring:(id)a3 usingRule:(id)a4 atIndex:(unint64_t)a5 additonalRules:(BOOL)a6;
- (id)tagFromType:(int)a3;
@end

@implementation TMLMarkdownParser

- (TMLMarkdownParser)init
{
  v19.receiver = self;
  v19.super_class = (Class)TMLMarkdownParser;
  v2 = [(TMLMarkdownParser *)&v19 init];
  v3 = v2;
  if (v2)
  {
    rules = v2->_rules;
    v2->_rules = (NSArray *)&unk_26ED1B510;

    v5 = objc_opt_class();
    uint64_t v8 = objc_msgSend_regexFromRules_(v5, v6, v7, v3->_rules);
    regex = v3->_regex;
    v3->_regex = (NSArray *)v8;

    uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v10, v11);
    attributes = v3->_attributes;
    v3->_attributes = (NSMutableDictionary *)v12;

    uint64_t v16 = objc_msgSend_mutableCopy(&unk_26ED1B300, v14, v15);
    tag = v3->_tag;
    v3->_tag = (NSMutableDictionary *)v16;
  }
  return v3;
}

+ (id)regexFromRules:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);
  v10 = objc_msgSend_arrayWithCapacity_(v3, v8, v9, v7);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2398538B0;
  v15[3] = &unk_264DADA08;
  id v11 = v10;
  id v16 = v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v12, v13, v15);

  return v11;
}

+ (id)unescapeString:(id)a3
{
  id v4 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, v3, @"\\n", @"\n");
  uint64_t v7 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, v6, @"\\t", @"\t");

  v10 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, v9, @"\\\\", @"\\");

  double v13 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, v12, @"\\\", @"\");

  id v16 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, v15, @"\n\n", @"\n[emptyTag][/emptyTag]\n");

  objc_super v19 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v16, v17, v18, @"\n\n", @"\n[emptyTag][/emptyTag]\n");

  v22 = (__CFString *)objc_msgSend_mutableCopy(v19, v20, v21);
  if (CFStringTransform(v22, 0, @"Any-Hex/Java", 1u))
  {
    uint64_t v25 = objc_msgSend_copy(v22, v23, v24);

    objc_super v19 = (void *)v25;
  }

  return v19;
}

+ (id)preProcessString:(id)a3
{
  id v4 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, v3, @"\\_", @"kTMLMarkdownParserEscapedUnderscore");
  uint64_t v7 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, v6, @"\\*", @"kTMLMarkdownParserEscapedStar");

  v10 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, v9, @"\\^", @"kTMLMarkdownParserEscapedCarrot");

  double v13 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, v12, @"\\.", @"kTMLMarkdownParserEscapedPeriod");

  id v16 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, v15, @"\\+", @"kTMLMarkdownParserEscapedPlus");

  objc_super v19 = (__CFString *)objc_msgSend_mutableCopy(v16, v17, v18);
  if (CFStringTransform(v19, 0, @"Any-Hex/Java", 1u))
  {
    uint64_t v22 = objc_msgSend_copy(v19, v20, v21);

    id v16 = (void *)v22;
  }

  return v16;
}

+ (id)postProcessString:(id)a3
{
  id v4 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, v3, @"kTMLMarkdownParserEscapedUnderscore", @"_");
  uint64_t v7 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, v6, @"kTMLMarkdownParserEscapedStar", @"*");

  v10 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, v9, @"kTMLMarkdownParserEscapedCarrot", @"^");

  double v13 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, v12, @"kTMLMarkdownParserEscapedPeriod", @".");

  id v16 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, v15, @"kTMLMarkdownParserEscapedPlus", @"+");

  objc_super v19 = (__CFString *)objc_msgSend_mutableCopy(v16, v17, v18);
  if (CFStringTransform(v19, 0, @"Any-Hex/Java", 1u))
  {
    uint64_t v22 = objc_msgSend_copy(v19, v20, v21);

    id v16 = (void *)v22;
  }

  return v16;
}

- (id)parse:(id)a3 tags:(id *)a4
{
  id v5 = a3;
  objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v6, v7, v5);
  uint64_t v8 = (NSScanner *)objc_claimAutoreleasedReturnValue();
  scanner = self->_scanner;
  self->_scanner = v8;

  v49 = objc_msgSend_newlineCharacterSet(MEMORY[0x263F08708], v10, v11);
  objc_msgSend_setCharactersToBeSkipped_(self->_scanner, v12, v13);
  id v14 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v17 = objc_msgSend_length(v5, v15, v16);
  v20 = objc_msgSend_initWithCapacity_(v14, v18, (double)(unint64_t)v17 * 1.25, (unint64_t)((double)(unint64_t)v17 * 1.25));
  double v21 = 0;
  v60[0] = 0;
  v60[1] = v60;
  uint64_t v22 = 0x2020000000;
  v60[2] = 0x2020000000;
  char v61 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  char v59 = 0;
  while (1)
  {
    v23 = self->_scanner;
    id v57 = v21;
    int v24 = objc_msgSend_scanUpToCharactersFromSet_intoString_(v23, v19, *(double *)&v22, v49, &v57);
    id v25 = v57;

    if (!v24) {
      break;
    }
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = sub_239854048;
    v55 = sub_239854058;
    id v56 = (id)objc_msgSend_mutableCopy(v25, v26, v27);
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = sub_239854060;
    v50[3] = &unk_264DADA58;
    v50[4] = self;
    v50[5] = &v51;
    v50[6] = v58;
    v50[7] = v60;
    v50[8] = a4;
    v28 = (void (**)(void, void, void))MEMORY[0x23ECA7DD0](v50);
    ((void (**)(void, NSArray *, void))v28)[2](v28, self->_rules, 0);
    ((void (**)(void, NSArray *, uint64_t))v28)[2](v28, self->_extraRules, 1);
    if (objc_msgSend_isListTagOpen_(self, v29, v30, v52[5]))
    {
      objc_msgSend_appendString_(v20, v31, v32, @"[/li]");
      objc_msgSend_setObject_forKeyedSubscript_(self->_tag, v33, v34, MEMORY[0x263EFFA80], @"open");
      objc_msgSend_setObject_forKeyedSubscript_(self->_tag, v35, v36, &unk_26ED19A48, @"count");
    }
    objc_msgSend_appendString_(v20, v31, v32, v52[5]);
    if (objc_msgSend_isAtEnd(self->_scanner, v37, v38))
    {
      v41 = objc_msgSend_objectForKeyedSubscript_(self->_tag, v39, v40, @"open");
      int v44 = objc_msgSend_BOOLValue(v41, v42, v43);

      if (v44) {
        objc_msgSend_appendString_(v20, v39, v40, @"[/li]");
      }
    }
    if ((objc_msgSend_isAtEnd(self->_scanner, v39, v40) & 1) == 0) {
      objc_msgSend_appendString_(v20, v45, v46, @"\n");
    }

    _Block_object_dispose(&v51, 8);
    double v21 = v25;
  }
  objc_msgSend_addEntriesFromDictionary_(*a4, v26, v27, self->_attributes);
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);

  return v20;
}

- (id)replacestring:(id)a3 usingRule:(id)a4 atIndex:(unint64_t)a5 additonalRules:(BOOL)a6
{
  BOOL v7 = a6;
  uint64_t v233 = *MEMORY[0x263EF8340];
  id v200 = a3;
  id v12 = a4;
  uint64_t v14 = 40;
  if (v7) {
    uint64_t v14 = 56;
  }
  v208 = self;
  v201 = objc_msgSend_objectAtIndexedSubscript_(*(void **)((char *)&self->super.isa + v14), v11, v13, a5);
  uint64_t v17 = objc_msgSend_mutableCopy(v200, v15, v16);
  v204 = objc_msgSend_array(MEMORY[0x263EFF980], v18, v19);
  long long v223 = 0u;
  long long v224 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  uint64_t v21 = objc_msgSend_length(v17, v20, 0.0);
  objc_msgSend_matchesInString_options_range_(v201, v22, v23, v17, 0, 0, v21);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, v25, &v221, v232, 16);
  if (v205)
  {
    uint64_t v203 = *(void *)v222;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v222 != v203)
        {
          uint64_t v29 = v28;
          objc_enumerationMutation(obj);
          uint64_t v28 = v29;
        }
        uint64_t v206 = v28;
        double v30 = *(void **)(*((void *)&v221 + 1) + 8 * v28);
        v31 = objc_msgSend_array(MEMORY[0x263EFF980], v26, v27);
        double v34 = objc_msgSend_array(MEMORY[0x263EFF980], v32, v33);
        uint64_t v215 = 0;
        v216 = &v215;
        uint64_t v217 = 0x3032000000;
        v218 = sub_239854048;
        v219 = sub_239854058;
        id v35 = objc_alloc(MEMORY[0x263F089D8]);
        uint64_t v38 = objc_msgSend_length(v17, v36, v37);
        id v220 = (id)objc_msgSend_initWithCapacity_(v35, v39, (double)(unint64_t)v38 * 1.25, (unint64_t)((double)(unint64_t)v38 * 1.25));
        for (unint64_t i = 1; i < objc_msgSend_numberOfRanges(v30, v40, v41); unint64_t i = v49 + 2)
        {
          uint64_t v45 = objc_msgSend_rangeAtIndex_(v30, v43, v44, i);
          v48 = objc_msgSend_substringWithRange_(v17, v46, v47, v45, v46);
          unint64_t v49 = i - 1;
          objc_msgSend_setObject_atIndexedSubscript_(v31, v50, v51, v48, v49);
        }
        v52 = objc_msgSend_objectForKeyedSubscript_(v12, v43, v44, @"replace");
        uint64_t v55 = objc_msgSend_count(v52, v53, v54);

        if (v55)
        {
          for (uint64_t j = 0; j != v55; ++j)
          {
            char v59 = objc_msgSend_objectForKeyedSubscript_(v12, v56, v57, @"replace");
            v62 = objc_msgSend_objectAtIndexedSubscript_(v59, v60, v61, j);

            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            v66 = v62;
            if (isKindOfClass)
            {
              int v67 = objc_msgSend_intValue(v62, v63, v65, v62);
              double v6 = objc_msgSend_objectAtIndexedSubscript_(v31, v68, v69, v67);
              v66 = v6;
            }
            objc_msgSend_setObject_atIndexedSubscript_(v34, v63, v65, v66, j);
            if (isKindOfClass) {
          }
            }
        }
        v70 = (void *)v216[5];
        v71 = objc_msgSend_componentsJoinedByString_(v34, v56, v57, &stru_26ECF02A8);
        objc_msgSend_appendString_(v70, v72, v73, v71);

        v214[0] = MEMORY[0x263EF8330];
        v214[1] = 3221225472;
        v214[2] = sub_239854C34;
        v214[3] = &unk_264DADA80;
        v214[4] = v208;
        v214[5] = &v215;
        v207 = (void (**)(void, void, void))MEMORY[0x23ECA7DD0](v214);
        v76 = objc_msgSend_objectForKeyedSubscript_(v12, v74, v75, @"tag");
        int v79 = objc_msgSend_intValue(v76, v77, v78);

        if ((v79 - 3) >= 2)
        {
          if (v79 == 1)
          {
            v136 = NSString;
            v91 = objc_msgSend_objectAtIndexedSubscript_(v31, v80, v81, 0);
            uint64_t v139 = objc_msgSend_length(v91, v137, v138);
            uint64_t v87 = objc_msgSend_stringWithFormat_(v136, v140, v141, @"%lu", v139);
          }
          else
          {
            v82 = &stru_26ECF02A8;
            if (v79 != 2) {
              goto LABEL_34;
            }
            v83 = NSString;
            uint64_t v84 = objc_msgSend_count(v208->_attributes, v80, v81);
            uint64_t v87 = objc_msgSend_stringWithFormat_(v83, v85, v86, @"%lu", v84);
            attributes = v208->_attributes;
            uint64_t v230 = v87;
            v228 = @"link";
            v91 = objc_msgSend_objectAtIndexedSubscript_(v31, v89, v90, 4);
            v229 = v91;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v92, v93, &v229, &v228, 1);
            v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v231 = v82;
            v96 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v94, v95, &v231, &v230, 1);
            objc_msgSend_addEntriesFromDictionary_(attributes, v97, v98, v96);

LABEL_25:
          }

          v82 = (__CFString *)v87;
          goto LABEL_29;
        }
        v99 = objc_msgSend_objectForKeyedSubscript_(v208->_tag, v80, v81, @"count");
        objc_msgSend_stringValue(v99, v100, v101);
        v82 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v104 = objc_msgSend_objectForKeyedSubscript_(v208->_tag, v102, v103, @"open");
        int v107 = objc_msgSend_BOOLValue(v104, v105, v106);

        v110 = @"[li]";
        if (v107)
        {
          v111 = objc_msgSend_objectForKeyedSubscript_(v208->_tag, v108, v109, @"type");
          v114 = objc_msgSend_objectForKeyedSubscript_(v12, v112, v113, @"tag");
          char isEqual = objc_msgSend_isEqual_(v111, v115, v116, v114);

          v110 = @"[/li][li]";
          if (isEqual)
          {
            v120 = NSNumber;
            v121 = objc_msgSend_objectForKeyedSubscript_(v208->_tag, v118, v119, @"count");
            uint64_t v124 = objc_msgSend_integerValue(v121, v122, v123);
            v127 = objc_msgSend_numberWithInteger_(v120, v125, v126, v124 + 1);
            objc_msgSend_setObject_forKeyedSubscript_(v208->_tag, v128, v129, v127, @"count");

            v91 = objc_msgSend_objectForKeyedSubscript_(v208->_tag, v130, v131, @"count");
            uint64_t v87 = objc_msgSend_stringValue(v91, v132, v133);
            goto LABEL_25;
          }
        }
        ((void (**)(void, id, __CFString *))v207)[2](v207, v12, v110);
LABEL_29:
        v142 = objc_msgSend_objectForKeyedSubscript_(v12, v134, v135, @"tag");
        BOOL v145 = objc_msgSend_intValue(v142, v143, v144) == 1;

        if (v145)
        {
          v148 = objc_msgSend_objectAtIndexedSubscript_(v31, v146, v147, 0);
          uint64_t v151 = objc_msgSend_length(v148, v149, v150);
          v154 = objc_msgSend_stringOfTagType_andCount_(TMLMarkdownParser, v152, v153, @"#", v151);

          objc_msgSend_appendString_(v154, v155, v156, @"[/h<TagCount>]");
          if (objc_msgSend_hasSuffix_((void *)v216[5], v157, v158, v154))
          {
            v161 = (void *)v216[5];
            uint64_t v162 = objc_msgSend_length(v161, v159, v160);
            uint64_t v165 = objc_msgSend_length(v154, v163, v164);
            uint64_t v168 = objc_msgSend_length(v154, v166, v167);
            objc_msgSend_replaceCharactersInRange_withString_(v161, v169, v170, v162 - v165, v168, @"[/h<TagCount>]");
          }
        }
        v171 = (void *)v216[5];
        uint64_t v172 = objc_msgSend_length(v171, v146, v147);
        objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v171, v173, v174, @"<TagCount>", v82, 1, 0, v172);
LABEL_34:
        uint64_t v175 = v216[5];
        v226[0] = @"rs";
        v226[1] = @"ms";
        v227[0] = v175;
        v176 = objc_msgSend_componentsJoinedByString_(v31, v80, v81, &stru_26ECF02A8);
        v227[1] = v176;
        v179 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v177, v178, v227, v226, 2);
        objc_msgSend_addObject_(v204, v180, v181, v179);

        _Block_object_dispose(&v215, 8);
        uint64_t v28 = v206 + 1;
      }
      while (v206 + 1 != v205);
      uint64_t v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, v27, &v221, v232, 16);
    }
    while (v205);
  }

  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  id v209 = v204;
  uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v209, v182, v183, &v210, v225, 16);
  if (v185)
  {
    uint64_t v187 = *(void *)v211;
    do
    {
      for (uint64_t k = 0; k != v185; ++k)
      {
        if (*(void *)v211 != v187) {
          objc_enumerationMutation(v209);
        }
        v189 = *(void **)(*((void *)&v210 + 1) + 8 * k);
        v190 = objc_msgSend_objectForKeyedSubscript_(v189, v184, v186, @"ms");
        uint64_t v193 = objc_msgSend_rangeOfString_(v17, v191, v192, v190);
        uint64_t v195 = v194;

        if (v193 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v196 = objc_msgSend_objectForKeyedSubscript_(v189, v184, v186, @"rs");
          objc_msgSend_replaceCharactersInRange_withString_(v17, v197, v198, v193, v195, v196);
        }
      }
      uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v209, v184, v186, &v210, v225, 16);
    }
    while (v185);
  }

  return v17;
}

- (id)tagFromType:(int)a3
{
  double v3 = @"[/unknown]";
  if (a3 == 4) {
    double v3 = @"[/ul]";
  }
  if (a3 == 3) {
    return @"[/ol]";
  }
  else {
    return v3;
  }
}

- (BOOL)isListTagOpen:(id)a3
{
  id v4 = a3;
  BOOL v7 = objc_msgSend_objectForKeyedSubscript_(self->_tag, v5, v6, @"open");
  int v10 = objc_msgSend_BOOLValue(v7, v8, v9);

  if (v10)
  {
    if ((int)objc_msgSend_length(v4, v11, v12) < 6 || (int v15 = objc_msgSend_length(v4, v13, v14), v15 < 6))
    {
      double v16 = &stru_26ECF02A8;
    }
    else
    {
      objc_msgSend_substringWithRange_(v4, v13, v14, (v15 - 5), 5);
      double v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(self->_tag, v13, v14, @"type");
    uint64_t v20 = objc_msgSend_intValue(v17, v18, v19);
    double v23 = objc_msgSend_tagFromType_(self, v21, v22, v20);

    if (objc_msgSend_length(v23, v24, v25)) {
      int v10 = objc_msgSend_isEqualToString_(v23, v26, v27, v16) ^ 1;
    }
    else {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

+ (id)parse:(id)a3 tags:(id *)a4 withRules:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  int v10 = objc_alloc_init(TMLMarkdownParser);
  double v11 = (void *)MEMORY[0x263EFF980];
  uint64_t v14 = objc_msgSend_count(v8, v12, v13);
  uint64_t v17 = objc_msgSend_arrayWithCapacity_(v11, v15, v16, v14);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_239854FF8;
  v43[3] = &unk_264DADA08;
  double v18 = v17;
  double v44 = v18;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v19, v20, v43);

  extraRules = v10->_extraRules;
  v10->_extraRules = v18;
  double v22 = v18;

  uint64_t v25 = objc_msgSend_regexFromRules_(a1, v23, v24, v22);
  extraRegex = v10->_extraRegex;
  v10->_extraRegex = (NSArray *)v25;

  double v27 = objc_opt_class();
  double v30 = objc_msgSend_unescapeString_(v27, v28, v29, v9);

  v31 = objc_opt_class();
  double v34 = objc_msgSend_preProcessString_(v31, v32, v33, v30);
  id v35 = objc_opt_class();
  uint64_t v38 = objc_msgSend_parse_tags_(v10, v36, v37, v34, a4);
  double v41 = objc_msgSend_postProcessString_(v35, v39, v40, v38);

  return v41;
}

+ (id)stringOfTagType:(id)a3 andCount:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x263F089D8]);
  for (unint64_t i = objc_msgSend_initWithCapacity_(v6, v7, (double)a4 * 1.25, (unint64_t)((double)a4 * 1.25));
        a4;
        --a4)
  {
    objc_msgSend_appendString_(i, v8, v10, v5);
  }

  return i;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraRegex, 0);
  objc_storeStrong((id *)&self->_extraRules, 0);
  objc_storeStrong((id *)&self->_regex, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

@end