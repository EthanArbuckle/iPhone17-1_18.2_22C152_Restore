@interface ICThumbnailGeneratorAvatar
- (BOOL)isRTL;
- (CNAvatarImageRenderer)renderer;
- (ICThumbnailGeneratorAvatar)initWithManagedObjectContext:(id)a3;
- (void)drawWithBorderIntoContext:(CGContext *)a3 avatarImage:(id)a4;
- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation ICThumbnailGeneratorAvatar

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, ICThumbnailDescription *))a4;
  objc_opt_class();
  v8 = [v6 associatedObject];
  v9 = ICCheckedDynamicCast();

  if (![v9 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
    v26[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

    v9 = (void *)v11;
  }
  v12 = (void *)MEMORY[0x1E4F1BB30];
  [v6 preferredSize];
  double v14 = v13;
  double v16 = v15;
  [v6 scale];
  v18 = objc_msgSend(v12, "scopeWithPointSize:scale:rightToLeft:style:", -[ICThumbnailGeneratorAvatar isRTL](self, "isRTL"), 0, v14, v16, v17);
  v19 = [[ICThumbnailDescription alloc] initWithConfiguration:v6];
  v20 = [(ICThumbnailGeneratorAvatar *)self renderer];
  v21 = [v20 avatarImageForContacts:v9 scope:v18];

  if ([v6 hasBorder])
  {
    id v22 = objc_alloc(MEMORY[0x1E4FB17D8]);
    [v21 size];
    v23 = objc_msgSend(v22, "initWithSize:");
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__ICThumbnailGeneratorAvatar_generateThumbnailWithConfiguration_completion___block_invoke;
    v24[3] = &unk_1E5FD8E18;
    v24[4] = self;
    id v25 = v21;
    v21 = [v23 imageWithActions:v24];
  }
  [(ICThumbnailDescription *)v19 setImage:v21];
  if (v7) {
    v7[2](v7, v19);
  }
}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (BOOL)isRTL
{
  return self->_RTL;
}

uint64_t __59__ICThumbnailGeneratorAvatar_initWithManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4FB1EB0], "ic_isRTL");
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

- (void).cxx_destruct
{
}

- (ICThumbnailGeneratorAvatar)initWithManagedObjectContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICThumbnailGeneratorAvatar;
  v3 = [(ICThumbnailGenerator *)&v8 initWithManagedObjectContext:a3];
  if (v3)
  {
    v4 = (CNAvatarImageRenderer *)objc_alloc_init(MEMORY[0x1E4F1BB20]);
    renderer = v3->_renderer;
    v3->_renderer = v4;

    v7 = v3;
    performBlockOnMainThread();
  }
  return v3;
}

uint64_t __76__ICThumbnailGeneratorAvatar_generateThumbnailWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 CGContext];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v3 drawWithBorderIntoContext:v4 avatarImage:v5];
}

- (void)drawWithBorderIntoContext:(CGContext *)a3 avatarImage:(id)a4
{
  id v5 = a4;
  [v5 size];
  double v7 = v6;
  [v5 size];
  CGFloat v9 = v8;
  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, v7, v8);

  CGContextSetAllowsAntialiasing(a3, 1);
  CGContextSetShouldAntialias(a3, 1);
  id v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v10 CGColor]);

  CGContextSetLineWidth(a3, 1.0);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = v7;
  v12.size.height = v9;
  CGRect v13 = CGRectInset(v12, 0.5, 0.5);
  CGContextStrokeEllipseInRect(a3, v13);
}

@end