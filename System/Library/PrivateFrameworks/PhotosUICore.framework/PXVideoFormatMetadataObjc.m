@interface PXVideoFormatMetadataObjc
- (BOOL)isProResLog;
- (PXVideoFormatMetadataObjc)initWithMetadata:(id)a3;
@end

@implementation PXVideoFormatMetadataObjc

- (BOOL)isProResLog
{
  return self->_isProResLog;
}

- (PXVideoFormatMetadataObjc)initWithMetadata:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXVideoFormatMetadataObjc;
  v5 = [(PXVideoFormatMetadataObjc *)&v7 init];
  if (v5) {
    v5->_isProResLog = [v4 isProResLog];
  }

  return v5;
}

@end