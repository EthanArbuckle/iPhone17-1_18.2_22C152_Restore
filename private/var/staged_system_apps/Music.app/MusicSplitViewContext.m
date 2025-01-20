@interface MusicSplitViewContext
+ (BOOL)supportsSecureCoding;
- (MusicSplitViewContext)init;
- (MusicSplitViewContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MusicSplitViewContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100345568(v4);
}

- (MusicSplitViewContext)initWithCoder:(id)a3
{
  return (MusicSplitViewContext *)sub_1003456E0(a3);
}

- (MusicSplitViewContext)init
{
  result = (MusicSplitViewContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end