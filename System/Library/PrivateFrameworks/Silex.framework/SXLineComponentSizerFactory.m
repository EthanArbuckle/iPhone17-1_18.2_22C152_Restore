@interface SXLineComponentSizerFactory
- (NSString)type;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (int)role;
@end

@implementation SXLineComponentSizerFactory

- (NSString)type
{
  return (NSString *)@"line";
}

- (int)role
{
  return 0;
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 componentStyleForComponent:v12];
  v14 = [(SXComponentSizer *)[SXLineComponentSizer alloc] initWithComponent:v12 componentLayout:v11 componentStyle:v13 DOMObjectProvider:v9 layoutOptions:v10];

  return v14;
}

@end