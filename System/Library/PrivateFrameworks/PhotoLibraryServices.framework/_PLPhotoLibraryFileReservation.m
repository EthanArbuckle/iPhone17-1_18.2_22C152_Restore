@interface _PLPhotoLibraryFileReservation
- (_PLPhotoLibraryFileReservation)initWithFileDescriptor:(int)a3;
- (int)fileDescriptor;
- (void)dealloc;
- (void)setFileDescriptor:(int)a3;
@end

@implementation _PLPhotoLibraryFileReservation

- (void)setFileDescriptor:(int)a3
{
  self->_fileDescriptor = a3;
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)dealloc
{
  int v3 = [(_PLPhotoLibraryFileReservation *)self fileDescriptor];
  if ((v3 & 0x80000000) == 0)
  {
    int v4 = v3;
    flock(v3, 8);
    close(v4);
    [(_PLPhotoLibraryFileReservation *)self setFileDescriptor:0xFFFFFFFFLL];
  }
  v5.receiver = self;
  v5.super_class = (Class)_PLPhotoLibraryFileReservation;
  [(_PLPhotoLibraryFileReservation *)&v5 dealloc];
}

- (_PLPhotoLibraryFileReservation)initWithFileDescriptor:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)_PLPhotoLibraryFileReservation;
  int v4 = [(_PLPhotoLibraryFileReservation *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(_PLPhotoLibraryFileReservation *)v4 setFileDescriptor:v3];
  }
  return v5;
}

@end