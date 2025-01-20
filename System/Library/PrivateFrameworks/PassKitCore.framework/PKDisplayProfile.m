@interface PKDisplayProfile
+ (BOOL)supportsSecureCoding;
+ (Class)classForDisplayProfileType:(int64_t)a3;
+ (id)displayProfileOfType:(int64_t)a3 withDictionary:(id)a4 bundle:(id)a5;
- (PKDisplayProfile)initWithCoder:(id)a3;
- (PKDisplayProfile)initWithDictionary:(id)a3 bundle:(id)a4;
- (int64_t)type;
@end

@implementation PKDisplayProfile

- (PKDisplayProfile)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDisplayProfile;
  return [(PKDisplayProfile *)&v4 init];
}

+ (id)displayProfileOfType:(int64_t)a3 withDictionary:(id)a4 bundle:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)[a1 classForDisplayProfileType:a3];
  if (v10) {
    v11 = (void *)[[v10 alloc] initWithDictionary:v8 bundle:v9];
  }
  else {
    v11 = 0;
  }

  return v11;
}

- (PKDisplayProfile)initWithDictionary:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKDisplayProfile;
  return [(PKDisplayProfile *)&v5 init];
}

+ (Class)classForDisplayProfileType:(int64_t)a3
{
  if (a3)
  {
    objc_super v4 = 0;
  }
  else
  {
    objc_super v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

@end