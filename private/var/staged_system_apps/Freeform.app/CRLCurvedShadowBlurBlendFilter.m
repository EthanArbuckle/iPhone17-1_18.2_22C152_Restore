@interface CRLCurvedShadowBlurBlendFilter
+ (id)blurBlendKernel;
@end

@implementation CRLCurvedShadowBlurBlendFilter

+ (id)blurBlendKernel
{
  if (qword_1016A91F8 != -1) {
    dispatch_once(&qword_1016A91F8, &stru_1014DE3E8);
  }
  v2 = (void *)qword_1016A91F0;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputMiddleOpacity, 0);
  objc_storeStrong((id *)&self->inputEdgeOpacity, 0);
  objc_storeStrong((id *)&self->inputPadding, 0);
  objc_storeStrong((id *)&self->inputExtent, 0);
  objc_storeStrong((id *)&self->inputMiddleBlurImage, 0);
  objc_storeStrong((id *)&self->inputInterpBlurImage, 0);

  objc_storeStrong((id *)&self->inputEdgeBlurImage, 0);
}

@end