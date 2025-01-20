@interface TSWPShapeStyle
+ (id)defaultValueForProperty:(int)a3;
+ (id)layoutProperties;
+ (id)presetStyleDescriptor;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
+ (int)defaultIntValueForProperty:(int)a3;
- (NSString)presetKind;
- (SEL)mapThemePropertyMapSelector;
- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5;
- (id)defaultParagraphStyle;
- (void)setDefaultParagraphStyle:(id)a3;
@end

@implementation TSWPShapeStyle

+ (id)presetStyleDescriptor
{
  return @"shapestyle";
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__TSWPShapeStyle_properties__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (+[TSWPShapeStyle properties]::onceToken != -1) {
    dispatch_once(&+[TSWPShapeStyle properties]::onceToken, block);
  }
  return (id)+[TSWPShapeStyle properties]::s_properties;
}

id __28__TSWPShapeStyle_properties__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___TSWPShapeStyle;
  id result = (id)objc_msgSend(objc_msgSendSuper2(&v2, sel_properties), "propertySetByAddingPropertiesFromSet:", +[TSSPropertySet propertySetWithProperties:](TSSPropertySet, "propertySetWithProperties:", 148, 146, 152, 149, 211, 153, 154, 155, 212, 0));
  +[TSWPShapeStyle properties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)layoutProperties
{
  if (+[TSWPShapeStyle layoutProperties]::onceToken != -1) {
    dispatch_once(&+[TSWPShapeStyle layoutProperties]::onceToken, &__block_literal_global_70);
  }
  return (id)+[TSWPShapeStyle layoutProperties]::s_layoutProperties;
}

TSSPropertySet *__34__TSWPShapeStyle_layoutProperties__block_invoke()
{
  id result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 148, 146, 152, 149, 153, 154, 155, 0);
  +[TSWPShapeStyle layoutProperties]::s_layoutProperties = (uint64_t)result;
  return result;
}

+ (id)propertiesAllowingNSNull
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__TSWPShapeStyle_propertiesAllowingNSNull__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (+[TSWPShapeStyle propertiesAllowingNSNull]::onceToken != -1) {
    dispatch_once(&+[TSWPShapeStyle propertiesAllowingNSNull]::onceToken, block);
  }
  return (id)+[TSWPShapeStyle propertiesAllowingNSNull]::s_nullProperties;
}

void __42__TSWPShapeStyle_propertiesAllowingNSNull__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___TSWPShapeStyle;
  objc_super v2 = objc_msgSend(objc_msgSendSuper2(&v5, sel_propertiesAllowingNSNull), "mutableCopy");
  id v3 = +[TSWPColumnStyle propertiesAllowingNSNull];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__TSWPShapeStyle_propertiesAllowingNSNull__block_invoke_2;
  v4[3] = &unk_2646B0F08;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v2;
  [v3 enumeratePropertiesUsingBlock:v4];
  [v2 addProperty:212];
  +[TSWPShapeStyle propertiesAllowingNSNull]::s_nullProperties = [v2 copy];
}

uint64_t __42__TSWPShapeStyle_propertiesAllowingNSNull__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "properties"), "containsProperty:", a2);
  if (result)
  {
    objc_super v5 = *(void **)(a1 + 40);
    return [v5 addProperty:a2];
  }
  return result;
}

+ (int)defaultIntValueForProperty:(int)a3
{
  char v3 = a3 + 107;
  if ((a3 - 149) > 0x3E) {
    goto LABEL_8;
  }
  if (((1 << v3) & 0x4000000000000070) != 0) {
    return 0;
  }
  if (((1 << v3) & 9) != 0)
  {
    return +[TSWPColumnStyle defaultIntValueForProperty:](TSWPColumnStyle, "defaultIntValueForProperty:");
  }
  else
  {
LABEL_8:
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___TSWPShapeStyle;
    return objc_msgSendSuper2(&v5, sel_defaultIntValueForProperty_);
  }
}

+ (id)defaultValueForProperty:(int)a3
{
  if (a3 == 146)
  {
LABEL_4:
    return +[TSWPColumnStyle defaultValueForProperty:](TSWPColumnStyle, "defaultValueForProperty:");
  }
  if (a3 != 212)
  {
    if (a3 != 148)
    {
      v5.receiver = a1;
      v5.super_class = (Class)&OBJC_METACLASS___TSWPShapeStyle;
      return objc_msgSendSuper2(&v5, sel_defaultValueForProperty_);
    }
    goto LABEL_4;
  }
  v4 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v4 null];
}

- (NSString)presetKind
{
  char v3 = (NSString *)String;
  v4 = [(TSSStyle *)self styleIdentifier];
  if (v4)
  {
    objc_super v5 = (void *)String(v4);
    return (NSString *)TSWPShapePresetKindForPackageString(v5);
  }
  else
  {
    objc_opt_class();
    [(TSSStyle *)self parent];
    v7 = (void *)TSUDynamicCast();
    if (v7)
    {
      return (NSString *)[v7 presetKind];
    }
    else
    {
      return v3;
    }
  }
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tsdMapShapeStylePropertyMap_;
}

- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5
{
  if (a3 == 146)
  {
    id v6 = (id)[a4 copy];
    long long v7 = *(_OWORD *)&a5->c;
    v12[0] = *(_OWORD *)&a5->a;
    v12[1] = v7;
    v12[2] = *(_OWORD *)&a5->tx;
    [v6 transform:v12];
  }
  else
  {
    long long v8 = *(_OWORD *)&a5->c;
    v11[0] = *(_OWORD *)&a5->a;
    v11[1] = v8;
    v11[2] = *(_OWORD *)&a5->tx;
    v10.receiver = self;
    v10.super_class = (Class)TSWPShapeStyle;
    return [(TSDShapeStyle *)&v10 boxedValueForProperty:*(void *)&a3 oldBoxedValue:a4 transformedByTransform:v11];
  }
  return v6;
}

- (void)setDefaultParagraphStyle:(id)a3
{
  if (!a3) {
    a3 = (id)[MEMORY[0x263EFF9D0] null];
  }

  [(TSSStyle *)self setValue:a3 forProperty:212];
}

- (id)defaultParagraphStyle
{
  id v2 = [(TSSStyle *)self valueForProperty:212];
  if (objc_msgSend(v2, "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null"))) {
    return 0;
  }
  else {
    return v2;
  }
}

@end