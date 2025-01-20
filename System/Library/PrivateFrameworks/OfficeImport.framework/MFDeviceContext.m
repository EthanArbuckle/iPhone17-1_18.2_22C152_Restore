@interface MFDeviceContext
+ (id)deviceContextWithDriver:(id)a3;
- (BOOL)clippingIsRestarted;
- (BOOL)getTextUpdateCP;
- (CGPoint)getBrushOrg;
- (CGPoint)getPenPosition;
- (MFDeviceContext)initWithDriver:(id)a3;
- (NSMutableArray)clippingPaths;
- (double)getMiterLimit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getBkColour;
- (id)getBrush;
- (id)getCurrentTransform;
- (id)getFont;
- (id)getPath;
- (id)getPen;
- (id)getSelectedPalette;
- (id)getTextColour;
- (int)getArcDirection;
- (int)getBkMode;
- (int)getPolyFillMode;
- (int)getRop2;
- (int)getStretchBltMode;
- (int)getTextBreakCount;
- (int)getTextBreakExtra;
- (int)getTextCharExtra;
- (int)getTextDirection;
- (int)getTextHorizontalAlign;
- (int)getTextVerticalAlign;
- (void)setArcDirection:(int)a3;
- (void)setBkColour:(id)a3;
- (void)setBkMode:(int)a3;
- (void)setBrush:(id)a3;
- (void)setBrushOrg:(CGPoint)a3;
- (void)setClippingIsRestarted:(BOOL)a3;
- (void)setCurrentTransform:(id)a3;
- (void)setFont:(id)a3;
- (void)setMiterLimit:(double)a3;
- (void)setPath:(id)a3;
- (void)setPen:(id)a3;
- (void)setPenPosition:(CGPoint)a3;
- (void)setPolyFillMode:(int)a3;
- (void)setRop2:(int)a3;
- (void)setSelectedPalette:(id)a3;
- (void)setStretchBltMode:(int)a3;
- (void)setTextCharExtra:(int)a3;
- (void)setTextColour:(id)a3;
- (void)setTextDirection:(int)a3;
- (void)setTextHorizontalAlign:(int)a3;
- (void)setTextJustification:(int)a3 in_breakCount:(int)a4;
- (void)setTextUpdateCP:(BOOL)a3;
- (void)setTextVerticalAlign:(int)a3;
@end

@implementation MFDeviceContext

- (MFDeviceContext)initWithDriver:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MFDeviceContext;
  v6 = [(MFDeviceContext *)&v29 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->m_driver, a3);
    *(void *)&v7->m_arcDirection = 0x100000001;
    v7->m_rop2 = 13;
    v7->m_textUpdateCP = 0;
    v7->m_textDirection = 0;
    v7->m_miterLimit = 10.0;
    *(void *)&v7->m_textHorizontalAlign = 0;
    v8 = [[MFTransform alloc] initWithDriver:v5];
    m_transform = v7->m_transform;
    v7->m_transform = v8;

    uint64_t v10 = +[OITSUColor colorWithCalibratedRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    m_bkColour = v7->m_bkColour;
    v7->m_bkColour = (OITSUColor *)v10;

    uint64_t v12 = +[OITSUColor colorWithCalibratedRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    m_textColour = v7->m_textColour;
    v7->m_textColour = (OITSUColor *)v12;

    uint64_t v14 = [v5 createFont:14];
    m_font = v7->m_font;
    v7->m_font = (MFFont *)v14;

    v16 = +[OITSUColor colorWithCalibratedRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    uint64_t v17 = objc_msgSend(v5, "createPen:in_width:in_colour:in_userStyleArray:", 0, 1, v16, 0);
    m_pen = v7->m_pen;
    v7->m_pen = (MFPen *)v17;

    v19 = +[OITSUColor colorWithCalibratedRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    uint64_t v20 = [v5 createSolidBrush:v19];
    m_brush = v7->m_brush;
    v7->m_brush = (MFBrush *)v20;

    uint64_t v22 = [v5 createPath];
    m_path = v7->m_path;
    v7->m_path = (MFPath *)v22;

    uint64_t v24 = objc_opt_new();
    m_clippingPaths = v7->m_clippingPaths;
    v7->m_clippingPaths = (NSMutableArray *)v24;

    v7->m_clippingIsRestarted = 0;
    v26 = objc_alloc_init(MFPalette);
    m_selectedPalette = v7->m_selectedPalette;
    v7->m_selectedPalette = v26;
  }
  return v7;
}

- (id)getCurrentTransform
{
  return self->m_transform;
}

- (void)setFont:(id)a3
{
}

- (void)setBkMode:(int)a3
{
  self->m_bkMode = a3;
}

- (void)setTextColour:(id)a3
{
}

- (id)getFont
{
  return self->m_font;
}

- (id)getPath
{
  return self->m_path;
}

- (BOOL)getTextUpdateCP
{
  return self->m_textUpdateCP;
}

- (int)getTextCharExtra
{
  return self->m_textCharExtra;
}

- (int)getTextVerticalAlign
{
  return self->m_textVerticalAlign;
}

- (int)getTextHorizontalAlign
{
  return self->m_textHorizontalAlign;
}

- (int)getBkMode
{
  return self->m_bkMode;
}

- (id)getTextColour
{
  return self->m_textColour;
}

- (void)setBrush:(id)a3
{
}

- (void)setPen:(id)a3
{
}

- (int)getRop2
{
  return self->m_rop2;
}

- (void)setRop2:(int)a3
{
  self->m_rop2 = a3;
}

- (id)getBrush
{
  return self->m_brush;
}

- (int)getPolyFillMode
{
  return self->m_polyFillMode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[MFDeviceContext allocWithZone:a3] initWithDriver:self->m_driver];
  [(MFDeviceContext *)self getPenPosition];
  -[MFDeviceContext setPenPosition:](v4, "setPenPosition:");
  [(MFDeviceContext *)v4 setTextUpdateCP:[(MFDeviceContext *)self getTextUpdateCP]];
  [(MFDeviceContext *)self getMiterLimit];
  -[MFDeviceContext setMiterLimit:](v4, "setMiterLimit:");
  [(MFDeviceContext *)v4 setTextHorizontalAlign:[(MFDeviceContext *)self getTextHorizontalAlign]];
  [(MFDeviceContext *)v4 setTextVerticalAlign:[(MFDeviceContext *)self getTextVerticalAlign]];
  [(MFDeviceContext *)v4 setTextDirection:[(MFDeviceContext *)self getTextDirection]];
  id v5 = [(MFDeviceContext *)self getTextColour];
  [(MFDeviceContext *)v4 setTextColour:v5];

  [(MFDeviceContext *)v4 setTextJustification:[(MFDeviceContext *)self getTextBreakExtra] in_breakCount:[(MFDeviceContext *)self getTextBreakCount]];
  [(MFDeviceContext *)v4 setTextCharExtra:[(MFDeviceContext *)self getTextCharExtra]];
  v6 = [(MFDeviceContext *)self getBkColour];
  [(MFDeviceContext *)v4 setBkColour:v6];

  [(MFDeviceContext *)v4 setBkMode:[(MFDeviceContext *)self getBkMode]];
  [(MFDeviceContext *)self getBrushOrg];
  -[MFDeviceContext setBrushOrg:](v4, "setBrushOrg:");
  v7 = [(MFDeviceContext *)self getFont];
  [(MFDeviceContext *)v4 setFont:v7];

  [(MFDeviceContext *)v4 setArcDirection:[(MFDeviceContext *)self getArcDirection]];
  [(MFDeviceContext *)v4 setPolyFillMode:[(MFDeviceContext *)self getPolyFillMode]];
  [(MFDeviceContext *)v4 setStretchBltMode:[(MFDeviceContext *)self getStretchBltMode]];
  v8 = [(MFDeviceContext *)self getCurrentTransform];
  v9 = (void *)[v8 copy];
  [(MFDeviceContext *)v4 setCurrentTransform:v9];

  uint64_t v10 = [(MFDeviceContext *)self getSelectedPalette];
  [(MFDeviceContext *)v4 setSelectedPalette:v10];

  v11 = [(MFDeviceContext *)self getPen];
  [(MFDeviceContext *)v4 setPen:v11];

  uint64_t v12 = [(MFDeviceContext *)self getBrush];
  [(MFDeviceContext *)v4 setBrush:v12];

  [(MFDeviceContext *)v4 setRop2:[(MFDeviceContext *)self getRop2]];
  v13 = (void *)[(MFPath *)self->m_path copy];
  [(MFDeviceContext *)v4 setPath:v13];

  return v4;
}

- (CGPoint)getPenPosition
{
  double x = self->m_penPos.x;
  double y = self->m_penPos.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPenPosition:(CGPoint)a3
{
  self->m_penPos = a3;
}

- (void)setTextUpdateCP:(BOOL)a3
{
  self->m_textUpdateCP = a3;
}

- (double)getMiterLimit
{
  return self->m_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->m_miterLimit = a3;
}

- (void)setTextHorizontalAlign:(int)a3
{
  self->m_textHorizontalAlign = a3;
}

- (void)setTextVerticalAlign:(int)a3
{
  self->m_textVerticalAlign = a3;
}

- (int)getTextDirection
{
  return self->m_textDirection;
}

- (void)setTextDirection:(int)a3
{
  self->m_textDirection = a3;
}

- (int)getTextBreakExtra
{
  return self->m_textBreakExtra;
}

- (int)getTextBreakCount
{
  return self->m_textBreakCount;
}

- (void)setTextCharExtra:(int)a3
{
  self->m_textCharExtra = a3;
}

- (id)getBkColour
{
  return self->m_bkColour;
}

- (void)setBkColour:(id)a3
{
}

- (CGPoint)getBrushOrg
{
  double x = self->m_brushOrg.x;
  double y = self->m_brushOrg.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBrushOrg:(CGPoint)a3
{
  self->m_brushOrg = a3;
}

- (int)getArcDirection
{
  return self->m_arcDirection;
}

- (void)setArcDirection:(int)a3
{
  self->m_arcDirection = a3;
}

- (void)setPolyFillMode:(int)a3
{
  self->m_polyFillMode = a3;
}

- (int)getStretchBltMode
{
  return self->m_stretchMode;
}

- (void)setStretchBltMode:(int)a3
{
  self->m_stretchMode = a3;
}

- (void)setCurrentTransform:(id)a3
{
}

- (id)getSelectedPalette
{
  return self->m_selectedPalette;
}

- (void)setSelectedPalette:(id)a3
{
}

- (id)getPen
{
  return self->m_pen;
}

- (void)setPath:(id)a3
{
}

+ (id)deviceContextWithDriver:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithDriver:v4];

  return v5;
}

- (void)setTextJustification:(int)a3 in_breakCount:(int)a4
{
  self->m_textBreakExtra = a3;
  self->m_textBreakCount = a4;
}

- (NSMutableArray)clippingPaths
{
  return self->m_clippingPaths;
}

- (BOOL)clippingIsRestarted
{
  return self->m_clippingIsRestarted;
}

- (void)setClippingIsRestarted:(BOOL)a3
{
  self->m_clippingIsRestarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_path, 0);
  objc_storeStrong((id *)&self->m_clippingPaths, 0);
  objc_storeStrong((id *)&self->m_selectedPalette, 0);
  objc_storeStrong((id *)&self->m_brush, 0);
  objc_storeStrong((id *)&self->m_pen, 0);
  objc_storeStrong((id *)&self->m_transform, 0);
  objc_storeStrong((id *)&self->m_bkColour, 0);
  objc_storeStrong((id *)&self->m_textColour, 0);
  objc_storeStrong((id *)&self->m_font, 0);
  objc_storeStrong((id *)&self->m_driver, 0);
}

@end