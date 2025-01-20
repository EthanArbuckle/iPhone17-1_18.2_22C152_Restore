@interface _SBSystemApertureGainMapView
- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration;
- (_SBSystemApertureGainMapView)initWithFrame:(CGRect)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)setIDCornerRadius:(double)a3;
- (void)setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3;
@end

@implementation _SBSystemApertureGainMapView

- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration
{
  *retstr = *(SBSystemApertureContainerRenderingConfiguration *)((char *)self + 416);
  return self;
}

- (void)setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  p_SBSystemApertureContainerRenderingConfiguration renderingConfiguration = &self->_renderingConfiguration;
  SBSystemApertureContainerRenderingConfiguration renderingConfiguration = self->_renderingConfiguration;
  SBSystemApertureContainerRenderingConfiguration v30 = *a3;
  if (!SBSystemApertureContainerRenderingConfigurationEqualToConfiguration((uint64_t)&renderingConfiguration, (uint64_t)&v30))
  {
    long long v7 = *(_OWORD *)&a3->renderingStyle;
    *(void *)&p_renderingConfiguration->BOOL alwaysRenderInSnapshots = *(void *)&a3->alwaysRenderInSnapshots;
    *(_OWORD *)&p_renderingConfiguration->int64_t renderingStyle = v7;
    int64_t renderingStyle = a3->renderingStyle;
    unint64_t cloningStyle = a3->cloningStyle;
    switch(a3->renderingStyle)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContainerView.m" lineNumber:803 description:@"Invalid rendering style"];
        goto LABEL_27;
      case 0:
        v18 = [(_SBGainMapView *)self->_gainMapView gainMapLayer];
        [v18 setRenderMode:*MEMORY[0x1E4F3A378]];

        if (!cloningStyle)
        {
          v19 = [(_SBGainMapView *)self->_gainMapView layer];
          v20 = v19;
          uint64_t v21 = 1040;
LABEL_23:
          [v19 setDisableUpdateMask:v21];

          clonedGainMapSubstituteView = self->_clonedGainMapSubstituteView;
          uint64_t v28 = 1;
          goto LABEL_25;
        }
        if (cloningStyle != 1)
        {
          if (cloningStyle != 2) {
            return;
          }
          v19 = [(_SBGainMapView *)self->_gainMapView layer];
          v20 = v19;
          uint64_t v21 = 0;
          goto LABEL_23;
        }
        v29 = [(_SBGainMapView *)self->_gainMapView layer];
        [v29 setDisableUpdateMask:1040];

        clonedGainMapSubstituteView = self->_clonedGainMapSubstituteView;
        uint64_t v28 = 0;
LABEL_25:
        [(UIView *)clonedGainMapSubstituteView setHidden:v28];
        v15 = [(UIView *)self->_clonedGainMapSubstituteView layer];
        v16 = v15;
        uint64_t v17 = 3;
LABEL_26:
        [v15 setDisableUpdateMask:v17];
LABEL_27:

        break;
      case 1:
      case 2:
        BOOL alwaysRenderInSnapshots = a3->alwaysRenderInSnapshots;
        v11 = [(_SBGainMapView *)self->_gainMapView gainMapLayer];
        v12 = v11;
        v13 = (void *)MEMORY[0x1E4F3A380];
        if (renderingStyle != 2) {
          v13 = (void *)MEMORY[0x1E4F3A388];
        }
        [v11 setRenderMode:*v13];

        if (!cloningStyle)
        {
          v24 = [(_SBGainMapView *)self->_gainMapView layer];
          [v24 setDisableUpdateMask:1040];

          BOOL v25 = !alwaysRenderInSnapshots;
          if (alwaysRenderInSnapshots) {
            uint64_t v26 = 1041;
          }
          else {
            uint64_t v26 = 1043;
          }
          [(UIView *)self->_clonedGainMapSubstituteView setHidden:v25];
          v15 = [(UIView *)self->_clonedGainMapSubstituteView layer];
          v16 = v15;
          uint64_t v17 = v26;
          goto LABEL_26;
        }
        if (cloningStyle == 1 || cloningStyle == 2)
        {
          v14 = [(_SBGainMapView *)self->_gainMapView layer];
          [v14 setDisableUpdateMask:1040];

          [(UIView *)self->_clonedGainMapSubstituteView setHidden:0];
          v15 = [(UIView *)self->_clonedGainMapSubstituteView layer];
          v16 = v15;
          if (alwaysRenderInSnapshots) {
            uint64_t v17 = 1;
          }
          else {
            uint64_t v17 = 3;
          }
          goto LABEL_26;
        }
        return;
      case 3:
        v22 = [(_SBGainMapView *)self->_gainMapView gainMapLayer];
        [v22 setRenderMode:*MEMORY[0x1E4F3A388]];

        if (cloningStyle > 2) {
          return;
        }
        v23 = [(_SBGainMapView *)self->_gainMapView layer];
        [v23 setDisableUpdateMask:0];

        [(UIView *)self->_clonedGainMapSubstituteView setHidden:0];
        v15 = [(UIView *)self->_clonedGainMapSubstituteView layer];
        v16 = v15;
        uint64_t v17 = 0;
        goto LABEL_26;
      default:
        return;
    }
  }
}

- (_SBSystemApertureGainMapView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)_SBSystemApertureGainMapView;
  v3 = -[_SBSystemApertureGainMapView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v3)
  {
    SBSystemApertureContainerRenderingConfigurationMake(0, 2, 0, &v18);
    long long v4 = v18;
    *(void *)&v3->_renderingConfiguration.BOOL alwaysRenderInSnapshots = v19;
    *(_OWORD *)&v3->_renderingConfiguration.int64_t renderingStyle = v4;
    v5 = [_SBGainMapView alloc];
    SBRectWithSize();
    uint64_t v6 = -[_SBGainMapView initWithFrame:](v5, "initWithFrame:");
    gainMapView = v3->_gainMapView;
    v3->_gainMapView = (_SBGainMapView *)v6;

    v8 = [(_SBGainMapView *)v3->_gainMapView gainMapLayer];
    [v8 setRenderMode:*MEMORY[0x1E4F3A378]];

    [(_SBGainMapView *)v3->_gainMapView setAutoresizingMask:18];
    [(_SBSystemApertureGainMapView *)v3 addSubview:v3->_gainMapView];
    v9 = [SBGainMapSubstituteView alloc];
    SBRectWithSize();
    uint64_t v10 = -[SBGainMapSubstituteView initWithFrame:](v9, "initWithFrame:");
    clonedGainMapSubstituteView = v3->_clonedGainMapSubstituteView;
    v3->_clonedGainMapSubstituteView = (UIView *)v10;

    v12 = v3->_clonedGainMapSubstituteView;
    v13 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v12 setBackgroundColor:v13];

    v14 = [(UIView *)v3->_clonedGainMapSubstituteView layer];
    [v14 setDisableUpdateMask:3];

    [(UIView *)v3->_clonedGainMapSubstituteView setAutoresizingMask:18];
    [(UIView *)v3->_clonedGainMapSubstituteView setUserInteractionEnabled:0];
    [(UIView *)v3->_clonedGainMapSubstituteView setHidden:1];
    [(_SBSystemApertureGainMapView *)v3 addSubview:v3->_clonedGainMapSubstituteView];
    [(_SBSystemApertureGainMapView *)v3 setNeedsLayout];
    uint64_t v15 = +[SBSystemApertureDomain rootSettings];
    settings = v3->_settings;
    v3->_settings = (SBSystemApertureSettings *)v15;
  }
  return v3;
}

- (void)_setCornerRadius:(double)a3
{
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContainerView.m" lineNumber:776 description:@"use -[UIView setIDCornerRadius:] instead"];

  v7.receiver = self;
  v7.super_class = (Class)_SBSystemApertureGainMapView;
  [(_SBSystemApertureGainMapView *)&v7 _setCornerRadius:a3];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContainerView.m" lineNumber:781 description:@"use -[UIView setIDCornerRadius:] instead"];

  v7.receiver = self;
  v7.super_class = (Class)_SBSystemApertureGainMapView;
  [(_SBSystemApertureGainMapView *)&v7 _setContinuousCornerRadius:a3];
}

- (void)setIDCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SBSystemApertureGainMapView;
  -[UIView setIDCornerRadius:](&v5, sel_setIDCornerRadius_);
  [(UIView *)self->_gainMapView setIDCornerRadius:a3];
  [(UIView *)self->_clonedGainMapSubstituteView setIDCornerRadius:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_clonedGainMapSubstituteView, 0);
  objc_storeStrong((id *)&self->_gainMapView, 0);
}

@end