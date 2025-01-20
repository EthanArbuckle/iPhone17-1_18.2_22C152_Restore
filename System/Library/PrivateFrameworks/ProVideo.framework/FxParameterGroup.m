@interface FxParameterGroup
- (FxParameterGroup)init;
- (id)subPins;
- (void)dealloc;
- (void)setSubPins:(id)a3;
@end

@implementation FxParameterGroup

- (FxParameterGroup)init
{
  v5.receiver = self;
  v5.super_class = (Class)FxParameterGroup;
  v2 = [(FxPinParameter *)&v5 init];
  if (v2)
  {
    v3 = (FxParameterGroupPriv *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v2->_groupPriv = v3;
    if (v3) {
      v2->_groupPriv->var0 = (id)[MEMORY[0x1E4F1CA48] array];
    }
    [(FxPin *)v2 setValueClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_groupPriv != 0, &cfstr_GroupprivNull.isa, v2, v3, v4, v5, v6, v7, (char)v10.receiver);
  groupPriv = self->_groupPriv;
  if (groupPriv)
  {
    if (groupPriv->var0)
    {

      groupPriv = self->_groupPriv;
    }
    free(groupPriv);
  }
  v10.receiver = self;
  v10.super_class = (Class)FxParameterGroup;
  [(FxPinParameter *)&v10 dealloc];
}

- (id)subPins
{
  return self->_groupPriv->var0;
}

- (void)setSubPins:(id)a3
{
  id var0 = self->_groupPriv->var0;
  if (var0) {

  }
  self->_groupPriv->id var0 = a3;
}

@end