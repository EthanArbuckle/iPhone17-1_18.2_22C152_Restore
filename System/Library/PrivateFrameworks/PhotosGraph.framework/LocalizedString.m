@interface LocalizedString
- (_TtC11PhotosGraph15LocalizedString)init;
- (_TtC11PhotosGraph15LocalizedString)initWithCoder:(id)a3;
- (_TtC11PhotosGraph15LocalizedString)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
@end

@implementation LocalizedString

- (_TtC11PhotosGraph15LocalizedString)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocalizedString();
  return [(LocalizedString *)&v3 init];
}

- (_TtC11PhotosGraph15LocalizedString)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LocalizedString();
  return [(LocalizedString *)&v5 initWithCoder:a3];
}

- (_TtC11PhotosGraph15LocalizedString)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_1D1EBC790();
  unint64_t v10 = v9;

  sub_1D1EBDE60();
  v11 = (_TtC11PhotosGraph15LocalizedString *)sub_1D19D4868();
  sub_1D18326B4(v8, v10);
  return v11;
}

@end