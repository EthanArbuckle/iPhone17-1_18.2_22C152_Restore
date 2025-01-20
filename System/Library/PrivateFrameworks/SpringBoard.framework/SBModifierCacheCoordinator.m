@interface SBModifierCacheCoordinator
- (void)performResponse:(unint64_t)a3;
@end

@implementation SBModifierCacheCoordinator

- (void)performResponse:(unint64_t)a3
{
  if (a3 <= 2) {
    *(Class *)((char *)&self->super.isa + qword_1D8FD2190[a3]) = (Class)(*(char **)((char *)&self->super.isa
  }
                                                                                  + qword_1D8FD2190[a3])
                                                                       + qword_1D8FD21A8[a3]);
}

@end