@interface _UICommandParentReplacements
- (NSDictionary)childReplacements;
- (void)_setReplacementElements:(id)a3 forElement:(id)a4;
@end

@implementation _UICommandParentReplacements

- (void)_setReplacementElements:(id)a3 forElement:(id)a4
{
  id v15 = a4;
  childReplacements = self->_childReplacements;
  id v8 = a3;
  v9 = [(NSMutableDictionary *)childReplacements objectForKeyedSubscript:v15];

  if (v9)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UICommandInternalDiff.m" lineNumber:82 description:@"child replacements already set"];
  }
  v10 = objc_alloc_init(_UICommandChildReplacements);
  [(_UICommandChildReplacements *)v10 _setReplacementElements:v8];

  v11 = self->_childReplacements;
  if (v11)
  {
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v15];
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v10 forKey:v15];
    v13 = self->_childReplacements;
    self->_childReplacements = v12;
  }
}

- (NSDictionary)childReplacements
{
  return &self->_childReplacements->super;
}

- (void).cxx_destruct
{
}

@end