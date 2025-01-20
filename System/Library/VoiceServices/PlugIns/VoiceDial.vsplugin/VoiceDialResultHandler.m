@interface VoiceDialResultHandler
- (id)_nameSource;
- (id)_phoneticNames:(id)a3 fromDictionary:(id)a4;
- (id)actionForRecognitionResults:(id)a3;
- (void)_addressBook;
@end

@implementation VoiceDialResultHandler

- (id)_nameSource
{
  nameSource = self->_nameSource;
  if (!nameSource)
  {
    v4 = VSPreferencesCopySpokenLanguageIdentifier();
    v5 = +[VoiceDialNameDataSource nameDataSourceForLanguageIdentifier:v4];
    v6 = self->_nameSource;
    self->_nameSource = v5;

    nameSource = self->_nameSource;
  }

  return nameSource;
}

- (void)_addressBook
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_22A5EB000, a2, OS_LOG_TYPE_ERROR, "Could not create address book: %@", (uint8_t *)&v3, 0xCu);
}

- (id)_phoneticNames:(id)a3 fromDictionary:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7)
  {
    id v11 = 0;
    v9 = 0;
LABEL_16:

    id v11 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  v9 = 0;
  char v10 = 0;
  id v11 = 0;
  uint64_t v12 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v5);
      }
      uint64_t v14 = [v6 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];

      if (v14) {
        v9 = (__CFString *)v14;
      }
      else {
        v9 = &stru_26DE2E3C8;
      }
      if (!v11) {
        id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      v10 |= v14 != 0;
      [v11 addObject:v9];
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v8);
  if ((v10 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_17:

  return v11;
}

- (id)actionForRecognitionResults:(id)a3
{
  uint64_t v330 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectAtIndex:0];
  id v6 = [v5 recognitionAction];
  uint64_t v7 = objc_alloc_init(VoiceDialResultHandlerContext);
  VoiceDialConfigureSpokenLocalizedLabel(1);
  VoiceDialCopyErrorActionForResult(v5);
  uint64_t v8 = (VoiceDialVoicemailRecognitionAction *)objc_claimAutoreleasedReturnValue();
  v248 = v4;
  v258 = v5;
  v253 = v6;
  if (v8
    || ([v5 valueOfFirstElementWithClassIdentifier:@"voicemail"],
        long long v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v18)
    && (uint64_t v8 = objc_alloc_init(VoiceDialVoicemailRecognitionAction)) != 0)
  {
    v240 = 0;
    v241 = v8;
    v268 = 0;
    v270 = v7;
    v249 = 0;
    v250 = 0;
    v295 = 0;
    v296 = 0;
    v254 = 0;
    v255 = 0;
    CFMutableStringRef v260 = 0;
    v263 = 0;
    v256 = 0;
    v257 = 0;
    v285 = 0;
    id v290 = 0;
    v278 = 0;
    obuint64_t j = 0;
    v242 = 0;
    v244 = 0;
    v266 = 0;
    v246 = 0;
    v9 = 0;
    v252 = 0;
    v273 = 0;
    v276 = 0;
    v259 = 0;
    char v10 = 0;
    id v11 = 0;
    uint64_t v12 = 0;
    v13 = 0;
    uint64_t v14 = 0;
    v15 = 0;
    long long v16 = 0;
    long long v17 = 0;
    goto LABEL_221;
  }
  id v311 = 0;
  id v310 = 0;
  id v309 = 0;
  VoiceDialCopyNamesLabelAndTypeFromRecognitionResults(v4, &v311, &v310, &v309);
  id v19 = v311;
  id v20 = v310;
  uint64_t v21 = (__CFString *)v309;
  uint64_t v22 = objc_msgSend(v5, "valueOfFirstElementWithClassIdentifier:");
  if (v22)
  {
    v23 = @"labeltype-phone";

    BOOL v243 = 0;
    uint64_t v21 = v23;
  }
  else
  {
    BOOL v243 = v21 != 0;
  }
  v295 = v21;
  v296 = v20;
  v259 = v19;
  v239 = (void *)v22;
  v274 = self;
  if (v19 && (id v291 = [(VoiceDialResultHandler *)self _addressBook]) != 0)
  {
    v24 = [(VoiceDialResultHandler *)self _nameSource];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      v25 = [v6 knownValueForClassIdentifier:@"nickname"];
      if (v25)
      {
        v26 = v19;
        v27 = v24;
        long long v307 = 0u;
        long long v308 = 0u;
        long long v305 = 0u;
        long long v306 = 0u;
        id obja = v26;
        uint64_t v28 = [obja countByEnumeratingWithState:&v305 objects:v326 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          v30 = v7;
          id v31 = 0;
          uint64_t v32 = *(void *)v306;
          do
          {
            uint64_t v33 = 0;
            v34 = v31;
            do
            {
              if (*(void *)v306 != v32) {
                objc_enumerationMutation(obja);
              }
              id v31 = *(id *)(*((void *)&v305 + 1) + 8 * v33);

              [(VoiceDialResultHandlerContext *)v30 setNameToMatch:v31];
              VoiceDialSendNameAndExtendedLabelMatches(v291, v27, 0, 1, v25, v20, v295, (uint64_t (*)(id, __CFString *, const void *, uint64_t, void, void, uint64_t))_ResultHandlerAddressBookCallback, (uint64_t)v30);
              ++v33;
              v34 = v31;
            }
            while (v29 != v33);
            uint64_t v29 = [obja countByEnumeratingWithState:&v305 objects:v326 count:16];
          }
          while (v29);

          id v5 = v258;
          id v6 = v253;
          uint64_t v7 = v30;
        }

        v35 = [(VoiceDialResultHandlerContext *)v7 compositeNames];
        uint64_t v36 = [v35 count];

        if (!v36)
        {
          v37 = objc_alloc_init(VoiceDialResultHandlerContext);

          uint64_t v7 = v37;
        }
        v24 = v27;
        id v19 = v259;
      }
      if (![(VoiceDialResultHandlerContext *)v7 resultStatus]
        && (([v6 knownValuesForClassIdentifier:@"firstname"],
             (v278 = objc_claimAutoreleasedReturnValue()) != 0)
         || ([v6 knownValuesForClassIdentifier:@"lastname"],
             (v278 = objc_claimAutoreleasedReturnValue()) != 0)))
      {
        v264 = v25;
        v39 = v19;
        v40 = v24;
        long long v303 = 0u;
        long long v304 = 0u;
        long long v301 = 0u;
        long long v302 = 0u;
        id v41 = v39;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v301 objects:v325 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          v44 = v7;
          id v45 = 0;
          uint64_t v46 = *(void *)v302;
          v47 = v278;
          do
          {
            uint64_t v48 = 0;
            v49 = v45;
            do
            {
              if (*(void *)v302 != v46) {
                objc_enumerationMutation(v41);
              }
              id v45 = *(id *)(*((void *)&v301 + 1) + 8 * v48);

              if ([v47 containsObject:v45])
              {
                [(VoiceDialResultHandlerContext *)v44 setRequiredNameMatchType:2];
                VoiceDialSendNameAndExtendedLabelMatches(v291, v40, 0, 0, v45, v20, v295, (uint64_t (*)(id, __CFString *, const void *, uint64_t, void, void, uint64_t))_ResultHandlerAddressBookCallback, (uint64_t)v44);
                v47 = v278;
                [(VoiceDialResultHandlerContext *)v44 setRequiredNameMatchType:0xFFFFFFFFLL];
              }
              ++v48;
              v49 = v45;
            }
            while (v43 != v48);
            uint64_t v43 = [v41 countByEnumeratingWithState:&v301 objects:v325 count:16];
          }
          while (v43);

          id v5 = v258;
          uint64_t v7 = v44;
          uint64_t v22 = (uint64_t)v239;
        }

        v50 = [(VoiceDialResultHandlerContext *)v7 compositeNames];
        uint64_t v51 = [v50 count];

        if (v51)
        {
          int v271 = 0;
        }
        else
        {
          v52 = objc_alloc_init(VoiceDialResultHandlerContext);

          int v271 = 0;
          uint64_t v7 = v52;
        }
        v24 = v40;
        id v19 = v259;
        v25 = v264;
      }
      else
      {
        v278 = 0;
        int v271 = 0;
      }
    }
    else
    {
      v25 = 0;
      v278 = 0;
      int v271 = 1;
    }
    if ([(VoiceDialResultHandlerContext *)v7 resultStatus])
    {
      v38 = 0;
    }
    else
    {
      v265 = v25;
      long long v299 = 0u;
      long long v300 = 0u;
      long long v297 = 0u;
      long long v298 = 0u;
      id objb = v19;
      uint64_t v53 = [objb countByEnumeratingWithState:&v297 objects:v324 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        v55 = v7;
        id v56 = 0;
        v38 = 0;
        uint64_t v57 = *(void *)v298;
        do
        {
          for (uint64_t i = 0; i != v54; ++i)
          {
            v59 = v56;
            if (*(void *)v298 != v57) {
              objc_enumerationMutation(objb);
            }
            id v56 = *(id *)(*((void *)&v297 + 1) + 8 * i);

            uint64_t v60 = [(VoiceDialResultHandlerContext *)v55 nicknameMatchCount];
            VoiceDialSendNameAndExtendedLabelMatches(v291, v24, 0, (isKindOfClass ^ 1) & 1, v56, v296, v295, (uint64_t (*)(id, __CFString *, const void *, uint64_t, void, void, uint64_t))_ResultHandlerAddressBookCallback, (uint64_t)v55);
            if ((isKindOfClass & 1) == 0
              && [(VoiceDialResultHandlerContext *)v55 nicknameMatchCount] > v60)
            {
              id v61 = v56;

              v38 = v61;
            }
          }
          uint64_t v54 = [objb countByEnumeratingWithState:&v297 objects:v324 count:16];
        }
        while (v54);

        id v5 = v258;
        id v19 = v259;
        uint64_t v7 = v55;
        uint64_t v22 = (uint64_t)v239;
      }
      else
      {
        v38 = 0;
      }

      v25 = v265;
    }
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v278 = 0;
    v38 = 0;
    int v271 = 1;
  }
  v263 = v25;
  v249 = v24;
  v235 = v38;
  if (v22)
  {
    v62 = 0;
  }
  else
  {
    id v63 = objc_alloc(MEMORY[0x263EFF9C0]);
    v64 = [(VoiceDialResultHandlerContext *)v7 localizedPhoneLabels];
    uint64_t v65 = [v63 initWithSet:v64];

    v62 = (void *)v65;
    v66 = [(VoiceDialResultHandlerContext *)v7 localizedEmailLabels];
    [v62 intersectSet:v66];

    v67 = [(VoiceDialResultHandlerContext *)v7 localizedPhoneLabels];
    [v67 minusSet:v62];

    v68 = [(VoiceDialResultHandlerContext *)v7 localizedEmailLabels];
    [v68 minusSet:v62];
  }
  v69 = [(VoiceDialResultHandlerContext *)v7 compositeNames];
  uint64_t v70 = [v69 count];

  v71 = [(VoiceDialResultHandlerContext *)v7 localizedPhoneLabels];
  uint64_t v72 = [v71 count];

  v73 = [(VoiceDialResultHandlerContext *)v7 localizedEmailLabels];
  uint64_t v292 = [v73 count];

  v238 = v62;
  uint64_t v74 = [v62 count];
  if ([(VoiceDialResultHandlerContext *)v7 resultStatus] != 1)
  {
    v254 = 0;
    v255 = 0;
    v75 = 0;
    v240 = 0;
    v250 = 0;
    v252 = 0;
    v256 = 0;
    v257 = 0;
    v288 = 0;
    id v293 = 0;
    id objd = 0;
    v76 = 0;
    id v232 = 0;
    v233 = 0;
    id v77 = 0;
    v234 = 0;
    v236 = 0;
    v229 = 0;
    v78 = 0;
    v276 = 0;
    goto LABEL_169;
  }
  objc = (char *)v72;
  uint64_t v287 = v70;
  if (v70 == 1)
  {
    if (v292 + v72 > 1 || v74)
    {
      if (!v22)
      {
        uint64_t v261 = v74;
        v79 = objc_alloc_init(VoiceDialResultHandlerContext);
        v80 = [(VoiceDialResultHandler *)v274 _addressBook];
        v81 = [(VoiceDialResultHandlerContext *)v7 compositeNames];
        [v81 anyObject];
        v83 = v82 = v7;
        VoiceDialSendNameAndExtendedLabelMatches(v80, v249, 0, v271, v83, v296, v295, (uint64_t (*)(id, __CFString *, const void *, uint64_t, void, void, uint64_t))_ResultHandlerAddressBookCallback, (uint64_t)v79);

        if ([(VoiceDialResultHandlerContext *)v79 resultStatus])
        {
          uint64_t v7 = v79;
        }
        else
        {
          uint64_t v7 = v82;
        }

        id v267 = 0;
        id v5 = v258;
LABEL_85:
        uint64_t v74 = v261;
        goto LABEL_86;
      }
    }
    else if ([(VoiceDialResultHandlerContext *)v7 resultPerson])
    {
      [(VoiceDialResultHandlerContext *)v7 setResultStatus:2];
      uint64_t v261 = 0;
      if (v72 <= 0) {
        [(VoiceDialResultHandlerContext *)v7 unlocalizedEmailLabels];
      }
      else {
      id v84 = [(VoiceDialResultHandlerContext *)v7 unlocalizedPhoneLabels];
      }

      [(VoiceDialResultHandlerContext *)v7 setMatchedLabelType:v72 > 0];
      id v267 = v84;
      CFStringRef v85 = ABAddressBookCopyLocalizedLabel((CFStringRef)[v84 anyObject]);
      if (v85)
      {
        CFStringRef v86 = v85;
        uint64_t v87 = [(VoiceDialResultHandlerContext *)v7 resultPerson];
        if (v22) {
          id MostLikelyFacetimeContactWithPersonAndLabel = VoiceDialCopyMostLikelyNumberWithPersonAndLabel(v87, (uint64_t)v86);
        }
        else {
          id MostLikelyFacetimeContactWithPersonAndLabel = VoiceDialGetMostLikelyFacetimeContactWithPersonAndLabel(v87, (uint64_t)v86);
        }
        v89 = MostLikelyFacetimeContactWithPersonAndLabel;
        if (MostLikelyFacetimeContactWithPersonAndLabel)
        {
          if ([(VoiceDialResultHandlerContext *)v7 contactInfo]) {
            CFRelease([(VoiceDialResultHandlerContext *)v7 contactInfo]);
          }
          [(VoiceDialResultHandlerContext *)v7 setContactInfo:CFRetain(v89)];
        }
        CFRelease(v86);
      }
      goto LABEL_85;
    }
  }
  id v267 = 0;
LABEL_86:
  if ([(VoiceDialResultHandlerContext *)v7 resultStatus] == 1)
  {
    v90 = (void *)[objc_alloc(MEMORY[0x263F84E70]) initWithModelIdentifier:@"com.apple.voicedial"];
    v91 = v90;
    if (v22) {
      v92 = @"namelabel";
    }
    else {
      v92 = @"namelonglabel";
    }
    if (v22) {
      v93 = @"command";
    }
    else {
      v93 = @"facetime";
    }
    [v90 setSequenceTag:v92];
    v94 = v93;
    [v5 valueOfFirstElementWithClassIdentifier:v94];
    v257 = v277 = v91;
    v234 = v94;
    objc_msgSend(v91, "setKnownValue:phoneticValue:forClassIdentifier:");
    uint64_t v95 = v287;
    uint64_t v262 = v74;
    if (v287 == 1)
    {
      v96 = [(VoiceDialResultHandlerContext *)v7 compositeNames];
      uint64_t v97 = [v96 anyObject];

      v98 = [(VoiceDialResultHandlerContext *)v7 spokenCompositeNames];
      uint64_t v99 = [v98 count];

      if (v99)
      {
        v100 = [(VoiceDialResultHandlerContext *)v7 spokenCompositeNames];
        v101 = [v100 anyObject];

        if (!v101 || ![(__CFString *)v101 isEqualToString:v97])
        {
LABEL_99:
          [v277 setKnownValue:v97 phoneticValue:v101 forClassIdentifier:@"name"];
          v102 = [(VoiceDialResultHandlerContext *)v7 lastNamesByFirstNames];
          uint64_t v103 = [v102 count];

          if (v103)
          {
            v104 = [(VoiceDialResultHandlerContext *)v7 lastNamesByFirstNames];
            v105 = kVoiceDialFirstNameClassIdentifier;
          }
          else
          {
            v111 = [(VoiceDialResultHandlerContext *)v7 firstNamesByLastNames];
            uint64_t v112 = [v111 count];

            if (!v112)
            {
LABEL_110:
              v233 = 0;
              v236 = 0;
              v256 = 0;
              v109 = 0;
              v110 = 0;
LABEL_111:
              uint64_t v74 = v262;
              goto LABEL_112;
            }
            v104 = [(VoiceDialResultHandlerContext *)v7 firstNamesByLastNames];
            v105 = kVoiceDialLastNameClassIdentifier;
          }
          v113 = [v104 allKeys];
          [v277 setKnownValues:v113 phoneticValues:0 forClassIdentifier:*v105];

          goto LABEL_110;
        }
      }
      v101 = 0;
      goto LABEL_99;
    }
    if (v287 < 2)
    {
      v233 = 0;
      v236 = 0;
      v256 = 0;
      v101 = 0;
      uint64_t v97 = 0;
      v109 = 0;
      v110 = 0;
LABEL_112:
      v269 = v110;
      v255 = v109;
      v252 = v101;
      v288 = (__CFString *)v97;
      if (&objc[v292] != (char *)1 || v74)
      {
        if ((uint64_t)&objc[v292 + v74] >= 1)
        {
          v117 = (void *)MEMORY[0x263EFF980];
          v118 = [(VoiceDialResultHandlerContext *)v7 localizedPhoneLabels];
          v119 = [v118 allObjects];
          v120 = [v117 arrayWithArray:v119];

          v121 = [(VoiceDialResultHandlerContext *)v7 localizedEmailLabels];
          v122 = [v121 allObjects];
          [v120 addObjectsFromArray:v122];

          v123 = [v238 allObjects];
          [v120 addObjectsFromArray:v123];

          if (v120)
          {
            v240 = v120;
            [v277 setAmbiguousValues:v120 phoneticValues:0 forClassIdentifier:@"label"];
            v229 = 0;
            v254 = 0;
            int v245 = 1;
LABEL_122:
            char v247 = 1;
LABEL_123:
            id v275 = objc_alloc_init(MEMORY[0x263EFF980]);
            v124 = [(VoiceDialResultHandlerContext *)v7 localizedPhoneLabels];
            v125 = v7;
            v126 = [(VoiceDialResultHandlerContext *)v7 localizedEmailLabels];
            id v127 = v124;
            id v128 = v126;
            id v129 = v238;
            v130 = [MEMORY[0x263EFF9C0] set];
            long long v320 = 0u;
            long long v321 = 0u;
            long long v322 = 0u;
            long long v323 = 0u;
            id v131 = v127;
            uint64_t v132 = [v131 countByEnumeratingWithState:&v320 objects:v329 count:16];
            if (v132)
            {
              uint64_t v133 = v132;
              uint64_t v134 = *(void *)v321;
              do
              {
                for (uint64_t j = 0; j != v133; ++j)
                {
                  if (*(void *)v321 != v134) {
                    objc_enumerationMutation(v131);
                  }
                  [v130 addObject:*(void *)(*((void *)&v320 + 1) + 8 * j)];
                }
                uint64_t v133 = [v131 countByEnumeratingWithState:&v320 objects:v329 count:16];
              }
              while (v133);
            }

            long long v318 = 0u;
            long long v319 = 0u;
            long long v316 = 0u;
            long long v317 = 0u;
            id v136 = v128;
            uint64_t v137 = [v136 countByEnumeratingWithState:&v316 objects:v328 count:16];
            if (v137)
            {
              uint64_t v138 = v137;
              uint64_t v139 = *(void *)v317;
              do
              {
                for (uint64_t k = 0; k != v138; ++k)
                {
                  if (*(void *)v317 != v139) {
                    objc_enumerationMutation(v136);
                  }
                  [v130 addObject:*(void *)(*((void *)&v316 + 1) + 8 * k)];
                }
                uint64_t v138 = [v136 countByEnumeratingWithState:&v316 objects:v328 count:16];
              }
              while (v138);
            }
            id obje = v131;
            v272 = v125;
            v251 = v136;

            long long v314 = 0u;
            long long v315 = 0u;
            long long v312 = 0u;
            long long v313 = 0u;
            id v294 = v129;
            uint64_t v141 = [v294 countByEnumeratingWithState:&v312 objects:v327 count:16];
            if (v141)
            {
              uint64_t v142 = v141;
              uint64_t v143 = *(void *)v313;
              do
              {
                for (uint64_t m = 0; m != v142; ++m)
                {
                  if (*(void *)v313 != v143) {
                    objc_enumerationMutation(v294);
                  }
                  uint64_t v145 = *(void *)(*((void *)&v312 + 1) + 8 * m);
                  v146 = NSString;
                  v147 = VoiceDialSpokenLocalizedString(@"SPOKEN_LABEL_WITH_PHONE");
                  v148 = objc_msgSend(v146, "stringWithFormat:", v147, v145);
                  [v130 addObject:v148];

                  v149 = NSString;
                  v150 = VoiceDialSpokenLocalizedString(@"SPOKEN_LABEL_WITH_%@_EMAIL");
                  v151 = objc_msgSend(v149, "stringWithFormat:", v150, v145);
                  [v130 addObject:v151];
                }
                uint64_t v142 = [v294 countByEnumeratingWithState:&v312 objects:v327 count:16];
              }
              while (v142);
            }

            v152 = [v130 allObjects];

            id v77 = v275;
            if (v257) {
              objc_msgSend(v275, "addObject:");
            }
            v75 = v269;
            uint64_t v7 = v272;
            v78 = v267;
            if (v269) {
              [v275 addObjectsFromArray:v269];
            }
            if ((unint64_t)[v269 count] <= 1 && v152) {
              [v275 addObjectsFromArray:v152];
            }
            v250 = v152;
            [v277 setKeywords:v275];
            v153 = v277;
            v276 = v153;
            if (v247)
            {
              if (v262 > 0) {
                int v154 = 1;
              }
              else {
                int v154 = v245;
              }
              if (v154 == 1)
              {
                uint64_t v155 = _CommaSeparatedStringFromArray(v152);
                VoiceDialSpokenLocalizedString(@"AMBIGUOUS_LABEL_STATUS_STRING");
                id objd = (id)objc_claimAutoreleasedReturnValue();
                id v156 = [NSString alloc];
                v157 = VoiceDialSpokenLocalizedString(@"AMBIGUOUS_LABELS_SPOKEN_FORMAT");
                v158 = v252;
                if (!v252) {
                  v158 = v288;
                }
                v159 = v156;
                v76 = (void *)v155;
                id v293 = (id)objc_msgSend(v159, "initWithFormat:", v157, v158, v155);

                id v77 = v275;
                v153 = v276;
              }
              else
              {
                id v293 = 0;
                id objd = 0;
                v76 = 0;
              }
              id v161 = 0;
              uint64_t v22 = (uint64_t)v239;
            }
            else
            {
              v160 = v153;
              VoiceDialSpokenLocalizedString(@"AMBIGUOUS_NAMES_STATUS_STRING");
              id objd = (id)objc_claimAutoreleasedReturnValue();
              if (v256)
              {
                id v293 = v256;
                id v161 = 0;
              }
              else
              {
                if (v255) {
                  v162 = v255;
                }
                else {
                  v162 = v269;
                }
                v163 = _CommaSeparatedStringFromArray(v162);
                id v164 = [NSString alloc];
                v165 = VoiceDialSpokenLocalizedString(@"AMBIGUOUS_NAMES_SPOKEN_FORMAT_QUESTION_%@");
                v166 = v164;
                id v77 = v275;
                id v293 = (id)objc_msgSend(v166, "initWithFormat:", v165, v163);

                v78 = v267;
                id v161 = v163;
              }
              uint64_t v22 = (uint64_t)v239;
              v153 = v160;
              v76 = 0;
            }
            id v232 = v161;
            [(VoiceDialVoicemailRecognitionAction *)v153 setRepeatedSpokenFeedbackString:v161];
            goto LABEL_169;
          }
        }
        int v245 = 0;
        v229 = 0;
      }
      else
      {
        v114 = [(VoiceDialResultHandlerContext *)v7 localizedPhoneLabels];
        uint64_t v115 = [v114 anyObject];

        if (!v115)
        {
          v116 = [(VoiceDialResultHandlerContext *)v7 localizedEmailLabels];
          uint64_t v115 = [v116 anyObject];
        }
        v229 = (void *)v115;
        [v277 setKnownValue:v115 phoneticValue:0 forClassIdentifier:@"label"];
        int v245 = 0;
      }
      v240 = 0;
      v254 = 0;
      goto LABEL_122;
    }
    v106 = [(VoiceDialResultHandlerContext *)v7 lastNamesByFirstNames];
    if ([v106 count] == 1)
    {

LABEL_105:
      v107 = [(VoiceDialResultHandlerContext *)v7 lastNamesByFirstNames];
      v108 = kVoiceDialFirstNameClassIdentifier;
      goto LABEL_228;
    }
    if ([(VoiceDialResultHandlerContext *)v7 allNamesMatchedType]
      && ![(VoiceDialResultHandlerContext *)v7 lastNameMatchType])
    {
      unint64_t v228 = [v19 count];

      uint64_t v95 = v287;
      if (v228 > 1) {
        goto LABEL_105;
      }
    }
    else
    {
    }
    v211 = [(VoiceDialResultHandlerContext *)v7 firstNamesByLastNames];
    if ([v211 count] == 1)
    {

LABEL_227:
      v107 = [(VoiceDialResultHandlerContext *)v7 firstNamesByLastNames];
      v108 = kVoiceDialLastNameClassIdentifier;
LABEL_228:
      v212 = *v108;
      v233 = v212;
      if (v107)
      {
        v213 = v212;
        v214 = [v107 allKeys];
        v237 = v107;
        v254 = [v107 mergeSetValuesIntoArray];
        [v91 setKnownValues:v214 phoneticValues:0 forClassIdentifier:v213];
        v215 = [(VoiceDialResultHandlerContext *)v7 compositeNames];
        v269 = [v215 allObjects];

        v216 = [(VoiceDialResultHandlerContext *)v7 spokenCompositeNames];
        v217 = [v216 allObjects];

        v255 = v217;
        if ((unint64_t)[v217 count] < 6)
        {
          v256 = 0;
        }
        else
        {
          id v218 = [NSString alloc];
          v219 = VoiceDialSpokenLocalizedString(@"MANY_AMBIGUOUS_NAMES_SPOKEN_FORMAT_QUESTION_%@");
          [v214 lastObject];
          v221 = v220 = v7;
          v256 = objc_msgSend(v218, "initWithFormat:", v219, v221);

          uint64_t v7 = v220;
          uint64_t v95 = v287;
        }
        v222 = v237;
        goto LABEL_240;
      }
LABEL_239:
      v224 = [(VoiceDialResultHandlerContext *)v7 topLevelNonNickNames];
      v254 = [v224 allObjects];

      v225 = [(VoiceDialResultHandlerContext *)v7 compositeNames];
      v269 = [v225 allObjects];

      v214 = [(VoiceDialResultHandlerContext *)v7 spokenCompositeNames];
      v255 = [v214 allObjects];
      v256 = 0;
      v222 = 0;
LABEL_240:

      if ([(VoiceDialResultHandlerContext *)v7 nicknameMatchCount] >= 1
        && [(VoiceDialResultHandlerContext *)v7 nicknameMatchCount] < v95
        && v235)
      {
        [v91 setKnownValue:v235 phoneticValue:0 forClassIdentifier:@"nickname"];
      }
      v236 = v222;
      if (v254)
      {
        v226 = [(VoiceDialResultHandlerContext *)v7 phoneticNamesByName];
        v227 = [(VoiceDialResultHandler *)v274 _phoneticNames:v254 fromDictionary:v226];
        [v91 setAmbiguousValues:v254 phoneticValues:v227 forClassIdentifier:@"name"];

        int v245 = 0;
        v229 = 0;
        v240 = 0;
        v288 = 0;
        v252 = 0;
        char v247 = 0;
        goto LABEL_123;
      }
      v101 = 0;
      uint64_t v97 = 0;
      v110 = v269;
      v109 = v255;
      goto LABEL_111;
    }
    if ([(VoiceDialResultHandlerContext *)v7 allNamesMatchedType]
      && [(VoiceDialResultHandlerContext *)v7 lastNameMatchType] == 1)
    {
      unint64_t v223 = [v19 count];

      if (v223 > 1) {
        goto LABEL_227;
      }
    }
    else
    {
    }
    v233 = 0;
    goto LABEL_239;
  }
  v254 = 0;
  v255 = 0;
  v75 = 0;
  v240 = 0;
  v250 = 0;
  v252 = 0;
  v256 = 0;
  v257 = 0;
  v288 = 0;
  id v293 = 0;
  id objd = 0;
  v76 = 0;
  id v232 = 0;
  v233 = 0;
  id v77 = 0;
  v234 = 0;
  v236 = 0;
  v229 = 0;
  v276 = 0;
  v78 = v267;
LABEL_169:
  v268 = v75;
  v270 = v7;
  v273 = v77;
  v246 = v76;
  if ([(VoiceDialResultHandlerContext *)v7 resultStatus] == 2)
  {
    if (v22)
    {
      v167 = [VoiceDialRecognitionAction alloc];
      uint64_t v168 = [(VoiceDialResultHandlerContext *)v7 contactInfo];
      if ([(VoiceDialResultHandlerContext *)v7 resultPerson]) {
        uint64_t RecordID = ABRecordGetRecordID([(VoiceDialResultHandlerContext *)v7 resultPerson]);
      }
      else {
        uint64_t RecordID = 0xFFFFFFFFLL;
      }
      uint64_t v178 = [(VoiceDialRecognitionAction *)v167 initWithPhoneNumber:v168 uid:RecordID];
    }
    else
    {
      v175 = [VoiceDialFacetimeRecognitionAction alloc];
      uint64_t v176 = [(VoiceDialResultHandlerContext *)v7 contactInfo];
      if ([(VoiceDialResultHandlerContext *)v7 resultPerson]) {
        uint64_t v177 = ABRecordGetRecordID([(VoiceDialResultHandlerContext *)v7 resultPerson]);
      }
      else {
        uint64_t v177 = 0xFFFFFFFFLL;
      }
      uint64_t v178 = [(VoiceDialFacetimeRecognitionAction *)v175 initWithContactInfo:v176 uid:v177];
    }
    v171 = (VoiceDialVoicemailRecognitionAction *)v178;

    if ([(VoiceDialResultHandlerContext *)v7 resultPerson])
    {
      v179 = (__CFString *)ABRecordCopyCompositeName([(VoiceDialResultHandlerContext *)v7 resultPerson]);
      CFMutableStringRef v180 = VoiceDialPersonCopyCompositeName([(VoiceDialResultHandlerContext *)v7 resultPerson], 3);
    }
    else
    {
      v179 = 0;
      CFMutableStringRef v180 = 0;
    }
    CFMutableStringRef v260 = v180;
    if ([(VoiceDialResultHandlerContext *)v7 matchedLabelType] == 1) {
      [(VoiceDialResultHandlerContext *)v7 localizedPhoneLabels];
    }
    else {
    id v181 = [(VoiceDialResultHandlerContext *)v7 localizedEmailLabels];
    }

    if ([(VoiceDialResultHandlerContext *)v7 matchedLabelType] == 1) {
      [(VoiceDialResultHandlerContext *)v7 unlocalizedPhoneLabels];
    }
    else {
    id v182 = [(VoiceDialResultHandlerContext *)v7 unlocalizedEmailLabels];
    }

    id v230 = v182;
    id v231 = v181;
    if (v181)
    {
      v183 = [v181 anyObject];
      v184 = [v182 anyObject];
      v266 = (__CFString *)ABAddressBookCopyLocalizedLabel(v184);
    }
    else
    {
      v183 = 0;
      v266 = 0;
    }
    v244 = v179;
    if ([(__CFString *)v179 length])
    {
      v172 = v179;

      if ([v183 length] && -[__CFString length](v266, "length"))
      {
        if (v22) {
          v185 = @"CONFIRMED_SPOKEN_NAME_LABEL_FORMAT_CALLING_%@_%@";
        }
        else {
          v185 = @"CONFIRMED_FACETIME_SPOKEN_NAME_LABEL_FORMAT_STARTING_FACETIME_WITH_%@_%@";
        }
        if (v22) {
          v186 = @"CONFIRMED_DISPLAY_NAME_LABEL_FORMAT_CALLING_%@";
        }
        else {
          v186 = @"CONFIRMED_FACETIME_DISPLAY_NAME_LABEL_FORMAT_FACETIME_%@";
        }
        if (v243)
        {
          int v187 = [(VoiceDialResultHandlerContext *)v270 matchedLabelType];
          v188 = NSString;
          if (v187 == 1) {
            v189 = @"SPOKEN_LABEL_WITH_PHONE";
          }
          else {
            v189 = @"SPOKEN_LABEL_WITH_%@_EMAIL";
          }
          v190 = VoiceDialSpokenLocalizedString(v189);
          uint64_t v191 = objc_msgSend(v188, "stringWithFormat:", v190, v183);

          v186 = @"CONFIRMED_FACETIME_DISPLAY_NAME_LABEL_FORMAT_FACETIME_%@";
          v192 = (void *)v191;
          v185 = @"CONFIRMED_FACETIME_SPOKEN_NAME_LABEL_FORMAT_STARTING_FACETIME_WITH_%@_%@";
        }
        else
        {
          v192 = v183;
        }
        v170 = v238;
        id v204 = [NSString alloc];
        v205 = VoiceDialBundle();
        v206 = [v205 localizedStringForKey:v186 value:&stru_26DE2E3C8 table:@"Feedback"];
        uint64_t v207 = objc_msgSend(v204, "initWithFormat:", v206, v266);

        id v208 = [NSString alloc];
        v202 = VoiceDialSpokenLocalizedString(v185);
        v242 = v192;
        uint64_t v173 = objc_msgSend(v208, "initWithFormat:", v202, v260, v192);

        uint64_t v174 = v207;
      }
      else
      {
        v242 = v183;
        id v193 = [NSString alloc];
        v194 = VoiceDialBundle();
        v195 = v194;
        v170 = v238;
        if (v22)
        {
          v196 = [v194 localizedStringForKey:@"CONFIRMED_DISPLAY_STRING" value:&stru_26DE2E3C8 table:@"Feedback"];
          uint64_t v289 = [v193 initWithString:v196];
          v197 = @"CONFIRMED_SPOKEN_NAME_FORMAT";
        }
        else
        {
          v196 = [v194 localizedStringForKey:@"CONFIRMED_FACETIME_DISPLAY_STRING" value:&stru_26DE2E3C8 table:@"Feedback"];
          uint64_t v289 = [v193 initWithFormat:v196];
          v197 = @"CONFIRMED_FACETIME_SPOKEN_NAME_FORMAT_STARTING_FACETIME_WITH_%@";
        }

        id v203 = [NSString alloc];
        v202 = VoiceDialSpokenLocalizedString(v197);
        uint64_t v173 = objc_msgSend(v203, "initWithFormat:", v202, v260);

        uint64_t v174 = v289;
      }
    }
    else
    {
      v242 = v183;
      v170 = v238;
      v198 = VoiceDialBundle();
      v199 = v198;
      if (v22) {
        v200 = @"CONFIRMED_DISPLAY_STRING";
      }
      else {
        v200 = @"CONFIRMED_FACETIME_DISPLAY_STRING";
      }
      if (v22) {
        v201 = @"CONFIRMED_SPOKEN_STRING";
      }
      else {
        v201 = @"CONFIRMED_FACETIME_SPOKEN_STRING";
      }
      uint64_t v174 = [v198 localizedStringForKey:v200 value:&stru_26DE2E3C8 table:@"Feedback"];

      uint64_t v173 = VoiceDialSpokenLocalizedString(v201);
      v172 = v288;
      v202 = v293;
    }
  }
  else
  {
    v170 = v238;
    v242 = 0;
    v244 = 0;
    CFMutableStringRef v260 = 0;
    v266 = 0;
    id v230 = v78;
    id v231 = 0;
    v171 = v276;
    v172 = v288;
    uint64_t v173 = (uint64_t)v293;
    uint64_t v174 = (uint64_t)objd;
  }
  v285 = v172;
  id v290 = (id)v173;
  obuint64_t j = (id)v174;
  [(VSRecognitionAction *)v171 setStatusDisplayString:v174];
  [(VSRecognitionAction *)v171 setSpokenFeedbackString:v173];
  v241 = v171;
  [(VSRecognitionAction *)v171 setResultDisplayString:v172];

  id v11 = v239;
  uint64_t v12 = v234;
  char v10 = v235;
  v9 = v232;
  uint64_t v14 = v233;
  v13 = v236;
  v15 = v229;
  long long v17 = v230;
  long long v16 = v231;
LABEL_221:
  VoiceDialConfigureSpokenLocalizedLabel(0);
  v209 = v241;

  return v209;
}

- (void).cxx_destruct
{
}

@end