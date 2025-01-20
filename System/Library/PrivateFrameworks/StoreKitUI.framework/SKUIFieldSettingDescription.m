@interface SKUIFieldSettingDescription
+ (Class)_viewClassForSettingDescription:(id)a3;
+ (id)_inputViewElementFromElement:(id)a3;
+ (int64_t)_fieldTypeFromElement:(id)a3;
- (BOOL)allowsSelection;
- (SKUIFieldSettingDescription)initWithViewElement:(id)a3 parent:(id)a4;
- (SKUISettingsGroupController)controller;
- (id)fieldValueForKey:(id)a3;
- (int64_t)fieldType;
- (void)_dispatchEventOfType:(unint64_t)a3 extraInfo:(id)a4;
- (void)handleSelectionOnCompletion:(id)a3;
- (void)setController:(id)a3;
- (void)setFieldValue:(id)a3 forKey:(id)a4;
@end

@implementation SKUIFieldSettingDescription

- (SKUIFieldSettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFieldSettingDescription initWithViewElement:parent:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIFieldSettingDescription;
  v8 = [(SKUISettingDescription *)&v10 initWithViewElement:v6 parent:v7];
  if (v8) {
    v8->_fieldType = [(id)objc_opt_class() _fieldTypeFromElement:v6];
  }

  return v8;
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
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_fieldValues;
    self->_fieldValues = v8;

    fieldValues = self->_fieldValues;
  }
  objc_super v10 = [(NSMutableDictionary *)fieldValues objectForKey:v6];
  if (([v12 isEqual:v10] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_fieldValues setObject:v12 forKey:v6];
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v12, v6, 0);
    [(SKUIFieldSettingDescription *)self _dispatchEventOfType:15 extraInfo:v11];
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
  objc_super v10 = __Block_byref_object_copy__78;
  v11 = __Block_byref_object_dispose__78;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SKUIFieldSettingDescription__inputViewElementFromElement___block_invoke;
  v6[3] = &unk_1E6422498;
  v6[4] = &v7;
  [v3 enumerateChildrenUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __60__SKUIFieldSettingDescription__inputViewElementFromElement___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
    if (v4[5] > 2uLL) {
      int v5 = 0;
    }
    else {
      int v5 = objc_opt_class();
    }
  }
  else
  {
    int v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_dispatchEventOfType:(unint64_t)a3 extraInfo:(id)a4
{
  id v9 = a4;
  id v6 = objc_opt_class();
  int v7 = [(SKUISettingDescription *)self viewElement];
  id v8 = [v6 _inputViewElementFromElement:v7];

  if (!v8)
  {
    id v8 = [(SKUISettingDescription *)self viewElement];
  }
  [v8 dispatchEventOfType:a3 canBubble:1 isCancelable:1 extraInfo:v9 completionBlock:0];
}

- (SKUISettingsGroupController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (SKUISettingsGroupController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValues, 0);

  objc_destroyWeak((id *)&self->_controller);
}

- (void)initWithViewElement:parent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFieldSettingDescription initWithViewElement:parent:]";
}

@end