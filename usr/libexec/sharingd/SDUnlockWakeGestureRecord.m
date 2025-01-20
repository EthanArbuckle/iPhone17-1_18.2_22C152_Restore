@interface SDUnlockWakeGestureRecord
- (BOOL)onWrist;
- (NSDate)date;
- (id)description;
- (void)setDate:(id)a3;
- (void)setOnWrist:(BOOL)a3;
@end

@implementation SDUnlockWakeGestureRecord

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(SDUnlockWakeGestureRecord *)self date];
  unsigned int v6 = [(SDUnlockWakeGestureRecord *)self onWrist];
  CFStringRef v7 = @"NO";
  if (v6) {
    CFStringRef v7 = @"YES";
  }
  v8 = +[NSString stringWithFormat:@"<%@: %p, date:%@, on wrist:%@>", v4, self, v5, v7];

  return v8;
}

- (BOOL)onWrist
{
  return self->_onWrist;
}

- (void)setOnWrist:(BOOL)a3
{
  self->_onWrist = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end