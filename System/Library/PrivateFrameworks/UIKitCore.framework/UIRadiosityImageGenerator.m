@interface UIRadiosityImageGenerator
@end

@implementation UIRadiosityImageGenerator

void __44___UIRadiosityImageGenerator_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_UIRadiosityImageGenerator);
  v1 = (void *)qword_1EB264F08;
  qword_1EB264F08 = (uint64_t)v0;
}

uint64_t __63___UIRadiosityImageGenerator_imageWithImage_completionHandler___block_invoke()
{
  objc_opt_class();
  uint64_t result = objc_opt_respondsToSelector();
  _MergedGlobals_1314 = result & 1;
  return result;
}

uint64_t __63___UIRadiosityImageGenerator_imageWithImage_completionHandler___block_invoke_2(uint64_t a1, CGImageRef image)
{
  double Width = (double)CGImageGetWidth(image);
  size_t Height = CGImageGetHeight(image);
  v6.n128_f64[0] = Width / *(double *)(a1 + 40);
  v7.n128_f64[0] = (double)Height / *(double *)(a1 + 48);
  v8 = *(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 32) + 16);
  return v8(v6, v7);
}

@end