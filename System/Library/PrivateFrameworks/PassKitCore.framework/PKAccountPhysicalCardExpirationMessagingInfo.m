@interface PKAccountPhysicalCardExpirationMessagingInfo
+ (BOOL)supportsSecureCoding;
- (NSString)physicalCardIdentifier;
- (PKAccountPhysicalCardExpirationMessagingInfo)initWithCoder:(id)a3;
- (PKAccountPhysicalCardExpirationMessagingInfo)initWithDictionary:(id)a3;
- (int64_t)scatterInterval;
- (unint64_t)messagingType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountPhysicalCardExpirationMessagingInfo

- (PKAccountPhysicalCardExpirationMessagingInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountPhysicalCardExpirationMessagingInfo;
  v5 = [(PKAccountPhysicalCardExpirationMessagingInfo *)&v14 init];
  if (!v5) {
    goto LABEL_8;
  }
  v5->_scatterInterval = [v4 PKIntegerForKey:@"scatterInterval"];
  uint64_t v6 = [v4 PKStringForKey:@"physicalCardIdentifier"];
  physicalCardIdentifier = v5->_physicalCardIdentifier;
  v5->_physicalCardIdentifier = (NSString *)v6;

  v8 = [v4 PKStringForKey:@"messagingType"];
  uint64_t v9 = PKAccountPhysicalCardExpirationMessagingTypeFromString(v8);
  v5->_messagingType = v9;
  v10 = v5->_physicalCardIdentifier;

  if (!v10 || v9 == 0) {
    v12 = 0;
  }
  else {
LABEL_8:
  }
    v12 = v5;

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t scatterInterval = self->_scatterInterval;
  id v5 = a3;
  [v5 encodeInteger:scatterInterval forKey:@"scatterInterval"];
  [v5 encodeObject:self->_physicalCardIdentifier forKey:@"physicalCardIdentifier"];
  [v5 encodeInteger:self->_messagingType forKey:@"messagingType"];
}

- (PKAccountPhysicalCardExpirationMessagingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountPhysicalCardExpirationMessagingInfo;
  id v5 = [(PKAccountPhysicalCardExpirationMessagingInfo *)&v9 init];
  if (v5)
  {
    v5->_int64_t scatterInterval = [v4 decodeIntegerForKey:@"scatterInterval"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"physicalCardIdentifier"];
    physicalCardIdentifier = v5->_physicalCardIdentifier;
    v5->_physicalCardIdentifier = (NSString *)v6;

    v5->_messagingType = [v4 decodeIntegerForKey:@"messagingType"];
  }

  return v5;
}

- (int64_t)scatterInterval
{
  return self->_scatterInterval;
}

- (NSString)physicalCardIdentifier
{
  return self->_physicalCardIdentifier;
}

- (unint64_t)messagingType
{
  return self->_messagingType;
}

- (void).cxx_destruct
{
}

@end