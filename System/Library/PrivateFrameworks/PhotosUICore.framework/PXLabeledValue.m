@interface PXLabeledValue
+ (PXLabeledValue)separatorLabeledValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLabeledValue:(id)a3;
- (BOOL)isSeparator;
- (NSString)localizedBadgeLabel;
- (NSString)localizedLabel;
- (PXLabeledValue)init;
- (PXLabeledValue)initWithValue:(id)a3 localizedLabel:(id)a4;
- (PXLabeledValue)labeledValueWithLocalizedBadgeLabel:(id)a3;
- (PXLabeledValueType)value;
- (id)_initSeparator;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXLabeledValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedBadgeLabel, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (BOOL)isSeparator
{
  return self->_separator;
}

- (NSString)localizedBadgeLabel
{
  return self->_localizedBadgeLabel;
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (PXLabeledValueType)value
{
  return self->_value;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PXLabeledValueType *)self->_value hash];
  return [(NSString *)self->_localizedLabel hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXLabeledValue *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PXLabeledValue *)self isEqualToLabeledValue:v4];
  }

  return v5;
}

- (BOOL)isEqualToLabeledValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 value];
  value = self->_value;
  if (!((unint64_t)value | v5))
  {
    localizedLabel = self->_localizedLabel;
    v9 = [v4 localizedLabel];
    if (localizedLabel == v9)
    {
    }
    else
    {
      int v10 = [(NSString *)localizedLabel isEqual:v9];

      if (!v10)
      {
        char v7 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    localizedBadgeLabel = self->_localizedBadgeLabel;
    v12 = [v4 localizedBadgeLabel];
    if (localizedBadgeLabel == v12) {
      char v7 = 1;
    }
    else {
      char v7 = [(NSString *)localizedBadgeLabel isEqual:v12];
    }

    goto LABEL_13;
  }
  if (value == (PXLabeledValueType *)v5) {
    char v7 = 1;
  }
  else {
    char v7 = [(PXLabeledValueType *)value isEqual:v5];
  }
LABEL_14:

  return v7;
}

- (PXLabeledValue)labeledValueWithLocalizedBadgeLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [PXLabeledValue alloc];
  v6 = [(PXLabeledValue *)self value];
  char v7 = [(PXLabeledValue *)self localizedLabel];
  v8 = [(PXLabeledValue *)v5 initWithValue:v6 localizedLabel:v7];

  uint64_t v9 = [v4 copy];
  localizedBadgeLabel = v8->_localizedBadgeLabel;
  v8->_localizedBadgeLabel = (NSString *)v9;

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p, object:%@, title:\"%@\", badge:\"%@\">", objc_opt_class(), self, self->_value, self->_localizedLabel, self->_localizedBadgeLabel];
}

- (PXLabeledValue)initWithValue:(id)a3 localizedLabel:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXLabeledValue.m", 37, @"Invalid parameter not satisfying: %@", @"localizedLabel" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PXLabeledValue;
  int v10 = [(PXLabeledValue *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_value, a3);
    objc_storeStrong((id *)&v11->_localizedLabel, a4);
    v11->_separator = 0;
  }

  return v11;
}

- (id)_initSeparator
{
  v7.receiver = self;
  v7.super_class = (Class)PXLabeledValue;
  v2 = [(PXLabeledValue *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    value = v2->_value;
    v2->_value = 0;

    localizedLabel = v3->_localizedLabel;
    v3->_localizedLabel = (NSString *)@"-";

    v3->_separator = 1;
  }
  return v3;
}

- (PXLabeledValue)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXLabeledValue.m", 22, @"%s is not available as initializer", "-[PXLabeledValue init]");

  abort();
}

+ (PXLabeledValue)separatorLabeledValue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXLabeledValue_separatorLabeledValue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (separatorLabeledValue_predicate != -1) {
    dispatch_once(&separatorLabeledValue_predicate, block);
  }
  v2 = (void *)separatorLabeledValue__separatorLabeledValue;
  return (PXLabeledValue *)v2;
}

void __39__PXLabeledValue_separatorLabeledValue__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _initSeparator];
  v2 = (void *)separatorLabeledValue__separatorLabeledValue;
  separatorLabeledValue__separatorLabeledValue = v1;
}

@end