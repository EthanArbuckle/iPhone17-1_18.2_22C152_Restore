@interface _SVXDeviceSetupFlowDisplayKeyFrameMutation
- (_SVXDeviceSetupFlowDisplayKeyFrameMutation)init;
- (_SVXDeviceSetupFlowDisplayKeyFrameMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setDuration:(double)a3;
- (void)setKeyFrameID:(int64_t)a3;
- (void)setOffset:(double)a3;
- (void)setText:(id)a3;
@end

@implementation _SVXDeviceSetupFlowDisplayKeyFrameMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXDeviceSetupFlowDisplayKeyFrame alloc] initWithKeyFrameID:self->_keyFrameID text:self->_text offset:self->_offset duration:self->_duration];
    goto LABEL_5;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXDeviceSetupFlowDisplayKeyFrame *)[(SVXDeviceSetupFlowDisplayKeyFrame *)baseModel copy];
LABEL_5:
    v5 = v4;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    int64_t keyFrameID = self->_keyFrameID;
    if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    int64_t keyFrameID = [(SVXDeviceSetupFlowDisplayKeyFrame *)baseModel keyFrameID];
    if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
    {
LABEL_8:
      v7 = self->_text;
      goto LABEL_11;
    }
  }
  v7 = [(SVXDeviceSetupFlowDisplayKeyFrame *)self->_baseModel text];
LABEL_11:
  v8 = v7;
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    double offset = self->_offset;
    if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    [(SVXDeviceSetupFlowDisplayKeyFrame *)self->_baseModel duration];
    double duration = v12;
    goto LABEL_16;
  }
  [(SVXDeviceSetupFlowDisplayKeyFrame *)self->_baseModel offset];
  double offset = v9;
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  double duration = self->_duration;
LABEL_16:
  v5 = [[SVXDeviceSetupFlowDisplayKeyFrame alloc] initWithKeyFrameID:keyFrameID text:v8 offset:offset duration:duration];

LABEL_17:

  return v5;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setOffset:(double)a3
{
  self->_double offset = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setText:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setKeyFrameID:(int64_t)a3
{
  self->_int64_t keyFrameID = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXDeviceSetupFlowDisplayKeyFrameMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupFlowDisplayKeyFrameMutation;
  v6 = [(_SVXDeviceSetupFlowDisplayKeyFrameMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXDeviceSetupFlowDisplayKeyFrameMutation)init
{
  return [(_SVXDeviceSetupFlowDisplayKeyFrameMutation *)self initWithBaseModel:0];
}

@end