@interface MFPhoneHatchBrush
+ (id)hatchBrushWithColour:(id)a3 in_style:(int)a4;
+ (id)patternNameForHatchStyle:(int)a3;
- (MFPhoneHatchBrush)initWithColour:(id)a3 in_style:(int)a4;
- (void)fillPath:(id)a3 in_path:(id)a4;
@end

@implementation MFPhoneHatchBrush

+ (id)patternNameForHatchStyle:(int)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return (id)*((void *)&off_264D673D0 + a3);
  }
}

+ (id)hatchBrushWithColour:(id)a3 in_style:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithColour:in_style:", v6, v4);

  return v7;
}

- (MFPhoneHatchBrush)initWithColour:(id)a3 in_style:(int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFPhoneHatchBrush;
  v7 = [(MFPhoneHatchBrush *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    m_colour = v7->m_colour;
    v7->m_colour = (OITSUColor *)v8;

    v7->m_style = a4;
  }

  return v7;
}

- (void)fillPath:(id)a3 in_path:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(MFPhoneBrush *)self setPolyFillMode:v14 in_path:v6];
  if (![(MFPhoneBrush *)self fillWithROP:v14 in_path:v6])
  {
    v7 = +[MFPhoneHatchBrush patternNameForHatchStyle:self->m_style];
    if (v7)
    {
      uint64_t v8 = +[OCPattern blackAndWhiteImageDataWithPatternName:v7];
      m_colour = self->m_colour;
      v10 = [v14 getBkColour];
      objc_super v11 = +[OCPattern colorizedImageDataWithBlackAndWhiteImageData:v8 foregroundColor:m_colour backgroundColor:v10];

      v12 = [[OITSUImage alloc] initWithData:v11];
      v13 = +[OITSUColor colorWithPatternImage:v12];
      [v13 set];
      [v6 fill];
    }
  }
}

- (void).cxx_destruct
{
}

@end