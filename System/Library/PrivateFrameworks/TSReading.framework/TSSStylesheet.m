@interface TSSStylesheet
- (BOOL)canCullStyles;
- (BOOL)cascadedContainsStyle:(id)a3;
- (BOOL)containsStyle:(id)a3;
- (BOOL)isAncestorOf:(id)a3;
- (BOOL)isChildOf:(id)a3;
- (BOOL)isDescendentOf:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocked;
- (BOOL)isParentOf:(id)a3;
- (NSSet)styles;
- (TSSStylesheet)child;
- (TSSStylesheet)initWithContext:(id)a3;
- (TSSStylesheet)initWithContext:(id)a3 canCullStyles:(BOOL)a4;
- (TSSStylesheet)parent;
- (id)_defaultCharacterStyleWasCreated:(BOOL *)a3;
- (id)_defaultColumnStyleWasCreated:(BOOL *)a3;
- (id)_defaultListStyleWasCreated:(BOOL *)a3;
- (id)_defaultParagraphStyleWasCreated:(BOOL *)a3;
- (id)_defaultStyleOfClass:(Class)a3 withIdentifier:(id)a4 wasCreated:(BOOL *)a5 usingBlock:(id)a6;
- (id)_hyperlinkStyleWasCreated:(BOOL *)a3;
- (id)cascadedFirstStyleWithName:(id)a3;
- (id)cascadedStyleWithIdentifier:(id)a3;
- (id)cascadedStyleWithIdentifier:(id)a3 componentMask:(int)a4;
- (id)childrenOfStyle:(id)a3;
- (id)defaultCharacterStyle;
- (id)defaultColumnStyle;
- (id)defaultListStyle;
- (id)defaultParagraphStyle;
- (id)firstRootlessStyleOfClass:(Class)a3 withOverridePropertyMap:(id)a4;
- (id)firstStyleWithName:(id)a3;
- (id)headerAndFooterStyle;
- (id)hyperlinkStyle;
- (id)identifiedStyles;
- (id)identifiedStylesOfClass:(Class)a3;
- (id)namedStylesOfClass:(Class)a3;
- (id)pVariationOfStyle:(id)a3 propertyMap:(id)a4 matchStyles:(id)a5 context:(id)a6;
- (id)p_variationMapForVaryingCharacterStyle:(id)a3 overParagraphStyle:(id)a4 withPropertyMap:(id)a5;
- (id)rootAncestor;
- (id)styleWithIdentifier:(id)a3;
- (id)styleWithIdentifier:(id)a3 componentMask:(int)a4;
- (id)stylesOfClass:(Class)a3;
- (id)stylesPassingTest:(id)a3;
- (id)stylesWithName:(id)a3;
- (id)stylesWithName:(id)a3 ofClass:(Class)a4;
- (id)unusedStyleIdentifierWithPackageString:(id)a3 styleDescriptor:(id)a4 contentTag:(id)a5;
- (id)variationOfCharacterStyle:(id)a3 paragraphStyle:(id)a4 propertyMap:(id)a5;
- (id)variationOfStyle:(id)a3 exactPropertyMap:(id)a4;
- (id)variationOfStyle:(id)a3 propertyMap:(id)a4;
- (id)variationOfStyle:(id)a3 propertyMap:(id)a4 context:(id)a5;
- (id)variationOfStyle:(id)a3 propertyMap:(id)a4 matchStyles:(id)a5 context:(id)a6;
- (id)variationOfStyleMatchingStyle:(id)a3 withNewParentStyle:(id)a4;
- (unint64_t)descendantCount;
- (void)addStyle:(id)a3;
- (void)addStyle:(id)a3 withIdentifier:(id)a4;
- (void)addStyle:(id)a3 withParent:(id)a4;
- (void)addStyle:(id)a3 withParent:(id)a4 identifier:(id)a5;
- (void)dealloc;
- (void)didLoadChildObjectFromDocumentSupport:(id)a3;
- (void)enumerateCascadedStylesUsingBlock:(id)a3;
- (void)enumerateStylesUsingBlock:(id)a3;
- (void)p_addStyle:(id)a3 withParent:(id)a4 identifier:(id)a5;
- (void)p_addStyleToParentChildren:(id)a3;
- (void)p_removeStyle:(id)a3;
- (void)p_removeStyleFromParentChildren:(id)a3;
- (void)p_setIdentifier:(id)a3 ofStyle:(id)a4;
- (void)p_setParent:(id)a3 ofStyle:(id)a4;
- (void)removeStyle:(id)a3;
- (void)setCanCullStyles:(BOOL)a3;
- (void)setIdentifier:(id)a3 ofStyle:(id)a4;
- (void)setIsLocked:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setParent:(id)a3 ofStyle:(id)a4;
- (void)setParent:(id)a3 withParentStyleMap:(__CFDictionary *)a4;
- (void)unlockStylesheetForDurationOfBlock:(id)a3;
@end

@implementation TSSStylesheet

- (id)defaultColumnStyle
{
  return [(TSSStylesheet *)self _defaultColumnStyleWasCreated:0];
}

- (id)defaultCharacterStyle
{
  return [(TSSStylesheet *)self _defaultCharacterStyleWasCreated:0];
}

- (id)variationOfStyle:(id)a3 propertyMap:(id)a4
{
  if (!a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSSStylesheet variationOfStyle:propertyMap:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 713, @"invalid nil value for '%s'", "style");
  }
  id v9 = a3;
  if ([a3 isVariation]) {
    id v9 = (id)[a3 parent];
  }
  if (!v9)
  {
    v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSSStylesheet variationOfStyle:propertyMap:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 717, @"Cannot create a variation of variation style <%p> with no parent", a3);
  }
  if ([v9 isVariation])
  {
    v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSSStylesheet variationOfStyle:propertyMap:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 718, @"Can't create variation with a variation base style <%p>.", v9);
  }
  v14 = (void *)[a3 newOverridePropertyMapWithPropertyMap:a4];
  if ([v14 count])
  {
    if (!v9) {
      goto LABEL_15;
    }
  }
  else
  {

    v14 = 0;
    if (!v9) {
      goto LABEL_15;
    }
  }
  if (!v14)
  {
    id v15 = v9;
    goto LABEL_24;
  }
LABEL_15:
  if (v9 != a3
    && (TSSStylesheet *)[a3 stylesheet] == self
    && (char v19 = [a3 overridePropertyMapIsEqualTo:v14], a3)
    && (v19 & 1) != 0)
  {
    id v15 = a3;
  }
  else
  {
    objc_sync_enter(self);
    v16 = (void *)[(TSURetainedPointerKeyDictionary *)self->mParentToChildrenStyleMap objectForKeyedSubscript:v9];
    uint64_t v17 = [v16 count] - 1;
    do
    {
      if (v17 == -1)
      {
        objc_sync_exit(self);
        goto LABEL_23;
      }
      id v15 = (id)[v16 objectAtIndexedSubscript:v17--];
    }
    while (([v15 overridePropertyMapIsEqualTo:v14] & 1) == 0);
    objc_sync_exit(self);
    if (v15) {
      goto LABEL_24;
    }
LABEL_23:
    id v15 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", -[TSPObject context](self, "context"), 0, v14, 1);
    [(TSPObject *)self willModify];
    objc_sync_enter(self);
    [(TSSStylesheet *)self p_addStyle:v15 withParent:v9 identifier:0];
    objc_sync_exit(self);
  }
LABEL_24:

  return v15;
}

- (id)_defaultColumnStyleWasCreated:(BOOL *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(TSSStylesheet *)self _defaultStyleOfClass:v5 withIdentifier:@"column-style-default" wasCreated:a3 usingBlock:&__block_literal_global_88];
}

- (id)_defaultCharacterStyleWasCreated:(BOOL *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(TSSStylesheet *)self _defaultStyleOfClass:v5 withIdentifier:@"character-style-null" wasCreated:a3 usingBlock:&__block_literal_global_61];
}

- (TSSStylesheet)initWithContext:(id)a3 canCullStyles:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSSStylesheet;
  uint64_t v5 = [(TSPObject *)&v7 initWithContext:a3];
  if (v5)
  {
    v5->mStyles = (TSUMutableRetainedPointerSet *)objc_alloc_init(MEMORY[0x263F7C878]);
    v5->mIdentifierToStyleMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5->mParentToChildrenStyleMap = (TSURetainedPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8C8]);
    v5->mCanCullStyles = a4;
  }
  return v5;
}

- (id)_defaultParagraphStyleWasCreated:(BOOL *)a3
{
  char v7 = 0;
  if (a3) {
    v4 = a3;
  }
  else {
    v4 = (BOOL *)&v7;
  }
  id v5 = [(TSSStylesheet *)self _defaultStyleOfClass:objc_opt_class() withIdentifier:@"paragraph-style-default" wasCreated:v4 usingBlock:&__block_literal_global_77_0];
  if (*v4) {
    objc_msgSend(v5, "setInitialListStyle:", -[TSSStylesheet defaultListStyle](self, "defaultListStyle"));
  }
  return v5;
}

- (id)_defaultStyleOfClass:(Class)a3 withIdentifier:(id)a4 wasCreated:(BOOL *)a5 usingBlock:(id)a6
{
  id v10 = [(TSSStylesheet *)self cascadedStyleWithIdentifier:a4];
  if (!v10)
  {
    objc_sync_enter(self);
    id v10 = [(TSSStylesheet *)self cascadedStyleWithIdentifier:a4];
    if (!v10)
    {
      id v11 = [(TSSStylesheet *)self rootAncestor];
      uint64_t v12 = [v11 isLocked];
      [v11 setIsLocked:0];
      id v10 = (id)(*((uint64_t (**)(id, uint64_t))a6 + 2))(a6, [v11 context]);
      [v11 addStyle:v10 withIdentifier:a4];
      [v11 setIsLocked:v12];
      if (a5) {
        *a5 = 1;
      }
    }
    objc_sync_exit(self);
  }
  return v10;
}

- (id)cascadedStyleWithIdentifier:(id)a3
{
  id result = -[TSSStylesheet styleWithIdentifier:](self, "styleWithIdentifier:");
  if (!result)
  {
    mParent = self->mParent;
    return [(TSSStylesheet *)mParent cascadedStyleWithIdentifier:a3];
  }
  return result;
}

- (id)styleWithIdentifier:(id)a3
{
  objc_sync_enter(self);
  id v5 = (void *)[(NSMutableDictionary *)self->mIdentifierToStyleMap objectForKeyedSubscript:a3];
  objc_sync_exit(self);
  return v5;
}

- (id)defaultListStyle
{
  return [(TSSStylesheet *)self _defaultListStyleWasCreated:0];
}

- (id)_defaultListStyleWasCreated:(BOOL *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(TSSStylesheet *)self _defaultStyleOfClass:v5 withIdentifier:@"text-0-liststyle-None" wasCreated:a3 usingBlock:&__block_literal_global_84];
}

- (id)defaultParagraphStyle
{
  return [(TSSStylesheet *)self _defaultParagraphStyleWasCreated:0];
}

- (void)setIsLocked:(BOOL)a3
{
  self->mIsLocked = a3;
}

- (id)rootAncestor
{
  while (1)
  {
    v2 = self;
    if (![(TSSStylesheet *)self parent]) {
      break;
    }
    self = [(TSSStylesheet *)v2 parent];
  }
  return v2;
}

- (TSSStylesheet)parent
{
  return self->mParent;
}

- (BOOL)isLocked
{
  return self->mIsLocked;
}

- (void)addStyle:(id)a3 withParent:(id)a4 identifier:(id)a5
{
  [(TSPObject *)self willModify];
  objc_sync_enter(self);
  [(TSSStylesheet *)self p_addStyle:a3 withParent:a4 identifier:a5];

  objc_sync_exit(self);
}

- (void)p_setIdentifier:(id)a3 ofStyle:(id)a4
{
  char v7 = [a3 isEqual:&stru_26D688A48];
  if (a4 && (v7 & 1) == 0)
  {
    objc_sync_enter(self);
    if ([(TSSStylesheet *)self containsStyle:a4])
    {
      if ((TSSStylesheet *)[a4 stylesheet] == self)
      {
        id v8 = [(TSSStylesheet *)self styleWithIdentifier:a3];
        if (v8 != a4)
        {
          if (v8) {
            [(TSSStylesheet *)self p_setIdentifier:0 ofStyle:v8];
          }
          if ([a4 styleIdentifier]) {
            -[NSMutableDictionary removeObjectForKey:](self->mIdentifierToStyleMap, "removeObjectForKey:", [a4 styleIdentifier]);
          }
          [a4 setStyleIdentifier:a3];
          if (a3) {
            [(NSMutableDictionary *)self->mIdentifierToStyleMap setObject:a4 forKeyedSubscript:a3];
          }
        }
      }
    }
    objc_sync_exit(self);
  }
}

- (void)p_addStyle:(id)a3 withParent:(id)a4 identifier:(id)a5
{
  if (a3)
  {
    objc_sync_enter(self);
    if (-[TSSStylesheet containsStyle:](self, "containsStyle:", a3) || [a3 stylesheet])
    {
      id v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSSStylesheet p_addStyle:withParent:identifier:]"];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"];
      uint64_t v12 = TSUObjectReferenceDescription();
      [v9 handleFailureInFunction:v10, v11, 995, @"Adding style %@ to stylesheet %@ when style is already in a stylesheet.", v12, TSUObjectReferenceDescription() file lineNumber description];
      if ((TSSStylesheet *)[a3 stylesheet] != self) {
        objc_msgSend((id)objc_msgSend(a3, "stylesheet"), "removeStyle:", a3);
      }
    }
    [(TSUMutableRetainedPointerSet *)self->mStyles addObject:a3];
    [a3 setStylesheet:self];
    if (a4) {
      [(TSSStylesheet *)self p_setParent:a4 ofStyle:a3];
    }
    if (a5) {
      [(TSSStylesheet *)self p_setIdentifier:a5 ofStyle:a3];
    }
    objc_sync_exit(self);
  }
}

- (BOOL)containsStyle:(id)a3
{
  LOBYTE(a3) = [(TSUMutableRetainedPointerSet *)self->mStyles containsObject:a3];
  objc_sync_exit(self);
  return (char)a3;
}

- (void)p_setParent:(id)a3 ofStyle:(id)a4
{
  if (a4)
  {
    objc_sync_enter(self);
    if ([(TSSStylesheet *)self containsStyle:a4]
      && (TSSStylesheet *)[a4 stylesheet] == self)
    {
      if ([a4 parent]) {
        [(TSSStylesheet *)self p_removeStyleFromParentChildren:a4];
      }
      [a4 setParent:a3];
      if (a3) {
        [(TSSStylesheet *)self p_addStyleToParentChildren:a4];
      }
    }
    objc_sync_exit(self);
  }
}

- (void)p_addStyleToParentChildren:(id)a3
{
  objc_sync_enter(self);
  uint64_t v5 = (void *)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->mParentToChildrenStyleMap, "objectForKeyedSubscript:", [a3 parent]);
  v6 = v5;
  if (v5)
  {
    if ([v5 indexOfObjectIdenticalTo:a3] == 0x7FFFFFFFFFFFFFFFLL) {
      [v6 addObject:a3];
    }
  }
  else
  {
    char v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", a3, 0);
    -[TSURetainedPointerKeyDictionary setObject:forKeyedSubscript:](self->mParentToChildrenStyleMap, "setObject:forKeyedSubscript:", v7, [a3 parent]);
  }

  objc_sync_exit(self);
}

- (void)addStyle:(id)a3 withIdentifier:(id)a4
{
}

uint64_t __67__TSSStylesheet_TSText_Internal___defaultParagraphStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [TSWPParagraphStyle alloc];
  uint64_t v4 = [(id)TSWPBundle() localizedStringForKey:@"Free Form" value:&stru_26D688A48 table:@"TSText"];
  id v5 = +[TSWPParagraphStyle defaultPropertyMap];

  return (uint64_t)[(TSSStyle *)v3 initWithContext:a2 name:v4 overridePropertyMap:v5 isVariation:0];
}

uint64_t __67__TSSStylesheet_TSText_Internal___defaultCharacterStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [TSWPCharacterStyle alloc];
  uint64_t v4 = [(id)TSWPBundle() localizedStringForKey:@"None" value:&stru_26D688A48 table:@"TSText"];

  return (uint64_t)[(TSSStyle *)v3 initWithContext:a2 name:v4 overridePropertyMap:0 isVariation:0];
}

uint64_t __64__TSSStylesheet_TSText_Internal___defaultColumnStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [TSWPColumnStyle alloc];

  return (uint64_t)[(TSSStyle *)v3 initWithContext:a2 name:0 overridePropertyMap:0 isVariation:0];
}

uint64_t __62__TSSStylesheet_TSText_Internal___defaultListStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [TSWPListStyle alloc];
  uint64_t v4 = [(id)TSWPBundle() localizedStringForKey:@"None" value:&stru_26D688A48 table:@"TSText"];
  id v5 = +[TSWPListStyle defaultPropertyMap];

  return (uint64_t)[(TSWPListStyle *)v3 initWithContext:a2 name:v4 overridePropertyMap:v5 isVariation:0];
}

- (TSSStylesheet)initWithContext:(id)a3
{
  return [(TSSStylesheet *)self initWithContext:a3 canCullStyles:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSSStylesheet;
  [(TSSStylesheet *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      objc_sync_enter(self);
      objc_sync_enter(a3);
      if ([*((id *)a3 + 8) isEqual:self->mStyles])
      {
        int v6 = [*((id *)a3 + 9) isEqualToDictionary:self->mIdentifierToStyleMap];
        objc_sync_exit(a3);
        objc_sync_exit(self);
        if (v6) {
          return 1;
        }
      }
      else
      {
        objc_sync_exit(a3);
        objc_sync_exit(self);
      }
    }
  }
  return 0;
}

- (BOOL)canCullStyles
{
  return self->mCanCullStyles;
}

- (void)setCanCullStyles:(BOOL)a3
{
  self->mCanCullStyles = a3;
}

- (NSSet)styles
{
  objc_sync_enter(self);
  objc_super v3 = (void *)[(TSUMutableRetainedPointerSet *)self->mStyles copy];
  objc_sync_exit(self);

  return (NSSet *)v3;
}

- (void)setParent:(id)a3
{
}

- (void)setParent:(id)a3 withParentStyleMap:(__CFDictionary *)a4
{
  [(TSPObject *)self willModify];
  mParent = self->mParent;
  if (mParent)
  {
    mParent->mChild = 0;

    self->mParent = 0;
  }
  char v7 = (TSSStylesheet *)a3;
  self->mParent = v7;
  if (v7) {
    v7->mChild = self;
  }
}

- (BOOL)isChildOf:(id)a3
{
  return self->mParent == a3;
}

- (BOOL)isParentOf:(id)a3
{
  return [a3 parent] == (void)self;
}

- (BOOL)isDescendentOf:(id)a3
{
  mParent = self->mParent;
  if (mParent) {
    LOBYTE(mParent) = mParent == a3 || -[TSSStylesheet isDescendentOf:](mParent, "isDescendentOf:");
  }
  return (char)mParent;
}

- (BOOL)isAncestorOf:(id)a3
{
  uint64_t v5 = [a3 parent];
  if (v5)
  {
    if ((TSSStylesheet *)[a3 parent] == self)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      uint64_t v6 = [a3 parent];
      LOBYTE(v5) = [(TSSStylesheet *)self isAncestorOf:v6];
    }
  }
  return v5;
}

- (unint64_t)descendantCount
{
  v2 = self;
  for (unint64_t i = 0; [(TSSStylesheet *)v2 child]; v2 = [(TSSStylesheet *)v2 child])
    ++i;
  return i;
}

- (void)addStyle:(id)a3
{
}

- (void)addStyle:(id)a3 withParent:(id)a4
{
}

- (void)removeStyle:(id)a3
{
  [(TSPObject *)self willModify];
  objc_sync_enter(self);
  [(TSSStylesheet *)self p_removeStyle:a3];

  objc_sync_exit(self);
}

- (BOOL)cascadedContainsStyle:(id)a3
{
  if (-[TSSStylesheet containsStyle:](self, "containsStyle:"))
  {
    LOBYTE(mParent) = 1;
  }
  else
  {
    mParent = self->mParent;
    if (mParent)
    {
      LOBYTE(mParent) = [(TSSStylesheet *)mParent cascadedContainsStyle:a3];
    }
  }
  return (char)mParent;
}

- (id)styleWithIdentifier:(id)a3 componentMask:(int)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  char v7 = (void *)String(a3, v6);
  BOOL v8 = (unint64_t)[v7 count] > 2;
  BOOL v9 = (unint64_t)[v7 count] > 2;
  BOOL v10 = (unint64_t)[v7 count] > 2;
  BOOL v11 = [v7 count] == 4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v12 = (void *)[(NSMutableDictionary *)self->mIdentifierToStyleMap keyEnumerator];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    int v14 = a4 & v8;
    unsigned int v15 = v9 & (a4 >> 1);
    unsigned int v16 = v10 & (a4 >> 2);
    unsigned int v24 = v11 & (a4 >> 3);
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v12);
        }
        char v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (!v14
          || objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "isEqual:", String(v19)))
        {
          if (!v15
            || (int v20 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "intValue"),
                String(v19) == v20))
          {
            if ((!v16
               || objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 2), "isEqual:", String(v19)))&& (!v24|| objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 3), "isEqual:", String(v19))))
            {
              v21 = (void *)[(NSMutableDictionary *)self->mIdentifierToStyleMap objectForKeyedSubscript:v19];
              goto LABEL_18;
            }
          }
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  v21 = 0;
LABEL_18:
  objc_sync_exit(self);
  return v21;
}

- (id)cascadedStyleWithIdentifier:(id)a3 componentMask:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id result = -[TSSStylesheet styleWithIdentifier:componentMask:](self, "styleWithIdentifier:componentMask:");
  if (!result)
  {
    mParent = self->mParent;
    return [(TSSStylesheet *)mParent cascadedStyleWithIdentifier:a3 componentMask:v4];
  }
  return result;
}

- (void)setIdentifier:(id)a3 ofStyle:(id)a4
{
  [(TSPObject *)self willModify];
  objc_sync_enter(self);
  [(TSSStylesheet *)self p_setIdentifier:a3 ofStyle:a4];

  objc_sync_exit(self);
}

- (void)setParent:(id)a3 ofStyle:(id)a4
{
  [(TSPObject *)self willModify];
  objc_sync_enter(self);
  [(TSSStylesheet *)self p_setParent:a3 ofStyle:a4];

  objc_sync_exit(self);
}

- (id)childrenOfStyle:(id)a3
{
  objc_sync_enter(self);
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->mParentToChildrenStyleMap, "objectForKeyedSubscript:", a3));
  objc_sync_exit(self);
  return v5;
}

- (id)firstStyleWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mStyles = self->mStyles;
  uint64_t v6 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(mStyles);
      }
      BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v9, "name"))) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v9 = 0;
  }
  objc_sync_exit(self);
  return v9;
}

- (id)cascadedFirstStyleWithName:(id)a3
{
  id result = -[TSSStylesheet firstStyleWithName:](self, "firstStyleWithName:");
  if (!result)
  {
    uint64_t v6 = [(TSSStylesheet *)self parent];
    return [(TSSStylesheet *)v6 cascadedFirstStyleWithName:a3];
  }
  return result;
}

- (id)stylesWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mStyles = self->mStyles;
  id v6 = 0;
  uint64_t v7 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mStyles);
        }
        BOOL v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "name")))
        {
          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v6 addObject:v10];
        }
      }
      uint64_t v7 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  objc_sync_exit(self);
  return v6;
}

- (id)stylesWithName:(id)a3 ofClass:(Class)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  mStyles = self->mStyles;
  id v8 = 0;
  uint64_t v9 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(mStyles);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v12, "name"))
          && [v12 isMemberOfClass:a4])
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v8 addObject:v12];
        }
      }
      uint64_t v9 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  objc_sync_exit(self);
  return v8;
}

- (id)stylesOfClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mStyles = self->mStyles;
  id v6 = 0;
  uint64_t v7 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mStyles);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isMemberOfClass:a3])
        {
          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v6 addObject:v10];
        }
      }
      uint64_t v7 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  objc_sync_exit(self);
  return v6;
}

- (id)identifiedStyles
{
  objc_sync_enter(self);
  objc_super v3 = (void *)[(NSMutableDictionary *)self->mIdentifierToStyleMap allValues];
  objc_sync_exit(self);
  return v3;
}

- (id)identifiedStylesOfClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mIdentifierToStyleMap = self->mIdentifierToStyleMap;
  id v6 = 0;
  uint64_t v7 = [(NSMutableDictionary *)mIdentifierToStyleMap countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mIdentifierToStyleMap);
        }
        uint64_t v10 = (void *)[(NSMutableDictionary *)self->mIdentifierToStyleMap objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if ([v10 isMemberOfClass:a3])
        {
          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v6 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)mIdentifierToStyleMap countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  objc_sync_exit(self);
  return v6;
}

- (void)enumerateStylesUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mStyles = self->mStyles;
  uint64_t v6 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(mStyles);
      }
      uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
      char v10 = 0;
      (*((void (**)(id, uint64_t, char *))a3 + 2))(a3, v9, &v10);
      if (v10) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  objc_sync_exit(self);
}

- (void)enumerateCascadedStylesUsingBlock:(id)a3
{
  -[TSSStylesheet enumerateStylesUsingBlock:](self, "enumerateStylesUsingBlock:");
  if ([(TSSStylesheet *)self parent])
  {
    uint64_t v5 = [(TSSStylesheet *)self parent];
    [(TSSStylesheet *)v5 enumerateStylesUsingBlock:a3];
  }
}

- (id)stylesPassingTest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mStyles = self->mStyles;
  id v6 = 0;
  uint64_t v7 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(mStyles);
      }
      uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
      char v12 = 0;
      if ((*((unsigned int (**)(id, uint64_t, char *))a3 + 2))(a3, v10, &v12))
      {
        if (!v6) {
          id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
        }
        [v6 addObject:v10];
      }
      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  objc_sync_exit(self);
  if (v6) {
    return v6;
  }
  else {
    return (id)MEMORY[0x263EFFA68];
  }
}

- (id)namedStylesOfClass:(Class)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__TSSStylesheet_namedStylesOfClass___block_invoke;
  v4[3] = &unk_2646B1078;
  v4[4] = a3;
  return [(TSSStylesheet *)self stylesPassingTest:v4];
}

uint64_t __36__TSSStylesheet_namedStylesOfClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 name];
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return [a2 isMemberOfClass:v5];
  }
  return result;
}

- (id)firstRootlessStyleOfClass:(Class)a3 withOverridePropertyMap:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mStyles = self->mStyles;
  uint64_t v8 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(mStyles);
      }
      long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      if ([v11 isMemberOfClass:a3])
      {
        if (![v11 styleIdentifier]
          && ([v11 isVariation] & 1) == 0
          && ![v11 parent]
          && ([v11 overridePropertyMapIsEqualTo:a4] & 1) != 0)
        {
          break;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(TSUMutableRetainedPointerSet *)mStyles countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    long long v11 = 0;
  }
  objc_sync_exit(self);
  return v11;
}

- (id)variationOfStyleMatchingStyle:(id)a3 withNewParentStyle:(id)a4
{
  uint64_t v6 = [a3 propertyMap];

  return [(TSSStylesheet *)self variationOfStyle:a4 propertyMap:v6];
}

- (id)variationOfStyle:(id)a3 propertyMap:(id)a4 context:(id)a5
{
  if ([(TSPObject *)self context] == a5)
  {
    return [(TSSStylesheet *)self variationOfStyle:a3 propertyMap:a4];
  }
  else
  {
    return [(TSSStylesheet *)self pVariationOfStyle:a3 propertyMap:a4 matchStyles:0 context:a5];
  }
}

- (id)variationOfStyle:(id)a3 propertyMap:(id)a4 matchStyles:(id)a5 context:(id)a6
{
  if ([(TSPObject *)self context] == a6)
  {
    return [(TSSStylesheet *)self variationOfStyle:a3 propertyMap:a4];
  }
  else
  {
    return [(TSSStylesheet *)self pVariationOfStyle:a3 propertyMap:a4 matchStyles:a5 context:a6];
  }
}

- (id)variationOfStyle:(id)a3 exactPropertyMap:(id)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[TSSStylesheet variationOfStyle:exactPropertyMap:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 837, @"invalid nil value for '%s'", "originalStyle");
    if (a4) {
      goto LABEL_3;
    }
  }
  v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v22 = [NSString stringWithUTF8String:"-[TSSStylesheet variationOfStyle:exactPropertyMap:]"];
  objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 838, @"invalid nil value for '%s'", "propertyMap");
LABEL_3:
  id v7 = a3;
  if ([a3 isVariation]) {
    id v7 = (id)[a3 parent];
  }
  if (!v7)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSSStylesheet variationOfStyle:exactPropertyMap:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 841, @"Cannot create a variation of variation style <%p> with no parent", a3);
  }
  if ([v7 isVariation])
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSSStylesheet variationOfStyle:exactPropertyMap:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 842, @"Can't create variation with a variation base style <%p>.", v7);
  }
  id v12 = a4;
  objc_sync_enter(self);
  long long v13 = (void *)[(TSURetainedPointerKeyDictionary *)self->mParentToChildrenStyleMap objectForKeyedSubscript:v7];
  uint64_t v14 = [v13 count];
  if (!v14)
  {
LABEL_14:
    objc_sync_exit(self);
LABEL_15:
    uint64_t v17 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", -[TSPObject context](self, "context"), 0, v12, 1);
    [(TSPObject *)self willModify];
    objc_sync_enter(self);
    [(TSSStylesheet *)self p_addStyle:v17 withParent:v7 identifier:0];
    objc_sync_exit(self);

    goto LABEL_16;
  }
  uint64_t v15 = v14 - 1;
  while (1)
  {
    id v16 = (id)[v13 objectAtIndexedSubscript:v15];
    uint64_t v17 = v16;
    if (v16 != a3 && ([v16 overridePropertyMapIsEqualTo:v12] & 1) != 0) {
      break;
    }
    if (--v15 == -1) {
      goto LABEL_14;
    }
  }
  objc_sync_exit(self);
  if (!v17) {
    goto LABEL_15;
  }
LABEL_16:

  return v17;
}

- (void)didLoadChildObjectFromDocumentSupport:(id)a3
{
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    uint64_t v5 = v4;
    if ((TSSStylesheet *)[v4 stylesheet] == self)
    {
      objc_sync_enter(self);
      if (([(TSUMutableRetainedPointerSet *)self->mStyles containsObject:v5] & 1) == 0)
      {
        [(TSPObject *)self willModify];
        if ([v5 styleIdentifier]) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->mIdentifierToStyleMap, "setObject:forKeyedSubscript:", v5, [v5 styleIdentifier]);
        }
        if ([v5 parent]) {
          [(TSSStylesheet *)self p_addStyleToParentChildren:v5];
        }
        [(TSUMutableRetainedPointerSet *)self->mStyles addObject:v5];
      }
      objc_sync_exit(self);
    }
  }
}

- (void)unlockStylesheetForDurationOfBlock:(id)a3
{
  BOOL mIsLocked = self->mIsLocked;
  self->BOOL mIsLocked = 0;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->BOOL mIsLocked = mIsLocked;
}

- (void)p_removeStyle:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    if (![(TSSStylesheet *)self containsStyle:a3]
      || (TSSStylesheet *)[a3 stylesheet] != self)
    {
      uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSSStylesheet p_removeStyle:]"];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"];
      uint64_t v8 = TSUObjectReferenceDescription();
      [v5 handleFailureInFunction:v6, v7, 1037, @"Removing style %@ from stylesheet %@ when style not in stylesheet.", v8, TSUObjectReferenceDescription() file lineNumber description];
    }
    if ([a3 parent]) {
      [(TSSStylesheet *)self p_setParent:0 ofStyle:a3];
    }
    if ([a3 styleIdentifier]) {
      [(TSSStylesheet *)self p_setIdentifier:0 ofStyle:a3];
    }
    [a3 setStylesheet:0];
    [(TSUMutableRetainedPointerSet *)self->mStyles removeObject:a3];
    objc_sync_exit(self);
  }
}

- (void)p_removeStyleFromParentChildren:(id)a3
{
  objc_sync_enter(self);
  uint64_t v5 = (void *)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->mParentToChildrenStyleMap, "objectForKeyedSubscript:", [a3 parent]);
  uint64_t v6 = [v5 indexOfObjectIdenticalTo:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 removeObjectAtIndex:v6];
  }
  if (v5 && !objc_msgSend(v5, "count", v6)) {
    -[TSURetainedPointerKeyDictionary removeObjectForKey:](self->mParentToChildrenStyleMap, "removeObjectForKey:", [a3 parent]);
  }

  objc_sync_exit(self);
}

- (id)pVariationOfStyle:(id)a3 propertyMap:(id)a4 matchStyles:(id)a5 context:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSSStylesheet pVariationOfStyle:propertyMap:matchStyles:context:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 1173, @"invalid nil value for '%s'", "style");
  }
  id v13 = a3;
  if ([a3 isVariation]) {
    id v13 = (id)[a3 parent];
  }
  if (!v13)
  {
    uint64_t v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSSStylesheet pVariationOfStyle:propertyMap:matchStyles:context:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 1177, @"Cannot create a variation of variation style <%p> with no parent", a3);
  }
  if ([v13 isVariation])
  {
    id v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[TSSStylesheet pVariationOfStyle:propertyMap:matchStyles:context:]"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 1178, @"Can't create variation with a variation base style <%p>.", v13);
  }
  uint64_t v18 = (void *)[a3 newOverridePropertyMapWithPropertyMap:a4];
  if ([v18 count])
  {
    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {

    uint64_t v18 = 0;
    if (!v13) {
      goto LABEL_15;
    }
  }
  if (!v18)
  {
    id v19 = v13;
    goto LABEL_40;
  }
LABEL_15:
  if (v13 != a3 && (TSSStylesheet *)[a3 stylesheet] == self)
  {
    char v26 = [a3 overridePropertyMapIsEqualTo:v18];
    if (a3)
    {
      if (v26)
      {
        id v19 = a3;
        goto LABEL_40;
      }
    }
  }
  objc_sync_enter(self);
  uint64_t v20 = (void *)[(TSURetainedPointerKeyDictionary *)self->mParentToChildrenStyleMap objectForKeyedSubscript:v13];
  uint64_t v21 = [v20 count] - 1;
  while (v21 != -1)
  {
    id v19 = (id)[v20 objectAtIndexedSubscript:v21--];
    if ([v19 overridePropertyMapIsEqualTo:v18]) {
      goto LABEL_22;
    }
  }
  id v19 = 0;
LABEL_22:
  objc_sync_exit(self);
  if (!a5 || v19)
  {
LABEL_33:
    if (v19) {
      goto LABEL_40;
    }
    goto LABEL_34;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v22 = [a5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v29;
LABEL_26:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v29 != v23) {
        objc_enumerationMutation(a5);
      }
      id v19 = *(id *)(*((void *)&v28 + 1) + 8 * v24);
      if ([v19 overridePropertyMapIsEqualTo:v18]) {
        goto LABEL_33;
      }
      if (v22 == ++v24)
      {
        uint64_t v22 = [a5 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v22) {
          goto LABEL_26;
        }
        break;
      }
    }
  }
LABEL_34:
  id v19 = (id)[objc_alloc((Class)objc_opt_class()) initWithContext:a6 name:0 overridePropertyMap:v18 isVariation:1];
  [v19 setParent:v13];
  if (a5) {
    [a5 addObject:v19];
  }
  id v25 = v19;
LABEL_40:

  return v19;
}

- (id)unusedStyleIdentifierWithPackageString:(id)a3 styleDescriptor:(id)a4 contentTag:(id)a5
{
  uint64_t v9 = 0;
  do
  {
    uint64_t v10 = (void *)String((uint64_t)a3, v9, (uint64_t)a4);
    uint64_t v11 = v10;
    if (a5) {
      uint64_t v11 = (void *)String(v10, (uint64_t)a5);
    }
    ++v9;
  }
  while ([(TSSStylesheet *)self styleWithIdentifier:v11]);
  return v11;
}

- (TSSStylesheet)child
{
  return self->mChild;
}

- (id)p_variationMapForVaryingCharacterStyle:(id)a3 overParagraphStyle:(id)a4 withPropertyMap:(id)a5
{
  id v8 = +[TSSPropertyMap propertyMap];
  if (a3)
  {
    uint64_t v9 = [a3 baseStyleForVariation];
    if ([a3 isVariation]) {
      objc_msgSend(v8, "addValuesFromPropertyMap:", objc_msgSend(a3, "overridePropertyMap"));
    }
    if (a5) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (a5) {
LABEL_5:
    }
      [v8 addValuesFromPropertyMap:a5];
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3052000000;
  uint64_t v18 = __Block_byref_object_copy__19;
  id v19 = __Block_byref_object_dispose__19;
  uint64_t v20 = 0;
  uint64_t v10 = (void *)[v8 allProperties];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __111__TSSStylesheet_TSWPStyleAdditions__p_variationMapForVaryingCharacterStyle_overParagraphStyle_withPropertyMap___block_invoke;
  v14[3] = &unk_2646B1A88;
  v14[4] = v8;
  v14[5] = v9;
  v14[6] = a4;
  v14[7] = &v15;
  [v10 enumeratePropertiesUsingBlock:v14];
  if (v16[5])
  {
    objc_msgSend(v8, "removeValuesForProperties:");
  }
  if (!v8)
  {
    uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSSStylesheet(TSWPStyleAdditions) p_variationMapForVaryingCharacterStyle:overParagraphStyle:withPropertyMap:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStylesheetAdditions.mm"), 127, @"invalid nil value for '%s'", "newPropertyMap");
  }
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __111__TSSStylesheet_TSWPStyleAdditions__p_variationMapForVaryingCharacterStyle_overParagraphStyle_withPropertyMap___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)[*(id *)(a1 + 32) boxedObjectForProperty:a2];
  if (v4 == (void *)[MEMORY[0x263EFF9D0] null]) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [*(id *)(a1 + 40) boxedValueForProperty:a2];
  if (!v5) {
    uint64_t v5 = [*(id *)(a1 + 48) boxedValueForProperty:a2];
  }
  if (v5 == [MEMORY[0x263EFF9D0] null]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (void *)v5;
  }
  if (v4 == v6 || (uint64_t result = objc_msgSend(v4, "isEqual:"), result))
  {
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v8)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_alloc_init(TSSMutablePropertySet);
      id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    return [v8 addProperty:a2];
  }
  return result;
}

- (id)variationOfCharacterStyle:(id)a3 paragraphStyle:(id)a4 propertyMap:(id)a5
{
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSSStylesheet(TSWPStyleAdditions) variationOfCharacterStyle:paragraphStyle:propertyMap:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStylesheetAdditions.mm"), 160, @"invalid nil value for '%s'", "inParagraphStyle");
    if (a5) {
      goto LABEL_3;
    }
  }
  id v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v14 = [NSString stringWithUTF8String:"-[TSSStylesheet(TSWPStyleAdditions) variationOfCharacterStyle:paragraphStyle:propertyMap:]"];
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStylesheetAdditions.mm"), 161, @"invalid nil value for '%s'", "inPropertyMap");
LABEL_3:
  id v9 = [(TSSStylesheet *)self p_variationMapForVaryingCharacterStyle:a3 overParagraphStyle:a4 withPropertyMap:a5];
  if (a3) {
    id v10 = (id)[a3 baseStyleForVariation];
  }
  else {
    id v10 = [(TSSStylesheet *)self defaultCharacterStyle];
  }
  id v15 = v10;
  if (!v10)
  {
    id v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[TSSStylesheet(TSWPStyleAdditions) variationOfCharacterStyle:paragraphStyle:propertyMap:]"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStylesheetAdditions.mm"), 170, @"invalid nil value for '%s'", "baseStyle");
  }
  id v18 = [(TSSStylesheet *)self variationOfStyle:v15 propertyMap:v9];
  if (v18 == [(TSSStylesheet *)self defaultCharacterStyle]) {
    return 0;
  }
  else {
    return v18;
  }
}

- (id)hyperlinkStyle
{
  return [(TSSStylesheet *)self _hyperlinkStyleWasCreated:0];
}

- (id)headerAndFooterStyle
{
  objc_opt_class();
  -[TSSStylesheet cascadedFirstStyleWithName:](self, "cascadedFirstStyleWithName:", [(id)TSWPBundle() localizedStringForKey:@"Header & Footer" value:&stru_26D688A48 table:@"TSText"]);
  id result = (id)TSUDynamicCast();
  if (!result)
  {
    return [(TSSStylesheet *)self defaultParagraphStyle];
  }
  return result;
}

- (id)_hyperlinkStyleWasCreated:(BOOL *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(TSSStylesheet *)self _defaultStyleOfClass:v5 withIdentifier:@"character-style-hyperlink" wasCreated:a3 usingBlock:&__block_literal_global_71];
}

uint64_t __60__TSSStylesheet_TSText_Internal___hyperlinkStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = [TSWPCharacterStyle alloc];
  uint64_t v4 = [(id)TSWPBundle() localizedStringForKey:@"Link" value:&stru_26D688A48 table:@"TSText"];
  uint64_t v5 = +[TSSPropertyMap propertyMapWithPropertiesAndValues:](TSSPropertyMap, "propertyMapWithPropertiesAndValues:", 22, 1, 0);

  return (uint64_t)[(TSSStyle *)v3 initWithContext:a2 name:v4 overridePropertyMap:v5 isVariation:0];
}

@end