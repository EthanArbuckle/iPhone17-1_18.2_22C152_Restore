@interface SXLayoutContextFactory
- (id)createLayoutContextForColumnLayout:(id)a3 unitConverter:(id)a4;
@end

@implementation SXLayoutContextFactory

- (id)createLayoutContextForColumnLayout:(id)a3 unitConverter:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SXLayoutContext alloc] initWithColumnLayout:v6 unitConverter:v5];

  return v7;
}

@end