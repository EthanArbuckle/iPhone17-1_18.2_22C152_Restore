@interface VUIPlistMediaLibraryIdentifier
- (NSURL)libraryFileURL;
- (VUIPlistMediaLibraryIdentifier)init;
- (VUIPlistMediaLibraryIdentifier)initWithURL:(id)a3;
- (void)setLibraryFileURL:(id)a3;
@end

@implementation VUIPlistMediaLibraryIdentifier

- (VUIPlistMediaLibraryIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIPlistMediaLibraryIdentifier)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIPlistMediaLibraryIdentifier;
  v5 = [(VUIPlistMediaLibraryIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    libraryFileURL = v5->_libraryFileURL;
    v5->_libraryFileURL = (NSURL *)v6;
  }
  return v5;
}

- (NSURL)libraryFileURL
{
  return self->_libraryFileURL;
}

- (void)setLibraryFileURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end