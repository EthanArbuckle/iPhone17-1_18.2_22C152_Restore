@interface CRLCurvedShadowCurveFilter
+ (id)curveKernel;
@end

@implementation CRLCurvedShadowCurveFilter

+ (id)curveKernel
{
  if (qword_1016A91E8 != -1) {
    dispatch_once(&qword_1016A91E8, &stru_1014DE3C8);
  }
  v2 = (void *)qword_1016A91E0;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputCurveAmount, 0);
  objc_storeStrong((id *)&self->inputPadding, 0);
  objc_storeStrong((id *)&self->inputExtent, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end