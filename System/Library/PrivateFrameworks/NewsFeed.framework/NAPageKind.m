@interface NAPageKind
+ (NAPageKind)anf;
+ (NAPageKind)pdf;
- (NAPageKind)init;
@end

@implementation NAPageKind

+ (NAPageKind)anf
{
  return (NAPageKind *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, &qword_1EA1943B0, (void **)&qword_1EA197E80);
}

+ (NAPageKind)pdf
{
  return (NAPageKind *)sub_1C01C9A60((uint64_t)a1, (uint64_t)a2, qword_1EA1943B8, (void **)&qword_1EA197E88);
}

- (NAPageKind)init
{
  result = (NAPageKind *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end