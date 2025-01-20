@interface ICMusicLibraryAuthToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isExpired;
- (BOOL)isFrozen;
- (ICMusicLibraryAuthToken)initWithBlock:(id)a3;
- (ICMusicLibraryAuthToken)initWithCoder:(id)a3;
- (NSDate)expirationDate;
- (NSString)deviceGUID;
- (NSString)token;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceGUID:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setToken:(id)a3;
@end

@implementation ICMusicLibraryAuthToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)token
{
  return self->_token;
}

- (void)setDeviceGUID:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMusicLibraryAuthToken.m" lineNumber:81 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  deviceGUID = self->_deviceGUID;
  self->_deviceGUID = v6;
}

- (void)setExpirationDate:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMusicLibraryAuthToken.m" lineNumber:76 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSDate *)[v5 copy];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v6;
}

- (void)setToken:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMusicLibraryAuthToken.m" lineNumber:71 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  token = self->_token;
  self->_token = v6;
}

- (ICMusicLibraryAuthToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMusicLibraryAuthToken;
  id v5 = [(ICMusicLibraryAuthToken *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    token = v5->_token;
    v5->_token = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceGUID"];
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  token = self->_token;
  id v5 = a3;
  [v5 encodeObject:token forKey:@"token"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeObject:self->_deviceGUID forKey:@"deviceGUID"];
}

- (BOOL)isExpired
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = [(ICMusicLibraryAuthToken *)self expirationDate];
  BOOL v5 = [v3 compare:v4] == 1;

  return v5;
}

- (ICMusicLibraryAuthToken)initWithBlock:(id)a3
{
  id v4 = (void (**)(id, ICMusicLibraryAuthToken *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMusicLibraryAuthToken;
  BOOL v5 = [(ICMusicLibraryAuthToken *)&v7 init];
  if (v5)
  {
    v4[2](v4, v5);
    v5->_frozen = 1;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end