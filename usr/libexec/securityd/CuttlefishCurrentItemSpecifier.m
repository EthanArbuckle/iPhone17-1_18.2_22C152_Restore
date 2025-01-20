@interface CuttlefishCurrentItemSpecifier
+ (BOOL)supportsSecureCoding;
- (CuttlefishCurrentItemSpecifier)initWithCoder:(id)a3;
- (NSString)itemPtrName;
- (NSString)zoneID;
- (id)description;
- (id)init:(id)a3 zoneID:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setItemPtrName:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CuttlefishCurrentItemSpecifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemPtrName, 0);

  objc_storeStrong((id *)&self->_zoneID, 0);
}

- (void)setItemPtrName:(id)a3
{
}

- (NSString)itemPtrName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setZoneID:(id)a3
{
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = [(CuttlefishCurrentItemSpecifier *)self zoneID];
  v4 = [(CuttlefishCurrentItemSpecifier *)self itemPtrName];
  v5 = +[NSString stringWithFormat:@"<CuttlefishCurrentItemSpecifier(%@): %@>", v3, v4];

  return v5;
}

- (CuttlefishCurrentItemSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CuttlefishCurrentItemSpecifier;
  v5 = [(CuttlefishCurrentItemSpecifier *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemPtrName"];
    itemPtrName = v5->_itemPtrName;
    v5->_itemPtrName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CuttlefishCurrentItemSpecifier *)self itemPtrName];
  [v4 encodeObject:v5 forKey:@"itemPtrName"];

  id v6 = [(CuttlefishCurrentItemSpecifier *)self zoneID];
  [v4 encodeObject:v6 forKey:@"zoneID"];
}

- (id)init:(id)a3 zoneID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuttlefishCurrentItemSpecifier;
  v9 = [(CuttlefishCurrentItemSpecifier *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemPtrName, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end