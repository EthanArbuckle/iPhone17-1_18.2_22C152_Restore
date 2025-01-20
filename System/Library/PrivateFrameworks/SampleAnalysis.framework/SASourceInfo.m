@interface SASourceInfo
+ (void)sourceInfoWithOffsetIntoSegment:(uint64_t)a3 length:(int)a4 lineNum:(int)a5 columnNum:(void *)a6 filePath:;
- (NSString)fileName;
- (NSString)filePath;
- (id)debugDescription;
- (unint64_t)length;
- (unint64_t)offsetIntoSegment;
- (unint64_t)offsetIntoTextSegment;
- (unsigned)columnNum;
- (unsigned)lineNum;
@end

@implementation SASourceInfo

+ (void)sourceInfoWithOffsetIntoSegment:(uint64_t)a3 length:(int)a4 lineNum:(int)a5 columnNum:(void *)a6 filePath:
{
  id v10 = a6;
  v11 = objc_alloc_init((Class)self);
  v11[2] = a2;
  v11[3] = a3;
  *((_DWORD *)v11 + 2) = a4;
  *((_DWORD *)v11 + 3) = a5;
  v12 = (void *)v11[4];
  v11[4] = v10;

  return v11;
}

- (NSString)fileName
{
  Path = -[NSString copyLastPathComponent](self->_filePath);
  return (NSString *)Path;
}

- (id)debugDescription
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@:%d,%d (0x%llx-0x%llx)", self->_filePath, self->_lineNum, self->_columnNum, self->_offsetIntoSegment, self->_length + self->_offsetIntoSegment];
  return v2;
}

- (unint64_t)offsetIntoTextSegment
{
  return self->_offsetIntoSegment;
}

- (unint64_t)offsetIntoSegment
{
  return self->_offsetIntoSegment;
}

- (unint64_t)length
{
  return self->_length;
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)lineNum
{
  return self->_lineNum;
}

- (unsigned)columnNum
{
  return self->_columnNum;
}

- (void).cxx_destruct
{
}

@end