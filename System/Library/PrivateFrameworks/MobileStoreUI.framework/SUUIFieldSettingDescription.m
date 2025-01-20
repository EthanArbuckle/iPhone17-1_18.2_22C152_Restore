@interface SUUIFieldSettingDescription
+ (Class)_viewClassForSettingDescription:(id)a3;
+ (id)_inputViewElementFromElement:(id)a3;
+ (int64_t)_fieldTypeFromElement:(id)a3;
- (BOOL)allowsSelection;
- (SUUIFieldSettingDescription)initWithViewElement:(id)a3 parent:(id)a4;
- (SUUISettingsGroupController)controller;
- (id)fieldValueForKey:(id)a3;
- (int64_t)fieldType;
- (void)_dispatchEventOfType:(unint64_t)a3 extraInfo:(id)a4;
- (void)handleSelectionOnCompletion:(id)a3;
- (void)setController:(id)a3;
- (void)setFieldValue:(id)a3 forKey:(id)a4;
@end

@implementation SUUIFieldSettingDescription

- (SUUIFieldSettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIFieldSettingDescription;
  v7 = [(SUUISettingDescription *)&v9 initWithViewElement:v6 parent:a4];
  if (v7) {
    v7->_fieldType = [(id)objc_opt_class() _fieldTypeFromElement:v6];
  }

  return v7;
}

- (int64_t)fieldType
{
  return self->_fieldType;
}

- (id)fieldValueForKey:(id)a3
{
  fieldValues = self->_fieldValues;
  if (fieldValues)
  {
    fieldValues = [fieldValues objectForKey:a3];
  }
  return fieldValues;
}

- (void)setFieldValue:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  fieldValues = self->_fieldValues;
  if (!fieldValues)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_super v9 = self->_fieldValues;
    self->_fieldValues = v8;

    fieldValues = self->_fieldValues;
  }
  v10 = [(NSMutableDictionary *)fieldValues objectForKey:v6];
  if (([v12 isEqual:v10] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_fieldValues setObject:v12 forKey:v6];
    v11 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v12, v6, 0);
    [(SUUIFieldSettingDescription *)self _dispatchEventOfType:15 extraInfo:v11];
  }
}

+ (int64_t)_fieldTypeFromElement:(id)a3
{
  v3 = [a1 _inputViewElementFromElement:a3];
  if (v3)
  {
    if ([v3 isMemberOfClass:objc_opt_class()])
    {
      int64_t v4 = 0;
    }
    else if ([v3 isMemberOfClass:objc_opt_class()])
    {
      int64_t v4 = 1;
    }
    else if ([v3 isMemberOfClass:objc_opt_class()])
    {
      int64_t v4 = 2;
    }
    else
    {
      int64_t v4 = -1;
    }
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

+ (id)_inputViewElementFromElement:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__66;
  v11 = __Block_byref_object_dispose__66;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__SUUIFieldSettingDescription__inputViewElementFromElement___block_invoke;
  v6[3] = &unk_265400D50;
  v6[4] = &v7;
  [v3 enumerateChildrenUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __60__SUUIFieldSettingDescription__inputViewElementFromElement___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  uint64_t v6 = [v7 elementType];
  if ((unint64_t)(v6 - 139) < 2 || v6 == 58 || v6 == 18)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)allowsSelection
{
  if (self->_fieldType != 1) {
    return 0;
  }
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained
    && (v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)p_controller),
        int v7 = [v6 isMemberOfClass:objc_opt_class()],
        v6,
        v5,
        v7))
  {
    id v8 = objc_loadWeakRetained((id *)p_controller);
    uint64_t v9 = [v8 valueForSettingDescription:self];
    char v10 = [v8 isAuthenticating];

    char v11 = v10 ^ 1;
  }
  else
  {
    uint64_t v9 = 0;
    char v11 = 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v13 = [v9 BOOLValue];
  }
  else {
    char v13 = 0;
  }
  char v12 = v13 & v11;

  return v12;
}

- (void)handleSelectionOnCompletion:(id)a3
{
  int v7 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  int v5 = [WeakRetained isMemberOfClass:objc_opt_class()];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_controller);
    [v6 submitSettingDescription:self];
  }
  v7[2]();
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  id v5 = a3;
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"SUUIFieldSettingDescription.m" lineNumber:175 description:@"Incorrect type of setting description passed to method."];
LABEL_6:
    int v7 = 0;
    goto LABEL_7;
  }
  id v6 = v5;
  if (v6[5] > 2uLL)
  {
    char v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"SUUIFieldSettingDescription.m" lineNumber:169 description:@"Unknown field type."];

    goto LABEL_6;
  }
  int v7 = objc_opt_class();
LABEL_7:

  id v8 = v7;
  return v8;
}

- (void)_dispatchEventOfType:(unint64_t)a3 extraInfo:(id)a4
{
  id v9 = a4;
  id v6 = objc_opt_class();
  int v7 = [(SUUISettingDescription *)self viewElement];
  id v8 = [v6 _inputViewElementFromElement:v7];

  if (!v8)
  {
    id v8 = [(SUUISettingDescription *)self viewElement];
  }
  [v8 dispatchEventOfType:a3 canBubble:1 isCancelable:1 extraInfo:v9 completionBlock:0];
}

- (SUUISettingsGroupController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (SUUISettingsGroupController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValues, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end