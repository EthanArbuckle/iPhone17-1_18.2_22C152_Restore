@interface SBSRemoteContentAlertAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (SBSRemoteContentAlertAction)initWithCoder:(id)a3;
- (SBSRemoteContentAlertAction)initWithTitle:(id)a3 style:(int64_t)a4;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SBSRemoteContentAlertAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteContentAlertAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSRemoteContentAlertAction;
  v5 = [(SBSRemoteContentAlertAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeInteger:self->_style forKey:@"style"];
  [v5 encodeBool:self->_enabled forKey:@"enabled"];
}

- (SBSRemoteContentAlertAction)initWithTitle:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSRemoteContentAlertAction;
  v7 = [(SBSRemoteContentAlertAction *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v7->_style = a4;
    v7->_enabled = 1;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 title];
    if (v6 || self->_title)
    {
      v7 = [v5 title];
      char v8 = [v7 isEqualToString:self->_title];
    }
    else
    {
      char v8 = 1;
    }

    uint64_t v9 = [v5 style];
    int64_t style = self->_style;
    int v11 = [v5 isEnabled];
    if (v9 == style) {
      char v12 = v8;
    }
    else {
      char v12 = 0;
    }
    if (self->_enabled == v11) {
      BOOL v13 = v12;
    }
    else {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_style];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_enabled];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

@end