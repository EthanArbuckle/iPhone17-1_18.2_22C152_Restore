@interface SFUnifiedTabBarItemAccessoryButtonArrangement
- (BOOL)containsButtonType:(int64_t)a3;
- (BOOL)isEqualToArrangement:(id)a3;
- (NSArray)leadingButtonTypes;
- (NSArray)trailingButtonTypes;
- (SFUnifiedTabBarItemAccessoryButtonArrangement)init;
- (SFUnifiedTabBarItemAccessoryButtonArrangement)initWithLeadingButtonTypes:(id)a3 trailingButtonTypes:(id)a4;
- (id)initUsingButtonLayout:(int64_t)a3 filteringButtonsUsingBlock:(id)a4;
@end

@implementation SFUnifiedTabBarItemAccessoryButtonArrangement

- (SFUnifiedTabBarItemAccessoryButtonArrangement)initWithLeadingButtonTypes:(id)a3 trailingButtonTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFUnifiedTabBarItemAccessoryButtonArrangement;
  v8 = [(SFUnifiedTabBarItemAccessoryButtonArrangement *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    leadingButtonTypes = v8->_leadingButtonTypes;
    v8->_leadingButtonTypes = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    trailingButtonTypes = v8->_trailingButtonTypes;
    v8->_trailingButtonTypes = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (SFUnifiedTabBarItemAccessoryButtonArrangement)init
{
  return [(SFUnifiedTabBarItemAccessoryButtonArrangement *)self initWithLeadingButtonTypes:MEMORY[0x1E4F1CBF0] trailingButtonTypes:MEMORY[0x1E4F1CBF0]];
}

- (id)initUsingButtonLayout:(int64_t)a3 filteringButtonsUsingBlock:(id)a4
{
  id v6 = a4;
  id v7 = &unk_1EDA427A8;
  if (a3 == 1) {
    id v7 = &unk_1EDA427C0;
  }
  if (a3 == 2) {
    v8 = &unk_1EDA427D8;
  }
  else {
    v8 = v7;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98__SFUnifiedTabBarItemAccessoryButtonArrangement_initUsingButtonLayout_filteringButtonsUsingBlock___block_invoke;
  v23[3] = &unk_1E54EC560;
  id v9 = v6;
  id v24 = v9;
  v10 = objc_msgSend(v8, "safari_filterObjectsUsingBlock:", v23);
  if (a3 == 2)
  {
    v13 = &unk_1EDA42838;
  }
  else if (a3)
  {
    v13 = &unk_1EDA42820;
  }
  else
  {
    uint64_t v11 = +[SFFeatureManager sharedFeatureManager];
    int v12 = [v11 usesFormatMenuInUnifiedTabBar];

    if (v12) {
      v13 = &unk_1EDA427F0;
    }
    else {
      v13 = &unk_1EDA42808;
    }
  }
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __98__SFUnifiedTabBarItemAccessoryButtonArrangement_initUsingButtonLayout_filteringButtonsUsingBlock___block_invoke_2;
  v21 = &unk_1E54EC560;
  id v22 = v9;
  id v14 = v9;
  objc_super v15 = objc_msgSend(v13, "safari_filterObjectsUsingBlock:", &v18);
  v16 = -[SFUnifiedTabBarItemAccessoryButtonArrangement initWithLeadingButtonTypes:trailingButtonTypes:](self, "initWithLeadingButtonTypes:trailingButtonTypes:", v10, v15, v18, v19, v20, v21);

  return v16;
}

uint64_t __98__SFUnifiedTabBarItemAccessoryButtonArrangement_initUsingButtonLayout_filteringButtonsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

uint64_t __98__SFUnifiedTabBarItemAccessoryButtonArrangement_initUsingButtonLayout_filteringButtonsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (BOOL)isEqualToArrangement:(id)a3
{
  v4 = a3;
  if ([(NSArray *)self->_leadingButtonTypes isEqualToArray:v4[1]]) {
    BOOL v5 = [(NSArray *)self->_trailingButtonTypes isEqualToArray:v4[2]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)containsButtonType:(int64_t)a3
{
  v4 = [NSNumber numberWithInteger:a3];
  BOOL v5 = [(NSArray *)self->_leadingButtonTypes containsObject:v4]
    || [(NSArray *)self->_trailingButtonTypes containsObject:v4];

  return v5;
}

- (NSArray)leadingButtonTypes
{
  return self->_leadingButtonTypes;
}

- (NSArray)trailingButtonTypes
{
  return self->_trailingButtonTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButtonTypes, 0);

  objc_storeStrong((id *)&self->_leadingButtonTypes, 0);
}

@end