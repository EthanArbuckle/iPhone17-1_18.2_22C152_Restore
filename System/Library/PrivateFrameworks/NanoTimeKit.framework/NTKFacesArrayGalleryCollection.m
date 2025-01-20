@interface NTKFacesArrayGalleryCollection
- (id)faceAtIndex:(unint64_t)a3;
- (unint64_t)indexOfFace:(id)a3;
- (unint64_t)numberOfFaces;
- (void)setFaces:(id)a3;
@end

@implementation NTKFacesArrayGalleryCollection

- (unint64_t)numberOfFaces
{
  return [(NSArray *)self->_faces count];
}

- (id)faceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_faces objectAtIndexedSubscript:a3];
}

- (unint64_t)indexOfFace:(id)a3
{
  return [(NSArray *)self->_faces indexOfObject:a3];
}

- (void)setFaces:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_faces != a3)
  {
    v4 = (NSArray *)[a3 copy];
    faces = self->_faces;
    self->_faces = v4;

    v6 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(NTKGalleryCollection *)self delegate];
      int v9 = 138412802;
      v10 = self;
      __int16 v11 = 2048;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Faces updated for %@ (%p). Notifying delegate %@", (uint8_t *)&v9, 0x20u);
    }
    v8 = [(NTKGalleryCollection *)self delegate];
    [v8 galleryCollectionDidChange:self shouldUpdateSnaphots:1];
  }
}

- (void).cxx_destruct
{
}

@end