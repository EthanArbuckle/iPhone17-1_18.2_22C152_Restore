@interface PRPosterEnvironmentContext
+ (id)environmentContextForSettings:(id)a3;
+ (id)environmentContextWithMode:(int64_t)a3 isPreview:(BOOL)a4 previewContent:(unint64_t)a5 isSnapshot:(BOOL)a6;
- (BOOL)isPreview;
- (BOOL)isSnapshot;
- (PRPosterEnvironmentContext)initWithMode:(int64_t)a3 isPreview:(BOOL)a4 previewContent:(unint64_t)a5 isSnapshot:(BOOL)a6;
- (int64_t)mode;
- (unint64_t)previewContent;
@end

@implementation PRPosterEnvironmentContext

+ (id)environmentContextWithMode:(int64_t)a3 isPreview:(BOOL)a4 previewContent:(unint64_t)a5 isSnapshot:(BOOL)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithMode:a3 isPreview:a4 previewContent:a5 isSnapshot:a6];
  return v6;
}

+ (id)environmentContextForSettings:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "pui_content");
  uint64_t IsPreview = PUIRenderingContentIsPreview();
  uint64_t v6 = objc_msgSend(v4, "pui_isSnapshot");
  uint64_t v7 = objc_msgSend(v4, "pui_mode");
  uint64_t v8 = objc_msgSend(v4, "pui_previewContent");

  v9 = (void *)[objc_alloc((Class)a1) initWithMode:v7 isPreview:IsPreview previewContent:v8 isSnapshot:v6];
  return v9;
}

- (PRPosterEnvironmentContext)initWithMode:(int64_t)a3 isPreview:(BOOL)a4 previewContent:(unint64_t)a5 isSnapshot:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PRPosterEnvironmentContext;
  result = [(PRPosterEnvironmentContext *)&v11 init];
  if (result)
  {
    result->_preview = a4;
    result->_snapshot = a6;
    result->_mode = a3;
    result->_previewContent = a5;
  }
  return result;
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)isPreview
{
  return self->_preview;
}

- (unint64_t)previewContent
{
  return self->_previewContent;
}

- (BOOL)isSnapshot
{
  return self->_snapshot;
}

@end