@interface PBRepresentationToRepresentationCoercion
- (BOOL)canCoerceToRepresentationOfType:(id)a3;
- (NSString)destinationType;
- (NSString)sourceType;
- (PBRepresentationToRepresentationCoercion)initWithSourceType:(id)a3 destinationType:(id)a4 conversionBlock:(id)a5;
- (id)coercionBlock;
- (void)coerceRepresentationData:(id)a3 representationURL:(id)a4 toRepresentationOfType:(id)a5 completionBlock:(id)a6;
- (void)setCoercionBlock:(id)a3;
- (void)setDestinationType:(id)a3;
- (void)setSourceType:(id)a3;
@end

@implementation PBRepresentationToRepresentationCoercion

- (PBRepresentationToRepresentationCoercion)initWithSourceType:(id)a3 destinationType:(id)a4 conversionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PBRepresentationToRepresentationCoercion;
  v12 = [(PBRepresentationToRepresentationCoercion *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceType, a3);
    objc_storeStrong((id *)&v13->_destinationType, a4);
    uint64_t v14 = MEMORY[0x192F9AA30](v11);
    id coercionBlock = v13->_coercionBlock;
    v13->_id coercionBlock = (id)v14;
  }
  return v13;
}

- (BOOL)canCoerceToRepresentationOfType:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = [(PBRepresentationToRepresentationCoercion *)self destinationType];
  int v6 = UTTypeConformsTo(v5, v4);

  return v6 != 0;
}

- (void)coerceRepresentationData:(id)a3 representationURL:(id)a4 toRepresentationOfType:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (__CFString *)a5;
  id v13 = a6;
  uint64_t v14 = (void *)[(NSString *)self->_sourceType copy];
  v15 = [(PBRepresentationToRepresentationCoercion *)self destinationType];
  int v16 = UTTypeConformsTo(v15, v12);

  if (v16)
  {
    objc_super v17 = [(PBRepresentationToRepresentationCoercion *)self coercionBlock];
    v18 = [(PBRepresentationToRepresentationCoercion *)self destinationType];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __126__PBRepresentationToRepresentationCoercion_coerceRepresentationData_representationURL_toRepresentationOfType_completionBlock___block_invoke;
    v21[3] = &unk_1E5556A40;
    id v22 = v14;
    v23 = v12;
    id v24 = v13;
    ((void (**)(void, void *, id, id, void *))v17)[2](v17, v18, v10, v11, v21);
  }
  else
  {
    v19 = [(PBRepresentationToRepresentationCoercion *)self sourceType];
    v20 = PBCannotCoerceRepresentationOfTypeToRepresentationOfTypeError((uint64_t)v19, (uint64_t)v12, 0);
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v20);
  }
}

void __126__PBRepresentationToRepresentationCoercion_coerceRepresentationData_representationURL_toRepresentationOfType_completionBlock___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  int v6 = v5;
  if (v5)
  {
    v7 = [v5 domain];
    char v8 = [v7 isEqualToString:@"PBErrorDomain"];

    id v9 = v6;
    if ((v8 & 1) == 0)
    {
      id v9 = PBCannotCoerceRepresentationOfTypeToRepresentationOfTypeError(a1[4], a1[5], v6);
    }
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (NSString)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(id)a3
{
}

- (NSString)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(id)a3
{
}

- (id)coercionBlock
{
  return self->_coercionBlock;
}

- (void)setCoercionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_coercionBlock, 0);
  objc_storeStrong((id *)&self->_destinationType, 0);
  objc_storeStrong((id *)&self->_sourceType, 0);
}

@end