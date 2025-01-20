@interface _ValueBox
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox)init;
- (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox)initWithBSXPCCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation _ValueBox

- (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox)initWithBSXPCCoder:(id)a3
{
  return (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox *)sub_185A5464C(a3);
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_185A53588(a3);
  swift_unknownObjectRelease();
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_185A548FC();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_185A54C68((uint64_t)v8);

  sub_1853B93B8((uint64_t)v8, &qword_1EB256B10);
  return v6;
}

- (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox)init
{
  result = (_TtC5UIKitP33_255CA08DD239FA8856FF3210D2BF9D939_ValueBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end