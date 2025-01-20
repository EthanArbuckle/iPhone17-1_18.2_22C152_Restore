@interface IPAMutableRegion
- (id)copyWithZone:(_NSZone *)a3;
- (void)addRect:(CGRect)a3;
- (void)addRectArray:(id)a3;
- (void)addRegion:(id)a3;
- (void)applyAffineTransform:(CGAffineTransform *)a3;
- (void)applyOrientation:(int64_t)a3 imageSize:(CGSize)a4;
- (void)clear;
- (void)clipToRect:(CGRect)a3;
- (void)clipToRectArray:(id)a3;
- (void)clipToRegion:(id)a3;
- (void)diffWithRect:(CGRect)a3;
- (void)diffWithRegion:(id)a3;
- (void)flipInRect:(CGRect)a3;
- (void)growBy:(CGPoint)a3;
- (void)growBy:(CGPoint)a3 inRect:(CGRect)a4;
- (void)removeRect:(CGRect)a3;
- (void)removeRectArray:(id)a3;
- (void)removeRegion:(id)a3;
- (void)roundDown;
- (void)roundUp;
- (void)scaleBy:(CGPoint)a3;
- (void)setRegion:(id)a3;
- (void)shrinkBy:(CGPoint)a3;
- (void)shrinkBy:(CGPoint)a3 inRect:(CGRect)a4;
- (void)translateBy:(CGPoint)a3;
@end

@implementation IPAMutableRegion

- (void)applyAffineTransform:(CGAffineTransform *)a3
{
  imp = (long long *)self->super._imp;
  long long v7 = 0u;
  long long v8 = 0u;
  int v9 = 1065353216;
  for (i = (uint64_t *)*((void *)imp + 2); i; i = (uint64_t *)*i)
  {
    CGRect v11 = *(CGRect *)(i + 2);
    long long v6 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v10.c = v6;
    *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
    CGRect v12 = CGRectApplyAffineTransform(v11, &v10);
    v10.a = v12.origin.x;
    v10.b = v12.origin.y;
    v10.c = v12.size.width;
    v10.d = v12.size.height;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v7, &v10, (uint64_t)&v10);
  }
  if (&v7 != imp)
  {
    *((_DWORD *)imp + 8) = v9;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v8);
  }
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v7);
}

- (void)applyOrientation:(int64_t)a3 imageSize:(CGSize)a4
{
  double width = a4.width;
  imp = (long long *)self->super._imp;
  long long v13 = 0u;
  long long v14 = 0u;
  int v15 = 1065353216;
  long long v6 = (double *)*((void *)imp + 2);
  if (v6)
  {
    double height = a4.height;
    do
    {
      v12[0] = IPAOrientationTransformImageRect(a3, width, height, v6[2], v6[3], v6[4], v6[5]);
      v12[1] = v9;
      v12[2] = v10;
      v12[3] = v11;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v13, v12, (uint64_t)v12);
      long long v6 = *(double **)v6;
    }
    while (v6);
  }
  if (&v13 != imp)
  {
    *((_DWORD *)imp + 8) = v15;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v14);
  }
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v13);
}

- (void)roundDown
{
  imp = (PA::Region **)self->super._imp;
  double Bounds = PA::Region::GetBounds(imp[2]);
  double v10 = Bounds + -1.0;
  double v11 = v6 + -1.0;
  double v12 = v10 + Bounds + v4 - (Bounds + -1.0) + 1.0 - v10;
  double v13 = v11 + v6 + v5 - (v6 + -1.0) + 1.0 - v11;
  PA::Region::Region((PA::Region *)v8, (const PA::Rect *)&v10);
  PA::Region::Break((uint64_t)imp[2], (uint64_t)v8);
  PA::Region::MergeVertically((PA::Region *)v8);
  PA::Region::RoundUp((PA::Region *)v8);
  PA::Region::Region((PA::Region *)v7, (const PA::Rect *)&v10);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__move_assign((uint64_t)imp, v7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v7);
  PA::Region::Break(v9, (uint64_t)imp);
  PA::Region::MergeVertically((PA::Region *)imp);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v8);
}

- (void)roundUp
{
}

- (void)shrinkBy:(CGPoint)a3 inRect:(CGRect)a4
{
  if (a3.x < 0.0 || a3.y < 0.0)
  {
    double v5 = (PA::Region *)_PFAssertFailHandler();
    PA::Region::ShrinkInRect(v5, v7, v8, v6);
  }
  else
  {
    imp = (PA::Region *)self->super._imp;
    CGRect v9 = a4;
    PA::Region::ShrinkInRect(imp, a3.x, a3.y, (const PA::Rect *)&v9);
  }
}

- (void)shrinkBy:(CGPoint)a3
{
  if (a3.x < 0.0 || (double y = a3.y, a3.y < 0.0))
  {
    double v10 = (IPAMutableRegion *)_PFAssertFailHandler();
    [(IPAMutableRegion *)v10 growBy:v13 inRect:v14];
  }
  else
  {
    double x = a3.x;
    imp = (PA::Region **)self->super._imp;
    double Bounds = PA::Region::GetBounds(imp[2]);
    v12[0] = Bounds - x;
    v12[1] = v9 - y;
    v12[2] = v12[0] + Bounds + v7 - (Bounds - x) + x - v12[0];
    v12[3] = v9 - y + v9 + v8 - (v9 - y) + y - (v9 - y);
    PA::Region::ShrinkInRect((PA::Region *)imp, x, y, (const PA::Rect *)v12);
  }
}

- (void)growBy:(CGPoint)a3 inRect:(CGRect)a4
{
  if (a3.x < 0.0 || a3.y < 0.0)
  {
    double v5 = (PA::Region *)_PFAssertFailHandler();
    PA::Region::Clip(v5, v6);
  }
  else
  {
    imp = (PA::Region *)self->super._imp;
    CGRect v7 = a4;
    PA::Region::Grow(imp, a3.x, a3.y);
    PA::Region::Clip(imp, (const PA::Rect *)&v7);
  }
}

- (void)growBy:(CGPoint)a3
{
  if (a3.x < 0.0 || a3.y < 0.0)
  {
    double v4 = (IPAMutableRegion *)_PFAssertFailHandler();
    [(IPAMutableRegion *)v4 setRegion:v6];
  }
  else
  {
    imp = (PA::Region *)self->super._imp;
    PA::Region::Grow(imp, a3.x, a3.y);
  }
}

- (void)setRegion:(id)a3
{
  id v6 = a3;
  uint64_t v4 = v6[1];
  imp = self->super._imp;
  if (imp != (_DWORD *)v4)
  {
    imp[8] = *(_DWORD *)(v4 + 32);
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, *(uint64_t **)(v4 + 16));
  }
}

- (void)clear
{
}

- (void)scaleBy:(CGPoint)a3
{
  imp = (long long *)self->super._imp;
  if (a3.x == 0.0 || (double y = a3.y, a3.y == 0.0))
  {
    SEL v11 = self->super._imp;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear(v11);
  }
  else
  {
    double x = a3.x;
    long long v15 = 0u;
    long long v16 = 0u;
    int v17 = 1065353216;
    for (i = (uint64_t *)*((void *)imp + 2); i; i = (uint64_t *)*i)
    {
      long long v7 = *((_OWORD *)i + 2);
      long long v12 = *((_OWORD *)i + 1);
      long long v13 = v7;
      uint64_t v14 = i[6];
      double v8 = *(double *)&v12 * x;
      *(double *)&long long v7 = *((double *)&v12 + 1) * y;
      double v9 = *(double *)&v13 * x;
      double v10 = *((double *)&v13 + 1) * y;
      CGRect v19 = CGRectStandardize(*(CGRect *)((char *)&v7 - 8));
      *(CGFloat *)&long long v12 = v19.origin.x;
      *((void *)&v12 + 1) = *(void *)&v19.origin.y;
      *(CGFloat *)&long long v13 = v19.size.width;
      *((void *)&v13 + 1) = *(void *)&v19.size.height;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>((uint64_t)&v15, &v12, (uint64_t)&v12);
    }
    if (&v15 != imp)
    {
      *((_DWORD *)imp + 8) = v17;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v16);
    }
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v15);
  }
}

- (void)translateBy:(CGPoint)a3
{
  double x = a3.x;
  imp = (long long *)self->super._imp;
  long long v10 = 0u;
  long long v11 = 0u;
  int v12 = 1065353216;
  SEL v5 = (uint64_t *)*((void *)imp + 2);
  if (v5)
  {
    double y = a3.y;
    do
    {
      long long v7 = *((_OWORD *)v5 + 2);
      v8[0] = *((_OWORD *)v5 + 1);
      v8[1] = v7;
      uint64_t v9 = v5[6];
      *(double *)double v8 = *(double *)v8 + x;
      *((double *)v8 + 1) = *((double *)v8 + 1) + y;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>((uint64_t)&v10, v8, (uint64_t)v8);
      SEL v5 = (uint64_t *)*v5;
    }
    while (v5);
  }
  if (&v10 != imp)
  {
    *((_DWORD *)imp + 8) = v12;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v11);
  }
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v10);
}

- (void)flipInRect:(CGRect)a3
{
  double x = a3.origin.x;
  imp = (long long *)self->super._imp;
  long long v10 = 0u;
  long long v11 = 0u;
  int v12 = 1065353216;
  SEL v5 = (uint64_t *)*((void *)imp + 2);
  if (v5)
  {
    double v6 = a3.origin.y + a3.size.height;
    do
    {
      long long v7 = *((_OWORD *)v5 + 2);
      v8[0] = *((_OWORD *)v5 + 1);
      v8[1] = v7;
      uint64_t v9 = v5[6];
      *(double *)double v8 = *(double *)v8 - x;
      *((double *)v8 + 1) = v6 - (*((double *)v8 + 1) + *((double *)&v7 + 1));
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>((uint64_t)&v10, v8, (uint64_t)v8);
      SEL v5 = (uint64_t *)*v5;
    }
    while (v5);
  }
  if (&v10 != imp)
  {
    *((_DWORD *)imp + 8) = v12;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(imp, (uint64_t *)v11);
  }
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v10);
}

- (void)diffWithRegion:(id)a3
{
  if (a3) {
    PA::Region::Diff((PA::Region *)self->super._imp, *((const PA::Region **)a3 + 1));
  }
}

- (void)diffWithRect:(CGRect)a3
{
  imp = (PA::Region *)self->super._imp;
  CGRect v4 = a3;
  PA::Region::Region((PA::Region *)v5, (const PA::Rect *)&v4);
  PA::Region::Diff(imp, (const PA::Region *)v5);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v5);
}

- (void)clipToRectArray:(id)a3
{
  id v4 = +[IPARegion regionWithRectArray:a3];
  -[IPAMutableRegion clipToRegion:](self, "clipToRegion:");
}

- (void)clipToRegion:(id)a3
{
  if (a3) {
    PA::Region::Clip((PA::Region *)self->super._imp, *((const PA::Region **)a3 + 1));
  }
}

- (void)clipToRect:(CGRect)a3
{
  imp = (PA::Region *)self->super._imp;
  CGRect v4 = a3;
  PA::Region::Clip(imp, (const PA::Rect *)&v4);
}

- (void)removeRectArray:(id)a3
{
  id v4 = +[IPARegion regionWithRectArray:a3];
  -[IPAMutableRegion removeRegion:](self, "removeRegion:");
}

- (void)addRectArray:(id)a3
{
  id v4 = +[IPARegion regionWithRectArray:a3];
  -[IPAMutableRegion addRegion:](self, "addRegion:");
}

- (void)removeRegion:(id)a3
{
  if (a3)
  {
    imp = (PA::Region *)self->super._imp;
    PA::Region::Break(*(void *)(*((void *)a3 + 1) + 16), (uint64_t)imp);
    PA::Region::MergeVertically(imp);
  }
}

- (void)addRegion:(id)a3
{
  if (a3) {
    PA::Region::Add((PA::Region *)self->super._imp, *((const PA::Region **)a3 + 1));
  }
}

- (void)removeRect:(CGRect)a3
{
  imp = (PA::Region *)self->super._imp;
  CGRect v4 = a3;
  PA::Region::Region((PA::Region *)v5, (const PA::Rect *)&v4);
  PA::Region::Break(v6, (uint64_t)imp);
  PA::Region::MergeVertically(imp);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v5);
}

- (void)addRect:(CGRect)a3
{
  imp = (PA::Region *)self->super._imp;
  CGRect v4 = a3;
  PA::Region::Add(imp, (const PA::Rect *)&v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CGRect v4 = +[IPARegion allocWithZone:a3];
  return [(IPARegion *)v4 initWithRegion:self];
}

@end