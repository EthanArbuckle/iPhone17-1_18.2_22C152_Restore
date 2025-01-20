@interface ICInstrumentationUtilitiesRecentPasswordMode
+ (BOOL)supportsSecureCoding;
- (ICInstrumentationUtilitiesRecentPasswordMode)initWithCoder:(id)a3;
- (int64_t)contextPath;
- (signed)lockedNotesMode;
- (void)encodeWithCoder:(id)a3;
- (void)setContextPath:(int64_t)a3;
- (void)setLockedNotesMode:(signed __int16)a3;
@end

@implementation ICInstrumentationUtilitiesRecentPasswordMode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICInstrumentationUtilitiesRecentPasswordMode *)self lockedNotesMode];
  v6 = NSStringFromSelector(sel_lockedNotesMode);
  [v4 encodeInteger:v5 forKey:v6];

  int64_t v7 = [(ICInstrumentationUtilitiesRecentPasswordMode *)self contextPath];
  NSStringFromSelector(sel_contextPath);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v7 forKey:v8];
}

- (ICInstrumentationUtilitiesRecentPasswordMode)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICInstrumentationUtilitiesRecentPasswordMode;
  uint64_t v5 = [(ICInstrumentationUtilitiesRecentPasswordMode *)&v9 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_lockedNotesMode);
    v5->_lockedNotesMode = [v4 decodeIntegerForKey:v6];

    int64_t v7 = NSStringFromSelector(sel_contextPath);
    v5->_contextPath = [v4 decodeIntegerForKey:v7];
  }
  return v5;
}

- (signed)lockedNotesMode
{
  return self->_lockedNotesMode;
}

- (void)setLockedNotesMode:(signed __int16)a3
{
  self->_lockedNotesMode = a3;
}

- (int64_t)contextPath
{
  return self->_contextPath;
}

- (void)setContextPath:(int64_t)a3
{
  self->_contextPath = a3;
}

@end