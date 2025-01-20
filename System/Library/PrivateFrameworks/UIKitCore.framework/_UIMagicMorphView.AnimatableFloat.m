@interface _UIMagicMorphView.AnimatableFloat
- (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat)init;
- (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat)initWithAnimatableProperty:(id)a3;
- (double)value;
- (void)setValue:(double)a3;
@end

@implementation _UIMagicMorphView.AnimatableFloat

- (double)value
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UIMagicMorphView.AnimatableFloat();
  [(UIViewFloatAnimatableProperty *)&v3 value];
  return result;
}

- (void)setValue:(double)a3
{
  v6 = self;
  [(_UIMagicMorphView.AnimatableFloat *)v6 value];
  if (v4 == a3)
  {
  }
  else
  {
    [(_UIMagicMorphView.AnimatableFloat *)v6 value];
    *((unsigned char *)&v6->super.super.super.super.isa
    + OBJC_IVAR____TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat_lastModelValueChangeWasPositive) = v5 < a3;
    v7.receiver = v6;
    v7.super_class = (Class)type metadata accessor for _UIMagicMorphView.AnimatableFloat();
    [(UIViewFloatAnimatableProperty *)&v7 setValue:a3];
  }
}

- (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat)init
{
  double result = (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat)initWithAnimatableProperty:(id)a3
{
  swift_unknownObjectRetain();
  double result = (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end