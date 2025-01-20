@interface UIMenuElement
+ (BOOL)supportsSecureCoding;
- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5;
- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4;
- (BOOL)_canBeHighlighted;
- (BOOL)_isInlineGroup;
- (BOOL)_isLeaf;
- (BOOL)_isLoadingPlaceholder;
- (BOOL)_isVisible;
- (BOOL)_omitsInlineTitle;
- (NSAttributedString)attributedTitle;
- (NSString)_internalIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (UIAction)_accessoryAction;
- (UIImage)image;
- (UIMenuElement)initWithCoder:(NSCoder *)coder;
- (UIMenuElement)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5;
- (_UIMenuImageOrName)_imageOrName;
- (id)_customContentView;
- (id)_immutableCopy;
- (id)accessibilityIdentifier;
- (unint64_t)_preferredDisplayMode;
- (void)_setImage:(id)a3;
- (void)_setPreferredDisplayMode:(unint64_t)a3;
- (void)_setSubtitle:(id)a3;
- (void)_setTitle:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setSubtitle:(NSString *)subtitle;
- (void)set_accessoryAction:(id)a3;
- (void)set_internalIdentifier:(id)a3;
@end

@implementation UIMenuElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessoryAction, 0);
  objc_storeStrong((id *)&self->__imageOrName, 0);
  objc_storeStrong((id *)&self->__internalIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (id)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (unint64_t)_preferredDisplayMode
{
  return self->__preferredDisplayMode;
}

- (_UIMenuImageOrName)_imageOrName
{
  return self->__imageOrName;
}

- (UIMenuElement)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)UIMenuElement;
  v11 = [(UIMenuElement *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = v9;
    }
    objc_storeStrong((id *)&v11->__imageOrName, v16);

    v17 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v18 = [v17 UUIDString];
    internalIdentifier = v11->__internalIdentifier;
    v11->__internalIdentifier = (NSString *)v18;
  }
  return v11;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)set_internalIdentifier:(id)a3
{
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (NSString)_internalIdentifier
{
  return self->__internalIdentifier;
}

- (UIImage)image
{
  p_imageOrName = &self->__imageOrName;
  v3 = [(_UIMenuImageOrName *)self->__imageOrName _asMenuElementImageName];
  if (v3)
  {
    v4 = +[UIImage _systemImageNamed:v3];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      _UIImageWithName(v3);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    objc_storeStrong((id *)p_imageOrName, v7);
  }
  else
  {
    v7 = [(_UIMenuImageOrName *)*p_imageOrName _asMenuElementImage];
  }

  return (UIImage *)v7;
}

- (void)set_accessoryAction:(id)a3
{
}

- (UIAction)_accessoryAction
{
  return self->__accessoryAction;
}

- (BOOL)_isLoadingPlaceholder
{
  return 0;
}

- (void)_setSubtitle:(id)a3
{
  if (self->_subtitle != a3)
  {
    v4 = (NSString *)[a3 copy];
    subtitle = self->_subtitle;
    self->_subtitle = v4;
  }
}

- (void)setSubtitle:(NSString *)subtitle
{
}

- (void)_setTitle:(id)a3
{
  if (self->_title != a3)
  {
    v4 = (NSString *)[a3 copy];
    title = self->_title;
    self->_title = v4;
  }
}

- (void)_setImage:(id)a3
{
  v5 = (_UIMenuImageOrName *)a3;
  imageOrName = self->__imageOrName;
  p_imageOrName = &self->__imageOrName;
  if (imageOrName != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_imageOrName, a3);
    v5 = v8;
  }
}

- (BOOL)_isInlineGroup
{
  if ([(UIMenuElement *)self _isLeaf]) {
    return 0;
  }
  else {
    return [(UIMenuElement *)self options] & 1;
  }
}

- (BOOL)_omitsInlineTitle
{
  BOOL v3 = [(UIMenuElement *)self _isInlineGroup];
  if (v3) {
    LOBYTE(v3) = [(UIMenuElement *)self behaviorOptions] & 1;
  }
  return v3;
}

- (BOOL)_canBeHighlighted
{
  if (![(UIMenuElement *)self _isLeaf]) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return ([(UIMenuElement *)self attributes] & 1) == 0;
  }
  BOOL v3 = [(UIMenuElement *)self primaryActionHandler];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_isVisible
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(UIMenuElement *)self _isLeaf]) {
    return ([(UIMenuElement *)self attributes] & 4) == 0;
  }
  BOOL v4 = self;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(UIMenuElement *)v4 children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) _isVisible])
        {
          BOOL v3 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v5 = [(UIMenuElement *)v4 headerView];
  BOOL v3 = v5 != 0;
LABEL_13:

  return v3;
}

- (id)_customContentView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [(UIMenuElement *)self contentView];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isLeaf
{
  return 0;
}

- (UIMenuElement)initWithCoder:(NSCoder *)coder
{
  BOOL v4 = coder;
  v26.receiver = self;
  v26.super_class = (Class)UIMenuElement;
  v5 = [(UIMenuElement *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    else {
      uint64_t v8 = &stru_1ED0E84C0;
    }
    objc_storeStrong((id *)&v5->_title, v8);

    uint64_t v9 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedTitle"];
    attributedTitle = v5->_attributedTitle;
    v5->_attributedTitle = (NSAttributedString *)v9;

    uint64_t v11 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v11;

    long long v13 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
    long long v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v15 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    }
    imageOrName = v5->__imageOrName;
    v5->__imageOrName = v15;

    uint64_t v17 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityIdentifier"];
    accessibilityIdentifier = v5->_accessibilityIdentifier;
    v5->_accessibilityIdentifier = (NSString *)v17;

    v5->__preferredDisplayMode = [(NSCoder *)v4 decodeIntegerForKey:@"preferredDisplayMode"];
    v19 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"internalIdentifier"];
    v20 = v19;
    if (v19)
    {
      objc_super v21 = v19;
      internalIdentifier = v5->__internalIdentifier;
      v5->__internalIdentifier = v21;
    }
    else
    {
      internalIdentifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v23 = [internalIdentifier UUIDString];
      v24 = v5->__internalIdentifier;
      v5->__internalIdentifier = (NSString *)v23;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  [v12 encodeObject:self->_title forKey:@"title"];
  attributedTitle = self->_attributedTitle;
  if (attributedTitle) {
    [v12 encodeObject:attributedTitle forKey:@"attributedTitle"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v12 encodeObject:subtitle forKey:@"subtitle"];
  }
  uint64_t v6 = [(_UIMenuImageOrName *)self->__imageOrName _asMenuElementImageName];
  uint64_t v7 = [(_UIMenuImageOrName *)self->__imageOrName _asMenuElementImage];
  if (v6)
  {
    uint64_t v8 = @"imageName";
    uint64_t v9 = v12;
    id v10 = v6;
  }
  else
  {
    uint64_t v11 = v12;
    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v8 = @"image";
    uint64_t v9 = v12;
    id v10 = v7;
  }
  [v9 encodeObject:v10 forKey:v8];
  uint64_t v11 = v12;
LABEL_10:
  [v11 encodeObject:self->_accessibilityIdentifier forKey:@"accessibilityIdentifier"];
  [v12 encodeInteger:self->__preferredDisplayMode forKey:@"preferredDisplayMode"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v12 encodeObject:self->__internalIdentifier forKey:@"internalIdentifier"];
  }
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  return 0;
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  return 0;
}

- (id)_immutableCopy
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"UIMenuElement.m", 145, @"Menu child must be a menu, action or command" object file lineNumber description];

  return 0;
}

- (void)_setPreferredDisplayMode:(unint64_t)a3
{
  self->__preferredDisplayMode = a3;
}

- (void)setAttributedTitle:(id)a3
{
}

@end