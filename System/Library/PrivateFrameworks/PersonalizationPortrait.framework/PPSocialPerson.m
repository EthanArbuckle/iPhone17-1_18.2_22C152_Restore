@interface PPSocialPerson
+ (BOOL)supportsSecureCoding;
- (NSString)displayName;
- (NSString)handle;
- (PPSocialPerson)initWithCoder:(id)a3;
- (PPSocialPerson)initWithHandle:(id)a3 displayName:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSocialPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)handle
{
  return self->_handle;
}

- (PPSocialPerson)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = pp_social_highlights_log_handle();
  v8 = [v4 robustDecodeObjectOfClass:v6 forKey:@"ha" withCoder:v5 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v7];

  v9 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v10 = objc_opt_class();
  v11 = pp_social_highlights_log_handle();
  v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"dn" withCoder:v5 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v11];

  if (v8) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    self = [(PPSocialPerson *)self initWithHandle:v8 displayName:v12];
    v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"ha"];
  [v5 encodeObject:self->_displayName forKey:@"dn"];
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(PPSocialPerson *)self handle];
  id v5 = [(PPSocialPerson *)self displayName];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<PPSocialPerson ha:'%@' dn:'%@'>", v4, v5];

  return v6;
}

- (PPSocialPerson)initWithHandle:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSocialPerson;
  v9 = [(PPSocialPerson *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handle, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end