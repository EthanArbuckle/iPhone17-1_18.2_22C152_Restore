@interface PKQuadTree
- (id).cxx_construct;
@end

@implementation PKQuadTree

- (void).cxx_destruct
{
  cntrl = self->quadTree.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end