@interface UIImage(UserSafety)
+ (id)usImageNamed:()UserSafety;
@end

@implementation UIImage(UserSafety)

+ (id)usImageNamed:()UserSafety
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x263F67DD8] mainBundle];
  v6 = [v4 imageNamed:v3 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

@end