@interface MFGeneratedSummaryCollectionItemID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMCollectionItemID)anchorMessageItemID;
- (MFGeneratedSummaryCollectionItemID)initWithAnchorMessageItemID:(id)a3;
- (MFGeneratedSummaryCollectionItemID)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MFGeneratedSummaryCollectionItemID

- (MFGeneratedSummaryCollectionItemID)initWithAnchorMessageItemID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFGeneratedSummaryCollectionItemID;
  v6 = (MFGeneratedSummaryCollectionItemID *)[(MFGeneratedSummaryCollectionItemID *)&v9 initAsEphemeralID:1];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_anchorMessageItemID, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MFGeneratedSummaryCollectionItemID *)a3;
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (([(MFGeneratedSummaryCollectionItemID *)self isEphemeral] & 1) != 0
        || [(MFGeneratedSummaryCollectionItemID *)v5 isEphemeral])
      {
        v10.receiver = self;
        v10.super_class = (Class)MFGeneratedSummaryCollectionItemID;
        unsigned __int8 v6 = [(MFGeneratedSummaryCollectionItemID *)&v10 isEqual:v5];
      }
      else
      {
        v7 = [(MFGeneratedSummaryCollectionItemID *)self anchorMessageItemID];
        v8 = [(MFGeneratedSummaryCollectionItemID *)v5 anchorMessageItemID];
        unsigned __int8 v6 = [v7 isEqual:v8];
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ([(MFGeneratedSummaryCollectionItemID *)self isEphemeral])
  {
    v6.receiver = self;
    v6.super_class = (Class)MFGeneratedSummaryCollectionItemID;
    return [(MFGeneratedSummaryCollectionItemID *)&v6 hash];
  }
  else
  {
    v4 = [(MFGeneratedSummaryCollectionItemID *)self anchorMessageItemID];
    id v3 = [v4 hash];
  }
  return (unint64_t)v3;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  id v5 = [(MFGeneratedSummaryCollectionItemID *)self anchorMessageItemID];
  id v6 = [v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFGeneratedSummaryCollectionItemID)initWithCoder:(id)a3
{
  id v8 = a3;
  objc_super v9 = self;
  uint64_t v4 = self;
  id v5 = v8;
  EFDecodeCacheableInstance();
  id v6 = (MFGeneratedSummaryCollectionItemID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (EMCollectionItemID)anchorMessageItemID
{
  return (EMCollectionItemID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end