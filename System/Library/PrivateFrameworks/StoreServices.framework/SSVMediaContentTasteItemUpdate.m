@interface SSVMediaContentTasteItemUpdate
+ (BOOL)supportsSecureCoding;
- (NSDate)updateDate;
- (SSVMediaContentTasteItem)item;
- (SSVMediaContentTasteItemUpdate)initWithCoder:(id)a3;
- (SSVMediaContentTasteItemUpdate)initWithXPCEncoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
- (void)setUpdateDate:(id)a3;
@end

@implementation SSVMediaContentTasteItemUpdate

- (void)encodeWithCoder:(id)a3
{
  item = self->_item;
  id v5 = a3;
  [v5 encodeObject:item forKey:@"SSVMediaContentTasteItemUpdateItem"];
  [v5 encodeObject:self->_updateDate forKey:@"SSVMediaContentTasteItemUpdateUpdateDate"];
}

- (SSVMediaContentTasteItemUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SSVMediaContentTasteItemUpdate *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSVMediaContentTasteItemUpdateItem"];
    item = v5->_item;
    v5->_item = (SSVMediaContentTasteItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSVMediaContentTasteItemUpdateUpdateDate"];
    updateDate = v5->_updateDate;
    v5->_updateDate = (NSDate *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSVMediaContentTasteItemUpdate)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(v4, v5);

  v7 = (SSVMediaContentTasteItemUpdate *)NSSecureCodingObjectForXPCObject;
  return v7;
}

- (SSVMediaContentTasteItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (void)setUpdateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end