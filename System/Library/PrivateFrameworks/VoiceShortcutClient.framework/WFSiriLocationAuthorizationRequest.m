@interface WFSiriLocationAuthorizationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)needsPreciseLocation;
- (WFSiriLocationAuthorizationRequest)initWithCoder:(id)a3;
- (WFSiriLocationAuthorizationRequest)initWithNeedsPreciseLocation:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSiriLocationAuthorizationRequest

- (BOOL)needsPreciseLocation
{
  return self->_needsPreciseLocation;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFSiriLocationAuthorizationRequest;
  id v4 = a3;
  [(WFSiriActionRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[WFSiriLocationAuthorizationRequest needsPreciseLocation](self, "needsPreciseLocation", v5.receiver, v5.super_class), @"needsPreciseLocation");
}

- (WFSiriLocationAuthorizationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSiriLocationAuthorizationRequest;
  objc_super v5 = [(WFSiriActionRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_needsPreciseLocation = [v4 decodeBoolForKey:@"needsPreciseLocation"];
    v6 = v5;
  }

  return v5;
}

- (WFSiriLocationAuthorizationRequest)initWithNeedsPreciseLocation:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFSiriLocationAuthorizationRequest;
  id v4 = [(WFSiriActionRequest *)&v8 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_needsPreciseLocation = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end