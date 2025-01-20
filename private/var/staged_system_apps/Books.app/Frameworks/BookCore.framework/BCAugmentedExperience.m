@interface BCAugmentedExperience
- (BCAugmentedExperiencePoint)location;
- (BCAugmentedExperiencePresenting)presenter;
- (BOOL)enabled;
- (BOOL)pageProgressionIsRTL;
- (BOOL)skipToast;
- (NSString)version;
- (double)delay;
- (id)description;
- (int64_t)kind;
- (void)setDelay:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setKind:(int64_t)a3;
- (void)setLocation:(id)a3;
- (void)setPageProgressionIsRTL:(BOOL)a3;
- (void)setPresenter:(id)a3;
- (void)setSkipToast:(BOOL)a3;
- (void)setVersion:(id)a3;
@end

@implementation BCAugmentedExperience

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"BCAugmentedExperience\n"];
  v4 = [(BCAugmentedExperience *)self location];
  [v3 appendFormat:@"    location  . . . . . . . . : %@\n", v4];

  [(BCAugmentedExperience *)self delay];
  [v3 appendFormat:@"    delay . . . . . . . . . . : %f\n", v5];
  [v3 appendFormat:@"    kind  . . . . . . . . . . : %ld\n", [self kind]];
  if ([(BCAugmentedExperience *)self enabled]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  [v3 appendFormat:@"    enabled . . . . . . . . . : %@\n", v6];
  if ([(BCAugmentedExperience *)self skipToast]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v3 appendFormat:@"    skipToast . . . . . . . . : %@\n", v7];
  v8 = [(BCAugmentedExperience *)self presenter];
  [v3 appendFormat:@"    presenter . . . . . . . . : %@", v8];

  return v3;
}

- (BCAugmentedExperiencePresenting)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (BCAugmentedExperiencePoint)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)skipToast
{
  return self->_skipToast;
}

- (void)setSkipToast:(BOOL)a3
{
  self->_skipToast = a3;
}

- (BOOL)pageProgressionIsRTL
{
  return self->_pageProgressionIsRTL;
}

- (void)setPageProgressionIsRTL:(BOOL)a3
{
  self->_pageProgressionIsRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_presenter, 0);
}

@end