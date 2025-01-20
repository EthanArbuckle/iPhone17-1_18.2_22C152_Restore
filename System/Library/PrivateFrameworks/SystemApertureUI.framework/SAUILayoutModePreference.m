@interface SAUILayoutModePreference
- (BOOL)layoutModePreferenceMayBeImplicitlyInvalidated;
- (NSString)description;
- (SAUILayoutModePreference)initWithPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (int64_t)layoutModeChangeReason;
- (int64_t)preferredLayoutMode;
@end

@implementation SAUILayoutModePreference

- (SAUILayoutModePreference)initWithPreferredLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SAUILayoutModePreference;
  result = [(SAUILayoutModePreference *)&v7 init];
  if (result)
  {
    result->_preferredLayoutMode = a3;
    result->_layoutModeChangeReason = a4;
  }
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = SAUIStringFromElementViewLayoutMode(self->_preferredLayoutMode);
  v6 = SAUIStringFromLayoutModeChangeReason(self->_layoutModeChangeReason);
  objc_super v7 = objc_msgSend(v3, "initWithFormat:", @"<%@: %p; _preferredLayoutMode: %@; _layoutModeChangeReason: %@>",
                 v4,
                 self,
                 v5,
                 v6);

  return (NSString *)v7;
}

- (BOOL)layoutModePreferenceMayBeImplicitlyInvalidated
{
  return ((self->_layoutModeChangeReason - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (int64_t)layoutModeChangeReason
{
  return self->_layoutModeChangeReason;
}

@end