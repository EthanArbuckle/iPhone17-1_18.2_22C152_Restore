@interface LNValue(Serialization)
+ (id)valueFromSerializedRepresentation:()Serialization valueType:variableProvider:parameter:bundleIdentifier:;
+ (uint64_t)valueFromSerializedRepresentation:()Serialization valueType:variableProvider:parameter:;
- (id)wfSerializedRepresentation;
@end

@implementation LNValue(Serialization)

- (id)wfSerializedRepresentation
{
  v2 = WFSerializedIdentifierFromLinkValue(a1);
  v3 = [a1 value];
  v4 = WFSerializedRepresentationFromLinkValue(v3);

  v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v2, @"identifier");
  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v4, @"value");
  v6 = [a1 displayRepresentation];
  v7 = [v6 title];
  v8 = [v7 serializedRepresentation];

  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v8, @"title");
  v9 = [a1 displayRepresentation];
  v10 = [v9 title];
  v11 = [v10 serializedRepresentation];

  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v11, @"subtitle");
  v12 = [a1 displayRepresentation];
  v13 = [v12 image];

  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = [v13 serializedRepresentation];
    if (v14) {
      objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v14, @"symbol");
    }
  }
  else
  {

    v15 = [a1 displayRepresentation];
    v16 = [v15 image];

    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
    id v18 = v17;

    v13 = [v18 serializedRepresentation];

    if (v13) {
      objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v13, @"image");
    }
  }

  return v5;
}

+ (id)valueFromSerializedRepresentation:()Serialization valueType:variableProvider:parameter:bundleIdentifier:
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v169 = a7;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v11;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;
  id v17 = [v16 objectForKeyedSubscript:@"value"];
  if (!v17) {
    id v17 = v11;
  }
  uint64_t v18 = [v16 objectForKeyedSubscript:@"title"];
  if (!v18
    || (uint64_t v174 = [objc_alloc(MEMORY[0x1E4F72DA0]) initWithSerializedRepresentation:v18 variableProvider:v13 parameter:v14]) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v174 = objc_msgSend(v12, "wf_titleWithCustomIntentSerializedRepresentation:", v11);
    }
    else
    {
      id v19 = v11;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        uint64_t v174 = [objc_alloc(MEMORY[0x1E4F72DA0]) initWithKey:v19 table:0 bundleURL:0];
      }
      else {
        uint64_t v174 = 0;
      }
    }
  }
  uint64_t v20 = [v16 objectForKeyedSubscript:@"subtitle"];
  if (v20) {
    v172 = (void *)[objc_alloc(MEMORY[0x1E4F72DA0]) initWithSerializedRepresentation:v20 variableProvider:v13 parameter:v14];
  }
  else {
    v172 = 0;
  }
  v21 = (void *)v174;
  uint64_t v22 = [v16 objectForKeyedSubscript:@"image"];
  uint64_t v23 = [v16 objectForKeyedSubscript:@"symbol"];
  v166 = (void *)v22;
  v167 = (void *)v20;
  v165 = (void *)v23;
  if (v23)
  {
    v24 = (Class *)0x1E4F72DB8;
    uint64_t v22 = v23;
  }
  else
  {
    if (!v22)
    {
      v173 = 0;
      if (v174) {
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    v24 = (Class *)0x1E4F72CA8;
  }
  v173 = (void *)[objc_alloc(*v24) initWithSerializedRepresentation:v22 variableProvider:v13 parameter:v14];
  if (v174)
  {
LABEL_25:
    v171 = (void *)[objc_alloc(MEMORY[0x1E4F72C00]) initWithTitle:v174 subtitle:v172 image:v173];
    goto LABEL_28;
  }
LABEL_27:
  v171 = 0;
LABEL_28:
  v168 = (void *)v18;
  objc_opt_class();
  v170 = v17;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  v25 = [v12 memberValueType];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v28 = v25;

    id v12 = v28;
    v21 = (void *)v174;
LABEL_39:

    id v17 = v170;
LABEL_40:
    id v32 = v17;
    id v12 = v12;
    id v33 = v13;
    id v34 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      switch([v12 typeIdentifier])
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
          id v35 = v32;
          goto LABEL_43;
        case 9:
          id v73 = v32;
          v74 = v33;
          id v75 = v73;
          v154 = v74;
          id v162 = v74;
          id v143 = v34;
          id v76 = v75;
          if (v76 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v149 = v34;
            id v151 = v32;
            id v77 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
            v78 = [v76 objectForKeyedSubscript:@"era"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v78, @"era");

            v79 = [v76 objectForKeyedSubscript:@"year"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v79, @"year");

            v80 = [v76 objectForKeyedSubscript:@"month"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v80, @"month");

            v81 = [v76 objectForKeyedSubscript:@"day"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v81, @"day");

            v82 = [v76 objectForKeyedSubscript:@"weekday"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v82, @"weekday");

            v83 = [v76 objectForKeyedSubscript:@"hour"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v83, @"hour");

            v84 = [v76 objectForKeyedSubscript:@"minute"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v84, @"minute");

            v85 = [v76 objectForKeyedSubscript:@"second"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v85, @"second");

            v86 = [v76 objectForKeyedSubscript:@"nanosecond"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v86, @"nanosecond");

            v87 = [v76 objectForKeyedSubscript:@"weekday"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v87, @"weekday");

            v88 = [v76 objectForKeyedSubscript:@"weekdayOrdinal"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v88, @"weekdayOrdinal");

            v89 = [v76 objectForKeyedSubscript:@"quarter"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v89, @"quarter");

            v90 = [v76 objectForKeyedSubscript:@"weekOfMonth"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v90, @"weekOfMonth");

            v91 = [v76 objectForKeyedSubscript:@"weekOfYear"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v91, @"weekOfYear");

            v92 = [v76 objectForKeyedSubscript:@"yearForWeekOfYear"];
            objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v92, @"yearForWeekOfYear");

            v93 = [v76 objectForKeyedSubscript:@"calendar"];
            if (v93)
            {
              v94 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v93];
              objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v94, @"calendar");
            }
            uint64_t v164 = (uint64_t)v77;
            v95 = [v76 objectForKeyedSubscript:@"timeZone"];
            if (v95)
            {
              v96 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v95];
              objc_msgSend(v77, "if_setValueIfNonNil:forKey:", v96, @"timeZone");
            }
            v21 = (void *)v174;
            id v34 = v149;
            id v32 = v151;
          }
          else
          {
            uint64_t v164 = 0;
          }
          id v33 = v154;

          goto LABEL_113;
        case 10:
          v153 = v33;
          v97 = [[WFLocationValue alloc] initWithSerializedRepresentation:v32 variableProvider:v33 parameter:v34];
          v61 = v97;
          if (v97) {
            [(WFLocationValue *)v97 placemark];
          }
          else {
            WFCLPlacemarkFromSerializedIntentPlacemark(v32);
          }
          v98 = (WFLocationValue *)objc_claimAutoreleasedReturnValue();
          goto LABEL_110;
        case 11:
          v153 = v33;
          v61 = (WFLocationValue *)v32;
          if (!v61) {
            goto LABEL_96;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_96;
          }
          v99 = (objc_class *)MEMORY[0x1E4F1CB10];
          goto LABEL_95;
        case 12:
          v153 = v33;
          v61 = (WFLocationValue *)v32;
          if (!v61 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
LABEL_96:
            uint64_t v164 = 0;
            goto LABEL_111;
          }
          v99 = (objc_class *)MEMORY[0x1E4F28B18];
LABEL_95:
          v98 = (WFLocationValue *)[[v99 alloc] initWithString:v61];
          break;
        default:
          goto LABEL_113;
      }
      goto LABEL_110;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v36 = [v12 typeIdentifier];
      if (v36 <= 11)
      {
        if (v36)
        {
          uint64_t v164 = 0;
          if (v36 != 3) {
            goto LABEL_113;
          }
          v153 = v33;
          v55 = (objc_class *)MEMORY[0x1E4F5A800];
          id v56 = v34;
          id v148 = v34;
          v57 = v32;
          id v58 = v153;
          id v59 = v13;
          id v60 = v57;
          v61 = (WFLocationValue *)[[v55 alloc] initWithSerializedRepresentation:v60 variableProvider:v58 parameter:v56];

          id v32 = v57;
          id v34 = v148;

          id v13 = v59;
          v62 = [(WFLocationValue *)v61 contact];
          uint64_t v164 = [v62 INPersonRepresentation];

          v21 = (void *)v174;
          goto LABEL_111;
        }
        v153 = v33;
        v61 = (WFLocationValue *)v32;
        if (v61)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v72 = v61;
          }
          else {
            v72 = 0;
          }
        }
        else
        {
          v72 = 0;
        }
        v98 = v72;
LABEL_110:
        uint64_t v164 = (uint64_t)v98;
LABEL_111:

LABEL_112:
        id v33 = v153;
LABEL_113:

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v157 = v11;
          id v12 = v12;
          id v107 = v33;
          v108 = v107;
          id v152 = v32;
          if (v107)
          {
            if ([v107 conformsToProtocol:&unk_1F231C018]) {
              v109 = v108;
            }
            else {
              v109 = 0;
            }
          }
          else
          {
            v109 = 0;
          }
          id v163 = v16;
          id v155 = v109;

          id v112 = v34;
          id v159 = v14;
          if (v112)
          {
            v113 = v173;
            id v114 = v13;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v115 = v112;
            }
            else {
              v115 = 0;
            }
          }
          else
          {
            v113 = v173;
            id v114 = v13;
            v115 = 0;
          }
          id v116 = v115;

          v117 = [v116 parameterMetadata];
          v118 = [v117 typeSpecificMetadata];
          v119 = [v118 objectForKey:@"LNValueTypeSpecificMetadataKeyLinkEntityMetadata"];

          v120 = [v119 identifier];
          v121 = [v12 identifier];
          char v122 = [v120 isEqualToString:v121];

          if (v122)
          {
            id v13 = v114;
          }
          else
          {
            v123 = [v116 parameterMetadata];
            v124 = [v123 typeSpecificMetadata];
            v125 = [v124 objectForKey:@"LNValueTypeSpecificMetadataKeyLinkReferencedEntityMetadata"];

            if (v125)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v126 = v125;
              }
              else {
                v126 = 0;
              }
            }
            else
            {
              v126 = 0;
            }
            id v13 = v114;
            id v127 = v126;

            v175[0] = MEMORY[0x1E4F143A8];
            v175[1] = 3221225472;
            v175[2] = __114__LNValue_Serialization__valueFromSerializedRepresentation_valueType_variableProvider_parameter_bundleIdentifier___block_invoke_2;
            v175[3] = &unk_1E6559238;
            id v176 = v12;
            uint64_t v128 = objc_msgSend(v127, "if_firstObjectPassingTest:", v175);

            v119 = (void *)v128;
          }
          v21 = (void *)v174;
          v173 = v113;
          if (v119) {
            goto LABEL_148;
          }
          v129 = [v12 identifier];
          v119 = [v155 entityMetadataForIdentifier:v129];

          if (v169 && !v119)
          {
            v130 = +[WFLinkActionProvider sharedProvider];
            v131 = [v12 identifier];
            v119 = [v130 entityMetadataByAppBundleIdentifier:v169 entityIdentifier:v131];

            v21 = (void *)v174;
          }
          if (v119)
          {
LABEL_148:
            v132 = [MEMORY[0x1E4F72C28] valueFromSerializedRepresentation:v152 metadata:v119 variableProvider:v108 parameter:v112];
            if (v132) {
              id v29 = (id)[objc_alloc(MEMORY[0x1E4F72E10]) initWithValue:v132 valueType:v12 displayRepresentation:v171];
            }
            else {
              id v29 = 0;
            }
            id v11 = v157;
            id v16 = v163;

            v21 = (void *)v174;
          }
          else
          {
            id v29 = 0;
            id v11 = v157;
            id v16 = v163;
          }

          id v14 = v159;
          goto LABEL_156;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v110 = [v16 objectForKeyedSubscript:@"identifier"];
          if (v110)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_124;
            }
          }

          v111 = v32;
          if (v111)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v110 = v111;

LABEL_124:
              id v29 = (id)[objc_alloc(MEMORY[0x1E4F72E10]) initWithValue:v110 valueType:v12 displayRepresentation:v171];

LABEL_156:
              id v30 = (id)v164;
              goto LABEL_157;
            }
          }
        }
        else
        {
          if (!v164)
          {
            id v30 = 0;
            id v29 = 0;
            goto LABEL_157;
          }
          if ([v12 objectIsMemberOfType:v164])
          {
            id v29 = (id)[objc_alloc(MEMORY[0x1E4F72E10]) initWithValue:v164 valueType:v12 displayRepresentation:v171];
            id v30 = (id)v164;
            goto LABEL_157;
          }
          v111 = getWFAppIntentsLogObject();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v182 = "+[LNValue(Serialization) valueFromSerializedRepresentation:valueType:variableProvider:parameter:bundleIdentifier:]";
            __int16 v183 = 2112;
            id v184 = v16;
            __int16 v185 = 2112;
            id v186 = v12;
            _os_log_impl(&dword_1C7F0A000, v111, OS_LOG_TYPE_ERROR, "%s Serialized value %@ does not match value type %@", buf, 0x20u);
          }
        }

        id v29 = 0;
        goto LABEL_156;
      }
      if (v36 != 14)
      {
        if (v36 == 13)
        {
          id v158 = v14;
          id v63 = v32;
          v64 = v33;
          id v65 = v63;
          v153 = v64;
          id v66 = v64;
          id v67 = v34;
          id v68 = v65;
          if (v68 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v161 = v16;
            v69 = [v68 objectForKeyedSubscript:@"type"];
            id v156 = v11;
            id v145 = v13;
            if (v69)
            {
              v70 = v173;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v71 = v69;
              }
              else {
                v71 = 0;
              }
            }
            else
            {
              v70 = v173;
              v71 = 0;
            }
            id v134 = v71;

            uint64_t v135 = [v134 integerValue];
            v136 = [v68 objectForKeyedSubscript:@"name"];
            if (v136)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v137 = v136;
              }
              else {
                v137 = 0;
              }
            }
            else
            {
              v137 = 0;
            }
            id v150 = v34;
            id v138 = v137;

            v139 = [v68 objectForKeyedSubscript:@"identificationHint"];
            v173 = v70;
            id v140 = v32;
            if (v139)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v141 = v139;
              }
              else {
                v141 = 0;
              }
            }
            else
            {
              v141 = 0;
            }
            id v142 = v141;

            uint64_t v164 = [objc_alloc(MEMORY[0x1E4F305A8]) initWithType:v135 name:v138 identificationHint:v142 icon:0];
            id v11 = v156;
            v21 = (void *)v174;
            id v16 = v161;
            id v32 = v140;
            id v13 = v145;
            id v34 = v150;
          }
          else
          {
            uint64_t v164 = 0;
          }

          id v14 = v158;
        }
        else
        {
          uint64_t v164 = 0;
          if (v36 != 12) {
            goto LABEL_113;
          }
          id v144 = v13;
          v153 = v33;
          id v37 = v33;
          id v146 = v34;
          id v38 = v34;
          v39 = v32;
          id v40 = v38;
          v41 = v39;
          id v42 = v39;
          v43 = [[WFFileValue alloc] initWithSerializedRepresentation:v42 variableProvider:v37 parameter:v40];

          id v44 = v37;
          id v45 = v14;
          if (v44)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v46 = v44;
            }
            else {
              v46 = 0;
            }
          }
          else
          {
            v46 = 0;
          }
          id v101 = v46;

          v102 = [v101 workflow];

          v103 = [v102 workflowID];
          v104 = [(WFFileValue *)v43 resolveURLWithWorkflowID:v103 error:0];

          if (v104)
          {
            v105 = (void *)MEMORY[0x1E4F30420];
            v106 = [(WFFileValue *)v43 filename];
            uint64_t v164 = [v105 fileWithFileURL:v104 filename:v106 typeIdentifier:0];
          }
          else
          {
            uint64_t v164 = 0;
          }
          id v13 = v144;
          id v14 = v45;

          v21 = (void *)v174;
          id v32 = v41;
          id v34 = v146;
        }
        goto LABEL_112;
      }
      WFINCurrencyAmountFromSerialization(v32, v33, v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_43:
      uint64_t v164 = (uint64_t)v35;
      goto LABEL_113;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v12 builtInType] == 2)
      {
        v47 = (objc_class *)MEMORY[0x1E4F72D10];
        id v48 = v34;
        id v147 = v34;
        v49 = v32;
        id v50 = v33;
        id v160 = v16;
        id v51 = v14;
        id v52 = v49;
        uint64_t v164 = [[v47 alloc] initWithSerializedRepresentation:v52 variableProvider:v50 parameter:v48];

        v21 = (void *)v174;
        id v32 = v49;
        id v34 = v147;

        id v14 = v51;
        id v16 = v160;
        goto LABEL_113;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v153 = v33;
        id v53 = v32;
        if (v53)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v54 = v53;
          }
          else {
            v54 = 0;
          }
        }
        else
        {
          v54 = 0;
        }
        id v100 = v54;

        uint64_t v164 = WFDeserializeNSMeasurement();

        v21 = (void *)v174;
        goto LABEL_112;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v12 typeIdentifier]) {
          goto LABEL_113;
        }
        WFLNStringSearchCriteriaFromSerialization(v32, v33, v34);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
    }
    uint64_t v164 = 0;
    goto LABEL_113;
  }
  id v26 = v17;
  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }
  id v29 = v27;

  v177[0] = MEMORY[0x1E4F143A8];
  v177[1] = 3221225472;
  v177[2] = __114__LNValue_Serialization__valueFromSerializedRepresentation_valueType_variableProvider_parameter_bundleIdentifier___block_invoke;
  v177[3] = &unk_1E65570C0;
  id v30 = v25;
  id v178 = v30;
  id v179 = v13;
  id v180 = v14;
  v31 = objc_msgSend(v29, "if_map:", v177);

  if (v31) {
    id v29 = (id)[objc_alloc(MEMORY[0x1E4F72E10]) initWithValue:v31 valueType:v12 displayRepresentation:v171];
  }
  v21 = (void *)v174;

  if (!v31) {
    goto LABEL_39;
  }
LABEL_157:

  return v29;
}

+ (uint64_t)valueFromSerializedRepresentation:()Serialization valueType:variableProvider:parameter:
{
  return [a1 valueFromSerializedRepresentation:a3 valueType:a4 variableProvider:a5 parameter:a6 bundleIdentifier:0];
}

@end