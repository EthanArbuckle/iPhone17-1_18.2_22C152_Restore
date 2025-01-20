@interface SiriLongPressButtonInteraction
+ (BOOL)supportsSecureCoding;
+ (id)interactionWithBuilder:(id)a3;
- (SiriLongPressButtonInteraction)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SiriLongPressButtonInteraction

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

+ (id)interactionWithBuilder:(id)a3
{
  v3 = (void (**)(id, SiriLongPressButtonInteraction *))a3;
  v4 = objc_alloc_init(SiriLongPressButtonInteraction);
  if (v3) {
    v3[2](v3, v4);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriLongPressButtonInteraction)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriLongPressButtonInteraction;
  return [(SiriLongPressButtonInteraction *)&v4 init];
}

@end