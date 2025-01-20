@interface PXGHitTestResult
- (BOOL)isDecorated;
- (NSString)identifier;
- (PXGHitTestResult)init;
- (PXGHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userData:(id)a6;
- (PXGHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userDataProvider:(id)a6;
- (PXGLayout)layout;
- (PXGSpriteReference)spriteReference;
- (id)description;
- (id)userData;
@end

@implementation PXGHitTestResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_spriteReference, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_userData, 0);
  objc_storeStrong(&self->_userDataProvider, 0);
}

- (BOOL)isDecorated
{
  return self->_isDecorated;
}

- (PXGLayout)layout
{
  return self->_layout;
}

- (PXGSpriteReference)spriteReference
{
  return self->_spriteReference;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXGHitTestResult *)self identifier];
  v7 = [(PXGHitTestResult *)self userData];
  if ([(PXGHitTestResult *)self isDecorated]) {
    v8 = @"decorated ";
  }
  else {
    v8 = &stru_1F00B0030;
  }
  v9 = [(PXGHitTestResult *)self spriteReference];
  v10 = [v3 stringWithFormat:@"<%@: %p, identifier=%@ userData=%@ %@spriteReference=%@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (id)userData
{
  id userData = self->_userData;
  if (!userData)
  {
    userDataProvider = (void (**)(id, void *, void *))self->_userDataProvider;
    if (userDataProvider)
    {
      v5 = [(PXGHitTestResult *)self layout];
      v6 = [(PXGHitTestResult *)self spriteReference];
      v7 = userDataProvider[2](userDataProvider, v5, v6);
      id v8 = self->_userData;
      self->_id userData = v7;

      id v9 = self->_userDataProvider;
      self->_userDataProvider = 0;

      id userData = self->_userData;
    }
    else
    {
      id userData = 0;
    }
  }
  return userData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PXGHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userData:(id)a6
{
  id v11 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__PXGHitTestResult_initWithSpriteReference_layout_identifier_userData___block_invoke;
  v16[3] = &unk_1E5DC59D0;
  id v12 = v11;
  id v17 = v12;
  v13 = [(PXGHitTestResult *)self initWithSpriteReference:a3 layout:a4 identifier:a5 userDataProvider:v16];
  v14 = v13;
  if (v13) {
    objc_storeStrong(&v13->_userData, a6);
  }

  return v14;
}

id __71__PXGHitTestResult_initWithSpriteReference_layout_identifier_userData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PXGHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userDataProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PXGHitTestResult;
  v15 = [(PXGHitTestResult *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_spriteReference, a3);
    objc_storeStrong((id *)&v16->_layout, a4);
    objc_storeStrong((id *)&v16->_identifier, a5);
    id v17 = _Block_copy(v14);
    id userDataProvider = v16->_userDataProvider;
    v16->_id userDataProvider = v17;
  }
  return v16;
}

- (PXGHitTestResult)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGHitTestResult.m", 25, @"%s is not available as initializer", "-[PXGHitTestResult init]");

  abort();
}

@end