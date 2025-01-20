@interface TPSGenerativeModelsEligibilityValidation
- (TPSGenerativeModelsEligibilityValidation)init;
- (TPSGenerativeModelsEligibilityValidation)initWithTargetContext:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSGenerativeModelsEligibilityValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1E4516584(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (TPSGenerativeModelsEligibilityValidation)initWithTargetContext:(id)a3
{
  sub_1E451B818();
  v4 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for GenerativeModelsEligibilityValidation();
  v5 = [(TPSTargetingValidation *)&v7 initWithTargetContext:v4];

  return v5;
}

- (TPSGenerativeModelsEligibilityValidation)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeModelsEligibilityValidation();
  return [(TPSGenerativeModelsEligibilityValidation *)&v3 init];
}

@end