@interface MSDFetchCKDataOptions
- (BOOL)createNewZoneIfMissing;
- (BOOL)userInitiatedRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCreateNewZoneIfMissing:(BOOL)a3;
- (void)setUserInitiatedRequest:(BOOL)a3;
@end

@implementation MSDFetchCKDataOptions

- (id)description
{
  CFStringRef v2 = @"YES";
  if (self->_createNewZoneIfMissing) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  if (!self->_userInitiatedRequest) {
    CFStringRef v2 = @"NO";
  }
  return +[NSString stringWithFormat:@"<MSDFetchCKDataOptions: createNewZoneIfMissing: %@ userInitiatedRequest: %@>", v3, v2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  [v4 setCreateNewZoneIfMissing:-[MSDFetchCKDataOptions createNewZoneIfMissing](self, "createNewZoneIfMissing")];
  [v4 setUserInitiatedRequest:-[MSDFetchCKDataOptions userInitiatedRequest](self, "userInitiatedRequest")];
  return v4;
}

- (BOOL)createNewZoneIfMissing
{
  return self->_createNewZoneIfMissing;
}

- (void)setCreateNewZoneIfMissing:(BOOL)a3
{
  self->_createNewZoneIfMissing = a3;
}

- (BOOL)userInitiatedRequest
{
  return self->_userInitiatedRequest;
}

- (void)setUserInitiatedRequest:(BOOL)a3
{
  self->_userInitiatedRequest = a3;
}

@end