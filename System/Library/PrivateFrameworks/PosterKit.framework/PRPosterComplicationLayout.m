@interface PRPosterComplicationLayout
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)_complications:(id)a3 AreEqualTo:(id)a4;
- (BOOL)hasComplications;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToComplicationLayout:(id)a3;
- (NSArray)complications;
- (NSArray)sidebarComplications;
- (NSDictionary)complicationIconLayout;
- (NSDictionary)sidebarComplicationIconLayout;
- (PRPosterComplicationLayout)initWithBSXPCCoder:(id)a3;
- (PRPosterComplicationLayout)initWithCoder:(id)a3;
- (PRPosterComplicationLayout)initWithInlineComplication:(id)a3 complications:(id)a4;
- (PRPosterComplicationLayout)initWithInlineComplication:(id)a3 sidebarComplicationIconLayout:(id)a4 sidebarComplications:(id)a5 complicationIconLayout:(id)a6 complications:(id)a7;
- (PRPosterComplicationLayout)initWithInlineComplication:(id)a3 sidebarComplications:(id)a4 complications:(id)a5;
- (PRSWidget)inlineComplication;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterComplicationLayout

- (PRPosterComplicationLayout)initWithInlineComplication:(id)a3 complications:(id)a4
{
  return [(PRPosterComplicationLayout *)self initWithInlineComplication:a3 sidebarComplications:MEMORY[0x1E4F1CBF0] complications:a4];
}

- (PRPosterComplicationLayout)initWithInlineComplication:(id)a3 sidebarComplications:(id)a4 complications:(id)a5
{
  return [(PRPosterComplicationLayout *)self initWithInlineComplication:a3 sidebarComplicationIconLayout:0 sidebarComplications:a4 complicationIconLayout:0 complications:a5];
}

- (PRPosterComplicationLayout)initWithInlineComplication:(id)a3 sidebarComplicationIconLayout:(id)a4 sidebarComplications:(id)a5 complicationIconLayout:(id)a6 complications:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = v13;
  if (v18)
  {
    NSClassFromString(&cfstr_Prswidget.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSWidgetClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:].cold.5();
      }
LABEL_28:
      [v34 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C25BE9CLL);
    }
  }

  id v19 = v14;
  if (v19)
  {
    NSClassFromString(&cfstr_Nsdictionary.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:].cold.4();
      }
      [v35 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C25BF00);
    }
  }

  id v20 = v15;
  if (v20)
  {
    NSClassFromString(&cfstr_Nsarray.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:]();
      }
      [v36 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C25BF64);
    }
  }

  id v21 = v16;
  if (v21)
  {
    NSClassFromString(&cfstr_Nsdictionary.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:]();
      }
      [v37 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C25BFC8);
    }
  }

  id v22 = v17;
  if (v22)
  {
    NSClassFromString(&cfstr_Nsarray.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:]();
      }
      goto LABEL_28;
    }
  }

  v38.receiver = self;
  v38.super_class = (Class)PRPosterComplicationLayout;
  v23 = [(PRPosterComplicationLayout *)&v38 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_inlineComplication, a3);
    uint64_t v25 = [v19 copy];
    sidebarComplicationIconLayout = v24->_sidebarComplicationIconLayout;
    v24->_sidebarComplicationIconLayout = (NSDictionary *)v25;

    uint64_t v27 = [v20 copy];
    sidebarComplications = v24->_sidebarComplications;
    v24->_sidebarComplications = (NSArray *)v27;

    uint64_t v29 = [v21 copy];
    complicationIconLayout = v24->_complicationIconLayout;
    v24->_complicationIconLayout = (NSDictionary *)v29;

    uint64_t v31 = [v22 copy];
    complications = v24->_complications;
    v24->_complications = (NSArray *)v31;
  }
  return v24;
}

- (PRPosterComplicationLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = self;
  uint64_t v27 = [v3 decodeObjectOfClass:v4 forKey:@"inlineComplication"];

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v10 = [v3 decodeObjectOfClasses:v9 forKey:@"sidebarComplicationIconLayout"];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  id v14 = [v3 decodeObjectOfClasses:v13 forKey:@"sidebarComplications"];

  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  id v19 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
  id v20 = [v3 decodeObjectOfClasses:v19 forKey:@"complicationIconLayout"];

  id v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v24 = [v3 decodeObjectOfClasses:v23 forKey:@"complications"];

  uint64_t v25 = [(PRPosterComplicationLayout *)self initWithInlineComplication:v27 sidebarComplicationIconLayout:v10 sidebarComplications:v14 complicationIconLayout:v20 complications:v24];
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRPosterComplicationLayout *)self inlineComplication];
  [v4 encodeObject:v5 forKey:@"inlineComplication"];

  uint64_t v6 = [(PRPosterComplicationLayout *)self sidebarComplicationIconLayout];
  [v4 encodeObject:v6 forKey:@"sidebarComplicationIconLayout"];

  uint64_t v7 = [(PRPosterComplicationLayout *)self sidebarComplications];
  [v4 encodeObject:v7 forKey:@"sidebarComplications"];

  uint64_t v8 = [(PRPosterComplicationLayout *)self complicationIconLayout];
  [v4 encodeObject:v8 forKey:@"complicationIconLayout"];

  id v9 = [(PRPosterComplicationLayout *)self complications];
  [v4 encodeObject:v9 forKey:@"complications"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [PRPosterMutableComplicationLayout alloc];
  v5 = [(PRPosterComplicationLayout *)self inlineComplication];
  uint64_t v6 = [(PRPosterComplicationLayout *)self sidebarComplicationIconLayout];
  uint64_t v7 = [(PRPosterComplicationLayout *)self sidebarComplications];
  uint64_t v8 = [(PRPosterComplicationLayout *)self complicationIconLayout];
  id v9 = [(PRPosterComplicationLayout *)self complications];
  v10 = [(PRPosterComplicationLayout *)v4 initWithInlineComplication:v5 sidebarComplicationIconLayout:v6 sidebarComplications:v7 complicationIconLayout:v8 complications:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterComplicationLayout *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PRPosterComplicationLayout *)self isEqualToComplicationLayout:v4];
  }

  return v5;
}

- (BOOL)isEqualToComplicationLayout:(id)a3
{
  id v4 = (PRPosterComplicationLayout *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v16 = 1;
  }
  else if (v4)
  {
    uint64_t v6 = [(PRPosterComplicationLayout *)self inlineComplication];
    uint64_t v7 = [(PRPosterComplicationLayout *)v5 inlineComplication];
    if (BSEqualObjects())
    {
      uint64_t v8 = [(PRPosterComplicationLayout *)self sidebarComplications];
      id v9 = [(PRPosterComplicationLayout *)v5 sidebarComplications];
      if ([(PRPosterComplicationLayout *)self _complications:v8 AreEqualTo:v9])
      {
        v10 = [(PRPosterComplicationLayout *)self sidebarComplicationIconLayout];
        v11 = [(PRPosterComplicationLayout *)v5 sidebarComplicationIconLayout];
        if (BSEqualObjects())
        {
          uint64_t v12 = [(PRPosterComplicationLayout *)self complicationIconLayout];
          id v13 = [(PRPosterComplicationLayout *)v5 complicationIconLayout];
          if (BSEqualObjects())
          {
            [(PRPosterComplicationLayout *)self complications];
            id v14 = v18 = v13;
            [(PRPosterComplicationLayout *)v5 complications];
            id v15 = v19 = v12;
            BOOL v16 = [(PRPosterComplicationLayout *)self _complications:v14 AreEqualTo:v15];

            uint64_t v12 = v19;
            id v13 = v18;
          }
          else
          {
            BOOL v16 = 0;
          }
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_complications:(id)a3 AreEqualTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 != [v6 count])
  {
LABEL_8:
    BOOL v18 = 0;
    goto LABEL_9;
  }
  if ([v5 count])
  {
    uint64_t v8 = 0;
    do
    {
      id v9 = [v5 objectAtIndexedSubscript:v8];
      v10 = [v9 uniqueIdentifier];
      v11 = [v6 objectAtIndexedSubscript:v8];
      uint64_t v12 = [v11 uniqueIdentifier];
      int v13 = [v10 isEqualToString:v12];

      if (!v13) {
        goto LABEL_8;
      }
      id v14 = [v5 objectAtIndexedSubscript:v8];
      id v15 = [v14 intent];
      BOOL v16 = [v6 objectAtIndexedSubscript:v8];
      uint64_t v17 = [v16 intent];

      if (v15 != v17) {
        goto LABEL_8;
      }
    }
    while ([v5 count] > (unint64_t)++v8);
  }
  BOOL v18 = 1;
LABEL_9:

  return v18;
}

- (unint64_t)hash
{
  id v3 = [(PRPosterComplicationLayout *)self inlineComplication];
  id v4 = [(PRPosterComplicationLayout *)self sidebarComplicationIconLayout];
  id v5 = [(PRPosterComplicationLayout *)self sidebarComplications];
  id v6 = [(PRPosterComplicationLayout *)self complicationIconLayout];
  uint64_t v7 = [(PRPosterComplicationLayout *)self complications];
  uint64_t v8 = [MEMORY[0x1E4F4F758] builder];
  id v9 = (id)[v8 appendObject:v3];
  id v10 = (id)[v8 appendObject:v4];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __34__PRPosterComplicationLayout_hash__block_invoke;
  v21[3] = &unk_1E54DC3C0;
  id v11 = v8;
  id v22 = v11;
  [v5 enumerateObjectsUsingBlock:v21];
  id v12 = (id)[v11 appendObject:v6];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  BOOL v18 = __34__PRPosterComplicationLayout_hash__block_invoke_2;
  id v19 = &unk_1E54DC3C0;
  id v20 = v11;
  id v13 = v11;
  [v7 enumerateObjectsUsingBlock:&v16];
  unint64_t v14 = objc_msgSend(v13, "hash", v16, v17, v18, v19);

  return v14;
}

id __34__PRPosterComplicationLayout_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2];
}

id __34__PRPosterComplicationLayout_hash__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2];
}

- (BOOL)hasComplications
{
  id v3 = [(PRPosterComplicationLayout *)self inlineComplication];

  if (v3) {
    return 1;
  }
  id v4 = [(PRPosterComplicationLayout *)self sidebarComplications];
  uint64_t v5 = [v4 count];

  if (v5) {
    return 1;
  }
  uint64_t v8 = [(PRPosterComplicationLayout *)self complications];
  BOOL v6 = [v8 count] != 0;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterComplicationLayout)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  BOOL v6 = [v4 decodeObjectOfClass:v5 forKey:@"inlineComplication"];

  uint64_t v7 = [v4 decodeDictionaryOfClass:objc_opt_class() forKey:@"sidebarComplicationIconLayout"];
  uint64_t v8 = self;
  id v9 = self;
  id v10 = [v4 decodeCollectionOfClass:v8 containingClass:v9 forKey:@"sidebarComplications"];

  id v11 = [v4 decodeDictionaryOfClass:objc_opt_class() forKey:@"complicationIconLayout"];
  id v12 = self;
  id v13 = self;
  unint64_t v14 = [v4 decodeCollectionOfClass:v12 containingClass:v13 forKey:@"complications"];

  id v15 = [(PRPosterComplicationLayout *)self initWithInlineComplication:v6 sidebarComplicationIconLayout:v7 sidebarComplications:v10 complicationIconLayout:v11 complications:v14];
  return v15;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PRPosterComplicationLayout *)self inlineComplication];
  [v4 encodeObject:v5 forKey:@"inlineComplication"];

  BOOL v6 = [(PRPosterComplicationLayout *)self sidebarComplicationIconLayout];
  [v4 encodeDictionary:v6 forKey:@"sidebarComplicationIconLayout"];

  uint64_t v7 = [(PRPosterComplicationLayout *)self sidebarComplications];
  [v4 encodeCollection:v7 forKey:@"sidebarComplications"];

  uint64_t v8 = [(PRPosterComplicationLayout *)self complicationIconLayout];
  [v4 encodeDictionary:v8 forKey:@"complicationIconLayout"];

  id v9 = [(PRPosterComplicationLayout *)self complications];
  [v4 encodeCollection:v9 forKey:@"complications"];
}

- (PRSWidget)inlineComplication
{
  return self->_inlineComplication;
}

- (NSArray)sidebarComplications
{
  return self->_sidebarComplications;
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSDictionary)sidebarComplicationIconLayout
{
  return self->_sidebarComplicationIconLayout;
}

- (NSDictionary)complicationIconLayout
{
  return self->_complicationIconLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationIconLayout, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationIconLayout, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_sidebarComplications, 0);
  objc_storeStrong((id *)&self->_inlineComplication, 0);
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end