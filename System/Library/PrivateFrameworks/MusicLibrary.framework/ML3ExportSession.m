@interface ML3ExportSession
- (ML3ExportSession)initWithLibrary:(id)a3 outputStream:(id)a4;
- (ML3MusicLibrary)library;
- (NSOutputStream)outputStream;
- (id)begin:(unsigned int)a3;
- (id)end;
- (id)exportAlbumArtistAdded:(unint64_t)a3;
- (id)exportAlbumArtistDeleted:(unint64_t)a3;
- (id)exportAlbumArtistUpdated:(unint64_t)a3;
- (id)exportAlbumUpdated:(unint64_t)a3;
- (id)exportPlaylistAdded:(unint64_t)a3;
- (id)exportPlaylistDeleted:(unint64_t)a3;
- (id)exportPlaylistUpdated:(unint64_t)a3;
- (id)exportTrackAdded:(unint64_t)a3;
- (id)exportTrackDeleted:(unint64_t)a3;
- (id)exportTrackUpdated:(unint64_t)a3;
@end

@implementation ML3ExportSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (id)exportAlbumUpdated:(unint64_t)a3
{
  return 0;
}

- (id)exportAlbumArtistUpdated:(unint64_t)a3
{
  return 0;
}

- (id)exportAlbumArtistDeleted:(unint64_t)a3
{
  return 0;
}

- (id)exportAlbumArtistAdded:(unint64_t)a3
{
  return 0;
}

- (id)exportPlaylistUpdated:(unint64_t)a3
{
  return 0;
}

- (id)exportPlaylistDeleted:(unint64_t)a3
{
  return 0;
}

- (id)exportPlaylistAdded:(unint64_t)a3
{
  return 0;
}

- (id)exportTrackDeleted:(unint64_t)a3
{
  return 0;
}

- (id)exportTrackUpdated:(unint64_t)a3
{
  return 0;
}

- (id)exportTrackAdded:(unint64_t)a3
{
  return 0;
}

- (id)end
{
  return 0;
}

- (id)begin:(unsigned int)a3
{
  return 0;
}

- (ML3ExportSession)initWithLibrary:(id)a3 outputStream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3ExportSession;
  v9 = [(ML3ExportSession *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputStream, a4);
    objc_storeStrong((id *)&v10->_library, a3);
  }

  return v10;
}

@end