@interface _PXTrackedMediaRecord
- (_PXTrackedMediaRecord)init;
- (_PXTrackedMediaRecord)initWithMedia:(id)a3 mediaKind:(int64_t)a4 timestamp:(double)a5;
- (double)timestamp;
- (id)media;
- (int64_t)mediaKind;
@end

@implementation _PXTrackedMediaRecord

- (_PXTrackedMediaRecord)initWithMedia:(id)a3 mediaKind:(int64_t)a4 timestamp:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PXTrackedMediaRecord;
  v10 = [(_PXTrackedMediaRecord *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_media, a3);
    v11->_mediaKind = a4;
    v11->_timestamp = a5;
  }

  return v11;
}

- (id)media
{
  return self->_media;
}

- (int64_t)mediaKind
{
  return self->_mediaKind;
}

- (void).cxx_destruct
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (_PXTrackedMediaRecord)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMediaViewControllerEventTracker.m", 210, @"%s is not available as initializer", "-[_PXTrackedMediaRecord init]");

  abort();
}

@end