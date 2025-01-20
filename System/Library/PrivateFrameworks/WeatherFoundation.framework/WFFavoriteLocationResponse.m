@interface WFFavoriteLocationResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)favoriteLocations;
- (WFFavoriteLocationResponse)initWithCoder:(id)a3;
- (WFFavoriteLocationResponse)initWithIdentifier:(id)a3 favorites:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFavoriteLocationResponse

- (WFFavoriteLocationResponse)initWithIdentifier:(id)a3 favorites:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFFavoriteLocationResponse;
  v8 = [(WFResponse *)&v12 initWithIdentifier:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_favoriteLocations, a4);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"WFFavoriteLocationResponse %p: %@", self, self->_favoriteLocations];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFFavoriteLocationResponse)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFFavoriteLocationResponse;
  v5 = [(WFResponse *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"favoriteLocations"];
    favoriteLocations = v5->_favoriteLocations;
    v5->_favoriteLocations = (NSArray *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFFavoriteLocationResponse;
  id v4 = a3;
  [(WFResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_favoriteLocations, @"favoriteLocations", v5.receiver, v5.super_class);
}

- (NSArray)favoriteLocations
{
  return self->_favoriteLocations;
}

- (void).cxx_destruct
{
}

@end