@interface NTKPhotoImageView
- (BOOL)isPhotoIris;
- (BOOL)isPlaying;
- (NSString)localIdentifier;
- (NSURL)irisURL;
- (NTKCachedPhoto)cachedPhoto;
- (NTKPhotoImageView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (NTKPhotoImageViewDelegate)delegate;
- (void)_loadMediaAssetView;
- (void)_unloadMediaAssetView;
- (void)interruptPlayback;
- (void)mediaAssetViewDidBeginPlaying:(id)a3;
- (void)mediaAssetViewDidEndPlaying:(id)a3;
- (void)pauseWithMode:(int64_t)a3;
- (void)playWithMode:(int64_t)a3;
- (void)prepareToPlayWithMode:(int64_t)a3;
- (void)reset;
- (void)resumeInterruptedPlayback;
- (void)setDelegate:(id)a3;
- (void)setPhoto:(id)a3 allowIris:(BOOL)a4;
@end

@implementation NTKPhotoImageView

- (NTKPhotoImageView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKPhotoImageView;
  v11 = -[NTKPhotoImageView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    [(NTKPhotoImageView *)v11 setClipsToBounds:1];
    objc_storeStrong((id *)&v12->_device, a4);
    [(NTKPhotoImageView *)v12 _loadMediaAssetView];
  }

  return v12;
}

- (void)_loadMediaAssetView
{
  id v3 = objc_alloc(MEMORY[0x1E4F19A78]);
  [(NTKPhotoImageView *)self bounds];
  v4 = (CLKMediaAssetView *)objc_msgSend(v3, "initWithFrame:forDevice:", self->_device);
  mediaAssetView = self->_mediaAssetView;
  self->_mediaAssetView = v4;

  [(CLKMediaAssetView *)self->_mediaAssetView setDelegate:self];
  v6 = self->_mediaAssetView;

  [(NTKPhotoImageView *)self addSubview:v6];
}

- (void)_unloadMediaAssetView
{
  [(CLKMediaAssetView *)self->_mediaAssetView setDelegate:0];
  [(CLKMediaAssetView *)self->_mediaAssetView removeFromSuperview];
  mediaAssetView = self->_mediaAssetView;
  self->_mediaAssetView = 0;
}

- (void)reset
{
  cachedPhoto = self->_cachedPhoto;
  self->_cachedPhoto = 0;

  photo = self->_photo;
  self->_photo = 0;

  [(NTKPhotoImageView *)self _unloadMediaAssetView];

  [(NTKPhotoImageView *)self _loadMediaAssetView];
}

- (void)setPhoto:(id)a3 allowIris:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v7)
  {
    id v63 = v7;
    v8 = [v7 photo];

    id v7 = v63;
    if (v8)
    {
      v9 = [v63 image];
      [v9 scale];
      double v11 = v10;
      [v9 size];
      if (!v9) {
        goto LABEL_26;
      }
      double v14 = v11 * v13;
      if (v11 * v12 < 1.0 || v14 < 1.0) {
        goto LABEL_26;
      }
      [(NTKPhotoImageView *)self bounds];
      if (v16 < 1.0) {
        goto LABEL_26;
      }
      double v18 = v17;
      if (v17 < 1.0) {
        goto LABEL_26;
      }
      double v19 = v16;
      v20 = [v63 photo];
      photo = self->_photo;
      self->_photo = v20;

      objc_storeStrong((id *)&self->_cachedPhoto, a3);
      v22 = 0;
      double v23 = 0.0;
      double v24 = 0.0;
      if ([(NTKPhoto *)self->_photo isIris] && v4)
      {
        v22 = [(NTKPhoto *)self->_photo irisVideoURL];
        [(NTKPhoto *)self->_photo irisDuration];
        double v24 = v25;
        [(NTKPhoto *)self->_photo irisStillDisplayTime];
        double v23 = v26;
      }
      v27 = [(CLKMediaAssetView *)self->_mediaAssetView mediaAsset];
      v28 = [v27 image];
      v29 = [v63 image];
      if (v28 == v29)
      {
        v30 = [(CLKMediaAssetView *)self->_mediaAssetView mediaAsset];
        v31 = [v30 video];
        [v31 url];
        v33 = v32 = v22;

        BOOL v34 = v33 == v32;
        v22 = v32;
        if (v34)
        {
LABEL_25:

LABEL_26:
          id v7 = v63;
          goto LABEL_27;
        }
      }
      else
      {
      }
      v35 = (void *)MEMORY[0x1E4F19A70];
      if (v22)
      {
        v36 = (void *)MEMORY[0x1E4F19AE8];
        v37 = [v63 photo];
        v62 = [v37 localIdentifier];
        v38 = [v36 videoWithName:v62 forDevice:self->_device url:v22];
        [v63 image];
        v40 = v39 = v22;
        v41 = [v35 mediaAssetWithVideo:v38 image:v40 videoDuration:self->_device stillDisplayTime:v24 forDevice:v23];

        v22 = v39;
      }
      else
      {
        v37 = [v63 image];
        v41 = [v35 mediaAssetWithImage:v37 forDevice:self->_device];
      }

      [(CLKMediaAssetView *)self->_mediaAssetView changeMediaAsset:v41];
      v42 = [(CLKMediaAssetView *)self->_mediaAssetView mediaAsset];
      v43 = [v42 image];
      [v43 scale];
      double v45 = v44;

      [(CLKDevice *)self->_device screenScale];
      if (v46 >= 1.0) {
        double v47 = v46;
      }
      else {
        double v47 = 1.0;
      }
      v48 = [(CLKMediaAssetView *)self->_mediaAssetView mediaAsset];
      v49 = [v48 image];
      [v49 size];
      double v51 = v50;
      double v53 = v52;

      double v54 = v45 * v51 / v47;
      double v55 = v45 * v53 / v47;
      [(NTKPhoto *)self->_photo crop];
      double v58 = v19 / (v57 / v47);
      if (v58 < v18 / (v56 / v47)) {
        double v58 = v18 / (v56 / v47);
      }
      -[CLKMediaAssetView setBounds:](self->_mediaAssetView, "setBounds:", 0.0, 0.0, v54 * v58, v55 * v58);
      [(NTKPhotoImageView *)self bounds];
      double v60 = v59 * 0.5;
      [(NTKPhotoImageView *)self bounds];
      -[CLKMediaAssetView setCenter:](self->_mediaAssetView, "setCenter:", v60, v61 * 0.5);
      [(NTKPhotoImageView *)self setNeedsLayout];

      goto LABEL_25;
    }
  }
LABEL_27:
}

- (void)prepareToPlayWithMode:(int64_t)a3
{
}

- (void)playWithMode:(int64_t)a3
{
}

- (void)pauseWithMode:(int64_t)a3
{
}

- (BOOL)isPlaying
{
  return [(CLKMediaAssetView *)self->_mediaAssetView isPlaying];
}

- (void)interruptPlayback
{
}

- (void)resumeInterruptedPlayback
{
}

- (BOOL)isPhotoIris
{
  return [(NTKPhoto *)self->_photo isIris];
}

- (NSURL)irisURL
{
  return [(NTKPhoto *)self->_photo irisVideoURL];
}

- (NSString)localIdentifier
{
  return [(NTKPhoto *)self->_photo localIdentifier];
}

- (void)mediaAssetViewDidBeginPlaying:(id)a3
{
  id v4 = [(NTKPhotoImageView *)self delegate];
  [v4 imageViewDidBeginPlaying:self];
}

- (void)mediaAssetViewDidEndPlaying:(id)a3
{
  id v4 = [(NTKPhotoImageView *)self delegate];
  [v4 imageViewDidEndPlaying:self];
}

- (NTKPhotoImageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKPhotoImageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NTKCachedPhoto)cachedPhoto
{
  return self->_cachedPhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPhoto, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_mediaAssetView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end