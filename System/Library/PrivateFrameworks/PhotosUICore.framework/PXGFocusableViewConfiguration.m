@interface PXGFocusableViewConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)debugName;
- (PXGFocusableViewConfiguration)init;
- (PXGFocusableViewConfiguration)initWithConfiguration:(id)a3;
- (PXGFocusableViewDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)focusability;
- (unint64_t)hash;
- (void)setDebugName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusability:(int64_t)a3;
@end

@implementation PXGFocusableViewConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDebugName:(id)a3
{
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setFocusability:(int64_t)a3
{
  self->_focusability = a3;
}

- (int64_t)focusability
{
  return self->_focusability;
}

- (void)setDelegate:(id)a3
{
}

- (PXGFocusableViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGFocusableViewDelegate *)WeakRetained;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithConfiguration:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXGFocusableViewConfiguration *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PXGFocusableViewConfiguration *)self delegate];
      v7 = [(PXGFocusableViewConfiguration *)v5 delegate];
      if (v6 == v7
        && (int64_t v8 = [(PXGFocusableViewConfiguration *)self focusability],
            v8 == [(PXGFocusableViewConfiguration *)v5 focusability]))
      {
        v9 = [(PXGFocusableViewConfiguration *)self debugName];
        v10 = [(PXGFocusableViewConfiguration *)v5 debugName];
        if (v9 == v10) {
          char v11 = 1;
        }
        else {
          char v11 = [v9 isEqual:v10];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PXGFocusableViewConfiguration *)self delegate];

  int64_t v4 = v3 ^ (2 * [(PXGFocusableViewConfiguration *)self focusability]);
  v5 = [(PXGFocusableViewConfiguration *)self debugName];
  unint64_t v6 = v4 ^ (4 * [v5 hash]);

  return v6;
}

- (PXGFocusableViewConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGFocusableViewConfiguration;
  v5 = [(PXGFocusableViewConfiguration *)&v10 init];
  if (v5)
  {
    unint64_t v6 = [v4 delegate];
    objc_storeWeak((id *)&v5->_delegate, v6);

    v5->_focusability = [v4 focusability];
    uint64_t v7 = [v4 debugName];
    debugName = v5->_debugName;
    v5->_debugName = (NSString *)v7;
  }
  return v5;
}

- (PXGFocusableViewConfiguration)init
{
  return [(PXGFocusableViewConfiguration *)self initWithConfiguration:0];
}

@end