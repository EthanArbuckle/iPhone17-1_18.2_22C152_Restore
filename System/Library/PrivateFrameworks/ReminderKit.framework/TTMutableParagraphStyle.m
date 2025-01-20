@interface TTMutableParagraphStyle
+ (id)paragraphStyleNamed:(unsigned int)a3;
@end

@implementation TTMutableParagraphStyle

+ (id)paragraphStyleNamed:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = objc_alloc_init(TTMutableParagraphStyle);
  [(TTParagraphStyle *)v4 setStyle:v3];

  return v4;
}

@end