@interface PFXClipPath
- (void)dealloc;
- (void)end;
- (void)setBezierPath:(id)a3;
@end

@implementation PFXClipPath

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXClipPath;
  [(PFXSvgElement *)&v3 dealloc];
}

- (void)setBezierPath:(id)a3
{
  self->mBezierPath = (TSDBezierPath *)a3;
}

- (void)end
{
}

@end