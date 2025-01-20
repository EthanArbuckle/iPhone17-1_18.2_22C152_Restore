@interface APEventChannel
+ (BOOL)supportsSecureCoding;
+ (id)unused;
- (APDestination)destination;
- (APEventChannel)initWithCoder:(id)a3;
- (APEventChannel)initWithDestination:(id)a3 purpose:(int64_t)a4;
- (APProtectedEventChannel)protectedEventChannel;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventChannel:(id)a3;
- (id)description;
- (int64_t)purpose;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APEventChannel

+ (id)unused
{
  if (qword_100289B50 != -1) {
    dispatch_once(&qword_100289B50, &stru_1002363C0);
  }
  v2 = (void *)qword_100289B48;

  return v2;
}

- (APEventChannel)initWithDestination:(id)a3 purpose:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APEventChannel;
  v8 = [(APEventChannel *)&v11 init];
  if (v8)
  {
    if (!v7 || !isExternalPurpose())
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v8->_destination, a3);
    v8->_purpose = a4;
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (APProtectedEventChannel)protectedEventChannel
{
  v3 = [APProtectedEventChannel alloc];
  v4 = [(APEventChannel *)self destination];
  v5 = [(APProtectedEventChannel *)v3 initWithDestination:v4 purpose:[(APEventChannel *)self purpose]];

  return v5;
}

- (BOOL)isEqualToEventChannel:(id)a3
{
  id v4 = a3;
  v5 = [(APEventChannel *)self destination];
  v6 = [v4 destination];
  if ([v5 isEqualToDestination:v6])
  {
    id v7 = [(APEventChannel *)self purpose];
    BOOL v8 = v7 == [v4 purpose];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (APEventChannel *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(APEventChannel *)self isEqualToEventChannel:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  v3 = [(APEventChannel *)self destination];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(APEventChannel *)self purpose] ^ v4;

  return v5;
}

- (id)description
{
  v3 = [(APEventChannel *)self destination];
  unint64_t v4 = +[NSNumber numberWithInteger:[(APEventChannel *)self purpose]];
  unint64_t v5 = +[NSString stringWithFormat:@"%@/%@", v3, v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APEventChannel)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APEventChannel;
  unint64_t v5 = [(APEventChannel *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
    destination = v5->_destination;
    v5->_destination = (APDestination *)v6;

    v5->_purpose = (int64_t)[v4 decodeIntegerForKey:@"purpose"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(APEventChannel *)self destination];
  [v5 encodeObject:v4 forKey:@"destination"];

  [v5 encodeInteger:-[APEventChannel purpose](self, "purpose") forKey:@"purpose"];
}

- (APDestination)destination
{
  return self->_destination;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void).cxx_destruct
{
}

@end