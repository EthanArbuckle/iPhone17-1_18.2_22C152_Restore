@interface NeverTemplatedImage
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)init;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCGImage:(CGImage *)a3;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCGImage:(CGImage *)a3 imageOrientation:(int64_t)a4;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCIImage:(id)a3;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCIImage:(id)a3 scale:(double)a4 orientation:(int64_t)a5;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCoder:(id)a3;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithContentsOfFile:(id)a3;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithContentsOfFile:(id)a3 cache:(BOOL)a4;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithData:(id)a3;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithData:(id)a3 scale:(double)a4;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithIOSurface:(__IOSurface *)a3;
- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
@end

@implementation NeverTemplatedImage

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithContentsOfFile:(id)a3
{
  sub_25B8FFF78();
  v4 = (void *)sub_25B8FFF68();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  v5 = [(NeverTemplatedImage *)&v7 initWithContentsOfFile:v4];

  if (v5) {
  return v5;
  }
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_25B8FE4B8();
  unint64_t v7 = v6;

  v8 = (void *)sub_25B8FE4A8();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  v9 = [(NeverTemplatedImage *)&v12 initWithData:v8];
  sub_25B7D3170(v5, v7);
  v10 = v9;

  if (v10) {
  return v10;
  }
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithData:(id)a3 scale:(double)a4
{
  id v6 = a3;
  uint64_t v7 = sub_25B8FE4B8();
  unint64_t v9 = v8;

  v10 = (void *)sub_25B8FE4A8();
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  v11 = [(NeverTemplatedImage *)&v14 initWithData:v10 scale:a4];
  sub_25B7D3170(v7, v9);
  objc_super v12 = v11;

  if (v12) {
  return v12;
  }
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCGImage:(CGImage *)a3
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_25B871B40(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCGImage_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_25B871BA0(self, a4, (uint64_t)a2, (uint64_t)a3, a5, (SEL *)&selRef_initWithCGImage_scale_orientation_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCIImage:(id)a3
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_25B871B40(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCIImage_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCIImage:(id)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_25B871BA0(self, a4, (uint64_t)a2, (uint64_t)a3, a5, (SEL *)&selRef_initWithCIImage_scale_orientation_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  return [(NeverTemplatedImage *)&v3 init];
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCoder:(id)a3
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_25B871B40(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_25B8FE4B8();
  unint64_t v10 = v9;

  sub_25B8FFF78();
  v11 = (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_25B878A30();
  sub_25B7D3170(v8, v10);
  return v11;
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithContentsOfFile:(id)a3 cache:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    sub_25B8FFF78();
    id v6 = (void *)sub_25B8FFF68();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  id v7 = [(NeverTemplatedImage *)&v9 initWithContentsOfFile:v6 cache:v4];

  if (v7) {
  return v7;
  }
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithCGImage:(CGImage *)a3 imageOrientation:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NeverTemplatedImage();
  return [(NeverTemplatedImage *)&v7 initWithCGImage:a3 imageOrientation:a4];
}

- (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage)initWithIOSurface:(__IOSurface *)a3
{
  return (_TtC15SafetyMonitorUIP33_0136281DCC3F5D58BE1F34FEE765118619NeverTemplatedImage *)sub_25B871B40(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithIOSurface_);
}

@end