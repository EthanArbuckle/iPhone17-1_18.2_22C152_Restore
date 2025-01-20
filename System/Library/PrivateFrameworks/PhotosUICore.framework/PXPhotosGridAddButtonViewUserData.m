@interface PXPhotosGridAddButtonViewUserData
- (BOOL)isEqual:(id)a3;
- (PXPhotosGridAddButtonViewUserData)init;
- (PXPhotosGridAddButtonViewUserData)initWithStyle:(int64_t)a3 actionHandler:(id)a4;
- (double)cornerRadius;
- (id)actionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)style;
- (unint64_t)hash;
- (void)setCornerRadius:(double)a3;
- (void)setPreferredUserInterfaceStyle:(int64_t)a3;
@end

@implementation PXPhotosGridAddButtonViewUserData

- (void).cxx_destruct
{
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXPhotosGridAddButtonViewUserData *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(PXPhotosGridAddButtonViewUserData *)self style];
      if (v6 == [(PXPhotosGridAddButtonViewUserData *)v5 style])
      {
        v7 = [(PXPhotosGridAddButtonViewUserData *)self actionHandler];
        v8 = [(PXPhotosGridAddButtonViewUserData *)v5 actionHandler];
        if (v7 == v8
          && ([(PXPhotosGridAddButtonViewUserData *)self cornerRadius],
              double v11 = v10,
              [(PXPhotosGridAddButtonViewUserData *)v5 cornerRadius],
              v11 == v12))
        {
          int64_t v13 = [(PXPhotosGridAddButtonViewUserData *)self preferredUserInterfaceStyle];
          BOOL v9 = v13 == [(PXPhotosGridAddButtonViewUserData *)v5 preferredUserInterfaceStyle];
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  [(PXPhotosGridAddButtonViewUserData *)self cornerRadius];
  unint64_t v4 = (unint64_t)v3 ^ (4 * [(PXPhotosGridAddButtonViewUserData *)self style]);
  return v4 ^ (8 * [(PXPhotosGridAddButtonViewUserData *)self preferredUserInterfaceStyle]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(PXPhotosGridAddButtonViewUserData *)self style];
  int64_t v6 = [(PXPhotosGridAddButtonViewUserData *)self actionHandler];
  v7 = (void *)[v4 initWithStyle:v5 actionHandler:v6];

  [(PXPhotosGridAddButtonViewUserData *)self cornerRadius];
  v7[4] = v8;
  v7[3] = [(PXPhotosGridAddButtonViewUserData *)self preferredUserInterfaceStyle];
  return v7;
}

- (PXPhotosGridAddButtonViewUserData)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridAddButtonView.m", 184, @"%s is not available as initializer", "-[PXPhotosGridAddButtonViewUserData init]");

  abort();
}

- (PXPhotosGridAddButtonViewUserData)initWithStyle:(int64_t)a3 actionHandler:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosGridAddButtonViewUserData;
  v7 = [(PXPhotosGridAddButtonViewUserData *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_style = a3;
    uint64_t v9 = [v6 copy];
    id actionHandler = v8->_actionHandler;
    v8->_id actionHandler = (id)v9;

    v8->_preferredUserInterfaceStyle = 0;
  }

  return v8;
}

@end