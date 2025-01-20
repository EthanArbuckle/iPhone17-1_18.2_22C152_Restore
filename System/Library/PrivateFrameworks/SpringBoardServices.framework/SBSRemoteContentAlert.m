@interface SBSRemoteContentAlert
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)actions;
- (NSString)message;
- (NSString)title;
- (SBSRemoteContentAlert)initWithCoder:(id)a3;
- (SBSRemoteContentAlert)initWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5;
- (int64_t)preferredStyle;
- (unint64_t)hash;
- (void)addAction:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SBSRemoteContentAlert

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteContentAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBSRemoteContentAlert;
  v5 = [(SBSRemoteContentAlert *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v8;

    v5->_preferredStyle = [v4 decodeIntegerForKey:@"preferredStyle"];
    v10 = (void *)MEMORY[0x1E4F1CA48];
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = [v11 setWithObjects:v12, nil];
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"actions"];
    uint64_t v15 = [v10 arrayWithArray:v14];
    actions = v5->_actions;
    v5->_actions = (NSMutableArray *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_message forKey:@"message"];
  [v5 encodeInteger:self->_preferredStyle forKey:@"preferredStyle"];
  id v6 = (id)[(NSMutableArray *)self->_actions copy];
  [v5 encodeObject:v6 forKey:@"actions"];
}

- (SBSRemoteContentAlert)initWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBSRemoteContentAlert;
  v10 = [(SBSRemoteContentAlert *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    message = v10->_message;
    v10->_message = (NSString *)v13;

    v10->_preferredStyle = a5;
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    actions = v10->_actions;
    v10->_actions = (NSMutableArray *)v15;
  }
  return v10;
}

- (void)addAction:(id)a3
{
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (NSArray)actions
{
  return (NSArray *)self->_actions;
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

      unsigned __int8 v9 = v8 ^ 1;
    }
    else
    {
      unsigned __int8 v9 = 0;
    }

    v10 = [v5 message];
    if (v10 || self->_message)
    {
      uint64_t v11 = [v5 message];
      char v12 = [v11 isEqualToString:self->_message];

      unsigned __int8 v13 = v12 ^ 1;
    }
    else
    {
      unsigned __int8 v13 = 0;
    }

    uint64_t v14 = [v5 preferredStyle];
    int64_t preferredStyle = self->_preferredStyle;
    v16 = [v5 actions];
    char v17 = [v16 isEqual:self->_actions];

    if (v14 == preferredStyle) {
      BOOL v18 = v17;
    }
    else {
      BOOL v18 = 0;
    }
    BOOL v19 = ((v9 | v13) & 1) == 0 && v18;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_message hash] ^ v3;
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_preferredStyle];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = v4 ^ [(NSMutableArray *)self->_actions hash] ^ v6;

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_preferredAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end