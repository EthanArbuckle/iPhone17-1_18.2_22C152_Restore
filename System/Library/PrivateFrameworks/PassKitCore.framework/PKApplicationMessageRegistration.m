@interface PKApplicationMessageRegistration
+ (BOOL)supportsSecureCoding;
+ (id)_createLocalWithIdentifier:(void *)a3 createdDate:(void *)a4 priority:(char)a5 badge:;
+ (id)createWithKey:(id)a3 createdDate:(id)a4 priority:(unint64_t)a5 badge:(BOOL)a6;
- (BOOL)badge;
- (BOOL)isEqual:(id)a3;
- (NSDate)createdDate;
- (PKApplicationMessageKey)key;
- (PKApplicationMessageRegistration)init;
- (PKApplicationMessageRegistration)initWithCoder:(id)a3;
- (id)_initWithKey:(void *)a3 createdDate:(void *)a4 priority:(char)a5 badge:;
- (unint64_t)hash;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationMessageRegistration

+ (id)_createLocalWithIdentifier:(void *)a3 createdDate:(void *)a4 priority:(char)a5 badge:
{
  id v8 = a3;
  id v9 = a2;
  self;
  v10 = -[PKApplicationMessageKey _initWithSource:identifier:]([PKApplicationMessageKey alloc], 0, v9);

  v11 = -[PKApplicationMessageRegistration _initWithKey:createdDate:priority:badge:]((id *)[PKApplicationMessageRegistration alloc], v10, v8, a4, a5);
  return v11;
}

- (id)_initWithKey:(void *)a3 createdDate:(void *)a4 priority:(char)a5 badge:
{
  id v10 = a2;
  id v11 = a3;
  v12 = v11;
  v13 = 0;
  if (a1 && v10 && v11)
  {
    v17.receiver = a1;
    v17.super_class = (Class)PKApplicationMessageRegistration;
    v14 = (id *)objc_msgSendSuper2(&v17, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 2, a2);
      objc_storeStrong(v15 + 3, a3);
      v15[4] = a4;
      *((unsigned char *)v15 + 8) = a5;
    }
    a1 = v15;
    v13 = a1;
  }

  return v13;
}

+ (id)createWithKey:(id)a3 createdDate:(id)a4 priority:(unint64_t)a5 badge:(BOOL)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = -[PKApplicationMessageRegistration _initWithKey:createdDate:priority:badge:]((id *)[PKApplicationMessageRegistration alloc], v10, v9, (void *)a5, a6);

  return v11;
}

- (PKApplicationMessageRegistration)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageRegistration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKApplicationMessageRegistration;
  v5 = [(PKApplicationMessageRegistration *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    key = v5->_key;
    v5->_key = (PKApplicationMessageKey *)v6;

    if (!v5->_key)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationMessageRegistration" code:0 userInfo:0];
      [v4 failWithError:v12];

      id v11 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priority"];
    v5->_priority = [v10 unsignedLongLongValue];

    v5->_badge = [v4 decodeBoolForKey:@"badge"];
  }
  id v11 = v5;
LABEL_6:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v6 = a3;
  [v6 encodeObject:key forKey:@"key"];
  [v6 encodeObject:self->_createdDate forKey:@"createdDate"];
  v5 = [NSNumber numberWithUnsignedLongLong:self->_priority];
  [v6 encodeObject:v5 forKey:@"priority"];

  [v6 encodeBool:self->_badge forKey:@"badge"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (unsigned __int8 *)v4;
    if (!self)
    {
LABEL_15:

      goto LABEL_16;
    }
    key = self->_key;
    v7 = (PKApplicationMessageKey *)*((void *)v5 + 2);
    if (key && v7)
    {
      if (!-[PKApplicationMessageKey isEqual:](key, "isEqual:")) {
        goto LABEL_14;
      }
    }
    else if (key != v7)
    {
LABEL_14:
      LOBYTE(self) = 0;
      goto LABEL_15;
    }
    if (self->_priority == *((void *)v5 + 4) && self->_badge == v5[8])
    {
      createdDate = self->_createdDate;
      id v9 = (NSDate *)*((void *)v5 + 3);
      if (createdDate && v9) {
        LOBYTE(self) = -[NSDate isEqual:](createdDate, "isEqual:");
      }
      else {
        LOBYTE(self) = createdDate == v9;
      }
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  LOBYTE(self) = 0;
LABEL_16:

  return (char)self;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PKApplicationMessageKey *)self->_key hash];
  LOBYTE(v5) = self->_badge;
  [(NSDate *)self->_createdDate hash];
  return SipHash();
}

- (PKApplicationMessageKey)key
{
  return self->_key;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (BOOL)badge
{
  return self->_badge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end