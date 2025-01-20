@interface PRPosterMutableConfiguredProperties
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)_isImmutable;
- (BOOL)applyUpdate:(id)a3 error:(id *)a4;
- (BOOL)applyUpdates:(id)a3 error:(id *)a4;
- (void)mergeConfiguredProperties:(id)a3;
@end

@implementation PRPosterMutableConfiguredProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)mergeConfiguredProperties:(id)a3
{
  id v52 = a3;
  uint64_t v4 = [v52 titleStyleConfiguration];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(PRPosterConfiguredProperties *)self titleStyleConfiguration];

    if (!v6)
    {
      v7 = [v52 titleStyleConfiguration];
      [(PRPosterConfiguredProperties *)self setTitleStyleConfiguration:v7];
    }
  }
  uint64_t v8 = [v52 complicationLayout];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(PRPosterConfiguredProperties *)self complicationLayout];

    if (!v10)
    {
      v11 = [v52 complicationLayout];
      [(PRPosterConfiguredProperties *)self setComplicationLayout:v11];
    }
  }
  uint64_t v12 = [v52 focusConfiguration];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PRPosterConfiguredProperties *)self focusConfiguration];

    if (!v14)
    {
      v15 = [v52 focusConfiguration];
      [(PRPosterConfiguredProperties *)self setFocusConfiguration:v15];
    }
  }
  uint64_t v16 = [v52 renderingConfiguration];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(PRPosterConfiguredProperties *)self renderingConfiguration];

    if (!v18)
    {
      v19 = [v52 renderingConfiguration];
      [(PRPosterConfiguredProperties *)self setRenderingConfiguration:v19];
    }
  }
  uint64_t v20 = [v52 homeScreenConfiguration];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(PRPosterConfiguredProperties *)self homeScreenConfiguration];

    if (!v22)
    {
      v23 = [v52 homeScreenConfiguration];
      [(PRPosterConfiguredProperties *)self setHomeScreenConfiguration:v23];
    }
  }
  uint64_t v24 = [v52 colorVariationsConfiguration];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(PRPosterConfiguredProperties *)self colorVariationsConfiguration];

    if (!v26)
    {
      v27 = [v52 colorVariationsConfiguration];
      [(PRPosterConfiguredProperties *)self setColorVariationsConfiguration:v27];
    }
  }
  uint64_t v28 = [v52 quickActionsConfiguration];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(PRPosterConfiguredProperties *)self quickActionsConfiguration];

    if (!v30)
    {
      v31 = [v52 quickActionsConfiguration];
      [(PRPosterConfiguredProperties *)self setQuickActionsConfiguration:v31];
    }
  }
  uint64_t v32 = [v52 ambientConfiguration];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(PRPosterConfiguredProperties *)self ambientConfiguration];

    if (!v34)
    {
      v35 = [v52 ambientConfiguration];
      [(PRPosterConfiguredProperties *)self setAmbientConfiguration:v35];
    }
  }
  uint64_t v36 = [v52 suggestionMetadata];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(PRPosterConfiguredProperties *)self suggestionMetadata];

    if (!v38)
    {
      v39 = [v52 suggestionMetadata];
      [(PRPosterConfiguredProperties *)self setSuggestionMetadata:v39];
    }
  }
  uint64_t v40 = [v52 otherMetadata];
  if (v40)
  {
    v41 = (void *)v40;
    v42 = [(PRPosterConfiguredProperties *)self otherMetadata];

    if (!v42)
    {
      v43 = [v52 otherMetadata];
      [(PRPosterConfiguredProperties *)self setOtherMetadata:v43];
    }
  }
  uint64_t v44 = [v52 ambientWidgetLayout];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [(PRPosterConfiguredProperties *)self ambientWidgetLayout];

    if (!v46)
    {
      v47 = [v52 ambientWidgetLayout];
      [(PRPosterConfiguredProperties *)self setAmbientWidgetLayout:v47];
    }
  }
  uint64_t v48 = [v52 userInfo];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(PRPosterConfiguredProperties *)self userInfo];

    if (!v50)
    {
      v51 = [v52 userInfo];
      [(PRPosterConfiguredProperties *)self setUserInfo:v51];
    }
  }
}

- (BOOL)_isImmutable
{
  return 0;
}

- (BOOL)applyUpdate:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  id v11 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v11 count:1];

  BOOL v9 = -[PRPosterMutableConfiguredProperties applyUpdates:error:](self, "applyUpdates:error:", v8, a4, v11, v12);
  return v9;
}

- (BOOL)applyUpdates:(id)a3 error:(id *)a4
{
  uint64_t v288 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    char v228 = 1;
    goto LABEL_228;
  }
  long long v258 = 0u;
  long long v259 = 0u;
  long long v256 = 0u;
  long long v257 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v256 objects:v287 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v257;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v257 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = [*(id *)(*((void *)&v256 + 1) + 8 * i) type];
        if (v12 <= 0xB && ((1 << v12) & 0xCC0) != 0)
        {
          if (a4)
          {
            v226 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v285 = *MEMORY[0x1E4F28588];
            v286 = @"Update type not supported!";
            v227 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v286 forKeys:&v285 count:1];
            objc_msgSend(v226, "pr_errorWithCode:userInfo:", 2, v227);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          char v228 = 0;
          goto LABEL_227;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v256 objects:v287 count:16];
    }
    while (v9);
  }
  v14 = v7;

  id v7 = (id)[(PRPosterMutableConfiguredProperties *)self mutableCopy];
  long long v252 = 0u;
  long long v253 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v252 objects:v284 count:16];
  BOOL v17 = v16 != 0;
  if (!v16)
  {
    char v231 = 0;
    char v232 = 0;
    char v233 = 0;
    char v223 = 0;
    goto LABEL_221;
  }
  uint64_t v18 = v16;
  BOOL v240 = v16 != 0;
  v241 = self;
  v242 = a4;
  id v243 = v6;
  uint64_t v245 = 0;
  char v244 = 0;
  char v248 = 0;
  char v246 = 0;
  uint64_t v250 = *MEMORY[0x1E4F28588];
  uint64_t v251 = *(void *)v253;
  id v247 = v15;
LABEL_16:
  uint64_t v19 = 0;
  uint64_t v249 = v18;
  while (2)
  {
    if (*(void *)v253 != v251) {
      objc_enumerationMutation(v15);
    }
    uint64_t v20 = *(void **)(*((void *)&v252 + 1) + 8 * v19);
    uint64_t v21 = [v20 type];
    switch(v21)
    {
      case 1:
      case 2:
      case 8:
        v22 = [v20 payload];
        uint64_t v23 = objc_opt_class();
        id v24 = v22;
        if (v23)
        {
          if (objc_opt_isKindOfClass()) {
            v25 = v24;
          }
          else {
            v25 = 0;
          }
        }
        else
        {
          v25 = 0;
        }
        id v30 = v25;

        if (!v30
          || v21 == 2
          && ([v30 complications],
              v31 = objc_claimAutoreleasedReturnValue(),
              unint64_t v32 = [v31 count],
              v31,
              v32 >= 2))
        {
          v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v280 = v250;
          v281 = @"Complication payload was invalid; expected only 1 complication";
          v34 = (void *)MEMORY[0x1E4F1C9E8];
          v35 = &v281;
          uint64_t v36 = &v280;
          goto LABEL_33;
        }
        v39 = [v7 complicationLayout];
        uint64_t v40 = v39;
        if (v39) {
          v41 = v39;
        }
        else {
          v41 = [[PRPosterComplicationLayout alloc] initWithInlineComplication:0 sidebarComplicationIconLayout:0 sidebarComplications:0 complicationIconLayout:0 complications:0];
        }
        v37 = v41;

        switch(v21)
        {
          case 1:
            v171 = [PRPosterComplicationLayout alloc];
            v87 = [v37 inlineComplication];
            v88 = [v37 sidebarComplications];
            v172 = v30;
            goto LABEL_150;
          case 8:
            v171 = [PRPosterComplicationLayout alloc];
            v87 = [v37 inlineComplication];
            v88 = [v30 complications];
            v172 = v37;
LABEL_150:
            v89 = [v172 complications];
            uint64_t v91 = [(PRPosterComplicationLayout *)v171 initWithInlineComplication:v87 sidebarComplicationIconLayout:0 sidebarComplications:v88 complicationIconLayout:0 complications:v89];

LABEL_151:
            uint64_t v18 = v249;

            [v7 setComplicationLayout:v91];
            id v52 = 0;
            int v53 = 1;
            v37 = (void *)v91;
            char v246 = 1;
            goto LABEL_202;
          case 2:
            v86 = [PRPosterComplicationLayout alloc];
            v87 = [v30 complications];
            v88 = [v87 firstObject];
            v89 = [v37 sidebarComplications];
            v90 = [v37 complications];
            uint64_t v91 = [(PRPosterComplicationLayout *)v86 initWithInlineComplication:v88 sidebarComplicationIconLayout:0 sidebarComplications:v89 complicationIconLayout:0 complications:v90];

            id v15 = v247;
            goto LABEL_151;
        }
        v173 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v278 = v250;
        v279 = @"Complication payload was invalid";
        v174 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v279 forKeys:&v278 count:1];
        objc_msgSend(v173, "pr_errorWithCode:userInfo:", 3, v174);
        id v52 = (id)objc_claimAutoreleasedReturnValue();

LABEL_44:
        int v53 = 0;
        goto LABEL_202;
      case 3:
      case 4:
      case 5:
        v26 = [v20 payload];
        uint64_t v27 = objc_opt_class();
        id v28 = v26;
        if (v27)
        {
          if (objc_opt_isKindOfClass()) {
            v29 = v28;
          }
          else {
            v29 = 0;
          }
        }
        else
        {
          v29 = 0;
        }
        id v30 = v29;

        v42 = [v30 tristate];
        uint64_t v43 = [v42 BOOLValue];

        if (!v30
          || ([v30 tristate], uint64_t v44 = objc_claimAutoreleasedReturnValue(), v44, !v44))
        {
          uint64_t v48 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v268 = v250;
          v269 = @"Home Screen Legibility payload was invalid; expecting BOOL value not nil";
          v49 = (void *)MEMORY[0x1E4F1C9E8];
          v50 = &v269;
          v51 = &v268;
          goto LABEL_42;
        }
        v37 = [v7 homeScreenConfiguration];
        v45 = (void *)[v37 mutableCopy];
        v46 = v45;
        if (v45) {
          id v47 = v45;
        }
        else {
          id v47 = (id)objc_opt_new();
        }
        v92 = v47;

        if (v21 == 5)
        {
          v97 = [v92 lockPosterAppearance];
          int v98 = [v97 allowsModifyingLegibilityBlur];

          if (v98)
          {
            v95 = [v92 lockPosterAppearance];
            v96 = (void *)[v95 copyWithLegibilityBlurEnabled:v43];
            [v92 setLockPosterAppearance:v96];
            goto LABEL_89;
          }
          v200 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v264 = v250;
          v265 = @"Lock Screen Poster Apperance payload was invalid; does not allow modifying legibility blur";
          v201 = (void *)MEMORY[0x1E4F1C9E8];
          v202 = &v265;
          v203 = &v264;
        }
        else
        {
          if (v21 != 4) {
            goto LABEL_179;
          }
          v93 = [v92 homePosterAppearance];
          int v94 = [v93 allowsModifyingLegibilityBlur];

          if (v94)
          {
            v95 = [v92 homePosterAppearance];
            v96 = (void *)[v95 copyWithLegibilityBlurEnabled:v43];
            [v92 setHomePosterAppearance:v96];
LABEL_89:

            goto LABEL_179;
          }
          v200 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v266 = v250;
          v267 = @"Home Screen Poster Apperance payload was invalid; does not allow modifying legibility blur";
          v201 = (void *)MEMORY[0x1E4F1C9E8];
          v202 = &v267;
          v203 = &v266;
        }
        v204 = [v201 dictionaryWithObjects:v202 forKeys:v203 count:1];
        objc_msgSend(v200, "pr_errorWithCode:userInfo:", 3, v204);
        id v52 = (id)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          int v53 = 0;
          goto LABEL_180;
        }
LABEL_179:
        [v7 setHomeScreenConfiguration:v92];
        id v52 = 0;
        int v53 = 1;
        char v248 = 1;
LABEL_180:

        id v15 = v247;
        goto LABEL_202;
      case 6:
      case 7:
      case 10:
      case 11:
        if (v242)
        {
          v234 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v262 = v250;
          v263 = @"Update type not supported!";
          v235 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v263 forKeys:&v262 count:1];
          objc_msgSend(v234, "pr_errorWithCode:userInfo:", 2, v235);
          id *v242 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v52 = 0;
        goto LABEL_226;
      case 9:
        v54 = [v20 payload];
        uint64_t v55 = objc_opt_class();
        id v56 = v54;
        if (v55)
        {
          if (objc_opt_isKindOfClass()) {
            v57 = v56;
          }
          else {
            v57 = 0;
          }
        }
        else
        {
          v57 = 0;
        }
        id v30 = v57;

        if (v30)
        {
          v37 = [v30 propertyListRoot];
          v99 = [PRPosterAmbientWidgetLayout alloc];
          if (v37) {
            v100 = v37;
          }
          else {
            v100 = (void *)MEMORY[0x1E4F1CC08];
          }
          v101 = [(PRPosterAmbientWidgetLayout *)v99 initWithDictionary:v100];
          [v7 setAmbientWidgetLayout:v101];

          id v52 = 0;
          int v53 = 1;
          LOBYTE(v245) = 1;
          goto LABEL_202;
        }
        uint64_t v48 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v274 = v250;
        v275 = @"Ambient Widgets payload was invalid";
        v49 = (void *)MEMORY[0x1E4F1C9E8];
        v50 = &v275;
        v51 = &v274;
LABEL_42:
        v37 = [v49 dictionaryWithObjects:v50 forKeys:v51 count:1];
        v38 = v48;
        goto LABEL_43;
      case 12:
        v58 = [v20 payload];
        uint64_t v59 = objc_opt_class();
        id v60 = v58;
        if (v59)
        {
          if (objc_opt_isKindOfClass()) {
            v61 = v60;
          }
          else {
            v61 = 0;
          }
        }
        else
        {
          v61 = 0;
        }
        id v30 = v61;

        v102 = [v7 ambientConfiguration];
        v103 = (void *)[v102 mutableCopy];
        v104 = v103;
        if (v103) {
          id v105 = v103;
        }
        else {
          id v105 = (id)objc_opt_new();
        }
        v37 = v105;

        v143 = [v30 propertyListRoot];
        v144 = [v143 objectForKey:@"creationBehavior"];

        BOOL v145 = v144 != 0;
        if (v144
          && ([v30 propertyListRoot],
              v146 = objc_claimAutoreleasedReturnValue(),
              [v146 objectForKey:@"creationBehavior"],
              v147 = objc_claimAutoreleasedReturnValue(),
              uint64_t v148 = [v147 unsignedIntegerValue],
              v147,
              v146,
              [v37 creationBehavior] != v148))
        {
          [v37 setCreationBehavior:v148];
          char v149 = 1;
        }
        else
        {
          char v149 = 0;
        }
        v175 = [v30 propertyListRoot];
        v176 = [v175 objectForKey:@"deletionBehavior"];

        if (v176)
        {
          v177 = [v30 propertyListRoot];
          v178 = [v177 objectForKey:@"deletionBehavior"];
          uint64_t v179 = [v178 unsignedIntegerValue];

          if ([v37 deletionBehavior] == v179)
          {
            BOOL v145 = 1;
          }
          else
          {
            [v37 setDeletionBehavior:v179];
            BOOL v145 = 1;
            char v149 = 1;
          }
        }
        v180 = [v30 propertyListRoot];
        v181 = [v180 objectForKey:@"supportedDataLayout"];

        if (v181)
        {
          v182 = [v30 propertyListRoot];
          v183 = [v182 objectForKey:@"supportedDataLayout"];
          uint64_t v184 = [v183 unsignedIntegerValue];

          if ([v37 supportedDataLayout] == v184)
          {
            BOOL v145 = 1;
          }
          else
          {
            [v37 setSupportedDataLayout:v184];
            BOOL v145 = 1;
            char v149 = 1;
          }
        }
        v185 = [v30 propertyListRoot];
        v186 = [v185 objectForKey:@"editingBehavior"];

        if (v186)
        {
          v187 = [v30 propertyListRoot];
          v188 = [v187 objectForKey:@"editingBehavior"];
          uint64_t v189 = [v188 unsignedIntegerValue];

          if ([v37 editingBehavior] != v189)
          {
            [v37 setEditingBehavior:v189];
LABEL_167:
            v190 = (void *)[v37 copy];
            [v7 setAmbientConfiguration:v190];
            id v52 = 0;
            int v53 = 1;
            char v244 = 1;
            goto LABEL_197;
          }
        }
        else if (!v145)
        {
          v191 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v272 = v250;
          v273 = @"No changes could be applied; input was not valid";
          v192 = (void *)MEMORY[0x1E4F1C9E8];
          v193 = &v273;
          v194 = &v272;
          goto LABEL_196;
        }
        if (v149) {
          goto LABEL_167;
        }
        v191 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v270 = v250;
        v271 = @"No changes could be applied; input was valid but matched existing values";
        v192 = (void *)MEMORY[0x1E4F1C9E8];
        v193 = &v271;
        v194 = &v270;
LABEL_196:
        v190 = [v192 dictionaryWithObjects:v193 forKeys:v194 count:1];
        objc_msgSend(v191, "pr_errorWithCode:userInfo:", 3, v190);
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        int v53 = 0;
LABEL_197:

        goto LABEL_201;
      case 13:
        v62 = [v20 payload];
        uint64_t v63 = objc_opt_class();
        id v64 = v62;
        if (v63)
        {
          if (objc_opt_isKindOfClass()) {
            v65 = v64;
          }
          else {
            v65 = 0;
          }
        }
        else
        {
          v65 = 0;
        }
        id v30 = v65;

        if (v30)
        {
          v106 = [v30 tristate];
          if (v106)
          {
            v107 = [v30 tristate];
            uint64_t v108 = [v107 BOOLValue];
          }
          else
          {
            uint64_t v108 = 0;
          }

          v37 = [v7 homeScreenConfiguration];
          v195 = [v37 customizationConfiguration];
          int v196 = [v195 isDimmed];

          if (v108 == v196)
          {
            uint64_t v18 = v249;
LABEL_174:

            goto LABEL_205;
          }
          v197 = (void *)[v37 mutableCopy];
          v198 = v197;
          if (v197) {
            id v199 = v197;
          }
          else {
            id v199 = (id)objc_opt_new();
          }
          v218 = v199;

          v219 = [v218 customizationConfiguration];
          v220 = [v219 configurationUpdatingDimmed:v108];
          [v218 setCustomizationConfiguration:v220];

          [v7 setHomeScreenConfiguration:v218];
LABEL_200:
          id v52 = 0;
          int v53 = 1;
          char v248 = 1;
LABEL_201:
          uint64_t v18 = v249;
        }
        else
        {
          v150 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v276 = v250;
          v277 = @"Home Screen Legibility payload was invalid; expecting BOOL value not nil";
          int v53 = 1;
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v277 forKeys:&v276 count:1];
          objc_msgSend(v150, "pr_errorWithCode:userInfo:", 3, v37);
          id v52 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_202:

LABEL_203:
        if (v53 && !v52)
        {
LABEL_205:
          if (v18 != ++v19) {
            continue;
          }
          uint64_t v222 = [v15 countByEnumeratingWithState:&v252 objects:v284 count:16];
          uint64_t v18 = v222;
          if (!v222)
          {

            char v223 = v246;
            if (v246)
            {
              v224 = [v7 complicationLayout];
              v225 = v241;
              [(PRPosterConfiguredProperties *)v241 setComplicationLayout:v224];
            }
            else
            {
              v225 = v241;
            }
            if (v248)
            {
              v237 = [v7 homeScreenConfiguration];
              [(PRPosterConfiguredProperties *)v225 setHomeScreenConfiguration:v237];

              char v233 = 1;
            }
            else
            {
              char v233 = 0;
            }
            if (v244)
            {
              v238 = [v7 ambientConfiguration];
              [(PRPosterConfiguredProperties *)v225 setAmbientConfiguration:v238];

              char v232 = 1;
            }
            else
            {
              char v232 = 0;
            }
            id v6 = v243;
            BOOL v17 = v240;
            if (v245)
            {
              v239 = [v7 ambientWidgetLayout];
              [(PRPosterConfiguredProperties *)v225 setAmbientWidgetLayout:v239];

              char v231 = 1;
              if ((v245 & 0x100000000) == 0)
              {
                BOOL v17 = 0;
                goto LABEL_222;
              }
            }
            else
            {
              char v231 = 0;
              if ((v245 & 0x100000000) == 0)
              {
                BOOL v17 = 0;
                goto LABEL_222;
              }
            }
            id v15 = [v7 userInfo];
            [(PRPosterConfiguredProperties *)v225 setUserInfo:v15];
LABEL_221:

LABEL_222:
            char v228 = v17 | v231 | v232 | v233 | v223;
            goto LABEL_227;
          }
          goto LABEL_16;
        }
        if (!v52)
        {
          v229 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v260 = v250;
          v261 = @"unknown error updating configured properties";
          v230 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v261 forKeys:&v260 count:1];
          objc_msgSend(v229, "pr_errorWithCode:userInfo:", 0, v230);
          id v52 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v242)
        {
          id v52 = v52;
          id *v242 = v52;
        }
LABEL_226:

        char v228 = 0;
        id v6 = v243;
LABEL_227:

LABEL_228:
        return v228 & 1;
      case 14:
        v66 = [v20 payload];
        uint64_t v67 = objc_opt_class();
        id v68 = v66;
        if (v67)
        {
          if (objc_opt_isKindOfClass()) {
            v69 = v68;
          }
          else {
            v69 = 0;
          }
        }
        else
        {
          v69 = 0;
        }
        id v109 = v69;

        v110 = [v20 payload];
        uint64_t v111 = objc_opt_class();
        id v112 = v110;
        if (v111)
        {
          if (objc_opt_isKindOfClass()) {
            v113 = v112;
          }
          else {
            v113 = 0;
          }
        }
        else
        {
          v113 = 0;
        }
        id v151 = v113;

        if (v151)
        {
          id v152 = objc_alloc_init(MEMORY[0x1E4F927C8]);
          v153 = [v151 color];
          v154 = [v153 UIColor];
          uint64_t v155 = [v152 copyWithVariatedColor:v154];
          goto LABEL_144;
        }
        v156 = [v109 variation];
        if (v156 || ([v109 luminance], (v156 = objc_claimAutoreleasedReturnValue()) != 0))
        {

LABEL_143:
          id v157 = objc_alloc(MEMORY[0x1E4F927C8]);
          v153 = [v109 variation];
          [v153 doubleValue];
          double v159 = v158;
          v154 = [v109 luminance];
          [v154 doubleValue];
          double v161 = v160;
          id v152 = [v109 saturation];
          [v152 doubleValue];
          uint64_t v155 = [v157 initWithVariation:v159 luminance:v161 saturation:v162];
LABEL_144:
          v163 = (void *)v155;

          goto LABEL_145;
        }
        v221 = [v109 saturation];

        if (v221) {
          goto LABEL_143;
        }
        v163 = 0;
LABEL_145:
        v164 = [v7 homeScreenConfiguration];
        v165 = [v164 customizationConfiguration];
        v166 = [v165 tintColorStyle];
        char v167 = [v166 isEqual:v163];

        if ((v167 & 1) == 0)
        {
          v168 = (void *)[v164 mutableCopy];
          v169 = v168;
          if (v168) {
            id v170 = v168;
          }
          else {
            id v170 = (id)objc_opt_new();
          }
          v215 = v170;

          v216 = [v215 customizationConfiguration];
          v217 = [v216 configurationUpdatingTintColorStyle:v163];
          [v215 setCustomizationConfiguration:v217];

          [v7 setHomeScreenConfiguration:v215];
          char v248 = 1;
        }

        uint64_t v18 = v249;
        if (v167)
        {
          id v15 = v247;
          goto LABEL_205;
        }
        id v52 = 0;
        int v53 = 1;
        id v15 = v247;
        goto LABEL_203;
      case 15:
        v70 = [v20 payload];
        uint64_t v71 = objc_opt_class();
        id v72 = v70;
        if (v71)
        {
          if (objc_opt_isKindOfClass()) {
            v73 = v72;
          }
          else {
            v73 = 0;
          }
        }
        else
        {
          v73 = 0;
        }
        id v114 = v73;

        id v30 = [v114 color];

        v37 = [v7 homeScreenConfiguration];
        v115 = [v37 customizationConfiguration];
        v116 = [v115 suggestedTintColor];
        char v117 = [v116 isEqual:v30];

        if (v117) {
          goto LABEL_174;
        }
        v118 = (void *)[v37 mutableCopy];
        v119 = v118;
        if (v118) {
          id v120 = v118;
        }
        else {
          id v120 = (id)objc_opt_new();
        }
        v205 = v120;

        v206 = [v205 customizationConfiguration];
        v207 = [v30 UIColor];
        v208 = [v206 configurationUpdatingSuggestedTintColor:v207];
        [v205 setCustomizationConfiguration:v208];

        [v7 setHomeScreenConfiguration:v205];
        goto LABEL_200;
      case 16:
        v74 = [v20 payload];
        uint64_t v75 = objc_opt_class();
        id v76 = v74;
        if (v75)
        {
          if (objc_opt_isKindOfClass()) {
            v77 = v76;
          }
          else {
            v77 = 0;
          }
        }
        else
        {
          v77 = 0;
        }
        id v121 = v77;

        v122 = [v121 tristate];

        v123 = @"SMALL";
        if (v122)
        {
          int v124 = [v122 BOOLValue];
          v125 = @"LARGE";
          if (!v124) {
            v125 = @"SMALL";
          }
          v126 = v125;

          v123 = v126;
        }
        v127 = [v7 homeScreenConfiguration];
        v128 = [v127 customizationConfiguration];
        v129 = [v128 iconUserInterfaceSize];
        char v130 = [v129 isEqual:v123];

        if ((v130 & 1) == 0)
        {
          v131 = (void *)[v127 mutableCopy];
          v132 = v131;
          if (v131) {
            id v133 = v131;
          }
          else {
            id v133 = (id)objc_opt_new();
          }
          v209 = v133;

          v210 = [v127 customizationConfiguration];
          v211 = [v210 configurationUpdatingIconUserInterfaceSize:v123];
          [v209 setCustomizationConfiguration:v211];

          [v7 setHomeScreenConfiguration:v209];
          char v248 = 1;
          id v15 = v247;
          uint64_t v18 = v249;
        }

        if ((v130 & 1) == 0) {
          goto LABEL_186;
        }
        goto LABEL_205;
      case 17:
        v78 = [v20 payload];
        uint64_t v79 = objc_opt_class();
        id v80 = v78;
        if (v79)
        {
          if (objc_opt_isKindOfClass()) {
            v81 = v80;
          }
          else {
            v81 = 0;
          }
        }
        else
        {
          v81 = 0;
        }
        id v134 = v81;

        id v30 = [v134 propertyListRoot];

        v37 = [v7 homeScreenConfiguration];
        v135 = [v37 customizationConfiguration];
        v136 = [v135 iconUserInterfaceStyleType];
        char v137 = [v136 isEqual:v30];

        if (v137) {
          goto LABEL_174;
        }
        v138 = (void *)[v37 mutableCopy];
        v139 = v138;
        if (v138) {
          id v140 = v138;
        }
        else {
          id v140 = (id)objc_opt_new();
        }
        v212 = v140;

        v213 = [v37 customizationConfiguration];
        v214 = [v213 configurationUpdatingIconUserInterfaceStyle:v30];
        [v212 setCustomizationConfiguration:v214];

        [v7 setHomeScreenConfiguration:v212];
        id v52 = 0;
        int v53 = 1;
        char v248 = 1;
        goto LABEL_202;
      case 18:
        v82 = [v20 payload];
        uint64_t v83 = objc_opt_class();
        id v84 = v82;
        if (v83)
        {
          if (objc_opt_isKindOfClass()) {
            v85 = v84;
          }
          else {
            v85 = 0;
          }
        }
        else
        {
          v85 = 0;
        }
        id v30 = v85;

        if (v30)
        {
          uint64_t v141 = [v30 propertyListRoot];
          v37 = (void *)v141;
          if (v141) {
            uint64_t v142 = v141;
          }
          else {
            uint64_t v142 = MEMORY[0x1E4F1CC08];
          }
          [v7 setUserInfo:v142];
          id v52 = 0;
          int v53 = 1;
          BYTE4(v245) = 1;
          goto LABEL_202;
        }
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v282 = v250;
        v283 = @"userInfo payload was invalid";
        v34 = (void *)MEMORY[0x1E4F1C9E8];
        v35 = &v283;
        uint64_t v36 = &v282;
LABEL_33:
        v37 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:1];
        v38 = v33;
LABEL_43:
        objc_msgSend(v38, "pr_errorWithCode:userInfo:", 3, v37);
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      default:
LABEL_186:
        id v52 = 0;
        int v53 = 1;
        goto LABEL_203;
    }
  }
}

@end