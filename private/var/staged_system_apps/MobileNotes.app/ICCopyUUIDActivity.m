@interface ICCopyUUIDActivity
- (ICCopyUUIDActivity)initWithUUIDString:(id)a3;
- (NSString)uuidString;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setUuidString:(id)a3;
@end

@implementation ICCopyUUIDActivity

- (ICCopyUUIDActivity)initWithUUIDString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCopyUUIDActivity;
  v6 = [(ICCopyUUIDActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuidString, a3);
  }

  return v7;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"tag"];
}

- (id)activityTitle
{
  return @"Copy UUID (Internal)";
}

- (id)activityType
{
  return @"com.apple.mobilenotes.copyUUID";
}

- (void)performActivityWithCompletion:(id)a3
{
  v7 = (void (**)(id, uint64_t, void *))a3;
  v4 = [(ICCopyUUIDActivity *)self uuidString];
  id v5 = +[UIPasteboard generalPasteboard];
  [v5 setString:v4];

  [(ICCopyUUIDActivity *)self activityDidFinish:1];
  if (v7)
  {
    v6 = [(ICCopyUUIDActivity *)self activityType];
    v7[2](v7, 1, v6);
  }
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end