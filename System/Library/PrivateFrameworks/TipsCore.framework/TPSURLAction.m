@interface TPSURLAction
+ (BOOL)supportsSecureCoding;
- (NSString)text;
- (NSURL)URL;
- (TPSURLAction)initWithCoder:(id)a3;
- (TPSURLAction)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setText:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation TPSURLAction

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSURLAction;
  id v4 = a3;
  [(TPSSerializableObject *)&v7 encodeWithCoder:v4];
  v5 = [(TPSURLAction *)self text];
  [v4 encodeObject:v5 forKey:@"text"];

  v6 = [(TPSURLAction *)self URL];
  [v4 encodeObject:v6 forKey:@"href"];
}

- (NSString)text
{
  return self->_text;
}

- (NSURL)URL
{
  return self->_URL;
}

- (TPSURLAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSURLAction;
  v5 = [(TPSSerializableObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    [(TPSURLAction *)v5 setText:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"href"];
    [(TPSURLAction *)v5 setURL:v7];
  }
  return v5;
}

- (void)setText:(id)a3
{
}

- (TPSURLAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSURLAction;
  v5 = [(TPSSerializableObject *)&v15 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_6;
  }
  v6 = [v4 TPSSafeStringForKey:@"text"];
  [(TPSURLAction *)v5 setText:v6];

  objc_super v7 = [v4 TPSSafeDictionaryForKey:@"attrs"];
  v8 = [v7 TPSSafeStringForKey:@"href"];
  if ([v8 length])
  {
    objc_super v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    [(TPSURLAction *)v5 setURL:v9];
  }
  uint64_t v10 = [(TPSURLAction *)v5 text];
  if (!v10)
  {

    goto LABEL_8;
  }
  v11 = (void *)v10;
  v12 = [(TPSURLAction *)v5 URL];

  if (!v12)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
LABEL_6:
  v13 = v5;
LABEL_9:

  return v13;
}

- (void)setURL:(id)a3
{
  p_URL = &self->_URL;
  v6 = (NSURL *)a3;
  v8 = v6;
  if (*p_URL != v6)
  {
    objc_storeStrong((id *)&self->_URL, a3);
    v6 = *p_URL;
  }
  if (v6)
  {
    objc_super v7 = +[TPSURLActionComponents componentsWithURL:](TPSURLActionComponents, "componentsWithURL:");
    -[TPSURLAction setType:](self, "setType:", [v7 actionType]);
  }
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSURLAction;
  id v4 = [(TPSSerializableObject *)&v8 copyWithZone:a3];
  v5 = [(TPSURLAction *)self text];
  [v4 setText:v5];

  v6 = [(TPSURLAction *)self URL];
  [v4 setURL:v6];

  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSURLAction;
  id v4 = [(TPSSerializableObject *)&v9 debugDescription];
  v5 = (void *)[v3 initWithFormat:@"%@", v4];

  v6 = [(TPSURLAction *)self text];
  [v5 appendFormat:@"\n %@ = %@\n", @"text", v6];

  objc_super v7 = [(TPSURLAction *)self URL];
  [v5 appendFormat:@" %@ = %@\n", @"href", v7];

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end