@interface NRDDecryptedIdentifier
- (id)description;
@end

@implementation NRDDecryptedIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrUUID, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self)
  {
    uint64_t version = self->_version;
    v5 = self->_identity;
    nrUUID = self->_nrUUID;
  }
  else
  {
    v5 = 0;
    uint64_t version = 0;
    nrUUID = 0;
  }
  id v7 = [v3 initWithFormat:@"%u/%@/%@", version, v5, nrUUID];

  return v7;
}

@end