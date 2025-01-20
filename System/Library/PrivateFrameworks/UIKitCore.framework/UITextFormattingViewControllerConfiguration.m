@interface UITextFormattingViewControllerConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)_forTextAnimationsUIWithSupportedAnimationNames:(id)a3 titles:(id)a4 accessibilityHints:(id)a5;
- (BOOL)_allowContentToScroll;
- (BOOL)_hasParentViewController;
- (BOOL)_hasPopoverPresentation;
- (BOOL)_includeDefaultFont;
- (BOOL)_isTextAnimationsConfiguration;
- (BOOL)_isTextViewConfiguration;
- (BOOL)_isUsingReducedMetrics;
- (BOOL)_preferringDimmingVisible;
- (BOOL)_textAnimationsConfiguration;
- (BOOL)_textViewConfiguration;
- (BOOL)_useLandscapeLayout;
- (BOOL)_useReducedMetrics;
- (BOOL)isEqual:(id)a3;
- (NSArray)_emphasisStyles;
- (NSArray)formattingStyles;
- (NSArray)groups;
- (UIFontPickerViewControllerConfiguration)fontPickerConfiguration;
- (UITextFormattingViewControllerConfiguration)init;
- (UITextFormattingViewControllerConfiguration)initWithCoder:(id)a3;
- (UITextFormattingViewControllerConfiguration)initWithGroups:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setHasParentViewController:(BOOL)a3;
- (void)_setHasPopoverPresentation:(BOOL)a3;
- (void)_setUseLandscapeLayout:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFontPickerConfiguration:(id)a3;
- (void)setFormattingStyles:(id)a3;
- (void)set_allowContentToScroll:(BOOL)a3;
- (void)set_emphasisStyles:(id)a3;
- (void)set_includeDefaultFont:(BOOL)a3;
- (void)set_preferringDimmingVisible:(BOOL)a3;
- (void)set_textAnimationsConfiguration:(BOOL)a3;
- (void)set_textViewConfiguration:(BOOL)a3;
- (void)set_useReducedMetrics:(BOOL)a3;
@end

@implementation UITextFormattingViewControllerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(UITextFormattingViewControllerConfiguration *)self fontPickerConfiguration];
  [(id)v4 setFontPickerConfiguration:v5];

  objc_msgSend((id)v4, "set_preferringDimmingVisible:", -[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](self, "_preferringDimmingVisible"));
  objc_msgSend((id)v4, "set_allowContentToScroll:", -[UITextFormattingViewControllerConfiguration _allowContentToScroll](self, "_allowContentToScroll"));
  objc_msgSend((id)v4, "set_includeDefaultFont:", -[UITextFormattingViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"));
  objc_msgSend((id)v4, "_setHasPopoverPresentation:", -[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](self, "_hasPopoverPresentation"));
  objc_msgSend((id)v4, "_setUseLandscapeLayout:", -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"));
  objc_msgSend((id)v4, "_setHasParentViewController:", -[UITextFormattingViewControllerConfiguration _hasParentViewController](self, "_hasParentViewController"));
  v6 = [(UITextFormattingViewControllerConfiguration *)self formattingStyles];
  uint64_t v7 = [v6 copy];
  v8 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v7;

  v9 = [(UITextFormattingViewControllerConfiguration *)self _emphasisStyles];
  uint64_t v10 = [v9 copy];
  v11 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v10;

  v12 = [(UITextFormattingViewControllerConfiguration *)self groups];
  uint64_t v13 = [v12 copy];
  v14 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v13;

  *(unsigned char *)(v4 + 8) = [(UITextFormattingViewControllerConfiguration *)self _textAnimationsConfiguration];
  *(unsigned char *)(v4 + 9) = [(UITextFormattingViewControllerConfiguration *)self _textViewConfiguration];
  *(unsigned char *)(v4 + 10) = [(UITextFormattingViewControllerConfiguration *)self _useReducedMetrics];
  return (id)v4;
}

- (UITextFormattingViewControllerConfiguration)init
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)UITextFormattingViewControllerConfiguration;
  v2 = [(UITextFormattingViewControllerConfiguration *)&v21 init];
  v3 = v2;
  if (v2)
  {
    [(UITextFormattingViewControllerConfiguration *)v2 set_preferringDimmingVisible:1];
    [(UITextFormattingViewControllerConfiguration *)v3 set_allowContentToScroll:1];
    [(UITextFormattingViewControllerConfiguration *)v3 set_includeDefaultFont:0];
    uint64_t v4 = [UITextFormattingViewControllerComponentGroup alloc];
    v20 = [[UITextFormattingViewControllerComponent alloc] initWithComponentKey:@"UITextFormattingViewControllerFormattingStylesComponent" preferredSize:5];
    v23 = v20;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v18 = [(UITextFormattingViewControllerComponentGroup *)v4 initWithComponents:v19];
    v24[0] = v18;
    v5 = [UITextFormattingViewControllerComponentGroup alloc];
    v17 = [[UITextFormattingViewControllerComponent alloc] initWithComponentKey:@"UITextFormattingViewControllerFontAttributesComponent" preferredSize:5];
    v22[0] = v17;
    v6 = [[UITextFormattingViewControllerComponent alloc] initWithComponentKey:@"UITextFormattingViewControllerTextColorComponent" preferredSize:1];
    v22[1] = v6;
    uint64_t v7 = [[UITextFormattingViewControllerComponent alloc] initWithComponentKey:@"UITextFormattingViewControllerFontPickerComponent" preferredSize:3];
    v22[2] = v7;
    v8 = [[UITextFormattingViewControllerComponent alloc] initWithComponentKey:@"UITextFormattingViewControllerFontSizeComponent" preferredSize:2];
    v22[3] = v8;
    v9 = [[UITextFormattingViewControllerComponent alloc] initWithComponentKey:@"UITextFormattingViewControllerHighlightComponent" preferredSize:1];
    v22[4] = v9;
    uint64_t v10 = [[UITextFormattingViewControllerComponent alloc] initWithComponentKey:@"UITextFormattingViewControllerTextAlignmentComponent" preferredSize:3];
    v22[5] = v10;
    v11 = [[UITextFormattingViewControllerComponent alloc] initWithComponentKey:@"UITextFormattingViewControllerListStylesComponent" preferredSize:3];
    v22[6] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:7];
    uint64_t v13 = [(UITextFormattingViewControllerComponentGroup *)v5 initWithComponents:v12];
    v24[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    groups = v3->_groups;
    v3->_groups = (NSArray *)v14;
  }
  return v3;
}

- (void)set_preferringDimmingVisible:(BOOL)a3
{
  self->__preferringDimmingVisible = a3;
}

- (void)set_includeDefaultFont:(BOOL)a3
{
  self->__includeDefaultFont = a3;
}

- (void)set_allowContentToScroll:(BOOL)a3
{
  self->__allowContentToScroll = a3;
}

- (void)setFontPickerConfiguration:(id)a3
{
}

- (NSArray)groups
{
  return self->_groups;
}

- (NSArray)formattingStyles
{
  return self->_formattingStyles;
}

- (UIFontPickerViewControllerConfiguration)fontPickerConfiguration
{
  return self->_fontPickerConfiguration;
}

- (BOOL)_useReducedMetrics
{
  return self->__useReducedMetrics;
}

- (BOOL)_useLandscapeLayout
{
  return self->__useLandscapeLayout;
}

- (BOOL)_textViewConfiguration
{
  return self->__textViewConfiguration;
}

- (BOOL)_textAnimationsConfiguration
{
  return self->__textAnimationsConfiguration;
}

- (void)_setUseLandscapeLayout:(BOOL)a3
{
  self->__useLandscapeLayout = a3;
}

- (void)_setHasPopoverPresentation:(BOOL)a3
{
  self->__hasPopoverPresentation = a3;
}

- (void)_setHasParentViewController:(BOOL)a3
{
  self->__hasParentViewController = a3;
}

- (BOOL)_preferringDimmingVisible
{
  return self->__preferringDimmingVisible;
}

- (BOOL)_includeDefaultFont
{
  return self->__includeDefaultFont;
}

- (BOOL)_hasPopoverPresentation
{
  return self->__hasPopoverPresentation;
}

- (BOOL)_hasParentViewController
{
  return self->__hasParentViewController;
}

- (NSArray)_emphasisStyles
{
  return self->__emphasisStyles;
}

- (BOOL)_allowContentToScroll
{
  return self->__allowContentToScroll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__emphasisStyles, 0);
  objc_storeStrong((id *)&self->_fontPickerConfiguration, 0);
  objc_storeStrong((id *)&self->_formattingStyles, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

+ (id)_forTextAnimationsUIWithSupportedAnimationNames:(id)a3 titles:(id)a4 accessibilityHints:(id)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a3)
  {
    uint64_t v7 = sub_186A1EB3C();
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (a4) {
LABEL_3:
  }
    uint64_t v6 = sub_186A1E79C();
LABEL_4:
  if (a5) {
    a5 = (id)sub_186A1E79C();
  }
  id v8 = sub_1859A2964(v7, v6, (uint64_t)a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

- (UITextFormattingViewControllerConfiguration)initWithGroups:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(UITextFormattingViewControllerConfiguration *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    [(UITextFormattingViewControllerConfiguration *)v6 set_preferringDimmingVisible:1];
    [(UITextFormattingViewControllerConfiguration *)v7 set_allowContentToScroll:1];
    [(UITextFormattingViewControllerConfiguration *)v7 set_includeDefaultFont:0];
    objc_storeStrong((id *)&v7->_groups, a3);
  }

  return v7;
}

- (BOOL)_isTextAnimationsConfiguration
{
  return self->__textAnimationsConfiguration;
}

- (BOOL)_isTextViewConfiguration
{
  return self->__textViewConfiguration;
}

- (BOOL)_isUsingReducedMetrics
{
  return self->__useReducedMetrics;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UITextFormattingViewControllerConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(UITextFormattingViewControllerConfiguration *)self fontPickerConfiguration];
      uint64_t v7 = [(UITextFormattingViewControllerConfiguration *)v5 fontPickerConfiguration];
      if ([v6 isEqual:v7]
        && (v8 = -[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](self, "_preferringDimmingVisible"), v8 == -[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](v5, "_preferringDimmingVisible"))&& (v9 = -[UITextFormattingViewControllerConfiguration _allowContentToScroll](self, "_allowContentToScroll"), v9 == -[UITextFormattingViewControllerConfiguration _allowContentToScroll](v5, "_allowContentToScroll"))&& (BOOL v10 = -[UITextFormattingViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"), v10 == -[UITextFormattingViewControllerConfiguration _includeDefaultFont](v5, "_includeDefaultFont"))&& (v11 = -[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](self, "_hasPopoverPresentation"), v11 == -[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](v5, "_hasPopoverPresentation"))&& (v12 = -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"), v12 == -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](v5, "_useLandscapeLayout"))&& (v13 = -[UITextFormattingViewControllerConfiguration _hasParentViewController](self, "_hasParentViewController"), v13 == -[UITextFormattingViewControllerConfiguration _hasParentViewController](
                     v5,
                     "_hasParentViewController")))
      {
        v16 = [(UITextFormattingViewControllerConfiguration *)self formattingStyles];
        v17 = [(UITextFormattingViewControllerConfiguration *)v5 formattingStyles];
        if ([v16 isEqualToArray:v17])
        {
          v18 = [(UITextFormattingViewControllerConfiguration *)self _emphasisStyles];
          v19 = [(UITextFormattingViewControllerConfiguration *)v5 _emphasisStyles];
          if ([v18 isEqualToArray:v19])
          {
            uint64_t v20 = [(UITextFormattingViewControllerConfiguration *)self groups];
            uint64_t v21 = [(UITextFormattingViewControllerConfiguration *)v5 groups];
            v27 = (void *)v20;
            v22 = (void *)v20;
            v23 = (void *)v21;
            if ([v22 isEqualToArray:v21]
              && (BOOL v25 = [(UITextFormattingViewControllerConfiguration *)self _textAnimationsConfiguration], v25 == [(UITextFormattingViewControllerConfiguration *)v5 _textAnimationsConfiguration])&& (v26 = [(UITextFormattingViewControllerConfiguration *)self _textViewConfiguration], v26 == [(UITextFormattingViewControllerConfiguration *)v5 _textViewConfiguration]))
            {
              BOOL v24 = [(UITextFormattingViewControllerConfiguration *)self _useReducedMetrics];
              BOOL v14 = v24 ^ [(UITextFormattingViewControllerConfiguration *)v5 _useReducedMetrics] ^ 1;
            }
            else
            {
              LOBYTE(v14) = 0;
            }
          }
          else
          {
            LOBYTE(v14) = 0;
          }
        }
        else
        {
          LOBYTE(v14) = 0;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v20 = [(UITextFormattingViewControllerConfiguration *)self fontPickerConfiguration];
  uint64_t v19 = [v20 hash];
  uint64_t v18 = [(UITextFormattingViewControllerConfiguration *)self _preferringDimmingVisible];
  uint64_t v17 = [(UITextFormattingViewControllerConfiguration *)self _allowContentToScroll];
  uint64_t v16 = [(UITextFormattingViewControllerConfiguration *)self _includeDefaultFont];
  uint64_t v15 = [(UITextFormattingViewControllerConfiguration *)self _hasPopoverPresentation];
  uint64_t v3 = [(UITextFormattingViewControllerConfiguration *)self _useLandscapeLayout];
  uint64_t v4 = [(UITextFormattingViewControllerConfiguration *)self _hasParentViewController];
  uint64_t v5 = [(UITextFormattingViewControllerConfiguration *)self _textAnimationsConfiguration];
  uint64_t v6 = [(UITextFormattingViewControllerConfiguration *)self _textViewConfiguration];
  uint64_t v7 = [(UITextFormattingViewControllerConfiguration *)self _useReducedMetrics];
  BOOL v8 = [(UITextFormattingViewControllerConfiguration *)self formattingStyles];
  uint64_t v9 = [v8 hash];
  BOOL v10 = [(UITextFormattingViewControllerConfiguration *)self _emphasisStyles];
  uint64_t v11 = [v10 hash];
  BOOL v12 = [(UITextFormattingViewControllerConfiguration *)self groups];
  unint64_t v13 = v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v11 ^ [v12 hash] ^ 8;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(UITextFormattingViewControllerConfiguration *)self fontPickerConfiguration];
  [v8 encodeObject:v4 forKey:@"_FontPickerConfiguration"];

  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](self, "_preferringDimmingVisible"), @"_PreferringDimmingVisible");
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _allowContentToScroll](self, "_allowContentToScroll"), @"_AllowContentToScroll");
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"), @"_IncludeDefaultFont");
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](self, "_hasPopoverPresentation"), @"_HasPopoverPresentation");
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"), @"_UseLandscapeLayout");
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _hasParentViewController](self, "_hasParentViewController"), @"_HasParentViewController");
  uint64_t v5 = [(UITextFormattingViewControllerConfiguration *)self formattingStyles];
  [v8 encodeObject:v5 forKey:@"_FormattingStyles"];

  uint64_t v6 = [(UITextFormattingViewControllerConfiguration *)self _emphasisStyles];
  [v8 encodeObject:v6 forKey:@"_EmphasisStyles"];

  uint64_t v7 = [(UITextFormattingViewControllerConfiguration *)self groups];
  [v8 encodeObject:v7 forKey:@"_Groups"];

  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _textAnimationsConfiguration](self, "_textAnimationsConfiguration"), @"_TextAnimationsConfiguration");
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _textViewConfiguration](self, "_textViewConfiguration"), @"_TextViewConfiguration");
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _useReducedMetrics](self, "_useReducedMetrics"), @"_UseReducedMetrics");
}

- (UITextFormattingViewControllerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextFormattingViewControllerConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = _UITextFormattingViewControllerConfigurationClasses();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_FontPickerConfiguration"];
    [(UITextFormattingViewControllerConfiguration *)v5 setFontPickerConfiguration:v7];

    -[UITextFormattingViewControllerConfiguration set_preferringDimmingVisible:](v5, "set_preferringDimmingVisible:", [v4 decodeBoolForKey:@"_PreferringDimmingVisible"]);
    -[UITextFormattingViewControllerConfiguration set_allowContentToScroll:](v5, "set_allowContentToScroll:", [v4 decodeBoolForKey:@"_AllowContentToScroll"]);
    -[UITextFormattingViewControllerConfiguration set_includeDefaultFont:](v5, "set_includeDefaultFont:", [v4 decodeBoolForKey:@"_IncludeDefaultFont"]);
    -[UITextFormattingViewControllerConfiguration _setHasPopoverPresentation:](v5, "_setHasPopoverPresentation:", [v4 decodeBoolForKey:@"_HasPopoverPresentation"]);
    -[UITextFormattingViewControllerConfiguration _setUseLandscapeLayout:](v5, "_setUseLandscapeLayout:", [v4 decodeBoolForKey:@"_UseLandscapeLayout"]);
    -[UITextFormattingViewControllerConfiguration _setHasParentViewController:](v5, "_setHasParentViewController:", [v4 decodeBoolForKey:@"_HasParentViewController"]);
    id v8 = _UITextFormattingViewControllerConfigurationClasses();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_FormattingStyles"];
    [(UITextFormattingViewControllerConfiguration *)v5 setFormattingStyles:v9];

    BOOL v10 = _UITextFormattingViewControllerConfigurationClasses();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_EmphasisStyles"];
    [(UITextFormattingViewControllerConfiguration *)v5 set_emphasisStyles:v11];

    BOOL v12 = _UITextFormattingViewControllerConfigurationClasses();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_Groups"];
    groups = v5->_groups;
    v5->_groups = (NSArray *)v13;

    v5->__textAnimationsConfiguration = [v4 decodeBoolForKey:@"_TextAnimationsConfiguration"];
    v5->__textViewConfiguration = [v4 decodeBoolForKey:@"_TextViewConfiguration"];
    v5->__useReducedMetrics = [v4 decodeBoolForKey:@"_UseReducedMetrics"];
  }

  return v5;
}

- (void)setFormattingStyles:(id)a3
{
}

- (void)set_textAnimationsConfiguration:(BOOL)a3
{
  self->__textAnimationsConfiguration = a3;
}

- (void)set_textViewConfiguration:(BOOL)a3
{
  self->__textViewConfiguration = a3;
}

- (void)set_useReducedMetrics:(BOOL)a3
{
  self->__useReducedMetrics = a3;
}

- (void)set_emphasisStyles:(id)a3
{
}

@end