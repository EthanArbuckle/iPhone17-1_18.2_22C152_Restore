@interface SpatialSoundProfileRecord
+ (BOOL)supportsSecureCoding;
- (NSData)soundProfileData;
- (NSURL)soundProfileFileURL;
- (SpatialSoundProfileRecord)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSoundProfileData:(id)a3;
- (void)setSoundProfileFileURL:(id)a3;
@end

@implementation SpatialSoundProfileRecord

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(SpatialSoundProfileRecord *)self soundProfileData];
  v5 = NSStringFromSelector(sel_soundProfileData);
  [v4 encodeObject:v6 forKey:v5];
}

- (SpatialSoundProfileRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SpatialSoundProfileRecord;
  v5 = [(SpatialSoundProfileRecord *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_soundProfileData);
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(SpatialSoundProfileRecord *)v5 setSoundProfileData:v8];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = NSString;
  v3 = [(SpatialSoundProfileRecord *)self soundProfileData];
  id v4 = [v2 stringWithFormat:@"SpatialSoundProfileRecord: %@", v3];

  return v4;
}

- (NSData)soundProfileData
{
  return self->_soundProfileData;
}

- (void)setSoundProfileData:(id)a3
{
}

- (NSURL)soundProfileFileURL
{
  return self->_soundProfileFileURL;
}

- (void)setSoundProfileFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundProfileFileURL, 0);
  objc_storeStrong((id *)&self->_soundProfileData, 0);
}

@end