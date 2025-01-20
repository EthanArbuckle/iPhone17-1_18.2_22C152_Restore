@interface TagIntent
- (TagIntent)init;
- (TagIntent)initWithCoder:(id)a3;
- (TagIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (TagIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation TagIntent

- (TagIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TagIntent();
  return [(TagIntent *)&v3 init];
}

- (TagIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TagIntent();
  return [(TagIntent *)&v5 initWithCoder:a3];
}

- (TagIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    sub_1000CC1F0();
    id v6 = a4;
    NSString v7 = sub_1000CC1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TagIntent();
  v9 = [(TagIntent *)&v11 initWithIdentifier:v7 backingStore:a4];

  return v9;
}

- (TagIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_1000CC1F0();
  sub_1000CC1F0();
  if (a5) {
    a5 = (id)sub_1000CC110();
  }
  NSString v7 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  NSString v8 = sub_1000CC1C0();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.isa = sub_1000CC100().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TagIntent();
  v10 = [(TagIntent *)&v12 initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

@end