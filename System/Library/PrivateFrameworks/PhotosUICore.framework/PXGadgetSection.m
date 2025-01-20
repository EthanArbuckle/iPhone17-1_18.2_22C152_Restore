@interface PXGadgetSection
- (NSArray)gadgets;
- (NSString)identifier;
- (PXGadgetSection)init;
- (PXGadgetSection)initWithIdentifier:(id)a3 gadgets:(id)a4;
- (PXGadgetSpec)gadgetSpec;
- (id)description;
- (void)setGadgetSpec:(id)a3;
@end

@implementation PXGadgetSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_storeStrong((id *)&self->_gadgets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (NSArray)gadgets
{
  return self->_gadgets;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p, identifier:%@, gadgets:%lu>", objc_opt_class(), self, self->_identifier, -[NSArray count](self->_gadgets, "count")];
}

- (void)setGadgetSpec:(id)a3
{
  v9 = (PXGadgetSpec *)a3;
  v4 = self->_gadgetSpec;
  gadgetSpec = v9;
  if (v4 != v9)
  {
    v6 = v4;
    BOOL v7 = [(PXGadgetSpec *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    v8 = v9;
    gadgetSpec = self->_gadgetSpec;
    self->_gadgetSpec = v8;
  }

LABEL_5:
}

- (PXGadgetSection)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGadgetSection.m", 30, @"%s is not available as initializer", "-[PXGadgetSection init]");

  abort();
}

- (PXGadgetSection)initWithIdentifier:(id)a3 gadgets:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXGadgetSection.m", 18, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PXGadgetSection.m", 19, @"Invalid parameter not satisfying: %@", @"gadgets" object file lineNumber description];

LABEL_3:
  if (![v10 count])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXGadgetSection.m", 20, @"Invalid parameter not satisfying: %@", @"gadgets.count > 0" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PXGadgetSection;
  v11 = [(PXGadgetSection *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_gadgets, a4);
  }

  return v12;
}

@end