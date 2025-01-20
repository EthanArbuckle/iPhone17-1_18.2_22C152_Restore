@interface SXTextContrastDarkModePolicyException
- (SXJSONObjectMerger)componentStyleMerger;
- (SXJSONObjectMerger)componentTextStyleMerger;
- (SXTextContrastDarkModePolicyException)initWithComponentStyleMerger:(id)a3 componentTextStyleMerger:(id)a4;
- (id)componentStyleForComponent:(id)a3 DOM:(id)a4;
- (id)componentTextStyleForButtonComponent:(id)a3 DOM:(id)a4;
- (id)componentTextStyleForTextComponent:(id)a3 DOM:(id)a4;
- (id)mergedComponentTextStyleWithIdentifiers:(id)a3 DOM:(id)a4;
- (id)opaqueComponentStyleForComponent:(id)a3 DOM:(id)a4;
- (int64_t)shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:(id)a3 DOM:(id)a4;
- (int64_t)shouldApplyDarkModeToTextStyleForegroundColorsForComponent:(id)a3 DOM:(id)a4;
@end

@implementation SXTextContrastDarkModePolicyException

- (SXTextContrastDarkModePolicyException)initWithComponentStyleMerger:(id)a3 componentTextStyleMerger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXTextContrastDarkModePolicyException;
  v9 = [(SXTextContrastDarkModePolicyException *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_componentStyleMerger, a3);
    objc_storeStrong((id *)&v10->_componentTextStyleMerger, a4);
  }

  return v10;
}

- (int64_t)shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:(id)a3 DOM:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 analysis];
  v9 = [v6 identifier];
  v10 = [v8 componentTextStylesForComponent:v9];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    objc_super v12 = [(SXTextContrastDarkModePolicyException *)self opaqueComponentStyleForComponent:v6 DOM:v7];
    v13 = [v12 fill];

    if (v13) {
      int64_t v14 = 0;
    }
    else {
      int64_t v14 = -1;
    }
  }
  else
  {
    int64_t v14 = -1;
  }

  return v14;
}

- (int64_t)shouldApplyDarkModeToTextStyleForegroundColorsForComponent:(id)a3 DOM:(id)a4
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 analysis];
  v9 = [v6 identifier];
  v10 = [v8 componentTextStylesForComponent:v9];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v115 = [(SXTextContrastDarkModePolicyException *)self opaqueComponentStyleForComponent:v6 DOM:v7];
    objc_super v12 = [v115 fill];

    if (v12)
    {
      int64_t v13 = 0;
LABEL_58:

      goto LABEL_59;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v14 = [v6 text];
      uint64_t v15 = [v14 length];

      uint64_t v16 = [(SXTextContrastDarkModePolicyException *)self componentTextStyleForTextComponent:v6 DOM:v7];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int64_t v13 = -1;
        goto LABEL_58;
      }
      v17 = [v6 text];
      uint64_t v15 = [v17 length];

      uint64_t v16 = [(SXTextContrastDarkModePolicyException *)self componentTextStyleForButtonComponent:v6 DOM:v7];
    }
    v114 = (void *)v16;
    v18 = [MEMORY[0x263EFF980] array];
    v19 = [v7 documentStyle];
    v20 = [v19 backgroundColor];
    [v20 relativeLuminance];
    double v22 = v21;

    v23 = [v115 backgroundColor];
    [v23 relativeLuminance];
    double v25 = v24;

    v124 = v18;
    if (v15)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        [v18 addObject:&unk_26D593B60];
        v27 = [v115 backgroundColor];

        double v28 = v25;
        if (v27
          || (objc_msgSend(v7, "documentStyle", v25),
              v29 = objc_claimAutoreleasedReturnValue(),
              [v29 backgroundColor],
              v30 = objc_claimAutoreleasedReturnValue(),
              v30,
              v29,
              double v28 = v22,
              v30))
        {
          v31 = [NSNumber numberWithDouble:v28];
          [v124 setObject:v31 atIndexedSubscript:i];
        }
        v18 = v124;
      }
    }
    v32 = [MEMORY[0x263EFF980] array];
    v33 = [MEMORY[0x263EFF980] array];
    v34 = [v114 textColor];
    [v34 relativeLuminance];
    double v36 = v35;

    v37 = [v114 backgroundColor];
    [v37 relativeLuminance];
    double v39 = v38;

    v40 = [v114 textColor];
    v41 = [v40 invertedLightness];
    [v41 relativeLuminance];
    double v43 = v42;

    if (v15)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        v45 = [NSNumber numberWithDouble:v36];
        [v32 setObject:v45 atIndexedSubscript:j];

        v46 = [NSNumber numberWithDouble:v43];
        [v33 setObject:v46 atIndexedSubscript:j];

        v47 = [v114 backgroundColor];

        if (v47)
        {
          v48 = [NSNumber numberWithDouble:v39];
          [v18 setObject:v48 atIndexedSubscript:j];
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v120 = v7;
      id v113 = v6;
      id v49 = v6;
      v50 = [v114 linkStyle];

      id v119 = v49;
      if (v50)
      {
        v51 = [v114 linkStyle];
        v52 = [v51 textColor];
        [v52 relativeLuminance];
        double v54 = v53;

        v55 = [v51 textColor];
        v56 = [v55 invertedLightness];
        [v56 relativeLuminance];
        double v58 = v57;

        v59 = [v51 backgroundColor];
        [v59 relativeLuminance];
        double v61 = v60;

        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        obuint64_t j = [v49 additions];
        uint64_t v62 = [obj countByEnumeratingWithState:&v129 objects:v134 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v130;
          do
          {
            for (uint64_t k = 0; k != v63; ++k)
            {
              if (*(void *)v130 != v64) {
                objc_enumerationMutation(obj);
              }
              v66 = *(void **)(*((void *)&v129 + 1) + 8 * k);
              for (unint64_t m = [v66 range]; ; ++m)
              {
                uint64_t v68 = [v66 range];
                if (m >= v68 + v69) {
                  break;
                }
                v70 = [v51 textColor];

                if (v70)
                {
                  v71 = [NSNumber numberWithDouble:v54];
                  [v32 setObject:v71 atIndexedSubscript:m];

                  v72 = [NSNumber numberWithDouble:v58];
                  [v33 setObject:v72 atIndexedSubscript:m];
                }
                v73 = [v51 backgroundColor];

                if (v73)
                {
                  v74 = [NSNumber numberWithDouble:v61];
                  [v124 setObject:v74 atIndexedSubscript:m];
                }
              }
            }
            uint64_t v63 = [obj countByEnumeratingWithState:&v129 objects:v134 count:16];
          }
          while (v63);
        }

        v18 = v124;
        id v49 = v119;
      }
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v116 = [v49 inlineTextStyles];
      uint64_t v121 = [v116 countByEnumeratingWithState:&v125 objects:v133 count:16];
      if (v121)
      {
        v117 = v32;
        uint64_t v118 = *(void *)v126;
        do
        {
          for (uint64_t n = 0; n != v121; ++n)
          {
            if (*(void *)v126 != v118) {
              objc_enumerationMutation(v116);
            }
            v76 = *(void **)(*((void *)&v125 + 1) + 8 * n);
            v77 = [v120 analysis];
            v78 = [v77 namespacedObjectReferences];
            v79 = [v76 textStyle];
            v80 = [v49 identifier];
            uint64_t v81 = [v78 namespacedTextStyleIdentifierForIdentifier:v79 component:v80];

            v82 = [v120 textStyles];
            id obja = (id)v81;
            v83 = [v82 objectForKey:v81];

            v84 = [v83 textColor];
            [v84 relativeLuminance];
            double v86 = v85;

            v87 = [v83 textColor];
            v88 = [v87 invertedLightness];
            [v88 relativeLuminance];
            double v90 = v89;

            v91 = [v83 backgroundColor];
            [v91 relativeLuminance];
            double v93 = v92;

            unint64_t v94 = [v76 range];
            uint64_t v95 = [v76 range];
            v18 = v124;
            v32 = v117;
            if (v94 < v95 + v96)
            {
              do
              {
                v97 = [v83 textColor];

                if (v97)
                {
                  v98 = [NSNumber numberWithDouble:v86];
                  [v117 setObject:v98 atIndexedSubscript:v94];

                  v99 = [NSNumber numberWithDouble:v90];
                  [v33 setObject:v99 atIndexedSubscript:v94];
                }
                v100 = [v83 backgroundColor];

                if (v100)
                {
                  v101 = [NSNumber numberWithDouble:v93];
                  [v124 setObject:v101 atIndexedSubscript:v94];
                }
                ++v94;
                uint64_t v102 = [v76 range];
              }
              while (v94 < v102 + v103);
            }

            id v49 = v119;
          }
          uint64_t v121 = [v116 countByEnumeratingWithState:&v125 objects:v133 count:16];
        }
        while (v121);
      }

      id v6 = v113;
      id v7 = v120;
    }
    v104 = [v32 valueForKeyPath:@"@avg.self"];
    [v104 floatValue];

    v105 = [v33 valueForKeyPath:@"@avg.self"];
    [v105 floatValue];
    double v107 = v106;

    v108 = [v18 valueForKeyPath:@"@avg.self"];
    [v108 floatValue];
    double v110 = v109;

    double v111 = (v110 + 0.05) / (v107 + 0.05);
    if (v111 < 1.0) {
      double v111 = 1.0 / v111;
    }
    if (v111 < 4.5) {
      int64_t v13 = 0;
    }
    else {
      int64_t v13 = -1;
    }

    goto LABEL_58;
  }
  int64_t v13 = -1;
LABEL_59:

  return v13;
}

- (id)opaqueComponentStyleForComponent:(id)a3 DOM:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [(SXTextContrastDarkModePolicyException *)self componentStyleForComponent:v7 DOM:v8];
  v10 = [v9 backgroundColor];
  if (v10)
  {
  }
  else
  {
    uint64_t v11 = [v9 fill];

    if (!v11)
    {
      objc_super v12 = [v8 analysis];
      int64_t v13 = [v7 identifier];
      int64_t v14 = [v12 containerPathForComponentWithIdentifier:v13];
      uint64_t v15 = (void *)[v14 mutableCopy];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      obuint64_t j = [v15 reverseObjectEnumerator];
      uint64_t v29 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v29)
      {
        double v25 = v9;
        id v26 = v7;
        uint64_t v28 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v31 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            [v15 removeObject:v17];
            v18 = [v8 components];
            v19 = [v18 componentsForContainerComponentWithPath:v15];

            v20 = [v19 componentForIdentifier:v17];
            v9 = [(SXTextContrastDarkModePolicyException *)self componentStyleForComponent:v20 DOM:v8];
            double v21 = [v9 backgroundColor];
            if (v21)
            {
              v4 = [v9 backgroundColor];
              [v4 alphaComponent];
              if (v22 > 0.0)
              {

LABEL_18:
                goto LABEL_19;
              }
            }
            v23 = [v9 fill];

            if (v21)
            {
            }
            if (v23) {
              goto LABEL_18;
            }
          }
          uint64_t v29 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v29) {
            continue;
          }
          break;
        }
        v9 = v25;
LABEL_19:
        id v7 = v26;
      }
    }
  }

  return v9;
}

- (id)componentStyleForComponent:(id)a3 DOM:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263EFF980];
  v9 = [v6 classification];
  v10 = [v9 defaultComponentStyleIdentifiers];
  uint64_t v11 = [v8 arrayWithArray:v10];

  objc_super v12 = [v6 style];

  if (v12)
  {
    int64_t v13 = [v6 style];
    [v11 addObject:v13];
  }
  int64_t v14 = [v7 analysis];
  uint64_t v15 = [v14 namespacedObjectReferences];
  uint64_t v16 = [v6 identifier];
  uint64_t v17 = [v15 namespacedComponentStyleIdentifiersForIdentifiers:v11 component:v16];

  v18 = [MEMORY[0x263EFF980] array];
  v19 = [v7 componentStyles];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = v17;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        double v25 = objc_msgSend(v19, "objectForKey:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
        if (v25) {
          [v18 addObject:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v22);
  }

  if ([v18 count])
  {
    id v26 = [(SXJSONObjectMerger *)self->_componentStyleMerger mergeObjects:v18];
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (id)componentTextStyleForTextComponent:(id)a3 DOM:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF980];
  id v8 = a4;
  v9 = [v6 classification];
  v10 = [v9 defaultTextStyleIdentifiers];
  uint64_t v11 = [v7 arrayWithArray:v10];

  objc_super v12 = [v6 textStyle];

  if (v12)
  {
    int64_t v13 = [v6 textStyle];
    [v11 addObject:v13];
  }
  int64_t v14 = [v8 analysis];
  uint64_t v15 = [v14 namespacedObjectReferences];
  uint64_t v16 = [v6 identifier];
  uint64_t v17 = [v15 namespacedComponentTextStyleIdentifiersForIdentifiers:v11 component:v16];

  v18 = [(SXTextContrastDarkModePolicyException *)self mergedComponentTextStyleWithIdentifiers:v17 DOM:v8];

  return v18;
}

- (id)componentTextStyleForButtonComponent:(id)a3 DOM:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF980];
  id v8 = a4;
  v9 = [v6 classification];
  v10 = [v9 defaultTextStyleIdentifiers];
  uint64_t v11 = [v7 arrayWithArray:v10];

  objc_super v12 = [v6 textStyle];

  if (v12)
  {
    int64_t v13 = [v6 textStyle];
    [v11 addObject:v13];
  }
  int64_t v14 = [v8 analysis];
  uint64_t v15 = [v14 namespacedObjectReferences];
  uint64_t v16 = [v6 identifier];
  uint64_t v17 = [v15 namespacedComponentTextStyleIdentifiersForIdentifiers:v11 component:v16];

  v18 = [(SXTextContrastDarkModePolicyException *)self mergedComponentTextStyleWithIdentifiers:v17 DOM:v8];

  return v18;
}

- (id)mergedComponentTextStyleWithIdentifiers:(id)a3 DOM:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  v9 = [v7 componentTextStyles];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(v9, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        if (v15) {
          [v8 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  if ([v8 count])
  {
    uint64_t v16 = [(SXJSONObjectMerger *)self->_componentTextStyleMerger mergeObjects:v8];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (SXJSONObjectMerger)componentStyleMerger
{
  return self->_componentStyleMerger;
}

- (SXJSONObjectMerger)componentTextStyleMerger
{
  return self->_componentTextStyleMerger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentTextStyleMerger, 0);
  objc_storeStrong((id *)&self->_componentStyleMerger, 0);
}

@end