@interface _UIDragMonitorSessionPreviewUpdate
- (BOOL)isFromCurrentSession;
- (_UIDragMonitorSessionPreview)preview;
- (_UIDragMonitorSessionPreviewUpdate)initWithPreviewAndImageComponentUpdate:(id)a3;
- (unint64_t)index;
@end

@implementation _UIDragMonitorSessionPreviewUpdate

- (_UIDragMonitorSessionPreviewUpdate)initWithPreviewAndImageComponentUpdate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDragMonitorSessionPreviewUpdate;
  v5 = [(_UIDragMonitorSessionPreviewUpdate *)&v12 init];
  if (v5)
  {
    v5->_index = [v4 index];
    v6 = [_UIDragMonitorSessionPreview alloc];
    v7 = [v4 imageComponent];
    v8 = [v4 preview];
    uint64_t v9 = [(_UIDragMonitorSessionPreview *)v6 initWithImageComponent:v7 preview:v8];
    preview = v5->_preview;
    v5->_preview = (_UIDragMonitorSessionPreview *)v9;

    v5->_isFromCurrentSession = [v4 isFromSource];
  }

  return v5;
}

- (unint64_t)index
{
  return self->_index;
}

- (_UIDragMonitorSessionPreview)preview
{
  return self->_preview;
}

- (BOOL)isFromCurrentSession
{
  return self->_isFromCurrentSession;
}

- (void).cxx_destruct
{
}

@end