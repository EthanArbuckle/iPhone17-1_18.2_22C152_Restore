@interface SVXDeviceSetupFlowDisplayKeyFrame
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (SVXDeviceSetupFlowDisplayKeyFrame)initWithCoder:(id)a3;
- (SVXDeviceSetupFlowDisplayKeyFrame)initWithKeyFrameID:(int64_t)a3 text:(id)a4 offset:(double)a5 duration:(double)a6;
- (double)duration;
- (double)offset;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)keyFrameID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXDeviceSetupFlowDisplayKeyFrame

- (void).cxx_destruct
{
}

- (double)duration
{
  return self->_duration;
}

- (double)offset
{
  return self->_offset;
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)keyFrameID
{
  return self->_keyFrameID;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t keyFrameID = self->_keyFrameID;
  id v6 = a3;
  v7 = [v4 numberWithInteger:keyFrameID];
  [v6 encodeObject:v7 forKey:@"SVXDeviceSetupFlowDisplayKeyFrame::keyFrameID"];

  [v6 encodeObject:self->_text forKey:@"SVXDeviceSetupFlowDisplayKeyFrame::text"];
  v8 = [NSNumber numberWithDouble:self->_offset];
  [v6 encodeObject:v8 forKey:@"SVXDeviceSetupFlowDisplayKeyFrame::offset"];

  id v9 = [NSNumber numberWithDouble:self->_duration];
  [v6 encodeObject:v9 forKey:@"SVXDeviceSetupFlowDisplayKeyFrame::duration"];
}

- (SVXDeviceSetupFlowDisplayKeyFrame)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupFlowDisplayKeyFrame::keyFrameID"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupFlowDisplayKeyFrame::text"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupFlowDisplayKeyFrame::offset"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupFlowDisplayKeyFrame::duration"];

  [v11 doubleValue];
  double v13 = v12;

  v14 = [(SVXDeviceSetupFlowDisplayKeyFrame *)self initWithKeyFrameID:v6 text:v7 offset:v10 duration:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXDeviceSetupFlowDisplayKeyFrame *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t keyFrameID = self->_keyFrameID;
      if (keyFrameID == [(SVXDeviceSetupFlowDisplayKeyFrame *)v5 keyFrameID]
        && (double offset = self->_offset, [(SVXDeviceSetupFlowDisplayKeyFrame *)v5 offset], offset == v8)
        && (double duration = self->_duration, [(SVXDeviceSetupFlowDisplayKeyFrame *)v5 duration], duration == v10))
      {
        double v13 = [(SVXDeviceSetupFlowDisplayKeyFrame *)v5 text];
        text = self->_text;
        BOOL v11 = text == v13 || [(NSString *)text isEqual:v13];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_keyFrameID];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_text hash] ^ v4;
  uint64_t v6 = [NSNumber numberWithDouble:self->_offset];
  uint64_t v7 = [v6 hash];
  double v8 = [NSNumber numberWithDouble:self->_duration];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)SVXDeviceSetupFlowDisplayKeyFrame;
  NSUInteger v5 = [(SVXDeviceSetupFlowDisplayKeyFrame *)&v11 description];
  unint64_t keyFrameID = self->_keyFrameID;
  if (keyFrameID > 0xB) {
    uint64_t v7 = @"(unknown)";
  }
  else {
    uint64_t v7 = off_264552800[keyFrameID];
  }
  double v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t keyFrameID = %@, text = %@, offset = %f, duration = %f}", v5, v8, self->_text, *(void *)&self->_offset, *(void *)&self->_duration];

  return v9;
}

- (id)description
{
  return [(SVXDeviceSetupFlowDisplayKeyFrame *)self _descriptionWithIndent:0];
}

- (SVXDeviceSetupFlowDisplayKeyFrame)initWithKeyFrameID:(int64_t)a3 text:(id)a4 offset:(double)a5 duration:(double)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVXDeviceSetupFlowDisplayKeyFrame;
  objc_super v11 = [(SVXDeviceSetupFlowDisplayKeyFrame *)&v16 init];
  double v12 = v11;
  if (v11)
  {
    v11->_unint64_t keyFrameID = a3;
    uint64_t v13 = [v10 copy];
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v12->_double offset = a5;
    v12->_double duration = a6;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXDeviceSetupFlowDisplayKeyFrameMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SVXDeviceSetupFlowDisplayKeyFrameMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SVXDeviceSetupFlowDisplayKeyFrameMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SVXDeviceSetupFlowDisplayKeyFrame *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXDeviceSetupFlowDisplayKeyFrameMutation *))a3;
  id v4 = objc_alloc_init(_SVXDeviceSetupFlowDisplayKeyFrameMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  NSUInteger v5 = [(_SVXDeviceSetupFlowDisplayKeyFrameMutation *)v4 generate];

  return v5;
}

@end