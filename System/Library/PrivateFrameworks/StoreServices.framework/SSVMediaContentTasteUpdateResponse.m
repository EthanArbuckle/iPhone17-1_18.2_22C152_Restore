@interface SSVMediaContentTasteUpdateResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isCachedResponse;
- (NSArray)contentTasteItems;
- (NSDate)expirationDate;
- (NSString)description;
- (SSVMediaContentTasteUpdateResponse)initWithCoder:(id)a3;
- (SSVMediaContentTasteUpdateResponse)initWithXPCEncoding:(id)a3;
- (unint64_t)responseRevisionID;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedResponse:(BOOL)a3;
- (void)setContentTasteItems:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setResponseRevisionID:(unint64_t)a3;
@end

@implementation SSVMediaContentTasteUpdateResponse

- (void)encodeWithCoder:(id)a3
{
  contentTasteItems = self->_contentTasteItems;
  id v5 = a3;
  [v5 encodeObject:contentTasteItems forKey:@"SSVMediaContentTasteUpdateResponseContentTasteItems"];
  [v5 encodeObject:self->_expirationDate forKey:@"SSVMediaContentTasteUpdateResponseExpirationDate"];
  [v5 encodeInt64:self->_responseRevisionID forKey:@"SSVMediaContentTasteUpdateResponseResponseRevisionID"];
}

- (SSVMediaContentTasteUpdateResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SSVMediaContentTasteUpdateResponse *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"SSVMediaContentTasteUpdateResponseContentTasteItems"];
    contentTasteItems = v5->_contentTasteItems;
    v5->_contentTasteItems = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSVMediaContentTasteUpdateResponseExpirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v11;

    v5->_responseRevisionID = [v4 decodeInt64ForKey:@"SSVMediaContentTasteUpdateResponseResponseRevisionID"];
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self->_cachedResponse) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"<%@ %p contentTasteItems:%@ expirationDate:%@ responseRevisionID:%llu isCachedResponse:%@>", v5, self, *(_OWORD *)&self->_contentTasteItems, self->_responseRevisionID, v7];

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSVMediaContentTasteUpdateResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(v4, v5);

  uint64_t v7 = (SSVMediaContentTasteUpdateResponse *)NSSecureCodingObjectForXPCObject;
  return v7;
}

- (NSArray)contentTasteItems
{
  return self->_contentTasteItems;
}

- (void)setContentTasteItems:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (unint64_t)responseRevisionID
{
  return self->_responseRevisionID;
}

- (void)setResponseRevisionID:(unint64_t)a3
{
  self->_responseRevisionID = a3;
}

- (BOOL)isCachedResponse
{
  return self->_cachedResponse;
}

- (void)setCachedResponse:(BOOL)a3
{
  self->_cachedResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_contentTasteItems, 0);
}

@end