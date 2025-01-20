@interface TUMomentDescriptor
+ (BOOL)supportsSecureCoding;
- (NSString)photosAssetIdentifier;
- (NSURL)photoViewingAppURL;
- (TUMomentDescriptor)init;
- (TUMomentDescriptor)initWithCoder:(id)a3;
- (TUMomentDescriptor)initWithPhotosAppAssetIdentifier:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUMomentDescriptor

- (TUMomentDescriptor)initWithPhotosAppAssetIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUMomentDescriptor;
  v6 = [(TUMomentDescriptor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photosAssetIdentifier, a3);
  }

  return v7;
}

- (TUMomentDescriptor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUMomentDescriptor.m", 25, @"%s is unavailable", "-[TUMomentDescriptor init]");

  return 0;
}

- (NSURL)photoViewingAppURL
{
  v2 = NSString;
  v3 = [(TUMomentDescriptor *)self photosAssetIdentifier];
  v4 = [v2 stringWithFormat:@"photos://asset?identifier=%@&albumname=camera-roll", v3];

  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  return (NSURL *)v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUMomentDescriptor *)self photosAssetIdentifier];
  [v3 appendFormat:@" pAI=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (TUMomentDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_photosAssetIdentifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = [(TUMomentDescriptor *)self initWithPhotosAppAssetIdentifier:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(TUMomentDescriptor *)self photosAssetIdentifier];
  uint64_t v5 = NSStringFromSelector(sel_photosAssetIdentifier);
  [v4 encodeObject:v6 forKey:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)photosAssetIdentifier
{
  return self->_photosAssetIdentifier;
}

- (void).cxx_destruct
{
}

@end