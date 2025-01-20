@interface GTCaptureUpdateHighlight
+ (BOOL)supportsSecureCoding;
- (BOOL)enable;
- (GTCaptureUpdateHighlight)initWithCoder:(id)a3;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setEnable:(BOOL)a3;
- (void)setStreamRef:(unint64_t)a3;
@end

@implementation GTCaptureUpdateHighlight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureUpdateHighlight)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTCaptureUpdateHighlight;
  v5 = [(GTCaptureRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_streamRef = (unint64_t)[v4 decodeInt64ForKey:@"streamRef"];
    v5->_enable = [v4 decodeBoolForKey:@"enable"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTCaptureUpdateHighlight;
  id v4 = a3;
  [(GTCaptureRequest *)&v5 encodeWithCoder:v4];
  [v4 encodeInt64:self->_streamRef forKey:@"streamRef" v5.receiver, v5.super_class];
  [v4 encodeBool:self->_enable forKey:@"enable"];
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (BOOL)enable
{
  return self->_enable;
}

- (void)setEnable:(BOOL)a3
{
  self->_enable = a3;
}

@end