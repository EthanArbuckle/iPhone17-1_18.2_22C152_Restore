@interface PXPhotoKitAssetCollectionShowPersonInfoAction
- (CNContact)contact;
- (int64_t)type;
- (void)setContact:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PXPhotoKitAssetCollectionShowPersonInfoAction

- (void).cxx_destruct
{
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

@end