@interface PhotosGraphTestPHFace
- (PhotosGraphTestPHFace)init;
- (unsigned)sexType;
- (void)setSexType:(unsigned __int16)a3;
@end

@implementation PhotosGraphTestPHFace

- (void)setSexType:(unsigned __int16)a3
{
  self->_sexType = a3;
}

- (unsigned)sexType
{
  return self->_sexType;
}

- (PhotosGraphTestPHFace)init
{
  v3.receiver = self;
  v3.super_class = (Class)PhotosGraphTestPHFace;
  result = [(PhotosGraphTestPHFace *)&v3 init];
  if (result) {
    result->_sexType = 0;
  }
  return result;
}

@end