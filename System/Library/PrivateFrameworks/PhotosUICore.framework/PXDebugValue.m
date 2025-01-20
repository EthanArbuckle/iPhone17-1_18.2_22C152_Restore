@interface PXDebugValue
- (NSString)label;
- (PXDebugValue)initWithLabel:(id)a3;
- (unint64_t)highlightStyle;
@end

@implementation PXDebugValue

- (void).cxx_destruct
{
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)highlightStyle
{
  return 0;
}

- (PXDebugValue)initWithLabel:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    PXAssertGetLog();
  }
  v9.receiver = self;
  v9.super_class = (Class)PXDebugValue;
  v5 = [(PXDebugValue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

@end