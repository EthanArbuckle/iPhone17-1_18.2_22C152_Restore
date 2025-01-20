@interface MosaicLayout.Attributes
- (BOOL)isEqual:(id)a3;
- (_TtCC21JournalShareExtension12MosaicLayout10Attributes)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation MosaicLayout.Attributes

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_1000139AC((uint64_t)a3, v7);

  sub_10000B718(v7, v7[3]);
  v5 = (void *)sub_10010AC90();
  sub_10000B7B0((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_10010A7B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_100013AD0((uint64_t)v8);

  sub_100017700((uint64_t)v8);
  return v6 & 1;
}

- (_TtCC21JournalShareExtension12MosaicLayout10Attributes)init
{
  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtCC21JournalShareExtension12MosaicLayout10Attributes_cornerRadii);
  v4 = (objc_class *)type metadata accessor for MosaicLayout.Attributes();
  _OWORD *v3 = 0u;
  v3[1] = 0u;
  v3[2] = 0u;
  v3[3] = 0u;
  v6.receiver = self;
  v6.super_class = v4;
  return [(MosaicLayout.Attributes *)&v6 init];
}

@end