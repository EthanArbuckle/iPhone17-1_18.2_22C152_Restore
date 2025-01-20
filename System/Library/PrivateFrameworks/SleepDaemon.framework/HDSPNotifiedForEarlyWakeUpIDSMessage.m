@interface HDSPNotifiedForEarlyWakeUpIDSMessage
- (HDSPNotifiedForEarlyWakeUpIDSMessage)initWithCoder:(id)a3;
- (NSString)identifier;
- (unint64_t)destinations;
@end

@implementation HDSPNotifiedForEarlyWakeUpIDSMessage

- (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unint64_t)destinations
{
  return 3;
}

- (HDSPNotifiedForEarlyWakeUpIDSMessage)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HDSPNotifiedForEarlyWakeUpIDSMessage;
  v3 = [(HDSPNotifiedForEarlyWakeUpIDSMessage *)&v7 init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

@end