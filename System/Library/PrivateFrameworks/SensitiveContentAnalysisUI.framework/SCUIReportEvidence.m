@interface SCUIReportEvidence
- (NSArray)suspects;
- (NSArray)unsortedChatTranscript;
- (NSDate)incidentDate;
- (NSDate)reportCreationDate;
- (NSString)chatRoomName;
- (NSString)localeIdentifier;
- (SCUIReportEvidence)initWithVictim:(id)a3 suspects:(id)a4 application:(int64_t)a5;
- (SCUIReportEvidence)initWithVictimHandle:(id)a3 media:(id)a4 selectedMediaObject:(id)a5 chat:(id)a6;
- (SCUIReportEvidence)initWithVictimHandle:(id)a3 sensitiveContentMedia:(id)a4 chat:(id)a5;
- (SCUIReportVictim)victim;
- (int64_t)reportingApplication;
- (unint64_t)flags;
- (void)setChatRoomName:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIncidentDate:(id)a3;
- (void)setUnsortedChatTranscript:(id)a3;
@end

@implementation SCUIReportEvidence

- (SCUIReportEvidence)initWithVictimHandle:(id)a3 sensitiveContentMedia:(id)a4 chat:(id)a5
{
  return [(SCUIReportEvidence *)self initWithVictimHandle:a3 media:a4 selectedMediaObject:0 chat:a5];
}

- (SCUIReportEvidence)initWithVictimHandle:(id)a3 media:(id)a4 selectedMediaObject:(id)a5 chat:(id)a6
{
  uint64_t v221 = *MEMORY[0x263EF8340];
  id v182 = a3;
  id v9 = a4;
  id v178 = a5;
  id v173 = a6;
  id v184 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v183 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v201 objects:v220 count:16];
  if (v10)
  {
    id v175 = *(id *)v202;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(id *)v202 != v175) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v201 + 1) + 8 * i);
        v13 = [v12 senderHandle];
        v14 = [v13 ID];
        v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [v182 ID];
        }
        v17 = v16;

        v18 = [v184 objectForKeyedSubscript:v17];
        BOOL v19 = v18 == 0;

        if (v19)
        {
          id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v184 setObject:v20 forKeyedSubscript:v17];
        }
        v21 = [v183 objectForKeyedSubscript:v17];
        BOOL v22 = v21 == 0;

        if (v22)
        {
          uint64_t v23 = [v12 senderHandle];
          v24 = (void *)v23;
          if (v23) {
            id v25 = (id)v23;
          }
          else {
            id v25 = v182;
          }
          [v183 setObject:v25 forKeyedSubscript:v17];
        }
        v26 = [v12 time];
        BOOL v27 = v26 == 0;

        if (!v27)
        {
          v28 = [(SCUIReportEvidence *)self incidentDate];
          if (v28)
          {
            v29 = [(SCUIReportEvidence *)self incidentDate];
            v30 = [v12 time];
            v31 = [v29 earlierDate:v30];
            [(SCUIReportEvidence *)self setIncidentDate:v31];
          }
          else
          {
            v29 = [v12 time];
            [(SCUIReportEvidence *)self setIncidentDate:v29];
          }
        }
        v32 = [v178 transferGUID];
        v33 = [v12 transferGUID];
        uint64_t v34 = [v32 isEqual:v33];

        if ([v12 commSafetySensitive] == 1
          || (uint64_t v35 = [v12 commSafetySensitive], v36 = MEMORY[0x263EFFA80], v35 == 2))
        {
          uint64_t v36 = MEMORY[0x263EFFA88];
        }
        v37 = [SCUIReportSensitiveMedia alloc];
        v38 = [v12 fileURL];
        v39 = [v12 UTIType];
        v40 = [v12 transferGUID];
        v41 = [v12 time];
        v42 = [(SCUIReportSensitiveMedia *)v37 initWithURL:v38 UTIType:v39 identifier:v40 dateReceived:v41 isSensitive:v36 wasImpetusOfReport:v34];

        v43 = [v184 objectForKeyedSubscript:v17];
        [v43 addObject:v42];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v201 objects:v220 count:16];
    }
    while (v10);
  }

  id v172 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id v176 = [v184 allKeys];
  uint64_t v44 = [v176 countByEnumeratingWithState:&v197 objects:v219 count:16];
  id v170 = (id)*MEMORY[0x263EFE0A0];
  uint64_t v168 = *MEMORY[0x263EFE070];
  id v166 = (id)*MEMORY[0x263EFDFC8];
  uint64_t v164 = *MEMORY[0x263EFDFB8];
  uint64_t v162 = *MEMORY[0x263EFDF80];
  uint64_t v160 = *MEMORY[0x263EFE038];
  if (v44)
  {
    uint64_t v45 = *(void *)v198;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v198 != v45) {
          objc_enumerationMutation(v176);
        }
        v47 = *(void **)(*((void *)&v197 + 1) + 8 * j);
        v48 = [v182 ID];
        char v49 = [v47 isEqual:v48];

        if ((v49 & 1) == 0)
        {
          v50 = [v183 objectForKeyedSubscript:v47];
          v218[0] = v170;
          v218[1] = v168;
          v218[2] = v166;
          v218[3] = v164;
          v218[4] = v162;
          v218[5] = v160;
          v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v218 count:6];
          v52 = [v50 cnContactWithKeys:v51];

          v53 = [v50 displayNameForChat:v173];
          v54 = [SCUIReportSuspect alloc];
          v55 = [v184 objectForKeyedSubscript:v47];
          v56 = [(SCUIReportSuspect *)v54 initWithDisplayName:v53 sensitiveMediaFiles:v55];

          v57 = [v50 ID];
          [(SCUIReportSuspect *)v56 setAccountID:v57];

          v58 = [v52 emailAddresses];
          v59 = [v58 firstObject];
          v60 = [v59 value];
          [(SCUIReportSuspect *)v56 setEmailAddress:v60];

          v61 = [MEMORY[0x263EFEA20] stringFromContact:v52 style:0];
          [(SCUIReportSuspect *)v56 setFullName:v61];

          v62 = [v52 phoneNumbers];
          v63 = [v62 firstObject];
          v64 = [v63 value];

          if (v64)
          {
            v65 = [v64 formattedInternationalStringValue];
            [(SCUIReportSuspect *)v56 setPhoneNumber:v65];
          }
          [v172 addObject:v56];
        }
      }
      uint64_t v44 = [v176 countByEnumeratingWithState:&v197 objects:v219 count:16];
    }
    while (v44);
  }

  v217[0] = v170;
  v217[1] = v168;
  v217[2] = v166;
  v217[3] = v164;
  v217[4] = v162;
  v217[5] = v160;
  v217[6] = *MEMORY[0x263EFDF48];
  v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v217 count:7];
  v159 = [v182 cnContactWithKeys:v66];

  v151 = [v182 displayNameForChat:v173];
  v67 = [v182 ID];
  uint64_t v68 = [v184 objectForKeyedSubscript:v67];
  v69 = (void *)v68;
  v70 = (void *)MEMORY[0x263EFFA68];
  if (v68) {
    v70 = (void *)v68;
  }
  id v150 = v70;

  v165 = [[SCUIReportVictim alloc] initWithDisplayName:v151 mediaFiles:v150];
  v71 = [v182 ID];
  [(SCUIReportVictim *)v165 setAccountID:v71];

  v72 = [MEMORY[0x263EFEA20] stringFromContact:v159 style:0];
  [(SCUIReportVictim *)v165 setFullName:v72];

  v73 = [v159 emailAddresses];
  v74 = [v73 firstObject];
  v75 = [v74 value];
  [(SCUIReportVictim *)v165 setEmailAddress:v75];

  v76 = [v159 birthday];
  v77 = [v76 date];
  [(SCUIReportVictim *)v165 setDateOfBirth:v77];

  v78 = [v159 postalAddresses];
  v158 = [v78 firstObject];

  v79 = [SCUIReportAddress alloc];
  v80 = [v158 value];
  id v177 = [v80 street];
  v81 = [v158 value];
  v82 = [v81 city];
  v83 = [v158 value];
  v84 = [v83 state];
  v85 = [v158 value];
  v86 = [v85 country];
  v87 = [v158 value];
  v88 = [v87 postalCode];
  v89 = [(SCUIReportAddress *)v79 initWithAddress:v177 city:v82 state:v84 country:v86 postCode:v88];
  [(SCUIReportVictim *)v165 setAddress:v89];

  v90 = [v159 phoneNumbers];
  v91 = [v90 firstObject];
  v154 = [v91 value];

  if (v154)
  {
    v92 = [v154 formattedInternationalStringValue];
    [(SCUIReportVictim *)v165 setPhoneNumber:v92];
  }
  v152 = [(SCUIReportEvidence *)self initWithVictim:v165 suspects:v172 application:0];
  v153 = objc_opt_new();
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  v93 = [v173 chatItems];
  id v156 = [v93 reverseObjectEnumerator];

  uint64_t v163 = [v156 countByEnumeratingWithState:&v193 objects:v216 count:16];
  if (!v163)
  {

    goto LABEL_108;
  }
  v94 = 0;
  uint64_t v157 = *(void *)v194;
  do
  {
    v155 = v94;
    for (uint64_t k = 0; k != v163; ++k)
    {
      if (*(void *)v194 != v157) {
        objc_enumerationMutation(v156);
      }
      v95 = *(void **)(*((void *)&v193 + 1) + 8 * k);
      uint64_t v210 = 0;
      v211 = &v210;
      uint64_t v212 = 0x2050000000;
      v96 = (void *)getIMMessagePartChatItemClass_softClass;
      uint64_t v213 = getIMMessagePartChatItemClass_softClass;
      if (!getIMMessagePartChatItemClass_softClass)
      {
        uint64_t v205 = MEMORY[0x263EF8330];
        uint64_t v206 = 3221225472;
        v207 = __getIMMessagePartChatItemClass_block_invoke;
        v208 = &unk_2654AB468;
        v209 = &v210;
        __getIMMessagePartChatItemClass_block_invoke((uint64_t)&v205);
        v96 = (void *)v211[3];
      }
      id v97 = v96;
      _Block_object_dispose(&v210, 8);
      if (objc_opt_isKindOfClass())
      {
        id v161 = v95;
        v98 = [v161 message];
        id v167 = v98;
        if (v98)
        {
          v99 = [v98 subject];
          v100 = [v99 ID];
          v101 = v100;
          if (v100) {
            BOOL v102 = v155 == 0;
          }
          else {
            BOOL v102 = 0;
          }
          if (!v102)
          {

            goto LABEL_58;
          }
          char v103 = [v167 isFromMe];

          if (v103)
          {
            v155 = 0;
          }
          else
          {
            v99 = [v167 subject];
            v155 = [v99 ID];
LABEL_58:
          }
          v104 = (void *)MEMORY[0x263EFF980];
          uint64_t v105 = [v167 fileTransferGUIDs];
          v106 = (void *)v105;
          if (v105) {
            uint64_t v107 = v105;
          }
          else {
            uint64_t v107 = MEMORY[0x263EFFA68];
          }
          v108 = [v104 arrayWithArray:v107];

          long long v191 = 0u;
          long long v192 = 0u;
          long long v189 = 0u;
          long long v190 = 0u;
          id v171 = [v161 visibleAssociatedMessageChatItems];
          uint64_t v109 = [v171 countByEnumeratingWithState:&v189 objects:v215 count:16];
          if (v109)
          {
            uint64_t v180 = *(void *)v190;
            do
            {
              for (uint64_t m = 0; m != v109; ++m)
              {
                if (*(void *)v190 != v180) {
                  objc_enumerationMutation(v171);
                }
                v111 = *(void **)(*((void *)&v189 + 1) + 8 * m);
                uint64_t v210 = 0;
                v211 = &v210;
                uint64_t v212 = 0x2050000000;
                v112 = (void *)getIMAssociatedStickerChatItemClass_softClass;
                uint64_t v213 = getIMAssociatedStickerChatItemClass_softClass;
                if (!getIMAssociatedStickerChatItemClass_softClass)
                {
                  uint64_t v205 = MEMORY[0x263EF8330];
                  uint64_t v206 = 3221225472;
                  v207 = __getIMAssociatedStickerChatItemClass_block_invoke;
                  v208 = &unk_2654AB468;
                  v209 = &v210;
                  __getIMAssociatedStickerChatItemClass_block_invoke((uint64_t)&v205);
                  v112 = (void *)v211[3];
                }
                id v113 = v112;
                _Block_object_dispose(&v210, 8);
                if (objc_opt_isKindOfClass())
                {
                  id v114 = v111;
                  v115 = [v114 transferGUID];
                  BOOL v116 = v115 == 0;

                  if (!v116)
                  {
                    v117 = [v114 transferGUID];
                    [v108 addObject:v117];
                  }
                }
                uint64_t v210 = 0;
                v211 = &v210;
                uint64_t v212 = 0x2050000000;
                v118 = (void *)getIMAggregateAcknowledgmentChatItemClass_softClass;
                uint64_t v213 = getIMAggregateAcknowledgmentChatItemClass_softClass;
                if (!getIMAggregateAcknowledgmentChatItemClass_softClass)
                {
                  uint64_t v205 = MEMORY[0x263EF8330];
                  uint64_t v206 = 3221225472;
                  v207 = __getIMAggregateAcknowledgmentChatItemClass_block_invoke;
                  v208 = &unk_2654AB468;
                  v209 = &v210;
                  __getIMAggregateAcknowledgmentChatItemClass_block_invoke((uint64_t)&v205);
                  v118 = (void *)v211[3];
                }
                id v119 = v118;
                _Block_object_dispose(&v210, 8);
                if (objc_opt_isKindOfClass())
                {
                  id v120 = v111;
                  long long v185 = 0u;
                  long long v186 = 0u;
                  long long v187 = 0u;
                  long long v188 = 0u;
                  v121 = [v120 acknowledgments];
                  uint64_t v122 = [v121 countByEnumeratingWithState:&v185 objects:v214 count:16];
                  if (v122)
                  {
                    uint64_t v123 = *(void *)v186;
                    do
                    {
                      for (uint64_t n = 0; n != v122; ++n)
                      {
                        if (*(void *)v186 != v123) {
                          objc_enumerationMutation(v121);
                        }
                        v125 = *(void **)(*((void *)&v185 + 1) + 8 * n);
                        v126 = [v125 fileTransferGUIDs];
                        BOOL v127 = v126 == 0;

                        if (!v127)
                        {
                          v128 = [v125 fileTransferGUIDs];
                          [v108 addObjectsFromArray:v128];
                        }
                      }
                      uint64_t v122 = [v121 countByEnumeratingWithState:&v185 objects:v214 count:16];
                    }
                    while (v122);
                  }
                }
              }
              uint64_t v109 = [v171 countByEnumeratingWithState:&v189 objects:v215 count:16];
            }
            while (v109);
          }

          v181 = [SCUIReportMessage alloc];
          v129 = [v167 time];
          v130 = v129;
          if (!v129)
          {
            v149 = [MEMORY[0x263EFF910] distantPast];
            v130 = v149;
          }
          v131 = [v167 sender];
          uint64_t v132 = [v131 ID];
          v133 = (void *)v132;
          if (v132) {
            v134 = (__CFString *)v132;
          }
          else {
            v134 = @"?";
          }
          v135 = objc_msgSend(v167, "sender", v149);
          uint64_t v136 = [v135 displayNameForChat:v173];
          v137 = (void *)v136;
          if (v136) {
            v138 = (__CFString *)v136;
          }
          else {
            v138 = @"?";
          }
          uint64_t v139 = [v167 descriptionForPurpose:2];
          v140 = (void *)v139;
          if (v139) {
            v141 = (__CFString *)v139;
          }
          else {
            v141 = &stru_270980950;
          }
          v142 = [(SCUIReportMessage *)v181 initWithDate:v130 senderAccountID:v134 senderDisplayName:v138 body:v141 attachmentIdentifiers:v108];

          if (!v129) {
          [v153 addObject:v142];
          }

          v98 = v167;
        }

        continue;
      }
    }
    uint64_t v163 = [v156 countByEnumeratingWithState:&v193 objects:v216 count:16];
    v94 = v155;
  }
  while (v163);

  if (v155)
  {
    -[SCUIReportVictim setAccountID:](v165, "setAccountID:");
    goto LABEL_109;
  }
LABEL_108:
  v155 = 0;
LABEL_109:
  [(SCUIReportEvidence *)v152 setUnsortedChatTranscript:v153];
  if ([v173 isSMS]) {
    [(SCUIReportEvidence *)v152 setFlags:[(SCUIReportEvidence *)v152 flags] | 1];
  }
  int v143 = [v173 chatStyle];
  if (v143 == 43)
  {
    uint64_t v146 = 2;
LABEL_115:
    [(SCUIReportEvidence *)v152 setFlags:[(SCUIReportEvidence *)v152 flags] | v146];
  }
  else if (v143 == 35)
  {
    v144 = [v173 roomName];
    v145 = (void *)[v144 copy];
    [(SCUIReportEvidence *)v152 setChatRoomName:v145];

    uint64_t v146 = 4;
    goto LABEL_115;
  }
  v147 = v152;

  return v147;
}

- (SCUIReportEvidence)initWithVictim:(id)a3 suspects:(id)a4 application:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SCUIReportEvidence;
  v11 = [(SCUIReportEvidence *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_victim, a3);
    uint64_t v13 = [v10 copy];
    suspects = v12->_suspects;
    v12->_suspects = (NSArray *)v13;

    v12->_reportingApplicatiouint64_t n = a5;
    uint64_t v15 = [MEMORY[0x263EFF910] date];
    reportCreationDate = v12->_reportCreationDate;
    v12->_reportCreationDate = (NSDate *)v15;

    v17 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v18 = [v17 localeIdentifier];
    localeIdentifier = v12->_localeIdentifier;
    v12->_localeIdentifier = (NSString *)v18;
  }
  return v12;
}

- (NSDate)incidentDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIncidentDate:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)chatRoomName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChatRoomName:(id)a3
{
}

- (int64_t)reportingApplication
{
  return self->_reportingApplication;
}

- (NSDate)reportCreationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (SCUIReportVictim)victim
{
  return (SCUIReportVictim *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)suspects
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)unsortedChatTranscript
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUnsortedChatTranscript:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsortedChatTranscript, 0);
  objc_storeStrong((id *)&self->_suspects, 0);
  objc_storeStrong((id *)&self->_victim, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_reportCreationDate, 0);
  objc_storeStrong((id *)&self->_chatRoomName, 0);

  objc_storeStrong((id *)&self->_incidentDate, 0);
}

@end