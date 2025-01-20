@interface SetTrunkStatusIntent
- (SetTrunkStatusIntent)init;
- (SetTrunkStatusIntent)initWithCoder:(id)a3;
@end

@implementation SetTrunkStatusIntent

- (SetTrunkStatusIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SetTrunkStatusIntent();
  return [(SetTrunkStatusIntent *)&v3 init];
}

- (SetTrunkStatusIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SetTrunkStatusIntent();
  return [(SetTrunkStatusIntent *)&v5 initWithCoder:a3];
}

@end