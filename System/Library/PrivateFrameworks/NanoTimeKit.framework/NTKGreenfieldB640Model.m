@interface NTKGreenfieldB640Model
- (NSArray)watchFaceModels;
- (NSBundle)bandImageBundle;
- (NSError)error;
- (NSString)bandImagePath;
- (NTKGreenfieldB640Model)initWithWatchFaceModels:(id)a3 error:(id)a4 bandImagePath:(id)a5 bandImageBundle:(id)a6;
- (void)setBandImageBundle:(id)a3;
- (void)setBandImagePath:(id)a3;
- (void)setError:(id)a3;
- (void)setWatchFaceModels:(id)a3;
@end

@implementation NTKGreenfieldB640Model

- (NTKGreenfieldB640Model)initWithWatchFaceModels:(id)a3 error:(id)a4 bandImagePath:(id)a5 bandImageBundle:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NTKGreenfieldB640Model;
  v15 = [(NTKGreenfieldB640Model *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_watchFaceModels, a3);
    objc_storeStrong((id *)&v16->_bandImagePath, a5);
    objc_storeStrong((id *)&v16->_bandImageBundle, a6);
    objc_storeStrong((id *)&v16->_error, a4);
  }

  return v16;
}

- (NSArray)watchFaceModels
{
  return self->_watchFaceModels;
}

- (void)setWatchFaceModels:(id)a3
{
}

- (NSBundle)bandImageBundle
{
  return self->_bandImageBundle;
}

- (void)setBandImageBundle:(id)a3
{
}

- (NSString)bandImagePath
{
  return self->_bandImagePath;
}

- (void)setBandImagePath:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bandImagePath, 0);
  objc_storeStrong((id *)&self->_bandImageBundle, 0);
  objc_storeStrong((id *)&self->_watchFaceModels, 0);
}

@end