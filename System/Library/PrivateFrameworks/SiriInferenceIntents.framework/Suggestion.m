@interface Suggestion
+ (BOOL)supportsSecureCoding;
- (Suggestion)initWithCoder:(id)a3;
- (Suggestion)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation Suggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Suggestion)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
  {
    uint64_t v6 = sub_21EFF1640();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_21EFF1640();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_21EFF1640();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  return (Suggestion *)Suggestion.init(identifier:display:pronunciationHint:)(v6, v8, v9, v11, v12, v14);
}

- (Suggestion)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for Suggestion();
  return [(Suggestion *)&v5 initWithCoder:a3];
}

@end