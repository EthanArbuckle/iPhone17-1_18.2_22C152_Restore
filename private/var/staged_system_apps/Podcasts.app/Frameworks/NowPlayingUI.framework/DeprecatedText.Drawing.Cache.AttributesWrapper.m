@interface DeprecatedText.Drawing.Cache.AttributesWrapper
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation DeprecatedText.Drawing.Cache.AttributesWrapper

- (int64_t)hash
{
  sub_12A690();
  long long v3 = *(_OWORD *)&self->attributes[16];
  v7[0] = *(_OWORD *)self->attributes;
  v7[1] = v3;
  long long v4 = *(_OWORD *)&self->attributes[48];
  v7[2] = *(_OWORD *)&self->attributes[32];
  v7[3] = v4;
  swift_retain();
  sub_B40C((uint64_t)v7);
  sub_7E4DC();
  sub_B44C((uint64_t)v7);
  Swift::Int v5 = sub_12A6E0();
  swift_release();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  char v4 = sub_AA98((uint64_t)a3);
  swift_unknownObjectRelease();
  swift_release();
  return v4 & 1;
}

@end