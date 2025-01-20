@interface NSSWatchFace
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (NSArray)selectedFocusModeIdentifiers;
- (NSSWatchFace)initWithCoder:(id)a3;
- (NSString)faceDisplayName;
- (NSUUID)faceIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setFaceDisplayName:(id)a3;
- (void)setFaceIdentifier:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setSelectedFocusModeIdentifiers:(id)a3;
@end

@implementation NSSWatchFace

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  faceIdentifier = self->_faceIdentifier;
  id v5 = a3;
  [v5 encodeObject:faceIdentifier forKey:@"faceIdentifier"];
  [v5 encodeObject:self->_faceDisplayName forKey:@"faceDisplayName"];
  [v5 encodeBool:self->_isActive forKey:@"isActive"];
  [v5 encodeObject:self->_selectedFocusModeIdentifiers forKey:@"selectedFocusModeIdentifiers"];
}

- (NSSWatchFace)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSSWatchFace;
  id v5 = [(NSSWatchFace *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceIdentifier"];
    faceIdentifier = v5->_faceIdentifier;
    v5->_faceIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceDisplayName"];
    faceDisplayName = v5->_faceDisplayName;
    v5->_faceDisplayName = (NSString *)v8;

    v5->_isActive = [v4 decodeBoolForKey:@"isActive"];
    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"selectedFocusModeIdentifiers"];
    selectedFocusModeIdentifiers = v5->_selectedFocusModeIdentifiers;
    v5->_selectedFocusModeIdentifiers = (NSArray *)v10;
  }
  return v5;
}

- (NSUUID)faceIdentifier
{
  return self->_faceIdentifier;
}

- (void)setFaceIdentifier:(id)a3
{
}

- (NSString)faceDisplayName
{
  return self->_faceDisplayName;
}

- (void)setFaceDisplayName:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSArray)selectedFocusModeIdentifiers
{
  return self->_selectedFocusModeIdentifiers;
}

- (void)setSelectedFocusModeIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFocusModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_faceDisplayName, 0);
  objc_storeStrong((id *)&self->_faceIdentifier, 0);
}

@end