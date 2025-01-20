@interface PKApplicationMessage
+ (BOOL)supportsSecureCoding;
+ (id)createLocalWithIdentifier:(id)a3 createdDate:(id)a4 priority:(unint64_t)a5 badge:(BOOL)a6 content:(id)a7;
+ (id)createWithRegistration:(id)a3 content:(id)a4;
- (PKApplicationMessage)init;
- (PKApplicationMessage)initWithCoder:(id)a3;
- (PKApplicationMessageContent)content;
- (PKApplicationMessageRegistration)registration;
- (id)_initWithRegistration:(void *)a3 content:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationMessage

+ (id)createLocalWithIdentifier:(id)a3 createdDate:(id)a4 priority:(unint64_t)a5 badge:(BOOL)a6 content:(id)a7
{
  id v11 = a7;
  v12 = +[PKApplicationMessageRegistration _createLocalWithIdentifier:createdDate:priority:badge:]((uint64_t)PKApplicationMessageRegistration, a3, a4, (void *)a5, a6);
  v13 = -[PKApplicationMessage _initWithRegistration:content:]((id *)[PKApplicationMessage alloc], v12, v11);

  return v13;
}

- (id)_initWithRegistration:(void *)a3 content:
{
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  v9 = 0;
  if (a1 && v6 && v7)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKApplicationMessage;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_init);
    id v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a2);
      objc_storeStrong(v11 + 2, a3);
    }
    a1 = v11;
    v9 = a1;
  }

  return v9;
}

+ (id)createWithRegistration:(id)a3 content:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[PKApplicationMessage _initWithRegistration:content:]((id *)[PKApplicationMessage alloc], v6, v5);

  return v7;
}

- (PKApplicationMessage)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKApplicationMessage;
  id v5 = [(PKApplicationMessage *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registration"];
  registration = v5->_registration;
  v5->_registration = (PKApplicationMessageRegistration *)v6;

  if (!v5->_registration) {
    goto LABEL_5;
  }
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
  content = v5->_content;
  v5->_content = (PKApplicationMessageContent *)v8;

  if (v5->_content)
  {
LABEL_4:
    v10 = v5;
  }
  else
  {
LABEL_5:
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationMessage" code:0 userInfo:0];
    [v4 failWithError:v11];

    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  registration = self->_registration;
  id v5 = a3;
  [v5 encodeObject:registration forKey:@"registration"];
  [v5 encodeObject:self->_content forKey:@"content"];
}

- (PKApplicationMessageRegistration)registration
{
  return self->_registration;
}

- (PKApplicationMessageContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_registration, 0);
}

@end