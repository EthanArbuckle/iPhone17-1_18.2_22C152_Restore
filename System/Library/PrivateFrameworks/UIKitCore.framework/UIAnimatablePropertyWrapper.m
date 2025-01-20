@interface UIAnimatablePropertyWrapper
+ (id)makeSwiftFloatAnimatableProperty;
+ (id)makeSwiftVectorAnimatableProperty;
- (BOOL)isInvalidated;
- (BOOL)isVelocityUsableForVFD;
- (UIAnimatablePropertyWrapper)initWithAnimatableProperty:(id)a3;
- (UIBridgedAnimatableProperty)animatableProperty;
- (id)__swiftTransformer;
- (void)dealloc;
- (void)invalidate;
- (void)setVelocityUsableForVFD:(BOOL)a3;
- (void)set__swiftTransformer:(id)a3;
@end

@implementation UIAnimatablePropertyWrapper

+ (id)makeSwiftVectorAnimatableProperty
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FAF7A0);
  swift_allocObject();
  uint64_t v2 = sub_18549C904(MEMORY[0x1E4FBC860], (uint64_t)signpost_c2_removePresentationModifier_end, 0);
  uint64_t v3 = sub_1854B2CCC(&qword_1E8FAF798, &qword_1E8FAF7A0);
  v4 = (objc_class *)type metadata accessor for BridgedProperty();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = (uint64_t *)&v5[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  uint64_t *v6 = v2;
  v6[1] = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  return v7;
}

- (UIAnimatablePropertyWrapper)initWithAnimatableProperty:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIAnimatablePropertyWrapper;
  v6 = [(UIAnimatablePropertyWrapper *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_animatableProperty, a3);
  }

  return v7;
}

+ (id)makeSwiftFloatAnimatableProperty
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB255D10);
  swift_allocObject();
  uint64_t v2 = sub_1854B8540((uint64_t)signpost_c2_removePresentationModifier_end, 0, (uint64_t *)&unk_1EB255D20, &qword_1EB255D18, 0.0);
  uint64_t v3 = sub_1854B2CCC((unint64_t *)&unk_1EB255D00, &qword_1EB255D10);
  v4 = (objc_class *)type metadata accessor for BridgedProperty();
  id v5 = (char *)objc_allocWithZone(v4);
  v6 = (uint64_t *)&v5[OBJC_IVAR____TtC5UIKit15BridgedProperty_property];
  uint64_t *v6 = v2;
  v6[1] = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  return v7;
}

- (UIBridgedAnimatableProperty)animatableProperty
{
  return self->_animatableProperty;
}

- (void)set__swiftTransformer:(id)a3
{
  id v4 = a3;
  id v5 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  [v5 setTransformer:v4];
}

- (void).cxx_destruct
{
}

- (void)invalidate
{
  id v2 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  [v2 invalidateAndStopImmediately:1];
}

- (void)dealloc
{
  uint64_t v3 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  [v3 invalidateAndStopImmediately:0];

  v4.receiver = self;
  v4.super_class = (Class)UIAnimatablePropertyWrapper;
  [(UIAnimatablePropertyWrapper *)&v4 dealloc];
}

- (BOOL)isInvalidated
{
  id v2 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  char v3 = [v2 isInvalidated];

  return v3;
}

- (id)__swiftTransformer
{
  id v2 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  char v3 = [v2 transformer];

  return v3;
}

- (BOOL)isVelocityUsableForVFD
{
  id v2 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  char v3 = [v2 isVelocityUsableForVFD];

  return v3;
}

- (void)setVelocityUsableForVFD:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  [v4 setIsVelocityUsableForVFD:v3];
}

@end