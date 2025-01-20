@interface CKKSCurrentItemData
- (CKKSCurrentItemData)initWithUUID:(id)a3;
- (NSDate)modificationDate;
- (NSString)uuid;
- (id)description;
- (void)setModificationDate:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CKKSCurrentItemData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setModificationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = [(CKKSCurrentItemData *)self uuid];
  v4 = [(CKKSCurrentItemData *)self modificationDate];
  v5 = +[NSString stringWithFormat:@"CKKSCurrentItemData(%@, mtime: %@)", v3, v4];

  return v5;
}

- (CKKSCurrentItemData)initWithUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSCurrentItemData;
  v5 = [(CKKSCurrentItemData *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(CKKSCurrentItemData *)v5 setUuid:v4];
    v7 = v6;
  }

  return v6;
}

@end