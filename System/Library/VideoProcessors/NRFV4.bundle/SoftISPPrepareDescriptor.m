@interface SoftISPPrepareDescriptor
- (BOOL)cmiResourceEnabled;
- (SoftISPPrepareDescriptor)init;
- (id)description;
- (int)stageConfigMode;
- (unint64_t)maximumHeight;
- (unint64_t)maximumWidth;
- (unsigned)inputPixelFormat;
- (unsigned)sensorID;
- (void)setCmiResourceEnabled:(BOOL)a3;
- (void)setInputPixelFormat:(unsigned int)a3;
- (void)setMaximumHeight:(unint64_t)a3;
- (void)setMaximumWidth:(unint64_t)a3;
- (void)setSensorID:(unsigned __int16)a3;
- (void)setStageConfigMode:(int)a3;
@end

@implementation SoftISPPrepareDescriptor

- (void)setMaximumWidth:(unint64_t)a3
{
  self->_maximumWidth = a3;
}

- (void)setMaximumHeight:(unint64_t)a3
{
  self->_maximumHeight = a3;
}

- (void)setInputPixelFormat:(unsigned int)a3
{
  self->_inputPixelFormat = a3;
}

- (SoftISPPrepareDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)SoftISPPrepareDescriptor;
  v2 = [(SoftISPPrepareDescriptor *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }
  else {
    FigDebugAssert3();
  }

  return v3;
}

- (void)setStageConfigMode:(int)a3
{
  self->_stageConfigMode = a3;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"%@(inputPixelFormat=%c%c%c%c, maximumWidth=%u, maximumHeight=%u, stageConfigMode=%u)", v5, HIBYTE(self->_inputPixelFormat), BYTE2(self->_inputPixelFormat), BYTE1(self->_inputPixelFormat), self->_inputPixelFormat, self->_maximumWidth, self->_maximumHeight, self->_stageConfigMode];

  return v6;
}

- (unsigned)inputPixelFormat
{
  return self->_inputPixelFormat;
}

- (unsigned)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(unsigned __int16)a3
{
  self->_sensorID = a3;
}

- (unint64_t)maximumWidth
{
  return self->_maximumWidth;
}

- (unint64_t)maximumHeight
{
  return self->_maximumHeight;
}

- (int)stageConfigMode
{
  return self->_stageConfigMode;
}

- (BOOL)cmiResourceEnabled
{
  return self->_cmiResourceEnabled;
}

- (void)setCmiResourceEnabled:(BOOL)a3
{
  self->_cmiResourceEnabled = a3;
}

@end