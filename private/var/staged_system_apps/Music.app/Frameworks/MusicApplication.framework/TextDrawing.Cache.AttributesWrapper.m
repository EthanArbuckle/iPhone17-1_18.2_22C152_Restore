@interface TextDrawing.Cache.AttributesWrapper
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation TextDrawing.Cache.AttributesWrapper

- (int64_t)hash
{
  sub_AB8830();
  long long v3 = *(_OWORD *)&self->attributes[16];
  v6[0] = *(_OWORD *)self->attributes;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&self->attributes[32];
  uint64_t v7 = *(void *)&self->attributes[48];
  swift_retain();
  sub_121EE8((uint64_t)v6);
  TextAttributes.hash(into:)();
  sub_121F28((uint64_t)v6);
  Swift::Int v4 = sub_AB8880();
  swift_release();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  BOOL v4 = sub_11FEB0((uint64_t)a3);
  swift_unknownObjectRelease();
  swift_release();
  return v4;
}

@end