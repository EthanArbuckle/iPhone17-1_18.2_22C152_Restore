@interface GetTrunkStatusIntent
- (GetTrunkStatusIntent)init;
- (GetTrunkStatusIntent)initWithCoder:(id)a3;
@end

@implementation GetTrunkStatusIntent

- (GetTrunkStatusIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GetTrunkStatusIntent();
  return [(GetTrunkStatusIntent *)&v3 init];
}

- (GetTrunkStatusIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GetTrunkStatusIntent();
  return [(GetTrunkStatusIntent *)&v5 initWithCoder:a3];
}

@end