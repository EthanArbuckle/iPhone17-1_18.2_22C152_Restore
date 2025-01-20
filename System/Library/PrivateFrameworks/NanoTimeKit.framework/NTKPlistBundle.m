@interface NTKPlistBundle
- (NSBundle)bundle;
- (NSString)plistFileName;
- (NTKPlistBundle)initWithPlist:(id)a3 bundle:(id)a4;
- (id)description;
- (void)setBundle:(id)a3;
- (void)setPlistFileName:(id)a3;
@end

@implementation NTKPlistBundle

- (NTKPlistBundle)initWithPlist:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKPlistBundle;
  v9 = [(NTKPlistBundle *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_plistFileName, a3);
    objc_storeStrong((id *)&v10->_bundle, a4);
  }

  return v10;
}

- (id)description
{
  return self->_plistFileName;
}

- (NSString)plistFileName
{
  return self->_plistFileName;
}

- (void)setPlistFileName:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_plistFileName, 0);
}

@end