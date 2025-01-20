@interface _UIOEditMenuPresentationConfiguration
+ (BOOL)supportsSecureCoding;
+ (_UIOEditMenuPresentationConfiguration)configurationWithMenu:(id)a3 preferredArrowDirection:(int64_t)a4 sourceRect:(CGRect)a5 enforcesMenuControllerLifecycle:(BOOL)a6 initialUserInterfaceStyle:(int64_t)a7;
- (BOOL)enforcesMenuControllerLifecycle;
- (CGRect)sourceRect;
- (CGRect)targetRect;
- (NSString)identifier;
- (UIMenu)menu;
- (_UIOEditMenuPresentationConfiguration)configurationWithTargetOrigin:(CGPoint)a3;
- (_UIOEditMenuPresentationConfiguration)initWithCoder:(id)a3;
- (int64_t)initialUserInterfaceStyle;
- (int64_t)preferredArrowDirection;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIOEditMenuPresentationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_UIOEditMenuPresentationConfiguration)configurationWithMenu:(id)a3 preferredArrowDirection:(int64_t)a4 sourceRect:(CGRect)a5 enforcesMenuControllerLifecycle:(BOOL)a6 initialUserInterfaceStyle:(int64_t)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a3;
  uint64_t v15 = objc_opt_new();
  v16 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v17 = [v16 UUIDString];
  v18 = *(void **)(v15 + 16);
  *(void *)(v15 + 16) = v17;

  v19 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v14;

  *(CGFloat *)(v15 + 48) = x;
  *(CGFloat *)(v15 + 56) = y;
  *(CGFloat *)(v15 + 64) = width;
  *(CGFloat *)(v15 + 72) = height;
  *(unsigned char *)(v15 + 8) = a6;
  *(void *)(v15 + 32) = a4;
  *(void *)(v15 + 40) = a7;
  *(CGFloat *)(v15 + 80) = x;
  *(CGFloat *)(v15 + 88) = y;
  *(CGFloat *)(v15 + 96) = width;
  *(CGFloat *)(v15 + 104) = height;
  return (_UIOEditMenuPresentationConfiguration *)(id)v15;
}

- (_UIOEditMenuPresentationConfiguration)configurationWithTargetOrigin:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v6 = objc_opt_new();
  objc_storeStrong((id *)(v6 + 16), self->_identifier);
  objc_storeStrong((id *)(v6 + 24), self->_menu);
  *(void *)(v6 + 32) = self->_preferredArrowDirection;
  CGSize size = self->_sourceRect.size;
  *(CGPoint *)(v6 + 48) = self->_sourceRect.origin;
  *(CGSize *)(v6 + 64) = size;
  *(unsigned char *)(v6 + 8) = self->_enforcesMenuControllerLifecycle;
  *(void *)(v6 + 40) = self->_initialUserInterfaceStyle;
  CGSize v8 = self->_targetRect.size;
  *(CGFloat *)(v6 + 80) = x;
  *(CGFloat *)(v6 + 88) = y;
  *(CGSize *)(v6 + 96) = v8;
  return (_UIOEditMenuPresentationConfiguration *)(id)v6;
}

- (_UIOEditMenuPresentationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UIOEditMenuPresentationConfiguration;
  v5 = [(_UIOEditMenuPresentationConfiguration *)&v19 init];
  if (v5)
  {
    uint64_t v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = +[UIMenu menuWithChildren:MEMORY[0x1E4F1CBF0]];
    menu = v5->_menu;
    v5->_menu = (UIMenu *)v9;

    v11 = self;
    v12 = [v4 decodeObjectOfClass:v11 forKey:@"menuIdentifier"];
    [(UIMenuElement *)v5->_menu set_internalIdentifier:v12];

    v5->_preferredArrowDirection = [v4 decodeIntegerForKey:@"preferredArrowDirection"];
    [v4 decodeCGRectForKey:@"sourceRect"];
    v5->_sourceRect.origin.CGFloat x = v13;
    v5->_sourceRect.origin.CGFloat y = v14;
    v5->_sourceRect.size.CGFloat width = v15;
    v5->_sourceRect.size.CGFloat height = v16;
    v5->_enforcesMenuControllerLifecycle = [v4 decodeBoolForKey:@"enforcesMenuControllerLifecycle"];
    v5->_initialUserInterfaceStyle = [v4 decodeIntegerForKey:@"initialUserInterfaceStyle"];
    CGSize size = v5->_sourceRect.size;
    v5->_targetRect.origin = v5->_sourceRect.origin;
    v5->_targetRect.CGSize size = size;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  v5 = [(UIMenuElement *)self->_menu _internalIdentifier];
  [v6 encodeObject:v5 forKey:@"menuIdentifier"];

  [v6 encodeInteger:self->_preferredArrowDirection forKey:@"preferredArrowDirection"];
  objc_msgSend(v6, "encodeCGRect:forKey:", @"sourceRect", self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  [v6 encodeBool:self->_enforcesMenuControllerLifecycle forKey:@"enforcesMenuControllerLifecycle"];
  [v6 encodeInteger:self->_initialUserInterfaceStyle forKey:@"initialUserInterfaceStyle"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)targetRect
{
  double x = self->_targetRect.origin.x;
  double y = self->_targetRect.origin.y;
  double width = self->_targetRect.size.width;
  double height = self->_targetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)enforcesMenuControllerLifecycle
{
  return self->_enforcesMenuControllerLifecycle;
}

- (int64_t)preferredArrowDirection
{
  return self->_preferredArrowDirection;
}

- (int64_t)initialUserInterfaceStyle
{
  return self->_initialUserInterfaceStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end