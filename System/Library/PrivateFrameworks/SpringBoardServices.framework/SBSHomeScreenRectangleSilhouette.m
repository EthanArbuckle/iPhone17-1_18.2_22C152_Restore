@interface SBSHomeScreenRectangleSilhouette
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)frame;
- (NSString)description;
- (SBSHomeScreenRectangleSilhouette)init;
- (SBSHomeScreenRectangleSilhouette)initWithBSXPCCoder:(id)a3;
- (SBSHomeScreenRectangleSilhouette)initWithCoder:(id)a3;
- (SBSHomeScreenRectangleSilhouette)initWithFrame:(CGRect)a3 cornerRadius:(double)a4;
- (double)cornerRadius;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSHomeScreenRectangleSilhouette

- (SBSHomeScreenRectangleSilhouette)initWithFrame:(CGRect)a3 cornerRadius:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)SBSHomeScreenRectangleSilhouette;
  result = [(SBSHomeScreenRectangleSilhouette *)&v10 init];
  if (result)
  {
    result->_frame.origin.CGFloat y = y;
    result->_frame.size.CGFloat width = width;
    result->_frame.size.CGFloat height = height;
    result->_cornerRadius = a4;
    result->_frame.origin.CGFloat x = x;
  }
  return result;
}

- (SBSHomeScreenRectangleSilhouette)init
{
  return -[SBSHomeScreenRectangleSilhouette initWithFrame:cornerRadius:](self, "initWithFrame:cornerRadius:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 0.0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSHomeScreenRectangleSilhouette *)a3;
  if (self == v4)
  {
    BOOL v23 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      [(SBSHomeScreenRectangleSilhouette *)self frame];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [(SBSHomeScreenRectangleSilhouette *)v7 frame];
      v26.origin.CGFloat x = v16;
      v26.origin.CGFloat y = v17;
      v26.size.CGFloat width = v18;
      v26.size.CGFloat height = v19;
      v25.origin.CGFloat x = v9;
      v25.origin.CGFloat y = v11;
      v25.size.CGFloat width = v13;
      v25.size.CGFloat height = v15;
      if (CGRectEqualToRect(v25, v26))
      {
        [(SBSHomeScreenRectangleSilhouette *)self cornerRadius];
        double v21 = v20;
        [(SBSHomeScreenRectangleSilhouette *)v7 cornerRadius];
        BOOL v23 = v21 == v22;
      }
      else
      {
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  [(SBSHomeScreenRectangleSilhouette *)self frame];
  unint64_t v4 = (unint64_t)v3;
  unint64_t v6 = (unint64_t)v5;
  [(SBSHomeScreenRectangleSilhouette *)self cornerRadius];
  return v6 ^ (unint64_t)v7 ^ v4;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  CGFloat v9 = __47__SBSHomeScreenRectangleSilhouette_description__block_invoke;
  double v10 = &unk_1E566BB08;
  CGFloat v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  double v5 = [v4 descriptionWithLocale:v7 arguments:v8, v9, v10, v11];

  return (NSString *)v5;
}

uint64_t __47__SBSHomeScreenRectangleSilhouette_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29238];
  id v5 = a3;
  [(SBSHomeScreenRectangleSilhouette *)self frame];
  v11[0] = v6;
  v11[1] = v7;
  v11[2] = v8;
  v11[3] = v9;
  double v10 = [v4 valueWithBytes:v11 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v5 encodeObject:v10 forKey:@"frame"];

  [(SBSHomeScreenRectangleSilhouette *)self cornerRadius];
  [v5 encodeDouble:v5.cornerRadius forKey:@"cornerRadius"];
}

- (SBSHomeScreenRectangleSilhouette)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"frame"];
  [v6 bs_CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  [v4 decodeDoubleForKey:@"cornerRadius"];
  double v16 = v15;

  return -[SBSHomeScreenRectangleSilhouette initWithFrame:cornerRadius:](self, "initWithFrame:cornerRadius:", v8, v10, v12, v14, v16);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29238];
  id v5 = a3;
  [(SBSHomeScreenRectangleSilhouette *)self frame];
  v11[0] = v6;
  v11[1] = v7;
  v11[2] = v8;
  v11[3] = v9;
  double v10 = [v4 valueWithBytes:v11 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v5 encodeObject:v10 forKey:@"frame"];

  [(SBSHomeScreenRectangleSilhouette *)self cornerRadius];
  [v5 encodeDouble:v5.cornerRadius forKey:@"cornerRadius"];
}

- (SBSHomeScreenRectangleSilhouette)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeCGRectForKey:@"frame"];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 decodeDoubleForKey:@"cornerRadius"];
  double v14 = v13;

  return -[SBSHomeScreenRectangleSilhouette initWithFrame:cornerRadius:](self, "initWithFrame:cornerRadius:", v6, v8, v10, v12, v14);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  [(SBSHomeScreenRectangleSilhouette *)self frame];
  id v4 = [v6 appendRect:@"frame"];
  [(SBSHomeScreenRectangleSilhouette *)self cornerRadius];
  id v5 = [v6 appendFloat:v7 withName:@"cornerRadius"];
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end