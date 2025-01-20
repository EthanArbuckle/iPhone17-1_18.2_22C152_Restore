@interface MOEventTravel
+ (BOOL)supportsSecureCoding;
- (MOEventTravel)initWithCoder:(id)a3;
- (NSArray)tripParts;
- (NSString)tripTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTripParts:(id)a3;
- (void)setTripTitle:(id)a3;
@end

@implementation MOEventTravel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  tripTitle = self->_tripTitle;
  id v5 = a3;
  [v5 encodeObject:tripTitle forKey:@"tripTitle"];
  [v5 encodeObject:self->_tripParts forKey:@"tripParts"];
}

- (MOEventTravel)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MOEventTravel;
  id v5 = [(MOEventTravel *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tripTitle"];
    tripTitle = v5->_tripTitle;
    v5->_tripTitle = (NSString *)v6;

    id v9 = objc_alloc((Class)NSSet);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v9, "initWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"tripParts"];
    tripParts = v5->_tripParts;
    v5->_tripParts = (NSArray *)v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventTravel);
  objc_storeStrong((id *)&v4->_tripParts, self->_tripParts);
  objc_storeStrong((id *)&v4->_tripTitle, self->_tripTitle);
  return v4;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(MOEventTravel *)self tripTitle];
  id v5 = [v4 mask];
  id v6 = [v3 initWithFormat:@"tripTitle, %@", v5];

  return v6;
}

- (NSString)tripTitle
{
  return self->_tripTitle;
}

- (void)setTripTitle:(id)a3
{
}

- (NSArray)tripParts
{
  return self->_tripParts;
}

- (void)setTripParts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripParts, 0);
  objc_storeStrong((id *)&self->_tripTitle, 0);
}

@end