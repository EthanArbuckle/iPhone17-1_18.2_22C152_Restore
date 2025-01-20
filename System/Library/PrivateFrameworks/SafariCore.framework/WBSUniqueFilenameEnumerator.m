@interface WBSUniqueFilenameEnumerator
- (NSString)filename;
- (WBSUniqueFilenameEnumerator)init;
- (WBSUniqueFilenameEnumerator)initWithFilename:(id)a3;
- (id)nextObject;
- (unint64_t)fileNumber;
@end

@implementation WBSUniqueFilenameEnumerator

- (WBSUniqueFilenameEnumerator)init
{
  return [(WBSUniqueFilenameEnumerator *)self initWithFilename:&stru_1F105D3F0];
}

- (WBSUniqueFilenameEnumerator)initWithFilename:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSUniqueFilenameEnumerator;
  v5 = [(WBSUniqueFilenameEnumerator *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    filename = v5->_filename;
    v5->_filename = (NSString *)v6;

    uint64_t v8 = [(NSString *)v5->_filename stringByDeletingPathExtension];
    filenameWithoutExtension = v5->_filenameWithoutExtension;
    v5->_filenameWithoutExtension = (NSString *)v8;

    uint64_t v10 = [(NSString *)v5->_filename substringFromIndex:[(NSString *)v5->_filenameWithoutExtension length]];
    pathExtension = v5->_pathExtension;
    v5->_pathExtension = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (id)nextObject
{
  unint64_t iteration = self->_iteration;
  if (iteration <= 0x7FFFFFFE)
  {
    if (iteration)
    {
      unint64_t v4 = iteration + 1;
      self->_unint64_t iteration = v4;
      filenameWithoutExtension = self->_filenameWithoutExtension;
      uint64_t v6 = [NSString stringWithFormat:@"-%zu%@", v4, self->_pathExtension];
      v3 = [(NSString *)filenameWithoutExtension safari_stringByTruncatingToMaximumFilenameLengthPreservingExtensionAndAppendingString:v6];
    }
    else
    {
      self->_unint64_t iteration = 1;
      v3 = [(NSString *)self->_filenameWithoutExtension safari_stringByTruncatingToMaximumFilenameLengthPreservingExtensionAndAppendingString:self->_pathExtension];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)fileNumber
{
  if (self->_iteration >= 2) {
    return self->_iteration;
  }
  else {
    return 0;
  }
}

- (NSString)filename
{
  return self->_filename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_pathExtension, 0);
  objc_storeStrong((id *)&self->_filenameWithoutExtension, 0);
}

@end