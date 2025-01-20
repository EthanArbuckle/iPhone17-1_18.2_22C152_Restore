@interface TPSCellularNetworksResponse
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (NSArray)cellularNetworks;
- (TPSCellularNetworksResponse)initWithCoder:(id)a3;
- (TPSCellularNetworksResponse)initWithSubscriptionContext:(id)a3 error:(id)a4;
- (TPSCellularNetworksResponse)initWithSubscriptionContext:(id)a3 error:(id)a4 cellularNetworks:(id)a5;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSCellularNetworksResponse

- (TPSCellularNetworksResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  return 0;
}

- (TPSCellularNetworksResponse)initWithSubscriptionContext:(id)a3 error:(id)a4 cellularNetworks:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TPSCellularNetworksResponse;
  v9 = [(TPSResponse *)&v13 initWithSubscriptionContext:a3 error:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    cellularNetworks = v9->_cellularNetworks;
    v9->_cellularNetworks = (NSArray *)v10;
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSCellularNetworksResponse;
  v5 = -[TPSResponse copyWithZone:](&v9, sel_copyWithZone_);
  uint64_t v6 = [(NSArray *)self->_cellularNetworks copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCellularNetworksResponse;
  id v4 = a3;
  [(TPSResponse *)&v7 encodeWithCoder:v4];
  cellularNetworks = self->_cellularNetworks;
  uint64_t v6 = NSStringFromSelector(sel_cellularNetworks);
  objc_msgSend(v4, "encodeObject:forKey:", cellularNetworks, v6, v7.receiver, v7.super_class);
}

- (TPSCellularNetworksResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSCellularNetworksResponse;
  v5 = [(TPSResponse *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    objc_super v9 = NSStringFromSelector(sel_cellularNetworks);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    cellularNetworks = v5->_cellularNetworks;
    v5->_cellularNetworks = (NSArray *)v10;
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_subscriptionContext);
  v5 = [(TPSResponse *)self subscriptionContext];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_error);
  uint64_t v7 = [(TPSResponse *)self error];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  id v8 = NSStringFromSelector(sel_cellularNetworks);
  [v3 appendFormat:@"%@=%@", v8, self->_cellularNetworks];

  [v3 appendFormat:@">"];
  objc_super v9 = (void *)[v3 copy];

  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCellularNetworksResponse;
  unint64_t v3 = [(TPSResponse *)&v7 hash];
  id v4 = [(TPSCellularNetworksResponse *)self cellularNetworks];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPSCellularNetworksResponse *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPSCellularNetworksResponse *)self isEqualToResponse:v4];
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCellularNetworksResponse;
  if ([(TPSResponse *)&v9 isEqualToResponse:v4])
  {
    uint64_t v5 = [(TPSCellularNetworksResponse *)self cellularNetworks];
    uint64_t v6 = [v4 cellularNetworks];
    char v7 = (v5 | v6) == 0;
    if (v6) {
      char v7 = [(id)v5 isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSCellularNetworksResponse;
  id v4 = objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  uint64_t v5 = (void *)[v3 initWithSet:v4];

  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  [v5 addObjectsFromArray:v6];

  char v7 = (void *)[v5 copy];
  return v7;
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  id v8 = [a1 unarchivedObjectClasses];
  objc_super v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (NSArray)cellularNetworks
{
  return self->_cellularNetworks;
}

- (void).cxx_destruct
{
}

@end