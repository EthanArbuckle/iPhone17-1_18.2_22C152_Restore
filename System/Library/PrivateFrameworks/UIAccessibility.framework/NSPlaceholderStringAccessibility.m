@interface NSPlaceholderStringAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (NSPlaceholderStringAccessibility)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5;
@end

@implementation NSPlaceholderStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSPlaceholderString";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSPlaceholderStringAccessibility)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v61 = a5;
  v62 = a5;
  v60.receiver = self;
  v60.super_class = (Class)NSPlaceholderStringAccessibility;
  v10 = [(NSPlaceholderStringAccessibility *)&v60 initWithFormat:v8 locale:v9 arguments:a5];
  if (v10)
  {
    v11 = [v8 _accessibilityAttributedLocalizedString];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F488F0]) initWithString:v10];
    if (v11)
    {
      v13 = [v11 coalescedAttributes];
      [v12 setAttributes:v13];
    }
    NSClassFromString(&cfstr_Nslocalizedstr.isa);
    v46 = v11;
    id v47 = v9;
    v51 = v10;
    if (objc_opt_isKindOfClass())
    {
      v14 = [v8 safeDictionaryForKey:@"config"];
    }
    else
    {
      v14 = 0;
    }
    v45 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?<!%)%((#(?=([0-9]?)))?[0-9]*([+-])?(\\.)?[0-9]*)?([hl]{0,2}|[qLztj]{0,1}|[*])((#@[a-zA-Z0-9]+@)|([@dDxXoOuifeEgGcCsSpaAF]{1}))" options:0 error:0];
    v55 = objc_msgSend(v45, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    uint64_t v15 = [v55 count];
    uint64_t v50 = [v12 length];
    v53 = v14;
    uint64_t v54 = v15;
    if (v15)
    {
      uint64_t v49 = 0;
      uint64_t v16 = 0;
      uint64_t v52 = *MEMORY[0x1E4F1D4D0];
      id v48 = v8;
      do
      {
        v17 = [v55 objectAtIndexedSubscript:v16];
        uint64_t v18 = [v17 range];
        v20 = objc_msgSend(v8, "substringWithRange:", v18, v19);

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v21 = [v14 allKeys];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v63 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v57;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v57 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = [NSString stringWithFormat:@"%%#@%@@", *(void *)(*((void *)&v56 + 1) + 8 * i)];
              if ([v20 isEqualToString:v26])
              {
                v27 = NSString;
                v14 = v53;
                v28 = [v53 objectForKey:v52];
                uint64_t v29 = [v27 stringWithFormat:@"%%%@", v28];

                v20 = (void *)v29;
                goto LABEL_19;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v56 objects:v63 count:16];
            if (v23) {
              continue;
            }
            break;
          }
          v14 = v53;
        }
LABEL_19:

        if ([v20 hasPrefix:@"%@"])
        {
          v30 = (id *)v61;
          v61 += 8;
          id v31 = *v30;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v32 = [v31 _accessibilityAttributedLocalizedString];
            if (v32)
            {
              v33 = (void *)v32;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v34 = v31;
LABEL_37:
                v37 = v34;
                if (v34)
                {
                  uint64_t v38 = -[NSPlaceholderStringAccessibility rangeOfString:options:range:](v51, "rangeOfString:options:range:", v34, 0, v49, v50);
                  if (v38 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    uint64_t v40 = v38;
                    uint64_t v41 = v39;
                    v42 = [v33 coalescedAttributes];
                    objc_msgSend(v12, "setAttributes:withRange:", v42, v40, v41);

                    v14 = v53;
                    uint64_t v49 = v40 + v41;
                    uint64_t v50 = [v12 length] - (v40 + v41);
                  }
                  id v8 = v48;
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v34 = [v31 string];
                  goto LABEL_37;
                }
                v37 = 0;
              }
            }
          }

          goto LABEL_44;
        }
        if ([v20 hasPrefix:@"%*"]) {
          v61 += 8;
        }
        if (([v20 _containsSubstring:@"g"] & 1) != 0
          || ([v20 _containsSubstring:@"f"] & 1) != 0
          || ([v20 _containsSubstring:@"G"] & 1) != 0
          || ([v20 _containsSubstring:@"F"] & 1) != 0
          || ([v20 _containsSubstring:@"a"] & 1) != 0
          || [v20 _containsSubstring:@"A"])
        {
          v35 = v20;
          v36 = @"L";
        }
        else
        {
          if ([v20 _containsSubstring:@"s"]
            || [v20 _containsSubstring:@"c"]
            || [v20 _containsSubstring:@"p"]
            || [v20 _containsSubstring:@"z"]
            || ([v20 _containsSubstring:@"d"] & 1) == 0
            && ([v20 _containsSubstring:@"D"] & 1) == 0
            && ![v20 _containsSubstring:@"i"]
            && ([v20 _containsSubstring:@"u"] & 1) == 0
            && ([v20 _containsSubstring:@"U"] & 1) == 0
            && ([v20 _containsSubstring:@"x"] & 1) == 0
            && ([v20 _containsSubstring:@"X"] & 1) == 0
            && ![v20 _containsSubstring:@"o"]
            || [v20 _containsSubstring:@"ll"])
          {
            goto LABEL_34;
          }
          v35 = v20;
          v36 = @"l";
        }
        [v35 _containsSubstring:v36];
LABEL_34:
        v61 += 8;
LABEL_44:

        ++v16;
      }
      while (v16 != v54);
    }
    v10 = v51;
    if ([v12 hasAttributes])
    {
      v43 = (void *)[v12 copy];
      [(NSPlaceholderStringAccessibility *)v51 _setAccessibilityAttributedLocalizedString:v43];

      v14 = v53;
    }

    id v9 = v47;
  }

  return v10;
}

@end