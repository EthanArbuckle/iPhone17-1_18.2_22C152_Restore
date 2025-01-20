@interface STAccountState
- (BOOL)canCloudKitMirror;
- (NSError)cloudkitError;
- (NSError)familyError;
- (NSString)appleID;
- (STFamily)family;
- (STUserDescription)currentUserDescription;
- (void)setAppleID:(id)a3;
- (void)setCanCloudKitMirror:(BOOL)a3;
- (void)setCloudkitError:(id)a3;
- (void)setCurrentUserDescription:(id)a3;
- (void)setFamily:(id)a3;
- (void)setFamilyError:(id)a3;
@end

@implementation STAccountState

- (STUserDescription)currentUserDescription
{
  return self->_currentUserDescription;
}

- (void)setCurrentUserDescription:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (BOOL)canCloudKitMirror
{
  return self->_canCloudKitMirror;
}

- (void)setCanCloudKitMirror:(BOOL)a3
{
  self->_canCloudKitMirror = a3;
}

- (NSError)cloudkitError
{
  return self->_cloudkitError;
}

- (void)setCloudkitError:(id)a3
{
}

- (STFamily)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
}

- (NSError)familyError
{
  return self->_familyError;
}

- (void)setFamilyError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyError, 0);
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_cloudkitError, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_currentUserDescription, 0);
}

@end