@interface TSWPPropertyConverter
+ (id)mapCharacterPropertiesFromNS:(id)a3;
+ (id)newFontWithFeaturesFromFont:(id)a3 primaryStyle:(id)a4 secondaryStyle:(id)a5 ligatures:(int)a6;
+ (id)propertyMapToDictionary:(id)a3;
+ (void)initialize;
+ (void)mapCharacterPropertiesFromNS:(id)a3 toWP:(id)a4;
+ (void)mapCharacterPropertiesFromStyle:(id)a3 secondaryStyle:(id)a4 toNS:(id)a5 stickyFont:(id *)a6 scale:(double)a7;
+ (void)mapCharacterPropertiesFromStyle:(id)a3 toNS:(id)a4 stickyFont:(id *)a5 scale:(double)a6;
+ (void)mapCharacterPropertiesFromStyles:(id *)a3 styleCount:(unsigned int)a4 toNS:(id)a5 stickyFont:(id *)a6 scale:(double)a7;
@end

@implementation TSWPPropertyConverter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = malloc_type_calloc(3uLL, 0x10uLL, 0x10800409227ACB4uLL);
    sMappedProperties = (uint64_t)v2;
    *(void *)v2 = *MEMORY[0x263F1C220];
    v2[2] = 33;
    *((void *)v2 + 2) = *MEMORY[0x263F1C2A8];
    v2[6] = 31;
    *((void *)v2 + 4) = *MEMORY[0x263F1C250];
    v2[10] = 41;
    v3 = malloc_type_calloc(5uLL, 0x10uLL, 0x10800409227ACB4uLL);
    sMappedColorProperties = (uint64_t)v3;
    *(void *)v3 = *MEMORY[0x263F1C2D0];
    v3[2] = 24;
    *((void *)v3 + 2) = *MEMORY[0x263F1C290];
    v3[6] = 28;
    *((void *)v3 + 4) = *MEMORY[0x263F1C240];
    v3[10] = 18;
    *((void *)v3 + 6) = *MEMORY[0x263F1C2A0];
    v3[14] = 32;
    *((void *)v3 + 8) = *MEMORY[0x263F1C210];
    v3[18] = 37;
  }
}

+ (void)mapCharacterPropertiesFromNS:(id)a3 toWP:(id)a4
{
  v6 = (void *)[a3 keyEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)*MEMORY[0x263F1C2D8];
    uint64_t v10 = *MEMORY[0x263F1C298];
    v11 = (void *)*MEMORY[0x263F1C238];
    v28 = (void *)*MEMORY[0x263F1C248];
    double v12 = 12.0;
    while ([v9 compare:v8] && !objc_msgSend(v8, "isEqualToString:", v10))
    {
      if ([v11 compare:v8])
      {
        if ([v28 compare:v8])
        {
          v19 = v11;
          for (uint64_t i = 0; i != 80; i += 16)
          {
            if (![*(id *)(sMappedColorProperties + i) compare:v8])
            {
              objc_opt_class();
              [a3 objectForKeyedSubscript:v8];
              uint64_t v25 = TSUDynamicCast();
              if (v25)
              {
                uint64_t v26 = [MEMORY[0x263F7C808] colorWithUIColor:v25];
                [a4 setObject:v26 forProperty:*(unsigned int *)(sMappedColorProperties + i + 8)];
              }
              goto LABEL_41;
            }
          }
          uint64_t v21 = 0;
          while ([*(id *)(sMappedProperties + v21) compare:v8])
          {
            v21 += 16;
            if (v21 == 48) {
              goto LABEL_41;
            }
          }
          uint64_t v27 = [a3 objectForKeyedSubscript:v8];
          [a4 setBoxedObject:v27 forProperty:*(unsigned int *)(sMappedProperties + v21 + 8)];
LABEL_41:
          v11 = v19;
        }
        else
        {
          objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "tsu_CGFloatValue");
          [a4 setCGFloatValue:35 forProperty:v24 / v12];
        }
        goto LABEL_16;
      }
      v22 = objc_msgSend(MEMORY[0x263F7C848], "fontWithPlatformFont:", objc_msgSend(a3, "objectForKeyedSubscript:", v8));
      objc_msgSend(a4, "setObject:forProperty:", objc_msgSend(v22, "fontName"), 16);
      [v22 pointSize];
      double v12 = v23;
      objc_msgSend(a4, "setCGFloatValue:forProperty:", 17);
      if (([a4 containsProperty:19] & 1) == 0) {
        [a4 setIntValue:0 forProperty:19];
      }
      if (([a4 containsProperty:20] & 1) == 0) {
        [a4 setIntValue:0 forProperty:20];
      }
      if (([a4 containsProperty:22] & 1) == 0) {
        [a4 setIntValue:0 forProperty:22];
      }
      if (([a4 containsProperty:31] & 1) == 0) {
        [a4 setFloatValue:31 forProperty:0.0];
      }
      if (([a4 containsProperty:26] & 1) == 0)
      {
        id v17 = a4;
        uint64_t v18 = 0;
        uint64_t v16 = 26;
LABEL_15:
        [v17 setIntValue:v18 forProperty:v16];
      }
LABEL_16:
      v8 = (void *)[v6 nextObject];
      if (!v8) {
        return;
      }
    }
    int v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "intValue");
    if (v13 == 9) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = 1;
    }
    if (v13) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    if ([v8 isEqualToString:v10]) {
      uint64_t v16 = 26;
    }
    else {
      uint64_t v16 = 22;
    }
    id v17 = a4;
    uint64_t v18 = v15;
    goto LABEL_15;
  }
}

+ (id)mapCharacterPropertiesFromNS:(id)a3
{
  id v4 = +[TSSPropertyMap propertyMap];
  +[TSWPPropertyConverter mapCharacterPropertiesFromNS:a3 toWP:v4];
  return v4;
}

+ (void)mapCharacterPropertiesFromStyles:(id *)a3 styleCount:(unsigned int)a4 toNS:(id)a5 stickyFont:(id *)a6 scale:(double)a7
{
  if (a4)
  {
    unint64_t v13 = a4;
    unsigned int v14 = a4 - 1;
    do
    {
      id v15 = a3[v14];
      if (v15) {
        [a1 mapCharacterPropertiesFromStyle:v15 toNS:a5 stickyFont:a6 scale:a7];
      }
    }
    while ((unint64_t)v14--);
    if (a4 > 1)
    {
      id v17 = objc_msgSend(objc_alloc(MEMORY[0x263F7C848]), "initWithCTFont:", TSWPCreateFontForStylesWithScale((uint64_t)a3, v13, (unint64_t)(a7 * 100.0)));
      if (v17)
      {
        id v19 = v17;
        uint64_t v18 = [v17 platformFont];
        [a5 setObject:v18 forKeyedSubscript:*MEMORY[0x263F1C238]];
      }
    }
  }
}

+ (id)propertyMapToDictionary:(id)a3
{
  id v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__TSWPPropertyConverter_propertyMapToDictionary___block_invoke;
  v6[3] = &unk_2646B2FC0;
  v6[4] = a3;
  v6[5] = v4;
  [a3 enumeratePropertiesAndObjectsUsingBlock:v6];
  return v4;
}

id *__49__TSWPPropertyConverter_propertyMapToDictionary___block_invoke(id *result, int a2, uint64_t a3, void *a4)
{
  v5 = result;
  if (a2 <= 25)
  {
    switch(a2)
    {
      case 16:
        [result[4] floatValueForProperty:17];
        double v9 = v8;
        BOOL v10 = ([v5[4] intValueForProperty:19] & 0x7FFFFFFF) != 0;
        BOOL v11 = ([v5[4] intValueForProperty:20] & 0x7FFFFFFF) != 0;
        double v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C848], "fontWithName:size:", a4, v9), "convertFontToBold:italic:", v10, v11);
        if (v12)
        {
          uint64_t v13 = [v12 platformFont];
          [v5[5] setObject:v13 forKeyedSubscript:*MEMORY[0x263F1C238]];
        }
        break;
      case 18:
        objc_opt_class();
        result = (id *)TSUDynamicCast();
        if (!result) {
          return result;
        }
        uint64_t v6 = [result platformColor];
        uint64_t v7 = (uint64_t *)MEMORY[0x263F1C240];
        goto LABEL_28;
      case 22:
        break;
      default:
        return result;
    }
    uint64_t v14 = [a4 integerValue];
    uint64_t v15 = 9;
    if (v14 != 2) {
      uint64_t v15 = 1;
    }
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:v16];
    uint64_t v7 = (uint64_t *)MEMORY[0x263F1C2D8];
LABEL_28:
    id v20 = v5[5];
    uint64_t v21 = *v7;
    return (id *)[v20 setObject:v6 forKeyedSubscript:v21];
  }
  if (a2 == 26)
  {
    uint64_t v17 = [a4 integerValue];
    uint64_t v18 = 9;
    if (v17 != 2) {
      uint64_t v18 = 1;
    }
    if (v17) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:v19];
    uint64_t v7 = (uint64_t *)MEMORY[0x263F1C298];
    goto LABEL_28;
  }
  if (a2 == 37 || a2 == 98)
  {
    objc_opt_class();
    result = (id *)TSUDynamicCast();
    if (result)
    {
      uint64_t v6 = [result platformColor];
      uint64_t v7 = (uint64_t *)MEMORY[0x263F1C210];
      goto LABEL_28;
    }
  }
  return result;
}

+ (void)mapCharacterPropertiesFromStyle:(id)a3 toNS:(id)a4 stickyFont:(id *)a5 scale:(double)a6
{
}

+ (void)mapCharacterPropertiesFromStyle:(id)a3 secondaryStyle:(id)a4 toNS:(id)a5 stickyFont:(id *)a6 scale:(double)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (!a3 || !a5) {
    return;
  }
  v40 = 0;
  if ([a3 valueForProperty:16] || objc_msgSend(a4, "valueForProperty:", 16))
  {
    id v41 = a3;
    id v42 = a4;
    unint64_t v13 = a4 ? 2 : 1;
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F7C848]), "initWithCTFont:", TSWPCreateFontForStylesWithScale((uint64_t)&v41, v13, (unint64_t)(a7 * 100.0)));
    v40 = v14;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = [v14 platformFont];
      [a5 setObject:v16 forKeyedSubscript:*MEMORY[0x263F1C238]];
      if (a6) {
        *a6 = v15;
      }

      v40 = 0;
    }
  }
  for (uint64_t i = 0; i != 80; i += 16)
  {
    if (objc_msgSend(a3, "definesProperty:", *(unsigned int *)(sMappedColorProperties + i + 8), v40, v41, v42, v43))
    {
      objc_opt_class();
      [a3 valueForProperty:*(unsigned int *)(sMappedColorProperties + i + 8)];
      uint64_t v18 = (void *)TSUDynamicCast();
      if (v18)
      {
        uint64_t v19 = [v18 platformColor];
        [a5 setObject:v19 forKeyedSubscript:*(void *)(sMappedColorProperties + i)];
      }
    }
  }
  for (uint64_t j = 0; j != 48; j += 16)
  {
    if (![a3 definesProperty:*(unsigned int *)(sMappedProperties + j + 8)]) {
      continue;
    }
    int v21 = String(*(_DWORD *)(sMappedProperties + j + 8));
    switch(v21)
    {
      case 2:
        [a3 floatValueForProperty:*(unsigned int *)(sMappedProperties + j + 8)];
        uint64_t v25 = objc_msgSend(NSNumber, "numberWithFloat:");
        goto LABEL_27;
      case 1:
        uint64_t v24 = [a3 intValueForProperty:*(unsigned int *)(sMappedProperties + j + 8)];
        uint64_t v25 = [NSNumber numberWithInt:v24];
LABEL_27:
        [a5 setValue:v25 forKey:*(void *)(sMappedProperties + j)];
        continue;
      case 0:
        uint64_t v22 = [a3 valueForProperty:*(unsigned int *)(sMappedProperties + j + 8)];
        if (v22)
        {
          uint64_t v23 = v22;
          if (v22 != [MEMORY[0x263EFF9D0] null]) {
            [a5 setObject:v23 forKeyedSubscript:*(void *)(sMappedProperties + j)];
          }
        }
        break;
    }
  }
  if ([a3 definesProperty:22])
  {
    int v26 = [a3 intValueForProperty:22];
    if (v26 == 2) {
      unsigned int v27 = 9;
    }
    else {
      unsigned int v27 = 1;
    }
    if (v26) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 0;
    }
    uint64_t v29 = [NSNumber numberWithInt:v28];
    [a5 setObject:v29 forKeyedSubscript:*MEMORY[0x263F1C2D8]];
  }
  if ([a3 definesProperty:26])
  {
    int v30 = [a3 intValueForProperty:26];
    if (v30 == 2) {
      unsigned int v31 = 9;
    }
    else {
      unsigned int v31 = 1;
    }
    if (v30) {
      uint64_t v32 = v31;
    }
    else {
      uint64_t v32 = 0;
    }
    uint64_t v33 = [NSNumber numberWithInt:v32];
    [a5 setObject:v33 forKeyedSubscript:*MEMORY[0x263F1C298]];
  }
  if ([a3 definesProperty:35])
  {
    [a3 floatValueForProperty:35];
    double v35 = v34;
    double v36 = 12.0;
    if (a6 && *a6) {
      objc_msgSend(*a6, "pointSize", 12.0);
    }
    uint64_t v37 = [NSNumber numberWithDouble:v36 * v35];
    [a5 setObject:v37 forKeyedSubscript:*MEMORY[0x263F1C248]];
  }
  id v41 = a3;
  id v42 = a4;
  v38 = (void *)TSWPResolvePropertyForStyles((uint64_t)&v41, 2uLL, 41, 0);
  if (v38) {
    uint64_t v39 = [v38 intValue];
  }
  else {
    uint64_t v39 = 0;
  }
  [a1 mapFontFeaturesFromStyle:a3 secondaryStyle:a4 toNS:a5 ioFont:&v40 ligatures:v39];
  if (a6) {
    *a6 = v40;
  }
}

+ (id)newFontWithFeaturesFromFont:(id)a3 primaryStyle:(id)a4 secondaryStyle:(id)a5 ligatures:(int)a6
{
  return 0;
}

@end