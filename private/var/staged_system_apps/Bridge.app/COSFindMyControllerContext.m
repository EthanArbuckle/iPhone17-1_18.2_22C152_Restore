@interface COSFindMyControllerContext
- (FAFamilyMember)member;
- (NRDevice)device;
- (void)setDevice:(id)a3;
- (void)setMember:(id)a3;
@end

@implementation COSFindMyControllerContext

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (FAFamilyMember)member
{
  return self->_member;
}

- (void)setMember:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end