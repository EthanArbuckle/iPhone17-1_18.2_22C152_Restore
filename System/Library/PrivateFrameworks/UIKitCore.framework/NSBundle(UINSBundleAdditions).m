@interface NSBundle(UINSBundleAdditions)
- (id)loadNibNamed:()UINSBundleAdditions owner:options:;
@end

@implementation NSBundle(UINSBundleAdditions)

- (id)loadNibNamed:()UINSBundleAdditions owner:options:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[UINib alloc] initWithNibName:v10 directory:0 bundle:a1];

  v12 = [(UINib *)v11 instantiateWithOwner:v9 options:v8];

  return v12;
}

@end