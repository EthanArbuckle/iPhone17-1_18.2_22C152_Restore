@interface FxParameterListSelection
- (FxParameterListSelection)init;
- (id)displayNameForValue:(id)a3;
- (id)listItems;
- (int)preferredListVariant;
- (void)dealloc;
- (void)setListItems:(id)a3;
- (void)setPreferredListVariant:(int)a3;
@end

@implementation FxParameterListSelection

- (FxParameterListSelection)init
{
  v4.receiver = self;
  v4.super_class = (Class)FxParameterListSelection;
  v2 = [(FxPinParameter *)&v4 init];
  if (v2)
  {
    v2->_listSelectionPriv = (FxParameterListSelectionPriv *)malloc_type_calloc(1uLL, 0x10uLL, 0x10800407411B482uLL);
    [(FxPin *)v2 setValueClass:objc_opt_class()];
  }
  return v2;
}

- (void)dealloc
{
  FxDebugAssert(self->_listSelectionPriv != 0, &cfstr_Listselectionp.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_listSelectionPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterListSelection;
  [(FxPinParameter *)&v9 dealloc];
}

- (int)preferredListVariant
{
  return self->_listSelectionPriv->var0;
}

- (void)setPreferredListVariant:(int)a3
{
  self->_listSelectionPriv->var0 = a3;
}

- (id)listItems
{
  return self->_listSelectionPriv->var1;
}

- (void)setListItems:(id)a3
{
  id var1 = self->_listSelectionPriv->var1;
  if (var1) {

  }
  self->_listSelectionPriv->id var1 = a3;
}

- (id)displayNameForValue:(id)a3
{
  id var1 = self->_listSelectionPriv->var1;
  if (!var1) {
    return 0;
  }
  uint64_t v4 = (int)[a3 intValue];

  return (id)[var1 objectAtIndex:v4];
}

@end