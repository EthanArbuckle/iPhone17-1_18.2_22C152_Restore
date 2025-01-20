@interface WFSiriPunchOutResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldPunchOut;
- (WFSiriPunchOutResponse)initWithCoder:(id)a3;
- (WFSiriPunchOutResponse)initWithShouldPunchOut:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriPunchOutResponse

- (BOOL)shouldPunchOut
{
  return self->_shouldPunchOut;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFSiriPunchOutResponse;
  id v4 = a3;
  [(WFSiriActionResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[WFSiriPunchOutResponse shouldPunchOut](self, "shouldPunchOut", v5.receiver, v5.super_class), @"shouldPunchOut");
}

- (WFSiriPunchOutResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSiriPunchOutResponse;
  objc_super v5 = [(WFSiriActionResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_shouldPunchOut = [v4 decodeBoolForKey:@"shouldPunchOut"];
    v6 = v5;
  }

  return v5;
}

- (WFSiriPunchOutResponse)initWithShouldPunchOut:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFSiriPunchOutResponse;
  id v4 = [(WFSiriActionResponse *)&v8 initWithError:0];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_shouldPunchOut = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end