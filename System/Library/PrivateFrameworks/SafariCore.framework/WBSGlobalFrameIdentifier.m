@interface WBSGlobalFrameIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)webFrameID;
- (NSNumber)webPageID;
- (WBSGlobalFrameIdentifier)initWithCoder:(id)a3;
- (WBSGlobalFrameIdentifier)initWithPageID:(id)a3 frameID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSGlobalFrameIdentifier

- (WBSGlobalFrameIdentifier)initWithPageID:(id)a3 frameID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSGlobalFrameIdentifier;
  v9 = [(WBSGlobalFrameIdentifier *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webPageID, a3);
    objc_storeStrong((id *)&v10->_webFrameID, a4);
    v11 = v10;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[WBSGlobalFrameIdentifier allocWithZone:a3];
  webPageID = self->_webPageID;
  webFrameID = self->_webFrameID;
  return [(WBSGlobalFrameIdentifier *)v4 initWithPageID:webPageID frameID:webFrameID];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    webPageID = self->_webPageID;
    id v7 = [v5 webPageID];
    if ([(NSNumber *)webPageID isEqual:v7])
    {
      webFrameID = self->_webFrameID;
      v9 = [v5 webFrameID];
      char v10 = [(NSNumber *)webFrameID isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSNumber *)self->_webPageID unsignedIntegerValue];
  return [(NSNumber *)self->_webFrameID unsignedIntegerValue] ^ v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"FrameIdentifier (%p): { pageID: %@, frameID: %@ }", self, self->_webPageID, self->_webFrameID];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSGlobalFrameIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSGlobalFrameIdentifier;
  id v5 = [(WBSGlobalFrameIdentifier *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webPageID"];
    webPageID = v5->_webPageID;
    v5->_webPageID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webFrameID"];
    webFrameID = v5->_webFrameID;
    v5->_webFrameID = (NSNumber *)v8;

    char v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  webPageID = self->_webPageID;
  id v5 = a3;
  [v5 encodeObject:webPageID forKey:@"webPageID"];
  [v5 encodeObject:self->_webFrameID forKey:@"webFrameID"];
}

- (NSNumber)webPageID
{
  return self->_webPageID;
}

- (NSNumber)webFrameID
{
  return self->_webFrameID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webFrameID, 0);
  objc_storeStrong((id *)&self->_webPageID, 0);
}

@end