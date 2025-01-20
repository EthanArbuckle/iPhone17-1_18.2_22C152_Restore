@interface PSIAsset
- (BOOL)isUpdate;
- (PSIAsset)initWithUUID:(id)a3 creationDate:(id)a4;
- (PSIDate)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)objectType;
- (unint64_t)propertySets;
- (void)setPropertySets:(unint64_t)a3;
@end

@implementation PSIAsset

- (void).cxx_destruct
{
}

- (void)setPropertySets:(unint64_t)a3
{
  self->_propertySets = a3;
}

- (unint64_t)propertySets
{
  return self->_propertySets;
}

- (PSIDate)creationDate
{
  return (PSIDate *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isUpdate
{
  unint64_t propertySets = self->_propertySets;
  return propertySets != 3 && propertySets != 0;
}

- (unint64_t)objectType
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSIAsset;
  v4 = [(PSIObject *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 5, self->_creationDate);
  return v4;
}

- (PSIAsset)initWithUUID:(id)a3 creationDate:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSIAsset;
  v8 = [(PSIObject *)&v11 initWithUUID:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_creationDate, a4);
  }

  return v9;
}

@end