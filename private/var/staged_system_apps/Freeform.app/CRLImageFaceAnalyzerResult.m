@interface CRLImageFaceAnalyzerResult
- (CGPoint)maskCenterForFacesWithImageSize:(CGSize)a3 maskSize:(CGSize)a4 defaultCenter:(CGPoint)a5;
- (CGRect)interestingFacesRect;
- (_TtC8Freeform26CRLImageFaceAnalyzerResult)init;
- (_TtC8Freeform26CRLImageFaceAnalyzerResult)initWithFaceRectValues:(id)a3;
@end

@implementation CRLImageFaceAnalyzerResult

- (CGRect)interestingFacesRect
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform26CRLImageFaceAnalyzerResult_interestingFacesRect);
  double v3 = *(double *)&self->interestingFacesRect[OBJC_IVAR____TtC8Freeform26CRLImageFaceAnalyzerResult_interestingFacesRect];
  double v4 = *(double *)&self->interestingFacesRect[OBJC_IVAR____TtC8Freeform26CRLImageFaceAnalyzerResult_interestingFacesRect
                                            + 8];
  double v5 = *(double *)&self->interestingFacesRect[OBJC_IVAR____TtC8Freeform26CRLImageFaceAnalyzerResult_interestingFacesRect
                                            + 16];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (_TtC8Freeform26CRLImageFaceAnalyzerResult)initWithFaceRectValues:(id)a3
{
  if (a3)
  {
    sub_10050BF48(0, (unint64_t *)&qword_10167AF10);
    unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    unint64_t v3 = 0;
  }
  return (_TtC8Freeform26CRLImageFaceAnalyzerResult *)CRLImageFaceAnalyzerResult.init(faceRectValues:)(v3);
}

- (CGPoint)maskCenterForFacesWithImageSize:(CGSize)a3 maskSize:(CGSize)a4 defaultCenter:(CGPoint)a5
{
  double height = a4.height;
  double width = a4.width;
  CGFloat v7 = a3.height;
  CGFloat v8 = a3.width;
  v9 = self;
  CRLImageFaceAnalyzerResult.maskCenterForFaces(imageSize:maskSize:defaultCenter:)(v8, v7, width, height);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (_TtC8Freeform26CRLImageFaceAnalyzerResult)init
{
  CGPoint result = (_TtC8Freeform26CRLImageFaceAnalyzerResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end