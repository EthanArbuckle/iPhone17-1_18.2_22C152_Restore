@interface _UIAnimatedAttachmentView
+ (id)cacheKeyForAttachmentData:(id)a3 name:(id)a4;
+ (id)cachedObjectWithKey:(id)a3 creationBlock:(id)a4;
- (_UIAnimatedAttachmentView)initWithAttachment:(id)a3;
- (_UIAnimatedAttachmentView)initWithCoder:(id)a3;
- (_UIAnimatedAttachmentView)initWithFrame:(CGRect)a3;
@end

@implementation _UIAnimatedAttachmentView

+ (id)cacheKeyForAttachmentData:(id)a3 name:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(&v10, 0, sizeof(v10));
  id v4 = a3;
  CC_SHA1_Init(&v10);
  id v5 = v4;
  v6 = (const void *)objc_msgSend(v5, "bytes", *(_OWORD *)&v10.h0, *(_OWORD *)&v10.h4, *(_OWORD *)&v10.data[1], *(_OWORD *)&v10.data[5], *(_OWORD *)&v10.data[9], *(_OWORD *)&v10.data[13]);
  CC_LONG v7 = [v5 length];

  CC_SHA1_Update(&v10, v6, v7);
  CC_SHA1_Final(md, &v10);
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
  return v8;
}

+ (id)cachedObjectWithKey:(id)a3 creationBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(void))a4;
  if (qword_1EB2648A8 != -1) {
    dispatch_once(&qword_1EB2648A8, &__block_literal_global_579);
  }
  CC_LONG v7 = [(id)qword_1EB2648A0 objectForKey:v5];
  if (!v7)
  {
    CC_LONG v7 = v6[2](v6);
    objc_setAssociatedObject(v7, &_MergedGlobals_1272, v5, (void *)1);
    [(id)qword_1EB2648A0 setObject:v7 forKey:v5];
  }

  return v7;
}

- (_UIAnimatedAttachmentView)initWithAttachment:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UIAnimatedAttachmentView;
  id v5 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    v6 = [v4 fileWrapper];
    CC_LONG v7 = [v6 regularFileContents];

    v8 = objc_opt_class();
    v9 = [v4 fileWrapper];
    CC_SHA1_CTX v10 = [v9 preferredFilename];
    v11 = [v8 cacheKeyForAttachmentData:v7 name:v10];

    uint64_t v12 = objc_opt_class();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48___UIAnimatedAttachmentView_initWithAttachment___block_invoke;
    v17[3] = &unk_1E52DCC28;
    id v18 = v7;
    id v13 = v7;
    v14 = [v12 cachedObjectWithKey:v11 creationBlock:v17];
    v15 = [(UIView *)v5 layer];
    [v15 addAnimation:v14 forKey:@"UIAnimatedImage"];
  }
  return v5;
}

- (_UIAnimatedAttachmentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CC_LONG v7 = [(_UIAnimatedAttachmentView *)self initWithAttachment:0];
  v8 = v7;
  if (v7) {
    -[UIView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (_UIAnimatedAttachmentView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIAnimatedAttachmentView;
  return [(UIView *)&v4 initWithCoder:a3];
}

@end