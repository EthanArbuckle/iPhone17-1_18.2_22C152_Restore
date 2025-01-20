@interface HighlightMenuIdentifier
- (_TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation HighlightMenuIdentifier

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1D4190(v6);

  sub_1B1A74(v6, v6[3]);
  v4 = (void *)sub_1F28A0();
  sub_1B09C4((uint64_t)v6);
  return v4;
}

- (_TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier)init
{
  result = (_TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier_annotationUUID));
  v3 = (char *)self + OBJC_IVAR____TtC8BookCoreP33_213CCCF002B71F6D33A127415B0D848C23HighlightMenuIdentifier_delegate;

  sub_19ECC4((uint64_t)v3);
}

@end