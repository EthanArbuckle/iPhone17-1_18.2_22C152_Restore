@interface UIViewProgressAnimatableProperty
+ (id)progressAnimatablePropertyByPerforming:(id)a3;
- (void)__swift_configureWithAction:(id)a3;
@end

@implementation UIViewProgressAnimatableProperty

- (void)__swift_configureWithAction:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_185A75154((uint64_t)sub_18557A3E8, v5);

  swift_release();
}

+ (id)progressAnimatablePropertyByPerforming:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  objc_msgSend(v4, "__swift_configureWithAction:", v3);

  return v4;
}

@end