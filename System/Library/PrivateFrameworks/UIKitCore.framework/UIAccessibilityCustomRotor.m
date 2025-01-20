@interface UIAccessibilityCustomRotor
- (NSAttributedString)attributedName;
- (NSString)name;
- (NSUUID)uuid;
- (UIAccessibilityCustomRotor)initWithAttributedName:(NSAttributedString *)attributedName itemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock;
- (UIAccessibilityCustomRotor)initWithName:(NSString *)name itemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock;
- (UIAccessibilityCustomRotor)initWithSystemType:(UIAccessibilityCustomSystemRotorType)type itemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock;
- (UIAccessibilityCustomRotorSearch)itemSearchBlock;
- (UIAccessibilityCustomSystemRotorType)systemRotorType;
- (id)targetElement;
- (void)setAttributedName:(NSAttributedString *)attributedName;
- (void)setItemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock;
- (void)setName:(NSString *)name;
- (void)setSystemRotorType:(int64_t)a3;
- (void)setTargetElement:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UIAccessibilityCustomRotor

- (UIAccessibilityCustomRotor)initWithName:(NSString *)name itemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock
{
  v6 = name;
  UIAccessibilityCustomRotorSearch v7 = itemSearchBlock;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityCustomRotor;
  v8 = [(UIAccessibilityCustomRotor *)&v12 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F29128] UUID];
    [(UIAccessibilityCustomRotor *)v8 setUuid:v9];

    [(UIAccessibilityCustomRotor *)v8 setName:v6];
    [(UIAccessibilityCustomRotor *)v8 setItemSearchBlock:v7];
    v10 = v8;
  }

  return v8;
}

- (UIAccessibilityCustomRotor)initWithAttributedName:(NSAttributedString *)attributedName itemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock
{
  v6 = attributedName;
  UIAccessibilityCustomRotorSearch v7 = itemSearchBlock;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityCustomRotor;
  v8 = [(UIAccessibilityCustomRotor *)&v12 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F29128] UUID];
    [(UIAccessibilityCustomRotor *)v8 setUuid:v9];

    [(UIAccessibilityCustomRotor *)v8 setAttributedName:v6];
    [(UIAccessibilityCustomRotor *)v8 setItemSearchBlock:v7];
    v10 = v8;
  }

  return v8;
}

- (UIAccessibilityCustomRotor)initWithSystemType:(UIAccessibilityCustomSystemRotorType)type itemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock
{
  v9.receiver = self;
  v9.super_class = (Class)UIAccessibilityCustomRotor;
  UIAccessibilityCustomRotorSearch v5 = itemSearchBlock;
  v6 = [(UIAccessibilityCustomRotor *)&v9 init];
  UIAccessibilityCustomRotorSearch v7 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", v9.receiver, v9.super_class);
  [(UIAccessibilityCustomRotor *)v6 setUuid:v7];

  [(UIAccessibilityCustomRotor *)v6 setSystemRotorType:type];
  [(UIAccessibilityCustomRotor *)v6 setItemSearchBlock:v5];

  return v6;
}

- (NSString)name
{
  v2 = [(UIAccessibilityCustomRotor *)self attributedName];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setName:(NSString *)name
{
  v4 = name;
  if (!v4)
  {
    uint64_t v5 = objc_opt_class();
    _UIAccessibilityReportNilNameErroneouslyProvided(v5);
    v4 = &stru_1ED0E84C0;
  }
  UIAccessibilityCustomRotorSearch v7 = v4;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
  [(UIAccessibilityCustomRotor *)self setAttributedName:v6];
}

- (void)setAttributedName:(NSAttributedString *)attributedName
{
  v4 = attributedName;
  if (!v4)
  {
    uint64_t v5 = objc_opt_class();
    _UIAccessibilityReportNilNameErroneouslyProvided(v5);
    v4 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
  }
  v8 = v4;
  v6 = (NSAttributedString *)[(NSAttributedString *)v4 copy];
  UIAccessibilityCustomRotorSearch v7 = self->_attributedName;
  self->_attributedName = v6;
}

- (NSUUID)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (id)targetElement
{
  id WeakRetained = objc_loadWeakRetained(&self->targetElement);
  return WeakRetained;
}

- (void)setTargetElement:(id)a3
{
}

- (UIAccessibilityCustomSystemRotorType)systemRotorType
{
  return self->systemRotorType;
}

- (void)setSystemRotorType:(int64_t)a3
{
  self->systemRotorType = a3;
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (UIAccessibilityCustomRotorSearch)itemSearchBlock
{
  return self->_itemSearchBlock;
}

- (void)setItemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemSearchBlock, 0);
  objc_storeStrong((id *)&self->_attributedName, 0);
  objc_destroyWeak(&self->targetElement);
  objc_storeStrong((id *)&self->uuid, 0);
}

@end