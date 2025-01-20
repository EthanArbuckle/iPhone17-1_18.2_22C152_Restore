@interface SFBorrowedCapsuleViewRegistration
- (SFBorrowedCapsuleViewRegistration)init;
- (SFBorrowedCapsuleViewRegistration)initWithView:(id)a3 capsuleReferenceFrame:(CGRect)a4 referenceBounds:(CGRect)a5 shouldClipView:(BOOL)a6;
@end

@implementation SFBorrowedCapsuleViewRegistration

- (SFBorrowedCapsuleViewRegistration)initWithView:(id)a3 capsuleReferenceFrame:(CGRect)a4 referenceBounds:(CGRect)a5 shouldClipView:(BOOL)a6
{
  v6 = (char *)self + OBJC_IVAR___SFBorrowedCapsuleViewRegistration_wrapped;
  *(void *)v6 = a3;
  *(CGRect *)(v6 + 8) = a4;
  *(CGRect *)(v6 + 40) = a5;
  v6[72] = a6;
  v9.receiver = self;
  v9.super_class = (Class)SFBorrowedCapsuleViewRegistration;
  id v7 = a3;
  return [(SFBorrowedCapsuleViewRegistration *)&v9 init];
}

- (SFBorrowedCapsuleViewRegistration)init
{
  result = (SFBorrowedCapsuleViewRegistration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end