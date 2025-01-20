@interface RAPAuxiliaryControlsRecording
- (BOOL)hasOriginatingAuxiliaryControlIndex;
- (NSArray)auxiliaryControls;
- (RAPAuxiliaryControlsRecording)initWithControlsGeo:(id)a3 originatingIndex:(unint64_t)a4;
- (unint64_t)originatingAuxiliaryControlIndex;
@end

@implementation RAPAuxiliaryControlsRecording

- (RAPAuxiliaryControlsRecording)initWithControlsGeo:(id)a3 originatingIndex:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RAPAuxiliaryControlsRecording;
  v7 = [(RAPAuxiliaryControlsRecording *)&v11 init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    auxiliaryControls = v7->_auxiliaryControls;
    v7->_auxiliaryControls = v8;

    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7->_hasOriginatingAuxiliaryControlIndex = 1;
      v7->_originatingAuxiliaryControlIndex = a4;
    }
  }

  return v7;
}

- (NSArray)auxiliaryControls
{
  return self->_auxiliaryControls;
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return self->_hasOriginatingAuxiliaryControlIndex;
}

- (void).cxx_destruct
{
}

@end