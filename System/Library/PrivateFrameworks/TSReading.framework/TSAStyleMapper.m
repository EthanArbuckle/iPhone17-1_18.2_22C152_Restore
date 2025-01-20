@interface TSAStyleMapper
- (id)pTargetParentForStyle:(id)a3 withParentIdentifier:(id)a4;
@end

@implementation TSAStyleMapper

- (id)pTargetParentForStyle:(id)a3 withParentIdentifier:(id)a4
{
  id result = [(TSSStylesheet *)self->super._targetStylesheet cascadedStyleWithIdentifier:a4];
  if (result) {
    return result;
  }
  id result = (id)String(a4);
  if (!result) {
    return result;
  }
  id v8 = result;
  if ([result isEqualToString:TSWPTextPackageStringForPreset()])
  {
    if (String(a4))
    {
LABEL_6:
      id result = [(TSSStylesheet *)self->super._targetStylesheet cascadedStyleWithIdentifier:a4 componentMask:13];
      if (result) {
        return result;
      }
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id result = [(TSSStylesheet *)[(TSSStyleMapper *)self targetStylesheet] defaultListStyle];
        if (result) {
          return result;
        }
        goto LABEL_14;
      }
      goto LABEL_6;
    }
LABEL_13:
    id result = [(TSSStylesheet *)[(TSSStyleMapper *)self targetStylesheet] defaultParagraphStyle];
    if (result) {
      return result;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (([v8 isEqualToString:TSTTableNameStylePrefix[0]] & 1) != 0
     || [v8 isEqualToString:TSTTextStylePrefix]))
  {
    goto LABEL_13;
  }
LABEL_14:
  v9.receiver = self;
  v9.super_class = (Class)TSAStyleMapper;
  id result = [(TSSStyleMapper *)&v9 pTargetParentForStyle:a3 withParentIdentifier:a4];
  if (!result)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return [(TSSStylesheet *)[(TSSStyleMapper *)self targetStylesheet] defaultParagraphStyle];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        return [(TSSStylesheet *)[(TSSStyleMapper *)self targetStylesheet] defaultCharacterStyle];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          return [(TSSStylesheet *)[(TSSStyleMapper *)self targetStylesheet] defaultListStyle];
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

@end