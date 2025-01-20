@interface SUSUIFakeSUScanResults
- (SUSUIFakeSUScanResults)init;
- (id)fakeAlternateDescriptor;
- (id)fakePreferredDescriptor;
@end

@implementation SUSUIFakeSUScanResults

- (SUSUIFakeSUScanResults)init
{
  v9 = self;
  SEL v8 = a2;
  id v5 = [(SUSUIFakeSUScanResults *)self fakePreferredDescriptor];
  id v4 = [(SUSUIFakeSUScanResults *)v9 fakeAlternateDescriptor];
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSUIFakeSUScanResults;
  v9 = -[SUScanResults initWithPreferredDescriptor:alternateDescriptor:](&v7, sel_initWithPreferredDescriptor_alternateDescriptor_, v5);
  objc_storeStrong((id *)&v9, v9);

  v6 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

- (id)fakePreferredDescriptor
{
  v2 = objc_alloc_init(SUSUIFakeSUDescriptor);

  return v2;
}

- (id)fakeAlternateDescriptor
{
  v2 = objc_alloc_init(SUSUIFakeSUDescriptor);

  return v2;
}

@end