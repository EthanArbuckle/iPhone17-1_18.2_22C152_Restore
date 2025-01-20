@interface _UIDragAndDropPlatformMetrics
- (CGSize)previewMinimumSize;
- (_UIDragAndDropPlatformMetrics)init;
- (id)defaultPreviewOutlineProvider;
- (id)playDropFeedback;
- (void)setDefaultPreviewOutlineProvider:(id)a3;
- (void)setPlayDropFeedback:(id)a3;
- (void)setPreviewMinimumSize:(CGSize)a3;
@end

@implementation _UIDragAndDropPlatformMetrics

- (_UIDragAndDropPlatformMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDragAndDropPlatformMetrics;
  v2 = [(_UIDragAndDropPlatformMetrics *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(_UIDragAndDropPlatformMetrics *)v2 setDefaultPreviewOutlineProvider:&__block_literal_global_260];
    -[_UIDragAndDropPlatformMetrics setPreviewMinimumSize:](v3, "setPreviewMinimumSize:", 16.0, 16.0);
  }
  return v3;
}

- (id)defaultPreviewOutlineProvider
{
  return self->_defaultPreviewOutlineProvider;
}

- (void)setDefaultPreviewOutlineProvider:(id)a3
{
}

- (id)playDropFeedback
{
  return self->_playDropFeedback;
}

- (void)setPlayDropFeedback:(id)a3
{
}

- (CGSize)previewMinimumSize
{
  double width = self->_previewMinimumSize.width;
  double height = self->_previewMinimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviewMinimumSize:(CGSize)a3
{
  self->_previewMinimumSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playDropFeedback, 0);
  objc_storeStrong(&self->_defaultPreviewOutlineProvider, 0);
}

@end