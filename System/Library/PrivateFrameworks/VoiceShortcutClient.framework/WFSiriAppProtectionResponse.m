@interface WFSiriAppProtectionResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)didUnlock;
- (WFSiriAppProtectionResponse)initWithCoder:(id)a3;
- (WFSiriAppProtectionResponse)initWithDidUnlock:(BOOL)a3 andError:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriAppProtectionResponse

- (BOOL)didUnlock
{
  return self->_didUnlock;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFSiriAppProtectionResponse;
  id v4 = a3;
  [(WFSiriActionResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[WFSiriAppProtectionResponse didUnlock](self, "didUnlock", v5.receiver, v5.super_class), @"didUnlock");
}

- (WFSiriAppProtectionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSiriAppProtectionResponse;
  objc_super v5 = [(WFSiriActionResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_didUnlock = [v4 decodeBoolForKey:@"didUnlock"];
    v6 = v5;
  }

  return v5;
}

- (WFSiriAppProtectionResponse)initWithDidUnlock:(BOOL)a3 andError:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFSiriAppProtectionResponse;
  objc_super v5 = [(WFSiriActionResponse *)&v9 initWithError:a4];
  v6 = v5;
  if (v5)
  {
    v5->_didUnlock = a3;
    v7 = v5;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end