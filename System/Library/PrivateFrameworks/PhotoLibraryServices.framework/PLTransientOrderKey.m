@interface PLTransientOrderKey
- (NSManagedObjectContext)moc;
- (NSManagedObjectID)objectID;
- (id)childManagedObject;
- (id)description;
- (id)secondaryOrderSortKey;
- (int64_t)orderValue;
- (void)setMoc:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setOrderValue:(int64_t)a3;
@end

@implementation PLTransientOrderKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

- (void)setMoc:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setObjectID:(id)a3
{
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (void)setOrderValue:(int64_t)a3
{
  self->_orderValue = a3;
}

- (int64_t)orderValue
{
  return self->_orderValue;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PLTransientOrderKey;
  v3 = [(PLTransientOrderKey *)&v7 description];
  v4 = [(PLTransientOrderKey *)self objectID];
  v5 = [v3 stringByAppendingFormat:@"%@ %lld", v4, -[PLTransientOrderKey orderValue](self, "orderValue")];

  return v5;
}

- (id)secondaryOrderSortKey
{
  v2 = [(PLTransientOrderKey *)self objectID];
  v3 = [v2 URIRepresentation];
  v4 = [v3 absoluteString];

  return v4;
}

- (id)childManagedObject
{
  v3 = [(PLTransientOrderKey *)self moc];
  v4 = [(PLTransientOrderKey *)self objectID];
  v5 = [v3 existingObjectWithID:v4 error:0];

  return v5;
}

@end