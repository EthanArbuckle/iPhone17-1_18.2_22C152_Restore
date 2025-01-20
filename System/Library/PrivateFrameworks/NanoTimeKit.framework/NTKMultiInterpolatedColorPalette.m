@interface NTKMultiInterpolatedColorPalette
+ (BOOL)resolveInstanceMethod:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)palettes;
- (NSArray)transitionFractions;
- (NSMutableArray)colorInterpolators;
- (NSMutableArray)floatInterpolators;
- (NTKMultiInterpolatedColorPalette)initWithPalettes:(id)a3;
- (id)_combineValue:(id)a3 and:(id)a4 with:(double)a5 onAxis:(unint64_t)a6;
- (id)interpolatedColorFromSelector:(SEL)a3 parameter:(id)a4;
- (id)valueForKey:(id)a3;
- (void)clearCache;
- (void)setColorInterpolators:(id)a3;
- (void)setFloatInterpolators:(id)a3;
- (void)setPalettes:(id)a3;
- (void)setTransitionFractions:(id)a3;
@end

@implementation NTKMultiInterpolatedColorPalette

- (NTKMultiInterpolatedColorPalette)initWithPalettes:(id)a3
{
  id v5 = a3;
  if (initWithPalettes__once != -1) {
    dispatch_once(&initWithPalettes__once, &__block_literal_global_159);
  }
  self->_arity = -1;
  unint64_t v6 = 1;
  do
  {
    double v7 = (double)(unint64_t)[v5 count];
    if (ldexp(1.0, v6) == v7)
    {
      self->_arity = v6;
      goto LABEL_9;
    }
    ++v6;
  }
  while (v6 != 8);
  if (self->_arity == -1) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"invalid palette count: %lu (must be a power of two)", objc_msgSend(v5, "count"));
  }
LABEL_9:
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_11_2];
  v23.receiver = self;
  v23.super_class = (Class)NTKMultiInterpolatedColorPalette;
  v8 = [(NTKMultiInterpolatedColorPalette *)&v23 init];
  if (v8)
  {
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v8->_cache;
    v8->_cache = v9;

    objc_storeStrong((id *)&v8->_palettes, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8->_arity];
    freeAxes = v8->_freeAxes;
    v8->_freeAxes = (NSMutableArray *)v11;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    paletteIndices = v8->_paletteIndices;
    v8->_paletteIndices = (NSMutableArray *)v13;

    [(NSMutableArray *)v8->_paletteIndices addObject:&unk_1F16E4458];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8->_arity];
    [(NTKMultiInterpolatedColorPalette *)v8 setColorInterpolators:v15];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8->_arity];
    [(NTKMultiInterpolatedColorPalette *)v8 setFloatInterpolators:v16];

    if (v8->_arity)
    {
      unint64_t v17 = 0;
      do
      {
        v18 = _Block_copy((const void *)_defaultColorInterpolator);
        v19 = [(NTKMultiInterpolatedColorPalette *)v8 colorInterpolators];
        [v19 setObject:v18 atIndexedSubscript:v17];

        v20 = _Block_copy((const void *)_defaultFloatInterpolator);
        v21 = [(NTKMultiInterpolatedColorPalette *)v8 floatInterpolators];
        [v21 setObject:v20 atIndexedSubscript:v17];

        ++v17;
      }
      while (v8->_arity > v17);
    }
  }

  return v8;
}

void __53__NTKMultiInterpolatedColorPalette_initWithPalettes___block_invoke()
{
  v0 = (void *)_invalid;
  _invalid = (uint64_t)&unk_1F16EADC8;

  v1 = (void *)_defaultColorInterpolator;
  _defaultColorInterpolator = (uint64_t)&__block_literal_global_4_3;

  v2 = (void *)_defaultFloatInterpolator;
  _defaultFloatInterpolator = (uint64_t)&__block_literal_global_7_1;
}

uint64_t __53__NTKMultiInterpolatedColorPalette_initWithPalettes___block_invoke_1()
{
  return NTKInterpolateBetweenColors();
}

- (id)valueForKey:(id)a3
{
  SEL v4 = NSSelectorFromString((NSString *)a3);
  return [(NTKMultiInterpolatedColorPalette *)self interpolatedColorFromSelector:v4 parameter:0];
}

- (id)interpolatedColorFromSelector:(SEL)a3 parameter:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  double v7 = NSString;
  v8 = NSStringFromSelector(a3);
  v9 = [v7 stringWithFormat:@"%@-%@", v8, v6];

  v10 = [(NSCache *)self->_cache objectForKey:v9];
  if (v10)
  {
    id v11 = v10;
    v12 = v11;
  }
  else
  {
    uint64_t v13 = [(NTKMultiInterpolatedColorPalette *)self palettes];
    if ([(NSMutableArray *)self->_paletteIndices count] == 1)
    {
      v14 = [(NSMutableArray *)self->_paletteIndices objectAtIndexedSubscript:0];
      v15 = objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v14, "intValue"));
      _PerformSelectorWithArgument(v15, (uint64_t)a3, (uint64_t)v6);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = v9;
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_paletteIndices, "count"));
      if ([(NSMutableArray *)self->_paletteIndices count])
      {
        unint64_t v17 = 0;
        do
        {
          v18 = [(NSMutableArray *)self->_paletteIndices objectAtIndexedSubscript:v17];
          v19 = objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v18, "intValue"));
          v20 = _PerformSelectorWithArgument(v19, (uint64_t)a3, (uint64_t)v6);

          if (v20)
          {
            v21 = v16;
            uint64_t v22 = (uint64_t)v20;
          }
          else
          {
            uint64_t v22 = _invalid;
            v21 = v16;
          }
          [v21 addObject:v22];

          ++v17;
        }
        while ([(NSMutableArray *)self->_paletteIndices count] > v17);
      }
      v40 = v13;
      id v42 = v6;
      if ([(NSMutableArray *)self->_freeAxes count])
      {
        unint64_t v23 = 0;
        do
        {
          v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", (unint64_t)objc_msgSend(v16, "count") >> 1);
          v24 = [(NTKMultiInterpolatedColorPalette *)self transitionFractions];
          v25 = [(NSMutableArray *)self->_freeAxes objectAtIndexedSubscript:v23];
          v26 = objc_msgSend(v24, "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
          [v26 floatValue];
          float v28 = v27;

          if ([v16 count])
          {
            unint64_t v29 = 0;
            double v30 = v28;
            do
            {
              v31 = [v16 objectAtIndexedSubscript:v29];
              v32 = [v16 objectAtIndexedSubscript:v29 + 1];
              v33 = [(NSMutableArray *)self->_freeAxes objectAtIndexedSubscript:v23];
              v34 = -[NTKMultiInterpolatedColorPalette _combineValue:and:with:onAxis:](self, "_combineValue:and:with:onAxis:", v31, v32, (int)[v33 intValue], v30);

              [v14 addObject:v34];
              v29 += 2;
            }
            while ([v16 count] > v29);
          }

          ++v23;
          v16 = v14;
        }
        while ([(NSMutableArray *)self->_freeAxes count] > v23);
      }
      else
      {
        v14 = v16;
      }
      v9 = v41;
      if ([v14 count] != 1) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Expected one palette value to remain at this point"];
      }
      id v11 = [v14 objectAtIndexedSubscript:0];
      id v6 = v42;
      uint64_t v13 = v40;
    }

    if (v11 == (id)_invalid)
    {
      v36 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a3);
        v38 = id v37 = v6;
        *(_DWORD *)buf = 138412290;
        v44 = v38;
        _os_log_impl(&dword_1BC5A9000, v36, OS_LOG_TYPE_DEFAULT, "MultiInterpolatedPalette got invalid value for %@", buf, 0xCu);

        id v6 = v37;
      }

      id v35 = [MEMORY[0x1E4FB1618] systemCyanColor];
    }
    else
    {
      if (v11) {
        [(NSCache *)self->_cache setObject:v11 forKey:v9];
      }
      id v35 = v11;
    }
    v12 = v35;
  }
  return v12;
}

- (id)_combineValue:(id)a3 and:(id)a4 with:(double)a5 onAxis:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (id)_invalid;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [(NTKMultiInterpolatedColorPalette *)self colorInterpolators];
      v14 = [v13 objectAtIndexedSubscript:a6];

      uint64_t v15 = ((void (**)(void, id, id, double))v14)[2](v14, v10, v11, a5);
LABEL_7:
      v21 = (void *)v15;

      id v12 = v21;
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      double v17 = v16;
      [v11 floatValue];
      double v19 = v18;
      v20 = [(NTKMultiInterpolatedColorPalette *)self floatInterpolators];
      v14 = [v20 objectAtIndexedSubscript:a6];

      ((void (*)(void (**)(void, void, void, double), double, double, double))v14[2])(v14, v17, v19, a5);
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithDouble:");
      goto LABEL_7;
    }
  }
LABEL_8:

  return v12;
}

- (void)setTransitionFractions:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([v6 count] != self->_arity) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"transitionFractions count must be %lu", self->_arity);
  }
  if (([(NSArray *)self->_transitionFractions isEqual:v6] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transitionFractions, a3);
    [(NSCache *)self->_cache removeAllObjects];
    [(NSMutableArray *)self->_freeAxes removeAllObjects];
    [(NSMutableArray *)self->_paletteIndices removeAllObjects];
    uint64_t v7 = [v6 count] - 1;
    if (v7 >= 0)
    {
      do
      {
        v8 = [v6 objectAtIndexedSubscript:v7];
        [v8 floatValue];
        double v10 = v9;

        if (fabs(v10) >= 0.00000011920929)
        {
          uint64_t v16 = [(NSMutableArray *)self->_paletteIndices count];
          paletteIndices = self->_paletteIndices;
          if (fabs(v10 + -1.0) >= 0.00000011920929)
          {
            if (v16)
            {
              uint64_t v20 = [(NSMutableArray *)paletteIndices count] - 1;
              if (v20 >= 0)
              {
                do
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = [(NSMutableArray *)self->_paletteIndices objectAtIndexedSubscript:v20];
                  unsigned int v23 = [v22 unsignedIntValue];

                  v24 = self->_paletteIndices;
                  v25 = [NSNumber numberWithUnsignedInteger:(2 * v23) | 1];
                  [(NSMutableArray *)v24 insertObject:v25 atIndex:v21 + 1];

                  v26 = [NSNumber numberWithUnsignedInteger:2 * v23];
                  [(NSMutableArray *)self->_paletteIndices setObject:v26 atIndexedSubscript:v21];

                  uint64_t v20 = v21 - 1;
                }
                while (v21);
              }
            }
            else
            {
              [(NSMutableArray *)paletteIndices addObject:&unk_1F16E4458];
              [(NSMutableArray *)self->_paletteIndices addObject:&unk_1F16E4470];
            }
            freeAxes = self->_freeAxes;
            v3 = [NSNumber numberWithInteger:v7];
            [(NSMutableArray *)freeAxes insertObject:v3 atIndex:0];

            continue;
          }
          if (v16)
          {
            if ([(NSMutableArray *)paletteIndices count])
            {
              unint64_t v17 = 0;
              do
              {
                float v18 = NSNumber;
                double v19 = [(NSMutableArray *)self->_paletteIndices objectAtIndexedSubscript:v17];
                v3 = objc_msgSend(v18, "numberWithInt:", (2 * objc_msgSend(v19, "intValue")) | 1);
                [(NSMutableArray *)self->_paletteIndices setObject:v3 atIndexedSubscript:v17];

                ++v17;
              }
              while ([(NSMutableArray *)self->_paletteIndices count] > v17);
            }
            continue;
          }
          float v27 = &unk_1F16E4470;
        }
        else
        {
          uint64_t v11 = [(NSMutableArray *)self->_paletteIndices count];
          paletteIndices = self->_paletteIndices;
          if (v11)
          {
            if ([(NSMutableArray *)paletteIndices count])
            {
              unint64_t v13 = 0;
              do
              {
                v14 = NSNumber;
                uint64_t v15 = [(NSMutableArray *)self->_paletteIndices objectAtIndexedSubscript:v13];
                v3 = objc_msgSend(v14, "numberWithInt:", 2 * objc_msgSend(v15, "intValue"));
                [(NSMutableArray *)self->_paletteIndices setObject:v3 atIndexedSubscript:v13];

                ++v13;
              }
              while ([(NSMutableArray *)self->_paletteIndices count] > v13);
            }
            continue;
          }
          float v27 = &unk_1F16E4458;
        }
        [(NSMutableArray *)paletteIndices addObject:v27];
      }
      while (v7-- > 0);
    }
    double v30 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [v6 valueForKey:@"description"];
      v32 = [v31 componentsJoinedByString:@","];
      uint64_t v33 = [(NSMutableArray *)self->_freeAxes count];
      if (v33)
      {
        v3 = [(NSMutableArray *)self->_freeAxes valueForKey:@"description"];
        v34 = [v3 componentsJoinedByString:@","];
      }
      else
      {
        v34 = @"(none)";
      }
      id v35 = [(NSMutableArray *)self->_paletteIndices valueForKey:@"description"];
      v36 = [v35 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138412802;
      v38 = v32;
      __int16 v39 = 2112;
      v40 = v34;
      __int16 v41 = 2112;
      id v42 = v36;
      _os_log_impl(&dword_1BC5A9000, v30, OS_LOG_TYPE_DEFAULT, "MultiInterpolatedPalette setTransitionFractions to %@ and have free axes %@ and palettes %@", buf, 0x20u);

      if (v33)
      {
      }
    }
  }
}

- (NSArray)palettes
{
  return self->_palettes;
}

- (void)setPalettes:(id)a3
{
  objc_storeStrong((id *)&self->_palettes, a3);
  id v5 = a3;
  [(NSCache *)self->_cache removeAllObjects];
}

- (void)clearCache
{
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  id v5 = NSStringFromSelector(a3);
  id v6 = [v5 componentsSeparatedByString:@":"];
  uint64_t v7 = [v6 count];

  if (v7 == 2)
  {
    v8 = "@@:@";
    float v9 = (void (*)(void))NTKMultiInterpolatedColorPalette_singleArgumentMethodImplementation;
  }
  else
  {
    if (v7 != 1)
    {
      v13.receiver = a1;
      v13.super_class = (Class)&OBJC_METACLASS___NTKMultiInterpolatedColorPalette;
      unsigned __int8 v10 = objc_msgSendSuper2(&v13, sel_resolveInstanceMethod_, a3);
      goto LABEL_7;
    }
    v8 = "@@:";
    float v9 = (void (*)(void))NTKMultiInterpolatedColorPalette_noArgumentMethodImplementation;
  }
  unsigned __int8 v10 = class_addMethod((Class)a1, a3, v9, v8);
LABEL_7:
  BOOL v11 = v10;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SEL v4 = (NTKMultiInterpolatedColorPalette *)a3;
  id v5 = v4;
  if (v4 == self
    || ([(NTKMultiInterpolatedColorPalette *)v4 palettes],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(NTKMultiInterpolatedColorPalette *)self palettes],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v6 == v7))
  {
LABEL_14:
    char v31 = 1;
    goto LABEL_17;
  }
  v8 = [(NTKMultiInterpolatedColorPalette *)v5 palettes];
  uint64_t v9 = [v8 count];
  unsigned __int8 v10 = [(NTKMultiInterpolatedColorPalette *)self palettes];
  if (v9 != [v10 count])
  {

    goto LABEL_16;
  }
  BOOL v11 = [(NTKMultiInterpolatedColorPalette *)self transitionFractions];
  uint64_t v12 = [v11 count];
  objc_super v13 = [(NTKMultiInterpolatedColorPalette *)v5 transitionFractions];
  uint64_t v14 = [v13 count];

  if (v12 != v14)
  {
LABEL_16:
    char v31 = 0;
    goto LABEL_17;
  }
  uint64_t v15 = [(NTKMultiInterpolatedColorPalette *)self transitionFractions];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    unint64_t v17 = 0;
    do
    {
      float v18 = [(NTKMultiInterpolatedColorPalette *)self transitionFractions];
      double v19 = [v18 objectAtIndexedSubscript:v17];
      uint64_t v20 = [(NTKMultiInterpolatedColorPalette *)v5 transitionFractions];
      uint64_t v21 = [v20 objectAtIndexedSubscript:v17];

      if (v19 != v21) {
        goto LABEL_16;
      }
      ++v17;
      uint64_t v22 = [(NTKMultiInterpolatedColorPalette *)self transitionFractions];
      unint64_t v23 = [v22 count];
    }
    while (v23 > v17);
  }
  v24 = [(NTKMultiInterpolatedColorPalette *)self palettes];
  uint64_t v25 = [v24 count];

  if (!v25) {
    goto LABEL_14;
  }
  unint64_t v26 = 0;
  do
  {
    float v27 = [(NTKMultiInterpolatedColorPalette *)self palettes];
    float v28 = [v27 objectAtIndexedSubscript:v26];
    unint64_t v29 = [(NTKMultiInterpolatedColorPalette *)v5 palettes];
    double v30 = [v29 objectAtIndexedSubscript:v26];
    char v31 = [v28 isEqual:v30];

    if ((v31 & 1) == 0) {
      break;
    }
    ++v26;
    v32 = [(NTKMultiInterpolatedColorPalette *)self palettes];
    unint64_t v33 = [v32 count];
  }
  while (v33 > v26);
LABEL_17:

  return v31;
}

- (NSArray)transitionFractions
{
  return self->_transitionFractions;
}

- (NSMutableArray)colorInterpolators
{
  return self->_colorInterpolators;
}

- (void)setColorInterpolators:(id)a3
{
}

- (NSMutableArray)floatInterpolators
{
  return self->_floatInterpolators;
}

- (void)setFloatInterpolators:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatInterpolators, 0);
  objc_storeStrong((id *)&self->_colorInterpolators, 0);
  objc_storeStrong((id *)&self->_transitionFractions, 0);
  objc_storeStrong((id *)&self->_palettes, 0);
  objc_storeStrong((id *)&self->_paletteIndices, 0);
  objc_storeStrong((id *)&self->_freeAxes, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end