@interface PXSectionsBlurController
- (PXSectionsBlurController)init;
- (PXSectionsBlurController)initWithBlurrableSectionsSource:(id)a3;
- (int64_t)behavior;
- (void)setBehavior:(int64_t)a3;
- (void)updateSectionsBlurWithVisibleRect:(CGRect)a3 safeAreaInsets:(UIEdgeInsets)a4 interSectionSpacing:(double)a5;
@end

@implementation PXSectionsBlurController

- (PXSectionsBlurController)initWithBlurrableSectionsSource:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXSectionsBlurController_behavior) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SectionsBlurController();
  return [(PXSectionsBlurController *)&v5 init];
}

- (int64_t)behavior
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXSectionsBlurController_behavior);
  swift_beginAccess();
  return *v2;
}

- (void)setBehavior:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___PXSectionsBlurController_behavior);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (void)updateSectionsBlurWithVisibleRect:(CGRect)a3 safeAreaInsets:(UIEdgeInsets)a4 interSectionSpacing:(double)a5
{
  objc_super v5 = self;
  sub_1AA5C3E90();
}

- (PXSectionsBlurController)init
{
  result = (PXSectionsBlurController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end