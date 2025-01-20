@interface MRAssetPlayer
- (BOOL)generatesMipmap;
- (BOOL)isMonochromatic;
- (BOOL)newImageIsAvailable;
- (BOOL)thumbnailIsOK;
- (BOOL)usesPowerOfTwo;
- (MRAssetPlayer)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6;
- (MRAssetPlayerDelegate)delegate;
- (id)retainByUser;
- (id)retainedByUserCurrentImage;
- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4;
- (void)dealloc;
- (void)releaseByUser;
- (void)setDelegate:(id)a3;
- (void)setThumbnailIsOK:(BOOL)a3;
@end

@implementation MRAssetPlayer

- (MRAssetPlayer)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v15.receiver = self;
  v15.super_class = (Class)MRAssetPlayer;
  v10 = [(MRAssetPlayer *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
    v10->_master = (MRAssetMaster *)a5;
    v11->_isMonochromatic = [a6 wantsMonochromatic];
    v11->_generatesMipmap = [a6 wantsMipmap];
    v11->_usesPowerOfTwo = [a6 wantsPowerOfTwo];
    v11->_thumbnailIsOK = [a6 thumbnailIsOK];
    unsigned int v12 = [a6 isStill];
    v11->_isStill = v12;
    double v13 = -1.0;
    if (v12) {
      objc_msgSend(a6, "stillTime", -1.0);
    }
    v11->_time = v13;
    v11->_image = (MRImage *)objc_msgSend(objc_msgSend(a6, "initialImage"), "retainByUser");
  }
  return v11;
}

- (void)dealloc
{
  self->_master = 0;
  self->_delegate = 0;
  self->_size = CGSizeZero;
  v3.receiver = self;
  v3.super_class = (Class)MRAssetPlayer;
  [(MRAssetPlayer *)&v3 dealloc];
}

- (id)retainByUser
{
  return self;
}

- (void)releaseByUser
{
  v2 = self;
  if (atomic_fetch_add(&self->_retainByUserCount, 0xFFFFFFFF) == 1)
  {
    objc_super v3 = self;
    self = (MRAssetPlayer *)[(MRAssetMaster *)self->_master relinquishPlayer:self];
    v2 = v3;
  }
  _objc_release_x1(self, v2);
}

- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4
{
  return 0;
}

- (BOOL)newImageIsAvailable
{
  return 0;
}

- (id)retainedByUserCurrentImage
{
  objc_sync_enter(self);
  id v3 = [(MRImage *)self->_image retainByUser];
  objc_sync_exit(self);
  return v3;
}

- (MRAssetPlayerDelegate)delegate
{
  return (MRAssetPlayerDelegate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)thumbnailIsOK
{
  return self->_thumbnailIsOK;
}

- (void)setThumbnailIsOK:(BOOL)a3
{
  self->_thumbnailIsOK = a3;
}

- (BOOL)isMonochromatic
{
  return self->_isMonochromatic;
}

- (BOOL)generatesMipmap
{
  return self->_generatesMipmap;
}

- (BOOL)usesPowerOfTwo
{
  return self->_usesPowerOfTwo;
}

@end