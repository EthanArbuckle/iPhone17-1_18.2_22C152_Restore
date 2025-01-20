@interface WBSScribbleRequest
+ (BOOL)supportsSecureCoding;
- (CGPoint)location;
- (NSDictionary)arguments;
- (NSString)functionBody;
- (WBSScribbleRequest)initWithCoder:(id)a3;
- (WBSScribbleRequest)initWithLocation:(CGPoint)a3;
- (unint64_t)requestID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSScribbleRequest

- (WBSScribbleRequest)initWithLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)WBSScribbleRequest;
  v5 = [(WBSScribbleRequest *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_location.CGFloat x = x;
    v5->_location.CGFloat y = y;
    uint64_t v7 = nextRequestID++;
    v5->_requestID = v7;
    v8 = v5;
  }

  return v6;
}

- (WBSScribbleRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSScribbleRequest;
  v5 = [(WBSScribbleRequest *)&v11 init];
  if (v5)
  {
    v5->_requestID = (int)[v4 decodeIntForKey:@"requestID"];
    [v4 decodeFloatForKey:@"x"];
    CGFloat v7 = v6;
    [v4 decodeFloatForKey:@"y"];
    v5->_location.CGFloat x = v7;
    v5->_location.CGFloat y = v8;
    v9 = v5;
  }

  return v5;
}

- (NSString)functionBody
{
  return (NSString *)@"return ScribbleControllerJS.elementInfoAtPoint(x, y, requestID)";
}

- (NSDictionary)arguments
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"x";
  v3 = [NSNumber numberWithDouble:self->_location.x];
  v9[0] = v3;
  v8[1] = @"y";
  id v4 = [NSNumber numberWithDouble:self->_location.y];
  v9[1] = v4;
  v8[2] = @"requestID";
  v5 = [NSNumber numberWithUnsignedInteger:self->_requestID];
  v9[2] = v5;
  float v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t requestID_low = LODWORD(self->_requestID);
  id v7 = a3;
  [v7 encodeInt:requestID_low forKey:@"requestID"];
  CGFloat x = self->_location.x;
  *(float *)&CGFloat x = x;
  [v7 encodeFloat:@"x" forKey:x];
  CGFloat y = self->_location.y;
  *(float *)&CGFloat y = y;
  [v7 encodeFloat:@"y" forKey:y];
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

@end