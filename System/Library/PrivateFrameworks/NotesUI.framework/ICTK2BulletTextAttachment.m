@interface ICTK2BulletTextAttachment
+ (NSMutableDictionary)imageCache;
- (CGSize)attachmentSizeForTextContainer:(id)a3;
- (ICTK2BulletTextAttachment)initWithMarker:(id)a3;
- (NSAttributedString)marker;
- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
@end

@implementation ICTK2BulletTextAttachment

- (ICTK2BulletTextAttachment)initWithMarker:(id)a3
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F83048];
  v10.receiver = self;
  v10.super_class = (Class)ICTK2BulletTextAttachment;
  v7 = [(ICTextAttachment *)&v10 initWithData:0 ofType:v6];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_marker, a3);
  }

  return v8;
}

+ (NSMutableDictionary)imageCache
{
  if (imageCache_onceToken_0 != -1) {
    dispatch_once(&imageCache_onceToken_0, &__block_literal_global_32);
  }
  v2 = (void *)imageCache_imageCache_0;
  return (NSMutableDictionary *)v2;
}

uint64_t __39__ICTK2BulletTextAttachment_imageCache__block_invoke()
{
  imageCache_imageCache_0 = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

- (CGSize)attachmentSizeForTextContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTK2BulletTextAttachment *)self marker];

  if (v5)
  {
    uint64_t v6 = [(ICTK2BulletTextAttachment *)self marker];
    [v4 size];
    objc_msgSend(v6, "boundingRectWithSize:options:context:", 1, 0);
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  return 0;
}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v9 = [(id)objc_opt_class() imageCache];
  double v10 = [(ICTK2BulletTextAttachment *)self marker];
  double v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__ICTK2BulletTextAttachment_imageForBounds_attributes_location_textContainer___block_invoke;
    v19[3] = &unk_1E5FD8F70;
    v19[4] = self;
    v14 = [v13 imageWithActions:v19];

    v15 = [(id)objc_opt_class() imageCache];
    v16 = [(ICTK2BulletTextAttachment *)self marker];
    [v15 setObject:v14 forKeyedSubscript:v16];

    id v12 = v14;
  }
  v17 = v12;

  return v17;
}

void __78__ICTK2BulletTextAttachment_imageForBounds_attributes_location_textContainer___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) marker];
  objc_msgSend(v1, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (NSAttributedString)marker
{
  return self->_marker;
}

- (void).cxx_destruct
{
}

@end