@interface ICLocalFileWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)isDirectory;
- (BOOL)isSymbolicLink;
- (BOOL)matchesContentsOfURL:(id)a3;
- (BOOL)readFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 originalContentsURL:(id)a5 error:(id *)a6;
- (ICLocalFileWrapper)initWithCoder:(id)a3;
- (ICLocalFileWrapper)initWithLocalURL:(id)a3;
- (NSData)cachedData;
- (NSURL)localURL;
- (id)addFileWrapper:(id)a3;
- (id)addRegularFileWithContents:(id)a3 preferredFilename:(id)a4;
- (id)dataWithError:(id *)a3;
- (id)fileAttributes;
- (id)fileWrappers;
- (id)filename;
- (id)keyForFileWrapper:(id)a3;
- (id)regularFileContents;
- (id)serializedRepresentation;
- (id)symbolicLinkDestinationURL;
- (void)encodeWithCoder:(id)a3;
- (void)removeFileWrapper:(id)a3;
- (void)setCachedData:(id)a3;
- (void)setLocalURL:(id)a3;
@end

@implementation ICLocalFileWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLocalFileWrapper)initWithLocalURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICLocalFileWrapper;
  v5 = [(ICLocalFileWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICLocalFileWrapper *)v5 setLocalURL:v4];
  }

  return v6;
}

- (ICLocalFileWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localURL"];
  }
  else
  {
    v5 = 0;
  }
  v6 = [(ICLocalFileWrapper *)self initWithLocalURL:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    id v4 = [(ICLocalFileWrapper *)self localURL];
    [v5 encodeObject:v4 forKey:@"localURL"];
  }
}

- (BOOL)isSymbolicLink
{
  return 0;
}

- (BOOL)isDirectory
{
  return 0;
}

- (id)filename
{
  v2 = [(ICLocalFileWrapper *)self localURL];
  v3 = [v2 lastPathComponent];

  return v3;
}

- (id)fileAttributes
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)fileWrappers
{
  return 0;
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 originalContentsURL:(id)a5 error:(id *)a6
{
  id v8 = a3;
  v9 = [(ICLocalFileWrapper *)self dataWithError:a6];
  v10 = v9;
  if (v9) {
    char v11 = [v9 writeToURL:v8 options:0 error:a6];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (id)regularFileContents
{
  id v6 = 0;
  v2 = [(ICLocalFileWrapper *)self dataWithError:&v6];
  id v3 = v6;
  id v4 = v3;
  if (v3) {
    NSLog(&cfstr_ErrorLoadingDa.isa, v3);
  }

  return v2;
}

- (id)dataWithError:(id *)a3
{
  id v5 = [(ICLocalFileWrapper *)self cachedData];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1C9B8];
    v7 = [(ICLocalFileWrapper *)self localURL];
    id v8 = [v6 dataWithContentsOfURL:v7 options:0 error:a3];
    [(ICLocalFileWrapper *)self setCachedData:v8];
  }
  return [(ICLocalFileWrapper *)self cachedData];
}

- (id)serializedRepresentation
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v2 raise:v3, @"Cannot call %s on %@", "-[ICLocalFileWrapper serializedRepresentation]", v5 format];

  return 0;
}

- (BOOL)matchesContentsOfURL:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"Cannot call %s on %@", "-[ICLocalFileWrapper matchesContentsOfURL:]", v6 format];

  return 0;
}

- (BOOL)readFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v5 raise:v6, @"Cannot call %s on %@", "-[ICLocalFileWrapper readFromURL:options:error:]", v8 format];

  return 0;
}

- (id)addFileWrapper:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"Cannot call %s on %@", "-[ICLocalFileWrapper addFileWrapper:]", v6 format];

  return 0;
}

- (void)removeFileWrapper:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Cannot call %s on %@", "-[ICLocalFileWrapper removeFileWrapper:]", v6 format];
}

- (id)addRegularFileWithContents:(id)a3 preferredFilename:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"Cannot call %s on %@", "-[ICLocalFileWrapper addRegularFileWithContents:preferredFilename:]", v7 format];

  return 0;
}

- (id)keyForFileWrapper:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"Cannot call %s on %@", "-[ICLocalFileWrapper keyForFileWrapper:]", v6 format];

  return 0;
}

- (id)symbolicLinkDestinationURL
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v2 raise:v3, @"Cannot call %s on %@", "-[ICLocalFileWrapper symbolicLinkDestinationURL]", v5 format];

  return 0;
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (void)setLocalURL:(id)a3
{
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
}

@end