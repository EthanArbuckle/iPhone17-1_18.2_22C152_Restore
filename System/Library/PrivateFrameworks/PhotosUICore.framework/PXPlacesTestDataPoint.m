@interface PXPlacesTestDataPoint
- (CGImage)image;
- (CLLocationCoordinate2D)coordinate;
- (NSString)description;
- (NSString)name;
- (PXPlacesTestDataPoint)initWithName:(id)a3 location:(CLLocationCoordinate2D)a4;
- (int64_t)compareTo:(id)a3;
@end

@implementation PXPlacesTestDataPoint

- (void).cxx_destruct
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (CGImage)image
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v4 = CGBitmapContextCreate(0, 0x20uLL, 0x20uLL, 8uLL, 0x80uLL, DeviceRGB, 2u);
  CFRelease(DeviceRGB);
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v24.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v24.c = v5;
  *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGContextSetTextMatrix(v4, &v24);
  Mutable = CGPathCreateMutable();
  v29.size.width = 32.0;
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.height = 32.0;
  CGPathAddRect(Mutable, 0, v29);
  v7 = CFAttributedStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  v8 = [(PXPlacesTestDataPoint *)self name];
  v26.location = 0;
  v26.length = 0;
  CFAttributedStringReplaceString(v7, v26, v8);

  v9 = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)&v24.a = xmmword_1AB35CFE0;
  *(_OWORD *)&v24.c = unk_1AB35CFF0;
  CGColorRef v10 = CGColorCreate(v9, &v24.a);
  CGColorSpaceRelease(v9);
  NSUInteger v11 = [(NSString *)self->_name length];
  unint64_t v12 = 18;
  if (v11 > 3) {
    unint64_t v12 = 14;
  }
  CTFontRef v13 = CTFontCreateWithName(@"Helvetica", (double)v12, 0);
  v14 = [(PXPlacesTestDataPoint *)self name];
  CFIndex v15 = [v14 length];
  uint64_t v16 = *MEMORY[0x1E4F243F0];
  v22[0] = *MEMORY[0x1E4F24740];
  v22[1] = v16;
  v23[0] = v10;
  v23[1] = v13;
  CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v27.location = 0;
  v27.length = v15;
  CFAttributedStringSetAttributes(v7, v27, v17, 0);

  v18 = CTFramesetterCreateWithAttributedString(v7);
  CFRelease(v7);
  v28.location = 0;
  v28.length = 0;
  Frame = CTFramesetterCreateFrame(v18, v28, Mutable, 0);
  CTFrameDraw(Frame, v4);
  CFRelease(Frame);
  CFRelease(Mutable);
  CFRelease(v18);
  CGImageRef Image = CGBitmapContextCreateImage(v4);
  CFRelease(v4);
  if (Image) {
    CFAutorelease(Image);
  }
  return Image;
}

- (int64_t)compareTo:(id)a3
{
  id v4 = a3;
  [(PXPlacesTestDataPoint *)self coordinate];
  double v6 = v5;
  [v4 coordinate];
  double v8 = v7;
  [(PXPlacesTestDataPoint *)self coordinate];
  double v10 = v9;
  [v4 coordinate];
  double v12 = v11;

  if (v6 > v8) {
    return 1;
  }
  int64_t v14 = 1;
  if (v10 <= v12) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = -1;
  }
  if (v10 >= v12) {
    int64_t v14 = v15;
  }
  if (v6 >= v8) {
    return v14;
  }
  else {
    return -1;
  }
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"Datapoint: <%p>, coordinate: %g, %g", self, *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude];
}

- (PXPlacesTestDataPoint)initWithName:(id)a3 location:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPlacesTestDataPoint;
  double v9 = [(PXPlacesTestDataPoint *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v10->_coordinate.CLLocationDegrees latitude = latitude;
    v10->_coordinate.CLLocationDegrees longitude = longitude;
  }

  return v10;
}

@end