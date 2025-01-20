@interface UICommandAlternate
+ (BOOL)supportsSecureCoding;
+ (UICommandAlternate)alternateWithTitle:(NSString *)title action:(SEL)action modifierFlags:(UIKeyModifierFlags)modifierFlags;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (SEL)action;
- (UICommandAlternate)initWithCoder:(NSCoder *)coder;
- (UICommandAlternate)initWithModifierFlags:(int64_t)a3;
- (UICommandAlternate)initWithTitle:(id)a3 action:(SEL)a4 modifierFlags:(int64_t)a5;
- (UIKeyModifierFlags)modifierFlags;
- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4;
- (id)sender;
- (int64_t)_leafKeyModifierFlags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UICommandAlternate

+ (UICommandAlternate)alternateWithTitle:(NSString *)title action:(SEL)action modifierFlags:(UIKeyModifierFlags)modifierFlags
{
  v7 = title;
  v8 = [[UICommandAlternate alloc] initWithTitle:v7 action:action modifierFlags:modifierFlags];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICommandAlternate)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  v10.receiver = self;
  v10.super_class = (Class)UICommandAlternate;
  v5 = [(UICommandAlternate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    v5->_action = NSSelectorFromString(v8);

    v5->_modifierFlags = [(NSCoder *)v4 decodeIntegerForKey:@"modifierFlags"];
  }

  return v5;
}

- (UICommandAlternate)initWithModifierFlags:(int64_t)a3
{
  return [(UICommandAlternate *)self initWithTitle:&stru_1ED0E84C0 action:0 modifierFlags:a3];
}

- (UICommandAlternate)initWithTitle:(id)a3 action:(SEL)a4 modifierFlags:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UICommandAlternate;
  v9 = [(UICommandAlternate *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    title = v9->_title;
    v9->_title = (NSString *)v10;

    v9->_action = a4;
    v9->_modifierFlags = a5;
  }

  return v9;
}

- (int64_t)_leafKeyModifierFlags
{
  return self->_modifierFlags;
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "__isKindOfUIResponder"))
  {
    objc_storeStrong(&self->_sender, a4);
    id v8 = [v6 targetForAction:self->_action withSender:self];
    id sender = self->_sender;
    self->_id sender = 0;
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v6 = a3;
  [v6 encodeObject:title forKey:@"title"];
  v5 = NSStringFromSelector(self->_action);
  [v6 encodeObject:v5 forKey:@"action"];

  [v6 encodeInteger:self->_modifierFlags forKey:@"modifierFlags"];
}

- (unint64_t)hash
{
  return self->_modifierFlags;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_modifierFlags == v4[3];

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (SEL)action
{
  return self->_action;
}

- (UIKeyModifierFlags)modifierFlags
{
  return self->_modifierFlags;
}

- (id)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end