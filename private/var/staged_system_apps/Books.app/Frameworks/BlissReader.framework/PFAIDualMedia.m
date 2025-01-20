@interface PFAIDualMedia
+ (Class)subreaderClass;
@end

@implementation PFAIDualMedia

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end