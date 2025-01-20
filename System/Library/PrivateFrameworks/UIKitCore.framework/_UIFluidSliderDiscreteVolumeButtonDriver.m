@interface _UIFluidSliderDiscreteVolumeButtonDriver
- (NSString)name;
- (_UIPhysicalButtonInteraction)physicalButtonInteraction;
- (unint64_t)_pressedButton;
- (void)_end;
- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5;
- (void)cancel;
- (void)setEnabled:(BOOL)a3;
- (void)setView:(id)a3;
- (void)set_pressedButton:(unint64_t)a3;
@end

@implementation _UIFluidSliderDiscreteVolumeButtonDriver

- (void)setView:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_UIFluidSliderDiscreteVolumeButtonDriver;
  -[_UIFluidSliderDiscreteButtonDriver setView:](&v14, sel_setView_);
  v5 = [(_UIFluidSliderDiscreteVolumeButtonDriver *)self physicalButtonInteraction];
  v6 = v5;
  if (a3)
  {

    if (!v6)
    {
      v7 = +[_UIPhysicalButtonConfiguration _volumeConfigurations];
      v8 = [[_UIPhysicalButtonInteraction alloc] initWithConfigurations:v7 delegate:self];
      physicalButtonInteraction = self->_physicalButtonInteraction;
      self->_physicalButtonInteraction = v8;

      BOOL v10 = [(_UIFluidSliderDiscreteButtonDriver *)self enabled];
      v11 = [(_UIFluidSliderDiscreteVolumeButtonDriver *)self physicalButtonInteraction];
      [v11 _setEnabled:v10];
    }
    v6 = [(_UIFluidSliderDiscreteButtonDriver *)self view];
    v12 = [(_UIFluidSliderDiscreteVolumeButtonDriver *)self physicalButtonInteraction];
    [v6 addInteraction:v12];
  }
  else
  {
    v12 = [v5 view];
    v13 = [(_UIFluidSliderDiscreteVolumeButtonDriver *)self physicalButtonInteraction];
    [v12 removeInteraction:v13];
  }
}

- (void)setEnabled:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFluidSliderDiscreteVolumeButtonDriver;
  -[_UIFluidSliderDiscreteButtonDriver setEnabled:](&v7, sel_setEnabled_);
  BOOL v5 = [(_UIFluidSliderDiscreteButtonDriver *)self enabled];
  v6 = [(_UIFluidSliderDiscreteVolumeButtonDriver *)self physicalButtonInteraction];
  [v6 _setEnabled:v5];

  if (!a3) {
    [(_UIFluidSliderDiscreteVolumeButtonDriver *)self cancel];
  }
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFluidSliderDiscreteVolumeButtonDriver;
  [(_UIFluidSliderDiscreteButtonDriver *)&v3 cancel];
  [(_UIFluidSliderDiscreteVolumeButtonDriver *)self _end];
}

- (NSString)name
{
  return (NSString *)@"Discrete Volume Button";
}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  id v7 = a4;
  uint64_t v6 = [v7 _state];
  if ((unint64_t)(v6 - 2) < 2)
  {
    [(_UIFluidSliderDiscreteVolumeButtonDriver *)self _end];
  }
  else
  {
    if (v6 != 1)
    {
      if (v6) {
        goto LABEL_10;
      }
      -[_UIFluidSliderDiscreteVolumeButtonDriver _beginWithButton:](self, "_beginWithButton:", [v7 _button]);
    }
    if ([(_UIFluidSliderDiscreteVolumeButtonDriver *)self _pressedButton] == 1)
    {
      [(_UIFluidSliderDiscreteButtonDriver *)self pressUp];
    }
    else if ([(_UIFluidSliderDiscreteVolumeButtonDriver *)self _pressedButton] == 2)
    {
      [(_UIFluidSliderDiscreteButtonDriver *)self pressDown];
    }
  }
LABEL_10:
}

- (void)_end
{
  if ([(_UIFluidSliderDiscreteVolumeButtonDriver *)self _pressedButton])
  {
    if ([(_UIFluidSliderDiscreteVolumeButtonDriver *)self _pressedButton] == 1)
    {
      [(_UIFluidSliderDiscreteButtonDriver *)self releaseUp];
    }
    else if ([(_UIFluidSliderDiscreteVolumeButtonDriver *)self _pressedButton] == 2)
    {
      [(_UIFluidSliderDiscreteButtonDriver *)self releaseDown];
    }
    [(_UIFluidSliderDiscreteVolumeButtonDriver *)self set_pressedButton:0];
  }
}

- (_UIPhysicalButtonInteraction)physicalButtonInteraction
{
  return self->_physicalButtonInteraction;
}

- (unint64_t)_pressedButton
{
  return self->__pressedButton;
}

- (void)set_pressedButton:(unint64_t)a3
{
  self->__pressedButton = a3;
}

- (void).cxx_destruct
{
}

@end