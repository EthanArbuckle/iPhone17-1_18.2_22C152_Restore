@interface PKRecentContact
- (int64_t)contactID;
- (void)setContactID:(int64_t)a3;
@end

@implementation PKRecentContact

- (int64_t)contactID
{
  return self->_contactID;
}

- (void)setContactID:(int64_t)a3
{
  self->_contactID = a3;
}

@end