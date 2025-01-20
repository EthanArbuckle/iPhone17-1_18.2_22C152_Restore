@interface CKTranscriptLayoutUtilitiesSwift
+ (id)dynamicWidthLayoutGroupWithLayoutItem:(id)a3;
+ (id)dynamicWidthLayoutSizeWithHeight:(double)a3;
+ (id)layoutSizeWithSize:(CGSize)a3;
- (CKTranscriptLayoutUtilitiesSwift)init;
@end

@implementation CKTranscriptLayoutUtilitiesSwift

+ (id)layoutSizeWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  id v6 = objc_msgSend(v5, sel_absoluteDimension_, width);
  id v7 = objc_msgSend(v5, sel_absoluteDimension_, height);
  id v8 = objc_msgSend(self, sel_sizeWithWidthDimension_heightDimension_, v6, v7);

  return v8;
}

+ (id)dynamicWidthLayoutSizeWithHeight:(double)a3
{
  v4 = self;
  id v5 = objc_msgSend(v4, sel_fractionalWidthDimension_, 1.0);
  id v6 = objc_msgSend(v4, sel_absoluteDimension_, a3);
  id v7 = objc_msgSend(self, sel_sizeWithWidthDimension_heightDimension_, v5, v6);

  return v7;
}

+ (id)dynamicWidthLayoutGroupWithLayoutItem:(id)a3
{
  id v3 = a3;
  id v4 = _s15MessagesSupport25TranscriptLayoutUtilitiesC012dynamicWidthD5Group10layoutItemSo012NSCollectiondH0CSo0kdJ0C_tFZ_0(v3);

  return v4;
}

- (CKTranscriptLayoutUtilitiesSwift)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CKTranscriptLayoutUtilitiesSwift *)&v3 init];
}

@end