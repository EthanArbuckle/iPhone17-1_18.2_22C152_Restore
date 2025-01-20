@interface NTPBSectionDisplayDescriptor(NTAdditions)
- (id)actionURL;
- (id)nameActionURL;
- (void)setActionURL:()NTAdditions;
- (void)setNameActionURL:()NTAdditions;
@end

@implementation NTPBSectionDisplayDescriptor(NTAdditions)

- (void)setActionURL:()NTAdditions
{
  id v4 = [a3 absoluteString];
  [a1 setActionURLString:v4];
}

- (id)nameActionURL
{
  v1 = [a1 nameActionURLString];
  if (v1)
  {
    v2 = [NSURL URLWithString:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)actionURL
{
  v1 = [a1 actionURLString];
  if (v1)
  {
    v2 = [NSURL URLWithString:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)setNameActionURL:()NTAdditions
{
  id v4 = [a3 absoluteString];
  [a1 setNameActionURLString:v4];
}

@end