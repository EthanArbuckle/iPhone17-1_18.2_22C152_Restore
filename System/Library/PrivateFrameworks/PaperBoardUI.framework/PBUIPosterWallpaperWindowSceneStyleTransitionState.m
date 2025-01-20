@interface PBUIPosterWallpaperWindowSceneStyleTransitionState
- ($1D129F7B4C980C50E70029647222EF17)highestPriorityStyleTransitionState;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PBUIPosterWallpaperWindowSceneStyleTransitionState)init;
- (PBUIPosterWallpaperWindowSceneStyleTransitionState)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)diffFromPosterWallpaperWindowSceneStyleTransitionState:(id)a3 updateHandler:(id)a4 removeHandler:(id)a5;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)removeWallpaperStyleTransitionStateForPriority:(int64_t)a3;
- (void)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4;
@end

@implementation PBUIPosterWallpaperWindowSceneStyleTransitionState

- (PBUIPosterWallpaperWindowSceneStyleTransitionState)init
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterWallpaperWindowSceneStyleTransitionState;
  result = [(PBUIPosterWallpaperWindowSceneStyleTransitionState *)&v4 init];
  if (result)
  {
    for (uint64_t i = 8; i != 168; i += 32)
      *((unsigned char *)&result->super.isa + i) = 0;
  }
  return result;
}

- (void)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4
{
  if ((unint64_t)a4 <= 4)
  {
    objc_super v4 = (char *)self + 32 * a4;
    v4[8] = 1;
    long long v5 = *(_OWORD *)&a3->var0;
    *((void *)v4 + 4) = *(void *)&a3->var2;
    *((_OWORD *)v4 + 1) = v5;
  }
}

- (void)removeWallpaperStyleTransitionStateForPriority:(int64_t)a3
{
  if ((unint64_t)a3 <= 4) {
    self->_stateTable[a3].valid = 0;
  }
}

- (void)diffFromPosterWallpaperWindowSceneStyleTransitionState:(id)a3 updateHandler:(id)a4 removeHandler:(id)a5
{
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void))a5;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  do
  {
    if (v8)
    {
      int64_t startStyle = self->_stateTable[v11].state.startStyle;
      int64_t endStyle = self->_stateTable[v11].state.endStyle;
      double transitionFraction = self->_stateTable[v11].state.transitionFraction;
      if (self->_stateTable[v11].valid || (v8[v11 * 32 + 8] & 1) == 0)
      {
        if (self->_stateTable[v11].valid)
        {
          if ((v8[v11 * 32 + 8] & 1) == 0
            || (startStyle == *(void *)&v8[v11 * 32 + 16]
              ? (BOOL v16 = endStyle == *(void *)&v8[v11 * 32 + 24])
              : (BOOL v16 = 0),
                !v16 || (BSFloatEqualToFloat() & 1) == 0))
          {
            v17 = (void (*)(void *, uint64_t, void *))v9[2];
            v18[0] = startStyle;
            v18[1] = endStyle;
            *(double *)&v18[2] = transitionFraction;
            v17(v9, v12, v18);
          }
        }
      }
      else
      {
        v10[2](v10, v12);
      }
    }
    ++v12;
    ++v11;
  }
  while (v11 != 5);
}

- ($1D129F7B4C980C50E70029647222EF17)highestPriorityStyleTransitionState
{
  uint64_t v3 = 0;
  while (!*((unsigned char *)&self[5].var2 + v3))
  {
    v3 -= 32;
    if (v3 == -160)
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2 = 0.0;
      return self;
    }
  }
  *retstr = *($1D129F7B4C980C50E70029647222EF17 *)((char *)self + v3 + 144);
  return self;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  uint64_t v4 = 0;
  p_double transitionFraction = &self->_stateTable[0].state.transitionFraction;
  do
  {
    if (*(unsigned char *)(p_transitionFraction - 3))
    {
      double v6 = *p_transitionFraction;
      uint64_t v8 = *((void *)p_transitionFraction - 2);
      uint64_t v7 = *((void *)p_transitionFraction - 1);
      id v9 = (id)[v3 appendUnsignedInteger:v4];
      id v10 = (id)[v3 appendInteger:v8];
      id v11 = (id)[v3 appendInteger:v7];
      id v12 = (id)[v3 appendCGFloat:v6];
    }
    ++v4;
    p_transitionFraction += 4;
  }
  while (v4 != 5);
  unint64_t v13 = [v3 hash];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    long long v5 = (char *)v4;
    double v6 = v5;
    int valid = self->_stateTable[0].valid;
    if (valid == (v5[8] & 1))
    {
      unint64_t v8 = 0;
      BOOL v9 = 0;
      id v10 = v5 + 32;
      p_double transitionFraction = &self->_stateTable[0].state.transitionFraction;
      do
      {
        if (valid)
        {
          BOOL v12 = *((void *)p_transitionFraction - 2) == *((void *)v10 - 2)
             && *((void *)p_transitionFraction - 1) == *((void *)v10 - 1);
          if (!v12 || !BSFloatEqualToFloat()) {
            break;
          }
        }
        BOOL v9 = v8 > 3;
        if (v8 == 4) {
          break;
        }
        int valid = (_BYTE)p_transitionFraction[1] & 1;
        int v13 = v10[8] & 1;
        v10 += 32;
        p_transitionFraction += 4;
        ++v8;
      }
      while (valid == v13);
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)[(PBUIPosterWallpaperWindowSceneStyleTransitionState *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  long long v5 = *(_OWORD *)&self->_stateTable[0].state.endStyle;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_stateTable[0].valid;
  *(_OWORD *)((char *)result + 24) = v5;
  long long v6 = *(_OWORD *)&self->_stateTable[1].state.endStyle;
  long long v7 = *(_OWORD *)&self->_stateTable[2].valid;
  long long v8 = *(_OWORD *)&self->_stateTable[2].state.endStyle;
  *(_OWORD *)((char *)result + 40) = *(_OWORD *)&self->_stateTable[1].valid;
  *(_OWORD *)((char *)result + 88) = v8;
  *(_OWORD *)((char *)result + 72) = v7;
  *(_OWORD *)((char *)result + 56) = v6;
  long long v9 = *(_OWORD *)&self->_stateTable[3].state.endStyle;
  long long v10 = *(_OWORD *)&self->_stateTable[4].valid;
  long long v11 = *(_OWORD *)&self->_stateTable[4].state.endStyle;
  *(_OWORD *)((char *)result + 104) = *(_OWORD *)&self->_stateTable[3].valid;
  *(_OWORD *)((char *)result + 152) = v11;
  *(_OWORD *)((char *)result + 136) = v10;
  *(_OWORD *)((char *)result + 120) = v9;
  return result;
}

- (PBUIPosterWallpaperWindowSceneStyleTransitionState)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  long long v5 = [(PBUIPosterWallpaperWindowSceneStyleTransitionState *)self init];
  if (v5)
  {
    id v18 = v4;
    long long v6 = xpc_dictionary_get_array(v4, "table");
    long long v7 = v6;
    if (v6)
    {
      size_t count = xpc_array_get_count(v6);
      if (count)
      {
        size_t v9 = count;
        for (size_t i = 0; i != v9; ++i)
        {
          long long v11 = xpc_array_get_dictionary(v7, i);
          BOOL v12 = v11;
          if (v11)
          {
            uint64_t uint64 = xpc_dictionary_get_uint64(v11, "priority");
            int64_t int64 = xpc_dictionary_get_int64(v12, "startStyle");
            int64_t v15 = xpc_dictionary_get_int64(v12, "endStyle");
            double v16 = MEMORY[0x1C18716F0](v12, "transitionFraction");
            v19[0] = int64;
            v19[1] = v15;
            *(double *)&v19[2] = v16;
            [(PBUIPosterWallpaperWindowSceneStyleTransitionState *)v5 setWallpaperStyleTransitionState:v19 forPriority:uint64];
          }
        }
      }
    }

    id v4 = v18;
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v5 = 0;
  p_double transitionFraction = &self->_stateTable[0].state.transitionFraction;
  do
  {
    if (*(unsigned char *)(p_transitionFraction - 3))
    {
      double v7 = *p_transitionFraction;
      int64_t v9 = *((void *)p_transitionFraction - 2);
      int64_t v8 = *((void *)p_transitionFraction - 1);
      xpc_object_t v10 = xpc_dictionary_create_empty();
      xpc_dictionary_set_uint64(v10, "priority", v5);
      xpc_dictionary_set_int64(v10, "startStyle", v9);
      xpc_dictionary_set_int64(v10, "endStyle", v8);
      MEMORY[0x1C1871810](v10, "transitionFraction", v7);
      xpc_array_append_value(empty, v10);
    }
    ++v5;
    p_transitionFraction += 4;
  }
  while (v5 != 5);
  xpc_dictionary_set_value(xdict, "table", empty);
}

- (id)succinctDescription
{
  v2 = [(PBUIPosterWallpaperWindowSceneStyleTransitionState *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(PBUIPosterWallpaperWindowSceneStyleTransitionState *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PBUIPosterWallpaperWindowSceneStyleTransitionState *)self succinctDescriptionBuilder];
  unint64_t v6 = 0;
  double v7 = &self->_stateTable[0].valid + 1;
  do
  {
    char v8 = *(v7 - 1);
    v15[0] = *(_OWORD *)v7;
    *(_OWORD *)((char *)v15 + 15) = *(_OWORD *)(v7 + 15);
    if (v8)
    {
      int64_t v9 = PBUIStringForWallpaperStylePriority(v6);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __92__PBUIPosterWallpaperWindowSceneStyleTransitionState_descriptionBuilderWithMultilinePrefix___block_invoke;
      v11[3] = &unk_1E62B2A28;
      id v12 = v5;
      char v13 = v8;
      *(_OWORD *)v14 = v15[0];
      *(_OWORD *)&v14[15] = *(_OWORD *)((char *)v15 + 15);
      [v12 appendBodySectionWithName:v9 multilinePrefix:v4 block:v11];
    }
    ++v6;
    v7 += 32;
  }
  while (v6 != 5);

  return v5;
}

id __92__PBUIPosterWallpaperWindowSceneStyleTransitionState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = PBUIWallpaperStyleDescription(*(void *)(a1 + 48));
  [v2 appendString:v3 withName:@"startStyle"];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = PBUIWallpaperStyleDescription(*(void *)(a1 + 56));
  [v4 appendString:v5 withName:@"endStyle"];

  return (id)[*(id *)(a1 + 32) appendDouble:@"transitionFraction" withName:6 decimalPrecision:*(double *)(a1 + 64)];
}

@end