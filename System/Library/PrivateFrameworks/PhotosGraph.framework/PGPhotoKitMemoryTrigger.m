@interface PGPhotoKitMemoryTrigger
- (PGPhotoKitMemoryTrigger)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4;
- (PHPhotoLibrary)photoLibrary;
@end

@implementation PGPhotoKitMemoryTrigger

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PGPhotoKitMemoryTrigger)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGPhotoKitMemoryTrigger;
  v8 = [(PGMemoryTrigger *)&v11 initWithLoggingConnection:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_photoLibrary, a4);
  }

  return v9;
}

@end