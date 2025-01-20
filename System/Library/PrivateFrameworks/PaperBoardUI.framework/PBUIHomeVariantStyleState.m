@interface PBUIHomeVariantStyleState
+ (id)stateWithTintColorStyle:(id)a3 suggestedTintColor:(id)a4 isHomeScreenDimmed:(BOOL)a5 iconSize:(id)a6 iconStyle:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToState:(id)a3;
- (BOOL)isHomeScreenDimmed;
- (NSString)iconSize;
- (NSString)iconStyle;
- (PBUIHomeVariantStyleState)init;
- (PBUIHomeVariantStyleState)initWithTintColorStyle:(id)a3 suggestedTintColor:(id)a4 isHomeScreenDimmed:(BOOL)a5 iconSize:(id)a6 iconStyle:(id)a7;
- (PUIDiscreteGradientVariatedCustomStyle)tintColorStyle;
- (UIColor)suggestedTintColor;
- (id)description;
- (id)styleStateByUpdatingSuggestedTintColor:(id)a3;
@end

@implementation PBUIHomeVariantStyleState

+ (id)stateWithTintColorStyle:(id)a3 suggestedTintColor:(id)a4 isHomeScreenDimmed:(BOOL)a5 iconSize:(id)a6 iconStyle:(id)a7
{
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [[PBUIHomeVariantStyleState alloc] initWithTintColorStyle:v14 suggestedTintColor:v13 isHomeScreenDimmed:v8 iconSize:v12 iconStyle:v11];

  return v15;
}

- (PBUIHomeVariantStyleState)initWithTintColorStyle:(id)a3 suggestedTintColor:(id)a4 isHomeScreenDimmed:(BOOL)a5 iconSize:(id)a6 iconStyle:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PBUIHomeVariantStyleState;
  v16 = [(PBUIHomeVariantStyleState *)&v28 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    tintColorStyle = v16->_tintColorStyle;
    v16->_tintColorStyle = (PUIDiscreteGradientVariatedCustomStyle *)v17;

    uint64_t v19 = [v13 copy];
    suggestedTintColor = v16->_suggestedTintColor;
    v16->_suggestedTintColor = (UIColor *)v19;

    v16->_isHomeScreenDimmed = a5;
    uint64_t v21 = [v14 copy];
    v22 = (void *)v21;
    if (v21) {
      v23 = (__CFString *)v21;
    }
    else {
      v23 = @"SMALL";
    }
    objc_storeStrong((id *)&v16->_iconSize, v23);

    uint64_t v24 = [v15 copy];
    v25 = (void *)v24;
    if (v24) {
      v26 = (__CFString *)v24;
    }
    else {
      v26 = @"auto";
    }
    objc_storeStrong((id *)&v16->_iconStyle, v26);
  }
  return v16;
}

- (PBUIHomeVariantStyleState)init
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PBUIHomeVariantStyleState *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PBUIHomeVariantStyleState *)self isEqualToState:v5];

  return v6;
}

- (BOOL)isEqualToState:(id)a3
{
  v4 = (PBUIHomeVariantStyleState *)a3;
  v5 = (unsigned __int8 *)v4;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_8;
    }
    BOOL v6 = [(PBUIHomeVariantStyleState *)v4 tintColorStyle];
    int v7 = BSEqualObjects();

    if (!v7) {
      goto LABEL_8;
    }
    BOOL v8 = [v5 suggestedTintColor];
    int v9 = BSEqualObjects();

    if (!v9) {
      goto LABEL_8;
    }
    v10 = [v5 iconSize];
    int v11 = BSEqualObjects();

    if (!v11) {
      goto LABEL_8;
    }
    id v12 = [v5 iconStyle];
    int v13 = BSEqualObjects();

    if (v13) {
      BOOL v14 = v5[8] == self->_isHomeScreenDimmed;
    }
    else {
LABEL_8:
    }
      BOOL v14 = 0;
  }

  return v14;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(PBUIHomeVariantStyleState *)self tintColorStyle];
  id v5 = (id)[v3 appendObject:v4 withName:@"tintColorStyle"];

  BOOL v6 = [(PBUIHomeVariantStyleState *)self suggestedTintColor];
  id v7 = (id)[v3 appendObject:v6 withName:@"suggestedTintColor" skipIfNil:1];

  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[PBUIHomeVariantStyleState isHomeScreenDimmed](self, "isHomeScreenDimmed"), @"isHomeScreenDimmed");
  int v9 = [(PBUIHomeVariantStyleState *)self iconSize];
  id v10 = (id)[v3 appendObject:v9 withName:@"iconSize"];

  int v11 = [(PBUIHomeVariantStyleState *)self iconStyle];
  id v12 = (id)[v3 appendObject:v11 withName:@"iconStyle"];

  int v13 = [v3 build];

  return v13;
}

- (id)styleStateByUpdatingSuggestedTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [PBUIHomeVariantStyleState alloc];
  BOOL v6 = [(PBUIHomeVariantStyleState *)self tintColorStyle];
  BOOL v7 = [(PBUIHomeVariantStyleState *)self isHomeScreenDimmed];
  id v8 = [(PBUIHomeVariantStyleState *)self iconSize];
  int v9 = [(PBUIHomeVariantStyleState *)self iconStyle];
  id v10 = [(PBUIHomeVariantStyleState *)v5 initWithTintColorStyle:v6 suggestedTintColor:v4 isHomeScreenDimmed:v7 iconSize:v8 iconStyle:v9];

  return v10;
}

- (BOOL)isHomeScreenDimmed
{
  return self->_isHomeScreenDimmed;
}

- (PUIDiscreteGradientVariatedCustomStyle)tintColorStyle
{
  return self->_tintColorStyle;
}

- (UIColor)suggestedTintColor
{
  return self->_suggestedTintColor;
}

- (NSString)iconStyle
{
  return self->_iconStyle;
}

- (NSString)iconSize
{
  return self->_iconSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconSize, 0);
  objc_storeStrong((id *)&self->_iconStyle, 0);
  objc_storeStrong((id *)&self->_suggestedTintColor, 0);
  objc_storeStrong((id *)&self->_tintColorStyle, 0);
}

@end