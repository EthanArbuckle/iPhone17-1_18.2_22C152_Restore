@interface FlyoverGlyphFrameList
- ($6FF9910CDCD476ED463384A0FC482A98)frameAtIndex:(SEL)a3;
- (CGImage)atlasImage;
- (FlyoverGlyphFrameList)init;
- (_NSRange)introFrameRange;
- (_NSRange)loopFrameRange;
- (_NSRange)outroFrameRange;
- (double)frameDuration;
- (unint64_t)frameCount;
@end

@implementation FlyoverGlyphFrameList

- (FlyoverGlyphFrameList)init
{
  v10.receiver = self;
  v10.super_class = (Class)FlyoverGlyphFrameList;
  v2 = [(FlyoverGlyphFrameList *)&v10 init];
  if (v2)
  {
    v3 = +[UIImage imageNamed:@"FlyoverGlyphFrames"];
    [v3 scale];
    unint64_t v5 = vcvtad_u64_f64(v4);
    if (v5 == 2)
    {
      v6 = (const $8F8FE36A74EEA149E734A88F81E85D6F *)&unk_100F70390;
    }
    else
    {
      if (v5 != 3)
      {
        NSLog(@"%s: Unsupported scale: %ld", "-[FlyoverGlyphFrameList init]", v5);
        goto LABEL_11;
      }
      v6 = (const $8F8FE36A74EEA149E734A88F81E85D6F *)&unk_100F70F44;
    }
    v2->_frames = v6;
    v8 = (CGImage *)[v3 CGImage];
    v2->_atlasImage = v8;
    if (v8)
    {
      v2->_inverseScaleFactor = 1.0 / (double)v5;
      v2->_horizontalScale = 1.0 / (double)CGImageGetWidth(v8);
      v2->_verticalScale = 1.0 / (double)CGImageGetHeight(v2->_atlasImage);
      v2->_frameCount = 214;
      v2->_frameDuration = 0.0166666667;
      v2->_introFrameRange = (_NSRange)xmmword_100F70360;
      v2->_loopFrameRange = (_NSRange)xmmword_100F70370;
      v2->_outroFrameRange = (_NSRange)xmmword_100F70380;
      v7 = v2;
LABEL_12:

      goto LABEL_13;
    }
    NSLog(@"%s: couldn't get a CGImage for the texture atlas", "-[FlyoverGlyphFrameList init]");
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- ($6FF9910CDCD476ED463384A0FC482A98)frameAtIndex:(SEL)a3
{
  unint64_t v7 = *(void *)&self->var0.y + 14 * a4;
  if (*(unsigned char *)(v7 + 12)) {
    unsigned int v8 = *(unsigned __int16 *)(v7 + 10);
  }
  else {
    unsigned int v8 = *(unsigned __int16 *)(v7 + 8);
  }
  if (*(unsigned char *)(v7 + 12)) {
    unsigned int v9 = *(unsigned __int16 *)(v7 + 8);
  }
  else {
    unsigned int v9 = *(unsigned __int16 *)(v7 + 10);
  }
  LOWORD(v4) = *(_WORD *)(v7 + 4);
  double width = self->var1.width;
  double height = self->var1.height;
  double v12 = width * ((double)*(unsigned __int16 *)(v7 + 8) * 0.5 + (double)v4);
  LOWORD(v5) = *(_WORD *)(v7 + 6);
  double v13 = width * ((double)*(unsigned __int16 *)(v7 + 10) * 0.5 + (double)v5);
  double v14 = width * (double)v8;
  double v15 = width * (double)v9;
  double v16 = -1.57079633;
  unint64_t v17 = 0;
  if (!*(unsigned char *)(v7 + 12)) {
    double v16 = 0.0;
  }
  LOWORD(v17) = *(_WORD *)v7;
  LOWORD(v6) = *(_WORD *)(v7 + 2);
  double var2 = self->var2;
  retstr->var0.x = v12;
  retstr->var0.y = v13;
  retstr->var1.double width = v14;
  retstr->var1.double height = v15;
  retstr->double var2 = v16;
  retstr->var3.origin.x = height * (double)v17;
  retstr->var3.origin.y = var2 * (double)v6;
  retstr->var3.size.double width = height * (double)v8;
  retstr->var3.size.double height = var2 * (double)v9;
  return self;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (double)frameDuration
{
  return self->_frameDuration;
}

- (_NSRange)introFrameRange
{
  NSUInteger length = self->_introFrameRange.length;
  NSUInteger location = self->_introFrameRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)loopFrameRange
{
  NSUInteger length = self->_loopFrameRange.length;
  NSUInteger location = self->_loopFrameRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)outroFrameRange
{
  NSUInteger length = self->_outroFrameRange.length;
  NSUInteger location = self->_outroFrameRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (CGImage)atlasImage
{
  return self->_atlasImage;
}

@end