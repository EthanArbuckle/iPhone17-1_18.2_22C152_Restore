@interface RTIAssistantItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsBarButtonItemsInline;
- (BOOL)showsInputDashboardViewController;
- (BOOL)visibleWhenMinimized;
- (NSArray)leadingBarButtonGroups;
- (NSArray)trailingBarButtonGroups;
- (RTIAssistantItem)initWithCoder:(id)a3;
- (UIColor)detachedBackgroundColor;
- (UIColor)detachedTintColor;
- (float)centerViewPreferredWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCenterViewPreferredWidth:(float)a3;
- (void)setDetachedBackgroundColor:(id)a3;
- (void)setDetachedTintColor:(id)a3;
- (void)setLeadingBarButtonGroups:(id)a3;
- (void)setShowsBarButtonItemsInline:(BOOL)a3;
- (void)setShowsInputDashboardViewController:(BOOL)a3;
- (void)setTrailingBarButtonGroups:(id)a3;
- (void)setVisibleWhenMinimized:(BOOL)a3;
@end

@implementation RTIAssistantItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (([v9 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  if (self->_showsBarButtonItemsInline) {
    [v9 encodeBool:1 forKey:@"sBtnInline"];
  }
  v4 = v9;
  if (self->_showsInputDashboardViewController)
  {
    [v9 encodeBool:1 forKey:@"sIDVC"];
    v4 = v9;
  }
  if (self->_centerViewPreferredWidth != 0.0)
  {
    objc_msgSend(v9, "encodeFloat:forKey:", @"cVPW");
    v4 = v9;
  }
  detachedTintColor = self->_detachedTintColor;
  if (detachedTintColor)
  {
    [v9 encodeObject:detachedTintColor forKey:@"dTintCol"];
    v4 = v9;
  }
  detachedBackgroundColor = self->_detachedBackgroundColor;
  if (detachedBackgroundColor)
  {
    [v9 encodeObject:detachedBackgroundColor forKey:@"dBgCol"];
    v4 = v9;
  }
  leadingBarButtonGroups = self->_leadingBarButtonGroups;
  if (leadingBarButtonGroups)
  {
    [v9 encodeObject:leadingBarButtonGroups forKey:@"lGroups"];
    v4 = v9;
  }
  trailingBarButtonGroups = self->_trailingBarButtonGroups;
  if (trailingBarButtonGroups)
  {
    [v9 encodeObject:trailingBarButtonGroups forKey:@"tGroups"];
    v4 = v9;
  }
  if (self->_visibleWhenMinimized)
  {
    [v9 encodeBool:1 forKey:@"rvizwm"];
    v4 = v9;
  }
}

- (RTIAssistantItem)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v24.receiver = self;
  v24.super_class = (Class)RTIAssistantItem;
  v5 = [(RTIAssistantItem *)&v24 init];
  if (v5)
  {
    v5->_showsBarButtonItemsInline = [v4 decodeBoolForKey:@"sBtnInline"];
    v5->_showsInputDashboardViewController = [v4 decodeBoolForKey:@"sIDVC"];
    [v4 decodeFloatForKey:@"cVPW"];
    v5->_centerViewPreferredWidth = v6;
    v5->_visibleWhenMinimized = [v4 decodeBoolForKey:@"rvizwm"];
    Class Class = objc_getClass("UIColor");
    if (Class)
    {
      Class v8 = Class;
      uint64_t v9 = [v4 decodeObjectOfClass:Class forKey:@"dTintCol"];
      detachedTintColor = v5->_detachedTintColor;
      v5->_detachedTintColor = (UIColor *)v9;

      uint64_t v11 = [v4 decodeObjectOfClass:v8 forKey:@"dBgCol"];
      detachedBackgroundColor = v5->_detachedBackgroundColor;
      v5->_detachedBackgroundColor = (UIColor *)v11;
    }
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"lGroups"];
    leadingBarButtonGroups = v5->_leadingBarButtonGroups;
    v5->_leadingBarButtonGroups = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"tGroups"];
    trailingBarButtonGroups = v5->_trailingBarButtonGroups;
    v5->_trailingBarButtonGroups = (NSArray *)v21;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[RTIAssistantItem allocWithZone:a3] init];
  v4->_showsBarButtonItemsInline = self->_showsBarButtonItemsInline;
  v4->_showsInputDashboardViewController = self->_showsInputDashboardViewController;
  v4->_centerViewPreferredWidth = self->_centerViewPreferredWidth;
  objc_storeStrong((id *)&v4->_detachedTintColor, self->_detachedTintColor);
  objc_storeStrong((id *)&v4->_detachedBackgroundColor, self->_detachedBackgroundColor);
  uint64_t v5 = [(NSArray *)self->_leadingBarButtonGroups copy];
  leadingBarButtonGroups = v4->_leadingBarButtonGroups;
  v4->_leadingBarButtonGroups = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_trailingBarButtonGroups copy];
  trailingBarButtonGroups = v4->_trailingBarButtonGroups;
  v4->_trailingBarButtonGroups = (NSArray *)v7;

  v4->_visibleWhenMinimized = self->_visibleWhenMinimized;
  return v4;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; visibleWhenMinimized = %d",
    [(RTIAssistantItem *)self visibleWhenMinimized]);
  objc_msgSend(v3, "appendFormat:", @"; showsBarButtonItemsInline = %d",
    [(RTIAssistantItem *)self showsBarButtonItemsInline]);
  objc_msgSend(v3, "appendFormat:", @"; showsInputDashboardViewController = %d",
    [(RTIAssistantItem *)self showsInputDashboardViewController]);
  [(RTIAssistantItem *)self centerViewPreferredWidth];
  if (v4 != 0.0)
  {
    [(RTIAssistantItem *)self centerViewPreferredWidth];
    objc_msgSend(v3, "appendFormat:", @"; centerViewPreferredWidth = %f", v5);
  }
  float v6 = [(RTIAssistantItem *)self detachedTintColor];

  if (v6)
  {
    uint64_t v7 = [(RTIAssistantItem *)self detachedTintColor];
    [v3 appendFormat:@"; detachedTintColor = %@", v7];
  }
  Class v8 = [(RTIAssistantItem *)self detachedBackgroundColor];

  if (v8)
  {
    uint64_t v9 = [(RTIAssistantItem *)self detachedBackgroundColor];
    [v3 appendFormat:@"; detachedBackgroundColor = %@", v9];
  }
  v10 = [(RTIAssistantItem *)self leadingBarButtonGroups];

  if (v10)
  {
    uint64_t v11 = [(RTIAssistantItem *)self leadingBarButtonGroups];
    [v3 appendFormat:@"; leadingBarButtonGroups = %@", v11];
  }
  v12 = [(RTIAssistantItem *)self trailingBarButtonGroups];

  if (v12)
  {
    v13 = [(RTIAssistantItem *)self trailingBarButtonGroups];
    [v3 appendFormat:@"; trailingBarButtonGroups = %@", v13];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (RTIAssistantItem *)a3;
  if (v4 == self)
  {
    char v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v5 = v4;
      BOOL v6 = [(RTIAssistantItem *)self visibleWhenMinimized];
      if (v6 != [(RTIAssistantItem *)v5 visibleWhenMinimized]) {
        goto LABEL_19;
      }
      BOOL v7 = [(RTIAssistantItem *)self showsBarButtonItemsInline];
      if (v7 != [(RTIAssistantItem *)v5 showsBarButtonItemsInline]) {
        goto LABEL_19;
      }
      BOOL v8 = [(RTIAssistantItem *)self showsInputDashboardViewController];
      if (v8 != [(RTIAssistantItem *)v5 showsInputDashboardViewController]) {
        goto LABEL_19;
      }
      [(RTIAssistantItem *)self centerViewPreferredWidth];
      float v10 = v9;
      [(RTIAssistantItem *)v5 centerViewPreferredWidth];
      if (v10 != v11) {
        goto LABEL_19;
      }
      v12 = [(RTIAssistantItem *)self detachedTintColor];
      uint64_t v13 = [(RTIAssistantItem *)v5 detachedTintColor];
      if (v12 == (void *)v13)
      {
      }
      else
      {
        uint64_t v14 = (void *)v13;
        v15 = [(RTIAssistantItem *)self detachedTintColor];
        uint64_t v16 = [(RTIAssistantItem *)v5 detachedTintColor];
        int v17 = [v15 isEqual:v16];

        if (!v17) {
          goto LABEL_19;
        }
      }
      uint64_t v19 = [(RTIAssistantItem *)self detachedBackgroundColor];
      uint64_t v20 = [(RTIAssistantItem *)v5 detachedBackgroundColor];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        uint64_t v21 = (void *)v20;
        v22 = [(RTIAssistantItem *)self detachedBackgroundColor];
        v23 = [(RTIAssistantItem *)v5 detachedBackgroundColor];
        int v24 = [v22 isEqual:v23];

        if (!v24) {
          goto LABEL_19;
        }
      }
      v25 = [(RTIAssistantItem *)self leadingBarButtonGroups];
      uint64_t v26 = [(RTIAssistantItem *)v5 leadingBarButtonGroups];
      if (v25 == (void *)v26)
      {
      }
      else
      {
        v27 = (void *)v26;
        v28 = [(RTIAssistantItem *)self leadingBarButtonGroups];
        v29 = [(RTIAssistantItem *)v5 leadingBarButtonGroups];
        int v30 = [v28 isEqual:v29];

        if (!v30)
        {
LABEL_19:
          char v18 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      v32 = [(RTIAssistantItem *)self trailingBarButtonGroups];
      v33 = [(RTIAssistantItem *)v5 trailingBarButtonGroups];
      if (v32 == v33)
      {
        char v18 = 1;
      }
      else
      {
        v34 = [(RTIAssistantItem *)self trailingBarButtonGroups];
        v35 = [(RTIAssistantItem *)v5 trailingBarButtonGroups];
        char v18 = [v34 isEqual:v35];
      }
      goto LABEL_20;
    }
    char v18 = 0;
  }
LABEL_21:

  return v18;
}

- (BOOL)visibleWhenMinimized
{
  return self->_visibleWhenMinimized;
}

- (void)setVisibleWhenMinimized:(BOOL)a3
{
  self->_visibleWhenMinimized = a3;
}

- (BOOL)showsBarButtonItemsInline
{
  return self->_showsBarButtonItemsInline;
}

- (void)setShowsBarButtonItemsInline:(BOOL)a3
{
  self->_showsBarButtonItemsInline = a3;
}

- (BOOL)showsInputDashboardViewController
{
  return self->_showsInputDashboardViewController;
}

- (void)setShowsInputDashboardViewController:(BOOL)a3
{
  self->_showsInputDashboardViewController = a3;
}

- (float)centerViewPreferredWidth
{
  return self->_centerViewPreferredWidth;
}

- (void)setCenterViewPreferredWidth:(float)a3
{
  self->_centerViewPreferredWidth = a3;
}

- (UIColor)detachedTintColor
{
  return self->_detachedTintColor;
}

- (void)setDetachedTintColor:(id)a3
{
}

- (UIColor)detachedBackgroundColor
{
  return self->_detachedBackgroundColor;
}

- (void)setDetachedBackgroundColor:(id)a3
{
}

- (NSArray)leadingBarButtonGroups
{
  return self->_leadingBarButtonGroups;
}

- (void)setLeadingBarButtonGroups:(id)a3
{
}

- (NSArray)trailingBarButtonGroups
{
  return self->_trailingBarButtonGroups;
}

- (void)setTrailingBarButtonGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_detachedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_detachedTintColor, 0);
}

@end