@interface PKPassContent
+ (BOOL)supportsSecureCoding;
- (NSArray)additionalInfoFields;
- (NSArray)autoTopUpFields;
- (NSArray)auxiliaryPassInformationSections;
- (NSArray)backFieldBuckets;
- (NSArray)balanceFields;
- (NSArray)frontFieldBuckets;
- (NSArray)passDetailSections;
- (NSArray)primaryFields;
- (NSDictionary)allSemantics;
- (NSDictionary)features;
- (NSDictionary)issuerBindingInformation;
- (NSDictionary)semantics;
- (NSSet)balances;
- (NSString)businessChatIdentifier;
- (NSString)cardholderInfoSectionTitle;
- (NSString)logoText;
- (PKFidoProfile)fidoProfile;
- (PKPassBarcodeSettings)barcodeSettings;
- (PKPassContent)initWithCoder:(id)a3;
- (PKPassContent)initWithDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6;
- (PKPassPersonalization)personalization;
- (id)currencyAmountForSemanticKey:(id)a3;
- (id)dateForSemanticKey:(id)a3;
- (id)dictionariesForSemanticKey:(id)a3;
- (id)eventDateInfoForSemanticKey:(id)a3;
- (id)locationForSemanticKey:(id)a3;
- (id)numberForSemanticKey:(id)a3;
- (id)personNameComponentsForSemanticKey:(id)a3;
- (id)stringForSemanticKey:(id)a3;
- (id)stringsForSemanticKey:(id)a3;
- (int64_t)transitType;
- (void)encodeWithCoder:(id)a3;
- (void)flushFormattedFieldValues;
- (void)setAdditionalInfoFields:(id)a3;
- (void)setAllSemantics:(id)a3;
- (void)setAutoTopUpFields:(id)a3;
- (void)setAuxiliaryPassInformationSections:(id)a3;
- (void)setBackFieldBuckets:(id)a3;
- (void)setBalanceFields:(id)a3;
- (void)setBalances:(id)a3;
- (void)setBarcodeSettings:(id)a3;
- (void)setBusinessChatIdentifier:(id)a3;
- (void)setCardholderInfoSectionTitle:(id)a3;
- (void)setFidoProfile:(id)a3;
- (void)setFrontFieldBuckets:(id)a3;
- (void)setIssuerBindingInformation:(id)a3;
- (void)setLogoText:(id)a3;
- (void)setPassDetailSections:(id)a3;
- (void)setPersonalization:(id)a3;
- (void)setSemantics:(id)a3;
- (void)setTransitType:(int64_t)a3;
@end

@implementation PKPassContent

- (NSArray)additionalInfoFields
{
  return self->_additionalInfoFields;
}

- (NSDictionary)allSemantics
{
  return self->_allSemantics;
}

- (NSString)logoText
{
  return self->_logoText;
}

- (PKPassContent)initWithDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  uint64_t v206 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v191.receiver = self;
  v191.super_class = (Class)PKPassContent;
  v13 = [(PKContent *)&v191 initWithDictionary:v10 bundle:v11 privateBundle:v12 passType:a6];
  if (v13)
  {
    v14 = [v11 bundleURL];
    v15 = PKPrivateObjectDictionaryWithError(v14, 0);

    v16 = [(PKContent *)v13 barcode];

    if (!v16)
    {
      v17 = [[PKBarcode alloc] initWithPassDictionary:v15 bundle:v12];
      [(PKContent *)v13 setBarcode:v17];
    }
    unint64_t v18 = PKPassStyleForCardDictionary(v10, v11);
    uint64_t v19 = PKPassStyleDictionaryKeyForCardDictionary(v10);
    v130 = [v10 objectForKey:v19];
    v128 = v15;
    v118 = (void *)v19;
    v127 = [v15 objectForKey:v19];
    char v20 = 0;
    int v21 = 0;
    switch(v18)
    {
      case 0uLL:
      case 1uLL:
        int v21 = 0;
        char v20 = 1;
        goto LABEL_9;
      case 4uLL:
        v22 = [v130 objectForKey:@"transitType"];
        v23 = [NSNumber numberWithInt:0];
        uint64_t v28 = (int)_PKEnumValueFromString(v22, v23, @"PKTransitType", @"PKTransitTypeGeneric, WLTransitTypeGeneric, PKTransitTypeAir, WLTransitTypeAir, PKTransitTypeTrain, WLTransitTypeTrain, PKTransitTypeBus, WLTransitTypeBus, PKTransitTypeBoat, WLTransitTypeBoat", v24, v25, v26, v27, 0);

        [(PKPassContent *)v13 setTransitType:v28];
        char v20 = 0;
        int v21 = 0;
        goto LABEL_9;
      case 6uLL:
      case 7uLL:
        char v20 = 0;
        int v21 = 1;
        goto LABEL_9;
      case 9uLL:
        v29 = [v10 PKStringForKey:@"eventLogoText"];
        char v20 = 0;
        int v21 = 0;
        if (!v29) {
          goto LABEL_9;
        }
        goto LABEL_10;
      default:
LABEL_9:
        v29 = [v10 PKStringForKey:@"logoText"];
LABEL_10:
        v117 = v29;
        PKLocalizedPassStringForPassBundle(v29, v11, v12);
        v116 = v133 = v13;
        -[PKPassContent setLogoText:](v13, "setLogoText:");
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v32 = v12;
        id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v137 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v139 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v141 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v144 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__PKPassContent_initWithDictionary_bundle_privateBundle_passType___block_invoke;
        aBlock[3] = &unk_1E56F4C90;
        id v120 = v11;
        id v35 = v11;
        id v178 = v35;
        v119 = v32;
        id v36 = v32;
        char v189 = v21;
        id v179 = v36;
        unint64_t v188 = a6;
        id v126 = v30;
        id v180 = v126;
        id v132 = v31;
        id v181 = v132;
        char v190 = v20;
        id v37 = v33;
        id v182 = v37;
        id v131 = v137;
        id v183 = v131;
        id v136 = v139;
        id v184 = v136;
        id v125 = v141;
        id v185 = v125;
        id v124 = v144;
        id v186 = v124;
        id v123 = v34;
        id v187 = v123;
        v122 = (void (**)(void *, void *))_Block_copy(aBlock);
        long long v173 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        long long v176 = 0u;
        v129 = v10;
        v38 = [v10 objectForKey:@"backFields"];
        uint64_t v39 = [v38 countByEnumeratingWithState:&v173 objects:v205 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v174;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v174 != v41) {
                objc_enumerationMutation(v38);
              }
              v43 = _FieldForTypeWithDictionaryAndBundle(4, *(void **)(*((void *)&v173 + 1) + 8 * i), v35, v36, 1, v21, a6);
              if (v43) {
                [v136 addObject:v43];
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v173 objects:v205 count:16];
          }
          while (v40);
        }

        v122[2](v122, v130);
        v122[2](v122, v127);
        v204[0] = v132;
        v204[1] = v126;
        v115 = v37;
        v204[2] = v37;
        v204[3] = v131;
        v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v204 count:4];
        v45 = v133;
        [(PKPassContent *)v133 setFrontFieldBuckets:v44];

        id v203 = v136;
        v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v203 count:1];
        [(PKPassContent *)v133 setBackFieldBuckets:v46];

        [(PKPassContent *)v133 setBalanceFields:v125];
        [(PKPassContent *)v133 setAutoTopUpFields:v124];
        [(PKPassContent *)v133 setAdditionalInfoFields:v123];
        v47 = +[PKPassPersonalization passPersonalizationWithPassBundle:v35];
        [(PKPassContent *)v133 setPersonalization:v47];

        id v134 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (v21)
        {
          long long v171 = 0u;
          long long v172 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          v48 = [v130 objectForKey:@"passDetailSections"];
          uint64_t v49 = [v48 countByEnumeratingWithState:&v169 objects:v202 count:16];
          if (v49)
          {
            uint64_t v50 = v49;
            uint64_t v51 = *(void *)v170;
            do
            {
              for (uint64_t j = 0; j != v50; ++j)
              {
                if (*(void *)v170 != v51) {
                  objc_enumerationMutation(v48);
                }
                v53 = [[PKPassDetailSection alloc] initWithDictionary:*(void *)(*((void *)&v169 + 1) + 8 * j) allowedRows:0 bundle:v35 privateBundle:v36];
                [v134 safelyAddObject:v53];
              }
              uint64_t v50 = [v48 countByEnumeratingWithState:&v169 objects:v202 count:16];
            }
            while (v50);
          }

          v45 = v133;
        }
        v54 = (void *)[v134 copy];
        [(PKPassContent *)v45 setPassDetailSections:v54];

        id v140 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v165 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        v55 = [v128 objectForKey:@"auxiliaryPassInformation"];
        uint64_t v56 = [v55 countByEnumeratingWithState:&v165 objects:v201 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v166;
          do
          {
            for (uint64_t k = 0; k != v57; ++k)
            {
              if (*(void *)v166 != v58) {
                objc_enumerationMutation(v55);
              }
              v60 = [[PKPassAuxiliaryPassInformation alloc] initWithInformation:*(void *)(*((void *)&v165 + 1) + 8 * k) bundle:v35 privateBundle:v36 passType:a6];
              [v140 safelyAddObject:v60];
            }
            uint64_t v57 = [v55 countByEnumeratingWithState:&v165 objects:v201 count:16];
          }
          while (v57);
        }

        v61 = (void *)[v140 copy];
        [(PKPassContent *)v133 setAuxiliaryPassInformationSections:v61];

        if (![v132 count])
        {
          uint64_t v62 = [v129 objectForKey:@"topRightBackgroundTitle"];
          v63 = (void *)v62;
          if (v62)
          {
            v199[0] = @"key";
            v199[1] = @"value";
            v200[0] = @"top_right_background_title";
            v200[1] = v62;
            v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v200 forKeys:v199 count:2];
            v65 = _FieldForTypeWithDictionaryAndBundle(0, v64, v35, v36, 0, v21, a6);
            [v132 addObject:v65];
          }
        }
        if (![v131 count])
        {
          uint64_t v66 = [v129 objectForKey:@"topLeftBackgroundTitle"];
          v67 = (void *)v66;
          if (v66)
          {
            v197[0] = @"key";
            v197[1] = @"value";
            v198[0] = @"top_left_background_title";
            v198[1] = v66;
            v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v198 forKeys:v197 count:2];
            v69 = _FieldForTypeWithDictionaryAndBundle(3, v68, v35, v36, 0, v21, a6);
            [v131 addObject:v69];
          }
        }
        v114 = [v129 objectForKeyedSubscript:@"semantics"];
        v121 = PKPassSemanticsFromDictionary(v114, 0, v35, v36);
        -[PKPassContent setSemantics:](v133, "setSemantics:");
        id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v161 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        v71 = [(PKPassContent *)v133 backFieldBuckets];
        v195[0] = v71;
        v72 = [(PKPassContent *)v133 frontFieldBuckets];
        v195[1] = v72;
        v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:2];

        obuint64_t j = v73;
        uint64_t v142 = [v73 countByEnumeratingWithState:&v161 objects:v196 count:16];
        if (v142)
        {
          uint64_t v138 = *(void *)v162;
          do
          {
            uint64_t v74 = 0;
            do
            {
              if (*(void *)v162 != v138) {
                objc_enumerationMutation(obj);
              }
              uint64_t v145 = v74;
              v75 = *(void **)(*((void *)&v161 + 1) + 8 * v74);
              long long v157 = 0u;
              long long v158 = 0u;
              long long v159 = 0u;
              long long v160 = 0u;
              id v76 = v75;
              uint64_t v77 = [v76 countByEnumeratingWithState:&v157 objects:v194 count:16];
              if (v77)
              {
                uint64_t v78 = v77;
                uint64_t v79 = *(void *)v158;
                do
                {
                  for (uint64_t m = 0; m != v78; ++m)
                  {
                    if (*(void *)v158 != v79) {
                      objc_enumerationMutation(v76);
                    }
                    v81 = *(void **)(*((void *)&v157 + 1) + 8 * m);
                    long long v153 = 0u;
                    long long v154 = 0u;
                    long long v155 = 0u;
                    long long v156 = 0u;
                    id v82 = v81;
                    uint64_t v83 = [v82 countByEnumeratingWithState:&v153 objects:v193 count:16];
                    if (v83)
                    {
                      uint64_t v84 = v83;
                      uint64_t v85 = *(void *)v154;
                      do
                      {
                        for (uint64_t n = 0; n != v84; ++n)
                        {
                          if (*(void *)v154 != v85) {
                            objc_enumerationMutation(v82);
                          }
                          v87 = [*(id *)(*((void *)&v153 + 1) + 8 * n) semantics];
                          if (v87) {
                            [v70 addEntriesFromDictionary:v87];
                          }
                        }
                        uint64_t v84 = [v82 countByEnumeratingWithState:&v153 objects:v193 count:16];
                      }
                      while (v84);
                    }
                  }
                  uint64_t v78 = [v76 countByEnumeratingWithState:&v157 objects:v194 count:16];
                }
                while (v78);
              }

              uint64_t v74 = v145 + 1;
            }
            while (v145 + 1 != v142);
            uint64_t v142 = [obj countByEnumeratingWithState:&v161 objects:v196 count:16];
          }
          while (v142);
        }

        v88 = (void *)[v121 mutableCopy];
        [v88 addEntriesFromDictionary:v70];
        v13 = v133;
        [(PKPassContent *)v133 setAllSemantics:v88];
        id v10 = v129;
        v89 = [v129 PKStringForKey:@"businessChatIdentifier"];
        [(PKPassContent *)v133 setBusinessChatIdentifier:v89];

        v90 = [PKPassBarcodeSettings alloc];
        v91 = [v129 PKDictionaryForKey:@"barcodeSettings"];
        v92 = [(PKPassBarcodeSettings *)v90 initWithDictionary:v91];
        [(PKPassContent *)v133 setBarcodeSettings:v92];

        v93 = [v129 PKStringForKey:@"cardholderInfoSectionTitle"];
        [(PKPassContent *)v133 setCardholderInfoSectionTitle:v93];

        uint64_t v94 = objc_opt_class();
        v95 = [v129 PKDictionaryOfKeyClass:v94 valueClass:objc_opt_class() ForKey:@"supportedFeatures"];
        id v96 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v151[0] = MEMORY[0x1E4F143A8];
        v151[1] = 3221225472;
        v151[2] = __66__PKPassContent_initWithDictionary_bundle_privateBundle_passType___block_invoke_2;
        v151[3] = &unk_1E56DCAC8;
        id v97 = v96;
        id v152 = v97;
        [v95 enumerateKeysAndObjectsUsingBlock:v151];
        if ([v97 count])
        {
          uint64_t v98 = [v97 copy];
          features = v133->_features;
          v133->_features = (NSDictionary *)v98;
        }
        v100 = [v129 PKArrayContaining:objc_opt_class() forKey:@"balances"];
        if (v100)
        {
          v143 = v95;
          v146 = v88;
          v101 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v100, "count"));
          long long v147 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          long long v150 = 0u;
          id v102 = v100;
          uint64_t v103 = [v102 countByEnumeratingWithState:&v147 objects:v192 count:16];
          if (v103)
          {
            uint64_t v104 = v103;
            uint64_t v105 = *(void *)v148;
            do
            {
              for (iuint64_t i = 0; ii != v104; ++ii)
              {
                if (*(void *)v148 != v105) {
                  objc_enumerationMutation(v102);
                }
                v107 = [[PKPassBalance alloc] initWithDictionary:*(void *)(*((void *)&v147 + 1) + 8 * ii)];
                [v101 addObject:v107];
              }
              uint64_t v104 = [v102 countByEnumeratingWithState:&v147 objects:v192 count:16];
            }
            while (v104);
          }

          v108 = (void *)[v101 copy];
          v13 = v133;
          [(PKPassContent *)v133 setBalances:v108];

          id v10 = v129;
          v95 = v143;
          v88 = v146;
        }
        v109 = [PKFidoProfile alloc];
        v110 = [v10 PKDictionaryForKey:@"fidoProfile"];
        v111 = [(PKFidoProfile *)v109 initWithDictionary:v110];
        [(PKPassContent *)v13 setFidoProfile:v111];

        v112 = [v10 PKDictionaryForKey:@"issuerBindingData"];
        [(PKPassContent *)v13 setIssuerBindingInformation:v112];

        id v12 = v119;
        id v11 = v120;
        break;
    }
  }

  return v13;
}

void __66__PKPassContent_initWithDictionary_bundle_privateBundle_passType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    v5 = [v3 objectForKey:@"primaryFields"];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v107 objects:v120 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v108 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = _FieldForTypeWithDictionaryAndBundle(1, *(void **)(*((void *)&v107 + 1) + 8 * i), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(void *)(a1 + 112));
          if (v10) {
            [*(id *)(a1 + 48) addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v107 objects:v120 count:16];
      }
      while (v7);
    }

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v11 = [v4 objectForKey:@"headerFields"];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v103 objects:v119 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v104;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v104 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = _FieldForTypeWithDictionaryAndBundle(0, *(void **)(*((void *)&v103 + 1) + 8 * j), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(void *)(a1 + 112));
          if (v16) {
            [*(id *)(a1 + 56) addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v103 objects:v119 count:16];
      }
      while (v13);
    }

    if (*(unsigned char *)(a1 + 121))
    {
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      v17 = [v4 objectForKey:@"secondaryFields"];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v95 objects:v117 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v96;
        do
        {
          for (uint64_t k = 0; k != v19; ++k)
          {
            if (*(void *)v96 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = _FieldForTypeWithDictionaryAndBundle(3, *(void **)(*((void *)&v95 + 1) + 8 * k), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(void *)(a1 + 112));
            if (v22) {
              [*(id *)(a1 + 72) addObject:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v95 objects:v117 count:16];
        }
        while (v19);
      }

      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      obuint64_t j = *(id *)(a1 + 48);
      uint64_t v23 = [obj countByEnumeratingWithState:&v91 objects:v116 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        v69 = v4;
        uint64_t v25 = *(void *)v92;
        do
        {
          for (uint64_t m = 0; m != v24; ++m)
          {
            if (*(void *)v92 != v25) {
              objc_enumerationMutation(obj);
            }
            id v27 = *(id *)(*((void *)&v91 + 1) + 8 * m);
            uint64_t v28 = objc_alloc_init(PKPassField);
            [(PKPassField *)v28 setType:2];
            v29 = [v27 label];
            id v30 = [v27 key];

            id v31 = [v30 stringByAppendingString:@".labelField"];
            [(PKPassField *)v28 setKey:v31];

            [(PKPassField *)v28 setUnformattedValue:v29];
            if (v28) {
              [*(id *)(a1 + 64) addObject:v28];
            }
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v91 objects:v116 count:16];
        }
        while (v24);
        v4 = v69;
      }
    }
    else
    {
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      obuint64_t j = [v4 objectForKey:@"secondaryFields"];
      uint64_t v32 = [obj countByEnumeratingWithState:&v99 objects:v118 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v100;
        do
        {
          for (uint64_t n = 0; n != v33; ++n)
          {
            if (*(void *)v100 != v34) {
              objc_enumerationMutation(obj);
            }
            id v36 = _FieldForTypeWithDictionaryAndBundle(2, *(void **)(*((void *)&v99 + 1) + 8 * n), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(void *)(a1 + 112));
            if (v36) {
              [*(id *)(a1 + 64) addObject:v36];
            }
          }
          uint64_t v33 = [obj countByEnumeratingWithState:&v99 objects:v118 count:16];
        }
        while (v33);
      }
    }

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v37 = [v4 objectForKey:@"auxiliaryFields"];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v87 objects:v115 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v88;
      do
      {
        for (iuint64_t i = 0; ii != v39; ++ii)
        {
          if (*(void *)v88 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = _FieldForTypeWithDictionaryAndBundle(3, *(void **)(*((void *)&v87 + 1) + 8 * ii), *(void **)(a1 + 32), *(void **)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 120), *(void *)(a1 + 112));
          if (v42) {
            [*(id *)(a1 + 72) addObject:v42];
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v87 objects:v115 count:16];
      }
      while (v39);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v43 = [v4 objectForKey:@"backFields"];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v83 objects:v114 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v84;
      do
      {
        for (juint64_t j = 0; jj != v45; ++jj)
        {
          if (*(void *)v84 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = _FieldForTypeWithDictionaryAndBundle(4, *(void **)(*((void *)&v83 + 1) + 8 * jj), *(void **)(a1 + 32), *(void **)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 120), *(void *)(a1 + 112));
          if (v48) {
            [*(id *)(a1 + 80) addObject:v48];
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v83 objects:v114 count:16];
      }
      while (v45);
    }

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v49 = [v4 objectForKey:@"balanceFields"];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v79 objects:v113 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v80;
      do
      {
        for (kuint64_t k = 0; kk != v51; ++kk)
        {
          if (*(void *)v80 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = _FieldForTypeWithDictionaryAndBundle(1, *(void **)(*((void *)&v79 + 1) + 8 * kk), *(void **)(a1 + 32), *(void **)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 120), *(void *)(a1 + 112));
          uint64_t v55 = [v54 foreignReferenceType];
          if (v54) {
            BOOL v56 = (unint64_t)(v55 - 1) > 1;
          }
          else {
            BOOL v56 = 1;
          }
          if (!v56) {
            [*(id *)(a1 + 88) addObject:v54];
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v79 objects:v113 count:16];
      }
      while (v51);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v57 = [v4 objectForKey:@"autoTopUpFields"];
    uint64_t v58 = [v57 countByEnumeratingWithState:&v75 objects:v112 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v76;
      do
      {
        for (muint64_t m = 0; mm != v59; ++mm)
        {
          if (*(void *)v76 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = _FieldForTypeWithDictionaryAndBundle(1, *(void **)(*((void *)&v75 + 1) + 8 * mm), *(void **)(a1 + 32), *(void **)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 120), *(void *)(a1 + 112));
          if (v62) {
            [*(id *)(a1 + 96) addObject:v62];
          }
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v75 objects:v112 count:16];
      }
      while (v59);
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v63 = [v4 objectForKey:@"additionalInfoFields"];
    uint64_t v64 = [v63 countByEnumeratingWithState:&v71 objects:v111 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v72;
      do
      {
        for (nuint64_t n = 0; nn != v65; ++nn)
        {
          if (*(void *)v72 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = _FieldForTypeWithDictionaryAndBundle(1, *(void **)(*((void *)&v71 + 1) + 8 * nn), *(void **)(a1 + 32), *(void **)(a1 + 40), 1, 0, *(void *)(a1 + 112));
          if (v68) {
            [*(id *)(a1 + 104) addObject:v68];
          }
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v71 objects:v111 count:16];
      }
      while (v65);
    }
  }
}

- (NSArray)frontFieldBuckets
{
  return self->_frontFieldBuckets;
}

- (void)setLogoText:(id)a3
{
}

- (NSArray)backFieldBuckets
{
  return self->_backFieldBuckets;
}

- (void)setSemantics:(id)a3
{
}

- (void)setPersonalization:(id)a3
{
}

- (void)setPassDetailSections:(id)a3
{
}

- (void)setIssuerBindingInformation:(id)a3
{
}

- (void)setFrontFieldBuckets:(id)a3
{
}

- (void)setFidoProfile:(id)a3
{
}

- (void)setCardholderInfoSectionTitle:(id)a3
{
}

- (void)setBusinessChatIdentifier:(id)a3
{
}

- (void)setBarcodeSettings:(id)a3
{
}

- (void)setBalanceFields:(id)a3
{
}

- (void)setBackFieldBuckets:(id)a3
{
}

- (void)setAuxiliaryPassInformationSections:(id)a3
{
}

- (void)setAutoTopUpFields:(id)a3
{
}

- (void)setAllSemantics:(id)a3
{
}

- (void)setAdditionalInfoFields:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x192FDC630]();
  v67.receiver = self;
  v67.super_class = (Class)PKPassContent;
  uint64_t v6 = [(PKContent *)&v67 initWithCoder:v4];
  if (v6)
  {
    v6->_transitType = [v4 decodeIntegerForKey:@"transitType"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoText"];
    logoText = v6->_logoText;
    v6->_logoText = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"frontFieldBuckets"];
    frontFieldBuckets = v6->_frontFieldBuckets;
    v6->_frontFieldBuckets = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v11 forKey:@"backFieldBuckets"];
    backFieldBuckets = v6->_backFieldBuckets;
    v6->_backFieldBuckets = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v11 forKey:@"balanceFields"];
    balanceFields = v6->_balanceFields;
    v6->_balanceFields = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v11 forKey:@"autoTopUpFields"];
    autoTopUpFields = v6->_autoTopUpFields;
    v6->_autoTopUpFields = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v11 forKey:@"additionalInfoFields"];
    additionalInfoFields = v6->_additionalInfoFields;
    v6->_additionalInfoFields = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"balances"];
    balances = v6->_balances;
    v6->_balances = (NSSet *)v25;

    id v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"passDetailSections"];
    passDetailSections = v6->_passDetailSections;
    v6->_passDetailSections = (NSArray *)v30;

    uint64_t v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"auxiliaryPassInformation"];
    auxiliaryPassInformationSections = v6->_auxiliaryPassInformationSections;
    v6->_auxiliaryPassInformationSections = (NSArray *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personalization"];
    personalizatiouint64_t n = v6->_personalization;
    v6->_personalizatiouint64_t n = (PKPassPersonalization *)v37;

    uint64_t v39 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"semantics"];
    semantics = v6->_semantics;
    v6->_semantics = (NSDictionary *)v43;

    uint64_t v45 = [v4 decodeObjectOfClasses:v42 forKey:@"allSemantics"];
    allSemantics = v6->_allSemantics;
    v6->_allSemantics = (NSDictionary *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"businessChatIdentifier"];
    businessChatIdentifier = v6->_businessChatIdentifier;
    v6->_businessChatIdentifier = (NSString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcodeSettings"];
    barcodeSettings = v6->_barcodeSettings;
    v6->_barcodeSettings = (PKPassBarcodeSettings *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardholderInfoSectionTitle"];
    cardholderInfoSectionTitle = v6->_cardholderInfoSectionTitle;
    v6->_cardholderInfoSectionTitle = (NSString *)v51;

    v53 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    BOOL v56 = objc_msgSend(v53, "setWithObjects:", v54, v55, objc_opt_class(), 0);
    uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"supportedFeatures"];
    features = v6->_features;
    v6->_features = (NSDictionary *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fidoProfile"];
    fidoProfile = v6->_fidoProfile;
    v6->_fidoProfile = (PKFidoProfile *)v59;

    v61 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v62 = objc_opt_class();
    v63 = objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
    uint64_t v64 = [v4 decodeObjectOfClasses:v63 forKey:@"issuerBindingData"];
    issuerBindingInformatiouint64_t n = v6->_issuerBindingInformation;
    v6->_issuerBindingInformatiouint64_t n = (NSDictionary *)v64;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerBindingInformation, 0);
  objc_storeStrong((id *)&self->_fidoProfile, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_cardholderInfoSectionTitle, 0);
  objc_storeStrong((id *)&self->_barcodeSettings, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_allSemantics, 0);
  objc_storeStrong((id *)&self->_semantics, 0);
  objc_storeStrong((id *)&self->_personalization, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_additionalInfoFields, 0);
  objc_storeStrong((id *)&self->_autoTopUpFields, 0);
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_auxiliaryPassInformationSections, 0);
  objc_storeStrong((id *)&self->_passDetailSections, 0);
  objc_storeStrong((id *)&self->_backFieldBuckets, 0);
  objc_storeStrong((id *)&self->_frontFieldBuckets, 0);
  objc_storeStrong((id *)&self->_logoText, 0);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassContent;
  id v4 = a3;
  [(PKContent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_transitType, @"transitType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_logoText forKey:@"logoText"];
  [v4 encodeObject:self->_frontFieldBuckets forKey:@"frontFieldBuckets"];
  [v4 encodeObject:self->_backFieldBuckets forKey:@"backFieldBuckets"];
  [v4 encodeObject:self->_balanceFields forKey:@"balanceFields"];
  [v4 encodeObject:self->_autoTopUpFields forKey:@"autoTopUpFields"];
  [v4 encodeObject:self->_additionalInfoFields forKey:@"additionalInfoFields"];
  [v4 encodeObject:self->_balances forKey:@"balances"];
  [v4 encodeObject:self->_passDetailSections forKey:@"passDetailSections"];
  [v4 encodeObject:self->_auxiliaryPassInformationSections forKey:@"auxiliaryPassInformation"];
  [v4 encodeObject:self->_personalization forKey:@"personalization"];
  [v4 encodeObject:self->_semantics forKey:@"semantics"];
  [v4 encodeObject:self->_allSemantics forKey:@"allSemantics"];
  [v4 encodeObject:self->_businessChatIdentifier forKey:@"businessChatIdentifier"];
  [v4 encodeObject:self->_barcodeSettings forKey:@"barcodeSettings"];
  [v4 encodeObject:self->_cardholderInfoSectionTitle forKey:@"cardholderInfoSectionTitle"];
  [v4 encodeObject:self->_features forKey:@"supportedFeatures"];
  [v4 encodeObject:self->_fidoProfile forKey:@"fidoProfile"];
  [v4 encodeObject:self->_issuerBindingInformation forKey:@"issuerBindingData"];
}

void __66__PKPassContent_initWithDictionary_bundle_privateBundle_passType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[PKPassFeatureConfiguration alloc] initWithDictionary:v5];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (void)flushFormattedFieldValues
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v3 = self->_frontFieldBuckets;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v38;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v34;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v33 + 1) + 8 * v13++) flushCachedValue];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v5);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v14 = self->_backFieldBuckets;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * v18);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v26;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v26 != v23) {
                objc_enumerationMutation(v20);
              }
              [*(id *)(*((void *)&v25 + 1) + 8 * v24++) flushCachedValue];
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
          }
          while (v22);
        }

        ++v18;
      }
      while (v18 != v16);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v16);
  }
}

- (NSArray)primaryFields
{
  if ([(NSArray *)self->_frontFieldBuckets count] < 2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(NSArray *)self->_frontFieldBuckets objectAtIndexedSubscript:1];
  }
  return (NSArray *)v3;
}

- (id)stringForSemanticKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassContent *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 stringValue];

  return v7;
}

- (id)dateForSemanticKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassContent *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 dateValue];

  return v7;
}

- (id)eventDateInfoForSemanticKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassContent *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 eventDateInfoValue];

  return v7;
}

- (id)numberForSemanticKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassContent *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 numberValue];

  return v7;
}

- (id)locationForSemanticKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassContent *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 locationValue];

  return v7;
}

- (id)currencyAmountForSemanticKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassContent *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 currencyAmountValue];

  return v7;
}

- (id)personNameComponentsForSemanticKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassContent *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 personNameComponentsValue];

  return v7;
}

- (id)stringsForSemanticKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassContent *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 stringsValue];

  return v7;
}

- (id)dictionariesForSemanticKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassContent *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 dictionariesValue];

  return v7;
}

- (int64_t)transitType
{
  return self->_transitType;
}

- (void)setTransitType:(int64_t)a3
{
  self->_transitType = a3;
}

- (NSArray)passDetailSections
{
  return self->_passDetailSections;
}

- (NSArray)auxiliaryPassInformationSections
{
  return self->_auxiliaryPassInformationSections;
}

- (NSArray)balanceFields
{
  return self->_balanceFields;
}

- (NSArray)autoTopUpFields
{
  return self->_autoTopUpFields;
}

- (NSSet)balances
{
  return self->_balances;
}

- (void)setBalances:(id)a3
{
}

- (PKPassPersonalization)personalization
{
  return self->_personalization;
}

- (NSDictionary)semantics
{
  return self->_semantics;
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (PKPassBarcodeSettings)barcodeSettings
{
  return self->_barcodeSettings;
}

- (NSString)cardholderInfoSectionTitle
{
  return self->_cardholderInfoSectionTitle;
}

- (NSDictionary)features
{
  return self->_features;
}

- (PKFidoProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (NSDictionary)issuerBindingInformation
{
  return self->_issuerBindingInformation;
}

@end