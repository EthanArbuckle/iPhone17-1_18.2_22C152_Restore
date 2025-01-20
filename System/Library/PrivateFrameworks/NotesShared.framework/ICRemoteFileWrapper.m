@interface ICRemoteFileWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)isDirectory;
- (BOOL)isSymbolicLink;
- (BOOL)matchesContentsOfURL:(id)a3;
- (BOOL)readFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 originalContentsURL:(id)a5 error:(id *)a6;
- (ICRemoteFileWrapper)initWithCoder:(id)a3;
- (ICRemoteFileWrapper)initWithRemoteURL:(id)a3;
- (NSData)cachedData;
- (NSURL)remoteURL;
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
- (void)setRemoteURL:(id)a3;
@end

@implementation ICRemoteFileWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICRemoteFileWrapper)initWithRemoteURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICRemoteFileWrapper;
  v5 = [(ICRemoteFileWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICRemoteFileWrapper *)v5 setRemoteURL:v4];
  }

  return v6;
}

- (ICRemoteFileWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteURL"];
  }
  else
  {
    v5 = 0;
  }
  v6 = [(ICRemoteFileWrapper *)self initWithRemoteURL:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    id v4 = [(ICRemoteFileWrapper *)self remoteURL];
    [v5 encodeObject:v4 forKey:@"remoteURL"];
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
  v2 = [(ICRemoteFileWrapper *)self remoteURL];
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
  v9 = [(ICRemoteFileWrapper *)self dataWithError:a6];
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
  v2 = [(ICRemoteFileWrapper *)self dataWithError:&v6];
  id v3 = v6;
  id v4 = v3;
  if (v3) {
    NSLog(&cfstr_ErrorLoadingDa.isa, v3);
  }

  return v2;
}

- (id)dataWithError:(id *)a3
{
  id v5 = [(ICRemoteFileWrapper *)self cachedData];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1C9B8];
    v7 = [(ICRemoteFileWrapper *)self remoteURL];
    id v8 = [v6 dataWithContentsOfURL:v7 options:0 error:a3];
    [(ICRemoteFileWrapper *)self setCachedData:v8];
  }
  return [(ICRemoteFileWrapper *)self cachedData];
}

- (id)serializedRepresentation
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v2 raise:v3, @"Cannot call %s on %@", "-[ICRemoteFileWrapper serializedRepresentation]", v5 format];

  return 0;
}

- (BOOL)matchesContentsOfURL:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"Cannot call %s on %@", "-[ICRemoteFileWrapper matchesContentsOfURL:]", v6 format];

  return 0;
}

- (BOOL)readFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v5 raise:v6, @"Cannot call %s on %@", "-[ICRemoteFileWrapper readFromURL:options:error:]", v8 format];

  return 0;
}

- (id)addFileWrapper:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"Cannot call %s on %@", "-[ICRemoteFileWrapper addFileWrapper:]", v6 format];

  return 0;
}

- (void)removeFileWrapper:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Cannot call %s on %@", "-[ICRemoteFileWrapper removeFileWrapper:]", v6 format];
}

- (id)addRegularFileWithContents:(id)a3 preferredFilename:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"Cannot call %s on %@", "-[ICRemoteFileWrapper addRegularFileWithContents:preferredFilename:]", v7 format];

  return 0;
}

- (id)keyForFileWrapper:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"Cannot call %s on %@", "-[ICRemoteFileWrapper keyForFileWrapper:]", v6 format];

  return 0;
}

- (id)symbolicLinkDestinationURL
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v2 raise:v3, @"Cannot call %s on %@", "-[ICRemoteFileWrapper symbolicLinkDestinationURL]", v5 format];

  return 0;
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
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
  objc_storeStrong((id *)&self->_remoteURL, 0);
}

@end