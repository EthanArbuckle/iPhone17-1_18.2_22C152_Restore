@interface SXMutableDOMAnalysis
- (void)addComponent:(id)a3 parent:(id)a4;
- (void)addComponent:(id)a3 type:(id)a4 role:(int)a5;
- (void)addComponentStyle:(id)a3 component:(id)a4;
- (void)addComponentTextStyle:(id)a3 component:(id)a4;
- (void)addTextStyle:(id)a3 component:(id)a4;
- (void)removeComponent:(id)a3;
- (void)removeComponentStyle:(id)a3 component:(id)a4;
- (void)removeComponentTextStyle:(id)a3 component:(id)a4;
- (void)removeTextStyle:(id)a3 component:(id)a4;
@end

@implementation SXMutableDOMAnalysis

- (void)addComponent:(id)a3 type:(id)a4 role:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  typeToComponentsMap = self->super._typeToComponentsMap;
  id v9 = a4;
  id v10 = a3;
  v11 = [(NSMutableDictionary *)typeToComponentsMap objectForKey:v9];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x263EFF9C0] set];
  }
  id v24 = v13;

  roleToComponentsMap = self->super._roleToComponentsMap;
  v15 = [NSNumber numberWithInt:v5];
  v16 = [(NSMutableDictionary *)roleToComponentsMap objectForKey:v15];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [MEMORY[0x263EFF9C0] set];
  }
  v19 = v18;

  [v19 addObject:v10];
  [v24 addObject:v10];
  [(NSMutableDictionary *)self->super._typeToComponentsMap setObject:v24 forKey:v9];
  [(NSMutableDictionary *)self->super._componentToTypeMap setObject:v9 forKey:v10];

  v20 = self->super._roleToComponentsMap;
  v21 = [NSNumber numberWithInt:v5];
  [(NSMutableDictionary *)v20 setObject:v19 forKey:v21];

  componentToRoleMap = self->super._componentToRoleMap;
  v23 = [NSNumber numberWithInt:v5];
  [(NSMutableDictionary *)componentToRoleMap setObject:v23 forKey:v10];
}

- (void)addComponentStyle:(id)a3 component:(id)a4
{
  if (a3)
  {
    componentToComponentStylesMap = self->super._componentToComponentStylesMap;
    id v7 = a4;
    id v8 = a3;
    id v10 = [(SXDOMAnalysis *)self identifiersForKey:v7 map:componentToComponentStylesMap];
    [v10 addObject:v8];
    id v9 = [(SXDOMAnalysis *)self identifiersForKey:v8 map:self->super._componentStyleToComponentsMap];

    [v9 addObject:v7];
  }
}

- (void)addComponentTextStyle:(id)a3 component:(id)a4
{
  if (a3)
  {
    componentToComponentTextStylesMap = self->super._componentToComponentTextStylesMap;
    id v7 = a4;
    id v8 = a3;
    id v10 = [(SXDOMAnalysis *)self identifiersForKey:v7 map:componentToComponentTextStylesMap];
    [v10 addObject:v8];
    id v9 = [(SXDOMAnalysis *)self identifiersForKey:v8 map:self->super._componentTextStyleToComponentsMap];

    [v9 addObject:v7];
  }
}

- (void)addTextStyle:(id)a3 component:(id)a4
{
  if (a3)
  {
    componentToTextStylesMap = self->super._componentToTextStylesMap;
    id v7 = a4;
    id v8 = a3;
    id v10 = [(SXDOMAnalysis *)self identifiersForKey:v7 map:componentToTextStylesMap];
    [v10 addObject:v8];
    id v9 = [(SXDOMAnalysis *)self identifiersForKey:v8 map:self->super._textStyleToComponentsMap];

    [v9 addObject:v7];
  }
}

- (void)addComponent:(id)a3 parent:(id)a4
{
  if (a3 && a4)
  {
    componentToChildComponentsMap = self->super._componentToChildComponentsMap;
    id v7 = a4;
    id v8 = a3;
    id v9 = [(SXDOMAnalysis *)self identifiersForKey:v7 map:componentToChildComponentsMap];
    [v9 addObject:v8];
    [(NSMutableDictionary *)self->super._componentToParentComponentMap setObject:v7 forKey:v8];
  }
}

- (void)removeComponent:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = [(SXDOMAnalysis *)self componentStylesForComponent:v4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SXMutableDOMAnalysis *)self removeComponentStyle:*(void *)(*((void *)&v33 + 1) + 8 * v9++) component:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v7);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = [(SXDOMAnalysis *)self componentTextStylesForComponent:v4];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        [(SXMutableDOMAnalysis *)self removeComponentTextStyle:*(void *)(*((void *)&v29 + 1) + 8 * v14++) component:v4];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v12);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v15 = -[SXDOMAnalysis textStylesForComponent:](self, "textStylesForComponent:", v4, 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        [(SXMutableDOMAnalysis *)self removeTextStyle:*(void *)(*((void *)&v25 + 1) + 8 * v19++) component:v4];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v17);
  }

  v20 = [(SXDOMAnalysis *)self typeForComponent:v4];
  v21 = [(SXDOMAnalysis *)self identifiersForKey:v20 map:self->super._typeToComponentsMap];
  [v21 removeObject:v4];
  [(NSMutableDictionary *)self->super._componentToTypeMap removeObjectForKey:v4];
  uint64_t v22 = [(SXDOMAnalysis *)self roleForComponent:v4];
  v23 = [NSNumber numberWithInt:v22];
  id v24 = [(SXDOMAnalysis *)self identifiersForKey:v23 map:self->super._roleToComponentsMap];

  [v24 removeObject:v4];
  [(NSMutableDictionary *)self->super._componentToRoleMap removeObjectForKey:v4];
}

- (void)removeComponentStyle:(id)a3 component:(id)a4
{
  componentToComponentStylesMap = self->super._componentToComponentStylesMap;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(SXDOMAnalysis *)self identifiersForKey:v7 map:componentToComponentStylesMap];
  [v10 removeObject:v8];
  uint64_t v9 = [(SXDOMAnalysis *)self identifiersForKey:v8 map:self->super._componentStyleToComponentsMap];

  [v9 removeObject:v7];
}

- (void)removeComponentTextStyle:(id)a3 component:(id)a4
{
  componentToComponentTextStylesMap = self->super._componentToComponentTextStylesMap;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(SXDOMAnalysis *)self identifiersForKey:v7 map:componentToComponentTextStylesMap];
  [v10 removeObject:v8];
  uint64_t v9 = [(SXDOMAnalysis *)self identifiersForKey:v8 map:self->super._componentTextStyleToComponentsMap];

  [v9 removeObject:v7];
}

- (void)removeTextStyle:(id)a3 component:(id)a4
{
  componentToTextStylesMap = self->super._componentToTextStylesMap;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(SXDOMAnalysis *)self identifiersForKey:v7 map:componentToTextStylesMap];
  [v10 removeObject:v8];
  uint64_t v9 = [(SXDOMAnalysis *)self identifiersForKey:v8 map:self->super._textStyleToComponentsMap];

  [v9 removeObject:v7];
}

@end