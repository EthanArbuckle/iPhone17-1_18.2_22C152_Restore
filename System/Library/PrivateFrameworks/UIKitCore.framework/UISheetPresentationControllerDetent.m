@interface UISheetPresentationControllerDetent
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (UISheetPresentationControllerDetent)customDetentWithIdentifier:(UISheetPresentationControllerDetentIdentifier)identifier resolver:(void *)resolver;
+ (UISheetPresentationControllerDetent)largeDetent;
+ (UISheetPresentationControllerDetent)mediumDetent;
+ (id)_detentWithContainerViewBlock:(id)a3;
+ (id)_detentWithIdentifier:(id)a3 constant:(double)a4;
+ (id)_detentWithIdentifier:(id)a3 containerViewBlock:(id)a4;
+ (id)_detentWithResolutionContextBlock:(id)a3;
+ (id)_fullDetent;
- (BOOL)_createdWithDeprecatedInitializer;
- (BOOL)isEqual:(id)a3;
- (CGFloat)resolvedValueInContext:(id)context;
- (NSString)description;
- (UISheetPresentationControllerDetent)initWithBSXPCCoder:(id)a3;
- (UISheetPresentationControllerDetent)initWithCoder:(id)a3;
- (UISheetPresentationControllerDetent)initWithType:(int64_t)a3 identifier:(id)a4 internalBlock:(id)a5 constant:(double)a6;
- (UISheetPresentationControllerDetentIdentifier)identifier;
- (double)_constant;
- (id)_internalBlock;
- (int64_t)_type;
- (void)_setIdentifier:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UISheetPresentationControllerDetent

+ (UISheetPresentationControllerDetent)largeDetent
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:1 identifier:@"com.apple.UIKit.large" internalBlock:&__block_literal_global_17_5 constant:0.0];
  return (UISheetPresentationControllerDetent *)v2;
}

- (UISheetPresentationControllerDetent)initWithType:(int64_t)a3 identifier:(id)a4 internalBlock:(id)a5 constant:(double)a6
{
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UISheetPresentationControllerDetent;
  v12 = [(UISheetPresentationControllerDetent *)&v23 init];
  v13 = v12;
  if (v12)
  {
    v12->__type = a3;
    if (v10)
    {
      uint64_t v14 = [v10 copy];
      identifier = v13->_identifier;
      v13->_identifier = (NSString *)v14;
    }
    else
    {
      v16 = NSString;
      identifier = [MEMORY[0x1E4F29128] UUID];
      v17 = [identifier UUIDString];
      uint64_t v18 = [v16 stringWithFormat:@"com.apple.UIKit.dynamic.%@", v17];
      v19 = v13->_identifier;
      v13->_identifier = (NSString *)v18;
    }
    v20 = _Block_copy(v11);
    id internalBlock = v13->__internalBlock;
    v13->__id internalBlock = v20;

    v13->__constant = a6;
  }

  return v13;
}

- (int64_t)_type
{
  return self->__type;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__internalBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (CGFloat)resolvedValueInContext:(id)context
{
  id v4 = context;
  v5 = [(UISheetPresentationControllerDetent *)self _internalBlock];
  double v6 = ((double (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)_internalBlock
{
  return self->__internalBlock;
}

- (UISheetPresentationControllerDetentIdentifier)identifier
{
  return self->_identifier;
}

uint64_t __75__UISheetPresentationControllerDetent_customDetentWithIdentifier_resolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_detentWithIdentifier:(id)a3 constant:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = _UISheetDetentInternalBlockForType(4, a4);
  v9 = (void *)[v7 initWithType:4 identifier:v6 internalBlock:v8 constant:a4];

  return v9;
}

+ (UISheetPresentationControllerDetent)customDetentWithIdentifier:(UISheetPresentationControllerDetentIdentifier)identifier resolver:(void *)resolver
{
  id v6 = resolver;
  id v7 = identifier;
  id v8 = objc_alloc((Class)a1);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__UISheetPresentationControllerDetent_customDetentWithIdentifier_resolver___block_invoke;
  v12[3] = &unk_1E530A220;
  id v13 = v6;
  id v9 = v6;
  id v10 = (void *)[v8 initWithType:0 identifier:v7 internalBlock:v12 constant:0.0];

  return (UISheetPresentationControllerDetent *)v10;
}

- (BOOL)_createdWithDeprecatedInitializer
{
  return self->__createdWithDeprecatedInitializer;
}

+ (UISheetPresentationControllerDetent)mediumDetent
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:2 identifier:@"com.apple.UIKit.medium" internalBlock:&__block_literal_global_19_2 constant:0.0];
  return (UISheetPresentationControllerDetent *)v2;
}

+ (id)_fullDetent
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:3 identifier:@"com.apple.UIKit.full" internalBlock:&__block_literal_global_22_3 constant:0.0];
  return v2;
}

+ (id)_detentWithResolutionContextBlock:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  id v8 = [a1 _detentWithIdentifier:v7 resolutionContextBlock:v5];

  v8[8] = 1;
  return v8;
}

+ (id)_detentWithIdentifier:(id)a3 containerViewBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__UISheetPresentationControllerDetent__detentWithIdentifier_containerViewBlock___block_invoke;
  v12[3] = &unk_1E530A220;
  id v13 = v6;
  id v9 = v6;
  id v10 = (void *)[v8 initWithType:0 identifier:v7 internalBlock:v12 constant:0.0];

  return v10;
}

double __80__UISheetPresentationControllerDetent__detentWithIdentifier_containerViewBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [a2 _containerView];
  double v4 = (*(double (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

+ (id)_detentWithContainerViewBlock:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  id v8 = [a1 _detentWithIdentifier:v7 containerViewBlock:v5];

  v8[8] = 1;
  return v8;
}

- (NSString)description
{
  v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  unint64_t v4 = [(UISheetPresentationControllerDetent *)self _type] - 1;
  if (v4 > 3) {
    id v5 = @"custom";
  }
  else {
    id v5 = off_1E530A268[v4];
  }
  id v6 = (id)[v3 appendName:@"_type" object:v5];
  id v7 = NSStringFromSelector(sel__identifier);
  id v8 = (id)[v3 appendKey:v7];

  if ([(UISheetPresentationControllerDetent *)self _type] == 4)
  {
    id v9 = NSStringFromSelector(sel__constant);
    id v10 = (id)[v3 appendKey:v9];
  }
  id v11 = [v3 string];

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(UISheetPresentationControllerDetent *)self _type];
    if (v6 == [v5 _type])
    {
      id v7 = [(UISheetPresentationControllerDetent *)self identifier];
      id v8 = [v5 identifier];
      id v9 = v7;
      id v10 = v8;
      if (v9 == v10)
      {

        goto LABEL_10;
      }
      id v11 = v10;
      if (v9 && v10)
      {
        char v12 = [v9 isEqual:v10];

        if ((v12 & 1) == 0) {
          goto LABEL_13;
        }
LABEL_10:
        if ([(UISheetPresentationControllerDetent *)self _type] == 4)
        {
          [(UISheetPresentationControllerDetent *)self _constant];
          double v15 = v14;
          [v5 _constant];
          BOOL v13 = v15 == v16;
        }
        else
        {
          uint64_t v18 = [(UISheetPresentationControllerDetent *)self _internalBlock];
          v19 = [v5 _internalBlock];
          BOOL v13 = v18 == v19;
        }
        goto LABEL_14;
      }
    }
LABEL_13:
    BOOL v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (void)_setIdentifier:(id)a3
{
}

- (UISheetPresentationControllerDetent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"_type"];
  int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
  [v4 decodeDoubleForKey:@"_constant"];
  double v8 = v7;

  id v9 = _UISheetDetentInternalBlockForType(v5, v8);
  if (v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)UISheetPresentationControllerDetent;
    id v10 = [(UISheetPresentationControllerDetent *)&v16 init];
    id v11 = v10;
    if (v10)
    {
      v10->__type = v5;
      objc_storeStrong((id *)&v10->_identifier, v6);
      char v12 = _Block_copy(v9);
      id internalBlock = v11->__internalBlock;
      v11->__id internalBlock = v12;

      v11->__constant = v8;
    }
    self = v11;
    double v14 = self;
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (UISheetPresentationControllerDetent)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"_type"];
  int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
  [v4 decodeDoubleForKey:@"_constant"];
  double v8 = v7;

  id v9 = _UISheetDetentInternalBlockForType(v5, v8);
  if (v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)UISheetPresentationControllerDetent;
    id v10 = [(UISheetPresentationControllerDetent *)&v16 init];
    id v11 = v10;
    if (v10)
    {
      v10->__type = v5;
      objc_storeStrong((id *)&v10->_identifier, v6);
      char v12 = _Block_copy(v9);
      id internalBlock = v11->__internalBlock;
      v11->__id internalBlock = v12;

      v11->__constant = v8;
    }
    self = v11;
    double v14 = self;
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  int64_t v5 = [(UISheetPresentationControllerDetent *)self _type];
  if (!v5)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UISheetPresentationController.m", 3594, @"Custom detent %@ is not encodable. Custom detents are not supported for remote view controllers yet. rdar://65243005 (Custom sheet detents for remote view controllers)", self object file lineNumber description];
  }
  [v8 encodeInteger:v5 forKey:@"_type"];
  int64_t v6 = [(UISheetPresentationControllerDetent *)self identifier];
  [v8 encodeObject:v6 forKey:@"_identifier"];

  [(UISheetPresentationControllerDetent *)self _constant];
  objc_msgSend(v8, "encodeDouble:forKey:", @"_constant");
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v8 = a3;
  int64_t v5 = [(UISheetPresentationControllerDetent *)self _type];
  if (!v5)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UISheetPresentationController.m", 3603, @"Custom detent %@ is not encodable. Custom detents are not supported for remote view controllers yet. rdar://65243005 (Custom sheet detents for remote view controllers)", self object file lineNumber description];
  }
  [v8 encodeInt64:v5 forKey:@"_type"];
  int64_t v6 = [(UISheetPresentationControllerDetent *)self identifier];
  [v8 encodeObject:v6 forKey:@"_identifier"];

  [(UISheetPresentationControllerDetent *)self _constant];
  objc_msgSend(v8, "encodeDouble:forKey:", @"_constant");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (double)_constant
{
  return self->__constant;
}

@end