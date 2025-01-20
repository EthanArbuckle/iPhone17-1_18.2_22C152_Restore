@interface SPItemSharingDataIntegrity
+ (BOOL)supportsSecureCoding;
- (NSArray)memberCircles;
- (NSArray)ownedCircles;
- (SPItemSharingDataIntegrity)initWithCoder:(id)a3;
- (SPItemSharingDataIntegrity)initWithOwnedCircles:(id)a3 memberCircles:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMemberCircles:(id)a3;
- (void)setOwnedCircles:(id)a3;
@end

@implementation SPItemSharingDataIntegrity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPItemSharingDataIntegrity)initWithOwnedCircles:(id)a3 memberCircles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPItemSharingDataIntegrity;
  v9 = [(SPItemSharingDataIntegrity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ownedCircles, a3);
    objc_storeStrong((id *)&v10->_memberCircles, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPItemSharingDataIntegrity alloc];
  v5 = [(SPItemSharingDataIntegrity *)self ownedCircles];
  v6 = [(SPItemSharingDataIntegrity *)self memberCircles];
  id v7 = [(SPItemSharingDataIntegrity *)v4 initWithOwnedCircles:v5 memberCircles:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  ownedCircles = self->_ownedCircles;
  id v5 = a3;
  [v5 encodeObject:ownedCircles forKey:@"ownedCircles"];
  [v5 encodeObject:self->_memberCircles forKey:@"memberCircles"];
}

- (SPItemSharingDataIntegrity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"ownedCircles"];
  ownedCircles = self->_ownedCircles;
  self->_ownedCircles = v5;

  id v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"memberCircles"];

  memberCircles = self->_memberCircles;
  self->_memberCircles = v7;

  return self;
}

- (NSArray)ownedCircles
{
  return self->_ownedCircles;
}

- (void)setOwnedCircles:(id)a3
{
}

- (NSArray)memberCircles
{
  return self->_memberCircles;
}

- (void)setMemberCircles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberCircles, 0);

  objc_storeStrong((id *)&self->_ownedCircles, 0);
}

@end