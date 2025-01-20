@interface SFMagicHeadMarkerView
- (SFMagicHeadMarkerView)initWithPositionDegree:(double)a3 containerRadius:(double)a4;
- (double)currentOffset;
- (void)updateMarkerWithDegreeOffset:(double)a3;
@end

@implementation SFMagicHeadMarkerView

- (SFMagicHeadMarkerView)initWithPositionDegree:(double)a3 containerRadius:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SFMagicHeadMarkerView;
  v6 = -[SFMagicHeadMarkerView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_positionDegree = a3;
    v6->_containerRadius = a4;
    -[SFMagicHeadMarkerView setBounds:](v6, "setBounds:", 0.0, 0.0, 5.0, 10.0);
    v8 = [MEMORY[0x263F825C8] systemPurpleColor];
    [(SFMagicHeadMarkerView *)v7 setBackgroundColor:v8];
  }
  return v7;
}

- (void)updateMarkerWithDegreeOffset:(double)a3
{
  double v4 = self->_positionDegree + a3;
  self->_currentOffset = v4;
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)&v14.a;
  *(_OWORD *)&v14.c = v7;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  long long v5 = *(_OWORD *)&v14.tx;
  *(float *)&double v4 = v4;
  *(float *)&double v4 = *(float *)&v4 * 0.0174532925;
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeRotation(&v13, *(float *)&v4);
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v12, 0.0, -self->_containerRadius);
  CGAffineTransform t1 = v13;
  *(_OWORD *)&t2.a = v6;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = v5;
  CGAffineTransformConcat(&v14, &t1, &t2);
  CGAffineTransform t2 = v12;
  CGAffineTransform v9 = v14;
  CGAffineTransformConcat(&t1, &t2, &v9);
  CGAffineTransform v14 = t1;
  CGAffineTransform v8 = t1;
  [(SFMagicHeadMarkerView *)self setTransform:&v8];
}

- (double)currentOffset
{
  return self->_currentOffset;
}

@end