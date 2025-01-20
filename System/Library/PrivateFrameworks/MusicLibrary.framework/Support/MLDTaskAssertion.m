@interface MLDTaskAssertion
- (MLDTaskAssertion)initWithName:(id)a3 pid:(int)a4 bundleID:(id)a5;
@end

@implementation MLDTaskAssertion

- (MLDTaskAssertion)initWithName:(id)a3 pid:(int)a4 bundleID:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MLDTaskAssertion;
  return [(MLDTaskAssertion *)&v6 initWithName:a3 pid:*(void *)&a4 bundleID:a5 subsystem:@"com.apple.medialibraryd" reason:2 flags:3];
}

@end