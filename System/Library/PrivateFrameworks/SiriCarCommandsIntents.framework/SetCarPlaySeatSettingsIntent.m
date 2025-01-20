@interface SetCarPlaySeatSettingsIntent
- (SetCarPlaySeatSettingsIntent)init;
- (SetCarPlaySeatSettingsIntent)initWithCoder:(id)a3;
@end

@implementation SetCarPlaySeatSettingsIntent

- (SetCarPlaySeatSettingsIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntent();
  return [(SetCarPlaySeatSettingsIntent *)&v3 init];
}

- (SetCarPlaySeatSettingsIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntent();
  return [(SetCarPlaySeatSettingsIntent *)&v5 initWithCoder:a3];
}

@end