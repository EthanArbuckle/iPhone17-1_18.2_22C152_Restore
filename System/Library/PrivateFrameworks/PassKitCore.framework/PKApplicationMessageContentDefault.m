@interface PKApplicationMessageContentDefault
+ (BOOL)supportsSecureCoding;
+ (id)createWithGroup:(id)a3 action:(id)a4 icon:(id)a5 title:(id)a6 body:(id)a7;
- (NSString)body;
- (NSString)title;
- (PKApplicationMessageContentDefault)initWithCoder:(id)a3;
- (PKApplicationMessageIcon)icon;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationMessageContentDefault

+ (id)createWithGroup:(id)a3 action:(id)a4 icon:(id)a5 title:(id)a6 body:(id)a7
{
  id v12 = a5;
  v13 = 0;
  if (a3 && a6)
  {
    id v14 = a7;
    id v15 = a6;
    id v16 = a3;
    id v17 = a4;
    self;
    v18 = [PKApplicationMessageContentDefault alloc];
    v19 = v18;
    if (v18)
    {
      v26.receiver = v18;
      v26.super_class = (Class)PKApplicationMessageContent;
      v20 = objc_msgSendSuper2(&v26, sel_init);
      v13 = (id *)v20;
      if (v20) {
        v20[1] = 0;
      }
    }
    else
    {
      v13 = 0;
    }

    objc_storeStrong(v13 + 2, a3);
    objc_storeStrong(v13 + 3, a4);

    objc_storeStrong(v13 + 4, a5);
    uint64_t v21 = [v15 copy];

    id v22 = v13[5];
    v13[5] = (id)v21;

    uint64_t v23 = [v14 copy];
    id v24 = v13[6];
    v13[6] = (id)v23;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageContentDefault)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKApplicationMessageContentDefault;
  v5 = [(PKApplicationMessageContent *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (PKApplicationMessageIcon *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v9;

    if (!v5->_title)
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationMessageContentDefault" code:0 userInfo:0];
      [v4 failWithError:v14];

      v13 = 0;
      goto LABEL_6;
    }
    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v11;
  }
  v13 = v5;
LABEL_6:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageContentDefault;
  id v4 = a3;
  [(PKApplicationMessageContent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_icon, @"icon", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_title forKey:@"title"];
  [v4 encodeObject:self->_body forKey:@"body"];
}

- (PKApplicationMessageIcon)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end