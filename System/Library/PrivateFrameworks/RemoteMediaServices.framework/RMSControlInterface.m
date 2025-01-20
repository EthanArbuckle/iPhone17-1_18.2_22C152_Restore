@interface RMSControlInterface
- (BOOL)supportsDirectionalControl;
- (BOOL)supportsSpeakerSelection;
- (BOOL)supportsVolumeControl;
- (RMSControlInterface)initWithProtobuf:(id)a3;
- (id)protobuf;
- (void)setSupportsDirectionalControl:(BOOL)a3;
- (void)setSupportsSpeakerSelection:(BOOL)a3;
- (void)setSupportsVolumeControl:(BOOL)a3;
@end

@implementation RMSControlInterface

- (RMSControlInterface)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RMSControlInterface;
  v5 = [(RMSControlInterface *)&v7 init];
  if (v5)
  {
    v5->_supportsSpeakerSelection = [v4 supportsSpeakerSelection];
    v5->_supportsVolumeControl = [v4 supportsVolumeControl];
    v5->_supportsDirectionalControl = [v4 supportsDirectionalControl];
  }

  return v5;
}

- (id)protobuf
{
  v3 = objc_opt_new();
  [v3 setSupportsSpeakerSelection:self->_supportsSpeakerSelection];
  [v3 setSupportsVolumeControl:self->_supportsVolumeControl];
  [v3 setSupportsDirectionalControl:self->_supportsDirectionalControl];
  return v3;
}

- (BOOL)supportsSpeakerSelection
{
  return self->_supportsSpeakerSelection;
}

- (void)setSupportsSpeakerSelection:(BOOL)a3
{
  self->_supportsSpeakerSelection = a3;
}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  self->_supportsVolumeControl = a3;
}

- (BOOL)supportsDirectionalControl
{
  return self->_supportsDirectionalControl;
}

- (void)setSupportsDirectionalControl:(BOOL)a3
{
  self->_supportsDirectionalControl = a3;
}

@end