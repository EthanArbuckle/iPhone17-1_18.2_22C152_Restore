@interface ICLibraryAuthServiceClientTokenIdentifier
+ (BOOL)supportsSecureCoding;
- (ICLibraryAuthServiceClientTokenIdentifier)initWithCoder:(id)a3;
- (ICLibraryAuthServiceClientTokenIdentifier)initWithResponseDictionary:(id)a3;
- (NSNumber)DSID;
- (NSString)deviceGUID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICLibraryAuthServiceClientTokenIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGUID, 0);

  objc_storeStrong((id *)&self->_DSID, 0);
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)encodeWithCoder:(id)a3
{
  DSID = self->_DSID;
  id v5 = a3;
  [v5 encodeObject:DSID forKey:@"dsid"];
  [v5 encodeObject:self->_deviceGUID forKey:@"deviceGUID"];
}

- (ICLibraryAuthServiceClientTokenIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICLibraryAuthServiceClientTokenIdentifier;
  id v5 = [(ICLibraryAuthServiceClientTokenIdentifier *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    DSID = v5->_DSID;
    v5->_DSID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceGUID"];
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v8;
  }
  return v5;
}

- (ICLibraryAuthServiceClientTokenIdentifier)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(ICLibraryAuthServiceClientTokenIdentifier *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"dsid"];
    if (_NSIsNSNumber()) {
      objc_storeStrong((id *)&v5->_DSID, v6);
    }
    v7 = [v4 objectForKey:@"deviceGUID"];

    if (_NSIsNSString()) {
      objc_storeStrong((id *)&v5->_deviceGUID, v7);
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end