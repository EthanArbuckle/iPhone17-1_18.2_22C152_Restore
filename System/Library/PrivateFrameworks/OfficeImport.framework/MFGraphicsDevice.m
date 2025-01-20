@interface MFGraphicsDevice
- (CGRect)getCanvas;
- (MFGraphicsDevice)initWithCanvas:(CGRect)a3;
- (id)clipEverythingClippingPath;
- (id)clippingPathByCombiningClippingPath:(id)a3 withClippingPath:(id)a4 combineMode:(int)a5;
- (id)clippingPathByCombiningEmptyClippingPathWithClippingPath:(id)a3 combineMode:(int)a4;
- (id)clippingPathByCombiningImplicitClippingPathWithClippingPath:(id)a3 combineMode:(int)a4;
- (id)createBitmap:(unsigned int)a3 in_height:(unsigned int)a4 in_planes:(unsigned int)a5 in_bitsPerPixel:(unsigned int)a6 in_bitmap:(const char *)a7 in_bitmapSize:(unsigned int)a8;
- (id)createColorWithRGBBytes:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5 flags:(unsigned __int8)a6;
- (id)createDIBitmap:(const char *)a3 in_dibSize:(unsigned int)a4 in_usage:(int)a5;
- (id)createDIBitmap:(const char *)a3 in_headerSize:(unsigned int)a4 in_bitmap:(const char *)a5 in_bitmapSize:(unsigned int)a6 in_usage:(int)a7;
- (id)currentCummulatedClippingPath;
- (id)getCurrentFont;
- (id)implicitClippingPath;
- (id)normalizedClippingPathWithClippingPath:(id)a3;
- (id)recolor:(id)a3 fill:(BOOL)a4;
- (id)recolor:(unsigned __int8)a3 in_green:(unsigned __int8)a4 in_blue:(unsigned __int8)a5 fill:(BOOL)a6;
- (int)abortPath;
- (int)alphaBlend:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_widthSrc:(int)a10 in_heightSrc:(int)a11 in_sourceConstantOpacity:(unsigned __int8)a12 in_useSourceAlphaChannel:(BOOL)a13 in_xform:(CGAffineTransform *)a14 in_colour:(unsigned int)a15;
- (int)angleArc:(int)a3 y:(int)a4 radius:(unsigned int)a5 startAngle:(double)a6 sweepAngle:(double)a7;
- (int)arc:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10;
- (int)arcTo:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10;
- (int)beginPath;
- (int)bezier:(int)a3 y:(int)a4 x2:(int)a5 y2:(int)a6 x3:(int)a7 y3:(int)a8 x4:(int)a9 y4:(int)a10;
- (int)bezierTo:(int)a3 y:(int)a4 x2:(int)a5 y2:(int)a6 x3:(int)a7 y3:(int)a8;
- (int)bitBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_rop:(unsigned int)a10 in_xform:(CGAffineTransform *)a11 in_colour:(unsigned int)a12;
- (int)chord:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10;
- (int)closeCurrentPath:(BOOL)a3;
- (int)comment:(id)a3;
- (int)createBrush:(int)a3 in_colour:(id)a4 hatchstyle:(int)a5 index:(unsigned int)a6;
- (int)createFontIndirect:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17;
- (int)createFontIndirectW:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24 index:(unsigned int)a25;
- (int)createPalette:(id)a3 in_index:(unsigned int)a4;
- (int)createPatternBrush:(id)a3 index:(unsigned int)a4 usePaletteForBilevel:(BOOL)a5;
- (int)createPen:(int)a3 width:(int)a4 in_colour:(id)a5 in_userStyleArray:(double *)a6 index:(unsigned int)a7;
- (int)createRegion:(id)a3;
- (int)deleteObject:(int)a3;
- (int)description:(id)a3;
- (int)ellipse:(int)a3 y1:(int)a4 x2:(int)a5 y2:(int)a6;
- (int)endPath;
- (int)excludeClipRect:(CGRect)a3;
- (int)extTextOut:(int)a3 y:(int)a4 in_text:(id)a5 options:(int)a6 left:(int)a7 top:(int)a8 right:(int)a9 bottom:(int)a10 spacingValues:(int *)a11 numValues:(int)a12;
- (int)extTextOutEncoded:(int)a3 y:(int)a4 in_data:(id)a5 options:(int)a6 left:(int)a7 top:(int)a8 right:(int)a9 bottom:(int)a10 spacingValues:(int *)a11 numValues:(int)a12;
- (int)fillRectangle:(int)a3 y1:(int)a4 x2:(int)a5 y2:(int)a6;
- (int)fillRgn:(unsigned int)a3 in_brushID:(unsigned int)a4;
- (int)fillRgnWithRects:(id)a3 in_brushID:(unsigned int)a4;
- (int)frameRegion:(unsigned int)a3 in_brushID:(unsigned int)a4 in_width:(int)a5 in_height:(int)a6;
- (int)frameRegionWithRects:(id)a3 in_brushID:(unsigned int)a4 in_width:(int)a5 in_height:(int)a6;
- (int)getStockObject:(unsigned int)a3;
- (int)intersectClipRect:(CGRect)a3;
- (int)invertRgn:(unsigned int)a3;
- (int)invertRgnWithRects:(id)a3;
- (int)lineTo:(double)a3 y:(double)a4;
- (int)maskBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_maskImage:(id)a10 in_xMask:(int)a11 in_yMask:(int)a12 in_rop:(unsigned int)a13 in_xform:(CGAffineTransform *)a14 in_colour:(unsigned int)a15;
- (int)modifyWorldTransform:(const CGAffineTransform *)a3 in_command:(int)a4;
- (int)moveTo:(double)a3 y:(double)a4;
- (int)offsetClipRegionByX:(int)a3 y:(int)a4;
- (int)offsetViewportOrg:(int)a3 in_y:(int)a4;
- (int)offsetWindowOrg:(int)a3 in_y:(int)a4;
- (int)paintRgn:(unsigned int)a3;
- (int)paintRgnWithRects:(id)a3;
- (int)patBlt:(int)a3 in_y:(int)a4 in_width:(int)a5 in_height:(int)a6 in_rop:(unsigned int)a7;
- (int)pie:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10;
- (int)plgBlt:(CGPoint *)a3 in_sourceImage:(id)a4 in_xSrc:(int)a5 in_ySrc:(int)a6 in_widthSrc:(int)a7 in_heightSrc:(int)a8 in_maskImage:(id)a9 in_xMask:(int)a10 in_yMask:(int)a11 in_xform:(CGAffineTransform *)a12 in_colour:(unsigned int)a13;
- (int)polyPolygon:(CGPoint *)a3 in_polyCounts:(int *)a4 in_count:(int)a5;
- (int)polyPolyline:(CGPoint *)a3 in_polyCounts:(int *)a4 in_count:(int)a5;
- (int)polygon:(CGPoint *)a3 in_count:(int)a4;
- (int)polyline:(CGPoint *)a3 in_count:(int)a4;
- (int)realizePalette;
- (int)rectangle:(int)a3 y1:(int)a4 x2:(int)a5 y2:(int)a6;
- (int)removeClip;
- (int)resizePalette:(unsigned int)a3 in_index:(unsigned int)a4;
- (int)restoreDC;
- (int)restoreDC:(int)a3;
- (int)roundRect:(int)a3 top:(int)a4 right:(int)a5 bottom:(int)a6 rx:(double)a7 ry:(double)a8;
- (int)saveDC;
- (int)scaleViewportExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6;
- (int)scaleWindowExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6;
- (int)selectClipPath:(int)a3;
- (int)selectClipRegion:(id)a3 combineMode:(int)a4;
- (int)selectClipRegionWithRects:(id)a3 in_mode:(int)a4;
- (int)selectClippingPath:(id)a3 combineMode:(int)a4;
- (int)selectObject:(int)a3;
- (int)setArcDirection:(int)a3;
- (int)setBkColour:(id)a3;
- (int)setBkMode:(int)a3;
- (int)setBrushOrg:(double)a3 y:(double)a4;
- (int)setClipRegion:(unsigned int)a3;
- (int)setMapMode:(int)a3;
- (int)setMetaRgn;
- (int)setMiterLimit:(double)a3;
- (int)setPaletteEntries:(unsigned int)a3 in_colours:(id)a4 in_index:(unsigned int)a5;
- (int)setPolyFillMode:(int)a3;
- (int)setRop2:(int)a3;
- (int)setStretchBltMode:(int)a3;
- (int)setTextAlign:(BOOL)a3 textHorizontalAlign:(int)a4 textVerticalAlign:(int)a5 textDirection:(int)a6;
- (int)setTextCharExtra:(int)a3;
- (int)setTextColour:(id)a3;
- (int)setTextJustification:(int)a3 in_breakCount:(int)a4;
- (int)setViewBox:(double)a3 top:(double)a4 width:(double)a5 height:(double)a6;
- (int)setViewportExt:(int)a3 in_y:(int)a4;
- (int)setViewportOrg:(int)a3 in_y:(int)a4;
- (int)setWindowExt:(int)a3 in_y:(int)a4;
- (int)setWindowOrg:(int)a3 in_y:(int)a4;
- (int)setWorldTransform:(const CGAffineTransform *)a3;
- (int)stretchBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_widthSrc:(int)a10 in_heightSrc:(int)a11 in_rop:(unsigned int)a12 in_xform:(CGAffineTransform *)a13 in_colour:(unsigned int)a14;
- (int)stretchBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_widthSrc:(int)a10 in_heightSrc:(int)a11 in_rop:(unsigned int)a12 in_xform:(CGAffineTransform *)a13 in_colour:(unsigned int)a14 usePaletteForBilevel:(BOOL)a15;
- (int)strokeAndFillPath:(BOOL)a3 in_fill:(BOOL)a4;
- (int)textOut:(int)a3 y:(int)a4 in_text:(id)a5;
- (int)textOutEncoded:(int)a3 y:(int)a4 in_data:(id)a5;
- (int)widenPath;
- (unint64_t)clippingStartDCIndex;
- (unint64_t)currentDCIndex;
- (unint64_t)firstClipDCIndex;
- (void)addClippingPathToCurrentContext:(id)a3 dc:(id)a4;
- (void)addClippingPathToCurrentDCAndCurrentContext:(id)a3;
- (void)applyClippingOfDCAtIndexToCurrentContext:(unint64_t)a3;
- (void)applyDCAtIndexToCurrentContext:(unint64_t)a3;
- (void)applyNonClippingOfDCAtIndexToCurrentContext:(unint64_t)a3;
- (void)createStockObjects;
- (void)dealloc;
- (void)done;
- (void)restoreGState:(id)a3;
- (void)saveGState:(id)a3;
- (void)setClippingPath:(id)a3;
- (void)setColorMap:(id)a3 fillMap:(id)a4;
- (void)setMaximumObjectTableSize:(unsigned int)a3;
@end

@implementation MFGraphicsDevice

- (MFGraphicsDevice)initWithCanvas:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)MFGraphicsDevice;
  v7 = [(MFGraphicsDevice *)&v22 init];
  if (v7)
  {
    v8 = -[MFPhoneDeviceDriver initWithCanvas:]([MFPhoneDeviceDriver alloc], "initWithCanvas:", x, y, width, height);
    m_deviceDriver = v7->m_deviceDriver;
    v7->m_deviceDriver = (MFDeviceDriver *)v8;

    v10 = objc_alloc_init(MFObjectTable);
    m_objectTable = v7->m_objectTable;
    v7->m_objectTable = v10;

    v12 = objc_alloc_init(MFObjectTable);
    m_stockObjects = v7->m_stockObjects;
    v7->m_stockObjects = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    m_DCStack = v7->m_DCStack;
    v7->m_DCStack = v14;

    v16 = [[MFDeviceContext alloc] initWithDriver:v7->m_deviceDriver];
    [(NSMutableArray *)v7->m_DCStack addObject:v16];
    uint64_t v17 = [(NSMutableArray *)v7->m_DCStack lastObject];
    m_currentDC = v7->m_currentDC;
    v7->m_currentDC = (MFDeviceContext *)v17;

    v7->m_gStateStackHeight = 1;
    m_colorMap = v7->m_colorMap;
    v7->m_colorMap = 0;

    m_fillMap = v7->m_fillMap;
    v7->m_fillMap = 0;
  }
  return v7;
}

- (void)setColorMap:(id)a3 fillMap:(id)a4
{
  v6 = (NSDictionary *)a3;
  v7 = (NSDictionary *)a4;
  m_colorMap = self->m_colorMap;
  self->m_colorMap = v6;
  v10 = v6;

  m_fillMap = self->m_fillMap;
  self->m_fillMap = v7;
}

- (int)setMapMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v3) = [v4 setMapMode:v3];

  return v3;
}

- (int)selectObject:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = -[MFObjectTable getObject:](self->m_objectTable, "getObject:");
  uint64_t v6 = objc_opt_class();
  v7 = TSUDynamicCast(v6, (uint64_t)v5);
  if (v7)
  {
    int v8 = [(MFGraphicsDevice *)self selectClipRegion:v7 combineMode:5];
  }
  else
  {
    int v8 = [(MFObjectTable *)self->m_objectTable selectInto:v3 io_DC:self->m_currentDC];
  }

  return v8;
}

- (int)setBkMode:(int)a3
{
  return 0;
}

- (int)setTextColour:(id)a3
{
  m_currentDC = self->m_currentDC;
  v4 = [(MFGraphicsDevice *)self recolor:a3 fill:0];
  [(MFDeviceContext *)m_currentDC setTextColour:v4];

  return 0;
}

- (id)recolor:(id)a3 fill:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v4
    || (m_fillMap = self->m_fillMap) == 0
    || ([(NSDictionary *)m_fillMap objectForKey:v6],
        (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    m_colorMap = self->m_colorMap;
    if (!m_colorMap
      || ([(NSDictionary *)m_colorMap objectForKey:v6],
          (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v8 = v6;
    }
  }

  return v8;
}

- (int)deleteObject:(int)a3
{
  return [(MFObjectTable *)self->m_objectTable deleteObject:*(void *)&a3];
}

- (int)saveDC
{
  uint64_t v3 = (void *)[(MFDeviceContext *)self->m_currentDC copy];
  [(NSMutableArray *)self->m_DCStack addObject:v3];
  BOOL v4 = [(NSMutableArray *)self->m_DCStack lastObject];
  m_currentDC = self->m_currentDC;
  self->m_currentDC = v4;

  [(MFGraphicsDevice *)self saveGState:@"saveDC"];
  return 0;
}

- (int)intersectClipRect:(CGRect)a3
{
  return -[MFDeviceDriver intersectClipRect:](self->m_deviceDriver, "intersectClipRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (int)restoreDC:(int)a3
{
  if (a3 < 0)
  {
    if (-a3 > 1) {
      int v5 = -a3;
    }
    else {
      int v5 = 1;
    }
    do
    {
      [(MFGraphicsDevice *)self restoreDC];
      --v5;
    }
    while (v5);
  }
  else if (a3)
  {
    while ((int)[(NSMutableArray *)self->m_DCStack count] > a3)
      [(MFGraphicsDevice *)self restoreDC];
  }
  return 0;
}

- (int)setPolyFillMode:(int)a3
{
  return 0;
}

- (void)done
{
  [(MFObjectTable *)self->m_objectTable clear];
  m_stockObjects = self->m_stockObjects;
  [(MFObjectTable *)m_stockObjects clear];
}

- (void)dealloc
{
  m_currentDC = self->m_currentDC;
  self->m_currentDC = 0;

  v4.receiver = self;
  v4.super_class = (Class)MFGraphicsDevice;
  [(MFGraphicsDevice *)&v4 dealloc];
}

- (CGRect)getCanvas
{
  [(MFDeviceDriver *)self->m_deviceDriver getCanvas];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (int)getStockObject:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (![(MFObjectTable *)self->m_stockObjects size]) {
    [(MFGraphicsDevice *)self createStockObjects];
  }
  m_stockObjects = self->m_stockObjects;
  m_currentDC = self->m_currentDC;
  return [(MFObjectTable *)m_stockObjects selectInto:v3 io_DC:m_currentDC];
}

- (void)createStockObjects
{
  m_deviceDriver = self->m_deviceDriver;
  double v4 = [(MFGraphicsDevice *)self recolor:255 in_green:255 in_blue:255 fill:1];
  double v5 = [(MFDeviceDriver *)m_deviceDriver createSolidBrush:v4];

  [(MFObjectTable *)self->m_stockObjects putObject:v5 in_objectPos:0];
  id v6 = self->m_deviceDriver;
  v7 = [(MFGraphicsDevice *)self recolor:192 in_green:192 in_blue:192 fill:1];
  id v8 = [(MFDeviceDriver *)v6 createSolidBrush:v7];

  [(MFObjectTable *)self->m_stockObjects putObject:v8 in_objectPos:1];
  v9 = self->m_deviceDriver;
  v10 = [(MFGraphicsDevice *)self recolor:128 in_green:128 in_blue:128 fill:1];
  v11 = [(MFDeviceDriver *)v9 createSolidBrush:v10];

  [(MFObjectTable *)self->m_stockObjects putObject:v11 in_objectPos:2];
  v12 = self->m_deviceDriver;
  v13 = [(MFGraphicsDevice *)self recolor:169 in_green:169 in_blue:169 fill:1];
  v14 = [(MFDeviceDriver *)v12 createSolidBrush:v13];

  [(MFObjectTable *)self->m_stockObjects putObject:v14 in_objectPos:3];
  v15 = self->m_deviceDriver;
  v16 = [(MFGraphicsDevice *)self recolor:0 in_green:0 in_blue:0 fill:1];
  uint64_t v17 = [(MFDeviceDriver *)v15 createSolidBrush:v16];

  [(MFObjectTable *)self->m_stockObjects putObject:v17 in_objectPos:4];
  v18 = [(MFDeviceDriver *)self->m_deviceDriver createNullBrush];

  [(MFObjectTable *)self->m_stockObjects putObject:v18 in_objectPos:5];
  v19 = self->m_deviceDriver;
  v20 = [(MFGraphicsDevice *)self recolor:255 in_green:255 in_blue:255 fill:0];
  id v38 = [(MFDeviceDriver *)v19 createPen:0 in_width:1 in_colour:v20 in_userStyleArray:0];

  [(MFObjectTable *)self->m_stockObjects putObject:v38 in_objectPos:6];
  v21 = self->m_deviceDriver;
  objc_super v22 = [(MFGraphicsDevice *)self recolor:0 in_green:0 in_blue:0 fill:0];
  v23 = [(MFDeviceDriver *)v21 createPen:0 in_width:1 in_colour:v22 in_userStyleArray:0];

  [(MFObjectTable *)self->m_stockObjects putObject:v23 in_objectPos:7];
  v24 = [(MFDeviceDriver *)self->m_deviceDriver createPen];

  [(MFObjectTable *)self->m_stockObjects putObject:v24 in_objectPos:8];
  v25 = [(MFDeviceDriver *)self->m_deviceDriver createFont:10];
  [(MFObjectTable *)self->m_stockObjects putObject:v25 in_objectPos:10];
  v26 = [(MFDeviceDriver *)self->m_deviceDriver createFont:11];

  [(MFObjectTable *)self->m_stockObjects putObject:v26 in_objectPos:11];
  v27 = [(MFDeviceDriver *)self->m_deviceDriver createFont:12];

  [(MFObjectTable *)self->m_stockObjects putObject:v27 in_objectPos:12];
  v28 = [(MFDeviceDriver *)self->m_deviceDriver createFont:13];

  [(MFObjectTable *)self->m_stockObjects putObject:v28 in_objectPos:13];
  v29 = [(MFDeviceDriver *)self->m_deviceDriver createFont:14];

  [(MFObjectTable *)self->m_stockObjects putObject:v29 in_objectPos:14];
  v30 = objc_alloc_init(MFPalette);
  [(MFObjectTable *)self->m_stockObjects putObject:v30 in_objectPos:15];
  v31 = [(MFDeviceDriver *)self->m_deviceDriver createFont:16];

  [(MFObjectTable *)self->m_stockObjects putObject:v31 in_objectPos:16];
  v32 = [(MFDeviceDriver *)self->m_deviceDriver createFont:17];

  [(MFObjectTable *)self->m_stockObjects putObject:v32 in_objectPos:17];
  v33 = self->m_deviceDriver;
  v34 = [(MFGraphicsDevice *)self recolor:0 in_green:0 in_blue:0 fill:1];
  v35 = [(MFDeviceDriver *)v33 createSolidBrush:v34];

  [(MFObjectTable *)self->m_stockObjects putObject:v35 in_objectPos:18];
  v36 = self->m_deviceDriver;
  v37 = [(MFGraphicsDevice *)self recolor:0 in_green:0 in_blue:0 fill:0];
  id v39 = [(MFDeviceDriver *)v36 createPen:0 in_width:1 in_colour:v37 in_userStyleArray:0];

  [(MFObjectTable *)self->m_stockObjects putObject:v39 in_objectPos:19];
}

- (int)setStretchBltMode:(int)a3
{
  return 0;
}

- (int)setBkColour:(id)a3
{
  m_currentDC = self->m_currentDC;
  double v4 = [(MFGraphicsDevice *)self recolor:a3 fill:1];
  [(MFDeviceContext *)m_currentDC setBkColour:v4];

  return 0;
}

- (int)setRop2:(int)a3
{
  return 0;
}

- (int)realizePalette
{
  return 0;
}

- (int)excludeClipRect:(CGRect)a3
{
  return -[MFDeviceDriver excludeClipRect:](self->m_deviceDriver, "excludeClipRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (int)description:(id)a3
{
  return 0;
}

- (int)beginPath
{
  double v2 = [(MFDeviceContext *)self->m_currentDC getPath];
  int v3 = [v2 begin];

  return v3;
}

- (int)closeCurrentPath:(BOOL)a3
{
  double v4 = [(MFDeviceContext *)self->m_currentDC getPath];
  int v5 = [v4 closeFigure];
  if (!v5)
  {
    m_currentDC = self->m_currentDC;
    [v4 currentPoint];
    -[MFDeviceContext setPenPosition:](m_currentDC, "setPenPosition:");
  }

  return v5;
}

- (int)endPath
{
  double v2 = [(MFDeviceContext *)self->m_currentDC getPath];
  int v3 = [v2 end];

  return v3;
}

- (id)getCurrentFont
{
  return [(MFDeviceContext *)self->m_currentDC getFont];
}

- (int)setMiterLimit:(double)a3
{
  return 0;
}

- (int)setMetaRgn
{
  return [(MFDeviceDriver *)self->m_deviceDriver setMetaRgn];
}

- (int)setWorldTransform:(const CGAffineTransform *)a3
{
  double v4 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(a3) = [v4 setWorldTransform:a3];

  return (int)a3;
}

- (int)selectClipPath:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  m_deviceDriver = self->m_deviceDriver;
  id v6 = [(MFDeviceContext *)self->m_currentDC getPath];
  v7 = [(MFDeviceDriver *)m_deviceDriver createRegionWithPath:v6];

  if (v7) {
    int v8 = [(MFGraphicsDevice *)self selectClipRegion:v7 combineMode:v3];
  }
  else {
    int v8 = -1;
  }

  return v8;
}

- (int)createRegion:(id)a3
{
  double v4 = [(MFDeviceDriver *)self->m_deviceDriver createRegionWithRects:a3 in_dc:self->m_currentDC];
  if (v4) {
    int v5 = [(MFObjectTable *)self->m_objectTable putObject:v4 in_objectPos:0xFFFFFFFFLL];
  }
  else {
    int v5 = -1;
  }

  return v5;
}

- (int)setTextCharExtra:(int)a3
{
  return 0;
}

- (id)recolor:(unsigned __int8)a3 in_green:(unsigned __int8)a4 in_blue:(unsigned __int8)a5 fill:(BOOL)a6
{
  BOOL v6 = a6;
  int v8 = +[OITSUColor colorWithRGBBytes:a3 green:a4 blue:a5];
  v9 = [(MFGraphicsDevice *)self recolor:v8 fill:v6];

  return v9;
}

- (int)comment:(id)a3
{
  return 0;
}

- (int)setBrushOrg:(double)a3 y:(double)a4
{
  return 0;
}

- (int)setTextJustification:(int)a3 in_breakCount:(int)a4
{
  return 0;
}

- (int)setTextAlign:(BOOL)a3 textHorizontalAlign:(int)a4 textVerticalAlign:(int)a5 textDirection:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  [(MFDeviceContext *)self->m_currentDC setTextUpdateCP:a3];
  [(MFDeviceContext *)self->m_currentDC setTextHorizontalAlign:v8];
  [(MFDeviceContext *)self->m_currentDC setTextVerticalAlign:v7];
  [(MFDeviceContext *)self->m_currentDC setTextDirection:v6];
  return 0;
}

- (int)textOut:(int)a3 y:(int)a4 in_text:(id)a5
{
  int v9 = a4;
  int v10 = a3;
  id v6 = a5;
  int v7 = [(MFDeviceDriver *)self->m_deviceDriver textOut:self->m_currentDC px:&v10 py:&v9 in_text:v6];
  if (!v7 && [(MFDeviceContext *)self->m_currentDC getTextUpdateCP]) {
    -[MFDeviceContext setPenPosition:](self->m_currentDC, "setPenPosition:", (double)v10, (double)v9);
  }

  return v7;
}

- (int)textOutEncoded:(int)a3 y:(int)a4 in_data:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  int v9 = [(MFDeviceContext *)self->m_currentDC getFont];
  id v10 = v8;
  v11 = objc_msgSend(v9, "stringWithBytes:length:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  LODWORD(v5) = [(MFGraphicsDevice *)self textOut:v6 y:v5 in_text:v11];

  return v5;
}

- (int)extTextOut:(int)a3 y:(int)a4 in_text:(id)a5 options:(int)a6 left:(int)a7 top:(int)a8 right:(int)a9 bottom:(int)a10 spacingValues:(int *)a11 numValues:(int)a12
{
  uint64_t v13 = *(void *)&a7;
  uint64_t v14 = *(void *)&a6;
  int v21 = a4;
  int v22 = a3;
  id v16 = a5;
  LODWORD(v20) = a12;
  LODWORD(v19) = a10;
  int v17 = -[MFDeviceDriver extTextOut:px:py:in_text:options:left:top:right:bottom:spacingValues:numValues:](self->m_deviceDriver, "extTextOut:px:py:in_text:options:left:top:right:bottom:spacingValues:numValues:", self->m_currentDC, &v22, &v21, v16, v14, v13, __PAIR64__(a9, a8), v19, a11, v20);
  if (!v17 && [(MFDeviceContext *)self->m_currentDC getTextUpdateCP]) {
    -[MFDeviceContext setPenPosition:](self->m_currentDC, "setPenPosition:", (double)v22, (double)v21);
  }

  return v17;
}

- (int)extTextOutEncoded:(int)a3 y:(int)a4 in_data:(id)a5 options:(int)a6 left:(int)a7 top:(int)a8 right:(int)a9 bottom:(int)a10 spacingValues:(int *)a11 numValues:(int)a12
{
  uint64_t v12 = *(void *)&a8;
  uint64_t v13 = *(void *)&a7;
  id v34 = a5;
  int v17 = [(MFDeviceContext *)self->m_currentDC getFont];
  id v18 = v34;
  uint64_t v19 = objc_msgSend(v17, "stringWithBytes:length:", objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));
  unsigned int v38 = a4;
  unsigned int v39 = a6;
  int v20 = [v17 getCharset];
  int v21 = a12;
  if ((v20 - 78) > 0x3A || ((1 << (v20 - 78)) & 0x51C000000000001) == 0) {
    goto LABEL_15;
  }
  unint64_t v23 = OCNsStringEncodingForWindowsCharSet(v20);
  unint64_t v24 = [v19 length];
  unsigned int v35 = v13;
  unsigned int v36 = v12;
  v25 = [NSNumber numberWithInt:a12];
  id v37 = v18;
  unint64_t v26 = [v25 unsignedIntegerValue];

  if (v24 < v26) {
    unint64_t v26 = v24;
  }
  if (!v26)
  {
LABEL_14:
    int v21 = v26;
    id v18 = v37;
    uint64_t v13 = v35;
    uint64_t v12 = v36;
LABEL_15:
    LODWORD(v33) = v21;
    int v31 = -[MFGraphicsDevice extTextOut:y:in_text:options:left:top:right:bottom:spacingValues:numValues:](self, "extTextOut:y:in_text:options:left:top:right:bottom:spacingValues:numValues:", a3, v38, v19, v39, v13, v12, __PAIR64__(a10, a9), a11, v33);
    goto LABEL_17;
  }
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  while (1)
  {
    if (a11 && v27 + v28 < (unint64_t)a12) {
      a11[v27] = a11[v27 + v28];
    }
    __int16 v41 = 0;
    __int16 v41 = [v19 characterAtIndex:v27];
    v29 = (void *)[[NSString alloc] initWithCharactersNoCopy:&v41 length:1 freeWhenDone:0];
    uint64_t v30 = [v29 lengthOfBytesUsingEncoding:v23];

    if (!v30) {
      break;
    }
    uint64_t v28 = v28 + v30 - 1;
    if (v26 == ++v27) {
      goto LABEL_14;
    }
  }
  int v31 = -7;
  id v18 = v37;
LABEL_17:

  return v31;
}

- (int)rectangle:(int)a3 y1:(int)a4 x2:(int)a5 y2:(int)a6
{
  return [(MFDeviceDriver *)self->m_deviceDriver rectangle:self->m_currentDC x1:*(void *)&a3 y1:*(void *)&a4 x2:*(void *)&a5 y2:*(void *)&a6];
}

- (int)fillRectangle:(int)a3 y1:(int)a4 x2:(int)a5 y2:(int)a6
{
  return [(MFDeviceDriver *)self->m_deviceDriver fillRectangle:self->m_currentDC x1:*(void *)&a3 y1:*(void *)&a4 x2:*(void *)&a5 y2:*(void *)&a6];
}

- (int)ellipse:(int)a3 y1:(int)a4 x2:(int)a5 y2:(int)a6
{
  return [(MFDeviceDriver *)self->m_deviceDriver ellipse:self->m_currentDC x1:*(void *)&a3 y1:*(void *)&a4 x2:*(void *)&a5 y2:*(void *)&a6];
}

- (int)setViewBox:(double)a3 top:(double)a4 width:(double)a5 height:(double)a6
{
  return [(MFDeviceDriver *)self->m_deviceDriver setViewBox:a3 top:a4 width:a5 height:a6];
}

- (void)saveGState:(id)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  ++self->m_gStateStackHeight;
}

- (void)restoreGState:(id)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextRestoreGState(CurrentContext);
  --self->m_gStateStackHeight;
}

- (unint64_t)currentDCIndex
{
  return [(NSMutableArray *)self->m_DCStack count] - 1;
}

- (unint64_t)firstClipDCIndex
{
  return [(NSMutableArray *)self->m_DCStack indexOfObjectIdenticalTo:self->m_firstClipDC];
}

- (unint64_t)clippingStartDCIndex
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->m_firstClipDC;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(NSMutableArray *)self->m_DCStack reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(MFDeviceContext **)(*((void *)&v12 + 1) + 8 * v7);
      if (v8 == self->m_firstClipDC) {
        break;
      }
      if ([*(id *)(*((void *)&v12 + 1) + 8 * v7) clippingIsRestarted])
      {
        int v9 = v8;

        uint64_t v3 = v9;
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  unint64_t v10 = [(NSMutableArray *)self->m_DCStack indexOfObjectIdenticalTo:v3];
  return v10;
}

- (void)applyNonClippingOfDCAtIndexToCurrentContext:(unint64_t)a3
{
  id v4 = [(NSMutableArray *)self->m_DCStack objectAtIndexedSubscript:a3];
  uint64_t v3 = [v4 getCurrentTransform];
  [v3 updateTransform];
}

- (id)implicitClippingPath
{
  [(MFGraphicsDevice *)self getCanvas];
  return +[OITSUBezierPath bezierPathWithRect:](OITSUBezierPath, "bezierPathWithRect:");
}

- (id)clipEverythingClippingPath
{
  double v2 = [(MFGraphicsDevice *)self implicitClippingPath];
  [v2 controlPointBounds];
  CGAffineTransformMakeTranslation(&v6, v3 + v3, v4 + v4);
  [v2 transformUsingAffineTransform:&v6];
  return v2;
}

- (void)addClippingPathToCurrentContext:(id)a3 dc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEmpty])
  {
    uint64_t v8 = [(MFGraphicsDevice *)self clipEverythingClippingPath];

    id v6 = (id)v8;
  }
  memset(&v14, 0, sizeof(v14));
  int v9 = [v7 getCurrentTransform];
  unint64_t v10 = v9;
  if (v9) {
    [v9 getTransformMatrix];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CGAffineTransformInvert(&v14, &v13);

  v11 = (void *)[v6 copy];
  CGAffineTransform v12 = v14;
  [v11 transformUsingAffineTransform:&v12];
  [v11 addClip];
}

- (void)applyClippingOfDCAtIndexToCurrentContext:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v4 = [(NSMutableArray *)self->m_DCStack objectAtIndexedSubscript:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = objc_msgSend(v4, "clippingPaths", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [(MFGraphicsDevice *)self addClippingPathToCurrentContext:*(void *)(*((void *)&v9 + 1) + 8 * v8++) dc:v4];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)applyDCAtIndexToCurrentContext:(unint64_t)a3
{
  -[MFGraphicsDevice applyNonClippingOfDCAtIndexToCurrentContext:](self, "applyNonClippingOfDCAtIndexToCurrentContext:");
  [(MFGraphicsDevice *)self applyClippingOfDCAtIndexToCurrentContext:a3];
}

- (void)addClippingPathToCurrentDCAndCurrentContext:(id)a3
{
  id v5 = a3;
  double v4 = [(MFDeviceContext *)self->m_currentDC clippingPaths];
  [v4 addObject:v5];

  [(MFGraphicsDevice *)self addClippingPathToCurrentContext:v5 dc:self->m_currentDC];
}

- (void)setClippingPath:(id)a3
{
  id v9 = a3;
  unint64_t v4 = [(MFGraphicsDevice *)self firstClipDCIndex];
  unint64_t v5 = [(MFGraphicsDevice *)self clippingStartDCIndex];
  unint64_t v6 = [(MFGraphicsDevice *)self currentDCIndex];
  if (v6 - v5 != -1)
  {
    uint64_t v7 = v6 - v5 + 1;
    do
    {
      [(MFGraphicsDevice *)self restoreGState:@"setClippingPath unwind states"];
      --v7;
    }
    while (v7);
  }
  [(MFGraphicsDevice *)self saveGState:@"setClippingPath save state before m_firstClipDC"];
  while (v4 <= v6)
    [(MFGraphicsDevice *)self applyNonClippingOfDCAtIndexToCurrentContext:v4++];
  [(MFDeviceContext *)self->m_currentDC setClippingIsRestarted:1];
  uint64_t v8 = [(MFDeviceContext *)self->m_currentDC clippingPaths];
  [v8 removeAllObjects];

  if (v9) {
    [(MFGraphicsDevice *)self addClippingPathToCurrentDCAndCurrentContext:v9];
  }
}

- (int)restoreDC
{
  if ((unint64_t)[(NSMutableArray *)self->m_DCStack count] >= 2)
  {
    BOOL v3 = [(MFDeviceContext *)self->m_currentDC clippingIsRestarted];
    m_firstClipDC = self->m_firstClipDC;
    if (m_firstClipDC == self->m_currentDC)
    {
      self->m_firstClipDC = 0;

      BOOL v3 = 0;
    }
    [(NSMutableArray *)self->m_DCStack removeLastObject];
    unint64_t v5 = [(NSMutableArray *)self->m_DCStack lastObject];
    m_currentDC = self->m_currentDC;
    self->m_currentDC = v5;

    [(MFGraphicsDevice *)self restoreGState:@"restoreDC"];
    if (v3)
    {
      [(MFGraphicsDevice *)self saveGState:@"restoreDC save state before m_firstClipDC"];
      unint64_t v7 = [(MFGraphicsDevice *)self firstClipDCIndex];
      unint64_t v8 = [(MFGraphicsDevice *)self clippingStartDCIndex];
      unint64_t v9 = [(MFGraphicsDevice *)self currentDCIndex];
      if (v7 < v8)
      {
        do
          [(MFGraphicsDevice *)self applyNonClippingOfDCAtIndexToCurrentContext:v7++];
        while (v8 != v7);
      }
      [(MFGraphicsDevice *)self applyDCAtIndexToCurrentContext:v8];
      for (unint64_t i = v8 + 1; i <= v9; ++i)
      {
        [(MFGraphicsDevice *)self saveGState:@"restoreDC apply DC between clippingStartDCIndex+1 and currentDCIndex"];
        [(MFGraphicsDevice *)self applyDCAtIndexToCurrentContext:i];
      }
    }
  }
  return 0;
}

- (id)normalizedClippingPathWithClippingPath:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3 && ([v3 isEmpty] & 1) == 0)
  {
    uint64_t v7 = 0;
    while (v7 < [v4 elementCount])
    {
      unint64_t v8 = [v4 elementAtIndex:v7++] - 3;
      if (v8 >= 0xFFFFFFFFFFFFFFFELL)
      {
        id v5 = v4;
        goto LABEL_4;
      }
    }
  }
  id v5 = 0;
LABEL_4:

  return v5;
}

- (id)currentCummulatedClippingPath
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->m_firstClipDC)
  {
    unint64_t v3 = [(MFGraphicsDevice *)self clippingStartDCIndex];
    unint64_t v4 = [(MFGraphicsDevice *)self currentDCIndex];
    if (v3 <= v4)
    {
      unint64_t v8 = v4;
      id v5 = 0;
      do
      {
        unint64_t v9 = [(NSMutableArray *)self->m_DCStack objectAtIndexedSubscript:v3];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v10 = objc_msgSend(v9, "clippingPaths", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v16;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v10);
              }
              if (v5)
              {
                id v6 = [v5 intersectBezierPath:*(void *)(*((void *)&v15 + 1) + 8 * i)];

                if (!v6 || [v6 isEmpty])
                {
                  uint64_t v7 = +[OITSUBezierPath bezierPath];

                  goto LABEL_22;
                }
                id v5 = v6;
              }
              else
              {
                id v5 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copy];
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        ++v3;
      }
      while (v3 <= v8);
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;
    uint64_t v7 = v6;
LABEL_22:
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)clippingPathByCombiningImplicitClippingPathWithClippingPath:(id)a3 combineMode:(int)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 == 2)
  {
    id v8 = 0;
  }
  else if ((a4 & 0xFFFFFFFB) == 1 || (a4 - 3) > 1)
  {
    id v8 = v6;
  }
  else
  {
    unint64_t v9 = [(MFGraphicsDevice *)self implicitClippingPath];
    id v8 = [v9 subtractBezierPath:v7];
    if (!v8)
    {
      id v8 = +[OITSUBezierPath bezierPath];
    }
  }
  return v8;
}

- (id)clippingPathByCombiningEmptyClippingPathWithClippingPath:(id)a3 combineMode:(int)a4
{
  id v5 = a3;
  if (a4 == 4)
  {
    uint64_t v6 = +[OITSUBezierPath bezierPath];

    id v5 = (id)v6;
  }
  id v7 = v5;

  return v7;
}

- (id)clippingPathByCombiningClippingPath:(id)a3 withClippingPath:(id)a4 combineMode:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = v8;
  if (a5 == 4)
  {
    uint64_t v11 = [v8 intersectBezierPath:v7];
    uint64_t v10 = [v7 subtractBezierPath:v11];
    uint64_t v12 = v9;
    goto LABEL_7;
  }
  if (a5 == 3)
  {
    uint64_t v11 = [v8 uniteWithBezierPath:v7];
    uint64_t v12 = [v9 intersectBezierPath:v7];
    uint64_t v10 = [v11 subtractBezierPath:v12];

LABEL_7:
    unint64_t v9 = v11;
    goto LABEL_8;
  }
  if (a5 != 2) {
    goto LABEL_9;
  }
  uint64_t v10 = [v8 uniteWithBezierPath:v7];
LABEL_8:

  unint64_t v9 = (void *)v10;
LABEL_9:
  if (!v9)
  {
    unint64_t v9 = +[OITSUBezierPath bezierPath];
  }

  return v9;
}

- (int)selectClippingPath:(id)a3 combineMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(MFGraphicsDevice *)self normalizedClippingPathWithClippingPath:v6];

  if (v4 != 5 && !v7) {
    goto LABEL_3;
  }
  if (self->m_firstClipDC)
  {
    if (v4 == 1)
    {
      [(MFGraphicsDevice *)self addClippingPathToCurrentDCAndCurrentContext:v7];
      id v8 = v7;
    }
    else
    {
      if (v4 != 5)
      {
        unint64_t v9 = [(MFGraphicsDevice *)self currentCummulatedClippingPath];
        uint64_t v10 = v9;
        if (v9)
        {
          if ([v9 isEmpty]) {
            [(MFGraphicsDevice *)self clippingPathByCombiningEmptyClippingPathWithClippingPath:v7 combineMode:v4];
          }
          else {
          uint64_t v11 = [(MFGraphicsDevice *)self clippingPathByCombiningClippingPath:v10 withClippingPath:v7 combineMode:v4];
          }
        }
        else
        {
          uint64_t v11 = [(MFGraphicsDevice *)self clippingPathByCombiningImplicitClippingPathWithClippingPath:v7 combineMode:v4];
        }
        uint64_t v12 = (void *)v11;

        id v7 = v12;
      }
      [(MFGraphicsDevice *)self setClippingPath:v7];
      id v8 = v7;
    }
  }
  else
  {
    if (!v7)
    {
LABEL_3:
      id v8 = 0;
      goto LABEL_19;
    }
    id v8 = [(MFGraphicsDevice *)self clippingPathByCombiningImplicitClippingPathWithClippingPath:v7 combineMode:v4];

    if (v8)
    {
      objc_storeStrong((id *)&self->m_firstClipDC, self->m_currentDC);
      [(MFGraphicsDevice *)self addClippingPathToCurrentDCAndCurrentContext:v8];
    }
  }
LABEL_19:

  return 0;
}

- (int)removeClip
{
  return [(MFGraphicsDevice *)self selectClippingPath:0 combineMode:5];
}

- (int)selectClipRegion:(id)a3 combineMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 pathForClippingWithDeviceContext:self->m_currentDC];
  LODWORD(v4) = [(MFGraphicsDevice *)self selectClippingPath:v6 combineMode:v4];

  return v4;
}

- (int)offsetClipRegionByX:(int)a3 y:(int)a4
{
  if (self->m_firstClipDC)
  {
    id v7 = [(MFGraphicsDevice *)self currentCummulatedClippingPath];
    id v8 = v7;
    if (v7 && ([v7 isEmpty] & 1) == 0)
    {
      memset(&v20, 0, sizeof(v20));
      CGAffineTransformMakeTranslation(&v20, (double)a3, (double)a4);
      memset(&v19, 0, sizeof(v19));
      unint64_t v9 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
      uint64_t v10 = v9;
      if (v9) {
        [v9 getTransformMatrix];
      }
      else {
        memset(&v19, 0, sizeof(v19));
      }

      memset(&v18, 0, sizeof(v18));
      CGAffineTransform v15 = v19;
      CGAffineTransformInvert(&t1, &v15);
      CGAffineTransform t2 = v20;
      CGAffineTransformConcat(&v17, &t1, &t2);
      CGAffineTransform v13 = v19;
      CGAffineTransformConcat(&v18, &v17, &v13);
      CGAffineTransform v12 = v18;
      [v8 transformUsingAffineTransform:&v12];
      [(MFGraphicsDevice *)self selectClippingPath:v8 combineMode:5];
    }
  }
  return 0;
}

- (int)moveTo:(double)a3 y:(double)a4
{
  return 0;
}

- (int)lineTo:(double)a3 y:(double)a4
{
  return [(MFDeviceDriver *)self->m_deviceDriver lineTo:self->m_currentDC x:a3 y:a4];
}

- (int)polygon:(CGPoint *)a3 in_count:(int)a4
{
  return [(MFDeviceDriver *)self->m_deviceDriver polygon:self->m_currentDC in_points:a3 in_count:*(void *)&a4];
}

- (int)polyPolygon:(CGPoint *)a3 in_polyCounts:(int *)a4 in_count:(int)a5
{
  return [(MFDeviceDriver *)self->m_deviceDriver polyPolygon:self->m_currentDC in_points:a3 in_polyCounts:a4 in_count:*(void *)&a5];
}

- (int)setArcDirection:(int)a3
{
  return 0;
}

- (int)polyline:(CGPoint *)a3 in_count:(int)a4
{
  return [(MFDeviceDriver *)self->m_deviceDriver polyline:self->m_currentDC in_points:a3 in_count:*(void *)&a4];
}

- (int)polyPolyline:(CGPoint *)a3 in_polyCounts:(int *)a4 in_count:(int)a5
{
  return [(MFDeviceDriver *)self->m_deviceDriver polyPolyline:self->m_currentDC in_points:a3 in_polyCounts:a4 in_count:*(void *)&a5];
}

- (int)arc:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10
{
  LODWORD(v11) = a10;
  return -[MFDeviceDriver arc:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_deviceDriver, "arc:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", self->m_currentDC, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)pie:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10
{
  LODWORD(v11) = a10;
  return -[MFDeviceDriver pie:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_deviceDriver, "pie:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", self->m_currentDC, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)angleArc:(int)a3 y:(int)a4 radius:(unsigned int)a5 startAngle:(double)a6 sweepAngle:(double)a7
{
  return [(MFDeviceDriver *)self->m_deviceDriver angleArc:self->m_currentDC x:*(void *)&a3 y:*(void *)&a4 radius:*(void *)&a5 startAngle:a6 sweepAngle:a7];
}

- (int)arcTo:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10
{
  LODWORD(v11) = a10;
  return -[MFDeviceDriver arcTo:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_deviceDriver, "arcTo:nLeftRect:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", self->m_currentDC, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)chord:(int)a3 nTopRect:(int)a4 nRightRect:(int)a5 nBottomRect:(int)a6 nXStartArc:(int)a7 nYStartArc:(int)a8 nXEndArc:(int)a9 nYEndArc:(int)a10
{
  LODWORD(v11) = a10;
  return -[MFDeviceDriver chord:leftRect:topRect:rightRect:bottomRect:xStartArc:yStartArc:xEndArc:yEndArc:](self->m_deviceDriver, "chord:leftRect:topRect:rightRect:bottomRect:xStartArc:yStartArc:xEndArc:yEndArc:", self->m_currentDC, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)bezierTo:(int)a3 y:(int)a4 x2:(int)a5 y2:(int)a6 x3:(int)a7 y3:(int)a8
{
  LODWORD(v9) = a8;
  return [(MFDeviceDriver *)self->m_deviceDriver bezierTo:self->m_currentDC x:*(void *)&a3 y:*(void *)&a4 x2:*(void *)&a5 y2:*(void *)&a6 x3:*(void *)&a7 y3:v9];
}

- (int)bezier:(int)a3 y:(int)a4 x2:(int)a5 y2:(int)a6 x3:(int)a7 y3:(int)a8 x4:(int)a9 y4:(int)a10
{
  LODWORD(v11) = a10;
  return -[MFDeviceDriver bezier:x:y:x2:y2:x3:y3:x4:y4:](self->m_deviceDriver, "bezier:x:y:x2:y2:x3:y3:x4:y4:", self->m_currentDC, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, __PAIR64__(a9, a8), v11);
}

- (int)roundRect:(int)a3 top:(int)a4 right:(int)a5 bottom:(int)a6 rx:(double)a7 ry:(double)a8
{
  return [(MFDeviceDriver *)self->m_deviceDriver roundRect:self->m_currentDC left:*(void *)&a3 top:*(void *)&a4 right:*(void *)&a5 bottom:*(void *)&a6 rx:a7 ry:a8];
}

- (int)createBrush:(int)a3 in_colour:(id)a4 hatchstyle:(int)a5 index:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      CGAffineTransform v15 = [(MFDeviceDriver *)self->m_deviceDriver createNullBrush];
      if (v15) {
        goto LABEL_9;
      }
    }
    else
    {
      if (!a3)
      {
        m_deviceDriver = self->m_deviceDriver;
        CGAffineTransform v12 = [(MFGraphicsDevice *)self recolor:v10 fill:1];
        uint64_t v13 = [(MFDeviceDriver *)m_deviceDriver createSolidBrush:v12];
        goto LABEL_6;
      }
      CGAffineTransform v15 = 0;
    }
LABEL_11:
    int v16 = -1;
    goto LABEL_12;
  }
  uint64_t v14 = self->m_deviceDriver;
  CGAffineTransform v12 = [(MFGraphicsDevice *)self recolor:v10 fill:1];
  uint64_t v13 = [(MFDeviceDriver *)v14 createHatchBrush:v12 in_hatchstyle:v7];
LABEL_6:
  CGAffineTransform v15 = (void *)v13;

  if (!v15) {
    goto LABEL_11;
  }
LABEL_9:
  int v16 = [(MFObjectTable *)self->m_objectTable putObject:v15 in_objectPos:v6];
LABEL_12:

  return v16;
}

- (int)createFontIndirect:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17
{
  LODWORD(v23) = a16;
  BYTE4(v22) = a13;
  HIDWORD(v21) = a11;
  LODWORD(v22) = a12;
  LOWORD(v21) = __PAIR16__(a10, a9);
  CGAffineTransform v18 = -[MFDeviceDriver createFont:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:](self->m_deviceDriver, "createFont:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, a8, v21, v22, *(void *)&a14, v23, a17);
  if (v18) {
    int v19 = [(MFObjectTable *)self->m_objectTable putObject:v18 in_objectPos:0xFFFFFFFFLL];
  }
  else {
    int v19 = -1;
  }

  return v19;
}

- (int)createFontIndirectW:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24 index:(unsigned int)a25
{
  LODWORD(v32) = a24;
  LODWORD(v31) = a16;
  BYTE4(v30) = a13;
  HIDWORD(v29) = a11;
  LODWORD(v30) = a12;
  LOWORD(v29) = __PAIR16__(a10, a9);
  -[MFDeviceDriver createFontIndirectW:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:](self->m_deviceDriver, "createFontIndirectW:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, a8, v29, v30, *(void *)&a14, v31, a17, a18, a19, *(void *)&a20, *(void *)&a22,
  unint64_t v26 = v32);
  if (v26) {
    int v27 = [(MFObjectTable *)self->m_objectTable putObject:v26 in_objectPos:a25];
  }
  else {
    int v27 = -1;
  }

  return v27;
}

- (int)createPen:(int)a3 width:(int)a4 in_colour:(id)a5 in_userStyleArray:(double *)a6 index:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  m_deviceDriver = self->m_deviceDriver;
  uint64_t v13 = [(MFGraphicsDevice *)self recolor:a5 fill:0];
  uint64_t v14 = [(MFDeviceDriver *)m_deviceDriver createPen:v10 in_width:v9 in_colour:v13 in_userStyleArray:a6];

  LODWORD(v7) = [(MFObjectTable *)self->m_objectTable putObject:v14 in_objectPos:v7];
  return v7;
}

- (id)createColorWithRGBBytes:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5 flags:(unsigned __int8)a6
{
  uint64_t v6 = a3;
  if (a6 == 1)
  {
    uint64_t v7 = [(MFDeviceContext *)self->m_currentDC getSelectedPalette];
    id v8 = [v7 getColour:v6];
  }
  else
  {
    id v8 = +[OITSUColor colorWithRGBBytes:a3 green:a4 blue:a5];
  }
  return v8;
}

- (int)setPaletteEntries:(unsigned int)a3 in_colours:(id)a4 in_index:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (v5 == -1) {
    [(MFDeviceContext *)self->m_currentDC getSelectedPalette];
  }
  else {
  uint64_t v9 = [(MFObjectTable *)self->m_objectTable getObject:v5];
  }
  if (objc_msgSend(v9, "setEntries:in_colours:", v6, v8)) {
    int v10 = 0;
  }
  else {
    int v10 = -7;
  }

  return v10;
}

- (int)resizePalette:(unsigned int)a3 in_index:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  if (a4 == -1) {
    [(MFDeviceContext *)self->m_currentDC getSelectedPalette];
  }
  else {
  uint64_t v5 = [(MFObjectTable *)self->m_objectTable getObject:*(void *)&a4];
  }
  int v6 = [v5 resize:v4] - 1;

  return v6;
}

- (int)createPalette:(id)a3 in_index:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v6 = +[MFPalette paletteWithColours:a3];
  if (v6) {
    int v7 = [(MFObjectTable *)self->m_objectTable putObject:v6 in_objectPos:v4];
  }
  else {
    int v7 = -1;
  }

  return v7;
}

- (int)createPatternBrush:(id)a3 index:(unsigned int)a4 usePaletteForBilevel:(BOOL)a5
{
  uint64_t v5 = *(void *)&a4;
  int v7 = [(MFDeviceDriver *)self->m_deviceDriver createPatternBrush:a3 usePaletteForBilevel:a5];
  if (v7) {
    int v8 = [(MFObjectTable *)self->m_objectTable putObject:v7 in_objectPos:v5];
  }
  else {
    int v8 = -1;
  }

  return v8;
}

- (int)setWindowExt:(int)a3 in_y:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v6 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v4) = objc_msgSend(v6, "setWindowExt:in_y:", v5, v4);

  return v4;
}

- (int)setWindowOrg:(int)a3 in_y:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v6 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v4) = objc_msgSend(v6, "setWindowOrg:in_y:", v5, v4);

  return v4;
}

- (int)setViewportExt:(int)a3 in_y:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v6 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v4) = objc_msgSend(v6, "setViewportExt:in_y:", v5, v4);

  return v4;
}

- (int)offsetWindowOrg:(int)a3 in_y:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v6 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v4) = objc_msgSend(v6, "offsetWindowOrg:in_y:", v5, v4);

  return v4;
}

- (int)offsetViewportOrg:(int)a3 in_y:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v6 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v4) = objc_msgSend(v6, "offsetViewportOrg:in_y:", v5, v4);

  return v4;
}

- (int)setViewportOrg:(int)a3 in_y:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v6 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v4) = objc_msgSend(v6, "setViewportOrg:in_y:", v5, v4);

  return v4;
}

- (int)scaleViewportExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  int v10 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v6) = objc_msgSend(v10, "scaleViewportExt:in_xDenom:in_yNum:in_yDenom:", v9, v8, v7, v6);

  return v6;
}

- (int)scaleWindowExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  int v10 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v6) = objc_msgSend(v10, "scaleWindowExt:in_xDenom:in_yNum:in_yDenom:", v9, v8, v7, v6);

  return v6;
}

- (int)modifyWorldTransform:(const CGAffineTransform *)a3 in_command:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [(MFDeviceContext *)self->m_currentDC getCurrentTransform];
  LODWORD(v4) = objc_msgSend(v6, "modifyWorldTransform:in_command:", a3, v4);

  return v4;
}

- (int)abortPath
{
  double v2 = [(MFDeviceContext *)self->m_currentDC getPath];
  int v3 = [v2 abort];

  return v3;
}

- (int)widenPath
{
  double v2 = self;
  int v3 = [(MFDeviceContext *)self->m_currentDC getPath];
  LODWORD(v2) = [v3 widen:v2->m_currentDC];

  return (int)v2;
}

- (int)strokeAndFillPath:(BOOL)a3 in_fill:(BOOL)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(MFDeviceContext *)self->m_currentDC getPath];
  uint64_t v8 = v7;
  if (v4) {
    int v4 = [v7 fill:self->m_currentDC];
  }
  if (v5 && !v4) {
    int v4 = [v8 stroke:self->m_currentDC];
  }

  return v4;
}

- (int)selectClipRegionWithRects:(id)a3 in_mode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [v6 count];
  if (v4 != 5 || v7)
  {
    uint64_t v9 = [(MFDeviceDriver *)self->m_deviceDriver createRegionWithRects:v6 in_dc:self->m_currentDC];
    if (v9) {
      int v8 = [(MFGraphicsDevice *)self selectClipRegion:v9 combineMode:v4];
    }
    else {
      int v8 = -1;
    }
  }
  else
  {
    [(MFGraphicsDevice *)self removeClip];
    int v8 = 0;
  }

  return v8;
}

- (int)setClipRegion:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v4 = -[MFObjectTable getObject:](self->m_objectTable, "getObject:");
    if (v4) {
      int v5 = [(MFGraphicsDevice *)self selectClipRegion:v4 combineMode:5];
    }
    else {
      int v5 = 0;
    }

    return v5;
  }
  else
  {
    return [(MFGraphicsDevice *)self removeClip];
  }
}

- (int)paintRgnWithRects:(id)a3
{
  uint64_t v4 = [(MFDeviceDriver *)self->m_deviceDriver createRegionWithRects:a3 in_dc:self->m_currentDC];
  int v5 = [(MFDeviceContext *)self->m_currentDC getBrush];
  if (v4) {
    int v6 = objc_msgSend(v4, "fill:in_brush:", self->m_currentDC, v5);
  }
  else {
    int v6 = -1;
  }

  return v6;
}

- (int)paintRgn:(unsigned int)a3
{
  uint64_t v4 = [(MFObjectTable *)self->m_objectTable getObject:*(void *)&a3];
  int v5 = [(MFDeviceContext *)self->m_currentDC getBrush];
  if (v4) {
    int v6 = objc_msgSend(v4, "fill:in_brush:", self->m_currentDC, v5);
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (int)invertRgnWithRects:(id)a3
{
  uint64_t v4 = [(MFDeviceDriver *)self->m_deviceDriver createRegionWithRects:a3 in_dc:self->m_currentDC];
  int v5 = v4;
  if (v4) {
    int v6 = [v4 invert:self->m_currentDC];
  }
  else {
    int v6 = -1;
  }

  return v6;
}

- (int)invertRgn:(unsigned int)a3
{
  uint64_t v4 = [(MFObjectTable *)self->m_objectTable getObject:*(void *)&a3];
  int v5 = v4;
  if (v4) {
    int v6 = [v4 invert:self->m_currentDC];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (int)fillRgnWithRects:(id)a3 in_brushID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v6 = [(MFDeviceDriver *)self->m_deviceDriver createRegionWithRects:a3 in_dc:self->m_currentDC];
  uint64_t v7 = [(MFObjectTable *)self->m_objectTable getObject:v4];
  if (v6) {
    int v8 = objc_msgSend(v6, "fill:in_brush:", self->m_currentDC, v7);
  }
  else {
    int v8 = -1;
  }

  return v8;
}

- (int)fillRgn:(unsigned int)a3 in_brushID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v6 = [(MFObjectTable *)self->m_objectTable getObject:*(void *)&a3];
  uint64_t v7 = [(MFObjectTable *)self->m_objectTable getObject:v4];
  if (v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v8 = objc_msgSend(v6, "fill:in_brush:", self->m_currentDC, v7);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (int)frameRegionWithRects:(id)a3 in_brushID:(unsigned int)a4 in_width:(int)a5 in_height:(int)a6
{
  uint64_t v6 = *(void *)&a4;
  int v8 = -[MFDeviceDriver createRegionWithRects:in_dc:](self->m_deviceDriver, "createRegionWithRects:in_dc:", a3, self->m_currentDC, *(void *)&a5, *(void *)&a6);
  uint64_t v9 = [(MFObjectTable *)self->m_objectTable getObject:v6];
  if (v8) {
    int v10 = objc_msgSend(v8, "frame:in_brush:", self->m_currentDC, v9);
  }
  else {
    int v10 = -1;
  }

  return v10;
}

- (int)frameRegion:(unsigned int)a3 in_brushID:(unsigned int)a4 in_width:(int)a5 in_height:(int)a6
{
  uint64_t v6 = *(void *)&a4;
  int v8 = -[MFObjectTable getObject:](self->m_objectTable, "getObject:", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6);
  uint64_t v9 = [(MFObjectTable *)self->m_objectTable getObject:v6];
  if (v8) {
    int v10 = objc_msgSend(v8, "frame:in_brush:", self->m_currentDC, v9);
  }
  else {
    int v10 = -1;
  }

  return v10;
}

- (id)createDIBitmap:(const char *)a3 in_dibSize:(unsigned int)a4 in_usage:(int)a5
{
  return (id)[(MFDeviceDriver *)self->m_deviceDriver createDIBitmap:self->m_currentDC in_dib:a3 in_dibSize:*(void *)&a4 in_usage:*(void *)&a5];
}

- (id)createDIBitmap:(const char *)a3 in_headerSize:(unsigned int)a4 in_bitmap:(const char *)a5 in_bitmapSize:(unsigned int)a6 in_usage:(int)a7
{
  return (id)[(MFDeviceDriver *)self->m_deviceDriver createDIBitmap:self->m_currentDC in_header:a3 in_headerSize:*(void *)&a4 in_bitmap:a5 in_bitmapSize:*(void *)&a6 in_usage:*(void *)&a7];
}

- (id)createBitmap:(unsigned int)a3 in_height:(unsigned int)a4 in_planes:(unsigned int)a5 in_bitsPerPixel:(unsigned int)a6 in_bitmap:(const char *)a7 in_bitmapSize:(unsigned int)a8
{
  LODWORD(v9) = a8;
  return (id)[(MFDeviceDriver *)self->m_deviceDriver createBitmap:self->m_currentDC in_width:*(void *)&a3 in_height:*(void *)&a4 in_planes:*(void *)&a5 in_bitsPerPixel:*(void *)&a6 in_bitmap:a7 in_bitmapSize:v9];
}

- (int)patBlt:(int)a3 in_y:(int)a4 in_width:(int)a5 in_height:(int)a6 in_rop:(unsigned int)a7
{
  return [(MFDeviceDriver *)self->m_deviceDriver patBlt:self->m_currentDC in_x:*(void *)&a3 in_y:*(void *)&a4 in_width:*(void *)&a5 in_height:*(void *)&a6 in_rop:*(void *)&a7];
}

- (int)bitBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_rop:(unsigned int)a10 in_xform:(CGAffineTransform *)a11 in_colour:(unsigned int)a12
{
  uint64_t v13 = *(void *)&a6;
  uint64_t v14 = *(void *)&a5;
  uint64_t v15 = *(void *)&a4;
  uint64_t v16 = *(void *)&a3;
  id v18 = a7;
  [v18 setMonoPalette:self->m_currentDC];
  LODWORD(v21) = a12;
  LODWORD(v20) = a10;
  LODWORD(v13) = -[MFDeviceDriver bitBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_deviceDriver, "bitBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", self->m_currentDC, v16, v15, v14, v13, v18, __PAIR64__(a9, a8), v20, a11, v21);

  return v13;
}

- (int)stretchBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_widthSrc:(int)a10 in_heightSrc:(int)a11 in_rop:(unsigned int)a12 in_xform:(CGAffineTransform *)a13 in_colour:(unsigned int)a14
{
  uint64_t v15 = *(void *)&a6;
  uint64_t v16 = *(void *)&a5;
  uint64_t v17 = *(void *)&a4;
  uint64_t v18 = *(void *)&a3;
  id v20 = a7;
  [v20 setMonoPalette:self->m_currentDC];
  LODWORD(v23) = a14;
  LODWORD(v22) = a12;
  LODWORD(v15) = -[MFDeviceDriver stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_deviceDriver, "stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", self->m_currentDC, v18, v17, v16, v15, v20, __PAIR64__(a9, a8), __PAIR64__(a11, a10), v22, a13, v23);

  return v15;
}

- (int)stretchBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_widthSrc:(int)a10 in_heightSrc:(int)a11 in_rop:(unsigned int)a12 in_xform:(CGAffineTransform *)a13 in_colour:(unsigned int)a14 usePaletteForBilevel:(BOOL)a15
{
  LODWORD(v17) = a14;
  *(_OWORD *)&v16[4] = *(_OWORD *)&a9;
  *(_DWORD *)uint64_t v16 = a8;
  return -[MFDeviceDriver stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_deviceDriver, "stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", self->m_currentDC, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, a7, *(void *)v16, (unint64_t)(*(_OWORD *)&a9 >> 32), *(void *)&v16[16], a13, v17);
}

- (int)alphaBlend:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_widthSrc:(int)a10 in_heightSrc:(int)a11 in_sourceConstantOpacity:(unsigned __int8)a12 in_useSourceAlphaChannel:(BOOL)a13 in_xform:(CGAffineTransform *)a14 in_colour:(unsigned int)a15
{
  uint64_t v16 = *(void *)&a6;
  uint64_t v17 = *(void *)&a5;
  uint64_t v18 = *(void *)&a4;
  uint64_t v19 = *(void *)&a3;
  id v21 = a7;
  [v21 setMonoPalette:self->m_currentDC];
  LODWORD(v25) = a15;
  LOWORD(v24) = __PAIR16__(a13, a12);
  HIDWORD(v23) = a11;
  LODWORD(v23) = a8;
  *(void *)((char *)&v23 + 4) = __PAIR64__(a10, a9);
  LODWORD(v16) = -[MFDeviceDriver alphaBlend:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_sourceConstantOpacity:in_useSourceAlphaChannel:in_xform:in_colour:](self->m_deviceDriver, "alphaBlend:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_sourceConstantOpacity:in_useSourceAlphaChannel:in_xform:in_colour:", self->m_currentDC, v19, v18, v17, v16, v21, v23, v24, a14, v25);

  return v16;
}

- (int)maskBlt:(int)a3 in_yDest:(int)a4 in_widthDest:(int)a5 in_heightDest:(int)a6 in_sourceImage:(id)a7 in_xSrc:(int)a8 in_ySrc:(int)a9 in_maskImage:(id)a10 in_xMask:(int)a11 in_yMask:(int)a12 in_rop:(unsigned int)a13 in_xform:(CGAffineTransform *)a14 in_colour:(unsigned int)a15
{
  uint64_t v16 = *(void *)&a6;
  uint64_t v17 = *(void *)&a5;
  uint64_t v18 = *(void *)&a4;
  uint64_t v19 = *(void *)&a3;
  id v21 = a7;
  id v22 = a10;
  [v21 setMonoPalette:self->m_currentDC];
  LODWORD(v25) = a15;
  LODWORD(v24) = a13;
  LODWORD(v16) = -[MFDeviceDriver maskBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_maskImage:in_xMask:in_yMask:in_rop:in_xform:in_colour:](self->m_deviceDriver, "maskBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_maskImage:in_xMask:in_yMask:in_rop:in_xform:in_colour:", self->m_currentDC, v19, v18, v17, v16, v21, __PAIR64__(a9, a8), v22, __PAIR64__(a12, a11), v24, a14, v25);

  return v16;
}

- (int)plgBlt:(CGPoint *)a3 in_sourceImage:(id)a4 in_xSrc:(int)a5 in_ySrc:(int)a6 in_widthSrc:(int)a7 in_heightSrc:(int)a8 in_maskImage:(id)a9 in_xMask:(int)a10 in_yMask:(int)a11 in_xform:(CGAffineTransform *)a12 in_colour:(unsigned int)a13
{
  uint64_t v14 = *(void *)&a7;
  uint64_t v15 = *(void *)&a6;
  uint64_t v16 = *(void *)&a5;
  id v19 = a4;
  id v20 = a9;
  [v19 setMonoPalette:self->m_currentDC];
  LODWORD(v23) = a13;
  LODWORD(v22) = a8;
  LODWORD(v14) = -[MFDeviceDriver plgBlt:in_destinationParallelogram:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_maskImage:in_xMask:in_yMask:in_xform:in_colour:](self->m_deviceDriver, "plgBlt:in_destinationParallelogram:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_maskImage:in_xMask:in_yMask:in_xform:in_colour:", self->m_currentDC, a3, v19, v16, v15, v14, v22, v20, __PAIR64__(a11, a10), a12, v23);

  return v14;
}

- (void)setMaximumObjectTableSize:(unsigned int)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_fillMap, 0);
  objc_storeStrong((id *)&self->m_colorMap, 0);
  objc_storeStrong((id *)&self->m_stockObjects, 0);
  objc_storeStrong((id *)&self->m_objectTable, 0);
  objc_storeStrong((id *)&self->m_deviceDriver, 0);
  objc_storeStrong((id *)&self->m_firstClipDC, 0);
  objc_storeStrong((id *)&self->m_DCStack, 0);
  objc_storeStrong((id *)&self->m_currentDC, 0);
}

@end