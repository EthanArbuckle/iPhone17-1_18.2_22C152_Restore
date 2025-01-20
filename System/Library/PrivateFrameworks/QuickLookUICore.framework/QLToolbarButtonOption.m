@interface QLToolbarButtonOption
+ (BOOL)supportsSecureCoding;
+ (id)cancelOption;
- (BOOL)isCancel;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)title;
- (QLToolbarButtonOption)initWithCoder:(id)a3;
- (QLToolbarButtonOption)initWithIdentifier:(id)a3;
- (int64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation QLToolbarButtonOption

- (QLToolbarButtonOption)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLToolbarButtonOption;
  v6 = [(QLToolbarButtonOption *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)cancelOption
{
  v2 = [[QLToolbarButtonOption alloc] initWithIdentifier:@"QLToolbarButtonOptionCancelIdentifier"];
  v3 = QLLocalizedString(@"Cancel");
  [(QLToolbarButtonOption *)v2 setTitle:v3];

  [(QLToolbarButtonOption *)v2 setStyle:1];
  return v2;
}

- (BOOL)isCancel
{
  v2 = [(QLToolbarButtonOption *)self identifier];
  char v3 = [v2 isEqualToString:@"QLToolbarButtonOptionCancelIdentifier"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(QLToolbarButtonOption *)self identifier];
  uint64_t v6 = [v4 identifier];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    v8 = [(QLToolbarButtonOption *)self identifier];
    v9 = [v4 identifier];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_7;
    }
  }
  v11 = [(QLToolbarButtonOption *)self title];
  uint64_t v12 = [v4 title];
  if (v11 == (void *)v12)
  {

    goto LABEL_9;
  }
  v13 = (void *)v12;
  v14 = [(QLToolbarButtonOption *)self title];
  v15 = [v4 title];
  int v16 = [v14 isEqual:v15];

  if (v16)
  {
LABEL_9:
    int64_t v18 = [(QLToolbarButtonOption *)self style];
    BOOL v17 = v18 == [v4 style];
    goto LABEL_10;
  }
LABEL_7:
  BOOL v17 = 0;
LABEL_10:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(QLToolbarButtonOption *)self identifier];

  if (v4)
  {
    id v5 = [(QLToolbarButtonOption *)self identifier];
    [v8 encodeObject:v5 forKey:@"identifier"];
  }
  uint64_t v6 = [(QLToolbarButtonOption *)self title];

  if (v6)
  {
    v7 = [(QLToolbarButtonOption *)self title];
    [v8 encodeObject:v7 forKey:@"title"];
  }
  objc_msgSend(v8, "encodeInteger:forKey:", -[QLToolbarButtonOption style](self, "style"), @"style");
}

- (QLToolbarButtonOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QLToolbarButtonOption;
  id v5 = [(QLToolbarButtonOption *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
    int v10 = v5;
  }

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end